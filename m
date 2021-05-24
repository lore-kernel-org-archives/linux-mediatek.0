Return-Path: <SRS0=AnEI=KU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72CB4C2B9F7
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 May 2021 00:41:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33E916128D
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 May 2021 00:41:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33E916128D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nnW0q3VXR5R3NcW5GGCbYkWhT67gwRCvy5KXR3p5JN0=; b=K5tVBtICMqb46Z
	vtV2laKSZAhpfb5dux3rQl7MyKk5tDv6M/c2Av+Pulp0mCe8nL4acQKfMjqwhSXD24IQqtsaHx62M
	NYCVIocekokIr9q/+3iTo1CB/sxCdBLxMHim1hgqKOgmu+DogkJdB32hI03ncJUrkoNN8lY3Q3Dqx
	1iSpW9xmHVqdy4T6L00NxB0h4GthZlHeX/z/p9hA8R1p5wwLa+kxyK7+RpFBKK5w0EKdIeYpPmZeu
	I71OTCGTEu2uiSr4d1uzBk6gcCkl7CwBnYYLvStxHFHNqY1Wc3Lv3H08pYuMw8wmMUKmNubg+GMbh
	CTCIP3u9itF9UBcTKgAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llL83-002bis-DN; Tue, 25 May 2021 00:41:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1llElG-001Lyz-NB
 for linux-mediatek@lists.infradead.org; Mon, 24 May 2021 17:53:08 +0000
X-UUID: 486c063ceaad436ea42bc57c861697f7-20210524
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=HCbB9ajOnGws9PENigdtqscCoyYeufv/mBXqD1vfrgU=; 
 b=fCfhnbenNv6eBndgiQfznCbgYjk4LrxgTFPsO6qWrOrNBujdfPksr7M349IHiXUIX2mJ4mY714lfDDBeV8tFSfhb8jSy8pYEvS5sEdrQy4eKU9efIB00TtZTLAlym7gLXr1E3SmyklRhbNCsUnb8JW/lJF/rfP9K90Sls0kf7dw=;
X-UUID: 486c063ceaad436ea42bc57c861697f7-20210524
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 417887538; Mon, 24 May 2021 10:53:01 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 24 May 2021 10:53:00 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 May 2021 01:52:58 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 25 May 2021 01:52:58 +0800
Message-ID: <1621878778.21477.1.camel@mtkswgap22>
Subject: Re: [PATCH] mt76: mt7921: fix UC entry is being overwritten
From: Ryder Lee <ryder.lee@mediatek.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
CC: <sean.wang@mediatek.com>, <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>,
 <Soul.Huang@mediatek.com>, <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, 
 <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
 <Eric.Liang@mediatek.com>, <Stella.Chang@mediatek.com>, <jemele@google.com>,
 <yenlinlai@google.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
Date: Tue, 25 May 2021 01:52:58 +0800
In-Reply-To: <YKrGretiq7wo+pzv@lore-desk>
References: <1621495354-4130-1-git-send-email-sean.wang@mediatek.com>
 <YKrGretiq7wo+pzv@lore-desk>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210524_105306_799996_080F4EAC 
X-CRM114-Status: GOOD (  19.09  )
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

On Sun, 2021-05-23 at 23:18 +0200, Lorenzo Bianconi wrote:
> > From: Deren Wu <deren.wu@mediatek.com>
> > 
> > Fix UC entry is being overwritten by BC entry
> > 
> > Fixes: 36fcc8cff592 ("mt76: mt7921: introduce mt7921_mcu_sta_add routine")
> > Signed-off-by: Deren Wu <deren.wu@mediatek.com>
> > Signed-off-by: YN Chen <yn.chen@mediatek.com>
> > Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> > ---
> >  drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 11 +++++++----
> >  1 file changed, 7 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> > index 73359defa176..f3decc59a6fe 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> > +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> > @@ -875,10 +875,13 @@ int mt76_connac_mcu_add_sta_cmd(struct mt76_phy *phy,
> >  	if (IS_ERR(skb))
> >  		return PTR_ERR(skb);
> >  
> > -	mt76_connac_mcu_sta_basic_tlv(skb, info->vif, info->sta, info->enable);
> > -	if (info->enable && info->sta)
> > -		mt76_connac_mcu_sta_tlv(phy, skb, info->sta, info->vif,
> > -					info->rcpi);
> > +	if (info->sta) {
> > +		mt76_connac_mcu_sta_basic_tlv(skb, info->vif, info->sta,
> > +					      info->enable);
> > +		if (info->enable)
> > +			mt76_connac_mcu_sta_tlv(phy, skb, info->sta,
> > +						info->vif, info->rcpi);
> > +	}
> 
> with this patch we are changing the mt7663 behaviour since we run
> mt76_connac_mcu_add_sta_cmd() in mt7615_remove_interface() with
> enable = false and sta = NULL. Can you please confirm you are
> not introducing any regression in mt7663?

I think this also breaks mt7622, so please double check.

> Regards,
> Lorenzo
> 
> >  
> >  	sta_wtbl = mt76_connac_mcu_add_tlv(skb, STA_REC_WTBL,
> >  					   sizeof(struct tlv));
> > -- 
> > 2.25.1
> > 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
