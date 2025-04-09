Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE337C36002
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Apr 2025 06:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xPFx8UgUAY0xlIDn/x5aIYb1lovd1B9jsWSk1FiXXns=; b=3nOgX+ZONQkrg+ltoRxKyKb/tZ
	IU3PWuACI8q6hz0GKRgkOhlt9LgCyo280we/DtNIcKvkcgxZyRZlEK3IrHa60kcd3m+jTNm31BFn5
	wV60jyEiYiaMXYHgqnXC5fMD6TrKMWd+pv/TKedU8hjQTnDO3RxYx+W0QS5zUUV8b8iB+Lw3JxFCj
	gUdYnp5vQmBmrPacz9E5b+l3abkMCx9kwM2ai/TYdZGamwLQ3rQYs7rfdtm00ppK00mkdjozMeZ9y
	iPRRcmoPm1AVSV2T4cYjO/FbX/qAoUzF5ix2qYgkj5A5N1wt1uf/m1vDadmQ6JdbK8bzRMlOIMVoS
	aZicjviA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Omr-00000006Gfc-3NQb;
	Wed, 09 Apr 2025 06:19:49 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Omq-00000006Gem-0BZz
	for linux-mediatek@lists.infradead.org;
	Wed, 09 Apr 2025 06:19:49 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-54b09cb06b0so6681379e87.1
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Apr 2025 23:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744179586; x=1744784386; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xPFx8UgUAY0xlIDn/x5aIYb1lovd1B9jsWSk1FiXXns=;
        b=PIwlUrjzSMhEGxKh/QXu9XUbe6lwYmX/9oycvx94itGqXx7/LxWF+JDACHMeZPvlEQ
         tBthxITb2bDN6HeRWGwOV5a/Sl5FNAhsKgwib8OUJoproGv+m9zEZD8M5Xdmqr9FuRiN
         EPk/+nLCUNYhAPNPkPDyxWt+SKv14/EhERynE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744179586; x=1744784386;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xPFx8UgUAY0xlIDn/x5aIYb1lovd1B9jsWSk1FiXXns=;
        b=IULC0Q0tkobeZj0Dgk66pwA/mZ06ydQ7wt2xw0ZZPHRc/skluZaGZXDse8HexOWg7J
         k+jSIygaarKiYHNlIJtHNacQ+AWIbkkMTsPqDU7AAyew+HD3RQnObeXFaFu042YtEqLb
         xzbqU5j9I4ZhRx92wOGZB86PfIMnYh5Kxtf4F4UyzzRaNNMg2m2K6MAH2MWpkayZL1IB
         Q8hqc3hzsJfs2S8QxfI4dQPYUgovEm2zs0vF+VNjXoTqEB8eUj4gNXLMkIcHrhEDsRxU
         vCRi9Lw6wuSmT9fjzGBrKRy1mCgmFJ4b7oo4EPh+pAVdGl5Yh+4EDPBlxBZSsGWtf0JH
         gnmg==
X-Forwarded-Encrypted: i=1; AJvYcCXflo6ZIXYL45KuRv15qA1X9yC/LzJKMV8/Ppl87has4nOHP8GkLh8noBvLJJk9X+TzBW5tYqZHNJ6UCgjXjg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yygu3U3tb8GhRqLiK67nDy6Rj6snLwJ76jMmL7qQW5w3PaOcL7M
	YDYLmrF1jCmxSGTBxEiMnl160jcsQwFyv3CnwTIx+h2ywc+G0NG7mV/Bjy2RfwL0Rn/Hy13yZSn
	nTTMtEZyEh9lvcJBg/xpoGkmsEZZQhUBpujof
X-Gm-Gg: ASbGncu7+ZCAv4MJMiMpx6xStj4f9RZaaFynN6QkMbh3YJYCW4mfTAYnIb5PbSlf0dK
	73bYaVdRRVpZIAYVvoNPVG5vj90scrS7o6Kj/wX+1yNFe/+IOl6eWvj8L5rYtIxOudUZmRxzmRR
	7Pi0id05Euw6dDVnaJ/bPDJeHrYaF+PVwXBGU4SjhiRB39hpeRBg==
X-Google-Smtp-Source: AGHT+IF6USYpAM9lg3k8+AOqxfZjq6iN1XgABgZ7lN+hrkpyKB/hsy6JujD3QodyEr1gyD8+wAk4r3Qa2Kqqw1r74QQ=
X-Received: by 2002:a05:6512:1103:b0:545:49d:5474 with SMTP id
 2adb3069b0e04-54c4370f307mr358171e87.20.1744179585702; Tue, 08 Apr 2025
 23:19:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250403110915.75322-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250403110915.75322-1-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 9 Apr 2025 14:19:34 +0800
X-Gm-Features: ATxdqUGA8j7J3cMwwhvKkgHKxtLogzcNaUx9TtG6kN-tP3TulVKQHf_ux6bE6j8
Message-ID: <CAGXv+5G8kUg87+JzuCW5sZKHTBA3-CnwSFdrucn_k1rgcpJHOg@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: mtk_dp: Fix hdmi codec and phy driver unregistration
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, matthias.bgg@gmail.com, nancy.lin@mediatek.com, 
	ck.hu@mediatek.com, djkurtz@chromium.org, littlecvr@chromium.org, 
	bibby.hsieh@mediatek.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_231948_207379_3F484A87 
X-CRM114-Status: GOOD (  24.11  )
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

On Thu, Apr 3, 2025 at 7:09=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> During probe, this driver is registering two platform devices: one
> for the HDMI Codec driver and one for the DisplayPort PHY driver.
>
> In the probe function, none of the error cases are unregistering
> any of the two platform devices and this may cause registration
> of multiple instances of those in case this driver returns one or
> more probe deferral(s) in the "wrong" spots.
>
> In order to fix this, add devm actions to unregister those and
> remove the manual calls to platform_device_unregister in the
> mtk_dp_remove() function, as those would otherwise be redundant.
>
> Fixes: e71a8ebbe086 ("drm/mediatek: dp: Audio support for MT8195")
> Fixes: caf2ae486742 ("drm/mediatek: dp: Add support for embedded DisplayP=
ort aux-bus")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dp.c | 30 ++++++++++++++++++++++++++----
>  1 file changed, 26 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek=
/mtk_dp.c
> index 3d4648d2e15f..3eb685a46d99 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -2648,6 +2648,13 @@ static const struct hdmi_codec_ops mtk_dp_audio_co=
dec_ops =3D {
>         .hook_plugged_cb =3D mtk_dp_audio_hook_plugged_cb,
>  };
>
> +static void mtk_dp_unregister_pdevs(void *data)
> +{
> +       struct platform_device *ext_pdev =3D data;
> +
> +       platform_device_unregister(ext_pdev);
> +}
> +
>  static int mtk_dp_register_audio_driver(struct device *dev)
>  {
>         struct mtk_dp *mtk_dp =3D dev_get_drvdata(dev);
> @@ -2658,18 +2665,29 @@ static int mtk_dp_register_audio_driver(struct de=
vice *dev)
>                 .data =3D mtk_dp,
>                 .no_capture_mute =3D 1,
>         };
> +       int ret;
>
>         mtk_dp->audio_pdev =3D platform_device_register_data(dev,
>                                                            HDMI_CODEC_DRV=
_NAME,
>                                                            PLATFORM_DEVID=
_AUTO,
>                                                            &codec_data,
>                                                            sizeof(codec_d=
ata));
> -       return PTR_ERR_OR_ZERO(mtk_dp->audio_pdev);
> +       if (IS_ERR(mtk_dp->audio_pdev))
> +               return PTR_ERR(mtk_dp->audio_pdev);
> +
> +       ret =3D devm_add_action_or_reset(dev, mtk_dp_unregister_pdevs, mt=
k_dp->phy_dev);

Wrong platform device given here. You want audio_pdev instead.


Having briefly looked at this driver, I think it needs more cleanup. :o


ChenYu

> +       if (ret) {
> +               platform_device_unregister(mtk_dp->audio_pdev);
> +               return dev_err_probe(dev, ret,
> +                                    "Failed to add codec unregister devm=
 action");
> +       }
> +       return 0;
>  }
>
>  static int mtk_dp_register_phy(struct mtk_dp *mtk_dp)
>  {
>         struct device *dev =3D mtk_dp->dev;
> +       int ret;
>
>         mtk_dp->phy_dev =3D platform_device_register_data(dev, "mediatek-=
dp-phy",
>                                                         PLATFORM_DEVID_AU=
TO,
> @@ -2679,6 +2697,13 @@ static int mtk_dp_register_phy(struct mtk_dp *mtk_=
dp)
>                 return dev_err_probe(dev, PTR_ERR(mtk_dp->phy_dev),
>                                      "Failed to create device mediatek-dp=
-phy\n");
>
> +       ret =3D devm_add_action_or_reset(dev, mtk_dp_unregister_pdevs, mt=
k_dp->phy_dev);
> +       if (ret) {
> +               platform_device_unregister(mtk_dp->phy_dev);
> +               return dev_err_probe(dev, ret,
> +                                    "Failed to add phy unregister devm a=
ction");
> +       }
> +
>         mtk_dp_get_calibration_data(mtk_dp);
>
>         mtk_dp->phy =3D devm_phy_get(&mtk_dp->phy_dev->dev, "dp");
> @@ -2848,9 +2873,6 @@ static void mtk_dp_remove(struct platform_device *p=
dev)
>         pm_runtime_disable(&pdev->dev);
>         if (mtk_dp->data->bridge_type !=3D DRM_MODE_CONNECTOR_eDP)
>                 del_timer_sync(&mtk_dp->debounce_timer);
> -       platform_device_unregister(mtk_dp->phy_dev);
> -       if (mtk_dp->audio_pdev)
> -               platform_device_unregister(mtk_dp->audio_pdev);
>  }
>
>  #ifdef CONFIG_PM_SLEEP
> --
> 2.48.1
>

