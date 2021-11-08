Return-Path: <SRS0=Hr4j=P3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38542C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Nov 2021 06:03:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 957566115A
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Nov 2021 06:03:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 957566115A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ppBrofpMbZwWXW66xoNq01TWG1GNVtbep2H/w01KOJk=; b=K3Ur922czLOh8p
	gdfOk/X+10jepW4OGcNm6VimBufX2Joq2UMb+xngCmDm3DHxzbw6o4HEjDSeYT+mTYUa/eFpHdPZN
	Jvxqt82qK8SPBj+HBiXZoLwXsz6UlAC9shwaBhpe00M12kNr4OqsoEgPk9QMLLmwDI+qmJjMaGrqy
	9ksY3ujq6xHl6UD2ed8GGmIYFaUEWVWFhAr+JJGMkHYmkyY46XTr2vZwQkbV+t7aKwnmJ4ZU2TOs3
	HyhUayqPaze9ClIeqHs8OXzoYgeU/KCcWUoB87CenIYC+LORkiCAL5gDq+VjOZGb0GRkKpzC3fTMg
	VPxUy4o+0p6SCmWFg2BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mjxkZ-00FSrw-F3; Mon, 08 Nov 2021 06:03:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjxkU-00FSrG-6j
 for linux-mediatek@lists.infradead.org; Mon, 08 Nov 2021 06:03:21 +0000
X-UUID: fc177fc9b29e4e819cf6311d4211e56c-20211107
X-UUID: fc177fc9b29e4e819cf6311d4211e56c-20211107
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <deren.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 405795536; Sun, 07 Nov 2021 23:03:14 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 7 Nov 2021 21:58:04 -0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs10n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 8 Nov 2021 13:58:03 +0800
Message-ID: <8780cd7315953270b14d491dd426032a697fba0b.camel@mediatek.com>
Subject: Re: [PATCH] mt76: mt7921: introduce 160 MHz channel bandwidth support
From: Deren Wu <deren.wu@mediatek.com>
To: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
CC: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, "Soul
 Huang" <Soul.Huang@mediatek.com>, YN Chen <YN.Chen@mediatek.com>, Leon Yen
 <Leon.Yen@mediatek.com>, Eric-SY Chang <Eric-SY.Chang@mediatek.com>, KM Lin
 <km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>, CH Yeh
 <ch.yeh@mediatek.com>, Posh Sun <posh.sun@mediatek.com>, Eric Liang
 <Eric.Liang@mediatek.com>, Stella Chang <Stella.Chang@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, "Shayne
 Chen" <shayne.chen@mediatek.com>, linux-wireless
 <linux-wireless@vger.kernel.org>, linux-mediatek
 <linux-mediatek@lists.infradead.org>
Date: Mon, 8 Nov 2021 13:58:03 +0800
In-Reply-To: <YYeuMs+QD067Fc5R@lore-desk>
References: <d4e93e0ffa11d7126b2ab48a34d0b4a4a17f2134.1636207928.git.deren.wu@mediatek.com>
 <YYeuMs+QD067Fc5R@lore-desk>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211107_220318_308712_9B4F38B1 
X-CRM114-Status: GOOD (  19.87  )
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

Hi Lore,

The definition of cap->max_bw is identical to
ieee80211_sta_rx_bandwidth. For now, the value would be 
IEEE80211_STA_RX_BW_160 if the chip supports bw160.


Regards,
Deren

On Sun, 2021-11-07 at 11:45 +0100, Lorenzo Bianconi wrote:
> > From: Deren Wu <deren.wu@mediatek.com>
> > 
> > Introduce the basic configuration for chips with BW160 capability
> > 
> > Signed-off-by: Deren Wu <deren.wu@mediatek.com>
> > ---
> >  drivers/net/wireless/mediatek/mt76/mt76.h            |  1 +
> >  drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c |  1 +
> >  drivers/net/wireless/mediatek/mt76/mt7921/init.c     |  4 ++++
> >  drivers/net/wireless/mediatek/mt76/mt7921/main.c     | 12
> > ++++++++++++
> >  4 files changed, 18 insertions(+)
> > 
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h
> > b/drivers/net/wireless/mediatek/mt76/mt76.h
> > index e2da720a91b6..babca8086027 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt76.h
> > +++ b/drivers/net/wireless/mediatek/mt76/mt76.h
> > @@ -346,6 +346,7 @@ struct mt76_hw_cap {
> >  	bool has_2ghz;
> >  	bool has_5ghz;
> >  	bool has_6ghz;
> > +	bool has_bw160;
> >  };
> >  
> >  #define MT_DRV_TXWI_NO_FREE		BIT(0)
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> > b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> > index 26b4b875dcc0..4da20537aaf9 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> > +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> > @@ -1775,6 +1775,7 @@ static void
> > mt76_connac_mcu_parse_phy_cap(struct mt76_dev *dev,
> >  	dev->phy.chainmask = dev->phy.antenna_mask;
> >  	dev->phy.cap.has_2ghz = cap->hw_path & BIT(WF0_24G);
> >  	dev->phy.cap.has_5ghz = cap->hw_path & BIT(WF0_5G);
> > +	dev->phy.cap.has_bw160 = (cap->max_bw >=
> > IEEE80211_STA_RX_BW_160);
> 
> Hi Deren,
> 
> just out of my curiosity, what are the possible values of cap->max_bw 
> here?
> 
> Regards,
> Lorenzo
> 
> >  }
> >  
> >  int mt76_connac_mcu_get_nic_capability(struct mt76_phy *phy)
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
> > b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
> > index 210998f086ab..30c0246fba3a 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
> > +++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
> > @@ -264,6 +264,10 @@ int mt7921_register_device(struct mt7921_dev
> > *dev)
> >  			IEEE80211_VHT_CAP_SU_BEAMFORMEE_CAPABLE |
> >  			IEEE80211_VHT_CAP_MU_BEAMFORMEE_CAPABLE |
> >  			(3 << IEEE80211_VHT_CAP_BEAMFORMEE_STS_SHIFT);
> > +	if (dev->mt76.phy.cap.has_bw160)
> > +		dev->mphy.sband_5g.sband.vht_cap.cap |=
> > +			IEEE80211_VHT_CAP_SUPP_CHAN_WIDTH_160MHZ |
> > +			IEEE80211_VHT_CAP_SHORT_GI_160;
> >  
> >  	dev->mphy.hw->wiphy->available_antennas_rx = dev-
> > >mphy.chainmask;
> >  	dev->mphy.hw->wiphy->available_antennas_tx = dev-
> > >mphy.chainmask;
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> > b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> > index 633c6d2a57ac..af8c675f909f 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> > +++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> > @@ -128,11 +128,23 @@ mt7921_init_he_caps(struct mt7921_phy *phy,
> > enum nl80211_band band,
> >  				IEEE80211_HE_PHY_CAP9_RX_1024_QAM_LESS_
> > THAN_242_TONE_RU |
> >  				IEEE80211_HE_PHY_CAP9_RX_FULL_BW_SU_USI
> > NG_MU_WITH_COMP_SIGB |
> >  				IEEE80211_HE_PHY_CAP9_RX_FULL_BW_SU_USI
> > NG_MU_WITH_NON_COMP_SIGB;
> > +
> > +			if (phy->mt76->cap.has_bw160) {
> > +				he_cap_elem->phy_cap_info[0] |=
> > +					IEEE80211_HE_PHY_CAP0_CHANNEL_W
> > IDTH_SET_160MHZ_IN_5G;
> > +				he_cap_elem->phy_cap_info[8] |=
> > +					IEEE80211_HE_PHY_CAP8_20MHZ_IN_
> > 160MHZ_HE_PPDU |
> > +					IEEE80211_HE_PHY_CAP8_80MHZ_IN_
> > 160MHZ_HE_PPDU;
> > +			}
> >  			break;
> >  		}
> >  
> >  		he_mcs->rx_mcs_80 = cpu_to_le16(mcs_map);
> >  		he_mcs->tx_mcs_80 = cpu_to_le16(mcs_map);
> > +		if (phy->mt76->cap.has_bw160) {
> > +			he_mcs->rx_mcs_160 = cpu_to_le16(mcs_map);
> > +			he_mcs->tx_mcs_160 = cpu_to_le16(mcs_map);
> > +		}
> >  
> >  		memset(he_cap->ppe_thres, 0, sizeof(he_cap-
> > >ppe_thres));
> >  		if (he_cap_elem->phy_cap_info[6] &
> > -- 
> > 2.18.0
> > 
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
