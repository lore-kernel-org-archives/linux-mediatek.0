Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 391FEEEC2AD
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Feb 2026 23:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RXZF4vdLhFm9lZLgEOqyrOLWugqBrljutWDwedpLWLM=; b=ZryOWCNNL5xjNF034Z2Mlh3Yxw
	OmQrc1dnQ7kj9alTHqKR3Cy8+qTgYAPlHxhSHmjBLLG26l41pqzsaU7BjGUVWaEVaYb2wjLUxwAeX
	7hv8BU1+ZDmv7VfYKzv46LDLOa2WtTcpCCuTDi+74/5ZOVJB4jZiMX0cpZTuIML4gh1IR4Gd6rcQV
	DhjG/dU/OyzjFgyBTQoRksJkLqPCmcMUXgH5iX90jAUC+751yAfyGLXgCp3UAUf2HwQTtST1CvPhg
	93BJpJCo5QfiNzTAwHvCATrvkkNH7LlmtmTcOtvA7eCNBVwhW9IkQ5RWhqtm6I555Rzz3O+C0+Qcj
	+/+TE4ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vufB6-00000001AMm-1wpz;
	Mon, 23 Feb 2026 23:17:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vufB3-00000001ALa-1AdA
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Feb 2026 23:17:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4DD1344585
	for <linux-mediatek@lists.infradead.org>; Mon, 23 Feb 2026 23:17:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3255DC19424
	for <linux-mediatek@lists.infradead.org>; Mon, 23 Feb 2026 23:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771888639;
	bh=5JuzvkdZ+fCWCL/51W1HKD/vNBKYgiS0gQvQiaEM/SM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qbhre8IRs2gr3TwtmlhY30ubRiN97xfAFGqzCIdBU+3MgZL7+cKsV4LhkEeVNwhtz
	 u0wQytj5Fe8FLB6ar/GE8W1KmqRUT5lPKF4eFpoqmsUETGCJi7kdTc6vc2lAPP5Vfe
	 FN0YCUvAIYqFDzZnFwmRBZmdKhS/8MKl3A/fiVd8fH5dJtuHg84jlbSu8LiwBJNVW2
	 LWsHunNMBg0oyyaLBiQ0yHqA92fMbcvWJOjGppi5tukqH4tjNUbZ/cnvGTGpWAdDuz
	 SW9hxg8MwlRTqkNh9zRHYbadCLT1SWu60+fa9NcOo15Ujd7TLdrgUgsfJupCadYAli
	 AWLuYKFt+28Pw==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3870778358aso40760101fa.1
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Feb 2026 15:17:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXTp9OLLu+fUvbofEXwhy1O8ws3qgDMwjBsbBy7Vgb6Y6Hs/Mz7gouJuQyoU6qS5+TGgidaqHKDEkL9intlJQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwURBFkHDuh7QIv9bSvXTaycQ9KEF2Eig/6TOIbhEY/4d5xQd8h
	KTgVqyt4IHQ1PqqAGhoduvgxtpD3Lr9GmrO/3VQ0nkFrtsZA9EoO5BSQzThQjKTL+o0DMA4vFZH
	kLtAijzK2lK84Z0ZD8GlsboFXpG65FQY=
X-Received: by 2002:a05:651c:1510:b0:387:a08:2775 with SMTP id
 38308e7fff4ca-389a5e07004mr40123091fa.28.1771888637417; Mon, 23 Feb 2026
 15:17:17 -0800 (PST)
MIME-Version: 1.0
References: <20260223073854.2464232-1-jb.tsai@mediatek.com> <20260223073854.2464232-3-jb.tsai@mediatek.com>
In-Reply-To: <20260223073854.2464232-3-jb.tsai@mediatek.com>
From: Sean Wang <sean.wang@kernel.org>
Date: Mon, 23 Feb 2026 17:17:04 -0600
X-Gmail-Original-Message-ID: <CAGp9LzrOsrotdri+wSLKYTyPNZZkEy2uSRcm+ku75aKB=mWPNw@mail.gmail.com>
X-Gm-Features: AaiRm52cyLR720w3qgjA0NPE5WahHkkNj-g4t5En_hpk8M-dyNyFnLX8XpDugRU
Message-ID: <CAGp9LzrOsrotdri+wSLKYTyPNZZkEy2uSRcm+ku75aKB=mWPNw@mail.gmail.com>
Subject: Re: [PATCH 3/5] wifi: mt76: mt7921: refactor regulatory notifier flow
To: JB Tsai <jb.tsai@mediatek.com>
Cc: nbd@nbd.name, lorenzo@kernel.org, linux-wireless@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, Deren.Wu@mediatek.com, 
	Sean.Wang@mediatek.com, Quan.Zhou@mediatek.com, Ryder.Lee@mediatek.com, 
	Leon.Yen@mediatek.com, litien.chang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_151721_399730_75CC5A63 
X-CRM114-Status: GOOD (  20.03  )
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

Hi, JB

On Mon, Feb 23, 2026 at 1:40=E2=80=AFAM JB Tsai <jb.tsai@mediatek.com> wrot=
e:
>
> Rename mt7921_regd_update() to mt7921_mcu_regd_update() to centralize
> regd updates with error handling.
>
> Signed-off-by: JB Tsai <jb.tsai@mediatek.com>
> ---
>  .../net/wireless/mediatek/mt76/mt7921/pci.c   |  2 +-
>  .../net/wireless/mediatek/mt76/mt7921/regd.c  | 45 +++++++++++++------
>  .../net/wireless/mediatek/mt76/mt7921/regd.h  |  3 +-
>  3 files changed, 35 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7921/pci.c
> index a173a61f2b49..3fdf55c056a6 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
> @@ -545,7 +545,7 @@ static int mt7921_pci_resume(struct device *device)
>         if (err < 0)
>                 goto failed;
>
> -       mt7921_regd_update(dev);
> +       mt7921_mcu_regd_update(dev, mdev->alpha2, dev->country_ie_env);
>         err =3D mt7921_mcu_radio_led_ctrl(dev, EXT_CMD_RADIO_ON_LED);
>  failed:
>         pm->suspended =3D false;
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/regd.c b/drivers/n=
et/wireless/mediatek/mt76/mt7921/regd.c
> index 70440ab8ba82..f795ee2eb446 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/regd.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/regd.c
> @@ -72,18 +72,43 @@ mt7921_regd_channel_update(struct wiphy *wiphy, struc=
t mt792x_dev *dev)
>         }
>  }
>
> -void mt7921_regd_update(struct mt792x_dev *dev)
> +int mt7921_mcu_regd_update(struct mt792x_dev *dev, u8 *alpha2,
> +                          enum environment_cap country_ie_env)

To keep naming consistent, how about renaming mt7921_mcu_regd_update
to mt7921_regd_mcu_update, matching the mt7921_regd_* prefix?

>  {
>         struct mt76_dev *mdev =3D &dev->mt76;
>         struct ieee80211_hw *hw =3D mdev->hw;
>         struct wiphy *wiphy =3D hw->wiphy;
> +       int ret =3D 0;
> +
> +       dev->regd_in_progress =3D true;
> +
> +       mt792x_mutex_acquire(dev);
> +       if (!dev->regd_change)
> +               goto err;
> +
> +       ret =3D mt7921_mcu_set_clc(dev, alpha2, country_ie_env);
> +       if (ret < 0)
> +               goto err;
>

I=E2=80=99d prefer to keep the refactor logic-preserving. The new error
handling and flag sequencing  the dev->regd_change handling looks like
a functional change, so it would be clearer as a follow-up patch where
the behavior change can be explained. For example, the
dev->regd_change handling could be moved to the =E2=80=9Cwifi: mt76: mt7921=
:
add auto regdomain switch support=E2=80=9D patch so the regd_change flow is
handled end-to-end there.

> -       mt7921_mcu_set_clc(dev, mdev->alpha2, dev->country_ie_env);
>         mt7921_regd_channel_update(wiphy, dev);
> -       mt76_connac_mcu_set_channel_domain(hw->priv);
> -       mt7921_set_tx_sar_pwr(hw, NULL);
> +
> +       ret =3D mt76_connac_mcu_set_channel_domain(hw->priv);
> +       if (ret < 0)
> +               goto err;
> +
> +       ret =3D mt7921_set_tx_sar_pwr(hw, NULL);
> +       if (ret < 0)
> +               goto err;
> +
> +err:
> +       mt792x_mutex_release(dev);
> +       dev->regd_change =3D false;
> +       dev->regd_in_progress =3D false;
> +       wake_up(&dev->wait);
> +
> +       return ret;
>  }
> -EXPORT_SYMBOL_GPL(mt7921_regd_update);
> +EXPORT_SYMBOL_GPL(mt7921_mcu_regd_update);
>
>  void mt7921_regd_notifier(struct wiphy *wiphy,
>                           struct regulatory_request *request)
> @@ -106,12 +131,6 @@ void mt7921_regd_notifier(struct wiphy *wiphy,
>         if (pm->suspended)
>                 return;
>
> -       dev->regd_in_progress =3D true;
> -
> -       mt792x_mutex_acquire(dev);
> -       mt7921_regd_update(dev);
> -       mt792x_mutex_release(dev);
> -
> -       dev->regd_in_progress =3D false;
> -       wake_up(&dev->wait);
> +       mt7921_mcu_regd_update(dev, request->alpha2,
> +                              request->country_ie_env);
>  }
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/regd.h b/drivers/n=
et/wireless/mediatek/mt76/mt7921/regd.h
> index 74bc2fdd532c..da5bd4450312 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/regd.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/regd.h
> @@ -6,7 +6,8 @@
>
>  #include "mt7921.h"
>
> -void mt7921_regd_update(struct mt792x_dev *dev);
> +int mt7921_mcu_regd_update(struct mt792x_dev *dev, u8 *alpha2,
> +                          enum environment_cap country_ie_env);
>  void mt7921_regd_notifier(struct wiphy *wiphy,
>                           struct regulatory_request *request);
>  bool mt7921_regd_clc_supported(struct mt792x_dev *dev);
> --
> 2.45.2
>
>

