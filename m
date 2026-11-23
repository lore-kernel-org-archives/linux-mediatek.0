Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34DC606A31F
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 09:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EDUNe2gY;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=b0TW7vQj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pxYxZe+9mGGMt+Mg6otICbG0SmZT5Iibh7AjBa7igz4=; b=EDUNe2gYDS0ZEN7vCmhAQI2e2E
	vY/1xPvJ8i88njkPFdR0OTjQtzGu33WwthxvOoDjFP8wT4ZW+StSOYybve0j7l+7PeCaMwQPMZsMG
	H8mj+VVVfj+yXF1Mb1LB9Q26mCFmbONwZEbOWNRXVQsibU46KEs/vKEEEFHlnvWJ8BrrkmO5R6/Ez
	6eHCnYpCtuMkGQkyJCPfN2aV6h9kK2bWy+ra5Waz68k+hKMHlEptbetTyaaIsmmldbue7b178kpNs
	Dx5X0vk5+KGhJrUinUVuQO92m0ODvycolr3Sgi9CStHSO/zYVZRb6UuuFbcBEVqaT9pXtS139l/kr
	FlkQuDIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQ7A-00000002fKf-1Q9t;
	Mon, 23 Nov 2026 09:13:32 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQ72-00000002fIl-2x6O
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Nov 2026 09:13:28 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-4b52fcb410dso110910f8f.1
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Nov 2026 01:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795425203; x=1796030003; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pxYxZe+9mGGMt+Mg6otICbG0SmZT5Iibh7AjBa7igz4=;
        b=b0TW7vQj58QlypDRQhe88CBvHAlkaawY6JWxHiewnUf7IYsTp/YNkDNFU5srsC8hug
         IL12o0DidSVfmY7cv/X5nejZ3JSpItlq+2Ae4QbAXbH5sya5ctDpOr6At/G26wo3LhIe
         qnkimp0wE8v7WwFSXCSiOHJr9alOT2tK11DwbVB0SKsCdgJNoIB8lVDZEL0IEMjAoMFe
         NKsYyBG8zVYkrHwRbgKHU2MvGo53JOQdFqg+4k+QO93Khd4KkVf7K8xQnNkFRuRVvFH6
         IBCSuTSHVtdVsNXgTX6upGJSQ0IFMnPAFCcUGOJAtnsS2GPcigyPI2wKze3Pdgb5mLkX
         0+Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795425203; x=1796030003;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pxYxZe+9mGGMt+Mg6otICbG0SmZT5Iibh7AjBa7igz4=;
        b=Docpepoah4ZKkJWCKJ3Mnruoey5houGhn+stFgjU+N3ckGqGHx5d1/oWq4xB0j680V
         lKRHowl+Q9y4S3Rx7sBcXin+jO6dW8Y1FMg1M8sN/lCYLMDffqSLXXqS6I03adNFzsxP
         uUp1/i+e0znl/AD5MfL/OgLbdzJC6kgozHceFhlP4GS8gFUiX9hv4wZqPuX1yiVECYam
         rR7keQIOawnUPf7v7dyGcQjCX03Zcvb4X3Sy7Ap1SXw5hI5IELeA4HdSE2V1x2W4Lvin
         +mEwgNuGAKCUhqQfwUQKp1EwIgyu5vZl4hiMpBVUakD7A93yyTyIbxCC4KGWvluhx4fU
         lv5w==
X-Forwarded-Encrypted: i=1; AL+hErEDz0lUk4lNV9Lp0j6M9aP319jmTIFYVNkjtdVBfTKmf4NdMnAd7s9eorAPiM8aOIqLUe0MGsPJMKZL6XAo3A==@lists.infradead.org
X-Gm-Message-State: APuU4Z/CWJDrMb+sweuvb4TeUYVnwSM+2l0yWerP3XJoLJr12ZP2PdRh
	nNRddZeJbdLvrwaP9oKrDat3yCD50p1mlliY4LtkRnmiYTYpRQI5X5XtC7eVVPNVPXk=
X-Gm-Gg: AZFdTZfXolD2YK2e0/0JqMXWyX5lNycFV4It/ebWgoqUCiC+kCpVku3340JvPsCyN8U
	bw6MJSAiRvSXCvFeLMww9A0kzPEiug1MMSIIOMHNiNJpgk5POuZ133oKtA2cHFIZ8kEQfa0IxZE
	8TNVv97W5xFgr8d/GpOsErwgtDw23rpTGnCHz9Ivd/i1manNkizkd4gB9LLAoPzr4g3m50NUxCb
	ueGuWb/L4XFGxnvzGDqatpoAubpJiBI8W6YonagNsEiHgSaqUKMfqjSQ7kRbCz3LiRd2YeWt44x
	VQL43n4S2AfgEg4avnmbNLfIFpMz1CU0U9LNqKyxhGRnRMrIuhVZTLIW2srdSB5lDORm9RI+NiT
	6oxxo58NgCU3m1GM5ZdEJI1O2no51v/OQ2Et9YO0OzVHFSTGakphQ47xh5OyKykcH/tlIMYeCgr
	UYYA1bujlFxNW9pkgMLgI+FWB3sLrj+k8TOor5l71YVkHA/+1z3HF1tVgJE5LQh+920gcIm6aaC
	pN0Ue5WavqU2dud4GxmkitRSFzlJ7e6RkbED+NB0lPrSK7eGk2KR0OOT9QWAjyvdXp2BJTIXRWD
	ZlgRSu1x0e0PpD6BTcAmjyTJBOPAnfrK2TOlG1vZsS+4M9FFaiy/NGspPYBfGBt0GRFOHJRg1FG
	nRtWGhSYh/5GCh/x3
X-Received: by 2002:a5d:4dc6:0:b0:48c:585b:8825 with SMTP id ffacd0b85a97d-4abb3861755mr16785305f8f.18.1795425202530;
        Mon, 23 Nov 2026 01:13:22 -0800 (PST)
Received: from localhost (p200300f65f19a90438645cebc2ee104e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3864:5ceb:c2ee:104e])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4ab6bb989eesm21005374f8f.50.2026.11.23.01.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:13:21 -0800 (PST)
Date: Mon, 23 Nov 2026 10:13:20 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Shubham Paralikar <shubham.paralikar@mediatek.com>
Cc: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Arnab.Layek@mediatek.com, Fred-WY.Chen@mediatek.com
Subject: Re: [PATCH v4 1/1] pinctrl: mediatek: Add MT8901/MT8971 ACPI driver
Message-ID: <awQBpBFVPoFtGLhm@monoceros>
References: <20261120165908.3204369-1-shubham.paralikar@mediatek.com>
 <20261120165908.3204369-2-shubham.paralikar@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="utkpo2x6tlcfmb3u"
Content-Disposition: inline
In-Reply-To: <20261120165908.3204369-2-shubham.paralikar@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_011325_838823_D404DE81 
X-CRM114-Status: GOOD (  44.42  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--utkpo2x6tlcfmb3u
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 1/1] pinctrl: mediatek: Add MT8901/MT8971 ACPI driver
MIME-Version: 1.0

Hello,

On Sat, Nov 21, 2026 at 12:58:32AM +0800, Shubham Paralikar wrote:
> MT8901 and MT8971 are booted with ACPI firmware and both describe their
> GPIO controller with the same _HID, NVDA9221. The existing MediaTek
> Paris pinctrl drivers only probe from devicetree and pick their SoC
> data from the match table, so neither SoC gets pin control, GPIOs or
> EINT interrupts.
>=20
> Add pinctrl-mtk-acpi, a helper for Paris pin controllers on ACPI. Each
> SoC driver matches NVDA9221 itself and calls mtk_pinctrl_acpi_probe()
> with its own mtk_pin_soc and the "ChipId" value that identifies its
> SoC. The helper reads ChipId from the controller's vendor _DSD and
> returns -ENODEV when it belongs to another SoC, so the driver core
> moves on to the next driver matching the same _HID. Adding a SoC only
> needs a new SoC driver; the helper has no per-SoC table.
>=20
> The _DSD uses a MediaTek UUID rather than the Device Properties UUID,
> so device_property_read_u32() cannot read it. The helper evaluates
> _DSD and walks the package directly.
>=20
> Add pinctrl-mt8901 and pinctrl-mt8971 as separate drivers, each with
> its own Kconfig symbol, built on top of the helper.
>=20
> Make the shared Paris, common-v2 and EINT code work on ACPI and with
> these SoCs:
>=20
> - paris: add mtk_paris_pinctrl_probe_soc() for drivers that pick the
>   SoC data themselves. ACPI resources have no names, so map the pin
>   register bases by resource index on ACPI. Register a GPIO range and
>   request the ACPI _AEI event interrupts, and support
>   PIN_CONFIG_BIAS_BUS_HOLD.
> - common-v2: on ACPI, count the EINT banks from the MEM resources and
>   take the IRQ from the platform device instead of from DT. Add
>   reg_order[] field tables for SoCs whose per-pin registers sit at a
>   fixed stride (MT8971), wake-event EINT lists and bus-hold bias
>   (PU=3D1, PD=3D1).
> - mtk-eint: add a skip list so the init-time mask sweep leaves
>   firmware-owned EINTs alone (MT8971 EINT215, PROCHOT), and add the
>   MT8901 debounce table. On SoCs with a wake-event mask (MT8901),
>   unmask the event for the static event list at init and for EINTs
>   armed through irq_set_wake(), mask it again when wake is disabled,
>   and re-apply both on resume.
> - MT8901: add EINT-only virtual GPIOs 182-208, such as the xHCI wake
>   events, which firmware describes as GpioInt resources on this
>   controller. Skip pinmux, direction and pinconf for them, and report
>   debounce as unsupported on EINTs without debounce hardware.
> - gpio: declare acpi_gpiochip_request_interrupts() and
>   acpi_gpiochip_free_interrupts() in linux/gpio/driver.h. MediaTek
>   EINT provides .to_irq instead of a gpio_irq_chip, so gpiolib does
>   not request the _AEI interrupts for this controller by itself.
>=20
> Signed-off-by: Shubham Paralikar <shubham.paralikar@mediatek.com>
> ---
> Changes in v4:
> - Rename pinctrl-mt89xx to pinctrl-mtk-acpi, no wildcard names
>   (AngeloGioacchino)
> - Fold the _DSD parser (pinctrl-mtk-dsd) into pinctrl-mtk-acpi and read
>   only the properties that are used (AngeloGioacchino)
> - Let each SoC driver match NVDA9221 and pass its own mtk_pin_soc to
>   pinctrl-mtk-acpi, dropping the ChipId to SoC table; split into
>   PINCTRL_MT8901 and PINCTRL_MT8971 (AngeloGioacchino)
> - Drop include/linux/soc/mediatek/mtk-pinctrl.h and
>   mtk_pinctrl_program_bias_by_gpio(), along with the controller
>   registry behind it. SoundWire pad bus-keeper setup is left to
>   firmware or will be addressed separately (AngeloGioacchino)
> - Remove probe trace dev_info() prints (AngeloGioacchino)
> - Report debounce as unsupported (-ENOTSUPP) on SoCs without a debounce
>   table and skip debounce processing in the EINT handler there. On
>   MT8971 the -EOPNOTSUPP from the EINT code made every ACPI GpioInt on
>   a debounce-capable pin fail (Sashiko)
> - Return -ENOTSUPP for virtual GPIOs in the reg_order field lookup
>   instead of computing an offset past the pad registers (Sashiko)
> - Allocate hw->eint only after the EINT resource count checks, so a
>   failed EINT setup no longer leaves a half-initialised hw->eint
>   (Sashiko)
> - Set nfuncs to 16 for MT8971, whose pins use functions 8 to 10
>   (Sashiko)
> - Register the GPIO pin range only on ACPI, via gpiochip_add_pin_range();
>   on DT it comes from gpio-ranges
> - Check platform_get_resource() before mapping ACPI EINT banks
> - Drop the unused .gpio_set_direction pinmux op, the reg_in_order flag
>   (reg_order being set is enough), redundant error prints and overflow
>   checks on static tables, and unrelated copyright and message churn
> - Expand the PINCTRL_MT8901 and PINCTRL_MT8971 Kconfig help text
>=20
> Known issue: MT8971 suspend behaviour of EINT215 (PROCHOT, owned by
> firmware) is still under investigation. It is kept unmasked at init
> and resume, but the suspend path may mask it while the system sleeps.
>=20
> The changes marked (Sashiko) fix problems reported by the Sashiko AI
> review of v3. The v4 rework was done with the help of an AI coding
> assistant (Claude Opus 5.5). Build tested on arm64 with both drivers
> as modules and built-in, with W=3D1 for drivers/pinctrl/mediatek/.
> ---
>  drivers/pinctrl/mediatek/Kconfig              |   33 +-
>  drivers/pinctrl/mediatek/Makefile             |    3 +
>  drivers/pinctrl/mediatek/mtk-eint.c           |  217 +-
>  drivers/pinctrl/mediatek/mtk-eint.h           |   16 +-
>  drivers/pinctrl/mediatek/pinctrl-mt8901.c     | 1471 +++++++++++
>  drivers/pinctrl/mediatek/pinctrl-mt8971.c     |   91 +
>  drivers/pinctrl/mediatek/pinctrl-mtk-acpi.c   |  153 ++
>  drivers/pinctrl/mediatek/pinctrl-mtk-acpi.h   |   17 +
>  .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  |  124 +-
>  .../pinctrl/mediatek/pinctrl-mtk-common-v2.h  |   31 +
>  drivers/pinctrl/mediatek/pinctrl-mtk-mt8901.h | 2296 +++++++++++++++++
>  drivers/pinctrl/mediatek/pinctrl-mtk-mt8971.h | 1646 ++++++++++++
>  drivers/pinctrl/mediatek/pinctrl-paris.c      |   95 +-
>  drivers/pinctrl/mediatek/pinctrl-paris.h      |    2 +
>  include/linux/gpio/driver.h                   |    5 +
>  15 files changed, 6162 insertions(+), 38 deletions(-)
>  create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt8901.c
>  create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt8971.c
>  create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-acpi.c
>  create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-acpi.h
>  create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt8901.h
>  create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt8971.h
>=20
> diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/=
Kconfig
> index 912d782fb6a5..e7a11a5c99af 100644
> --- a/drivers/pinctrl/mediatek/Kconfig
> +++ b/drivers/pinctrl/mediatek/Kconfig
> @@ -39,13 +39,18 @@ config PINCTRL_MTK_MOORE
> =20
>  config PINCTRL_MTK_PARIS
>  	tristate
> -	depends on OF
> +	depends on OF || ACPI
>  	select PINMUX
>  	select GENERIC_PINCONF
>  	select GPIOLIB
>  	select EINT_MTK
>  	select PINCTRL_MTK_V2
> =20
> +config PINCTRL_MTK_ACPI
> +	tristate
> +	depends on ACPI
> +	select PINCTRL_MTK_PARIS
> +
>  # For MIPS SoCs
>  config PINCTRL_MT7620
>  	tristate "MediaTek MT7620 pin control"
> @@ -323,6 +328,32 @@ config PINCTRL_MT8516
>  	default ARM64 && ARCH_MEDIATEK
>  	select PINCTRL_MTK
> =20
> +config PINCTRL_MT8901
> +	tristate "MediaTek MT8901 pin control"
> +	depends on ACPI
> +	depends on ARM64 || COMPILE_TEST
> +	default ARM64 && ARCH_MEDIATEK
> +	select PINCTRL_MTK_ACPI
> +	help
> +	  Say yes here to support the pin controller and GPIO driver on
> +	  MediaTek MT8901 SoC with ACPI firmware. The driver provides pin
> +	  multiplexing, pin configuration, GPIOs and EINT interrupts. It
> +	  also exposes virtual GPIOs for EINTs that have no GPIO pad, such
> +	  as the xHCI wake events.
> +
> +config PINCTRL_MT8971
> +	tristate "MediaTek MT8971 pin control"
> +	depends on ACPI
> +	depends on ARM64 || COMPILE_TEST
> +	default ARM64 && ARCH_MEDIATEK
> +	select PINCTRL_MTK_ACPI
> +	help
> +	  Say yes here to support the pin controller and GPIO driver on
> +	  MediaTek MT8971 SoC with ACPI firmware. The driver provides pin
> +	  multiplexing, pin configuration, GPIOs and EINT interrupts.
> +	  Both this and the MT8901 driver match the same ACPI _HID; the
> +	  _DSD ChipId selects which one binds.
> +
>  # For PMIC
>  config PINCTRL_MT6397
>  	tristate "MediaTek MT6397 pin control"
> diff --git a/drivers/pinctrl/mediatek/Makefile b/drivers/pinctrl/mediatek=
/Makefile
> index 9982866359af..18e061df0981 100644
> --- a/drivers/pinctrl/mediatek/Makefile
> +++ b/drivers/pinctrl/mediatek/Makefile
> @@ -6,6 +6,7 @@ obj-$(CONFIG_PINCTRL_MTK_V2)		+=3D pinctrl-mtk-common-v2.o
>  obj-$(CONFIG_PINCTRL_MTK_MTMIPS)	+=3D pinctrl-mtmips.o
>  obj-$(CONFIG_PINCTRL_MTK_MOORE)		+=3D pinctrl-moore.o
>  obj-$(CONFIG_PINCTRL_MTK_PARIS)		+=3D pinctrl-paris.o
> +obj-$(CONFIG_PINCTRL_MTK_ACPI)		+=3D pinctrl-mtk-acpi.o
> =20
>  # SoC Drivers
>  obj-$(CONFIG_PINCTRL_MT7620)		+=3D pinctrl-mt7620.o
> @@ -43,4 +44,6 @@ obj-$(CONFIG_PINCTRL_MT8195)		+=3D pinctrl-mt8195.o
>  obj-$(CONFIG_PINCTRL_MT8196)		+=3D pinctrl-mt8196.o
>  obj-$(CONFIG_PINCTRL_MT8365)		+=3D pinctrl-mt8365.o
>  obj-$(CONFIG_PINCTRL_MT8516)		+=3D pinctrl-mt8516.o
> +obj-$(CONFIG_PINCTRL_MT8901)		+=3D pinctrl-mt8901.o
> +obj-$(CONFIG_PINCTRL_MT8971)		+=3D pinctrl-mt8971.o
>  obj-$(CONFIG_PINCTRL_MT6397)		+=3D pinctrl-mt6397.o
> diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediat=
ek/mtk-eint.c
> index 389ceaffcee4..1f8d68673725 100644
> --- a/drivers/pinctrl/mediatek/mtk-eint.c
> +++ b/drivers/pinctrl/mediatek/mtk-eint.c
> @@ -51,6 +51,9 @@ static const struct mtk_eint_regs mtk_generic_eint_regs=
 =3D {
>  	.dbnc_ctrl =3D 0x500,
>  	.dbnc_set  =3D 0x600,
>  	.dbnc_clr  =3D 0x700,
> +	.event     =3D 0x800,
> +	.event_set =3D 0x840,
> +	.event_clr =3D 0x880,
>  };
> =20
>  const unsigned int debounce_time_mt2701[] =3D {
> @@ -73,14 +76,23 @@ const unsigned int debounce_time_mt6878[] =3D {
>  };
>  EXPORT_SYMBOL_GPL(debounce_time_mt6878);
> =20
> +const unsigned int debounce_time_mt8901[] =3D {
> +	156, 313, 625, 1250, 20000, 40000, 80000, 160000, 320000, 640000, 0
> +};
> +EXPORT_SYMBOL_GPL(debounce_time_mt8901);
> +
>  static void __iomem *mtk_eint_get_offset(struct mtk_eint *eint,
> -					 unsigned int eint_num,
> +					 unsigned long eint_num,
>  					 unsigned int offset)
>  {
>  	unsigned int idx =3D eint->pins[eint_num].index;
>  	unsigned int inst =3D eint->pins[eint_num].instance;
>  	void __iomem *reg;
> =20
> +	/* Pins without EINT hardware have instance >=3D nbase. */
> +	if (inst >=3D eint->nbase)
> +		return NULL;
> +
>  	reg =3D eint->base[inst] + offset + (idx / 32 * 4);
> =20
>  	return reg;
> @@ -94,6 +106,10 @@ static unsigned int mtk_eint_can_en_debounce(struct m=
tk_eint *eint,
>  	void __iomem *reg =3D mtk_eint_get_offset(eint, eint_num,
>  						eint->regs->sens);
> =20
> +	/* Pins without EINT hardware cannot debounce. */
> +	if (!reg)
> +		return 0;
> +
>  	if (readl(reg) & bit)
>  		sens =3D MTK_EINT_LEVEL_SENSITIVE;
>  	else
> @@ -111,7 +127,14 @@ static int mtk_eint_flip_edge(struct mtk_eint *eint,=
 int hwirq)
>  	unsigned int reg_offset;
>  	unsigned int mask =3D BIT(eint->pins[hwirq].index & 0x1f);
>  	unsigned int port =3D (eint->pins[hwirq].index >> 5) & eint->hw->port_m=
ask;
> -	void __iomem *reg =3D eint->base[eint->pins[hwirq].instance] + (port <<=
 2);
> +	unsigned int inst =3D eint->pins[hwirq].instance;
> +	void __iomem *reg;
> +
> +	/* Pins without EINT hardware have nothing to flip. */
> +	if (inst >=3D eint->nbase)
> +		return 0;
> +
> +	reg =3D eint->base[inst] + (port << 2);
> =20
>  	curr_level =3D eint->gpio_xlate->get_gpio_state(eint->pctl, hwirq);
> =20
> @@ -136,9 +159,13 @@ static void mtk_eint_mask(struct irq_data *d)
>  	unsigned int idx =3D eint->pins[d->hwirq].index;
>  	unsigned int inst =3D eint->pins[d->hwirq].instance;
>  	unsigned int mask =3D BIT(idx & 0x1f);
> -	void __iomem *reg =3D mtk_eint_get_offset(eint, d->hwirq,
> -						eint->regs->mask_set);
> +	void __iomem *reg;
> +
> +	/* Pins without EINT hardware cannot be masked. */
> +	if (inst >=3D eint->nbase)
> +		return;
> =20
> +	reg =3D mtk_eint_get_offset(eint, d->hwirq, eint->regs->mask_set);
>  	eint->cur_mask[inst][idx >> 5] &=3D ~mask;
> =20
>  	writel(mask, reg);
> @@ -150,9 +177,13 @@ static void mtk_eint_unmask(struct irq_data *d)
>  	unsigned int idx =3D eint->pins[d->hwirq].index;
>  	unsigned int inst =3D eint->pins[d->hwirq].instance;
>  	unsigned int mask =3D BIT(idx & 0x1f);
> -	void __iomem *reg =3D mtk_eint_get_offset(eint, d->hwirq,
> -						eint->regs->mask_clr);
> +	void __iomem *reg;
> +
> +	/* Pins without EINT hardware cannot be unmasked. */
> +	if (inst >=3D eint->nbase)
> +		return;
> =20
> +	reg =3D mtk_eint_get_offset(eint, d->hwirq, eint->regs->mask_clr);
>  	eint->cur_mask[inst][idx >> 5] |=3D mask;
> =20
>  	writel(mask, reg);
> @@ -161,6 +192,94 @@ static void mtk_eint_unmask(struct irq_data *d)
>  		mtk_eint_flip_edge(eint, d->hwirq);
>  }
> =20
> +static void mtk_eint_write_event_mask(struct mtk_eint *eint,
> +				      unsigned long eint_num,
> +				      unsigned int reg_offset)
> +{
> +	unsigned int idx, inst;
> +	unsigned int mask;
> +	void __iomem *reg;
> +
> +	if (!eint->hw->has_event_mask)
> +		return;
> +
> +	if (eint_num >=3D eint->hw->ap_num)
> +		return;
> +
> +	idx  =3D eint->pins[eint_num].index;
> +	inst =3D eint->pins[eint_num].instance;
> +
> +	if (inst >=3D eint->nbase)
> +		return;
> +
> +	mask =3D BIT(idx & 0x1f);
> +	reg =3D mtk_eint_get_offset(eint, eint_num, reg_offset);
> +	writel(mask, reg);
> +}
> +
> +/* Unmask the wake event of one EINT. */
> +static void mtk_eint_event_unmask_one(struct mtk_eint *eint,
> +				      unsigned long eint_num)
> +{
> +	mtk_eint_write_event_mask(eint, eint_num, eint->regs->event_clr);
> +}
> +
> +static bool mtk_eint_is_static_event_unmask_pin(struct mtk_eint *eint,
> +						unsigned long eint_num)
> +{
> +	unsigned int i;
> +
> +	for (i =3D 0; i < eint->num_event_pins; i++) {
> +		if (eint->event_pins[i] =3D=3D eint_num)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +/* Mask the wake event of one EINT. Not for pins in the static event lis=
t. */
> +static void mtk_eint_event_mask_one(struct mtk_eint *eint,
> +				    unsigned long eint_num)
> +{
> +	mtk_eint_write_event_mask(eint, eint_num, eint->regs->event_set);
> +}
> +
> +/* Unmask the wake events of the SoC's static event list. */
> +static void mtk_eint_apply_event_unmask(struct mtk_eint *eint)
> +{
> +	unsigned int i;
> +
> +	for (i =3D 0; i < eint->num_event_pins; i++)
> +		mtk_eint_event_unmask_one(eint, eint->event_pins[i]);
> +}
> +
> +static void mtk_eint_apply_wake_event_unmask(struct mtk_eint *eint)
> +{
> +	unsigned int eint_num, pin, shift;
> +	unsigned int inst, port, port_num;
> +	u32 bits;
> +
> +	if (!eint->hw->has_event_mask)
> +		return;
> +
> +	for (inst =3D 0; inst < eint->nbase; inst++) {
> +		port_num =3D DIV_ROUND_UP(eint->base_pin_num[inst], 32);
> +		for (port =3D 0; port < port_num; port++) {
> +			bits =3D eint->wake_mask[inst][port];
> +			while (bits) {
> +				shift =3D __ffs(bits);
> +				bits &=3D ~BIT(shift);
> +				pin =3D port * 32 + shift;
> +				if (pin >=3D eint->base_pin_num[inst])
> +					continue;
> +
> +				eint_num =3D eint->pin_list[inst][pin];
> +				mtk_eint_event_unmask_one(eint, eint_num);
> +			}
> +		}
> +	}
> +}
> +
>  static unsigned int mtk_eint_get_mask(struct mtk_eint *eint,
>  				      unsigned int eint_num)
>  {
> @@ -239,10 +358,18 @@ static int mtk_eint_irq_set_wake(struct irq_data *d=
, unsigned int on)
>  	unsigned int shift =3D idx & 0x1f;
>  	unsigned int port =3D idx >> 5;
> =20
> -	if (on)
> +	/* Pins without EINT hardware cannot wake. */
> +	if (inst >=3D eint->nbase)
> +		return 0;
> +
> +	if (on) {
>  		eint->wake_mask[inst][port] |=3D BIT(shift);
> -	else
> +		mtk_eint_event_unmask_one(eint, d->hwirq);
> +	} else {
>  		eint->wake_mask[inst][port] &=3D ~BIT(shift);
> +		if (!mtk_eint_is_static_event_unmask_pin(eint, d->hwirq))
> +			mtk_eint_event_mask_one(eint, d->hwirq);
> +	}
> =20
>  	return 0;
>  }
> @@ -250,7 +377,7 @@ static int mtk_eint_irq_set_wake(struct irq_data *d, =
unsigned int on)
>  static void mtk_eint_chip_write_mask(const struct mtk_eint *eint,
>  				     unsigned int **buf)
>  {
> -	int inst, port, port_num;
> +	unsigned int inst, port, port_num;
>  	void __iomem *reg;
> =20
>  	for (inst =3D 0; inst < eint->nbase; inst++) {
> @@ -270,6 +397,13 @@ static int mtk_eint_irq_request_resources(struct irq=
_data *d)
>  	unsigned int gpio_n;
>  	int err;
> =20
> +	/* Pins without EINT hardware cannot be used as interrupts. */
> +	if (eint->pins[d->hwirq].instance >=3D eint->nbase) {
> +		dev_dbg(eint->dev, "EINT %lu has no EINT hardware\n",
> +			d->hwirq);
> +		return -ENXIO;
> +	}
> +
>  	err =3D eint->gpio_xlate->get_gpio_n(eint->pctl, d->hwirq,
>  					   &gpio_n, &gpio_c);
>  	if (err < 0) {
> @@ -317,6 +451,31 @@ static struct irq_chip mtk_eint_irq_chip =3D {
>  	.irq_release_resources =3D mtk_eint_irq_release_resources,
>  };
> =20
> +/*
> + * Return the mask_set value for a 32-bit word of bank @inst, leaving
> + * skip-listed EINTs unmasked. dom_en is still set for all EINTs.
> + */
> +static unsigned int mtk_eint_mask_word_for_skip(struct mtk_eint *eint,
> +						unsigned int inst,
> +						unsigned int word_base)
> +{
> +	unsigned int mask =3D 0xffffffff;
> +	unsigned int k, eint_num, idx;
> +
> +	for (k =3D 0; k < eint->num_skip_eint; k++) {
> +		eint_num =3D eint->skip_eint_list[k];
> +		if (eint_num >=3D eint->hw->ap_num)
> +			continue;
> +		if (eint->pins[eint_num].instance !=3D inst)
> +			continue;
> +		idx =3D eint->pins[eint_num].index;
> +		if ((idx & ~0x1fu) !=3D word_base)
> +			continue;
> +		mask &=3D ~BIT(idx & 0x1f);
> +	}
> +	return mask;
> +}
> +
>  static unsigned int mtk_eint_hw_init(struct mtk_eint *eint)
>  {
>  	void __iomem *dom_reg, *mask_reg;
> @@ -327,12 +486,38 @@ static unsigned int mtk_eint_hw_init(struct mtk_ein=
t *eint)
>  		mask_reg =3D eint->base[i] + eint->regs->mask_set;
>  		for (j =3D 0; j < eint->base_pin_num[i]; j +=3D 32) {
>  			writel(0xffffffff, dom_reg);
> -			writel(0xffffffff, mask_reg);
> +			writel(mtk_eint_mask_word_for_skip(eint, i, j), mask_reg);
>  			dom_reg +=3D 4;
>  			mask_reg +=3D 4;
>  		}
>  	}
> +	return 0;
> +}
> =20
> +/* Make sure skip-listed EINTs are unmasked and domain enabled. */
> +static int mtk_eint_restore_skip_list(struct mtk_eint *eint)
> +{
> +	unsigned int k, eint_num, inst, idx;
> +	void __iomem *reg;
> +
> +	if (!eint->skip_eint_list || !eint->num_skip_eint)
> +		return 0;
> +
> +	for (k =3D 0; k < eint->num_skip_eint; k++) {
> +		eint_num =3D eint->skip_eint_list[k];
> +		if (eint_num >=3D eint->hw->ap_num)
> +			continue;
> +		inst =3D eint->pins[eint_num].instance;
> +		if (inst >=3D eint->nbase)
> +			continue;
> +		idx =3D eint->pins[eint_num].index;
> +
> +		reg =3D mtk_eint_get_offset(eint, eint_num, eint->regs->mask_clr);
> +		writel(BIT(idx & 0x1f), reg);
> +
> +		reg =3D mtk_eint_get_offset(eint, eint_num, eint->regs->dom_en);
> +		writel(BIT(idx & 0x1f), reg);
> +	}
>  	return 0;
>  }
> =20
> @@ -371,6 +556,8 @@ static void mtk_eint_irq_handler(struct irq_desc *des=
c)
>  				shift =3D __ffs(status);
>  				status &=3D ~BIT(shift);
>  				mask =3D BIT(shift);
> +				if (shift + j >=3D eint->base_pin_num[i])
> +					continue;
>  				eint_num =3D eint->pin_list[i][shift + j];
> =20
>  				/*
> @@ -417,7 +604,7 @@ static void mtk_eint_irq_handler(struct irq_desc *des=
c)
>  					}
>  				}
> =20
> -				if (eint->pins[eint_num].debounce)
> +				if (eint->hw->db_time && eint->pins[eint_num].debounce)
>  					mtk_eint_debounce_process(eint, eint_num);
>  			}
>  		}
> @@ -436,6 +623,8 @@ EXPORT_SYMBOL_GPL(mtk_eint_do_suspend);
>  int mtk_eint_do_resume(struct mtk_eint *eint)
>  {
>  	mtk_eint_chip_write_mask(eint, eint->cur_mask);
> +	mtk_eint_apply_event_unmask(eint);
> +	mtk_eint_apply_wake_event_unmask(eint);
> =20
>  	return 0;
>  }
> @@ -610,6 +799,7 @@ int mtk_eint_do_init(struct mtk_eint *eint, struct mt=
k_eint_pin *eint_pin)
>  	}
> =20
>  	mtk_eint_hw_init(eint);
> +	mtk_eint_restore_skip_list(eint);
>  	for (i =3D 0; i < eint->hw->ap_num; i++) {
>  		inst =3D eint->pins[i].instance;
>  		if (inst >=3D eint->nbase)
> @@ -624,9 +814,14 @@ int mtk_eint_do_init(struct mtk_eint *eint, struct m=
tk_eint_pin *eint_pin)
>  	irq_set_chained_handler_and_data(eint->irq, mtk_eint_irq_handler,
>  					 eint);
> =20
> +	mtk_eint_apply_event_unmask(eint);
>  	return devm_add_action_or_reset(eint->dev, mtk_eint_teardown, eint);
> =20
>  err_eint:
> +	if (eint->domain) {
> +		irq_domain_remove(eint->domain);
> +		eint->domain =3D NULL;
> +	}
>  	for (i =3D 0; i < eint->nbase; i++) {
>  		devm_kfree(eint->dev, eint->cur_mask[i]);
>  		devm_kfree(eint->dev, eint->wake_mask[i]);
> diff --git a/drivers/pinctrl/mediatek/mtk-eint.h b/drivers/pinctrl/mediat=
ek/mtk-eint.h
> index 3cdd6f6310cd..bc98b0cf335a 100644
> --- a/drivers/pinctrl/mediatek/mtk-eint.h
> +++ b/drivers/pinctrl/mediatek/mtk-eint.h
> @@ -31,6 +31,9 @@ struct mtk_eint_regs {
>  	unsigned int	dbnc_ctrl;
>  	unsigned int	dbnc_set;
>  	unsigned int	dbnc_clr;
> +	unsigned int	event;
> +	unsigned int	event_set;
> +	unsigned int	event_clr;
>  };
> =20
>  struct mtk_eint_hw {
> @@ -39,6 +42,7 @@ struct mtk_eint_hw {
>  	unsigned int	ap_num;
>  	unsigned int	db_cnt;
>  	const unsigned int *db_time;
> +	bool		has_event_mask;
>  };
> =20
>  struct mtk_eint_pin {
> @@ -53,8 +57,10 @@ extern const unsigned int debounce_time_mt2701[];
>  extern const unsigned int debounce_time_mt6765[];
>  extern const unsigned int debounce_time_mt6795[];
>  extern const unsigned int debounce_time_mt6878[];
> +extern const unsigned int debounce_time_mt8901[];
> =20
>  struct mtk_eint;
> +struct gpio_chip;
> =20
>  struct mtk_eint_xt {
>  	int (*get_gpio_n)(void *data, unsigned long eint_n,
> @@ -67,7 +73,7 @@ struct mtk_eint_xt {
>  struct mtk_eint {
>  	struct device *dev;
>  	void __iomem **base;
> -	int nbase;
> +	unsigned int nbase;
>  	u16 *base_pin_num;
>  	struct irq_domain *domain;
>  	int irq;
> @@ -83,6 +89,14 @@ struct mtk_eint {
>  	struct mtk_eint_pin *pins;
>  	u16 num_db_time;
> =20
> +	/* EINTs whose wake event is unmasked after init and resume */
> +	const unsigned int *event_pins;
> +	unsigned int num_event_pins;
> +
> +	/* EINTs owned by firmware that must never be masked */
> +	const unsigned int *skip_eint_list;
> +	unsigned int num_skip_eint;
> +
>  	/* Used to fit into various pinctrl device */
>  	void *pctl;
>  	const struct mtk_eint_xt *gpio_xlate;
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8901.c b/drivers/pinctrl/=
mediatek/pinctrl-mt8901.c
> new file mode 100644
> index 000000000000..1d8338f72a9e
> --- /dev/null
> +++ b/drivers/pinctrl/mediatek/pinctrl-mt8901.c
> @@ -0,0 +1,1471 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2025 MediaTek Inc.
> + *
> + */
> +
> +#include <linux/mod_devicetable.h>

Please don't add new users of <linux/mod_devicetable.h>.
<linux/platform_device.h> already provides acpi_device_id without
introducing a lot of unneeded dependencies. So <linux/mod_devicetable.h>
can just be dropped.

> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> [...]
> +static const struct acpi_device_id mt8901_pinctrl_acpi_match[] =3D {
> +	{ "NVDA9221" },

	{ .id =3D "NVDA9221" },

please

> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, mt8901_pinctrl_acpi_match);

Best regards
Uwe

--utkpo2x6tlcfmb3u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsEA60ACgkQj4D7WH0S
/k6hiAf/XF4emS6emmJJvqX9AjDSHrojg+xiVdcq/oc+l+vpquVwBYAHcsg4a895
XmrhGDWzm0BadIWPPVZIrBbmmk8g9E8ReVBA0VcYcsXoeWKOdlz9E7AdBMjXqOQQ
tPm81HkTpRLBzjQD2ZrExZ7powoG9a+6oE40947bUbkl5GMGPGxLzG91dIgqY0UN
mT4TVTgBYdRVeHyPJIkREJMa20cy1mWyjoiQus+w4UbQiTh4udXvvPlzNz56X1B/
QjA91jzkfAJrDLQTo5+GcORZ8xdviDqzmpkeQGak9cM38edFoLJA0O0QssLe/IPF
K5blzzfZDUvefxlvRuAs16Jl1WEmvQ==
=i650
-----END PGP SIGNATURE-----

--utkpo2x6tlcfmb3u--

