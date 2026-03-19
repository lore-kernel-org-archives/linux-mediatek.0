Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CE20103E185
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Mar 2026 06:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0oPAl9w8yS/k8/S8NTXEPirb906gPERAPWP/gPmP7lA=; b=U+htIyiaNU90BcFwrznL8eW90a
	NJ8fzFTeQDZ8ba5vXhqbhMkJADv+Qdpwn7grh097U7QqP1P26Qp4NuhGcdd8lTWwjYXElBFYMP8oM
	07J6vSA+TXHXfpoQDGu/c4bmz3R1m7biacgJ9E899ASqltgm/BjutPq+AFLOKkKXEeSeJfGJJUWtI
	lxtijBDIJ13782k/0e/Fn5qL0IAelruvCLIXATXIkEi/+Fv/HDd+a1FVe1IpTvz9mUSGPdfdnYF7/
	IJf7iQQofUL49qcWP14ItTDdBqGHPVa7I0DUCUIbUo5NyQBAZYanyb08rLnUQtAllWj3byzZPx3kH
	ctH71IWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w36Qx-00000009yOF-0iAF;
	Thu, 19 Mar 2026 06:00:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w36Qv-00000009yO9-0Jtj
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Mar 2026 06:00:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2C4C360137
	for <linux-mediatek@lists.infradead.org>; Thu, 19 Mar 2026 06:00:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D658EC2BCB2
	for <linux-mediatek@lists.infradead.org>; Thu, 19 Mar 2026 06:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773900035;
	bh=AuWihEjS4Na7P8c7/Ns1+pfE5wBeUB1/pngLuFfpbcs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tNnCCA3ik0KvW0zvCbUHJmnV4mMOfkrLiosjuMIQshYCPkAHPwtR8aNSmEcTwm1QF
	 8w8dGHsBTr14xhkrOgLeghdHVI+iT1xeFofv2I9arr9FzRsBkOnTubZy6gJl+GJ1Vy
	 OZ7oBrSgz2TipKmLa2l+8+0a4aW/D5lD1HI4ZHJhqXEeEP8/X8zZ3aAcsIUeyLGelY
	 RAAZCkUqqOXaiSaIHRiUTC+zTOQKFXjVt2W7AzWk3c/ae9qvHjC65WP1uJxSor/GN+
	 MLbJxd+PenKmHkCMb0AAtH6HHtV7f2TVXXrCgxsjVulUQwqOIplRuuDUqDXh2vyjKK
	 Nn3KKpjUql3BA==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a278b4c1a5so505490e87.3
        for <linux-mediatek@lists.infradead.org>; Wed, 18 Mar 2026 23:00:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUc4HIV6IiaJd38olwfGzTV4EOlnzLkFpwVTc5cGN7rd0Y7Ggw4dc/e1Fo42ySzR90qw45h233+p39R4oFeXw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxzBm+Iko50baEr6RYs2DIQ6gVXGmqnij13XzyCUyS+MyIXSUjq
	oz9WtbEOsMIur1SHufxRjhSZKw9xXIamhADaCVgcGw1PpF+om8GhYwviz+WlCQWb2NNuuJMGurn
	nev9taQ/bnFypaWTTsLqzpvyAhw3V66o=
X-Received: by 2002:a05:6512:31d5:b0:5a2:78f2:3ade with SMTP id
 2adb3069b0e04-5a2796a2b69mr2368923e87.20.1773900034065; Wed, 18 Mar 2026
 23:00:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260317173016.136975-1-lucid_duck@justthetip.ca> <20260317173016.136975-2-lucid_duck@justthetip.ca>
In-Reply-To: <20260317173016.136975-2-lucid_duck@justthetip.ca>
From: Sean Wang <sean.wang@kernel.org>
Date: Thu, 19 Mar 2026 01:00:18 -0500
X-Gmail-Original-Message-ID: <CAGp9LzqLbdEb25ocObMMuFPZitrL-UnC7uhaLOkYQN=TgSTmnA@mail.gmail.com>
X-Gm-Features: AaiRm53QdOUvnbNx-i8dM1p_P0LtvYl7pIHuSWO3YbYIIHqfYJ72DeFNeS7VzAo
Message-ID: <CAGp9LzqLbdEb25ocObMMuFPZitrL-UnC7uhaLOkYQN=TgSTmnA@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] wifi: mt76: mt7921: fix txpower reporting from
 rate power configuration
To: Lucid Duck <lucid_duck@justthetip.ca>
Cc: linux-wireless@vger.kernel.org, nbd@nbd.name, lorenzo@kernel.org, 
	linux-mediatek@lists.infradead.org, morrownr@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi,

On Tue, Mar 17, 2026 at 12:30=E2=80=AFPM Lucid Duck <lucid_duck@justthetip.=
ca> wrote:
>
> The mt7921 driver never updates phy->txpower_cur
> when TX power rate configuration is sent to firmware. This causes
> mt76_get_txpower() to report bogus values to userspace (typically
> 3 dBm) regardless of actual regulatory or SAR limits. User-set
> txpower limits via iw are also not reflected.
>
> Three root causes are addressed:
>
> 1. The rate power loop in mt76_connac_mcu_rate_txpower_band() computes
>    the correct bounded TX power for each channel but discards the return
>    value of mt76_get_rate_power_limits(). Fix: capture the return value
>    and store it to phy->txpower_cur when processing the current channel.
>
> 2. mt7921 uses the chanctx model but its add_chanctx callback bypasses
>    the common mt76_phy_update_channel(), leaving phy->chandef stale.
>    Fix: update phy->chandef from ctx->def in both add_chanctx and
>    change_chanctx, and trigger the rate power path to refresh
>    txpower_cur. Also trigger on IEEE80211_CONF_CHANGE_CHANNEL in
>    config(), matching mt7915.
>
> 3. For chanctx drivers, mac80211 routes user txpower changes through
>    BSS_CHANGED_TXPOWER in bss_info_changed() -- not through
>    IEEE80211_CONF_CHANGE_POWER in config(). hw->conf.power_level is
>    never updated. Fix: handle BSS_CHANGED_TXPOWER in
>    mt7921_bss_info_changed(), bridge bss_conf.txpower to
>    hw->conf.power_level, and re-trigger the rate power path.
>
> Tested on Alfa AWUS036AXML (MT7921AU), kernel 6.17.1-300.fc43:
>
>   Before: iw dev wlan0 info shows "txpower 3.00 dBm" (wrong)
>   After:  correct per-band values, user limits reflected
>
> Test results (regulatory domain: Canada/CA):
>   - 2.4GHz ch6:  33 dBm (30 dBm limit + 3 dBm 2x2 path delta)
>   - 5GHz ch36:   26 dBm (23 dBm limit + 3 dBm path delta)
>   - 6GHz ch5:    15 dBm (12 dBm limit + 3 dBm path delta)
>   - Band switch: 100 cycles, 0 failures
>   - Module reload: 50 cycles, 0 failures
>   - 2-hour soak: 480 samples, zero drift
>   - Regdomain switching: 10 countries, all correct
>   - User txpower limits: reflected on all bands
>   - Monitor mode: correct on all tested channels
>
> Signed-off-by: Lucid Duck <lucid_duck@justthetip.ca>
> ---
>  .../wireless/mediatek/mt76/mt76_connac_mcu.c  | 12 +++++++---
>  .../net/wireless/mediatek/mt76/mt7921/main.c  | 22 ++++++++++++++++++-
>  2 files changed, 30 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drive=
rs/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> index 16db0f208..5856924a9 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> @@ -2193,14 +2193,20 @@ mt76_connac_mcu_rate_txpower_band(struct mt76_phy=
 *phy,
>                                 .hw_value =3D ch_list[idx],
>                                 .band =3D band,
>                         };
> -                       s8 reg_power, sar_power;
> +                       s8 reg_power, sar_power, max_power;
>
>                         reg_power =3D mt76_connac_get_ch_power(phy, &chan=
,
>                                                              tx_power);
>                         sar_power =3D mt76_get_sar_power(phy, &chan, reg_=
power);
>
> -                       mt76_get_rate_power_limits(phy, &chan, limits,
> -                                                  sar_power);
> +                       max_power =3D mt76_get_rate_power_limits(phy, &ch=
an,
> +                                                              limits,
> +                                                              sar_power)=
;
> +
> +                       if (phy->chandef.chan &&
> +                           phy->chandef.chan->hw_value =3D=3D ch_list[id=
x] &&
> +                           phy->chandef.chan->band =3D=3D band)
> +                               phy->txpower_cur =3D max_power;
>
>                         tx_power_tlv.last_msg =3D ch_list[idx] =3D=3D las=
t_ch;
>                         sku_tlbv.channel =3D ch_list[idx];
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/n=
et/wireless/mediatek/mt76/mt7921/main.c
> index 5881040ac..38a59c6f2 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> @@ -638,7 +638,8 @@ static int mt7921_config(struct ieee80211_hw *hw, int=
 radio_idx, u32 changed)
>
>         mt792x_mutex_acquire(dev);
>
> -       if (changed & IEEE80211_CONF_CHANGE_POWER) {
> +       if (changed & (IEEE80211_CONF_CHANGE_POWER |
> +                      IEEE80211_CONF_CHANGE_CHANNEL)) {
>                 ret =3D mt7921_set_tx_sar_pwr(hw, NULL);
>                 if (ret)
>                         goto out;
> @@ -719,6 +720,14 @@ static void mt7921_bss_info_changed(struct ieee80211=
_hw *hw,
>         if (changed & BSS_CHANGED_CQM)
>                 mt7921_mcu_set_rssimonitor(dev, vif);
>
> +       if (changed & BSS_CHANGED_TXPOWER) {
> +               int tx_power =3D info->txpower;
> +
> +               if (tx_power !=3D INT_MIN && tx_power > 0)
> +                       hw->conf.power_level =3D tx_power;
> +               mt7921_set_tx_sar_pwr(hw, NULL);
> +       }
> +
>         if (changed & BSS_CHANGED_ASSOC) {
>                 mt7921_mcu_sta_update(dev, NULL, vif, true,
>                                       MT76_STA_INFO_STATE_ASSOC);
> @@ -1360,8 +1369,15 @@ mt7921_add_chanctx(struct ieee80211_hw *hw,
>                    struct ieee80211_chanctx_conf *ctx)
>  {
>         struct mt792x_dev *dev =3D mt792x_hw_dev(hw);
> +       struct mt76_phy *mphy =3D hw->priv;
>
>         dev->new_ctx =3D ctx;
> +       mphy->chandef =3D ctx->def;
> +
> +       mt792x_mutex_acquire(dev);
> +       mt7921_set_tx_sar_pwr(hw, NULL);
> +       mt792x_mutex_release(dev);
> +
>         return 0;
>  }
>
> @@ -1396,6 +1412,10 @@ mt7921_change_chanctx(struct ieee80211_hw *hw,
>                 mt7921_mcu_config_sniffer(mvif, ctx);
>         else
>                 mt76_connac_mcu_uni_set_chctx(mvif->phy->mt76, &mvif->bss=
_conf.mt76, ctx);
> +
> +       phy->mt76->chandef =3D ctx->def;
> +       mt7921_set_tx_sar_pwr(hw, NULL);
> +

I do not think the additional mt7921_set_tx_sar_pwr() calls are justified.

mt7921_set_tx_sar_pwr() is not a lightweight per-channel refresh. It
rebuilds and pushes the rate txpower table for all channels in the band
through the MCU path. This is appropriate when the underlying power
constraints change (e.g. SAR, regulatory limits, or user-configured
txpower), but not for pure channel/chanctx transitions.

add_chanctx(), change_chanctx(), and IEEE80211_CONF_CHANGE_CHANNEL only
reflect channel/context changes and do not imply that the firmware
txpower table needs to be recomputed. Using mt7921_set_tx_sar_pwr() here
effectively turns it into a catch-all sync path.

If the issue is stale txpower reporting after a channel switch, it should
be fixed by updating phy->txpower_cur from the already computed bounded
max power for the current channel, rather than re-triggering full table
programming on every chanctx/channel event.

BSS_CHANGED_TXPOWER is also problematic. It is a per-BSS (per-vif) event,
while hw->conf.power_level is shared per-HW state. Writing
info->txpower into hw->conf.power_level allows one interface to affect
the effective txpower of others sharing the same PHY, which breaks
multi-vif semantics.

>         mt792x_mutex_release(phy->dev);
>  }
>
> --
> 2.51.0
>

