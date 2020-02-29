Return-Path: <SRS0=1pun=4R=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21830C3F2CE
	for <linux-mediatek@archiver.kernel.org>; Sat, 29 Feb 2020 13:50:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C92AF24650
	for <linux-mediatek@archiver.kernel.org>; Sat, 29 Feb 2020 13:50:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bidQ7nw4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="UHRrEmGD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C92AF24650
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KJaVPPjADl8qc+PNs2Fj9pZk631T3lQNCf0t+KzKaP8=; b=bidQ7nw4JJEzeg
	rXVdq+NDOCodKlzPzJquHWuoZtvFKLBpLgk3/OT0kri0cBERO87qQw/ZwhHgQsmsKLu9+DAFvP7Tw
	Il6cHFTbTUKMGBbGAcX3XGnFbCfdQB1fguvVbHYAzHckBZomXChjBR2One2X1OeX6L2NclBP1bm6m
	ie8jddRF62Qa86hba5/Uj2BKdozXySZ5tfDk1UwqwTTKPxUHopmFFnCkaTQYZEkmrcW6rEfuLavNS
	9zPu/IBjGqoOWM0uV7dEBuw//OCAd0QtcMY1bGh/FAD/p0r5WI66/o4A9ZYQ61dTxt9yhZ68KJKvI
	6wyoSbjuBd03ufmid1JQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j82Vj-000339-QT; Sat, 29 Feb 2020 13:50:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j82Vg-00032A-Sg; Sat, 29 Feb 2020 13:50:30 +0000
X-UUID: 69a25268b4fc44db861965f91c233a25-20200229
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=00XiYHa78TlbDkBS+pf5ukriX0Bv5XzT3h8NaBRlnxw=; 
 b=UHRrEmGDqvZET0sOWozlhuWKz7X0Dtl1avHzFDJbyWkk5kRabbDglcbg0U/xoSF8enWhLPJAJcjpwrodljPMNRbMZtEptkFkckymxOOwgGDwNKNTuV7zXP4jGNVXS2YSVMmaeCOYC9/bYGH/z5yQw37O34AVBPXFW0jkyIn+EPI=;
X-UUID: 69a25268b4fc44db861965f91c233a25-20200229
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <dennis-yc.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2019321539; Sat, 29 Feb 2020 05:50:26 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sat, 29 Feb 2020 05:42:36 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sat, 29 Feb 2020 21:40:54 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Sat, 29 Feb 2020 21:41:25 +0800
Message-ID: <1582983708.21073.6.camel@mtkswgap22>
Subject: Re: [PATCH v3 05/13] soc: mediatek: cmdq: return send msg error code
From: Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
Date: Sat, 29 Feb 2020 21:41:48 +0800
In-Reply-To: <1582904349.14824.19.camel@mtksdaap41>
References: <1582897461-15105-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1582897461-15105-7-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1582904349.14824.19.camel@mtksdaap41>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200229_055028_938835_B1178DCD 
X-CRM114-Status: GOOD (  14.56  )
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 wsd_upstream@mediatek.com, Jassi Brar <jassisinghbrar@gmail.com>,
 linux-kernel@vger.kernel.org, Houlong Wei <houlong.wei@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Ming-Fan Chen <ming-fan.chen@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi CK,

Thanks for your comment.

On Fri, 2020-02-28 at 23:39 +0800, CK Hu wrote:
> Hi, Dennis:
> 
> On Fri, 2020-02-28 at 21:44 +0800, Dennis YC Hsieh wrote:
> > Return error code to client if send message fail,
> > so that client has chance to error handling.
> > 
> > Fixes: 576f1b4bc802 ("soc: mediatek: Add Mediatek CMDQ helper")
> > Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
> > ---
> >  drivers/soc/mediatek/mtk-cmdq-helper.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> > index 2e1bc513569b..0698612de5ad 100644
> > --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> > +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> > @@ -351,11 +351,11 @@ int cmdq_pkt_flush_async(struct cmdq_pkt *pkt, cmdq_async_flush_cb cb,
> >  		spin_unlock_irqrestore(&client->lock, flags);
> >  	}
> >  
> > -	mbox_send_message(client->chan, pkt);
> > +	err = mbox_send_message(client->chan, pkt);
> >  	/* We can send next packet immediately, so just call txdone. */
> >  	mbox_client_txdone(client->chan, 0);
> 
> If error happen, why tx is done? I think you should return immediately
> when error happen.

ok, I will return error code directly.


Regards,
Dennis

> 
> Regards,
> CK
> 
> >  
> > -	return 0;
> > +	return err;
> >  }
> >  EXPORT_SYMBOL(cmdq_pkt_flush_async);
> >  
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
