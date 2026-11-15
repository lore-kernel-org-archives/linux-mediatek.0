Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0691606A31F
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Nov 2026 22:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TS+Z7kXn;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mcQT8wCs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YAQbUIYXb1BwL5bjjRZfMARVt/N+KLx7TTjHYoiXJTg=; b=TS+Z7kXni0/oue
	tnBO3HtCvkHKZ2AjGKxagH/Fh4D5+KvR5hAurhXyiJmjbUaOdBlJJrAGXvJe+6PPw42KsY6MbHj2B
	Kem1Ac2tkUdh3cQnEN0SJCXY7Nf/qj29uakIuQ4zLWqO5jCTV8yx4YY10T1RbZur83Zrw1b5KudaG
	MAhbTSbrAbBGW/qtyxXxDv7nL61T98jJJZ5dCrcZSKzww4nj92ru0TF4Z8lVAPtY9wRFZrpkLeOL8
	sxjX60HU4s1+z783CB02b+uxoKg2Gv3CkbecYVZFDkmaHegaVx1XYtlxxwbOrwKEXcz3h4n2Yx1m0
	ENwr7WKengbUNbBvqAtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSiRS-00000000c0R-1eUN;
	Sun, 15 Nov 2026 22:11:18 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSiRP-00000000c03-2zts
	for linux-mediatek@lists.infradead.org;
	Sun, 15 Nov 2026 22:11:17 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-6b570ff3dfdso2777391a12.3
        for <linux-mediatek@lists.infradead.org>; Sun, 15 Nov 2026 14:11:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794780673; cv=none;
        d=google.com; s=arc-20260327;
        b=WCDrZfoQcyzpsNQBFsl/sXSI9C6tGCv0AUNwb6TZibKF/4oZ3HXeTjwFukMWpzP4mH
         whoLXyC1dn58buCNdS9ykj9wPrkSbQBheSM8RrGkX+xWHhF5Xj6Mdyhm/hR8WeKZSUc4
         Tv20qrepFUu6+zMyP7IZsgLMsqXzo87cVLNHNsDIkk3Le7Mq/0IhwqvtK1ZJ2glLQWU3
         QNXMc0TsLwVuAmioJiWo4646eMFieaYoGkvBmQjO3ZRMoB9zh9aP8ei8PfNjRgc3AvHD
         nU3MscWvRfuIIQwEn6r+ABVjZW4LdycgEgCIp6FhgihkvHXHJ5SZM84jf77bxiScPKHz
         NKZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YAQbUIYXb1BwL5bjjRZfMARVt/N+KLx7TTjHYoiXJTg=;
        fh=0rrGsUWzOpYP9JJQor+6b+CEt1KPuMdwjc/ObId7uc0=;
        b=B5x8IAZxsT0UFviyU5lId/pnrPxTlR82m1nR9wYTSmRiZOOP3TCOcQx6TMUDe1wmR8
         ldzeDx6Ofe1ah6OkeyiSvmiOnTBO1aT84I5NVTrkUWiDKHjDdte98kC3dvUhub3OviH0
         mKvAQoH7DDC6kUWtvke4mULSTOx86nwz6lkLyjfHdTIBvCYmu1/v+oNky/V91w0PU6W4
         KGXoJLmHQfz2X92k9LUwCS6y05gCHloqRNUpNrURv3zctDTvwk0py0KClkH1RM932ihE
         fzetkd+ZOwdKFBklO/vi0JeEOkxgM7F62aOzi0djTZV4jnkgAplg5StCZsSjlHbnzgtS
         sOTg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794780673; x=1795385473; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YAQbUIYXb1BwL5bjjRZfMARVt/N+KLx7TTjHYoiXJTg=;
        b=mcQT8wCsV3h0fTdHPhkG6kt/mmBT3KROAuqHPAnHGh63rNRQmcghQ4OMHCd9Zwln4N
         9HH80P77fzKIiYj5IhiPtaVRL9lDnoxUPeb6AlZdNBQrWpWDLpY6d+Wl7cLCghT5pTyL
         HiFmNwrmxKisE/DBesagXgSMnQ70FalmwTiaqrisb8CeAJUKoPT1/aVx9yeV47NEqchs
         n73wAF/I0jpH4RKTvH8ROPWiu73hU9Sv7l9A7T7jZkpEtljdBQmo0mq6KhanErw5NCit
         TfFm9UPpdszZ58m2E+oZQM/MF3UlB4kUFXXwlO4eY5myzVvb4hIXwS9uGpzIBsrRo6Sy
         0j6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794780673; x=1795385473;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YAQbUIYXb1BwL5bjjRZfMARVt/N+KLx7TTjHYoiXJTg=;
        b=wgTtwtrNlSIgl2Ni6CUVKJ9joDu52lQjl9L6kLUowy+nnM9wUVJ2y1zFUVuVeqANjR
         WwKhtq5t6hvp6+TObzacX0J5ZHNiKp8YYjpzAOhgbHJP7x1a3+1WKZSgbmyTFSlKi/5d
         AlxsQo+kK05p2LHrau8vQN31L/1uf5+zSu9DBmdKHGTVAMNiGivC2nS/okPvf6GnSzLt
         iuKa76PG295b9Iwt2rxBniIUJvkiH2TtiX6hrOGfZts++XjafyOkW6kPqdfS9otMWpIw
         ul4m2zKn4PJXYZHSEZnoqC7xpg5fxLG9GOBK/PwMguDeCLwTrwu9veDVPF2KdpXeYhCM
         hGCA==
X-Forwarded-Encrypted: i=1; AL+hErHlC5fEs5e/iZiNaw10CwzcP03nf6g1z9qCCibmg52UBVI83iTw+w5ruCzQO0apORR41OKCpfyY0aJzC2LTyg==@lists.infradead.org
X-Gm-Message-State: APuU4Z/3raRgu83SCgUfI6hOlhf1RNp0YLjT/qfML9l+ZMrZJrR0gfFl
	L4jHA8J44rbGVvodVeGdjBDwA2+1DxkfSiB3kN2hTBzUIhB7+eStb3hLCo5mkicW5Fv8QEqbvFA
	iBqqg5IPaYeyqJuV6iT4F/1Qs4z7XHIw=
X-Gm-Gg: AYBFou2iLkZ+b8cIWHebSntPlLzm7B/W1Tq/Y4eokDxCjTt1OQ0wlri39VLDZ1f0DG1
	VnRavh8xJd5AJHXuY9G1qz2zOgItVN1D/wXmesudJhsLdIQTgixDmGJzi3SkUyh6qd2Pxf4BxR3
	QKNemIUkhvnOcPW/BlG5if7rWwVkcNPByO86lt6fRl04ml66a4QQxDKNFPyGpqhKOhcur0+vAme
	PicMv/LcUhosEI54m6ivJrBKMWxc1Vw78vsPPYKsq6atCuxSnhjfZOwo/ns9CNJDVI5+H2ZwoHl
	78rldJljm6Wt4ISoTCKnzHRjyBiX6Y2PFfDLK1Xcw56oSXp/8oyag5mCD42LA+78G60KmkoVVcO
	cF2FqzgbchE5CGXlNazK0tGSeXGeYno5pc5fkIhaWCTpFPd9eawti+VP0fMA=
X-Received: by 2002:a05:6402:210d:b0:6b4:86e1:cc67 with SMTP id
 4fb4d7f45d1cf-6b7c0c6fd49mr6049392a12.27.1794780672927; Sun, 15 Nov 2026
 14:11:12 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261115025635.40010-1-lucid_duck@justthetip.ca>
In-Reply-To: <20261115025635.40010-1-lucid_duck@justthetip.ca>
From: Chris <hoopyfrood42@gmail.com>
Date: Sun, 15 Nov 2026 17:10:58 -0500
X-Gm-Features: AclHuK-J-XS3bS6_P8NNBw8-09rcQZeT-WEOdlJvOAZ3ak_yNR1JNy2eYlAI-4M
Message-ID: <CAHaeJsRTd5KjN9CsKDU-g8Ut-WfBuiKkTnkBSZ9hQSsr7P_HQA@mail.gmail.com>
Subject: Re: [PATCH wireless v2] wifi: mt76: mt7925: get the survey airtime
 from the firmware
To: Devin Wittmayer <lucid_duck@justthetip.ca>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Deren Wu <deren.wu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Michael Shih <michael.shih@mediatek.com>, 
	Javier Tia <floss@jetm.me>, linux-wireless@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, stable+noautosel@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_141115_924639_0FD130E8 
X-CRM114-Status: GOOD (  35.36  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Nov 14, 2026 at 9:56=E2=80=AFPM Devin Wittmayer
<lucid_duck@justthetip.ca> wrote:
>
> Busy time in the mt7925 survey is bogus. Its register doesn't work on
> this chip, so busy outgrows the time on the channel, and transmit time
> comes out far too low.
>
> Ask the firmware, as mt7996 does. Busy wraps at 32 bits, so subtract
> in 32 bits. The MT7927 counts 5 and 6 GHz on a second band, so read
> both and add the one in use.
>
> Over USB 2.0 a full-speed download can hold the answer past the
> timeout. The chip is fine then, so wait a few seconds instead of
> resetting it. The next read catches up.
>
> Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for =
mt7925 chips")
> Fixes: 05fd14885303 ("wifi: mt76: mt7925: sync MT7927 BSS band assignment=
")
> Reported-by: Chris Kelly <hoopyfrood42@gmail.com>
> Closes: https://lore.kernel.org/linux-wireless/CAHaeJsT8O8Nhq351hFp3NAL8e=
0iU85N-LBdYZ9nYHFHVy7t_hQ@mail.gmail.com/
> Cc: <stable+noautosel@kernel.org> # needs a backport, older trees have no=
 MT7927 support
> Signed-off-by: Devin Wittmayer <lucid_duck@justthetip.ca>
> ---
> v2:
> - subtract in 32 bits, Chris saw busy wrap
> - no chip reset when this answer is late [1]
>
> A9000 on USB 2.0, full-speed downloads:
>
>   driver                 length   late answers   chip resets   busy repor=
ted
>   stock                  60 s     -              0             2346 s
>   RFC with 32-bit fix    60 s     3              3             33 s
>   v2                     60 s     0              0             56 s
>   v2                     10 min   22             0             558 s
>
> Other commands answered late still reset the chip, as today; it
> happened once, when the AP changed bandwidth mid-download.
>
> Clean on USB 3.0, as an AP, across suspend, and over PCIe.
>
> With runtime PM, the default on MT7925 PCIe, the periodic work doesn't
> run (same on mt7921e): the survey updates when read, and busy tops out
> at 16.8 s between reads.
>
> Michael, this sets the same survey hook as patch 2 of your v5.
>
> Chris, your readings near 2^64 match the RFC's math at a wrap. v2
> can't go backwards.
>
> [1] https://lore.kernel.org/linux-wireless/20261113150048.5271-1-lucid_du=
ck@justthetip.ca/
> RFC: https://lore.kernel.org/linux-wireless/20261023180554.7266-1-lucid_d=
uck@justthetip.ca/
>
>  .../net/wireless/mediatek/mt76/mt7925/mac.c   | 53 +++++++++++++
>  .../net/wireless/mediatek/mt76/mt7925/main.c  |  1 +
>  .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 78 ++++++++++++++++++-
>  .../net/wireless/mediatek/mt76/mt7925/mcu.h   | 17 ++++
>  .../wireless/mediatek/mt76/mt7925/mt7925.h    |  3 +
>  .../net/wireless/mediatek/mt76/mt7925/pci.c   |  2 +-
>  .../net/wireless/mediatek/mt76/mt7925/usb.c   |  2 +-
>  drivers/net/wireless/mediatek/mt76/mt792x.h   |  2 +
>  8 files changed, 155 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7925/mac.c
> index 7af996abe294..9749bcf668e5 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
> @@ -1470,6 +1470,59 @@ void mt7925_queue_rx_skb(struct mt76_dev *mdev, en=
um mt76_rxq_id q,
>  }
>  EXPORT_SYMBOL_GPL(mt7925_queue_rx_skb);
>
> +int mt7925_mac_update_chan_time(struct mt792x_phy *phy, bool reset)
> +{
> +       struct ieee80211_channel *chan =3D phy->mt76->chandef.chan;
> +       struct mt76_channel_state *state =3D phy->mt76->chan_state;
> +       struct mt792x_dev *dev =3D phy->dev;
> +       int i, ret =3D 0, n_bands =3D 1, band =3D 0;
> +
> +       /* The MT7927 counts 2.4 GHz on band 0 and 5/6 GHz on band 1, and
> +        * the band not in use keeps counting, so read both every time an=
d
> +        * only add the band the channel is on.
> +        */
> +       if (is_mt7927(&dev->mt76)) {
> +               n_bands =3D ARRAY_SIZE(phy->state_ts);
> +               if (chan)
> +                       band =3D mt7927_band_idx(chan->band);
> +       }
> +
> +       for (i =3D 0; i < n_bands; i++) {
> +               bool add =3D !reset && i =3D=3D band;
> +               u32 bss_rx;
> +
> +               bss_rx =3D mt76_get_field(dev, MT_MIB_SDR37(i),
> +                                       MT_MIB_SDR37_RXTIME_MASK);
> +               if (add)
> +                       state->cc_bss_rx +=3D bss_rx;
> +
> +               ret =3D mt7925_mcu_get_chan_mib_info(phy, i, add);
> +               if (ret =3D=3D -ETIMEDOUT)
> +                       break;
> +       }
> +
> +       return ret;
> +}
> +
> +void mt7925_update_channel(struct mt76_phy *mphy)
> +{
> +       struct mt792x_dev *dev =3D container_of(mphy->dev, struct mt792x_=
dev, mt76);
> +       struct mt792x_phy *phy =3D mphy->priv;
> +
> +       /* give a busy link a few seconds after a late reply */
> +       if (phy->survey_hold && time_before(jiffies, phy->survey_hold))
> +               return;
> +       phy->survey_hold =3D 0;
> +
> +       if (mt76_connac_pm_wake(mphy, &dev->pm))
> +               return;
> +
> +       if (mt7925_mac_update_chan_time(phy, false) =3D=3D -ETIMEDOUT)
> +               phy->survey_hold =3D jiffies + 5 * HZ;
> +       mt76_connac_power_save_sched(mphy, &dev->pm);
> +}
> +EXPORT_SYMBOL_GPL(mt7925_update_channel);
> +
>  static void
>  mt7925_vif_connect_iter(void *priv, u8 *mac,
>                         struct ieee80211_vif *vif)
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/n=
et/wireless/mediatek/mt76/mt7925/main.c
> index 15d95ad32636..16dc974a1122 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
> @@ -351,6 +351,7 @@ int __mt7925_start(struct mt792x_phy *phy)
>                 return err;
>
>         mt792x_mac_reset_counters(phy);
> +       mt7925_mac_update_chan_time(phy, true);
>         set_bit(MT76_STATE_RUNNING, &mphy->state);
>
>         ieee80211_queue_delayed_work(mphy->hw, &mphy->mac_work,
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7925/mcu.c
> index 26cdb3f0a98a..1bfa4ec404b7 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
> @@ -28,7 +28,12 @@ int mt7925_mcu_parse_response(struct mt76_dev *mdev, i=
nt cmd,
>
>         if (!skb) {
>                 dev_err(mdev->dev, "Message %08x (seq %d) timeout\n", cmd=
, seq);
> -               mt792x_reset(mdev);
> +               /* The counters come back behind received data, so a full
> +                * USB 2.0 download can hold the answer past the timeout.
> +                * Nothing is wrong with the firmware then, don't reset i=
t.
> +                */
> +               if (cmd !=3D MCU_WM_UNI_CMD_QUERY(GET_MIB_INFO))
> +                       mt792x_reset(mdev);
>
>                 return -ETIMEDOUT;
>         }
> @@ -1019,6 +1024,77 @@ int mt7925_mcu_get_temperature(struct mt792x_phy *=
phy)
>         return temperature;
>  }
>
> +int mt7925_mcu_get_chan_mib_info(struct mt792x_phy *phy, u8 band, bool a=
dd)
> +{
> +       enum {
> +               IDX_BUSY_TIME,
> +               IDX_TX_TIME,
> +               IDX_RX_TIME,
> +               IDX_NUM
> +       };
> +       struct {
> +               struct {
> +                       u8 band;
> +                       u8 __rsv[3];
> +               } hdr;
> +               struct {
> +                       __le16 tag;
> +                       __le16 len;
> +                       __le32 offs;
> +               } data[IDX_NUM];
> +       } __packed req =3D {
> +               .hdr.band =3D band,
> +       };
> +       static const u32 offs[] =3D {
> +               [IDX_BUSY_TIME] =3D UNI_MIB_BUSY_TIME,
> +               [IDX_TX_TIME] =3D UNI_MIB_TX_TIME,
> +               [IDX_RX_TIME] =3D UNI_MIB_RX_TIME,
> +       };
> +       struct mt76_channel_state *state =3D phy->mt76->chan_state;
> +       struct mt76_channel_state *state_ts =3D &phy->state_ts[band];
> +       struct mt792x_dev *dev =3D phy->dev;
> +       struct mt7925_mcu_mib *res;
> +       struct sk_buff *skb;
> +       int i, ret;
> +
> +       for (i =3D 0; i < IDX_NUM; i++) {
> +               req.data[i].tag =3D cpu_to_le16(UNI_CMD_MIB_DATA);
> +               req.data[i].len =3D cpu_to_le16(sizeof(req.data[i]));
> +               req.data[i].offs =3D cpu_to_le32(offs[i]);
> +       }
> +
> +       ret =3D mt76_mcu_send_and_get_msg(&dev->mt76,
> +                                       MCU_WM_UNI_CMD_QUERY(GET_MIB_INFO=
),
> +                                       &req, sizeof(req), true, &skb);
> +       if (ret)
> +               return ret;
> +       if (skb->len < sizeof(req.hdr) + IDX_NUM * sizeof(*res)) {
> +               dev_kfree_skb(skb);
> +               return -EINVAL;
> +       }
> +
> +       skb_pull(skb, sizeof(req.hdr));
> +       res =3D (struct mt7925_mcu_mib *)skb->data;
> +
> +       if (!add)
> +               goto out;
> +
> +#define __res_u64(s) le64_to_cpu(res[s].data)
> +       /* busy wraps at 32 bits */
> +       state->cc_busy +=3D (u32)(__res_u64(IDX_BUSY_TIME) - state_ts->cc=
_busy);
> +       state->cc_tx +=3D (u32)(__res_u64(IDX_TX_TIME) - state_ts->cc_tx)=
;
> +       state->cc_rx +=3D (u32)(__res_u64(IDX_RX_TIME) - state_ts->cc_rx)=
;
> +out:
> +       state_ts->cc_busy =3D __res_u64(IDX_BUSY_TIME);
> +       state_ts->cc_tx =3D __res_u64(IDX_TX_TIME);
> +       state_ts->cc_rx =3D __res_u64(IDX_RX_TIME);
> +#undef __res_u64
> +
> +       dev_kfree_skb(skb);
> +
> +       return 0;
> +}
> +
>  static void
>  mt7925_mcu_parse_phy_cap(struct mt792x_dev *dev, char *data)
>  {
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h b/drivers/ne=
t/wireless/mediatek/mt76/mt7925/mcu.h
> index 11f9eac13ffc..f3e892dbb74c 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
> @@ -57,6 +57,23 @@ struct mt7925_mcu_reg_event {
>         __le32 val;
>  } __packed;
>
> +enum {
> +       UNI_CMD_MIB_DATA,
> +};
> +
> +enum {
> +       UNI_MIB_BUSY_TIME =3D 19,
> +       UNI_MIB_RX_TIME =3D 20,
> +       UNI_MIB_TX_TIME =3D 28,
> +};
> +
> +struct mt7925_mcu_mib {
> +       __le16 tag;
> +       __le16 len;
> +       __le32 offs;
> +       __le64 data;
> +} __packed;
> +
>  struct mt7925_mcu_ant_id_config {
>         u8 ant_id[4];
>  } __packed;
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h b/drivers=
/net/wireless/mediatek/mt76/mt7925/mt7925.h
> index 636efe038392..b9083e5892f6 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
> @@ -375,6 +375,9 @@ int mt7925_mcu_set_sniffer(struct mt792x_dev *dev, st=
ruct ieee80211_vif *vif,
>  int mt7925_mcu_config_sniffer(struct mt792x_vif *vif,
>                               struct ieee80211_chanctx_conf *ctx);
>  int mt7925_mcu_get_temperature(struct mt792x_phy *phy);
> +int mt7925_mcu_get_chan_mib_info(struct mt792x_phy *phy, u8 band, bool a=
dd);
> +int mt7925_mac_update_chan_time(struct mt792x_phy *phy, bool reset);
> +void mt7925_update_channel(struct mt76_phy *mphy);
>
>  int mt7925_usb_sdio_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr=
,
>                                    enum mt76_txq_id qid, struct mt76_wcid=
 *wcid,
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7925/pci.c
> index 0d477dc1086c..939a46c0428b 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
> @@ -604,7 +604,7 @@ static int mt7925_pci_probe(struct pci_dev *pdev,
>                 .sta_add =3D mt7925_mac_sta_add,
>                 .sta_event =3D mt7925_mac_sta_event,
>                 .sta_remove =3D mt7925_mac_sta_remove,
> -               .update_survey =3D mt792x_update_channel,
> +               .update_survey =3D mt7925_update_channel,
>         };
>         static const struct mt792x_hif_ops mt7925_pcie_ops =3D {
>                 .init_reset =3D mt7925e_init_reset,
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/usb.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7925/usb.c
> index f97f787b2198..2d3bf035fdfc 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7925/usb.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7925/usb.c
> @@ -174,7 +174,7 @@ static int mt7925u_probe(struct usb_interface *usb_in=
tf,
>                 .sta_add =3D mt7925_mac_sta_add,
>                 .sta_event =3D mt7925_mac_sta_event,
>                 .sta_remove =3D mt7925_mac_sta_remove,
> -               .update_survey =3D mt792x_update_channel,
> +               .update_survey =3D mt7925_update_channel,
>         };
>         static const struct mt792x_hif_ops hif_ops =3D {
>                 .mcu_init =3D mt7925u_mcu_init,
> diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wi=
reless/mediatek/mt76/mt792x.h
> index a7d71e007da0..b70b9f9e241a 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt792x.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
> @@ -221,6 +221,8 @@ struct mt792x_phy {
>         u32 ampdu_ref;
>
>         struct mt76_mib_stats mib;
> +       struct mt76_channel_state state_ts[2];
> +       unsigned long survey_hold;
>
>         u8 sta_work_count;
>         u8 clc_chan_conf;
>
> base-commit: 831e33ad02ff884ecc793c07a9c9bd9e06941fe5
> --
> 2.56.1
>

On Sat, Nov 14, 2026, Devin Wittmayer wrote:
> Chris, your readings near 2^64 match the RFC's math at a wrap. v2
> can't go backwards.

You're right. I was wrong on Nov 13: those readings actually came from the
RFC as posted, not with the 32-bit change.

The initramfs here carries the mt76 modules, and installing a DKMS
build doesn't regenerate it. The kernel I booted back on Nov 5th had been
installed two days earlier and so its initramfs held my RFC build... and
that's what loaded, not the build with the change on disk. The
srcversions bear it out: the loaded mt7925-common never matched the
32-bit build's file...and I only found it today, when the same thing
happened with v2.

But v2 is now loaded here, on the A9000 on USB 2.0. I'll send a Tested-by
after a few days of scanning and some long downloads.

Chris

