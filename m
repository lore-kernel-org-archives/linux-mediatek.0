Return-Path: <SRS0=uv63=QA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72290C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Nov 2021 03:39:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2899B610FE
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Nov 2021 03:39:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2899B610FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5+qEeRVIYRVEVJ3o6w4j0YqtGbdF9/D+GDpBLSJ9LCI=; b=m7X219s86nUJxe
	Lab97jG5q2cSPEdN8KKCZCpEJ4ZMpfVHeeVeQnay8DL7IJ+epS4Rs4nIzcERYlLvpau4vF+XI5DV4
	pHnAYdUAMapBpH5eQF2V+owhkZw/AIXftessiz60bSxk+zd8lAdn073JVfkZDyPMSdU8FPgIwYDGo
	XXphqzzeVTNy6z5V2MV4zMmVAlhmlq9H3YThGU5btDK30+hFwW3cZxMpcDAj3o36w9ZFZr7hM3bTV
	caqyWJCbtyYgUhe+zaRExZ0/b/z/ZhxejUqgMFm9m+Pt784JVgZJ2sjdwepMDKzlAxLxrox6cV6UY
	V5LdxEGger3KK9YBysSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mljt7-00C790-JQ; Sat, 13 Nov 2021 03:39:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mljt4-00C78g-L3
 for linux-mediatek@lists.infradead.org; Sat, 13 Nov 2021 03:39:32 +0000
X-UUID: e248a207a1ed4dbf947ce56e16988a2a-20211112
X-UUID: e248a207a1ed4dbf947ce56e16988a2a-20211112
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <deren.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 725598267; Fri, 12 Nov 2021 20:39:24 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 12 Nov 2021 19:39:22 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 13 Nov 2021 11:39:14 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 13 Nov 2021 11:39:14 +0800
Message-ID: <6978659235747261d652379d7d1a823f6b2f6505.camel@mediatek.com>
Subject: Re: [PATCH v2] mt76: mt7921: introduce 160 MHz channel bandwidth
 support
From: Deren Wu <deren.wu@mediatek.com>
To: Ryder Lee <ryder.lee@mediatek.com>, Felix Fietkau <nbd@nbd.name>, "Lorenzo
 Bianconi" <lorenzo.bianconi@redhat.com>
CC: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>, 
 YN Chen <YN.Chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>, "Eric-SY
 Chang" <Eric-SY.Chang@mediatek.com>, KM Lin <km.lin@mediatek.com>,
 Robin Chiu
 <robin.chiu@mediatek.com>, CH Yeh <ch.yeh@mediatek.com>, Posh Sun
 <posh.sun@mediatek.com>, Eric Liang <Eric.Liang@mediatek.com>, Stella Chang
 <Stella.Chang@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, "Shayne
 Chen" <shayne.chen@mediatek.com>, linux-wireless
 <linux-wireless@vger.kernel.org>, linux-mediatek
 <linux-mediatek@lists.infradead.org>
Date: Sat, 13 Nov 2021 11:39:14 +0800
In-Reply-To: <c622447038b06d8a4068ec8126c7ec674fafe383.camel@mediatek.com>
References: <66edc3125e9a12dedeba1a61697d46322b0c004d.1636374449.git.deren.wu@mediatek.com>
 <c622447038b06d8a4068ec8126c7ec674fafe383.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211112_193930_753856_6FA5798D 
X-CRM114-Status: GOOD (  19.41  )
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

On Sat, 2021-11-13 at 03:12 +0800, Ryder Lee wrote:
> On Mon, 2021-11-08 at 22:41 +0800, Deren Wu wrote:
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
> > index 26b4b875dcc0..3b42e1e8e970 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> > +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> > @@ -1775,6 +1775,7 @@ static void
> > mt76_connac_mcu_parse_phy_cap(struct mt76_dev *dev,
> >  	dev->phy.chainmask = dev->phy.antenna_mask;
> >  	dev->phy.cap.has_2ghz = cap->hw_path & BIT(WF0_24G);
> >  	dev->phy.cap.has_5ghz = cap->hw_path & BIT(WF0_5G);
> > +	dev->phy.cap.has_bw160 = cap->max_bw ==
> > IEEE80211_STA_RX_BW_160;
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
> > > mphy.chainmask;
> > 
> >  	dev->mphy.hw->wiphy->available_antennas_tx = dev-
> > > mphy.chainmask;
> > 
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
> 
> But what about 80p80Mhz case?
> 
> Ryder
> 

Since 80p80MHz is not supprted in mt7921, we should not register this
capability to mac80211. When the feature coming, we may have a new
config cap.has_bw80p80 to adapte the new flow.

Regards,
Deren


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
