Return-Path: <SRS0=GpGz=2U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C3C8C2D0C3
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Dec 2019 06:44:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC3B62071E
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Dec 2019 06:44:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GXm64b38";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="CKwzmNAP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC3B62071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f1N5ot+Ozl+DVMrVwGVXcojEkOCMNhTwNoQsgGNlErk=; b=GXm64b38UfAFYM
	NP+yPa0/Hx+Q4CT9WGUAx3YvyGF0wtsTUhAIgUei+Zi+7LaeWWvAKAVkttsucl+Ufhe0SSf6ZtBAP
	+iGAW9fk/k6cUEP/nMPy9NZMek73rE8DFCrfuRNo1RwDLZkI3d7JO+baxA9FhmxvswTLmxCRDoX84
	Xq5j8f1VVGBQ09QjUS0DAarRKdQTNmgpLt7trFtlYVDsAaOhH8Fu1bAl6UqBIxXkwefBLsibQ3Ysj
	WEIeC482kvhrNUgpCeZ1u+NMt7zSEJs6clF++Yd74JWd81W6hfyhfFS1a05e6DvlC5l1vkZptOZUh
	K+s5nm6y9+WWxuCJMuiA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ilon4-0007JS-TC; Mon, 30 Dec 2019 06:44:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ilon1-0007It-A8; Mon, 30 Dec 2019 06:44:33 +0000
X-UUID: 7fed1a5df5754e17925f4f2aff74ee8f-20191229
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=2JEQv42DFUUU456BpXiLJVg53m301BGWjGWt9M3Fzlk=; 
 b=CKwzmNAP1rTKSzbkV2j7fTUsbsmVECe4+IZdSxgi86YLM8WBxSkQrAYldL3zQCCIDZtckDOYMGMIgQy03Lk6IOWpG7W4rWB2tdS6Z4GyCNzhPl7wFCNp6/nRaTo37Vj0Qe7ZkJ8s3WPSG8f/g5GHKkFusVrYIO6cRKvYEqwSSII=;
X-UUID: 7fed1a5df5754e17925f4f2aff74ee8f-20191229
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2016859193; Sun, 29 Dec 2019 22:44:23 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 29 Dec 2019 22:44:37 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 30 Dec 2019 14:43:51 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 30 Dec 2019 14:44:36 +0800
Message-ID: <1577688253.17931.11.camel@mtksdaap41>
Subject: Re: [PATCH] soc: mediatek: cmdq: avoid racing condition with mutex
From: CK Hu <ck.hu@mediatek.com>
To: Bibby Hsieh <bibby.hsieh@mediatek.com>
Date: Mon, 30 Dec 2019 14:44:13 +0800
In-Reply-To: <20191121072910.31665-1-bibby.hsieh@mediatek.com>
References: <20191121072910.31665-1-bibby.hsieh@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191229_224431_357879_DBBEA025 
X-CRM114-Status: GOOD (  13.69  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
 srv_heupstream@mediatek.com, Jassi Brar <jassisinghbrar@gmail.com>,
 linux-kernel@vger.kernel.org, Houlong Wei <houlong.wei@mediatek.com>,
 Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Bibby:

On Thu, 2019-11-21 at 15:29 +0800, Bibby Hsieh wrote:
> If cmdq client is multi thread user, racing will occur without mutex
> protection. It will make the C message queued in mailbox's queue
> always need D message's triggering.
> 
> Thread A		Thread B		  Thread C		Thread D...
> -----------------------------------------------------------------------------------
> mbox_send_message()
> 	send_data()
> 			mbox_send_message()
> 				*exit
> 						mbox_send_message()
> 							*exit
> mbox_client_txdone()
> 	tx_tick()
> 			mbox_client_txdone()
> 				tx_tick()
> 						mbox_client_txdone()
> 							tx_tick()
> msg_submit()
> 	send_data()
> 			msg_submit()
> 				*exit
> 						msg_submit()
> 							*exit
> -----------------------------------------------------------------------------------
> 
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> ---
>  drivers/soc/mediatek/mtk-cmdq-helper.c | 3 +++
>  include/linux/soc/mediatek/mtk-cmdq.h  | 1 +
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> index 9add0fd5fa6c..9e35e0beffaa 100644
> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> @@ -81,6 +81,7 @@ struct cmdq_client *cmdq_mbox_create(struct device *dev, int index, u32 timeout)
>  	client->client.dev = dev;
>  	client->client.tx_block = false;
>  	client->chan = mbox_request_channel(&client->client, index);
> +	mutex_init(&client->mutex);
>  
>  	if (IS_ERR(client->chan)) {
>  		long err;
> @@ -352,9 +353,11 @@ int cmdq_pkt_flush_async(struct cmdq_pkt *pkt, cmdq_async_flush_cb cb,
>  		spin_unlock_irqrestore(&client->lock, flags);
>  	}
>  
> +	mutex_lock(&client->mutex);
>  	mbox_send_message(client->chan, pkt);
>  	/* We can send next packet immediately, so just call txdone. */
>  	mbox_client_txdone(client->chan, 0);
> +	mutex_unlock(&client->mutex);


In [1], Mediatek DRM is the first client to use cmdq and it already has
its own mutex to protect this. I think helper is something help many
user but now I just see Mediatek MDP [2] need this. For DRM, there are
so many useless code in cmdq_pkt_flush_async(). DRM does not need the
timer to check timeout. DRM could do dma_sync_single_for_cpu() in its
callback and need not to create a intermediate callback to do this. I
would agree this patch only when I see two or more user need this.


[1]
https://github.com/ckhu-mediatek/linux.git-tags/commit/4df12ed1866d1104f631e06218bd15fde512a79e
[2] https://patchwork.kernel.org/patch/10945609/

Regards,
CK

>  
>  	return 0;
>  }
> diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
> index a74c1d5acdf3..0f9071cd1bc7 100644
> --- a/include/linux/soc/mediatek/mtk-cmdq.h
> +++ b/include/linux/soc/mediatek/mtk-cmdq.h
> @@ -28,6 +28,7 @@ struct cmdq_client {
>  	struct mbox_chan *chan;
>  	struct timer_list timer;
>  	u32 timeout_ms; /* in unit of microsecond */
> +	struct mutex mutex;
>  };
>  
>  /**

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
