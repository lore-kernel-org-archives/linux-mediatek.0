Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E871C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Oct 2022 07:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jtn0EbueANzZWmHhe026bL4j5UVXLCdEUZ6RI8X4Iek=; b=AWk2GxrXFxBkO02M9Xp2R/IWh1
	mWTgvdZVuQrsQy4WHlX6FNoGUj2qyU38WvfmehsjwaXn8HBZGw+Y42hUKhx51eLhuZQ53xuIunXUa
	Dt83Ic5N02W1XFIu6l2tAq9tYENjx986dSsuJfU0w4Sc7lkuY6A+mx7TzcD9UUcgmNaEz3YfKlo+j
	kM+FhVFfzosJDgtYwwgbvQ09H/aN68XaTs3yRmn01nVC7oCZlAQHhD4S+WfUMyoun/aAFa6fN5NoT
	zKpd9DPrOmbj+oharm8oJJ46Q3BD5Vb9atMuAyof7vrp/1SnrYH5gbndlO343hOPWueabrJExiHZ4
	39g+bM7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiAAJ-003eE1-4I; Tue, 11 Oct 2022 07:59:03 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiAAF-003eC5-Mp; Tue, 11 Oct 2022 07:59:01 +0000
Received: by mail-qk1-x734.google.com with SMTP id m6so2920697qkm.4;
        Tue, 11 Oct 2022 00:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jtn0EbueANzZWmHhe026bL4j5UVXLCdEUZ6RI8X4Iek=;
        b=aFDkaZ06eZIgNFDxYionyNjY54l3Jb8vc7xn8wqjYQg1G9prm3n/2iXgEXWGBySUYj
         pUlP9IplzOTLfdLVRJz2t64MEmWecbibwULcfH1pwRAhbzCUT0Qx8U3TYW66eGI4q6/c
         sBvA0JvIhzc4RrdJL1sC9mPLjvy5VKqBEtTknHO0sMPYsfXsHYgIFaeCifqn0QnJJCl8
         OtBD3hPGMvPap0eZdfXpScnJLFNtPJhYwQFzne+QiOxyRp0IMpjBBfzOvlF4jI3+xG4z
         TUQ5g3ho7KFLZehSEHD2JDhbDLF2SiZoJYtH+PqXJlhKnSGV+QNcPoRddxhrYbCrFF/w
         G1aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jtn0EbueANzZWmHhe026bL4j5UVXLCdEUZ6RI8X4Iek=;
        b=V/ZYWet+/IuJlRFccenY+2cEaI5Mv0cjkGHFcsHI3Axc+b6kSuK9VbBeTTbcWdebx3
         MrC/+JTDGsTmZXvLw9Uq8SieG0jHodhonU3s8tK8yTyNJUhn7mW7CNAxbGaLw4RxT8N7
         18HpReduDCqmHpGcyCwOBlq63I89+JVRM/gfDotTyqff8AKQuOxp1VaMo7E9XYHLWNNx
         nB8YkRZIFkO3xTI1DE3H9yJ48Pkh/CyLp1YcNMdNCKInvq/SrlUamhznPGnujHMQ9kkz
         Bl1VQy7iXkSbKe6oZJhdQgAmGt2+JdvPpcnmJfVYVZAY/34KdEVeb4VKWMz5ybJhQylL
         EJ4Q==
X-Gm-Message-State: ACrzQf2ZaiaCJ3wYLMdMWy2rp83qUQDoYq+STb6uwS/kaRTmUB8XOawK
	jjK/rrPNks38u2+BpkY50kV3tO+iaebVZSpd3q8=
X-Google-Smtp-Source: AMsMyM58o2OPTuU9XUs+E07S0aK+hkv1wCI8/ogPlxh2cys3d+2tzM6MqnusgKv+Ub7ymEh97egvoHmX2MHd+yvD55U=
X-Received: by 2002:a05:620a:d58:b0:6df:ba25:4f5e with SMTP id
 o24-20020a05620a0d5800b006dfba254f5emr15325513qkl.320.1665475135994; Tue, 11
 Oct 2022 00:58:55 -0700 (PDT)
MIME-Version: 1.0
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
 <20221010201453.77401-13-andriy.shevchenko@linux.intel.com> <4630d457-2d3b-6f66-7be5-54c84bdf80b4@wdc.com>
In-Reply-To: <4630d457-2d3b-6f66-7be5-54c84bdf80b4@wdc.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 11 Oct 2022 10:58:19 +0300
Message-ID: <CAHp75VcghxT6nS1kLjYbj5N3EBj2CukJ3zGKvFSb-Z1paj3-ZQ@mail.gmail.com>
Subject: Re: [PATCH v2 12/36] pinctrl: k210: Add missed header(s)
To: Damien Le Moal <Damien.LeMoal@wdc.com>
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
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"linux-actions@lists.infradead.org" <linux-actions@lists.infradead.org>, 
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, 
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, 
	"linux-rpi-kernel@lists.infradead.org" <linux-rpi-kernel@lists.infradead.org>, 
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, 
	"patches@opensource.cirrus.com" <patches@opensource.cirrus.com>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>, 
	"linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, 
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, 
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
	Paul Cercueil <paul@crapouillou.net>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Michal Simek <michal.simek@xilinx.com>, 
	Andy Gross <agross@kernel.org>, Konrad Dybcio <konrad.dybcio@somainline.org>, 
	Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Viresh Kumar <vireshk@kernel.org>, 
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>, "soc@kernel.org" <soc@kernel.org>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_005859_789572_3A825AD3 
X-CRM114-Status: GOOD (  13.72  )
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

On Tue, Oct 11, 2022 at 1:33 AM Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
> On 2022/10/11 5:15, Andy Shevchenko wrote:
> > Do not imply that some of the generic headers may be always included.
> > Instead, include explicitly what we are direct user of.
> >
> > While at it, sort headers alphabetically.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> Looks OK to me, but the patch title should be:
>
> pinctrl: k210: Add missing header(s)
>
> Same remark for the entire series. You need s/missed/missing in all patch titles.

Oh, the missing word 'missing' :-) I will replace it locally (I won't
resend it because of that).

> With that fixed,
>
> Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

Thanks!

-- 
With Best Regards,
Andy Shevchenko

