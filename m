Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2BEBC27C79
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jun 2024 14:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LhDJeMnYCly1AksyvwVp5K9DxC0qnqL9cMOKH85v0qI=; b=Mr69Yr1Jz9/QaX8Q32IpTOfJUQ
	N2czFbr1vgJ1REGyJ1w4WTq6EG2UF0tDLjuJi4O27Y9pAeP06rnURjk41MFIXvNi8d4PeiP7nwWGC
	xW7dIUcX90CF6a4D/wwloQHgU1cPAxxnbIOMdPOP5MqBZoLoKJyneewLEuQO4/a1TZthedQpjS+in
	JEl3UcpAFIizAECPsG05oWSB4IdZAYt1eM+0YSpilHKh7CDTbO4FyA8Sk6mE61XmEwp453VT2b0md
	diauFeNjz+8xM/KkLey3kI7dx4O8JY+dBrIqrAVTuuu8aZvXlIbiabTeV0SD6U8s+22XuFPaIm/tB
	wWvR7nVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKIe0-00000005Pbt-2Beo;
	Thu, 20 Jun 2024 14:20:08 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKIdx-00000005PaV-2IrH
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Jun 2024 14:20:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 49138CE2693
	for <linux-mediatek@lists.infradead.org>; Thu, 20 Jun 2024 14:20:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BE76C4AF08
	for <linux-mediatek@lists.infradead.org>; Thu, 20 Jun 2024 14:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718893201;
	bh=/JAmiiZWB1tRsr19XCxymVqTazffJcs1aVIaFgEx5Lg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hjKmnhmMuRYAIox5aFwp23aYhNQo09aZc6unr5JtyYrq13JS3cOL7wduKrXlEjmoR
	 OvPs2i8PelIqInD8a3IzgdJT5/vP6aofnkeG0bPqFv5gnYSL1vpYQuPrP378KYiwAj
	 GuWHxSaEn+1Aqww3Z5Z+vUcBlPE9Hwbc4ujvNKOnVzx6SPU9dAF8AkfkMfaggP/IYY
	 INuXmfGEBg51aKfr9/f5J1XF4I2bE+DnoVPpIR75l0itopeyE+/qCGDVR2MLdOBiNq
	 sjeiFGs/468ioohTStQ5WpaaBL7IA7m/RjoW7eGeED9y6cioBVEVDmvCEzejfMSeyp
	 cLtw2q7j17Pgg==
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1f4c7b022f8so8656025ad.1
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Jun 2024 07:20:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWTb5VRBm1Rat1HFLIA5tjFKeYWmFgbdmshQEyOo7PNvrObhS5GbDLWxevZ2YpVmh7sqfrGRCEPCMbzBULShuJwh0KXaa6lRH6vCm3mZxjTbFE1
X-Gm-Message-State: AOJu0YzVm+LIoco2j8B56JaHfyVBmrs0yFWM9eSrq11lUSI9NCD9D9Q6
	9crJrBMAuEjRww2zN+uwTsFECy9HIb9svnYWhfpUepo9ALxK1JpKggQYfP2Mgqx5S/JY7Kh5gFu
	on6oFM+rmLq5vljAE1OW3XD1gsA==
X-Google-Smtp-Source: AGHT+IFdX5LFhKH0jgJGzuBnyaSdfplQkl7Br4G/jei37asmuDLLgaokqkFn5thWy43rneZsfwc0lfFXrdK0roAHWok=
X-Received: by 2002:a17:902:f54d:b0:1f9:b7ea:c320 with SMTP id
 d9443c01a7336-1f9b7eac674mr34658135ad.41.1718893201169; Thu, 20 Jun 2024
 07:20:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240620054708.2230665-1-wenst@chromium.org>
In-Reply-To: <20240620054708.2230665-1-wenst@chromium.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 20 Jun 2024 22:20:07 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9tLUAcw+C5D78SNwrV6kHds7JhtAoFYFmxxfAH9vtkDQ@mail.gmail.com>
Message-ID: <CAAOTY_9tLUAcw+C5D78SNwrV6kHds7JhtAoFYFmxxfAH9vtkDQ@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: select DRM_GEM_DMA_HELPER if DRM_FBDEV_EMULATION=y
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_072005_959062_5D636544 
X-CRM114-Status: GOOD (  15.88  )
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

Hi, Chen-Yu:

Chen-Yu Tsai <wenst@chromium.org> =E6=96=BC 2024=E5=B9=B46=E6=9C=8820=E6=97=
=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=881:47=E5=AF=AB=E9=81=93=EF=BC=9A
>
> With the recent switch from fbdev-generic to fbdev-dma, the driver now
> requires the DRM GEM DMA helpers. This dependency is missing, and will
> cause a link failure if fbdev emulation is enabled.
>
> Add the missing dependency.

Acked-by: Chun-Kuang Hu <chunkuang.hu@mediatek.com>

>
> Fixes: 0992284b4fe4 ("drm/mediatek: Use fbdev-dma")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> The commit this patch fixes is in drm-misc-next. Ideally this patch
> should be applied on top of it directly.
>
> CK, could you give your ack for it?
>
>  drivers/gpu/drm/mediatek/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/=
Kconfig
> index 96cbe020f493..d6449ebae838 100644
> --- a/drivers/gpu/drm/mediatek/Kconfig
> +++ b/drivers/gpu/drm/mediatek/Kconfig
> @@ -7,6 +7,7 @@ config DRM_MEDIATEK
>         depends on HAVE_ARM_SMCCC
>         depends on OF
>         depends on MTK_MMSYS
> +       select DRM_GEM_DMA_HELPER if DRM_FBDEV_EMULATION
>         select DRM_KMS_HELPER
>         select DRM_MIPI_DSI
>         select DRM_PANEL
> --
> 2.45.2.741.gdbec12cfda-goog
>

