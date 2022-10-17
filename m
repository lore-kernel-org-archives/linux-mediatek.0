Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D42BBC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Oct 2022 08:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0VJfZvANzZSSJeUMuF0Bxg8wfo9w1jXMkbWMGF7oMMk=; b=tdJwVb+uyEHE/0IkYEmgr6XSCr
	uhvs6y/5sB34lyBRF5lvQzzKf368F5DrOezVLsYAgLqB3fC3quF9oKKmFopXgSr7irZHTT5edAdXr
	Kz3EzA4NrWY6iKlNvbjRWq60eS4zYXT4dRlSF3OaPq7zq+IhQKjylq7I4brxgPpb/GFhJ2vGHal5G
	Ph4RGRlEkywRCNUtS1MLgE3X58+QTLonkkHZBBmbjSRzcZlSQjxS6Ri9EVhhV9ae2svczyi1o68eK
	6IbA8rLD42IcLHMH/afWOP1zirooUd5zf8IQ/JrcDTsEX7+B5CbbRo1y5rbjp0U3NwHfWwIDbFbNm
	9VNeEDcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okLuk-009Pdc-Pt; Mon, 17 Oct 2022 08:56:02 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okLue-009PUc-04
	for linux-mediatek@lists.infradead.org; Mon, 17 Oct 2022 08:55:58 +0000
Received: by mail-ed1-x52c.google.com with SMTP id l22so15022374edj.5
        for <linux-mediatek@lists.infradead.org>; Mon, 17 Oct 2022 01:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0VJfZvANzZSSJeUMuF0Bxg8wfo9w1jXMkbWMGF7oMMk=;
        b=h8+aqXSTBEqQ0IHMBMNPhjr9SeCQwb1DFE7zkS7DuxOCyYhHHtEWnTIS3wxspPh+e+
         dUFV5PNa0sGCsNrwAajogaI8BJInUOBN9fIYiJI/oU5K+wai5B9kXx/nWczzGZn3YnwP
         dSN9YZlxfr1D33tXkQPlB+vMfiTQmXxIk9siNbYHU2BhxLv9gcaHQJHRdNBb5x7wM8O+
         +VLFpvPmLHSDc/qglGFSwgzIKVsEZYrUlNVCgmB7aiCvO/FbFGei6MZbNlqZs7gJcLZF
         8EdrOlLH7TUP0zCW+HtIWbOKHx5eCALtG+HqK2uSjMBtvJ6kLKy1FcrS23HAKCV8r3ir
         nX9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0VJfZvANzZSSJeUMuF0Bxg8wfo9w1jXMkbWMGF7oMMk=;
        b=ctlCu9IP19meB53kt7X0fjSGnjRaxaB+tr7K2U22IggMxGtXuuU3G/IOhQk58HLjNn
         lJ7fXfNthdMpmbCgjRZ1tWSbf+3Tzfrus/XOybdTo7u81Hy+FWfRmaxZyfkj4t7lWeXv
         OalKwCmwP3Y2UBgqLUrP01Xk+c5Gg6ngiYzWwT9GbdK9wIJGGBlVgX60NFUiVUxEzzwc
         kFAV7z8FZQg8coaq6IH/tcOKbvh23gUxCNCKu0OTnInF3oAClNqOieiSXlVZlfDAW18e
         m3MY+ASAxDoZg1iJ/yiCHByq51a85StqT+0SadPdnm55xUdFOX1W2HUV/1D/kkpNvDz8
         TevA==
X-Gm-Message-State: ACrzQf0iF/RCkgKSOZGqndN+6zRAKZWt4Cqsm4zAxbCTKhndEle75KXu
	9kwEzX7m6v1+IF2CeokZRYCa/TGbc4QvPGfwxTotWA==
X-Google-Smtp-Source: AMsMyM57m/gTM4FXoXHWW8JhWcxwAvnJ7+QZw08tKnD2ELBC87aTVl3IiilpZvbf4XnjE5yqDfpwW9WdeuSfTrdIvn4=
X-Received: by 2002:a05:6402:448:b0:45c:8de5:4fc with SMTP id
 p8-20020a056402044800b0045c8de504fcmr9328128edw.133.1665996953352; Mon, 17
 Oct 2022 01:55:53 -0700 (PDT)
MIME-Version: 1.0
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com> <20221010201453.77401-6-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20221010201453.77401-6-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 17 Oct 2022 10:55:41 +0200
Message-ID: <CACRpkdZC+7SoXqODurpamufCWQ574=X0mA26YApe_-a_ZjA-hw@mail.gmail.com>
Subject: Re: [PATCH v2 05/36] pinctrl: aspeed: Add missed header(s)
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
X-CRM114-CacheID: sfid-20221017_015556_101254_4C9F15E6 
X-CRM114-Status: UNSURE (   9.34  )
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

Patch applied.

Yours,
Linus Walleij

