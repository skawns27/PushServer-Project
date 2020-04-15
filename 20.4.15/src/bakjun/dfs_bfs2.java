package bakjun;


import java.util.*;

public class dfs_bfs2 {
	
	
	public static void main(String[] args) {
		 	int num;
		 	int v_num=0;//감염수
			int line;
			Queue<Integer> q = new LinkedList<Integer>();
			Scanner sc=new Scanner(System.in);
			num=sc.nextInt();
			line=sc.nextInt();//간선 수
			
			boolean[] visited=new boolean[num];
			clearList(visited);//방문 초기화
			
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
							q.add(v); //여기서 문제였음... 큐에는 다음 방문 정점만-> 방문한 정점x
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

