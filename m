Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A81BC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Oct 2022 10:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R2uNoWDHy+GOry29L6DC1dXWZKJOzJDC9JxozJVSpGE=; b=II389yDCdLYRBD9S9BAmLt7fd4
	toIO5KQvOqnVSESYZS77gkC/ahQDZhL4Guw4iNjfGFneV66fJgmWC/X4QNPno5MAf+dOR4F2ElJU1
	W5F1MCXMq3ZO4JN6P2VuMhgycuJuYpq5AK/9TYXVDFmaQ+XRPoRCNK9lxlKQify60bSszPjXJ9nQY
	qEDz4SQno5sXPhFrtc8y6ju3JR6gOYgCARXAcl/Z9Xp+5wKrE2PrX7bg1joHt9avZqlIsjQPuv3Jb
	LZUw7nlBrVSXPuV6SKG0q0QQ+QXFLvW3RkppuRgs+1IbfGtL3slX409bq/NbCbCV9tehyXZLR1fd6
	gX7jDOqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiYbd-007aKg-P6; Wed, 12 Oct 2022 10:04:53 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiYbY-007aIs-UY; Wed, 12 Oct 2022 10:04:50 +0000
Received: by mail-qt1-x835.google.com with SMTP id a24so2295946qto.10;
        Wed, 12 Oct 2022 03:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R2uNoWDHy+GOry29L6DC1dXWZKJOzJDC9JxozJVSpGE=;
        b=ZuAn0riuXHel9rEBKRhDJaphdwknBUsVfuUv/T2PqZwW+uHUs0jQAoNTggSP2xYvxV
         AIPBHcfBEeKUY8XaTwBfDZ4rSHoMsN+0EmQWS+Q65k7ex3GR3DSFMtYWLj5CjjdFW5lS
         H15Im9ztaYgi/pdTI+XTH4+61vil18OUHSI0xGSAcGYNKUvzy6F36vXqiFhOKG65c2tn
         Hm9UqrwXHcz71mbsaS1jF9iuBu0ckjr5DhBRLVoVyj42mBo6ELsboWfCQHWyRGQ4tlaj
         QaFlpQ5WtgjVo1xKNFF2bpP4chzh3RulgtzO05YqhYqIONKukzB/OS4NwSuMzh0mSuvU
         pMLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R2uNoWDHy+GOry29L6DC1dXWZKJOzJDC9JxozJVSpGE=;
        b=50/L+Ep9PBDhDCTmNjq6h40euE0ztxaaIkTYKxQMUrUQk+8g95T2Qohi3cXRMpP55U
         Mg1BpRDi08HU5nIsleAluS1a6vp7ZUso3dS1ouUxwDT33eE9sJ41ZIzMNnBZJp/eZW8N
         e0lHkrutvXt/5xofqvHMXq0K6i8eGps6h9SgICnrbal63UF0ye2zcpV3Q7GAvZoG5qAZ
         Wnpms4TwHJa3rmJ75bn4FwMAK1PlikTCFQn+y5ParVBDNi3SE+vaZTU5b9rJ2/pqDRCB
         eY5S8QugjvFzo7zir+nr5UCwOfc6WmYUegR7nTI9Rld0HuDO138a2kU6mapsfBdhcaBg
         p5cA==
X-Gm-Message-State: ACrzQf3lpG1iSLkjgZanSij2QnKUQyipJOpcEUbWR/UpE/MiHP19Jogb
	V1icaeBPSZNqxfvFwK34ZF8h/ON9MD88DQSX5q8=
X-Google-Smtp-Source: AMsMyM5ie8LeIoK7BaYP5eKG5FZkx73UfHVDBrIIwi+8uhHlPAnlyvjeeFl/0Iy9XueA0qyfGOPRZ2XY3nQxTptpumo=
X-Received: by 2002:ac8:7c43:0:b0:35c:cd8f:3da5 with SMTP id
 o3-20020ac87c43000000b0035ccd8f3da5mr23132665qtv.61.1665569086451; Wed, 12
 Oct 2022 03:04:46 -0700 (PDT)
MIME-Version: 1.0
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com> <0684f480-2092-d520-2c8e-bd9a2dca47e3@gmail.com>
In-Reply-To: <0684f480-2092-d520-2c8e-bd9a2dca47e3@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 12 Oct 2022 13:04:10 +0300
Message-ID: <CAHp75VdDjyUAZBTaoPOe5oA3f_5xRznAooq08=Eff4F1AZyVOQ@mail.gmail.com>
Subject: Re: [rft, PATCH v2 00/36] pinctrl: Clean up and add missed headers
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Marc Zyngier <maz@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Billy Tsai <billy_tsai@aspeedtech.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Linus Walleij <linus.walleij@linaro.org>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, 
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
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
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
X-CRM114-CacheID: sfid-20221012_030449_045446_062D57D9 
X-CRM114-Status: GOOD (  17.15  )
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

On Tue, Oct 11, 2022 at 11:56 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
> On 10/10/2022 1:14 PM, Andy Shevchenko wrote:
> > Currently the header inclusion inside the pinctrl headers seems more arbitrary
> > than logical. This series is basically out of two parts:
> > - add missed headers to the pin control drivers / users
> > - clean up the headers of pin control subsystem
> >
> > The idea is to have this series to be pulled after -rc1 by the GPIO and
> > pin control subsystems, so all new drivers will utilize cleaned up headers
> > of the pin control.
> >
> > Please, review and comment.
>
> Did you really need to split this on a per-driver basis as opposed to
> just a treewide drivers/pinctrl, drivers/media and drivers/gpiolib patch
> set?
>
> 36 patches seems needlessly high when 4 patches could have achieve the
> same outcome.

I can combine them if maintainers ask for that, nevertheless for Intel
pin control and GPIO drivers, which I care more about, I would like to
leave as separate changes (easy to see in history what was done).


-- 
With Best Regards,
Andy Shevchenko

