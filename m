Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A08C55182
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2026 12:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WGVqxVKLC2Gks94xayPEyUqyvnJiYIaVHNXa8plDaec=; b=WYvgQT51KDqVPtJgNRbQ90Cf6/
	ts9hJmw53tHDMBm4iU6pJroAc1kqWRyumOfmjzF/Tsw9oFmNVYGcJwBQJZ8La3er4+Ml4PzOjIJIL
	2pEvYmFMQtCuUH/xnFxvVuVWlJz0z43g2NsWhtWka15vqvL2gspZW8x3yhEkL6vLglB5BOq95B1ul
	UMXKJEFjNw5SeHYjn9OKHz1v7iZysK+5bYMi/ZdtVq/l3fz2fGQmgjeGuze+akpKAdPQUdd3yML4c
	LI77gZEe5usZ9XLp/AiJwljxf/5z3hYjDiVCL6G/QM9nfEIAkbgGTIQm0WGXOwnnQxdewf0Fykj9U
	Iiha8i+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqsAj-0000000H5Ek-3zRm;
	Mon, 03 Aug 2026 12:53:37 +0000
Received: from mail-vk1-f180.google.com ([209.85.221.180])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqsAh-0000000H5Du-47Py
	for linux-mediatek@lists.infradead.org;
	Mon, 03 Aug 2026 12:53:37 +0000
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5c3a1d005c5so597504e0c.1
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Aug 2026 05:53:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785761614; x=1786366414;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WGVqxVKLC2Gks94xayPEyUqyvnJiYIaVHNXa8plDaec=;
        b=IMeGhIYPERcdhU9gYiVZw/CE5+efPQ/v+soF2L+YRNGrWOxiX2dUrVUVEtNVbeuuac
         mpm+7Soc8tE4tceYcwJaAvuu23xuf1+4xdOr5TT4Uea6HApTCDOfvjr0qOyycEBsufpu
         /9yYjByR65rFcZbUvSRqhOvfkNOfHAd8WSBLlrKMGRsj++ugfTPhxznpQegSZp6/hcMQ
         auDq7xPHNNjoARouHYa4Xxuu6Bc3JP1XwdWgSa9yNWXf/xkpKPvGAcwBixwp72HnJ8DS
         HlbHwEJ9p+MpLYLWc24u30f8lSVaRc8ElTNzj42fBm0YStSHnOMpc/Fwk2CDLzASV4BR
         dubw==
X-Forwarded-Encrypted: i=1; AHgh+RrI4DKjcoVIxz8LQhZULToeU7+rz4jMF8Ml0AxKre8EeRz6FGrb+Tj+KiKGqf0NPYrwWkCG5V07Kj3DI2jDeg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyOfAljoSRzVN9Uo7IP0Bk+PdsKHAryOUlq0VLXdbWdlmjx9b4q
	wFKCr30EgXHVEODttTOfJaAs5bEedIvzi1LWOU0xOE5w49Is0loj/8cqPc+YMMI4
X-Gm-Gg: AR+sD123D+NLS2/66ZAEAWepsiOaC7uuLcjGLfzvA5l8J/+XSgJoEElzhgyQhguj14J
	Xg2n/wA3nsUD6cs9IkCdLOeksMmuOcZl5N4PsKHD9fz15E7NsNXDSO/VK6AUoDiv4NB5snW2byj
	QH8le34rjFFPOY8zQCTMcIwdeoJ01sx8nU0oZo7Eph7Ac+qwJgz8kbcvTyUb8xTLjsTbf9qlldc
	zZEgpD8zUBp/1+7sQ+Pczz6mykk0g1iJeYrAsp3m+MhTqYJPs42cjruV6woHvb997Lo1Bh75W9w
	+KZjRzs7Q72B4dCVDqodCsHllWlvCxlQeykKdo3wWF5vPfOt9qsHZdHIApYWT4W3wnnLNwab5SG
	0NEF3fIlWHGY0MxL8zrKOUmC/m3Zc3yfy4Qev1SKrT5UJ02HVnr3D0JYraX7mJ6jqaHfGPKfHwB
	ykHBGylE3hePogNyFqbyLBVit2nLweE1Hszf71oakX5wv39r4XikFa+EPRhXCILTAPOuDOeQMf+
	clVYwa15xq3ocrCUJY9xqodIw==
X-Received: by 2002:a05:6102:e0e:b0:739:5cfb:50f6 with SMTP id ada2fe7eead31-75b23d68848mr7621747137.11.1785761614601;
        Mon, 03 Aug 2026 05:53:34 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-759a8cf988fsm6212516137.0.2026.08.03.05.53.34
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 05:53:34 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-97727c2064fso2192255241.0
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Aug 2026 05:53:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpulQ3Zqx35Gw/G6YYwYYIAgF1LqzEFKoPC8tmEs95fWzCcEwGu+6BomCcOr3rJ9hXjxFIzccdg2rOCpMzSQA==@lists.infradead.org
X-Received: by 2002:a05:6102:6a83:b0:729:affa:70fd with SMTP id
 ada2fe7eead31-75b2295c6d6mr7103654137.8.1785761305110; Mon, 03 Aug 2026
 05:48:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260720-drm_simple_encoder_init-v2-0-5020b630668a@gmail.com> <20260720-drm_simple_encoder_init-v2-10-5020b630668a@gmail.com>
In-Reply-To: <20260720-drm_simple_encoder_init-v2-10-5020b630668a@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 3 Aug 2026 14:48:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUe0F06RE4ahWb9ERFq0_pnNy-qGZ5ewod+59x-RtU_FQ@mail.gmail.com>
X-Gm-Features: AUfX_mz7dUNKx_CkXmX2bBiqeRWfQJXaKympC5b4Q722_mZANMq2M_rTZsMnNYo
Message-ID: <CAMuHMdUe0F06RE4ahWb9ERFq0_pnNy-qGZ5ewod+59x-RtU_FQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/15] drm/renesas/shmobile: remove dependency on DRM
 simple helpers
To: Diogo Silva <diogompaissilva@gmail.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Michal Simek <michal.simek@amd.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Stefan Agner <stefan@agner.ch>, 
	Alison Wang <alison.wang@nxp.com>, Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
	David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
	Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
	Jyri Sarha <jyri.sarha@iki.fi>, Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Xinliang Liu <xinliang.liu@linaro.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Yongqin Liu <yongqin.liu@linaro.org>, 
	John Stultz <jstultz@google.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	virtualization@lists.linux.dev, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_055336_029501_1953340B 
X-CRM114-Status: GOOD (  21.03  )
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

Hi Diogo,

On Mon, 20 Jul 2026 at 17:41, Diogo Silva <diogompaissilva@gmail.com> wrote:
> The simple KMS helpers are deprecated because they only add an
> intermediate layer between drivers and atomic modesetting.
>
> Open-code drm_simple_encoder_init() by calling drm_encoder_init()
> directly and providing driver-local drm_encoder_funcs.
>
> Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>

Thanks for your patch!

> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c

> @@ -29,7 +30,6 @@
>  #include <drm/drm_modeset_helper_vtables.h>
>  #include <drm/drm_panel.h>
>  #include <drm/drm_probe_helper.h>
> -#include <drm/drm_simple_kms_helper.h>
>  #include <drm/drm_vblank.h>
>
>  #include <video/videomode.h>
> @@ -436,6 +436,10 @@ static const struct drm_encoder_helper_funcs encoder_helper_funcs = {
>         .mode_fixup = shmob_drm_encoder_mode_fixup,
>  };
>
> +static const struct drm_encoder_funcs shmob_encoder_funcs = {

Nit: shmob_drm_encoder_funcs?

> +       .destroy = drm_encoder_cleanup,
> +};
> +
>  /* -----------------------------------------------------------------------------
>   * Encoder
>   */

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

