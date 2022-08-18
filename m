Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44E5AC25B08
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Aug 2022 00:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LDO0nf0bqN0kL+U6CtngrHayPVEZs1x5m2n7lo+3rf0=; b=FFsvBkgJqMVL2UV3YlIPvFkswh
	ed4O439Zxy75riwUX3GvHDhDhl3mokCjsyrewEX0pxo4PrUmI5Z0D3H7h7jLbTAvorxRZfpkjEqnW
	3z6sg9y3Ly1qM8yfPna3bY8J3KkG7BPuTI39fj5rUw3dyLxvsk74HVvu54AcleQWM7qoAjgjo7JeA
	RyeloQaS9QjFombvvxfK2FpJM5bBD7Be4g/jqya09BaXgm91LttIZkbDSUgO0KFMRIOCJJFwfgwpx
	mm7krTxCB3lOCPw1MyvT4wxw+kyuFOHyjkVK3aTJbAZaZ7KG5ufKCdthlZdUp/uq5SP57r09JfpdF
	/SzEyohw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOTXI-009NeS-2S; Thu, 18 Aug 2022 00:37:24 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOTXF-009NaC-4g
	for linux-mediatek@lists.infradead.org; Thu, 18 Aug 2022 00:37:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 74DFEB81FF1
	for <linux-mediatek@lists.infradead.org>; Thu, 18 Aug 2022 00:37:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28BB6C43470
	for <linux-mediatek@lists.infradead.org>; Thu, 18 Aug 2022 00:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660783038;
	bh=sqrf6ILOeZgVXqHyzmKhXqiXeYXgKNi2/gRBPJekHxw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sh3+IzlcRMm3r6blzqkEVpnl0P/61uqQb12uVTDqMEPDbvpht+rCbfFmsdO39knlf
	 W+mb8UB31dFjm5GqwF9sgITDRwLFtfoMS4DGkrd2FzXNYVb0r0OkLi5ddZdwv4XnWl
	 JHl1KQBDkzP+vhLce91atunrUkRySH5bcvcya7JJRsbQQqQwAsn/K0xPWJ1zlZoc4Z
	 J6M1rK6DtVC/MtKqhP0Vp9P8lFsqDSapZENl1dHWrQ7Z9RZsBml6T9yUs143vLo8n8
	 Lgzr6m4Gis4v4YpJXsgrm8p9gQ17egIjV5idme5tEpRBlo0pUDmIfnnl421yug2+H+
	 2DX0pjTWp0YmQ==
Received: by mail-wr1-f52.google.com with SMTP id n4so17896811wrp.10
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Aug 2022 17:37:18 -0700 (PDT)
X-Gm-Message-State: ACgBeo23NP74B0+aQgK3g9UOsxdSN93ukLUItGi8xwa+HwlhWoXm6a6A
	1T+zxeN51UUDw/C6ryMmZD4qwI+NOP8rQI9dwRE=
X-Google-Smtp-Source: AA6agR5xsIFI1USa5PjdNbqAS0vT7kQ/J8FfJOAnhE5Mjrb9dxBfSY+h+4b3+e/FTNjaVts4HJbaFBS8Nb/aA8SDSlc=
X-Received: by 2002:a5d:6f08:0:b0:21e:cfc7:bfd1 with SMTP id
 ay8-20020a5d6f08000000b0021ecfc7bfd1mr209169wrb.329.1660783036256; Wed, 17
 Aug 2022 17:37:16 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1660606893.git.objelf@gmail.com> <3cf2e1a9658e971392b9b42f05f7b2a36815c7af.1660606893.git.objelf@gmail.com>
 <YvyXu4jejY7JOnhn@lore-desk>
In-Reply-To: <YvyXu4jejY7JOnhn@lore-desk>
From: Sean Wang <sean.wang@kernel.org>
Date: Wed, 17 Aug 2022 17:37:04 -0700
X-Gmail-Original-Message-ID: <CAGp9LzqecHa4DzAcugth4EOua8n-tPnS4TmgijETMxkT7fn8gQ@mail.gmail.com>
Message-ID: <CAGp9LzqecHa4DzAcugth4EOua8n-tPnS4TmgijETMxkT7fn8gQ@mail.gmail.com>
Subject: Re: [PATCH 9/9] wifi: mt76: mt7921: introduce chanctx support
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: =?UTF-8?B?U2VhbiBXYW5nICjnjovlv5fkupgp?= <sean.wang@mediatek.com>, 
	Felix Fietkau <nbd@nbd.name>, lorenzo.bianconi@redhat.com, Soul.Huang@mediatek.com, 
	YN.Chen@mediatek.com, Leon.Yen@mediatek.com, Eric-SY.Chang@mediatek.com, 
	Deren Wu <Deren.Wu@mediatek.com>, km.lin@mediatek.com, jenhao.yang@mediatek.com, 
	robin.chiu@mediatek.com, Eddie.Chen@mediatek.com, ch.yeh@mediatek.com, 
	posh.sun@mediatek.com, ted.huang@mediatek.com, Stella.Chang@mediatek.com, 
	Tom.Chou@mediatek.com, steve.lee@mediatek.com, jsiuda@google.com, 
	frankgor@google.com, kuabhs@google.com, druth@google.com, 
	abhishekpandit@google.com, shawnku@google.com, linux-wireless@vger.kernel.org, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_173721_542680_1E8A5C00 
X-CRM114-Status: GOOD (  38.75  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Aug 17, 2022 at 12:42 AM Lorenzo Bianconi <lorenzo@kernel.org> wrote:
>
> > From: Sean Wang <sean.wang@mediatek.com>
> >
> > The firmware can have the capability to manage the channel context
> > scheduling on multiple roles running on the device including Station,
> > AP and P2P GC/GO mode (will be extended based on the patchset) to help
> > users sharing the network with others on a single device.
> >
> > The firmware is able to support the channel chanctx up to 2 interface
> > simultaneously running on the different channels.
> >
> > Another thing to be noted is that before the driver is going sent out the
> > management frames, the driver has to get the privilege from the firmware
> > to occupy the current channel context until the frame handshake is
> > completed and then get the privilege back to the firmware.
> >
> > We temporarily disable the feature with a module parameter
> > mt7921_disable_cnm for a while until we can ensure the patchset doesn't
> > cause any regression.
> >
> > Co-developed-by: Deren Wu <deren.wu@mediatek.com>
> > Signed-off-by: Deren Wu <deren.wu@mediatek.com>
> > Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> > ---
> >  .../net/wireless/mediatek/mt76/mt7921/init.c  |  40 ++++++-
> >  .../net/wireless/mediatek/mt76/mt7921/main.c  | 111 +++++++++++++++++-
> >  .../wireless/mediatek/mt76/mt7921/mt7921.h    |   1 +
> >  3 files changed, 145 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
> > index 1b7a18d42f5b..208a6117cb69 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
> > +++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
> > @@ -7,6 +7,10 @@
> >  #include "mcu.h"
> >  #include "eeprom.h"
> >
> > +static bool mt7921_disable_cnm = true;
> > +module_param_named(disable_cnm, mt7921_disable_cnm, bool, 0644);
> > +MODULE_PARM_DESC(disable_cnm, "disable concurrent network support");
>
> do we need it? I guess we can just leave it enabled by default and disable it
> through a debugfs node. What do you think?

The kernel parameter would be checked before registering ops to
mac80211, it seemed to me the way debugfs node doesn't work for that
moment.

>
> > +
> >  static const struct ieee80211_iface_limit if_limits[] = {
> >       {
> >               .max = MT7921_MAX_INTERFACES,
> > @@ -25,6 +29,27 @@ static const struct ieee80211_iface_combination if_comb[] = {
> >               .max_interfaces = MT7921_MAX_INTERFACES,
> >               .num_different_channels = 1,
> >               .beacon_int_infra_match = true,
> > +     },
> > +};
> > +
> > +static const struct ieee80211_iface_limit if_limits_chanctx[] = {
> > +     {
> > +             .max = 2,
> > +             .types = BIT(NL80211_IFTYPE_STATION),
> > +     },
> > +     {
> > +             .max = 1,
> > +             .types = BIT(NL80211_IFTYPE_AP),
> > +     }
> > +};
> > +
> > +static const struct ieee80211_iface_combination if_comb_chanctx[] = {
> > +     {
> > +             .limits = if_limits_chanctx,
> > +             .n_limits = ARRAY_SIZE(if_limits_chanctx),
> > +             .max_interfaces = 2,
> > +             .num_different_channels = 2,
> > +             .beacon_int_infra_match = false,
> >       }
> >  };
> >
> > @@ -63,11 +88,20 @@ static int mt7921_check_offload_capability(struct mt7921_dev *dev)
> >       fw_can_roc =  mktime64(year, mon, day, hour, min, sec) >=
> >                     mktime64(2022, 7, 15, 12, 1, 1);
> >  out:
> > -     if (!fw_can_roc) {
> > +     if (!fw_can_roc || mt7921_disable_cnm) {
> >               dev->ops->remain_on_channel = NULL;
> >               dev->ops->cancel_remain_on_channel = NULL;
> > +             dev->ops->add_chanctx = NULL;
> > +             dev->ops->remove_chanctx = NULL;
> > +             dev->ops->change_chanctx = NULL;
> > +             dev->ops->assign_vif_chanctx = NULL;
> > +             dev->ops->unassign_vif_chanctx = NULL;
> > +             dev->ops->mgd_prepare_tx = NULL;
> > +             dev->ops->mgd_complete_tx = NULL;
> >
> >               wiphy->flags &= ~WIPHY_FLAG_HAS_REMAIN_ON_CHANNEL;
> > +             wiphy->iface_combinations = if_comb;
> > +             wiphy->n_iface_combinations = ARRAY_SIZE(if_comb);
> >       }
> >
> >       return 0;
> > @@ -93,12 +127,12 @@ mt7921_init_wiphy(struct ieee80211_hw *hw)
> >       hw->sta_data_size = sizeof(struct mt7921_sta);
> >       hw->vif_data_size = sizeof(struct mt7921_vif);
> >
> > -     wiphy->iface_combinations = if_comb;
> > +     wiphy->iface_combinations = if_comb_chanctx;
> >       wiphy->flags &= ~(WIPHY_FLAG_IBSS_RSN | WIPHY_FLAG_4ADDR_AP |
> >                         WIPHY_FLAG_4ADDR_STATION);
> >       wiphy->interface_modes = BIT(NL80211_IFTYPE_STATION) |
> >                                BIT(NL80211_IFTYPE_AP);
> > -     wiphy->n_iface_combinations = ARRAY_SIZE(if_comb);
> > +     wiphy->n_iface_combinations = ARRAY_SIZE(if_comb_chanctx);
> >       wiphy->max_remain_on_channel_duration = 5000;
> >       wiphy->max_scan_ie_len = MT76_CONNAC_SCAN_IE_LEN;
> >       wiphy->max_scan_ssids = 4;
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> > index ae0aabe052e3..6386290ba71c 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> > +++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> > @@ -858,7 +858,7 @@ void mt7921_mac_sta_assoc(struct mt76_dev *mdev, struct ieee80211_vif *vif,
> >
> >       if (vif->type == NL80211_IFTYPE_STATION && !sta->tdls)
> >               mt76_connac_mcu_uni_add_bss(&dev->mphy, vif, &mvif->sta.wcid,
> > -                                         true, NULL);
> > +                                         true, mvif->ctx);
> >
> >       mt7921_mac_wtbl_update(dev, msta->wcid.idx,
> >                              MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
> > @@ -890,7 +890,7 @@ void mt7921_mac_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *vif,
> >               if (!sta->tdls)
> >                       mt76_connac_mcu_uni_add_bss(&dev->mphy, vif,
> >                                                   &mvif->sta.wcid, false,
> > -                                                 NULL);
> > +                                                 mvif->ctx);
> >       }
> >
> >       spin_lock_bh(&dev->sta_poll_lock);
> > @@ -1640,7 +1640,7 @@ mt7921_start_ap(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
> >       mt7921_mutex_acquire(dev);
> >
> >       err = mt76_connac_mcu_uni_add_bss(phy->mt76, vif, &mvif->sta.wcid,
> > -                                       true, NULL);
> > +                                       true, mvif->ctx);
> >       if (err)
> >               goto failed;
> >
> > @@ -1672,12 +1672,108 @@ mt7921_stop_ap(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
> >               goto failed;
> >
> >       mt76_connac_mcu_uni_add_bss(phy->mt76, vif, &mvif->sta.wcid, false,
> > -                                 NULL);
> > +                                 mvif->ctx);
> >
> >  failed:
> >       mt7921_mutex_release(dev);
> >  }
> >
> > +static int
> > +mt7921_add_chanctx(struct ieee80211_hw *hw,
> > +                struct ieee80211_chanctx_conf *ctx)
> > +{
> > +     return 0;
> > +}
> > +
> > +static void
> > +mt7921_remove_chanctx(struct ieee80211_hw *hw,
> > +                   struct ieee80211_chanctx_conf *ctx)
> > +{
> > +}
> > +
> > +static void mt7921_ctx_iter(void *priv, u8 *mac,
> > +                         struct ieee80211_vif *vif)
> > +{
> > +     struct mt7921_vif *mvif = (struct mt7921_vif *)vif->drv_priv;
> > +     struct ieee80211_chanctx_conf *ctx = priv;
> > +
> > +     if (ctx != mvif->ctx)
> > +             return;
> > +
> > +     mt76_connac_mcu_uni_set_chctx(mvif->phy->mt76, &mvif->mt76, ctx);
> > +}
> > +
> > +static void
> > +mt7921_change_chanctx(struct ieee80211_hw *hw,
> > +                   struct ieee80211_chanctx_conf *ctx,
> > +                   u32 changed)
> > +{
> > +     struct mt7921_phy *phy = mt7921_hw_phy(hw);
> > +
> > +     mt7921_mutex_acquire(phy->dev);
> > +     ieee80211_iterate_active_interfaces(phy->mt76->hw,
> > +                                         IEEE80211_IFACE_ITER_ACTIVE,
> > +                                         mt7921_ctx_iter, ctx);
> > +     mt7921_mutex_release(phy->dev);
> > +}
> > +
> > +static int
> > +mt7921_assign_vif_chanctx(struct ieee80211_hw *hw,
> > +                       struct ieee80211_vif *vif,
> > +                       struct ieee80211_bss_conf *link_conf,
> > +                       struct ieee80211_chanctx_conf *ctx)
> > +{
> > +     struct mt7921_vif *mvif = (struct mt7921_vif *)vif->drv_priv;
> > +     struct mt7921_dev *dev = mt7921_hw_dev(hw);
> > +
> > +     mt7921_mutex_acquire(dev);
>
> I think in this case we can just grub the mutex without waking up the device.
> what do you think?

ack

>
> > +     mvif->ctx = ctx;
> > +     mt7921_mutex_release(dev);
> > +
> > +     return 0;
> > +}
> > +
> > +static void
> > +mt7921_unassign_vif_chanctx(struct ieee80211_hw *hw,
> > +                         struct ieee80211_vif *vif,
> > +                         struct ieee80211_bss_conf *link_conf,
> > +                         struct ieee80211_chanctx_conf *ctx)
> > +{
> > +     struct mt7921_vif *mvif = (struct mt7921_vif *)vif->drv_priv;
> > +     struct mt7921_dev *dev = mt7921_hw_dev(hw);
> > +
> > +     mt7921_mutex_acquire(dev);
>
> same here.

ack

>
> Regards,
> Lorenzo
>
> > +     mvif->ctx = NULL;
> > +     mt7921_mutex_release(dev);
> > +}
> > +
> > +static void mt7921_mgd_prepare_tx(struct ieee80211_hw *hw,
> > +                               struct ieee80211_vif *vif,
> > +                               struct ieee80211_prep_tx_info *info)
> > +{
> > +     struct mt7921_vif *mvif = (struct mt7921_vif *)vif->drv_priv;
> > +     struct mt7921_dev *dev = mt7921_hw_dev(hw);
> > +     u16 duration = info->duration ? info->duration :
> > +                    jiffies_to_msecs(HZ);
> > +
> > +     mt7921_mutex_acquire(dev);
> > +     mt7921_set_roc(mvif->phy, mvif, mvif->ctx->def.chan, duration,
> > +                    MT7921_ROC_REQ_JOIN);
> > +     mt7921_mutex_release(dev);
> > +}
> > +
> > +static void mt7921_mgd_complete_tx(struct ieee80211_hw *hw,
> > +                                struct ieee80211_vif *vif,
> > +                                struct ieee80211_prep_tx_info *info)
> > +{
> > +     struct mt7921_vif *mvif = (struct mt7921_vif *)vif->drv_priv;
> > +     struct mt7921_dev *dev = mt7921_hw_dev(hw);
> > +
> > +     mt7921_mutex_acquire(dev);
> > +     mt7921_abort_roc(mvif->phy, mvif);
> > +     mt7921_mutex_release(dev);
> > +}
> > +
> >  const struct ieee80211_ops mt7921_ops = {
> >       .tx = mt7921_tx,
> >       .start = mt7921_start,
> > @@ -1730,6 +1826,13 @@ const struct ieee80211_ops mt7921_ops = {
> >       .set_sar_specs = mt7921_set_sar_specs,
> >       .remain_on_channel = mt7921_remain_on_channel,
> >       .cancel_remain_on_channel = mt7921_cancel_remain_on_channel,
> > +     .add_chanctx = mt7921_add_chanctx,
> > +     .remove_chanctx = mt7921_remove_chanctx,
> > +     .change_chanctx = mt7921_change_chanctx,
> > +     .assign_vif_chanctx = mt7921_assign_vif_chanctx,
> > +     .unassign_vif_chanctx = mt7921_unassign_vif_chanctx,
> > +     .mgd_prepare_tx = mt7921_mgd_prepare_tx,
> > +     .mgd_complete_tx = mt7921_mgd_complete_tx,
> >  };
> >  EXPORT_SYMBOL_GPL(mt7921_ops);
> >
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
> > index 280605ffc4da..fda85252325c 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
> > +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
> > @@ -156,6 +156,7 @@ struct mt7921_vif {
> >       struct ewma_rssi rssi;
> >
> >       struct ieee80211_tx_queue_params queue_params[IEEE80211_NUM_ACS];
> > +     struct ieee80211_chanctx_conf *ctx;
> >  };
> >
> >  struct mib_stats {
> > --
> > 2.25.1
> >

