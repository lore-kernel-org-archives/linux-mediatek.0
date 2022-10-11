Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D08FBC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Oct 2022 20:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AcPVh42qVgkJBf4RM2Ey0P8OhTX4x5A+uHddaUsQ6Co=; b=i4jRy37E4nGfSalicvuYeaSz/X
	HRqX1CTc4E+P6r6SiHHr2+8Xi1I83yxfHw9ZvisDfvuUOt4C6ouhFqX9/HAH/pIsyhjPuIlcT46R7
	SOcnzqmPD0ktfZGTOjBiqVewKnZTP9d2Z1uzmGxJ9y4MXZ/ec5dnFRjWkLzXZjnQ4jSvJenQu0NMl
	3rxXEb0uqAUqfiRB6OtSATeVhveQQKxBeGMftDB6bjYiT1kAS0trRXE9Q7RDEZZ16bfOpAT5lUrDz
	9eCWHAoLopSY0LEi1nDsVmy/Df+1L2LUQQyXuAoiKc21L/7YARjWRSLFrjYwTVtOItkTiPCJGMxI/
	kjh0BdNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiMIa-005qtR-51; Tue, 11 Oct 2022 20:56:24 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiMIW-005qrR-5E; Tue, 11 Oct 2022 20:56:21 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 70so13513239pjo.4;
        Tue, 11 Oct 2022 13:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AcPVh42qVgkJBf4RM2Ey0P8OhTX4x5A+uHddaUsQ6Co=;
        b=DlfaPAoLX/0Jb1SsUAFBMfuYimfDeLB1Gs+lotFCf5wX/xRNwwaeEjZ5ki70F0YSfL
         rO7wa9sBAK38Fitsjr8wWeGaTbB17rWj/5uv6Qggo2NMYLqZ3T8nbfHPEpUJcQu2bQ5S
         2uJcOyvVHU3GCMrUVyQTjgWU857w+EEMu3KOOXzRP0sBYb9WpwXPa+bHwKfdWnDYL1IZ
         sjB2VBMKHp8LTg0LYEtI3ZlOLTHkYjnwE1T4zHOamUMrxkhqgzXrSXOnblYNQPKxo6AV
         GmstnP6z2i66RfbJJQ1IzTNkzjBUrVnp0pu77wz8fvzBSAWlB5mtP7EKE8gyxWRookcL
         WWLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AcPVh42qVgkJBf4RM2Ey0P8OhTX4x5A+uHddaUsQ6Co=;
        b=y/1Lcs6ul8QJnPV2x1rvywwulTWE9P8k5Z2alc+hnzKgtbyFZQDL1pkSgmu/AGvS1h
         jBTz65fNrGd9iFQKtOraHB8jyVUKA55+xkDuNoS4x2FzS3ik8tXEvMKms+QZHzOtwgJt
         NCM0Wz+ealmy2Ed5hq6hL078ZHYMRXMEYVrXHtFx4W3AQ4Cfgdelivlk8ZaK3bw/MGlJ
         vAjeKIWrGJValtbt1onO6Ozf55LJOq2u9oHIxOPlhlf/E1rwtLRBPb7apiSZRoyD1E4D
         TzvJfZfq8iAA06FZyJtocznz7eOMmwR8rUBOjJABL7Ad7zASiQKcSvk0cPUwbbb5Vqz9
         Q/vA==
X-Gm-Message-State: ACrzQf0fjxYenOzpb2F1mf10z5IyJnKq1U2kEe8pX2lYSXcB0l4xKKGs
	rPqkmFcH64Fl7hEvlkrG88Q=
X-Google-Smtp-Source: AMsMyM5pIEdsgeht0NOYcyruIBhuS4NISKYBTrmuG1I0+RU2v1LFNfTy+oB9jcY4eA/I6+ThSmPvTg==
X-Received: by 2002:a17:90b:1bc9:b0:20d:75b8:ee5d with SMTP id oa9-20020a17090b1bc900b0020d75b8ee5dmr1171628pjb.147.1665521776548;
        Tue, 11 Oct 2022 13:56:16 -0700 (PDT)
Received: from ?IPV6:2600:8802:b00:4a48:7467:a6d1:4211:7f63? ([2600:8802:b00:4a48:7467:a6d1:4211:7f63])
        by smtp.gmail.com with ESMTPSA id k207-20020a6284d8000000b00537eacc8fa6sm9403022pfd.40.2022.10.11.13.56.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Oct 2022 13:56:15 -0700 (PDT)
Message-ID: <0684f480-2092-d520-2c8e-bd9a2dca47e3@gmail.com>
Date: Tue, 11 Oct 2022 13:56:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [rft, PATCH v2 00/36] pinctrl: Clean up and add missed headers
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Marc Zyngier <maz@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Kent Gibson <warthog618@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Billy Tsai <billy_tsai@aspeedtech.com>, Thomas Gleixner
 <tglx@linutronix.de>, Linus Walleij <linus.walleij@linaro.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chen-Yu Tsai <wenst@chromium.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Samuel Holland <samuel@sholland.org>,
 Horatiu Vultur <horatiu.vultur@microchip.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Phil Edworthy <phil.edworthy@renesas.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Prathamesh Shete <pshete@nvidia.com>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>, linux-gpio@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-actions@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-msm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>,
 Andy Shevchenko <andy@kernel.org>, Sean Wang <sean.wang@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Chen-Yu Tsai <wens@csie.org>, Paul Cercueil <paul@crapouillou.net>,
 Damien Le Moal <damien.lemoal@wdc.com>, Tony Lindgren <tony@atomide.com>,
 Haojian Zhuang <haojian.zhuang@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Michal Simek <michal.simek@xilinx.com>, Andy Gross <agross@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Tomasz Figa <tomasz.figa@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Viresh Kumar <vireshk@kernel.org>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org,
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_135620_273293_6C659586 
X-CRM114-Status: GOOD (  12.62  )
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



On 10/10/2022 1:14 PM, Andy Shevchenko wrote:
> Currently the header inclusion inside the pinctrl headers seems more arbitrary
> than logical. This series is basically out of two parts:
> - add missed headers to the pin control drivers / users
> - clean up the headers of pin control subsystem
> 
> The idea is to have this series to be pulled after -rc1 by the GPIO and
> pin control subsystems, so all new drivers will utilize cleaned up headers
> of the pin control.
> 
> Please, review and comment.

Did you really need to split this on a per-driver basis as opposed to 
just a treewide drivers/pinctrl, drivers/media and drivers/gpiolib patch 
set?

36 patches seems needlessly high when 4 patches could have achieve the 
same outcome.
-- 
Florian

