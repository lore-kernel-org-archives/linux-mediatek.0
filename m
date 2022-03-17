Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C92D4C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Mar 2022 07:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DbViITksLkDDJKgJCf9VvX4TIJJo71JD/MEpVI6DmLM=; b=W7qUY1fIh2VruE
	q58lMWbsqOasuvOZgAZhRsCzVvAJTjYmc/e3g6LvS1Gh+iOCYWoaO1OWaU9Ap85xx5gErrbRu+jpn
	KcirFfc3s3YNKeWtNyeQegv/n790mmqHcQQhEEtig5HVdv/7NshE4AXzB8F4C/jkN3qUzSnZKfy5L
	wPvAtg8dDLiCdcK7YILFBshj7HekmjHsFVxGOg7vltFNEhN9xClkwnw+VAMwR6EuSPSIXp+r0PDPr
	koIUr3kL22SBs6/HVN8r82olKstwjZhzqqi2DGqH8kzC3V057Nv0nUpcOJoxb0ekiih+ayzfmUpi1
	BqKZNW//L/P5E9BnT+OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUkJ8-00F7wk-Vb; Thu, 17 Mar 2022 07:12:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUkJ4-00F7vQ-DX
 for linux-mediatek@lists.infradead.org; Thu, 17 Mar 2022 07:12:25 +0000
X-UUID: 0dbf13885a4b4efaa0b6cbc8dadfc815-20220317
X-UUID: 0dbf13885a4b4efaa0b6cbc8dadfc815-20220317
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <deren.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 721298306; Thu, 17 Mar 2022 00:12:16 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Mar 2022 00:02:14 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 17 Mar 2022 15:02:13 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 17 Mar 2022 15:02:13 +0800
Message-ID: <ef6a0d876587e3efaa228f9d28f5a6f7b97e4aef.camel@mediatek.com>
Subject: Re: [PATCH] mt76: fix monitor rx FCS error in DFS channel
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
Date: Thu, 17 Mar 2022 15:02:13 +0800
In-Reply-To: <YjH/GCCfQoZ5OPPM@localhost.localdomain>
References: <7243650f3d51b1919bd4fd0017ff8b0186149e54.1647421054.git.deren.wu@mediatek.com>
 <YjH/GCCfQoZ5OPPM@localhost.localdomain>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_001222_495873_919CA596 
X-CRM114-Status: GOOD (  16.43  )
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

On Wed, 2022-03-16 at 16:15 +0100, Lorenzo Bianconi wrote:
> > From: Deren Wu <deren.wu@mediatek.com>
> > 
> > When setup monitor mode in DFS channel, mt76 send CH_SWITCH_DFS to
> > fw for channel config. This would cause rx performance bad while
> > monitoring frames. Settings CH_SWITCH_NORMAL in monitor mode would
> > get the same performance as normal channels.
> 
> Hi Deren,
> 
> > 
> > Reviewed-by: Shayne Chen <shayne.chen@mediatek.com>
> > Signed-off-by: Deren Wu <deren.wu@mediatek.com>
> > ---
> >  drivers/net/wireless/mediatek/mt76/mt7615/mcu.c | 3 ++-
> >  drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 3 ++-
> >  drivers/net/wireless/mediatek/mt76/mt7921/mcu.c | 3 ++-
> >  3 files changed, 6 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
> > b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
> > index 390add3144c2..97e2a85cb728 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
> > +++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
> > @@ -2151,7 +2151,8 @@ int mt7615_mcu_set_chan_info(struct
> > mt7615_phy *phy, int cmd)
> >  		.center_chan2 = ieee80211_frequency_to_channel(freq2),
> >  	};
> >  
> > -	if (cmd == MCU_EXT_CMD(SET_RX_PATH))
> > +	if (cmd == MCU_EXT_CMD(SET_RX_PATH) ||
> > +	    dev->mt76.hw->conf.flags & IEEE80211_CONF_MONITOR)
> 
> is this patch compliant with 802.11h DFS standard?

Monitor mode would not tx packets and still follow standard. We will
keep tracking this point to avoid violations.


Regards,
Deren


> 
> Regards,
> Lorenzo
> 
> >  		req.switch_reason = CH_SWITCH_NORMAL;
> >  	else if (phy->mt76->hw->conf.flags & IEEE80211_CONF_OFFCHANNEL)
> >  		req.switch_reason = CH_SWITCH_SCAN_BYPASS_DPD;
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
> > b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
> > index 10dc4bf5adec..c56d48342aaf 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
> > +++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
> > @@ -2833,7 +2833,8 @@ int mt7915_mcu_set_chan_info(struct
> > mt7915_phy *phy, int cmd)
> >  	}
> >  #endif
> >  
> > -	if (cmd == MCU_EXT_CMD(SET_RX_PATH))
> > +	if (cmd == MCU_EXT_CMD(SET_RX_PATH) ||
> > +	    dev->mt76.hw->conf.flags & IEEE80211_CONF_MONITOR)
> >  		req.switch_reason = CH_SWITCH_NORMAL;
> >  	else if (phy->mt76->hw->conf.flags & IEEE80211_CONF_OFFCHANNEL)
> >  		req.switch_reason = CH_SWITCH_SCAN_BYPASS_DPD;
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> > b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> > index 5ef8b24f0ab3..da2be050ed7c 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> > +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> > @@ -863,7 +863,8 @@ int mt7921_mcu_set_chan_info(struct mt7921_phy
> > *phy, int cmd)
> >  	else
> >  		req.channel_band = chandef->chan->band;
> >  
> > -	if (cmd == MCU_EXT_CMD(SET_RX_PATH))
> > +	if (cmd == MCU_EXT_CMD(SET_RX_PATH) ||
> > +	    dev->mt76.hw->conf.flags & IEEE80211_CONF_MONITOR)
> >  		req.switch_reason = CH_SWITCH_NORMAL;
> >  	else if (dev->mt76.hw->conf.flags & IEEE80211_CONF_OFFCHANNEL)
> >  		req.switch_reason = CH_SWITCH_SCAN_BYPASS_DPD;
> > -- 
> > 2.18.0
> > 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
