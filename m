Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 043EDC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Feb 2022 06:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v+RtvFbmZFDW5ZgLcFHwywByZ9PIjglNSdIyjxoYv7g=; b=SgWP8/a8CGAVnD
	gqhprFq/BeEF2eYsTKW5ZxEoTGB/4XU5dfLBhm8cMoovxbbqKwH6uUSDq80DYjNAX5dBWoG0quGs7
	Z37mW4fGoW6Yn8JaMEciRC5kh2blXXGEw0Hkgdjs+G39+tKedyu2lCg2KgQ5qBxgGlwRRCatoM7Q3
	JQ+Gn9/+Q9EWk/Td/9Wilr7iirJrr25OqmQ7SImFDd+FsFZVBw0zXdE8lk1a60MAlcb4Tews+eEa0
	9f4YXQh5Thsaup2W4BBm53WQw15BERxXIhy9pkxkuVQPc2XnTrO5fgnV1EuoD1luuRVDQN72V1cXY
	8eFat941cWc54+cK6eZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nN81F-00H4KG-Ik; Thu, 24 Feb 2022 06:54:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nN81A-00H4Jb-Tg
 for linux-mediatek@lists.infradead.org; Thu, 24 Feb 2022 06:54:28 +0000
X-UUID: 8c0bc750f825425499bc9f081bc64dc1-20220223
X-UUID: 8c0bc750f825425499bc9f081bc64dc1-20220223
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <deren.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 251131709; Wed, 23 Feb 2022 23:54:18 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Feb 2022 22:54:16 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Feb 2022 14:54:15 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 24 Feb 2022 14:54:15 +0800
Message-ID: <a6028f182af4df4e99f522bcc148cc872a1a8adf.camel@mediatek.com>
Subject: Re: [PATCH 1/2] mt76: mt7921: fix up the monitor mode
From: Deren Wu <deren.wu@mediatek.com>
To: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, <sean.wang@mediatek.com>
CC: <nbd@nbd.name>, <Soul.Huang@mediatek.com>, <YN.Chen@mediatek.com>,
 <Leon.Yen@mediatek.com>, <Eric-SY.Chang@mediatek.com>,
 <Mark-YW.Chen@mediatek.com>, <km.lin@mediatek.com>,
 <jenhao.yang@mediatek.com>, <robin.chiu@mediatek.com>,
 <Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
 <ted.huang@mediatek.com>, <Eric.Liang@mediatek.com>,
 <Stella.Chang@mediatek.com>, <Tom.Chou@mediatek.com>,
 <steve.lee@mediatek.com>, <jsiuda@google.com>, <frankgor@google.com>,
 <jemele@google.com>, <abhishekpandit@google.com>, <shawnku@google.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Date: Thu, 24 Feb 2022 14:54:15 +0800
In-Reply-To: <Yha9dZyAg8UE1UTb@lore-desk>
References: <7dcfc62d67f1f51e6627cc24000393844aa2b649.1645655280.git.objelf@gmail.com>
 <Yha9dZyAg8UE1UTb@lore-desk>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_225425_005301_9C513DFD 
X-CRM114-Status: GOOD (  24.79  )
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

On Thu, 2022-02-24 at 00:04 +0100, Lorenzo Bianconi wrote:
> > From: Sean Wang <sean.wang@mediatek.com>
> > 
> > Properly set up the monitor mode the firmware can support to fix up
> > RTS/CTS and beacon frames cannot be captured and forwarded to the
> > host.

With this patch, RTS/CTS and beacon can show up in host capture.

Tested-by: Deren Wu <deren.wu@mediatek.com>


Regards,
Deren

> > 
> > Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> > ---
> >  .../wireless/mediatek/mt76/mt76_connac_mcu.c  | 31
> > +++++++++++++++++++
> >  .../wireless/mediatek/mt76/mt76_connac_mcu.h  |  3 ++
> >  .../net/wireless/mediatek/mt76/mt7921/main.c  | 23 ++++++++------
> >  3 files changed, 47 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> > b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> > index 0a646ae51c8d..dded8a7d3efc 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> > +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> > @@ -2784,5 +2784,36 @@ int mt76_connac_mcu_rdd_cmd(struct mt76_dev
> > *dev, int cmd, u8 index,
> >  }
> >  EXPORT_SYMBOL_GPL(mt76_connac_mcu_rdd_cmd);
> >  
> > +int mt76_connac_mcu_set_sniffer(struct mt76_dev *dev, struct
> > ieee80211_vif *vif,
> > +				bool enable)
> 
> Hi Sean,
> 
> can this fw mcu be used with mt7663 fw? If not I guess we should move
> it in
> mt7921/mcu.c
> 
> > +{
> > +	struct mt76_vif *mvif = (struct mt76_vif *)vif->drv_priv;
> > +	struct {
> > +		struct {
> > +			u8 band_idx;
> > +			u8 pad[3];
> > +		} __packed hdr;
> > +		struct sniffer_enable_tlv {
> > +			__le16 tag;
> > +			__le16 len;
> > +			u8 enable;
> > +			u8 pad[3];
> > +		} __packed enable;
> > +		} req = {
> 
> nit: alignment.
> 
> Regards,
> Lorenzo
> 
> > +		.hdr = {
> > +			.band_idx = mvif->band_idx,
> > +		},
> > +		.enable = {
> > +			.tag = cpu_to_le16(0),
> > +			.len = cpu_to_le16(sizeof(struct
> > sniffer_enable_tlv)),
> > +			.enable = enable,
> > +		},
> > +	};
> > +
> > +	return mt76_mcu_send_msg(dev, MCU_UNI_CMD(SNIFFER), &req,
> > sizeof(req),
> > +				 true);
> > +}
> > +EXPORT_SYMBOL_GPL(mt76_connac_mcu_set_sniffer);
> > +
> >  MODULE_AUTHOR("Lorenzo Bianconi <lorenzo@kernel.org>");
> >  MODULE_LICENSE("Dual BSD/GPL");
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> > b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> > index 384c3eab1c8a..96ab1a55af17 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> > +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> > @@ -993,6 +993,7 @@ enum {
> >  	MCU_UNI_CMD_SUSPEND = 0x05,
> >  	MCU_UNI_CMD_OFFLOAD = 0x06,
> >  	MCU_UNI_CMD_HIF_CTRL = 0x07,
> > +	MCU_UNI_CMD_SNIFFER = 0x24,
> >  };
> >  
> >  enum {
> > @@ -1653,4 +1654,6 @@ int mt76_connac_mcu_set_pm(struct mt76_dev
> > *dev, int band, int enter);
> >  int mt76_connac_mcu_restart(struct mt76_dev *dev);
> >  int mt76_connac_mcu_rdd_cmd(struct mt76_dev *dev, int cmd, u8
> > index,
> >  			    u8 rx_sel, u8 val);
> > +int mt76_connac_mcu_set_sniffer(struct mt76_dev *dev, struct
> > ieee80211_vif *vif,
> > +				bool enable);
> >  #endif /* __MT76_CONNAC_MCU_H */
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> > b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> > index b6e836a4fad7..051a573141f4 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> > +++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> > @@ -479,6 +479,16 @@ mt7921_pm_interface_iter(void *priv, u8 *mac,
> > struct ieee80211_vif *vif)
> >  	mt7921_mcu_set_beacon_filter(dev, vif, dev->pm.enable);
> >  }
> >  
> > +static void
> > +mt7921_sniffer_interface_iter(void *priv, u8 *mac, struct
> > ieee80211_vif *vif)
> > +{
> > +	struct mt7921_dev *dev = priv;
> > +	struct ieee80211_hw *hw = mt76_hw(dev);
> > +	bool enabled = !!(hw->conf.flags & IEEE80211_CONF_MONITOR);
> > +
> > +	mt76_connac_mcu_set_sniffer(&dev->mt76, vif, enabled);
> > +}
> > +
> >  void mt7921_set_runtime_pm(struct mt7921_dev *dev)
> >  {
> >  	struct ieee80211_hw *hw = dev->mphy.hw;
> > @@ -516,16 +526,9 @@ static int mt7921_config(struct ieee80211_hw
> > *hw, u32 changed)
> >  	}
> >  
> >  	if (changed & IEEE80211_CONF_CHANGE_MONITOR) {
> > -		bool enabled = !!(hw->conf.flags &
> > IEEE80211_CONF_MONITOR);
> > -
> > -		if (!enabled)
> > -			phy->rxfilter |= MT_WF_RFCR_DROP_OTHER_UC;
> > -		else
> > -			phy->rxfilter &= ~MT_WF_RFCR_DROP_OTHER_UC;
> > -
> > -		mt76_rmw_field(dev, MT_DMA_DCR0(0),
> > MT_DMA_DCR0_RXD_G5_EN,
> > -			       enabled);
> > -		mt76_wr(dev, MT_WF_RFCR(0), phy->rxfilter);
> > +		ieee80211_iterate_active_interfaces(hw,
> > +						    IEEE80211_IFACE_ITE
> > R_RESUME_ALL,
> > +						    mt7921_sniffer_inte
> > rface_iter, dev);
> >  		mt7921_set_runtime_pm(dev);
> >  	}
> >  
> > -- 
> > 2.25.1
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
