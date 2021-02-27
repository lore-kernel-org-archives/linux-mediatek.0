Return-Path: <SRS0=qrwZ=H5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEE83C433E0
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Feb 2021 13:35:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95FB164E7A
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Feb 2021 13:35:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95FB164E7A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xrZC0B0AfMDKuZV8ub6BvL7cYX8T/6VMhocOfoJBqjo=; b=d5Csjwvar9/UrysPbnKEeyLXn
	dshsyOFFvx5FOeSuhY0JxoLC1UtRasUkklPN7NULOnl57Px5qSK8a/t8Ai4FmCxWE9faxF2dcgD7G
	5+5II4hHHWMUd29zVBeWgKDjHrJY2zKZDu0wYqClmIOR0BFp09rKQ7L8tP7TaiKmkx/v+g/5xX17i
	DAXx3gFOoWzEvlSpQbjJfSf71OYV2V4spPnNsBoergbeQzs+9hxKZpI4/iuWHi3+UTPOICE1juvv/
	IxLVbZbyHqpxyHYPNIHkkyQn11tKELfGDIl6SjE+BR+vwfPIJ/DdG2RNHwJFKhLnbHL8dXOPP37L6
	D57LGhFvg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFzl5-00060H-1B; Sat, 27 Feb 2021 13:35:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFzl1-0005zl-BX
 for linux-mediatek@lists.infradead.org; Sat, 27 Feb 2021 13:35:45 +0000
X-UUID: 8b103354a25d4d79b09ad6d6c123fc65-20210227
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=+fyyoOPtYIfaBWS2oMwL/SOuUE5ToRW6IY5SE9Eij2Y=; 
 b=ih5XHJwLwbBuNlzTxx/8BdyjY+QCbLCHkatvQkty11coaV/MrP707FdC0aigDsPH5JM3tUnlRNG5FGZenYQM+9YY/MNxrWC6NSnnTquskG7FF7TeJQW3dA+wCsgT6hPJUcQC7kH2NRK7FDHody9cjzs/ifEUtGvLUI/SLj9oAeQ=;
X-UUID: 8b103354a25d4d79b09ad6d6c123fc65-20210227
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 586855807; Sat, 27 Feb 2021 05:35:33 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 27 Feb 2021 05:35:32 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 27 Feb 2021 21:35:30 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 27 Feb 2021 21:35:30 +0800
Message-ID: <1614432930.14551.7.camel@mtkswgap22>
Subject: Re: [PATCH 2/5] mt76: mt7615: stop ext_phy queue when mac reset
 happens
From: Ryder Lee <ryder.lee@mediatek.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sat, 27 Feb 2021 21:35:30 +0800
In-Reply-To: <YDodpxIQzPA8754l@lore-desk>
References: <d6f2573790582538e8ba82f87a4c35329692ee32.1614411256.git.ryder.lee@mediatek.com>
 <3794a3ffadc4a08548a1223e6955671977e78e49.1614411256.git.ryder.lee@mediatek.com>
 <YDodpxIQzPA8754l@lore-desk>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 0FACCB4C644AB259B6BB76140C4710DC3A2830871372B2E1334688B423EE6B1E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210227_083544_165540_1AA5710A 
X-CRM114-Status: GOOD (  15.06  )
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
Cc: linux-mediatek@lists.infradead.org,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Shayne Chen <shayne.chen@mediatek.com>, linux-wireless@vger.kernel.org,
 Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, 2021-02-27 at 11:23 +0100, Lorenzo Bianconi wrote:
> > Stop Tx burst for ext_phy after mac reset.
> > 
> > Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> > ---
> >  drivers/net/wireless/mediatek/mt76/mt7615/mac.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
> > index df2dc77a323a..0f613063c1ff 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
> > +++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
> > @@ -2085,6 +2085,7 @@ void mt7615_mac_reset_work(struct work_struct *work)
> >  	del_timer_sync(&dev->phy.roc_timer);
> >  	cancel_work_sync(&dev->phy.roc_work);
> >  	if (phy2) {
> > +		set_bit(MT76_RESET, &phy2->mt76->state);
> 
> Hi Ryder,
> 
> since we run mt76_txq_schedule_all then and mt76_worker_disable few lines below, what is the point
> of setting the state to RESET?

Just in case mt76_txq_schedule_* still has the possibility to be called
by some other place at the time reset happens. Also, I think MT76_RESET
is more reliable to break Tx scheduling (from inside of the burst loop).

Ryder
> 
> >  		cancel_delayed_work_sync(&phy2->mt76->mac_work);
> >  		del_timer_sync(&phy2->roc_timer);
> >  		cancel_work_sync(&phy2->roc_work);
> > @@ -2118,6 +2119,8 @@ void mt7615_mac_reset_work(struct work_struct *work)
> >  
> >  	clear_bit(MT76_MCU_RESET, &dev->mphy.state);
> >  	clear_bit(MT76_RESET, &dev->mphy.state);
> > +	if (phy2)
> > +		clear_bit(MT76_RESET, &phy2->mt76->state);
> >  
> >  	mt76_worker_enable(&dev->mt76.tx_worker);
> >  	napi_enable(&dev->mt76.tx_napi);
> > -- 
> > 2.18.0
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
