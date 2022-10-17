Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2575C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Oct 2022 09:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+DzhSmH1cBeruDtFaVKaVattsEwc8q4hTsou+lcv6jY=; b=hv5EdaLnzdT9edeWuA3XJDnItE
	ndzTDfm//p98ThGMku7BPo+L6+cn6Y8te8pp5HJHRMrZTsuq0WRxfREmkbYRfCp0LXvgcEGbwCPFR
	YIiW9THtmwezZ8FiU0q4KvlxrwZJRpy1BYWaznwdspNQ6Ro6qiGolmMl6O9N43Vbhw84RHbvt9Naj
	HIBBeZrM7zfk9EpnPT5H9D1ln3W40JIyYMk/IzQkW3M4oASGPrEZ1TrSscyrB+CYufXsAfuDShh1D
	j9ZXg/8FP490AA18h6WCDwp4x0zNaXAPnyp3nReAFw5op+rCB2198DKSjZ6mcY1L88bH/cIW1dZj7
	2wXpgA0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okM11-009Za1-O8; Mon, 17 Oct 2022 09:02:31 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okM0t-009ZUq-6i
	for linux-mediatek@lists.infradead.org; Mon, 17 Oct 2022 09:02:26 +0000
Received: by mail-ej1-x62a.google.com with SMTP id k2so23369433ejr.2
        for <linux-mediatek@lists.infradead.org>; Mon, 17 Oct 2022 02:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+DzhSmH1cBeruDtFaVKaVattsEwc8q4hTsou+lcv6jY=;
        b=Q+/ZCk5uKgheops7slfnvs8xurY8FEURvOhzY1eTrLbemXNWuo99WUD81VK+SpWCxY
         kzFTgIjquxop1/2G9aP+Jc1kCFR8S4kpwj8bfbUkfgvulb3p97gFWTEKh91wZsvKLTym
         IGt1H+AuIDwRoqtXQsNeJNwHocUiIbe3K3kYShul2xo1CQl7PNr7jxP/Mgn3ZFbkZlVO
         J/03NK6UfMQfdp40SIbVe6sr9G0pZuHS/nb7XvkWBeDwVFOg7SA3FW+4r+22nfUcKvmM
         0KiMdRaZT5lr/vOJbfahx9OfxFGmc5oyK0hcI+W0d917YHmMVMRNLZ2UqBGud/XBVBC3
         GKCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+DzhSmH1cBeruDtFaVKaVattsEwc8q4hTsou+lcv6jY=;
        b=7sKmC9urpX3tc/YH22CSYzlUH4nQtF+wBfe/q8sEKRt7ePYMcvRjH92LRsU7097/Rt
         fCZ8iFPExIq6Z1H+BlTj1BtIlNnKTMspQv6WpSq8R0pGHCHCHe36Ad4FMYx9vVJ68qe+
         SnDeKzmSFNpe6FAIXDhHT+ZvMHlxSD7Vw//80/TOK84olYMKTMz+GnyMeMjpWTUR+qbv
         K/IUfMFbsldON+9G9RUxzvJw4whVV6hXUZdL7Lu9KGdmC32AzGwXShElzBZ4IBYypD4o
         ev9W7Ho0nBZPx63jmH32j4PT+ayus2Tle0a8vcEBlgUiVcJBVpJ0Z1qfY8HscgpFHPht
         Fouw==
X-Gm-Message-State: ACrzQf0TdzTgUJHdmUnPKsOGAWSFwKZxKpa6oW9A1C6sfoVNs23HpjeD
	T4AAiJgsL9n5cwFw1ZZDJuZIzobg6gRvA0Rah36tJw==
X-Google-Smtp-Source: AMsMyM4UDyy4gIfLqRCo+xVdWhgvw2QqSAfU62C/zZi9P70aMTTtCFnk0FMes6AqIcJjw6kKWDVGE0urcJP2xkclA/A=
X-Received: by 2002:a17:906:8a48:b0:78d:acdc:b7d9 with SMTP id
 gx8-20020a1709068a4800b0078dacdcb7d9mr7921544ejc.500.1665997341068; Mon, 17
 Oct 2022 02:02:21 -0700 (PDT)
MIME-Version: 1.0
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 17 Oct 2022 11:02:09 +0200
Message-ID: <CACRpkdZ1M3ckw+jFgvMqG4jvR-t_44GPoZ6ZDXszwZCJr-cDpg@mail.gmail.com>
Subject: Re: [rft, PATCH v2 00/36] pinctrl: Clean up and add missed headers
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Marc Zyngier <maz@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Billy Tsai <billy_tsai@aspeedtech.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, Samuel Holland <samuel@sholland.org>, 
	Horatiu Vultur <horatiu.vultur@microchip.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Bjorn Andersson <bjorn.andersson@linaro.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Phil Edworthy <phil.edworthy@renesas.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Fabien Dessenne <fabien.dessenne@foss.st.com>, Prathamesh Shete <pshete@nvidia.com>, 
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>, linux-gpio@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
	linux-actions@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	openbmc@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org, 
	alsa-devel@alsa-project.org, patches@opensource.cirrus.com, 
	linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-omap@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, 
	Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	NXP Linux Team <linux-imx@nxp.com>, Andy Shevchenko <andy@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, 
	Paul Cercueil <paul@crapouillou.net>, Damien Le Moal <damien.lemoal@wdc.com>, 
	Tony Lindgren <tony@atomide.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Michal Simek <michal.simek@xilinx.com>, Andy Gross <agross@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@somainline.org>, Tomasz Figa <tomasz.figa@gmail.com>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_020223_259116_29C0667D 
X-CRM114-Status: GOOD (  13.28  )
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

On Mon, Oct 10, 2022 at 10:15 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Currently the header inclusion inside the pinctrl headers seems more arbitrary
> than logical. This series is basically out of two parts:
> - add missed headers to the pin control drivers / users
> - clean up the headers of pin control subsystem
>
> The idea is to have this series to be pulled after -rc1 by the GPIO and
> pin control subsystems, so all new drivers will utilize cleaned up headers
> of the pin control.

Aha I see you want to send a pull request so I backed out the applied patches
from the series for now.

Yours,
Linus Walleij

