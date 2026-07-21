Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0368C44532
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2026 23:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z9jxxoNk0Zci913QIrLSshdt2n65M0x+d9IlMGmwHh4=; b=dksSlzIW+pA2eBiFOBGbC7DctW
	2Kiu7qFMLO5AnkeALoehny0jB92cZWDq5DJENymoiZwmQCDfvEzzJWvjfPzwNzqIT2+f4RhlRBvtq
	QhXWch3zmH18A/rE82DJnPEmqF9Rk3j/YkLJoSoteRlKmKYd6A7pMYJovS0Cn6qzTx4Xx0bJ3Lr6A
	OKW9cFvKYYQgF+xUTyBE1G7b14ujRYZIAqv5sRA4eYIt8l3nSLFUa4qkqFiUbcsY0KFTnVqDAL8YK
	RJBu9Fnzei5VjpZVS7fNsJbi/sRu2jls1A2jCaob1QiFNNbSUF/j6dfM03EPV15zhoEuH4zeobnUN
	qzuJX0PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmJVi-0000000AXrl-19dP;
	Tue, 21 Jul 2026 23:04:26 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmJVe-0000000AXq2-4ARz
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Jul 2026 23:04:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784675061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z9jxxoNk0Zci913QIrLSshdt2n65M0x+d9IlMGmwHh4=;
	b=EGexj/wpbzem8GSRnIILKx3VU9LaKh7QcOPFMgWyfbZPKHOlyJJi1ANfLQR1blR+dWtjJC
	sC9LqM3/P133JwMMepKC6Kp6jM7uRi8cd+m3OCk6l6+jIAyKGOycPoM47HMPFd4kGEIlff
	hkrDWpR9ELi9uGF+feLdqv1p7kibZLM=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-153-XuR9wmSwO3aUhGSpycQfLw-1; Tue, 21 Jul 2026 19:04:20 -0400
X-MC-Unique: XuR9wmSwO3aUhGSpycQfLw-1
X-Mimecast-MFC-AGG-ID: XuR9wmSwO3aUhGSpycQfLw_1784675060
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8efad04d884so171681446d6.0
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Jul 2026 16:04:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784675060; x=1785279860;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z9jxxoNk0Zci913QIrLSshdt2n65M0x+d9IlMGmwHh4=;
        b=kfJg39RvXCyUHIFlqzAIPvRQLNCIJFHQNntL7mR36rHp5ce4EFoT5gT0T2EdkgugXc
         eaUeq4BI49G0uGUnrM/eZbE6Xi3C59q+ay7YUI6MfzOdW0LcJmlojPQJVKSA6noubHVh
         Iybrlw7eefe++Aa08vly+h9aJyMc8xRWvZVgQjQNa7JcLjh8k1NRecKpltZ+cAGGe83k
         k+1v2I7MUMNz09GyoHi2s+CPiI199C2NB2rlFIjJd3fTELaOuuHJ5skR9+fEUUqm/And
         VWPq6QgvSKLfLIuUAEj9tvmpXerhur79jarkCDz6yZwuHPdZw/Wd8L/FKbFZTkkTRXdK
         P9Cw==
X-Forwarded-Encrypted: i=1; AHgh+Rq7e8k6si4ZG7aCvT1vJp7SZBuS2ULWQkeRPSDm08KBzACBn+orHgdEvS9XI+ffmiU0ziajjJPmudoVYPPiUQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzNS3I+xO2QSWj8ciC2PtYzLfz4PTMwHov1pLd+TEOaPGPUMnt7
	BerfGNK1qhxrzxNOrukoc/i3AZDm8ZqP/Txe3osU5peHvcTkaLOWHQJRkB2iOZf7KMQJwAn0c2X
	Pd2RySk/1UhX+PD2sis5S/keq/XOGW5NezWxzJ9N4UO9+vV6Aumyoh7wN9ibXHYr0/PhxX2cyVw
	==
X-Gm-Gg: AR+sD12tBkdFq3nlXL6w6R7scKP7KTc/Lm9FYKTW4RbcuJDIEkeGUAG/XimkC91k4AR
	SAGoiRs0Ezy4Gj2zjTxe5yU2TDR5WWTpCnADaOinMdxkChLefhEJGKzUDZHeC/aEA/q08DCVBfR
	b3airE1Po+VMqAWCtSjg4AQIPUSt1t1aIv20ddIAUaWv18LhCKwP0ts0rVAxxy+beaGTqLN/trl
	kxgsbUQSWSHm2fAwi2s+nWbGk7EjxdODiY6y4WriLL5Y9Wpjp/K3zWo9M02icW0szy5lYs3vEyY
	fow8AR3KTyesFWij3Zx0MzmXeJ3eS5golZAANq7Bg07LowKgxj66w7yjV8hq93GJcPNn/HPXBMY
	O37GKvX3JHM2dJOn4XdFrqbJl+I2jiVdftPY=
X-Received: by 2002:a05:6214:2301:b0:8ce:ca7d:b099 with SMTP id 6a1803df08f44-9077832dd19mr216149086d6.18.1784675059729;
        Tue, 21 Jul 2026 16:04:19 -0700 (PDT)
X-Received: by 2002:a05:6214:2301:b0:8ce:ca7d:b099 with SMTP id 6a1803df08f44-9077832dd19mr216148766d6.18.1784675059293;
        Tue, 21 Jul 2026 16:04:19 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907ba9e13d1sm7062316d6.28.2026.07.21.16.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 16:04:18 -0700 (PDT)
Date: Tue, 21 Jul 2026 19:04:16 -0400
From: Brian Masney <bmasney@redhat.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	Irving-CH Lin <irving-ch.lin@mediatek.com>
Subject: Re: [PATCH v3 09/18] clk: mediatek: Add MT8189 apmixedsys clock
 support
Message-ID: <al_68GlP01W0US0x@redhat.com>
References: <20260720-mt8189-clocks-system-base-v3-0-8e6d99ab3ad2@collabora.com>
 <20260720-mt8189-clocks-system-base-v3-9-8e6d99ab3ad2@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20260720-mt8189-clocks-system-base-v3-9-8e6d99ab3ad2@collabora.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mHNEBl7z0PDktkIWFzbCSjR3hCIEXT46JlQUcN-VicE_1784675060
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_160423_116312_D3C9E3E3 
X-CRM114-Status: GOOD (  25.75  )
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

Hi Louis-Alexis,

On Mon, Jul 20, 2026 at 12:04:19PM +0200, Louis-Alexis Eyraud wrote:
> Add support for the MT8189 apmixedsys clock controller, which provides
> PLLs generated from SoC 26m.
> 
> Co-developed-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
> Signed-off-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
> Co-developed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>  drivers/clk/mediatek/Kconfig                 |  13 ++
>  drivers/clk/mediatek/Makefile                |   1 +
>  drivers/clk/mediatek/clk-mt8189-apmixedsys.c | 196 +++++++++++++++++++++++++++
>  3 files changed, 210 insertions(+)
> 
> diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
> index 2c09fd729bab..f67dfb6cd019 100644
> --- a/drivers/clk/mediatek/Kconfig
> +++ b/drivers/clk/mediatek/Kconfig
> @@ -815,6 +815,19 @@ config COMMON_CLK_MT8188_WPESYS
>  	help
>  	  This driver supports MediaTek MT8188 Warp Engine clocks.
>  
> +config COMMON_CLK_MT8189
> +	tristate "Clock driver for MediaTek MT8189"
> +	depends on ARM64 || COMPILE_TEST
> +	select COMMON_CLK_MEDIATEK
> +	select COMMON_CLK_MEDIATEK_FHCTL
> +	default ARCH_MEDIATEK
> +	help
> +	  Enable this option to support the clock management for MediaTek MT8189 SoC. This
> +	  includes handling of all primary clock functions and features specific to the MT8189
> +	  platform. Enabling this driver ensures that the system's clock functionality aligns
> +	  with the MediaTek MT8189 hardware capabilities, providing efficient management of
> +	  clock speeds and power consumption.
> +
>  config COMMON_CLK_MT8192
>  	tristate "Clock driver for MediaTek MT8192"
>  	depends on ARM64 || COMPILE_TEST
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
> index d8736a060dbd..66577ccb9b93 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -123,6 +123,7 @@ obj-$(CONFIG_COMMON_CLK_MT8188_VDOSYS) += clk-mt8188-vdo0.o clk-mt8188-vdo1.o
>  obj-$(CONFIG_COMMON_CLK_MT8188_VENCSYS) += clk-mt8188-venc.o
>  obj-$(CONFIG_COMMON_CLK_MT8188_VPPSYS) += clk-mt8188-vpp0.o clk-mt8188-vpp1.o
>  obj-$(CONFIG_COMMON_CLK_MT8188_WPESYS) += clk-mt8188-wpe.o
> +obj-$(CONFIG_COMMON_CLK_MT8189) += clk-mt8189-apmixedsys.o
>  obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192-apmixedsys.o clk-mt8192.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
> diff --git a/drivers/clk/mediatek/clk-mt8189-apmixedsys.c b/drivers/clk/mediatek/clk-mt8189-apmixedsys.c
> new file mode 100644
> index 000000000000..0657a50c30d9
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8189-apmixedsys.c
> @@ -0,0 +1,196 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2025-2026 MediaTek Inc.
> + *                    Qiqi Wang <qiqi.wang@mediatek.com>
> + *                    Irving-CH Lin <irving-ch.lin@mediatek.com>
> + * Copyright (C) 2026 Collabora Ltd.
> + *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> + *                    Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>

The list of includes here seems excessive, especially compared to the
later files in this series.

> +
> +#include "clk-fhctl.h"
> +#include "clk-mtk.h"
> +#include "clk-pll.h"
> +
> +#include <dt-bindings/clock/mediatek,mt8189-clk.h>
> +
> +#define MT8189_PLL_FMAX		(3800UL * MHZ)
> +#define MT8189_PLL_FMIN		(1500UL * MHZ)
> +#define MT8189_PLLEN_OFS	0x70
> +#define MT8189_INTEGER_BITS	8
> +
> +#define PLL_SETCLR(_id, _name, _reg, _en_setclr_bit,		\
> +			_rstb_setclr_bit, _flags, _pd_reg,	\
> +			_pd_shift, _tuner_reg, _tuner_en_reg,	\
> +			_tuner_en_bit, _pcw_reg, _pcw_shift,	\
> +			_pcwbits) {				\
> +		.id = _id,					\
> +		.name = _name,					\
> +		.en_reg = MT8189_PLLEN_OFS,			\
> +		.reg = _reg,					\
> +		.pll_en_bit = _en_setclr_bit,			\
> +		.rst_bar_mask = BIT(_rstb_setclr_bit),		\
> +		.flags = _flags,				\
> +		.fmax = MT8189_PLL_FMAX,			\
> +		.fmin = MT8189_PLL_FMIN,			\
> +		.pd_reg = _pd_reg,				\
> +		.pd_shift = _pd_shift,				\
> +		.tuner_reg = _tuner_reg,			\
> +		.tuner_en_reg = _tuner_en_reg,			\
> +		.tuner_en_bit = _tuner_en_bit,			\
> +		.pcw_reg = _pcw_reg,				\
> +		.pcw_shift = _pcw_shift,			\
> +		.pcwbits = _pcwbits,				\
> +		.pcwibits = MT8189_INTEGER_BITS,		\
> +	}

There is no .ops set. mtk_clk_register_pll() in drivers/clk/mediatek/clk-pll.c
will use mtk_pll_ops when no ops is set. mtk_pll_prepare() reads/writes
pll->pwr_addr.

> +
> +static const struct mtk_pll_data apmixed_plls[] = {
> +	PLL_SETCLR(CLK_APMIXED_ARMPLL_LL, "armpll-ll", 0x204, 18,
> +		   0, PLL_AO, 0x208, 24, 0, 0, 0, 0x208, 0, 22),
> +	PLL_SETCLR(CLK_APMIXED_ARMPLL_BL, "armpll-bl", 0x214, 17,
> +		   0, PLL_AO, 0x218, 24, 0, 0, 0, 0x218, 0, 22),
> +	PLL_SETCLR(CLK_APMIXED_CCIPLL, "ccipll", 0x224, 16,
> +		   0, PLL_AO, 0x228, 24, 0, 0, 0, 0x228, 0, 22),
> +	PLL_SETCLR(CLK_APMIXED_MAINPLL, "mainpll", 0x304, 15,
> +		   23, HAVE_RST_BAR | PLL_AO,
> +		   0x308, 24, 0, 0, 0, 0x308, 0, 22),
> +	PLL_SETCLR(CLK_APMIXED_UNIVPLL, "univpll", 0x314, 14,
> +		   23, HAVE_RST_BAR, 0x318, 24, 0, 0, 0, 0x318, 0, 22),
> +	PLL_SETCLR(CLK_APMIXED_MMPLL, "mmpll", 0x324, 13,
> +		   23, HAVE_RST_BAR, 0x328, 24, 0, 0, 0, 0x328, 0, 22),
> +	PLL_SETCLR(CLK_APMIXED_MFGPLL, "mfgpll", 0x504, 7,
> +		   0, 0, 0x508, 24, 0, 0, 0, 0x508, 0, 22),
> +	PLL_SETCLR(CLK_APMIXED_APLL1, "apll1", 0x404, 11,
> +		   0, 0, 0x408, 24, 0x040, 0x00c, 0, 0x40c, 0, 32),
> +	PLL_SETCLR(CLK_APMIXED_APLL2, "apll2", 0x418, 10,
> +		   0, 0, 0x41c, 24, 0x044, 0x00c, 1, 0x420, 0, 32),
> +	PLL_SETCLR(CLK_APMIXED_EMIPLL, "emipll", 0x334, 12,
> +		   0, PLL_AO, 0x338, 24, 0, 0, 0, 0x338, 0, 22),
> +	PLL_SETCLR(CLK_APMIXED_APUPLL2, "apupll2", 0x614, 2,
> +		   0, 0, 0x618, 24, 0, 0, 0, 0x618, 0, 22),
> +	PLL_SETCLR(CLK_APMIXED_APUPLL, "apupll", 0x604, 3,
> +		   0, 0, 0x608, 24, 0, 0, 0, 0x608, 0, 22),
> +	PLL_SETCLR(CLK_APMIXED_TVDPLL1, "tvdpll1", 0x42c, 9,
> +		   0, 0, 0x430, 24, 0, 0, 0, 0x430, 0, 22),
> +	PLL_SETCLR(CLK_APMIXED_TVDPLL2, "tvdpll2", 0x43c, 8,
> +		   0, 0, 0x440, 24, 0, 0, 0, 0x440, 0, 22),
> +	PLL_SETCLR(CLK_APMIXED_ETHPLL, "ethpll", 0x514, 6,
> +		   0, 0, 0x518, 24, 0, 0, 0, 0x518, 0, 22),
> +	PLL_SETCLR(CLK_APMIXED_MSDCPLL, "msdcpll", 0x524, 5,
> +		   0, 0, 0x528, 24, 0, 0, 0, 0x528, 0, 22),
> +	PLL_SETCLR(CLK_APMIXED_UFSPLL, "ufspll", 0x534, 4,
> +		   0, 0, 0x538, 24, 0, 0, 0, 0x538, 0, 22),
> +};
> +
> +#define FH(_pllid, _fhid, _offset) {				\
> +		.data = {					\
> +			.pll_id = _pllid,			\
> +			.fh_id = _fhid,				\
> +			.fh_ver = FHCTL_PLLFH_V2,		\
> +			.fhx_offset = _offset,			\
> +			.dds_mask = GENMASK(21, 0),		\
> +			.slope0_value = 0x6003c97,		\
> +			.slope1_value = 0x6003c97,		\
> +			.sfstrx_en = BIT(2),			\
> +			.frddsx_en = BIT(1),			\
> +			.fhctlx_en = BIT(0),			\
> +			.tgl_org = BIT(31),			\
> +			.dvfs_tri = BIT(31),			\
> +			.pcwchg = BIT(31),			\
> +			.dt_val = 0x0,				\
> +			.df_val = 0x9,				\
> +			.updnlmt_shft = 16,			\
> +			.msk_frddsx_dys = GENMASK(23, 20),	\
> +			.msk_frddsx_dts = GENMASK(19, 16),	\
> +		},						\
> +	}
> +
> +static struct mtk_pllfh_data pllfhs[] = {
> +	FH(CLK_APMIXED_ARMPLL_LL, 0, 0x003C),
> +	FH(CLK_APMIXED_ARMPLL_BL, 1, 0x0050),
> +	FH(CLK_APMIXED_CCIPLL, 2, 0x0064),
> +	FH(CLK_APMIXED_MAINPLL, 3, 0x0078),
> +	FH(CLK_APMIXED_MMPLL, 4, 0x008C),
> +	FH(CLK_APMIXED_MFGPLL, 5, 0x00A0),
> +	FH(CLK_APMIXED_EMIPLL, 6, 0x00B4),
> +	FH(CLK_APMIXED_TVDPLL1, 7, 0x00C8),
> +	FH(CLK_APMIXED_TVDPLL2, 8, 0x00DC),
> +	FH(CLK_APMIXED_MSDCPLL, 9, 0x00F0),
> +	FH(CLK_APMIXED_UFSPLL, 10, 0x0104),
> +	FH(CLK_APMIXED_APUPLL, 11, 0x0118),
> +	FH(CLK_APMIXED_APUPLL2, 12, 0x012c),
> +};
> +
> +static const struct of_device_id of_match_clk_mt8189_apmixed[] = {
> +	{ .compatible = "mediatek,mt8189-apmixedsys" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, of_match_clk_mt8189_apmixed);
> +
> +static int clk_mt8189_apmixed_probe(struct platform_device *pdev)
> +{
> +	int r;
> +	struct clk_hw_onecell_data *clk_data;
> +	struct device_node *node = pdev->dev.of_node;
> +	const u8 *fhctl_node = "mediatek,mt8189-fhctl";

Reverse Christmas tree.

Brian


