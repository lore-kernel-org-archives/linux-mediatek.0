Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D84C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Oct 2022 08:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=683v4hUy0SmafI83To+Isl3SKfGOBhxnh8RoSe2BfVE=; b=E9daKyStPMyvcrsuFSluncBUhP
	LnQAFOMo+koRajkZJBaPzfpKjZXkBBPhzeR025Cju+SgTbFlisVqsyxmHOidqEMWkQt4Yf3o2URYV
	HAB9ToTsWSbMLRrRYoMUxOLLEv9XbJJ//DAYbevhXSDznJSwTez4+mub2ZSngCbBHaAduyoX+Khwz
	38gpF4FpUQYR3nnRBIPLEhvqByhNDonIsr6bSBY19VDU/TUKbr09MhWNWXKH9cKxOncQAIJJw3JHr
	MTqkxtgUlCpn1YYHGv+KHTrlv9Y6iRLoeYxsjtImD/Aw2D+3AQ11HNLUVQAmC2t8ISO4Phr5xTCvp
	0aKjn6rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okLwe-009T57-9w; Mon, 17 Oct 2022 08:58:00 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okLwZ-009SqC-1n
	for linux-mediatek@lists.infradead.org; Mon, 17 Oct 2022 08:57:56 +0000
Received: by mail-ej1-x62e.google.com with SMTP id fy4so23324889ejc.5
        for <linux-mediatek@lists.infradead.org>; Mon, 17 Oct 2022 01:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=683v4hUy0SmafI83To+Isl3SKfGOBhxnh8RoSe2BfVE=;
        b=t3+amSVGDFAxRbolB49Ma9U6k9IIKhxDwAwyJUkTM3Li0PafxLZLXAW0NCm1nt3as1
         N84+c+fPTLYB396bAl4/Q0w48uzDDqbLzehPyMBFM1Tp3a7LrIsxevlXc6BrscV+lOfq
         mGJ3EW5/EeQu7kupGXI95MFitBtE3U0fWugPttQLchXJ+CX+jzVQP7cWoQFnr4RoD6gf
         /aRgyHO6kVKTo3b840dYVddB4NeyVZKc5wR3ojjuItP2a5dz7lXcnTh1SpVRk9gntYNH
         Gk9gvPVT1XVoXT4ho5ATtKaTXv1ddOuBPp3yPHFaekZ0rOkS6BaG1XZCPh3lnr6Q6wEH
         dkkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=683v4hUy0SmafI83To+Isl3SKfGOBhxnh8RoSe2BfVE=;
        b=t5WZB04qe/XRxEzC2BmDuwklKObyq/1LAMPE76WsLt3mFmU94RN4DmwVi2VB23IpKm
         8N71RWfoYnFBX6jgYC1++fgCGL6e4MOah4zvgAKOxzqwbm+n8XntSC9miUyO2rQkajSN
         7NlqKYDnOBNOHVJO/mVflMYnubvD1tj3jX3WLqTYgOyszvv0syLl+oSlhXbu8sGvdmjZ
         a2230/Z57CYoLHQbIjPHPon0A+FwT5gSsZ3cK3lRQnqFkBfVNWyNHtmZ07eg4cUgMNUj
         ck86JHAzjLFQy6QZxO2E/1vRX4mpbwC3U3HnIjKbJqSbVILEX6DWJ7vlfh176ruj56+e
         99/Q==
X-Gm-Message-State: ACrzQf3iQA8ceWZrp5PMWZ6Y+jr2UnGT2bpkrhaNjvNE10i4/anPlZY8
	U7QOIll3STJjyKLbzpzRGajAzMVibS5ALGawL9+I9w==
X-Google-Smtp-Source: AMsMyM7EnJZWawlqbK2hCUNnkoxsNghTgy0VPziEZIqZHqcD50fAvXotg3KWEk8WTOVELGE1o/67a6uUcG2NxUWD/Yc=
X-Received: by 2002:a17:907:16aa:b0:6fe:91d5:18d2 with SMTP id
 hc42-20020a17090716aa00b006fe91d518d2mr4740704ejc.190.1665997072207; Mon, 17
 Oct 2022 01:57:52 -0700 (PDT)
MIME-Version: 1.0
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com> <20221010201453.77401-8-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20221010201453.77401-8-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 17 Oct 2022 10:57:41 +0200
Message-ID: <CACRpkdbuUZugMYmO_9D3AhL7C=NCU65EF1MCmYauQ=zc2yvydg@mail.gmail.com>
Subject: Re: [PATCH v2 07/36] pinctrl: axp209: Add missed header(s)
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
X-CRM114-CacheID: sfid-20221017_015755_228562_F9447FE1 
X-CRM114-Status: UNSURE (   9.23  )
X-CRM114-Notice: Please train this message.
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

> Do not imply that some of the generic headers may be always included.
> Instead, include explicitly what we are direct user of.
>
> While at it, sort headers alphabetically.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied!

Yours,
Linus Walleij

