Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B6EFED2CC
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Mar 2026 05:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EMVgxTjUdptim/v3Jo932KoV18Fg3KTCc8S1WGtXObU=; b=E2Vqj4IB+aO9WVQp4gI4I+stjN
	Ty8VrARP+ukd2BDFe/ajeAD8dVkCVXvYHSSalvUMpzlbKvjUDnsf5TZZjrF3fhRcXbE7mWL+0CYp8
	Sc9LVhaDbcmP57boWVSLeYyOqBZ34ceShZLrUGJtOCFtWHbv6Nsd2qhy2okIcfY8S07SbqJ/p95dO
	5y/72V0D3gmTqrL3zLAOu5qP4P/cR5fsraEVnZ1vrONqfnbmjpobCTkR+2dSaAsrKUwOUonvkywPa
	c7QmXTa/63/8rYEVIjfX4F9jAR+hdSKqCaYg5kaZad3rtZe0KN79KnOpqNRqHtX9GkhRvlsVfuv+U
	m/0JTfMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0YXb-0000000DMiE-2vuC;
	Thu, 12 Mar 2026 05:25:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0YXY-0000000DMhT-3i13
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Mar 2026 05:24:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9CD3543FF3
	for <linux-mediatek@lists.infradead.org>; Thu, 12 Mar 2026 05:24:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76E90C4AF0B
	for <linux-mediatek@lists.infradead.org>; Thu, 12 Mar 2026 05:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773293095;
	bh=2ecOeqfyRFrj/e+SpsihyfKp7aoNYixjg74nS+O6fK0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VH88NPNRdviJuzoRjI9hjhwWp3ADXLruXwoy+UQFn0OKdYq9XD8g6lXoMx3DYwcfn
	 B5nobsjrDlCv0jD2WGEejgipnBH5dfI8J3JiAXhB+W4VFIttUL3EUg7LhN0TgoEiu7
	 Nc/ETQGEV2DQ676aGPHjkjBzlL/gFOJwfaat4BmebFPCmEIvhb+FnnYZeIgFlGvfuW
	 LAbGawagq0ENlfOon7YcYkuxoHZo6uxumdHwrjcQECJl1XcjANSACKoj5mS0pfU8VM
	 ge4EjwnWLJhJUy5C43Xh0VAwkhzQwRYqZTFAaeO3pfvtQVEq870n6ck2exDHREvNx/
	 ouTIsnEELfl+g==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a13f6bcbf4so1056873e87.1
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Mar 2026 22:24:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU8klr3g9blRq9jbwojDSX6rmjOPL1B5uRuyph4HxLybouUKwT+p9FfriWsgPe85f7gjR+QerKDirKJCNgfAw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6ZRy5hn3WuXpmbz0OfLPmOUuiTXTUCdwBSCv2RC0Dm+p0gTp8
	p7N4zggHgfN5FgpDHIiqtZIc+yFh2CctPIHHst6Jj2zMdKFy8/Nt7fyiOyEUkk7kWhE9bTn3JCq
	Ib8y2TotJ097wSOqbm4SoyZ2j4aI3DDk=
X-Received: by 2002:a05:6512:1559:20b0:5a1:59b7:8a50 with SMTP id
 2adb3069b0e04-5a159b78c85mr624904e87.36.1773293093701; Wed, 11 Mar 2026
 22:24:53 -0700 (PDT)
MIME-Version: 1.0
References: <CANAPQzi3BkfnRS4CEXAA560O5cO8e6MEYxeVVx1u+xUeXS-gmA@mail.gmail.com>
 <CAGp9LzoidBL1iYYC371+Fw+drbArLRTneJKxCoFiitx=dweKCg@mail.gmail.com>
 <CANAPQzjiBf8Rqphn2SypYN2O6bddj6vB=63Mp=T5YVEt2oGvyw@mail.gmail.com>
 <CANAPQzgiE1rMP3F=5NJg3hp2uBXtq44+vTRBdkHwdfHyXJ8MQQ@mail.gmail.com> <CANAPQzgD312EPSbvaQTE6U+wn85L65+xZHms7DP509ApxWvSZA@mail.gmail.com>
In-Reply-To: <CANAPQzgD312EPSbvaQTE6U+wn85L65+xZHms7DP509ApxWvSZA@mail.gmail.com>
From: Sean Wang <sean.wang@kernel.org>
Date: Thu, 12 Mar 2026 00:24:42 -0500
X-Gmail-Original-Message-ID: <CAGp9Lzqr3MU6stHOYhZAu-tNCkGrpGX5Psf3wrAxcvQEvM3ZCA@mail.gmail.com>
X-Gm-Features: AaiRm51DcCI0nwDlLcOubrnU2kyO7tb72XQqSHUCBKcYSIvggxAZvOvuoVo5ZO8
Message-ID: <CAGp9Lzqr3MU6stHOYhZAu-tNCkGrpGX5Psf3wrAxcvQEvM3ZCA@mail.gmail.com>
Subject: Re: [PATCH 1/2] mt76: connac: fix txpower_cur not updated in mt76_connac_mcu_set_rate_txpower()
To: bryam vargas <bryamestebanvargas@gmail.com>, lucid_duck@justthetip.ca
Cc: linux-wireless@vger.kernel.org, nbd@nbd.name, lorenzo@kernel.org, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_222456_962620_C4A71816 
X-CRM114-Status: GOOD (  23.09  )
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

I just realized that Lucid already implemented another approach to
obtain the TX power here:
https://lore.kernel.org/linux-wireless/20260130215839.53270-1-lucid_duck@ju=
stthetip.ca/
We should respect his work. Could you also take a look at it and reply
to his patch to avoid potential rework?

On Wed, Mar 11, 2026 at 3:57=E2=80=AFPM bryam vargas
<bryamestebanvargas@gmail.com> wrote:
>
> From 6c75ad481f0c3667d6ae2a2c8f7c2df08b1d52b5 Mon Sep 17 00:00:00 2001
> From: bryam <bryamestebanvargas@gmail.com>
> Date: Mon, 9 Mar 2026 11:52:53 -0500
> Subject: [PATCH v2 1/2] mt76: mt7921: add mt7921-specific get_txpower cal=
lback
>
> Instead of updating txpower_cur in the write path
> (mt76_connac_mcu_set_rate_txpower), implement a mt7921-specific
> .get_txpower callback that derives the reported TX power directly
> from the SKU limits at query time.
>
> This avoids mixing write-side configuration with reporting logic.
> The callback uses mt76_get_power_bound() for SAR constraints and
> chain delta, then mt76_get_rate_power_limits() for per-rate EEPROM
> limits, yielding the actual TX power value.
>
> Fixes: 3b4a3bdba808 ("mt76: mt7921: add support for reporting tx power")
> Signed-off-by: Bryam Vargas <bryamestebanvargas@gmail.com>
> ---
>  .../net/wireless/mediatek/mt76/mt7921/main.c  | 27 ++++++++++++++++++-
>  1 file changed, 26 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> index 67383c4..35454e5 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> @@ -1517,6 +1517,31 @@ static void mt7921_rfkill_poll(struct ieee80211_hw=
 *hw)
>      wiphy_rfkill_set_hw_state(hw->wiphy, ret ? false : true);
>  }
>
> +
> +static int mt7921_get_txpower(struct ieee80211_hw *hw,
> +                  struct ieee80211_vif *vif,
> +                  unsigned int link_id, int *dbm)
> +{
> +    struct mt76_phy *phy =3D mt76_vif_phy(hw, vif);
> +    struct mt76_power_limits limits;
> +    int n_chains, delta;
> +    s8 tx_power;
> +
> +    if (!phy)
> +        return -EINVAL;
> +
> +    if (!phy->chandef.chan)
> +        return mt76_get_txpower(hw, vif, link_id, dbm);
> +
> +    n_chains =3D hweight16(phy->chainmask);
> +    delta =3D mt76_tx_power_path_delta(n_chains);
> +    tx_power =3D mt76_get_power_bound(phy, phy->chandef.chan->max_power)=
;
> +    tx_power =3D mt76_get_rate_power_limits(phy, phy->chandef.chan,
> +                          &limits, tx_power);
> +    *dbm =3D DIV_ROUND_UP(tx_power + delta, 2);

how can you make sure it is the result of the maximum rate power used
in the loop within mt76_connac_mcu_rate_txpower_band (updated with
each call) ?

> +    return 0;
> +}
> +
>  const struct ieee80211_ops mt7921_ops =3D {
>      .tx =3D mt792x_tx,
>      .start =3D mt7921_start,
> @@ -1541,7 +1566,7 @@ const struct ieee80211_ops mt7921_ops =3D {
>      .wake_tx_queue =3D mt76_wake_tx_queue,
>      .release_buffered_frames =3D mt76_release_buffered_frames,
>      .channel_switch_beacon =3D mt7921_channel_switch_beacon,
> -    .get_txpower =3D mt76_get_txpower,
> +    .get_txpower =3D mt7921_get_txpower,
>      .get_stats =3D mt792x_get_stats,
>      .get_et_sset_count =3D mt792x_get_et_sset_count,
>      .get_et_strings =3D mt792x_get_et_strings,
> --
> 2.43.0

