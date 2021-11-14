Return-Path: <SRS0=UFSY=QB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09988C433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Nov 2021 02:45:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFCA260FE8
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Nov 2021 02:45:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AFCA260FE8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UBmHm9rAqgj/pvlir7yhHISvTZLCHxqKrbb/HdFtfqQ=; b=db9+8c8w4LPJrZ
	NS0hd2/GTe9vDWyZV0S/GTS4LcXlJNCy3h3ETHZegZNyy9xKJM+X9Qhj/DjJMVmpQ/o/iy8mcTH2g
	J/RT7uksbbRD2nC9Myr9y3CUmCoPHNZZkS3YztoL533PmK2dbrv7sck7T+H84kuWBY6nmqv7VkFYB
	nKPaj+f2y3bI01tNGhRm9jsxwLfKwEC+BSgGZqA0p/9nBNzFMge9tw6WT1xj/R9jgheVCJwcF9ADc
	2LEVvc7TQKy+6Ubjld+UjUY4HZy/vbKMJWpFtZDlvzs3FLVZGM4i+bYsXYQS+qarQb+Z72otV3h84
	//ZmkYdF7l5gVdvIsW8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mm5VY-00DGwx-Uz; Sun, 14 Nov 2021 02:44:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mm5VV-00DGw5-CD
 for linux-mediatek@lists.infradead.org; Sun, 14 Nov 2021 02:44:40 +0000
X-UUID: 589c784897eb42a98e68db2644764c73-20211113
X-UUID: 589c784897eb42a98e68db2644764c73-20211113
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <deren.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 800397064; Sat, 13 Nov 2021 19:44:33 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 13 Nov 2021 18:34:31 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 14 Nov 2021 10:34:29 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 14 Nov 2021 10:34:29 +0800
Message-ID: <9385a730618c9c3f09120313280cdeb0b10154a2.camel@mediatek.com>
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
Date: Sun, 14 Nov 2021 10:34:29 +0800
In-Reply-To: <ee169af76f1d45b6178204585489c187dae97757.camel@mediatek.com>
References: <66edc3125e9a12dedeba1a61697d46322b0c004d.1636374449.git.deren.wu@mediatek.com>
 <c622447038b06d8a4068ec8126c7ec674fafe383.camel@mediatek.com>
 <6978659235747261d652379d7d1a823f6b2f6505.camel@mediatek.com>
 <ee169af76f1d45b6178204585489c187dae97757.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211113_184437_462500_845B9EB1 
X-CRM114-Status: GOOD (  22.83  )
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

Hi Ryder,

On Sat, 2021-11-13 at 12:08 +0800, Ryder Lee wrote:
> On Sat, 2021-11-13 at 11:39 +0800, Deren Wu wrote:
> > On Sat, 2021-11-13 at 03:12 +0800, Ryder Lee wrote:
> > > On Mon, 2021-11-08 at 22:41 +0800, Deren Wu wrote:
> > > > From: Deren Wu <deren.wu@mediatek.com>
> > > > 
> > > > Introduce the basic configuration for chips with BW160
> > > > capability
> > > > 
> > > > Signed-off-by: Deren Wu <deren.wu@mediatek.com>
> > > > ---
> > > >  drivers/net/wireless/mediatek/mt76/mt76.h            |  1 +
> > > >  drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c |  1 +
> > > >  drivers/net/wireless/mediatek/mt76/mt7921/init.c     |  4 ++++
> > > >  drivers/net/wireless/mediatek/mt76/mt7921/main.c     | 12
> > > > ++++++++++++
> > > >  4 files changed, 18 insertions(+)
> > > > 
> > > > diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h
> > > > b/drivers/net/wireless/mediatek/mt76/mt76.h
> > > > index e2da720a91b6..babca8086027 100644
> > > > --- a/drivers/net/wireless/mediatek/mt76/mt76.h
> > > > +++ b/drivers/net/wireless/mediatek/mt76/mt76.h
> > > > @@ -346,6 +346,7 @@ struct mt76_hw_cap {
> > > >  	bool has_2ghz;
> > > >  	bool has_5ghz;
> > > >  	bool has_6ghz;
> > > > +	bool has_bw160;
> > > >  };
> > > >  
> > > >  #define MT_DRV_TXWI_NO_FREE		BIT(0)
> > > > diff --git
> > > > a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> > > > b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> > > > index 26b4b875dcc0..3b42e1e8e970 100644
> > > > --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> > > > +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> > > > @@ -1775,6 +1775,7 @@ static void
> > > > mt76_connac_mcu_parse_phy_cap(struct mt76_dev *dev,
> > > >  	dev->phy.chainmask = dev->phy.antenna_mask;
> > > >  	dev->phy.cap.has_2ghz = cap->hw_path & BIT(WF0_24G);
> > > >  	dev->phy.cap.has_5ghz = cap->hw_path & BIT(WF0_5G);
> > > > +	dev->phy.cap.has_bw160 = cap->max_bw ==
> > > > IEEE80211_STA_RX_BW_160;
> > > >  }
> > > >  
> > > >  int mt76_connac_mcu_get_nic_capability(struct mt76_phy *phy)
> > > > diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
> > > > b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
> > > > index 210998f086ab..30c0246fba3a 100644
> > > > --- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
> > > > +++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
> > > > @@ -264,6 +264,10 @@ int mt7921_register_device(struct
> > > > mt7921_dev
> > > > *dev)
> > > >  			IEEE80211_VHT_CAP_SU_BEAMFORMEE_CAPABLE
> > > > |
> > > >  			IEEE80211_VHT_CAP_MU_BEAMFORMEE_CAPABLE
> > > > |
> > > >  			(3 <<
> > > > IEEE80211_VHT_CAP_BEAMFORMEE_STS_SHIFT);
> > > > +	if (dev->mt76.phy.cap.has_bw160)
> > > > +		dev->mphy.sband_5g.sband.vht_cap.cap |=
> > > > +			IEEE80211_VHT_CAP_SUPP_CHAN_WIDTH_160MH
> > > > Z |
> > > > +			IEEE80211_VHT_CAP_SHORT_GI_160;
> > > >  
> > > >  	dev->mphy.hw->wiphy->available_antennas_rx = dev-
> > > > > mphy.chainmask;
> > > > 
> > > >  	dev->mphy.hw->wiphy->available_antennas_tx = dev-
> > > > > mphy.chainmask;
> > > > 
> > > > diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> > > > b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> > > > index 633c6d2a57ac..af8c675f909f 100644
> > > > --- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> > > > +++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> > > > @@ -128,11 +128,23 @@ mt7921_init_he_caps(struct mt7921_phy
> > > > *phy,
> > > > enum nl80211_band band,
> > > >  				IEEE80211_HE_PHY_CAP9_RX_1024_Q
> > > > AM_LESS_
> > > > THAN_242_TONE_RU |
> > > >  				IEEE80211_HE_PHY_CAP9_RX_FULL_B
> > > > W_SU_USI
> > > > NG_MU_WITH_COMP_SIGB |
> > > >  				IEEE80211_HE_PHY_CAP9_RX_FULL_B
> > > > W_SU_USI
> > > > NG_MU_WITH_NON_COMP_SIGB;
> > > > +
> > > > +			if (phy->mt76->cap.has_bw160) {
> > > > +				he_cap_elem->phy_cap_info[0] |=
> > > > +					IEEE80211_HE_PHY_CAP0_C
> > > > HANNEL_W
> > > > IDTH_SET_160MHZ_IN_5G;
> > > > +				he_cap_elem->phy_cap_info[8] |=
> > > > +					IEEE80211_HE_PHY_CAP8_2
> > > > 0MHZ_IN_
> > > > 160MHZ_HE_PPDU |
> > > > +					IEEE80211_HE_PHY_CAP8_8
> > > > 0MHZ_IN_
> > > > 160MHZ_HE_PPDU;
> > > > +			}
> > > >  			break;
> > > >  		}
> > > >  
> > > >  		he_mcs->rx_mcs_80 = cpu_to_le16(mcs_map);
> > > >  		he_mcs->tx_mcs_80 = cpu_to_le16(mcs_map);
> > > > +		if (phy->mt76->cap.has_bw160) {
> > > > +			he_mcs->rx_mcs_160 =
> > > > cpu_to_le16(mcs_map);
> > > > +			he_mcs->tx_mcs_160 =
> > > > cpu_to_le16(mcs_map);
> > > > +		}
> > > >  
> > > 
> > > But what about 80p80Mhz case?
> > > 
> > > Ryder
> > > 
> > 
> > Since 80p80MHz is not supprted in mt7921, we should not register
> > this
> > capability to mac80211. When the feature coming, we may have a new
> > config cap.has_bw80p80 to adapte the new flow.
> > 
> 
> Then, how to tell 80p80M and 160M apart with only checking
> IEEE80211_STA_RX_BW_160? 
> 
>  * @IEEE80211_STA_RX_BW_160: station can receive up to 160 MHz
>  *	(including 80+80 MHz)
> 
> Maybe move has_bw80p80 into mt7921_dev as it is not generic to me?
> 

As you noted, both 80p80M and 160M are included in
IEEE80211_STA_RX_BW_160. We may not check two features
by IEEE80211_STA_RX_BW_160 only. That is why I prefer to have
.has_bw160 and .has_80p80 at next stage.

With the new feature, HW should report different result in the flow of 
chip capability check. The check point should start from
mt76_connac_mcu_parse_XXXX_cap() and then we can know the real
capabilities of this HW chip.


Regards,
Deren


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
