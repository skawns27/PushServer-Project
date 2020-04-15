package bakjun;


import java.util.*;

public class dfs_bfs2 {
	
	
	public static void main(String[] args) {
		 	int num;
		 	int v_num=0;//������
			int line;
			Queue<Integer> q = new LinkedList<Integer>();
			Scanner sc=new Scanner(System.in);
			num=sc.nextInt();
			line=sc.nextInt();//���� ��
			
			boolean[] visited=new boolean[num];
			clearList(visited);//�湮 �ʱ�ȭ
			
			LinkedList[] arr=new LinkedList[100];
			
			for(int i=0;i<num;i++) {
				arr[i]=new LinkedList<Integer>();
			}
			
			for(int i=0;i<line;i++) {
				int con1=sc.nextInt();
				int con2=sc.nextInt();
				
				arr[con1-1].add(con2-1);
				arr[con2-1].add(con1-1);
			}
			q.add(0);
			
			while(!q.isEmpty()) {
				int first=q.poll();
				Iterator<Integer> it= arr[first].iterator();
				visited[first]=true;
				
				while(it.hasNext()) 
				{ 		int v=it.next();
						if(visited[v]==false) {
							v_num++;
							q.add(v); //���⼭ ��������... ť���� ���� �湮 ������-> �湮�� ����x
							visited[v]=true;
						}
				}	
				
			}
				System.out.println(v_num);
				
			
	}
	static public void clearList(boolean[] list) {
		for(int i=0;i<list.length;i++) {
			list[i]=false;
		}
	}

}

