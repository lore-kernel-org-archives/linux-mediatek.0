Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DFDDC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Apr 2022 08:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZG0NfF8gPKY4HSyGPNHKNz8w91W9OEUXOM/70OG4NW4=; b=s8berWOhUbN2bM
	p/0EAsIC+kFMIX+4XJ63Eln0UDOmIzmBSSbq4OCQ0uHIOLZjKCv0W5RNW8yvFxsNPFIPgWJ0v9k1+
	DJTudP17iI+/mGXBiJkwuj7EqQ7cuqYHSOYpoiq2tNA9Luot0QCI3gAayeCxG2qMUdKIKajpb1JrB
	8idU/xOTCo5mh94EWxx6jqb+6bv5WExNfWhAg1C13C/pGMaAHDwx+UudlGnV4ZKnAJ9tDWJbn6vtF
	vZP93/TevXUUXnvxtcdizCLQ52hdWL8+vrT3rkPjzNSz2A+bLcFm3CyNSOTtcwV2ccYUOt+jm+agO
	QG6SvLQQ9reNF2XFSjfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh5IR-007yC4-Em; Wed, 20 Apr 2022 08:02:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh5IN-007y9h-CY; Wed, 20 Apr 2022 08:02:41 +0000
X-UUID: a89324e815ae4ffb9a90dbe8f62a6430-20220420
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:139ad545-e602-4461-8dc6-4299ce122e0e, OB:0,
 LO
 B:0,IP:0,URL:8,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-12
X-CID-META: VersionHash:faefae9, CLOUDID:dba454f0-da02-41b4-b6df-58f4ccd36682,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: a89324e815ae4ffb9a90dbe8f62a6430-20220420
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1693621113; Wed, 20 Apr 2022 01:02:33 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 Apr 2022 01:02:31 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 20 Apr 2022 16:02:24 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 20 Apr 2022 16:02:23 +0800
Message-ID: <2fb273bc4ba8a7571d00da1d7bbea1e8d731b84f.camel@mediatek.com>
Subject: Re: [RESEND PATCH] soc: mediatek: cmdq: Use mailbox rx_callback
 instead of cmdq_task_cb
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <roy-cw.yeh@mediatek.com>, <moudy.ho@mediatek.com>,
 <nancy.lin@medaitek.com>, <singo.chang@mediatek.com>
Date: Wed, 20 Apr 2022 16:02:23 +0800
In-Reply-To: <1650102868-26219-1-git-send-email-chunkuang.hu@kernel.org>
References: <1650102868-26219-1-git-send-email-chunkuang.hu@kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_010239_502308_716C15C7 
X-CRM114-Status: GOOD (  22.59  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Chun-Kuang,

Reviewed-by: jason-jh.lin <jason-jh.lin@mediatek.com>
and
Tested-by: jason-jh.lin <jason-jh.lin@mediatek.com>


Hi Roy, Moudy,

Please aware of this modification for MDP on-going patch.

You can refer to this patch on DRM:

https://patchwork.kernel.org/project/linux-mediatek/patch/20211028101912.4624-2-jason-jh.lin@mediatek.com/


Thanks.

Regard,
Jason-JH.Lin

On Sat, 2022-04-16 at 17:54 +0800, Chun-Kuang Hu wrote:
> rx_callback is a standard mailbox callback mechanism and could cover
> the
> function of proprietary cmdq_task_cb, so use the standard one instead
> of
> the proprietary one. Client has changed to use the standard callback
> machanism and sync dma buffer in client driver, so remove the
> proprietary
> callback in cmdq helper.
> 
> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> ---
>  drivers/soc/mediatek/mtk-cmdq-helper.c | 25 +-----------------------
> -
>  include/linux/soc/mediatek/mtk-cmdq.h  |  5 +----
>  2 files changed, 2 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c
> b/drivers/soc/mediatek/mtk-cmdq-helper.c
> index 3c8e421..c1837a4 100644
> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> @@ -425,34 +425,11 @@ int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
>  }
>  EXPORT_SYMBOL(cmdq_pkt_finalize);
>  
> -static void cmdq_pkt_flush_async_cb(struct cmdq_cb_data data)
> -{
> -	struct cmdq_pkt *pkt = (struct cmdq_pkt *)data.data;
> -	struct cmdq_task_cb *cb = &pkt->cb;
> -	struct cmdq_client *client = (struct cmdq_client *)pkt->cl;
> -
> -	dma_sync_single_for_cpu(client->chan->mbox->dev, pkt->pa_base,
> -				pkt->cmd_buf_size, DMA_TO_DEVICE);
> -	if (cb->cb) {
> -		data.data = cb->data;
> -		cb->cb(data);
> -	}
> -}
> -
> -int cmdq_pkt_flush_async(struct cmdq_pkt *pkt, cmdq_async_flush_cb
> cb,
> -			 void *data)
> +int cmdq_pkt_flush_async(struct cmdq_pkt *pkt)
>  {
>  	int err;
>  	struct cmdq_client *client = (struct cmdq_client *)pkt->cl;
>  
> -	pkt->cb.cb = cb;
> -	pkt->cb.data = data;
> -	pkt->async_cb.cb = cmdq_pkt_flush_async_cb;
> -	pkt->async_cb.data = pkt;
> -
> -	dma_sync_single_for_device(client->chan->mbox->dev, pkt-
> >pa_base,
> -				   pkt->cmd_buf_size, DMA_TO_DEVICE);
> -
>  	err = mbox_send_message(client->chan, pkt);
>  	if (err < 0)
>  		return err;
> diff --git a/include/linux/soc/mediatek/mtk-cmdq.h
> b/include/linux/soc/mediatek/mtk-cmdq.h
> index ac6b5f3..2b498f4 100644
> --- a/include/linux/soc/mediatek/mtk-cmdq.h
> +++ b/include/linux/soc/mediatek/mtk-cmdq.h
> @@ -268,8 +268,6 @@ int cmdq_pkt_finalize(struct cmdq_pkt *pkt);
>   * cmdq_pkt_flush_async() - trigger CMDQ to asynchronously execute
> the CMDQ
>   *                          packet and call back at the end of done
> packet
>   * @pkt:	the CMDQ packet
> - * @cb:		called at the end of done packet
> - * @data:	this data will pass back to cb
>   *
>   * Return: 0 for success; else the error code is returned
>   *
> @@ -277,7 +275,6 @@ int cmdq_pkt_finalize(struct cmdq_pkt *pkt);
>   * at the end of done packet. Note that this is an ASYNC function.
> When the
>   * function returned, it may or may not be finished.
>   */
> -int cmdq_pkt_flush_async(struct cmdq_pkt *pkt, cmdq_async_flush_cb
> cb,
> -			 void *data);
> +int cmdq_pkt_flush_async(struct cmdq_pkt *pkt);
>  
>  #endif	/* __MTK_CMDQ_H__ */
-- 
Jason-JH Lin <jason-jh.lin@mediatek.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
