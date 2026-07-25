Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D927C531D0
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Jul 2026 13:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8pTpZAYL/uV7mr593ZO/jWFOlR/Dg0f8GSHwPZDgbVg=; b=gbIoix1VNGEZzTdNbf7k3NvIwd
	zXPd7+YvUx3V626HU33sYGh8BO05jR9jAhHc5CZY1HnHkNbecHkhR9h+08yjAMhx8WKXFDLaReBT2
	+s9mp8GLaMbdWo7uMfBJa8MsMMc0wFPWgo7Y3tBDf41YJIg4E6CIEB7hVqfUg09mSgLUGBc+AW0n0
	dfEbC/LQrLa6LMPK4Mv4kUKpDPfMt34tFD6CeByYK4demNqFqzRKYWetp9CL7EG3c67bvljmCA79w
	GLwJFfmeXT2QtEfIMk0zjCII1bZlG8asJy5b0hTYuRSEglXbs+nQ//ENwvVj/zhAUv1xDecwVuSEG
	XP7vU1oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnc1Z-00000000MPs-3eDO;
	Sat, 25 Jul 2026 13:02:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnc1X-00000000MPe-45xZ
	for linux-mediatek@lists.infradead.org;
	Sat, 25 Jul 2026 13:02:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1C548600AD
	for <linux-mediatek@lists.infradead.org>; Sat, 25 Jul 2026 13:02:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCABA1F00A3F
	for <linux-mediatek@lists.infradead.org>; Sat, 25 Jul 2026 13:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784984558;
	bh=8pTpZAYL/uV7mr593ZO/jWFOlR/Dg0f8GSHwPZDgbVg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ilSP6pdzsjzP+GADsGwRiickTJJs8mt88Pod9bCCiLCSiS6e0uuMIcNVQhRau8EHC
	 x2c4OiwgXb651O3nCODcMwqk0HEKVn0BkcVw7BmxbVLjdTjIzZaJSVCXcX9b1Fu4kA
	 WBfsw6zjm572aJ2d7SP6olVeumgbhY2bFiqrW4lLFuFBDPVoyhqAq/5QBZJtoaMmh5
	 NiT/QFBxwmrv2KMruA0ZcURmthLRKBbDjnwqJ1RuF2CWpPYpcY2NZlJH6CZTvMjp5R
	 FmOAu8cCpUI6h1lV3w5soN3lLzU77KzFMYLiU3goSDMx+JxYj207iBsFcNAfvNykKo
	 hNvVd0vrSJ5yQ==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b29599b81cso1314429e87.1
        for <linux-mediatek@lists.infradead.org>; Sat, 25 Jul 2026 06:02:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro+fcaLmlnfid6vJKhqec15XxavmOiLiI2O6aMZUxLOdrTcjIi4X6Jsor0iMTGu6J1w1dO9QcSgAG+LAyYkHA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0gDR9u3xsYrpzK2M8VhdZbCT0+QrMkfz+4OuQZqShvvVY1QBJ
	MCjBSgSrc3R03JuFi9a5f0ALfnV3RBByRyaU6al0yex8bj6c2lYmN0ZlqBp5iSxLAH4EAUs0EAF
	6Sd9SQIl4VEJmN+k9WHtvmecr/wh7YnQ=
X-Received: by 2002:a05:6512:15a8:b0:5b0:1f1e:1b6a with SMTP id
 2adb3069b0e04-5b2c1b38e19mr351733e87.26.1784984557428; Sat, 25 Jul 2026
 06:02:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260723035823.2041832-1-justin.yeh@mediatek.com>
In-Reply-To: <20260723035823.2041832-1-justin.yeh@mediatek.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 25 Jul 2026 15:02:24 +0200
X-Gmail-Original-Message-ID: <CAD++jL=fy+0ZZhg_eH_BGLUZfpK69zCcOaTp_LQ93yvSxUiS3w@mail.gmail.com>
X-Gm-Features: AUfX_mwQ7iPbvZyUaqbt4Um5y3UrzgBH-Ks3ZwCCkWtrVCdeGDusOUwTXC1V-p4
Message-ID: <CAD++jL=fy+0ZZhg_eH_BGLUZfpK69zCcOaTp_LQ93yvSxUiS3w@mail.gmail.com>
Subject: Re: [PATCH v7 0/5] pinctrl: mediatek: Enable module build support
To: Justin Yeh <justin.yeh@mediatek.com>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Jul 23, 2026 at 5:58=E2=80=AFAM Justin Yeh <justin.yeh@mediatek.com=
> wrote:

> This series lets the MediaTek pinctrl drivers be built as loadable
> kernel modules. This is required for Android GKI + vendor_dlkm
> deployments, where vendor-specific drivers must be kept separate from
> the GKI vmlinux and loaded as modules from the vendor partition.
>
> Enabling the individual SoC drivers as modules is a single logical step,
> but it has a few prerequisites, so the series is:
>
>   1. Fix a pre-existing GPIO chip lifecycle bug. The gpio_chip lives in
>      device-managed memory but is registered with the non-managed
>      gpiochip_add_data(). While the drivers were built-in only this was
>      harmless, but once they can be unbound/rmmod'd, devm frees the
>      backing memory while the chip is still registered (use-after-free).
>      Switch to devm_gpiochip_add_data() in the shared probe/init paths.
>
>   2. Fix a pre-existing EINT resource leak on unbind. mtk_eint_do_init()
>      creates an IRQ domain, an interrupt mapping per EINT line and a
>      chained handler on the parent interrupt, none of which were ever
>      released. Once the drivers can be unbound/rmmod'd this leaves a
>      dangling IRQ domain, mappings whose chip data points at freed
>      memory, and a chained handler still firing into that freed data.
>      Tear them down with a device-managed action, matching the devm
>      lifecycle used for the gpio_chip.
>
>   3. Make the shared common code modular. The SoC drivers link against
>      pinctrl-mtk-common.c (v1), pinctrl-moore.c and pinctrl-mtmips.c,
>      whose Kconfig symbols were bool and which exported nothing. Without
>      this, selecting a SoC driver as =3Dm forces the common symbol to =3D=
y
>      and the module fails to link against the unexported entry points.
>      Convert PINCTRL_MTK, PINCTRL_MTK_MOORE and PINCTRL_MTK_MTMIPS to
>      tristate, export the entry points, and add MODULE_LICENSE()/
>      MODULE_DESCRIPTION(). The already-modular v2 common code
>      additionally needs mtk_rmw() exported, since it is called directly
>      by SoC drivers such as mt7623. The shared symbols are exported in
>      the "MTK_PINCTRL" symbol namespace (EXPORT_SYMBOL_NS_GPL()), and
>      each SoC driver that uses them declares MODULE_IMPORT_NS().
>
>   4. Convert the MT7986 driver to a single initcall. It registers two
>      platform drivers (mt7986a/mt7986b) and used to call arch_initcall()
>      twice. A module has only one module_init(), so two arch_initcall()s
>      break the module build with a redefinition of
>      init_module()/__inittest(). Fold both drivers into one
>      platform_register_drivers() call from a single initcall. No
>      functional change when built-in.
>
>   5. Flip every SoC driver's Kconfig from bool to tristate and add the
>      module metadata. This also adds the MODULE_DEVICE_TABLE(of, ...)
>      entries that several drivers were missing, so the resulting modules
>      carry the modalias information udev needs to autoload them on a
>      matching device.
>
> The series builds cleanly under allmodconfig on arm64 (all SoC drivers
> as =3Dm).
>
> Changes in v7:
>  - patch 2/5 (free EINT resources on unbind): add synchronize_irq() in
>    the teardown, after detaching the chained handler and before disposing
>    of the domain/mappings, so any in-flight handler has finished before
>    the data it references is freed, as suggested by AngeloGioacchino Del
>    Regno. Also add the missing #include <linux/interrupt.h> that
>    synchronize_irq() needs. Added his Reviewed-by.
>  - patch 5/5 (enable module build support): add MODULE_DEVICE_TABLE(of,
>    ...) to the SoC drivers that were missing it. AngeloGioacchino and
>    Chen-Yu Tsai both pointed this out; without it the module still
>    builds but is not autoloaded by udev on a matching device.
>
> Review status: patches 1/5 and 4/5 carry Chen-Yu Tsai's Reviewed-by;
> patch 2/5 carries AngeloGioacchino Del Regno's Reviewed-by; patch 5/5
> carries AngeloGioacchino Del Regno's Reviewed-by (from the per-driver
> patches reviewed in v4, preserved across the squash). Patch 3/5 has not
> been reviewed yet.

All patches applied, I had to rebase patch 5/5, please check the
result!

Yours,
Linus Walleij

