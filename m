Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25D77C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Nov 2022 11:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+KDFcDI174F4+2BtSki4EO2v2RYQC8geLom77Dhpmbo=; b=jelvcBlGxAasNvxTGQkHaBDlPZ
	DUqF9mlamREcbGA7h1mU87BZFhedZ0vGC+wPsEuWE3zjDEQYV/gxrmbq6+lZkkwjnwsmQK5RD3vEH
	lKtrmzKqSqgJ/RSOtVOq8EAs4ygUXQUMuH1z3yPrKjhXDNiLoWABsS8gxLatDMnWx/49MJck4bnvw
	/0+wSBqSwDWzn4jn3qK3DGvUMZ4ebUhpVrC/3aRqowktrxh6Nm6BAXx66QJGYixSXj6IeTHjykZRV
	fza9LELLhQwOi1ycTISwL0m+jQDhlQJ/dbFPE/rExwIQ0aX/x8FIiDsLVRvw4ceaD+9LUgWwtFoJo
	BA977EtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouuRb-00Aise-PI; Tue, 15 Nov 2022 11:49:35 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouuRQ-00Aino-Jk
	for linux-mediatek@lists.infradead.org; Tue, 15 Nov 2022 11:49:26 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.94.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1ouuRD-0003ZJ-80; Tue, 15 Nov 2022 12:49:11 +0100
Date: Tue, 15 Nov 2022 11:49:09 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Jianhui Zhao <zhaojh329@gmail.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org,
	Sam Shih =?utf-8?B?KOWPsueiqeS4iSk=?= <Sam.Shih@mediatek.com>
Subject: Re: [PATCH] clk: mediatek: add mt7981 clock support
Message-ID: <Y3N8tVWUSYtO3tx1@makrotopia.org>
References: <20221115020606.46584-1-zhaojh329@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221115020606.46584-1-zhaojh329@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_034924_673142_FB1C8758 
X-CRM114-Status: GOOD (  17.22  )
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

Hi Jianhui,

On Tue, Nov 15, 2022 at 02:06:06AM +0000, Jianhui Zhao wrote:
> Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>
> ---
>  .../bindings/clock/mediatek,apmixedsys.yaml   |   1 +
>  .../bindings/clock/mediatek,topckgen.yaml     |   1 +
>  drivers/clk/mediatek/Kconfig                  |  17 +
>  drivers/clk/mediatek/Makefile                 |   4 +
>  drivers/clk/mediatek/clk-mt7981-apmixed.c     | 103 +++++
>  drivers/clk/mediatek/clk-mt7981-eth.c         | 138 ++++++
>  drivers/clk/mediatek/clk-mt7981-infracfg.c    | 323 +++++++++++++
>  drivers/clk/mediatek/clk-mt7981-topckgen.c    | 431 ++++++++++++++++++
>  include/dt-bindings/clock/mt7981-clk.h        | 253 ++++++++++
>  9 files changed, 1271 insertions(+)
>  create mode 100644 drivers/clk/mediatek/clk-mt7981-apmixed.c
>  create mode 100644 drivers/clk/mediatek/clk-mt7981-eth.c
>  create mode 100644 drivers/clk/mediatek/clk-mt7981-infracfg.c
>  create mode 100644 drivers/clk/mediatek/clk-mt7981-topckgen.c
>  create mode 100644 include/dt-bindings/clock/mt7981-clk.h
> 
> ...
> diff --git a/drivers/clk/mediatek/clk-mt7981-infracfg.c b/drivers/clk/mediatek/clk-mt7981-infracfg.c
> new file mode 100644
> index 000000000000..d483e654606f
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt7981-infracfg.c
> @@ -0,0 +1,323 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2021 MediaTek Inc.
> + * Author: Sam Shih <sam.shih@mediatek.com>
> + * Author: Wenzhen Yu <wenzhen.yu@mediatek.com>
> + * Author: Jianhui Zhao <zhaojh329@gmail.com>
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include "clk-mtk.h"
> +#include "clk-gate.h"
> +#include "clk-mux.h"
> +
> +#include <dt-bindings/clock/mt7981-clk.h>
> +#include <linux/clk.h>
> +
> +static DEFINE_SPINLOCK(mt7981_clk_lock);
> +
> +static const struct mtk_fixed_factor infra_divs[] = {
> +	FACTOR(CLK_INFRA_CK_F26M, "infra_ck_f26m", "csw_f26m_sel", 1, 1),
> +	FACTOR(CLK_INFRA_UART, "infra_uart", "uart_sel", 1, 1),
> +	FACTOR(CLK_INFRA_ISPI0, "infra_ispi0", "spi_sel", 1, 1),
> +	FACTOR(CLK_INFRA_I2C, "infra_i2c", "i2c_sel", 1, 1),
> +	FACTOR(CLK_INFRA_ISPI1, "infra_ispi1", "spim_mst_sel", 1, 1),
> +	FACTOR(CLK_INFRA_PWM, "infra_pwm", "pwm_sel", 1, 1),
> +	FACTOR(CLK_INFRA_66M_MCK, "infra_66m_mck", "sysaxi_sel", 1, 2),
> +	FACTOR(CLK_INFRA_CK_F32K, "infra_ck_f32k", "cb_rtc_32p7k", 1, 1),
> +	FACTOR(CLK_INFRA_PCIE_CK, "infra_pcie", "pextp_tl_ck_sel", 1, 1),
> +	FACTOR(CLK_INFRA_PWM_BCK, "infra_pwm_bck", "infra_pwm_bsel", 1, 1),
> +	FACTOR(CLK_INFRA_PWM_CK1, "infra_pwm_ck1", "infra_pwm1_sel", 1, 1),
> +	FACTOR(CLK_INFRA_PWM_CK2, "infra_pwm_ck2", "infra_pwm2_sel", 1, 1),
> +	FACTOR(CLK_INFRA_133M_HCK, "infra_133m_hck", "sysaxi", 1, 1),
> +	FACTOR(CLK_INFRA_66M_PHCK, "infra_66m_phck", "infra_133m_hck", 1, 1),
> +	FACTOR(CLK_INFRA_FAUD_L_CK, "infra_faud_l", "aud_l", 1, 1),
> +	FACTOR(CLK_INFRA_FAUD_AUD_CK, "infra_faud_aud", "a1sys", 1, 1),
> +	FACTOR(CLK_INFRA_FAUD_EG2_CK, "infra_faud_eg2", "a_tuner", 1, 1),
> +	FACTOR(CLK_INFRA_I2CS_CK, "infra_i2cs", "i2c_bck", 1, 1),
> +	FACTOR(CLK_INFRA_MUX_UART0, "infra_mux_uart0", "infra_uart0_sel", 1, 1),
> +	FACTOR(CLK_INFRA_MUX_UART1, "infra_mux_uart1", "infra_uart1_sel", 1, 1),
> +	FACTOR(CLK_INFRA_MUX_UART2, "infra_mux_uart2", "infra_uart2_sel", 1, 1),
> +	FACTOR(CLK_INFRA_NFI_CK, "infra_nfi", "nfi1x", 1, 1),
> +	FACTOR(CLK_INFRA_SPINFI_CK, "infra_spinfi", "spinfi_bck", 1, 1),
> +	FACTOR(CLK_INFRA_MUX_SPI0, "infra_mux_spi0", "infra_spi0_sel", 1, 1),
> +	FACTOR(CLK_INFRA_MUX_SPI1, "infra_mux_spi1", "infra_spi1_sel", 1, 1),
> +	FACTOR(CLK_INFRA_MUX_SPI2, "infra_mux_spi2", "infra_spi2_sel", 1, 1),
> +	FACTOR(CLK_INFRA_RTC_32K, "infra_rtc_32k", "cb_rtc_32k", 1, 1),
> +	FACTOR(CLK_INFRA_FMSDC_CK, "infra_fmsdc", "emmc_400m", 1, 1),
> +	FACTOR(CLK_INFRA_FMSDC_HCK_CK, "infra_fmsdc_hck", "emmc_208m", 1, 1),
> +	FACTOR(CLK_INFRA_PERI_133M, "infra_peri_133m", "sysaxi", 1, 1),
> +	FACTOR(CLK_INFRA_133M_PHCK, "infra_133m_phck", "sysaxi", 1, 1),
> +	FACTOR(CLK_INFRA_USB_SYS_CK, "infra_usb_sys", "u2u3_sys", 1, 1),
> +	FACTOR(CLK_INFRA_USB_CK, "infra_usb", "u2u3_ref", 1, 1),
> +	FACTOR(CLK_INFRA_USB_XHCI_CK, "infra_usb_xhci", "u2u3_xhci", 1, 1),
> +	FACTOR(CLK_INFRA_PCIE_GFMUX_TL_O_PRE, "infra_pcie_mux", "pextp_tl", 1, 1),
> +	FACTOR(CLK_INFRA_F26M_CK0, "infra_f26m_ck0", "csw_f26m", 1, 1),
> +	FACTOR(CLK_INFRA_133M_MCK, "infra_133m_mck", "sysaxi", 1, 1),
> +};
> +

Just splitting the SDK driver into clock domains will have us end up
with lots of unnessesary aliases.
Please take a look at how clocks have been reorganized for MT7986:
Remove all duplicate 1:1 clock factors while keeping clock drivers
still working. Ie. there is no need to have both, infracfg and
infracfg_ao, for example, things can be simplified.

To understand what I mean in practise, please compare the clk-mt7986.c
driver from MediaTek SDK with the clk-mt7986-*.c drivers which have
been merged to Linux.

And did you actually test this? Can you publish your working tree for
MT7981 based on linux-next somewhere?
I'm asking because when I tried to do the same as you are doing now,
the MT7981 sample board I've been provided hangs early during boot...


Cheers


Daniel

