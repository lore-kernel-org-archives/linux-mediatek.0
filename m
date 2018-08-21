From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH] mailbox: mediatek: Add check for possible failure of
 kzalloc
Date: Tue, 21 Aug 2018 17:06:07 +0200
Message-ID: <1534863967.5009.7.camel@pengutronix.de>
References: <1534846964-13224-1-git-send-email-houlong.wei@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1534846964-13224-1-git-send-email-houlong.wei@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Houlong Wei <houlong.wei@mediatek.com>, Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com, Daoyuan Huang <daoyuan.huang@mediatek.com>, linux-kernel@vger.kernel.org, Daniel Kurtz <djkurtz@chromium.org>, HS Liao <hs.liao@mediatek.com>, Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>, YT Shen <yt.shen@mediatek.com>, Monica Wang <monica.wang@mediatek.com>, linux-mediatek@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>, enzhu.wang@mediatek.com, CK HU <ck.hu@mediatek.com>, Jiaguang Zhang <jiaguang.zhang@mediatek.com>, Bibby Hsieh <bibby.hsieh@mediatek.com>, linux-arm-kernel@lists.infradead.org, ginny.chen@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

On Tue, 2018-08-21 at 18:22 +0800, Houlong Wei wrote:
> The patch 623a6143a845("mailbox: mediatek: Add Mediatek CMDQ driver")
> introduce the following static checker warning:
>   drivers/mailbox/mtk-cmdq-mailbox.c:366 cmdq_mbox_send_data()
>   error: potential null dereference 'task'.  (kzalloc returns null)
> 
> Fixes: 623a6143a845 ("mailbox: mediatek: Add Mediatek CMDQ driver")
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Houlong Wei <houlong.wei@mediatek.com>
> ---
>  drivers/mailbox/mtk-cmdq-mailbox.c |    3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
> index aec46d5..f7cc29c 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -363,6 +363,9 @@ static int cmdq_mbox_send_data(struct mbox_chan *chan, void *data)
>  	WARN_ON(cmdq->suspended);
>  
>  	task = kzalloc(sizeof(*task), GFP_ATOMIC);
> +	if (!task)
> +		return -ENOMEM;
> +
>  	task->cmdq = cmdq;
>  	INIT_LIST_HEAD(&task->list_entry);
>  	task->pa_base = pkt->pa_base;

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
