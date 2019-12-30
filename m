Return-Path: <SRS0=GpGz=2U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F27E4C2D0DA
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Dec 2019 02:08:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C002D207FD
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Dec 2019 02:08:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B1gkRNsE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Q2umEATI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C002D207FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0wFOEuItya/RmT5hN+4dsXwUsQoVAfaJQUj0NdX3mrk=; b=B1gkRNsEzepnSu
	Ftp0QGR3HQX6LqVyPSviV38lAe70Gd8o0lAjTK3k+hDGODZxW4DtCOrkq3k2kYv9hSn4LcA6jfObh
	MamNBDH1xZ2H4BmoHU4dAtG0+rbGBA9N/BOK1bZTaOWPGGe4nHPQQRHcxZDzCVmfiIdSgEV9fmdIC
	TP9913SnxPC/HLcIsVIFq27VRaIvS5k6baAPhBOvDRtwHwBpI+gAXwhLJpYYkrAnToFFuUPYutHmT
	kD0pNn9NNWzXBwiy4J/K7wMTMTZHL92mffPd1mNib0RHjbHO37UXnUEbI5ruBgXdg4m0gYncTbP25
	Yk/J6ylnJ7bYEKywFn8w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ilkU6-000764-3R; Mon, 30 Dec 2019 02:08:42 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ilkTt-0006vI-6F; Mon, 30 Dec 2019 02:08:30 +0000
X-UUID: 7c1930e7e0ff4c12994a6919feafa86f-20191229
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=zs3wqU0/rTaxSd+jOFQHg8yAjxKsG5qsZDhljNgTpew=; 
 b=Q2umEATIEYiHqozWXZcwK0YOuRDfKw2mUSzZs4rA/HI7fGWtJhA/xeiNU7BDRolk8Cp8JwVIVE5Tmpo1MZ3P3OLVSxAO8qT7ossqzs8D0W0iLTreYRsorvTl8iCNEu7GHRzr4JUD5FLMx47En8ecJ7TssN9/wjdG89XbgB2ws9g=;
X-UUID: 7c1930e7e0ff4c12994a6919feafa86f-20191229
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1442169816; Sun, 29 Dec 2019 18:08:23 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 29 Dec 2019 18:02:58 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 30 Dec 2019 10:02:18 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 30 Dec 2019 10:03:03 +0800
Message-ID: <1577671361.8160.2.camel@mtksdaap41>
Subject: Re: [PATCH] soc: mediatek: cmdq: avoid racing condition with mutex
From: CK Hu <ck.hu@mediatek.com>
To: Bibby Hsieh <bibby.hsieh@mediatek.com>
Date: Mon, 30 Dec 2019 10:02:41 +0800
In-Reply-To: <1575426135.31411.2.camel@mtksdaap41>
References: <20191121072910.31665-1-bibby.hsieh@mediatek.com>
 <1575426135.31411.2.camel@mtksdaap41>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191229_180829_232717_79FAD9AA 
X-CRM114-Status: GOOD (  13.88  )
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

Hi, Jassi:

Ping again.

Are mbox_send_message() and mbox_client_txdone() thread-safe? If these
two are thread-safe, this bug should be fixed in mailbox core not
client.

Regards,
CK

On Wed, 2019-12-04 at 10:22 +0800, CK Hu wrote:
> Hi, Jassi:
> 
> Are mbox_send_message() and mbox_client_txdone() thread-safe? If these
> two are thread-safe, this bug should be fixed in mailbox core not
> client.
> 
> Regards,
> CK
> 
> On Thu, 2019-11-21 at 15:29 +0800, Bibby Hsieh wrote:
> > If cmdq client is multi thread user, racing will occur without mutex
> > protection. It will make the C message queued in mailbox's queue
> > always need D message's triggering.
> > 
> > Thread A		Thread B		  Thread C		Thread D...
> > -----------------------------------------------------------------------------------
> > mbox_send_message()
> > 	send_data()
> > 			mbox_send_message()
> > 				*exit
> > 						mbox_send_message()
> > 							*exit
> > mbox_client_txdone()
> > 	tx_tick()
> > 			mbox_client_txdone()
> > 				tx_tick()
> > 						mbox_client_txdone()
> > 							tx_tick()
> > msg_submit()
> > 	send_data()
> > 			msg_submit()
> > 				*exit
> > 						msg_submit()
> > 							*exit
> > -----------------------------------------------------------------------------------
> > 
> > Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> > ---
> >  drivers/soc/mediatek/mtk-cmdq-helper.c | 3 +++
> >  include/linux/soc/mediatek/mtk-cmdq.h  | 1 +
> >  2 files changed, 4 insertions(+)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> > index 9add0fd5fa6c..9e35e0beffaa 100644
> > --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> > +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> > @@ -81,6 +81,7 @@ struct cmdq_client *cmdq_mbox_create(struct device *dev, int index, u32 timeout)
> >  	client->client.dev = dev;
> >  	client->client.tx_block = false;
> >  	client->chan = mbox_request_channel(&client->client, index);
> > +	mutex_init(&client->mutex);
> >  
> >  	if (IS_ERR(client->chan)) {
> >  		long err;
> > @@ -352,9 +353,11 @@ int cmdq_pkt_flush_async(struct cmdq_pkt *pkt, cmdq_async_flush_cb cb,
> >  		spin_unlock_irqrestore(&client->lock, flags);
> >  	}
> >  
> > +	mutex_lock(&client->mutex);
> >  	mbox_send_message(client->chan, pkt);
> >  	/* We can send next packet immediately, so just call txdone. */
> >  	mbox_client_txdone(client->chan, 0);
> > +	mutex_unlock(&client->mutex);
> >  
> >  	return 0;
> >  }
> > diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
> > index a74c1d5acdf3..0f9071cd1bc7 100644
> > --- a/include/linux/soc/mediatek/mtk-cmdq.h
> > +++ b/include/linux/soc/mediatek/mtk-cmdq.h
> > @@ -28,6 +28,7 @@ struct cmdq_client {
> >  	struct mbox_chan *chan;
> >  	struct timer_list timer;
> >  	u32 timeout_ms; /* in unit of microsecond */
> > +	struct mutex mutex;
> >  };
> >  
> >  /**
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
