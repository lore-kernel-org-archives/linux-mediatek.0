Return-Path: <SRS0=FJ4T=K2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 225B8C47080
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 May 2021 16:50:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1A3361003
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 May 2021 16:50:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1A3361003
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+zd8kS/DxHOvAOm3vttG0VolF4Af68LRiLoM8j6V2E8=; b=hZF9tpjxrWuxfB
	vei6dXdLAlqyB3lIghyJ4Nq5qdhQqsfwBw85v0JtXJEVyILogZ8VaFWmLCgtq/EGxNF5+Viu0HrLq
	4paXo6klFoMPGQk6hTZNEz7RXIbcWOg3q4iRiroKtuhvcIISJC1d3inq23D+g53uMA3M3zoo5lTEZ
	iZnBFe8b8CAy4B3vimHaeWT0T92q23dEE5jSVtu650iP5jmXEaG5cmWdsMDgZvtw7TayO4RyNl+6K
	E6eCejdderOQU3ky0wUDmYlwgiD9sZxtXiL3KuVVwPvCWoRnDe1u66mT3yZhbyaNCwbwLWnitj/Xg
	zASqCTiUPTsxTgZ9tnAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnl7k-00Ctxl-V3; Mon, 31 May 2021 16:50:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnl7h-00Ctwp-T0
 for linux-mediatek@lists.infradead.org; Mon, 31 May 2021 16:50:43 +0000
X-UUID: 85a2d9f6ddfa436b96005bf577921ac6-20210531
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=jOyhX6Re5eXq28+/L1oMJ2keBDSoTs6sF7Oih/n0Kpk=; 
 b=Ormfhnl0Onavzmf77P5ZCCClxetdPlaL5oAzhn6u4BzTP5wkfkuwEBJrAugqoUvurEfbFPQPPl8l+4pVowT+JKlsiXU6Mkq2L4p0gfFOqo0D+qpyUwvBVTQAizwDHd7lC3ZVI19AlVRWY70iBBvpmyfBRygpqMB3aoQj1YO9nWI=;
X-UUID: 85a2d9f6ddfa436b96005bf577921ac6-20210531
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <deren.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1098354994; Mon, 31 May 2021 09:50:40 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 31 May 2021 09:50:38 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 1 Jun 2021 00:50:37 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 1 Jun 2021 00:50:36 +0800
Message-ID: <6188b37ca5f9aa74c7403c999c74540fe462a174.camel@mediatek.com>
Subject: Re: [PATCH] mt76: mt7921: enable random mac address during sched_scan
From: Deren Wu <deren.wu@mediatek.com>
To: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
CC: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, "Soul
 Huang" <Soul.Huang@mediatek.com>, YN Chen <YN.Chen@mediatek.com>, Leon Yen
 <Leon.Yen@mediatek.com>, Eric-SY Chang <Eric-SY.Chang@mediatek.com>, KM Lin
 <km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>, CH Yeh
 <ch.yeh@mediatek.com>, Posh Sun <posh.sun@mediatek.com>, Eric Liang
 <Eric.Liang@mediatek.com>, Stella Chang <Stella.Chang@mediatek.com>,
 <jemele@google.com>, <yenlinlai@google.com>, linux-wireless
 <linux-wireless@vger.kernel.org>, linux-mediatek
 <linux-mediatek@lists.infradead.org>
Date: Tue, 1 Jun 2021 00:50:36 +0800
In-Reply-To: <YLUQqIqbojUNRZVA@lore-desk>
References: <14360a28083d56520a2cabc87841d9dee3d97a01.1622476643.git.deren.wu@mediatek.com>
 <YLUQqIqbojUNRZVA@lore-desk>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210531_095041_970592_94EFF811 
X-CRM114-Status: GOOD (  18.42  )
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

On Mon, 2021-05-31 at 18:36 +0200, Lorenzo Bianconi wrote:
> > From: Deren Wu <deren.wu@mediatek.com>
> > 
> > Enable src address randomization during scheduled scanning
> > 
> > Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
> 
> Here we are missing my SoB, it should be:
> 
> Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Hi Lore,

Sorry for typo. I will update a new verion.


Regards,
Deren

> 
> > Signed-off-by: Deren Wu <deren.wu@mediatek.com>
> > ---
> >  .../net/wireless/mediatek/mt76/mt76_connac_mcu.c   | 14 ++++++++
> > ------
> >  .../net/wireless/mediatek/mt76/mt76_connac_mcu.h   |  4 +++-
> >  drivers/net/wireless/mediatek/mt76/mt7921/init.c   |  3 ++-
> >  3 files changed, 13 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> > b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> > index 73359defa176..b155e7b8d89d 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> > +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> > @@ -1515,14 +1515,16 @@ int mt76_connac_mcu_sched_scan_req(struct
> > mt76_phy *phy,
> >  	req->version = 1;
> >  	req->seq_num = mvif->scan_seq_num | ext_phy << 7;
> >  
> > -	if (is_mt7663(phy->dev) &&
> > -	    (sreq->flags & NL80211_SCAN_FLAG_RANDOM_ADDR)) {
> > -		get_random_mask_addr(req->mt7663.random_mac, sreq-
> > >mac_addr,
> > -				     sreq->mac_addr_mask);
> > +	if (sreq->flags & NL80211_SCAN_FLAG_RANDOM_ADDR) {
> > +		u8 *addr = is_mt7663(phy->dev) ? req->mt7663.random_mac
> > +					       : req-
> > >mt7921.random_mac;
> > +
> >  		req->scan_func = 1;
> > -	} else if (is_mt7921(phy->dev)) {
> > -		req->mt7921.bss_idx = mvif->idx;
> > +		get_random_mask_addr(addr, sreq->mac_addr,
> > +				     sreq->mac_addr_mask);
> >  	}
> > +	if (is_mt7921(phy->dev))
> > +		req->mt7921.bss_idx = mvif->idx;
> >  
> >  	req->ssids_num = sreq->n_ssids;
> >  	for (i = 0; i < req->ssids_num; i++) {
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> > b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> > index d64b8058b744..3076417ead5f 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> > +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> > @@ -779,7 +779,9 @@ struct mt76_connac_sched_scan_req {
> >  		} mt7663;
> >  		struct {
> >  			u8 bss_idx;
> > -			u8 pad2[63];
> > +			u8 pad2[19];
> > +			u8 random_mac[ETH_ALEN];
> > +			u8 pad3[38];
> >  		} mt7921;
> >  	};
> >  } __packed;
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
> > b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
> > index 59da29032645..19ce9ca72542 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
> > +++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
> > @@ -76,7 +76,8 @@ mt7921_init_wiphy(struct ieee80211_hw *hw)
> >  	wiphy->flags |= WIPHY_FLAG_HAS_CHANNEL_SWITCH;
> >  	wiphy->reg_notifier = mt7921_regd_notifier;
> >  
> > -	wiphy->features |= NL80211_FEATURE_SCAN_RANDOM_MAC_ADDR;
> > +	wiphy->features |= NL80211_FEATURE_SCHED_SCAN_RANDOM_MAC_ADDR |
> > +			   NL80211_FEATURE_SCAN_RANDOM_MAC_ADDR;
> >  	wiphy_ext_feature_set(wiphy,
> > NL80211_EXT_FEATURE_SET_SCAN_DWELL);
> >  
> >  	ieee80211_hw_set(hw, SINGLE_SCAN_ON_ALL_BANDS);
> > -- 
> > 2.18.0
> > 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
