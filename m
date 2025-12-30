Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D74EE0215
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Dec 2025 15:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=luJpuX0RwJXsscpZJ9ordFnRhyuIP6pmGVi81YTnZ+A=; b=veV1sVO65WAxNXYHeQ9stCefjg
	1/icEj6U4ozcqCN8tD4Hub6f0RRp840ddk423jb94JmkHyHMkIKrlSNbVq6E7eQzLccTqrBFGdvUv
	2+kHPpNMW7nLyc6MNX2vpcc5Uq9xvhCfK5/ZgqblOP9PEB5KHvz3knQqEd+5RX44tEKP7NAV3+GXK
	jZRkMoQvSbXkp475NMMpWtxSVM0bXs02xZqGIXqouDXjzCViusdcot/o1OesshaPZ3ylNFO/vZrpK
	r13ud61mjQ39UOrQQhJ7Eb7S+SUkTtlXmbM3Y7Vk2MWCxV6tfNgtWitZEAxrPn/sNuA+szlZU/gSI
	Z0aaEEDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vabqb-000000050jx-09MJ;
	Tue, 30 Dec 2025 15:41:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vabqX-000000050jH-3OxJ
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Dec 2025 15:41:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 183414180A
	for <linux-mediatek@lists.infradead.org>; Tue, 30 Dec 2025 15:41:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB9FCC116D0
	for <linux-mediatek@lists.infradead.org>; Tue, 30 Dec 2025 15:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767109277;
	bh=gyHQKb3z1nk+UnpTmdOwQ9Nw5LQ39V8OUPvQxvyOONo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PhXvNZOCnwhyuQl/sJpP93msu9Bz2T1BSHWyMFhgu1rnkvjje2kXUP3mTYoyo/YBa
	 A8041AbNjQMhqHBamlugNvHPO+5bCDoZt6ZInP8Qm/SimipO6Ffjex3mCMUZvJW/Lp
	 DUWlRZz+BHD+9wVyWaQzpSKD2xsxHeDFY4cJsxhYqIKi7EaOepRspvDlrkwZEKti5Z
	 pwp6TTIYdcOV32pOtC/hmbSvML1tYP2xrzRE13sHlIRV7HAbuoyEPXWaVrNJ1DQDmL
	 aKZ100NRT/ZeY2YZv/xqjiWrG5OFE7UrscBpPhiwpx0hCtRfIzahaw6cedrNB5J2pg
	 fKFDeOSrmv1Gw==
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-121b251438eso3206601c88.0
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Dec 2025 07:41:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVx4JnROIXL3pEvV8owjPSKOguZsDcIbG8N3SihO2OqIK42LbYTkYB4D2lyfgA26ovX+A1+MTIxXWlTz9ExJA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzMXXcSkLebc2brCtJ6XhjnPw2WtZHrBcNBK6F7r+aohWoOlR6l
	Mh0KDcDd/eqV6mY5Oa/wPaZaEiy6NfjgifxwQ/S/BkibloJ4D6WI5ALtdGvg29eiyAGHpL6cAyQ
	e+/JU9CvUF8QZIyxWJ4qfHIbeRv+VGw==
X-Google-Smtp-Source: AGHT+IEh2n2zLpLnAWsSiBjd90/ps/z4xq2CFX5rKvlH82VgvcbIbEKrpQVoNU8JRj6mongRc2KFddek2E8g0FG2WcA=
X-Received: by 2002:a05:7022:e88e:b0:119:e569:f851 with SMTP id
 a92af1059eb24-1206193963cmr33079705c88.8.1767109276351; Tue, 30 Dec 2025
 07:41:16 -0800 (PST)
MIME-Version: 1.0
References: <aSW0p5sqnJVJsqDO@stanley.mountain>
In-Reply-To: <aSW0p5sqnJVJsqDO@stanley.mountain>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 30 Dec 2025 15:41:04 +0000
X-Gmail-Original-Message-ID: <CAAOTY__nif43taCWWdxfFqmtC=KibgJZ2AuUohiS1EdhXdDbow@mail.gmail.com>
X-Gm-Features: AQt7F2o-8OY-770n-RCRfh2pqvzP9k8Fyvdsrmq_wWlXdIFfmVOWee9EjRaS2wo
Message-ID: <CAAOTY__nif43taCWWdxfFqmtC=KibgJZ2AuUohiS1EdhXdDbow@mail.gmail.com>
Subject: Re: [PATCH next] drm/mediatek: Fix platform_get_irq() error checking
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>, 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_074117_892716_9DD45968 
X-CRM114-Status: GOOD (  15.82  )
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

Hi, Dan:

Dan Carpenter <dan.carpenter@linaro.org> =E6=96=BC 2025=E5=B9=B411=E6=9C=88=
25=E6=97=A5=E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=881:52=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> The platform_get_irq() function returns negative error codes on failure
> and positive non-zero IRQ numbers on success.  It never returns NULL. Fix
> the error checking to look for negatives, and change "hdmi->irq" from
> unsigned int to just int.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: 8d0f79886273 ("drm/mediatek: Introduce HDMI/DDC v2 for MT8195/MT81=
88")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_hdmi_common.c | 2 +-
>  drivers/gpu/drm/mediatek/mtk_hdmi_common.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c b/drivers/gpu/drm=
/mediatek/mtk_hdmi_common.c
> index e78eb0876f16..bd7f8c56ec9c 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
> @@ -303,7 +303,7 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *h=
dmi, struct platform_device
>                 return dev_err_probe(dev, ret, "Failed to get clocks\n");
>
>         hdmi->irq =3D platform_get_irq(pdev, 0);
> -       if (!hdmi->irq)
> +       if (hdmi->irq < 0)
>                 return hdmi->irq;
>
>         hdmi->regs =3D device_node_to_regmap(dev->of_node);
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.h b/drivers/gpu/drm=
/mediatek/mtk_hdmi_common.h
> index de5e064585f8..7a644bbf5843 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
> @@ -168,7 +168,7 @@ struct mtk_hdmi {
>         bool audio_enable;
>         bool powered;
>         bool enabled;
> -       unsigned int irq;
> +       int irq;
>         enum hdmi_hpd_state hpd;
>         hdmi_codec_plugged_cb plugged_cb;
>         struct device *codec_dev;
> --
> 2.51.0
>

