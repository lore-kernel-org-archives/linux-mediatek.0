Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE2DC001DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jul 2023 03:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rl5lGVY7BMmdw8t6AmZWyI2tAs0TkZaYFmG/Yn+zkOE=; b=dg7oODDe1mLZ+s4/rZED6dCvEi
	B1nHmLDyjblOSlVdB7znrwJ70d79beuB+TBsYS1ibTRDXSSauG8pawzi/gVfl6icPGM+sF2cCchIW
	ggsKEty35RMDOWZw1FJAR7SYwEwhFnsBAbVHVPblbWgW4OHgZugr7xK2swbG63FdXOCLxIvPWhCRA
	cDb2Rl49qVmc1MvWq4k8idZ6TBFR/85Z05/GlWdo+CHiozHalntveCzG2jr5vAAXZXdoPTY278kLI
	xEV3cTt73c7tCVJRp2jJXUhe32J+ZMDAZgI5VsOT4jMOC468KH6DI+ercK2enuauMT0sNQJcO1Zwv
	zGBmfITg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOrvu-00C2Os-1V;
	Thu, 27 Jul 2023 03:44:58 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOrvr-00C2OZ-0A
	for linux-mediatek@lists.infradead.org;
	Thu, 27 Jul 2023 03:44:56 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-6b9d68a7abaso415132a34.3
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Jul 2023 20:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690429493; x=1691034293;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rl5lGVY7BMmdw8t6AmZWyI2tAs0TkZaYFmG/Yn+zkOE=;
        b=g38GMFfkuVeYzUqDw9WgNE6W5BCkKI3qxe7fQRGplWYRyiGFSdpQjAE3AeBUDZ+omJ
         4TF3wbGu9ZZBg53CdKixBgkrp/p7/oaniL7QGpP07BxW5qg/kvhTwKlD6QpY1dhhzd85
         5lBu4HdGYy1Gbq9q1uRf/os6aDc6vo7vtvqmY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690429493; x=1691034293;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rl5lGVY7BMmdw8t6AmZWyI2tAs0TkZaYFmG/Yn+zkOE=;
        b=E5yg/5LfsXpvK3CjLYOlMargBj/npjM4BGIdj6WDLHLzHtzxzJUiQEhralrWSrq9lE
         7bs8d14WPi1WQ7x0fKk1H/wteyCfhlOAD2wAGDg6J07zaj8gxqx/n02kWHClTpwwBVu5
         Nc4BGXrSaZdJS8Qwxm2+9DaK1gRnpLGOOsCeunxpIO3kIqy+qPkuUBBNinqIvBXg4f6L
         Yd6/IYy8V9JVFqZVSIzFzE8RAK8SHfG//77GLTGdT/6Md6i4GH/WpZQBWxkfHtRryjWf
         0VS3U8lcl3FcJC0rgkF9kNU39o2azSgyZzPuw+wJNlYCdiZmiqRMJXb1HISQmVEcUZsn
         KvFw==
X-Gm-Message-State: ABy/qLYESCoBBVpJ4w8XtAU2IN6dIk0leFUFgDovWX5j7hsrrpnXo7E4
	U1hZDQsZF0uLPDBV9EYZwYxwQDmy+dmffrI51+GpRlse
X-Google-Smtp-Source: APBJJlHz21q5rxLzLekRyezHWKWFYUDiY+xtYX9bUVxmZMugrEWv9qi+kKg89fJDWBX9Hg0DYf2dBg==
X-Received: by 2002:a9d:748c:0:b0:6b8:7166:ea5a with SMTP id t12-20020a9d748c000000b006b87166ea5amr4385609otk.13.1690429493431;
        Wed, 26 Jul 2023 20:44:53 -0700 (PDT)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com. [209.85.210.47])
        by smtp.gmail.com with ESMTPSA id j24-20020a9d7398000000b006b8b1422daasm322329otk.3.2023.07.26.20.44.53
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 20:44:53 -0700 (PDT)
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-6b9c57c4d12so425541a34.1
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Jul 2023 20:44:53 -0700 (PDT)
X-Received: by 2002:a1f:3d57:0:b0:486:5719:f4e0 with SMTP id
 k84-20020a1f3d57000000b004865719f4e0mr651152vka.7.1690429472201; Wed, 26 Jul
 2023 20:44:32 -0700 (PDT)
MIME-Version: 1.0
References: <8fd42ac8e1c97246f6e65225a14fc8a029ac3aaa.1690232804.git.objelf@gmail.com>
 <7c7c2c1f0584e8dd016bc2bf8de88684fcc7679c.1690232804.git.objelf@gmail.com>
In-Reply-To: <7c7c2c1f0584e8dd016bc2bf8de88684fcc7679c.1690232804.git.objelf@gmail.com>
From: David Ruth <druth@chromium.org>
Date: Wed, 26 Jul 2023 23:43:55 -0400
X-Gmail-Original-Message-ID: <CAKHmtrQVp9yV1uFagENxW1ra3sVCf-9WP4thpQ97runk3PaXKA@mail.gmail.com>
Message-ID: <CAKHmtrQVp9yV1uFagENxW1ra3sVCf-9WP4thpQ97runk3PaXKA@mail.gmail.com>
Subject: Re: [PATCH 2/2] wifi: mt76: mt7921: fix the wrong rate pickup for the
 chanctx driver
To: sean.wang@mediatek.com
Cc: nbd@nbd.name, lorenzo.bianconi@redhat.com, Soul.Huang@mediatek.com, 
	Leon.Yen@mediatek.com, Eric-SY.Chang@mediatek.com, Deren.Wu@mediatek.com, 
	km.lin@mediatek.com, jenhao.yang@mediatek.com, robin.chiu@mediatek.com, 
	Eddie.Chen@mediatek.com, ch.yeh@mediatek.com, ted.huang@mediatek.com, 
	Stella.Chang@mediatek.com, Tom.Chou@mediatek.com, jsiuda@google.com, 
	arowa@google.org, frankgor@google.com, kuabhs@google.com, 
	abhishekpandit@google.com, shawnku@google.com, linux-wireless@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_204455_090193_11FF6C8A 
X-CRM114-Status: GOOD (  20.29  )
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

Reviewed-by: David Ruth <druth@chromium.org>
Tested-by: David Ruth <druth@chromium.org>

On Mon, Jul 24, 2023 at 5:20=E2=80=AFPM <sean.wang@mediatek.com> wrote:
>
> From: Sean Wang <sean.wang@mediatek.com>
>
> The variable band should be determined by the ieee80211_chanctx_conf when
> the driver is a kind of chanctx one e.g mt7921 and mt7922 driver so we
> added the extension to mt76_connac2_mac_tx_rate_val by distinguishing if
> it can support chanctx to fix the incorrect rate pickup.
>
> Fixes: 41ac53c899bd ("wifi: mt76: mt7921: introduce chanctx support")
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mac80211.c        | 9 +++++++--
>  drivers/net/wireless/mediatek/mt76/mt76.h            | 3 ++-
>  drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c | 7 +++++--
>  3 files changed, 14 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/=
wireless/mediatek/mt76/mac80211.c
> index c0ff36a98bed..d622a2916c0e 100644
> --- a/drivers/net/wireless/mediatek/mt76/mac80211.c
> +++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
> @@ -1698,11 +1698,16 @@ mt76_init_queue(struct mt76_dev *dev, int qid, in=
t idx, int n_desc,
>  }
>  EXPORT_SYMBOL_GPL(mt76_init_queue);
>
> -u16 mt76_calculate_default_rate(struct mt76_phy *phy, int rateidx)
> +u16 mt76_calculate_default_rate(struct mt76_phy *phy,
> +                               struct ieee80211_vif *vif, int rateidx)
>  {
> +       struct mt76_vif *mvif =3D (struct mt76_vif *)vif->drv_priv;
> +       struct cfg80211_chan_def *chandef =3D mvif->ctx ?
> +                                           &mvif->ctx->def :
> +                                           &phy->chandef;
>         int offset =3D 0;
>
> -       if (phy->chandef.chan->band !=3D NL80211_BAND_2GHZ)
> +       if (chandef->chan->band !=3D NL80211_BAND_2GHZ)
>                 offset =3D 4;
>
>         /* pick the lowest rate for hidden nodes */
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wire=
less/mediatek/mt76/mt76.h
> index bf9c781ff48c..a292e15224e1 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt76.h
> @@ -1100,7 +1100,8 @@ int mt76_get_of_eeprom(struct mt76_dev *dev, void *=
data, int offset, int len);
>  struct mt76_queue *
>  mt76_init_queue(struct mt76_dev *dev, int qid, int idx, int n_desc,
>                 int ring_base, u32 flags);
> -u16 mt76_calculate_default_rate(struct mt76_phy *phy, int rateidx);
> +u16 mt76_calculate_default_rate(struct mt76_phy *phy,
> +                               struct ieee80211_vif *vif, int rateidx);
>  static inline int mt76_init_tx_queue(struct mt76_phy *phy, int qid, int =
idx,
>                                      int n_desc, int ring_base, u32 flags=
)
>  {
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c b/drive=
rs/net/wireless/mediatek/mt76/mt76_connac_mac.c
> index ee5177fd6dde..d91f5548dc02 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
> @@ -310,7 +310,10 @@ u16 mt76_connac2_mac_tx_rate_val(struct mt76_phy *mp=
hy,
>                                  struct ieee80211_vif *vif,
>                                  bool beacon, bool mcast)
>  {
> -       u8 nss =3D 0, mode =3D 0, band =3D mphy->chandef.chan->band;
> +       struct mt76_vif *mvif =3D (struct mt76_vif *)vif->drv_priv;
> +       struct cfg80211_chan_def *chandef =3D mvif->ctx ?
> +                                           &mvif->ctx->def : &mphy->chan=
def;
> +       u8 nss =3D 0, mode =3D 0, band =3D chandef->chan->band;
>         int rateidx =3D 0, mcast_rate;
>
>         if (!vif)
> @@ -343,7 +346,7 @@ u16 mt76_connac2_mac_tx_rate_val(struct mt76_phy *mph=
y,
>                 rateidx =3D ffs(vif->bss_conf.basic_rates) - 1;
>
>  legacy:
> -       rateidx =3D mt76_calculate_default_rate(mphy, rateidx);
> +       rateidx =3D mt76_calculate_default_rate(mphy, vif, rateidx);
>         mode =3D rateidx >> 8;
>         rateidx &=3D GENMASK(7, 0);
>  out:
> --
> 2.25.1
>

