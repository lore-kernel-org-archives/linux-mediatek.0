Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 012D8CF45D5
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jan 2026 22:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4w19gL9Si5xuUOM+xx0Gkc/M1vHSFtlbSnI9ldzTAww=; b=T7nHWNtLwnHo+eBUo1803dHCV6
	9LLnb4SOrHiwF2yGTPAq6Tx8YWQdR1Fu87lvuFX987e+4RiM/deWZJG+h1IZsf5bdfukSwoTWiVD+
	mhINZ2P6bExwwKuKi6MLWlEnWw6FZ4wErpNnNO1eLwEf5HnuQGHkrLDGepqkqp1S6gOE+ve2znGAT
	/YxZITwskVJ5r2PWWd6Rlg0PV4nEjnWbupE5dpExQX/xBrbk0okKu/P9dsFSjEahWa1SKPgyTFVuW
	hR0vxQXNhEhuq4tW+DVR3dNuZwAqoZMBgFtl9vDmXBgIwVF6SxNgLRq183HJEg1VAFk+AEWTKGlle
	BKb+h0zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfQIe-00000006FPx-1Bkr;
	Mon, 12 Jan 2026 22:22:12 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfQIb-00000006FP8-0Bd3
	for linux-mediatek@lists.infradead.org;
	Mon, 12 Jan 2026 22:22:10 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2a0f3f74587so51509965ad.2
        for <linux-mediatek@lists.infradead.org>; Mon, 12 Jan 2026 14:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1768256528; x=1768861328; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4w19gL9Si5xuUOM+xx0Gkc/M1vHSFtlbSnI9ldzTAww=;
        b=boPJePymbvKlxGfcSUOMsgsoyvA3DchnMbZoNqrR329NgCM39BqAsODsDra3+pJi1T
         9x4vk10KEI+mE9n2l4ndw7PhdHn+VR/y2G4Ro6i3FUYwJmZy0j9a8HXzbI9FQaSN81We
         ++6rSyfI/LDlwXtxUjoAlHnj8qvkQy9+6lY7Vcq9dsikJj8gWYNqOnzjdpWp1bQvL+Hr
         tvK2ANdF6YSp4ZBbCuFO2emOWQSqwVzuS2B/l186OOVrKI1MWhAiBXG6RHc/b/2bI9c+
         zcmajo0SRZrfJH2TNBXSXUXPu6y8OhKRpEMiLHftxnyxiGTzpolnnIqs68feZkvAD7LZ
         4cHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768256528; x=1768861328;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4w19gL9Si5xuUOM+xx0Gkc/M1vHSFtlbSnI9ldzTAww=;
        b=GnZUAOtEyqhWdMtTf78S1RSfdAm+YAbdxiodNLxnQ8iAke9n1vyE3dRLr8vyRrL/Io
         LS6zPCyE488RV/ISvnJ73v/4eh31Cfvoy6uBV+0YBsHZu1jdAM1GlDKq8pFLlW3hh9eQ
         2OMdoJ3TMECyduu0YnM8hr6VJSM5FcFnEWP+Gs8exYwIeBiF9bEpVLTFy4d1XwXZCu1X
         5MwzI5jrCeWTZKKeAMeMIEVsoxVn0RHUlvftHLaC/8Bmm9plC/Dpazjjmm3g5mvC++xY
         rdaa4tmo+pGyOtRNPP0kxg8mTr7NoQyir7fLfO+gyavD+MJsgGnCLbNOyrgJ5xBne72G
         Yp5Q==
X-Forwarded-Encrypted: i=1; AJvYcCX3N55oAaqXINQVMtMXLEroJWCgZfMMi11bGTBZsisS/4kkc5Birm9+dyUP3rdjG40u3JOwhe7kEyV2q/j9Zg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwF/TeChw5kjAeCuJQPoV3mLeID1khuoAtV2z6/wPU7JhgLtSMD
	uGk/aAtCHOHQPlteNAk3vVfxi4kpjJGEfrYkMCSbyIbBNDVtlJW473knyzL0oLwAJgi0ExhgqtL
	nL9LXmeuoAHSQB5hsL19DXUr8EdyRsr0=
X-Gm-Gg: AY/fxX7OAtAdzXH/FRnHeNelEgtQxyjUo5vmCTG40d++4eolibWiLQeYeaaIsNuPIvi
	XXSuMzcOeDD0a/GI1qf66wj60ilb52/ZA84RTmwgo2MVMX0dKLDyUvfJeW6vw4zluns7oIMH15L
	xmGprIkthe0Zg0k0cpkfo0wL9/mVAXZQSo95igU1+qMmmI2q8OOYzVyQRwytFleubmSsuiBti49
	I6FtuKcywAyBnBGNpcnYVDw0jqfU8PI9P95AFQLE1bBsG2FRtj/8bCHzHjztzrMqE/EdrtcOnq1
	ro38p4O6ZMEYcnHfUeLGQK4bOzdE
X-Google-Smtp-Source: AGHT+IF7+Y5y+W1I/oKu3PaWNvUb9K8PSy+WoJh05TRnlBlC82+qzM+GksYGzWHyPWmgmkdzBXyTwo91e0gYk9qAGBM=
X-Received: by 2002:a17:903:40ca:b0:295:592e:7633 with SMTP id
 d9443c01a7336-2a3ee4c0fb5mr187274885ad.29.1768256527834; Mon, 12 Jan 2026
 14:22:07 -0800 (PST)
MIME-Version: 1.0
References: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-0-8d7a3dbacdf4@bootlin.com>
 <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-2-8d7a3dbacdf4@bootlin.com>
In-Reply-To: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-2-8d7a3dbacdf4@bootlin.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 12 Jan 2026 23:21:56 +0100
X-Gm-Features: AZwV_Qj9tssGMaPejz2Zl0XwPzPqVqwiSQM5-St_AAUm7gwon2Sgi9P4XfkbVUU
Message-ID: <CAFBinCBWUXNwEDCJNEmdCtOcGO9eVFfZFC9p9fpdRTesZ7xBSQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] drm/meson/dw-hdmi: convert to of_drm_find_and_get_bridge()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_142209_353991_97050A20 
X-CRM114-Status: GOOD (  13.74  )
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

Hi Luca,

On Fri, Jan 9, 2026 at 11:03=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
>
> of_drm_find_bridge() is deprecated. Move to its replacement
> of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
> is put when done.
>
> dw_hdmi->bridge is used only in dw_hdmi_top_thread_irq(), so in order to
> avoid potential use-after-free ensure the irq is freed before putting the
> dw_hdmi->bridge reference.
>
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

[...]
> @@ -789,8 +789,12 @@ static void meson_dw_hdmi_unbind(struct device *dev,=
 struct device *master,
>                                    void *data)
>  {
>         struct meson_dw_hdmi *meson_dw_hdmi =3D dev_get_drvdata(dev);
> +       struct platform_device *pdev =3D to_platform_device(dev);
> +       int irq =3D platform_get_irq(pdev, 0);
>
> +       devm_free_irq(dev, irq, meson_dw_hdmi);
I have one question (so I can understand things better):
is there a particular reason why you went with free'ing the IRQ
instead of "just" masking it (so the hardware won't fire anymore of
those IRQs)?


Best regards,
Martin

