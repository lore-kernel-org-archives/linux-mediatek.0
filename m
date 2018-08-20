From: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: [bug report] mailbox: mediatek: Add Mediatek CMDQ driver
Date: Mon, 20 Aug 2018 17:08:35 +0300
Message-ID: <20180820140835.j7qhkebahpamqnuy@kili.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: houlong.wei-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Hello Houlong Wei,

The patch 623a6143a845: "mailbox: mediatek: Add Mediatek CMDQ driver"
from Jul 25, 2018, leads to the following static checker warning:

	drivers/mailbox/mtk-cmdq-mailbox.c:366 cmdq_mbox_send_data()
	error: potential null dereference 'task'.  (kzalloc returns null)

drivers/mailbox/mtk-cmdq-mailbox.c
   354  static int cmdq_mbox_send_data(struct mbox_chan *chan, void *data)
   355  {
   356          struct cmdq_pkt *pkt = (struct cmdq_pkt *)data;
   357          struct cmdq_thread *thread = (struct cmdq_thread *)chan->con_priv;
   358          struct cmdq *cmdq = dev_get_drvdata(chan->mbox->dev);
   359          struct cmdq_task *task;
   360          unsigned long curr_pa, end_pa;
   361  
   362          /* Client should not flush new tasks if suspended. */
   363          WARN_ON(cmdq->suspended);
   364  
   365          task = kzalloc(sizeof(*task), GFP_ATOMIC);
   366          task->cmdq = cmdq;

No check for kzalloc() failure.

   367          INIT_LIST_HEAD(&task->list_entry);
   368          task->pa_base = pkt->pa_base;
   369          task->thread = thread;
   370          task->pkt = pkt;
   371  
   372          if (list_empty(&thread->task_busy_list)) {
   373                  WARN_ON(clk_enable(cmdq->clock) < 0);
   374                  WARN_ON(cmdq_thread_reset(cmdq, thread) < 0);
   375  

regards,
dan carpenter
