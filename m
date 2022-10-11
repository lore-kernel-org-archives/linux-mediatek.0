Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D8E7C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Oct 2022 00:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HDvDPLCLAPPvF5TVvL+FWbJtEqmbYVODvwDkJg3SqIo=; b=ZxcG/vFaud6h0DRCXZvrtNqFKy
	YIHXdpHz+SnFeoXH9xgH8octNQ3QpzGpU415eI6O6olu2JQcnO9ZqO0LoiO2YgsRzHMwiZblz3o+B
	+8i0U831Snyv8unFu+GkaRuYlMXuK0diofaHfw3qOPPHtDCQYNCR+sA1eePzw4+i5K6JGNLqAG9I4
	Bz8tug0qb5ldh02ZAY68tZZw+aZMp30RBqiEfZwBkoGknb3PIUobbB21T8Ff7SxhW5RtilhoEYIbp
	iEOVdeg3wKPfDGWVsjRaPSIpUutfmgrY73Fr3zbz4P4xH8kunfYhCisp8hwctRcNMpqhl1rpukw/4
	Ud3Jf+YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oi2il-002g5e-4s; Tue, 11 Oct 2022 00:02:07 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oi2ih-002g44-1f; Tue, 11 Oct 2022 00:02:04 +0000
Received: by mail-pf1-x42e.google.com with SMTP id g28so12039933pfk.8;
        Mon, 10 Oct 2022 17:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HDvDPLCLAPPvF5TVvL+FWbJtEqmbYVODvwDkJg3SqIo=;
        b=BMj8f33/fyuY4YUgfzIsC8MB079NtlG/lc5y1lSPpCGAsz+jvSYZCTpuRzKVZGf2GY
         nZi6ZRgOudbzROz6pHhHElsWmoKQQy847SVQHPP6Lzs+V2eA/brEnXLuDstKnq7MW7Ih
         TzHZfV7XKs3PD0GAaAkJAXCvXBlxf5lB+KS3lhnFICm9Tq4yaQhhQQax921FRXOWW/if
         /toe/pDvQON4HdgY5CGmbYgif/tTyjDjkjRdKQFAulnURnCwp8NMFdEBa3NYmPI0A+fB
         fhamlfjudZxMTaB+1mSMxDuObe1ocZe7cQbErJKQBTAEur2a0QkUbRoT5VJEglEdMX1y
         d2HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HDvDPLCLAPPvF5TVvL+FWbJtEqmbYVODvwDkJg3SqIo=;
        b=DONS1knPqoifxZtB+wVfgQujlLdjtOqwX/R38EvY0jBimsRrkgQc96ytHbOqa3zceZ
         b4RBeT6y8aBL1WLjsHNE7H4bEe/3Ub5xnF4pFtxaf8uGAVkHEFGnXl1E+lYbweCUCNA4
         3nso93NwstKJJaYmqoKxqiXFEq7D9nXzQA7xFMS1CKgAq1wUkfSCTe065CelCP4ImrcF
         i1fzgz4RBquDUgSO3wa1fW4LPQQ6xsn4CRf8uN8mlX4cMWsXbxDz4thO9YzR2VmCbDtR
         OFbWqDtEj1Ecan0zVtxgrl45sFCYaHMZMJMhRnYUAYl39C1B7R6I13W1pKrdYncYVKDv
         vlqw==
X-Gm-Message-State: ACrzQf1/DPyf/UOoW7nVRBtPpsPGNbEAhl6Wz+heq5TAxXFfbx7Wgbq3
	Ky/3bmNrmTHg9QDxXB2AE9k=
X-Google-Smtp-Source: AMsMyM7Y6pAnL5W1EJS9G7oSUu8S6FVrr9k2c5r6QKOELR9o0pNGH3yk7s3YJUqb5vMyZxDtzUjxCg==
X-Received: by 2002:a63:4949:0:b0:442:b733:2fae with SMTP id y9-20020a634949000000b00442b7332faemr18227721pgk.424.1665446520354;
        Mon, 10 Oct 2022 17:02:00 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id v29-20020aa799dd000000b0056258a3606csm7454081pfi.215.2022.10.10.17.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Oct 2022 17:01:59 -0700 (PDT)
Date: Tue, 11 Oct 2022 08:01:27 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Marc Zyngier <maz@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Samuel Holland <samuel@sholland.org>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Phil Edworthy <phil.edworthy@renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Fabien Dessenne <fabien.dessenne@foss.st.com>,
	Prathamesh Shete <pshete@nvidia.com>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org, linux-actions@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
	linux-rpi-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, linux-mediatek@lists.infradead.org,
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	NXP Linux Team <linux-imx@nxp.com>,
	Andy Shevchenko <andy@kernel.org>, Sean Wang <sean.wang@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Chen-Yu Tsai <wens@csie.org>, Paul Cercueil <paul@crapouillou.net>,
	Damien Le Moal <damien.lemoal@wdc.com>,
	Tony Lindgren <tony@atomide.com>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Michal Simek <michal.simek@xilinx.com>,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>
Subject: Re: [PATCH v2 02/36] gpiolib: cdev: Add missed header(s)
Message-ID: <Y0SyVwjDl7NGfTPn@sol>
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
 <20221010201453.77401-3-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221010201453.77401-3-andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221010_170203_114665_8A452A2F 
X-CRM114-Status: GOOD (  16.82  )
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

On Mon, Oct 10, 2022 at 11:14:18PM +0300, Andy Shevchenko wrote:
> Do not imply that some of the generic headers may be always included.
> Instead, include explicitly what we are direct user of.
> 
> While at it, sort headers alphabetically.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/gpiolib-cdev.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
> index f8041d4898d1..60a60e2d60c5 100644
> --- a/drivers/gpio/gpiolib-cdev.c
> +++ b/drivers/gpio/gpiolib-cdev.c
> @@ -10,8 +10,9 @@
>  #include <linux/device.h>
>  #include <linux/err.h>
>  #include <linux/file.h>
> -#include <linux/gpio.h>
>  #include <linux/gpio/driver.h>
> +#include <linux/gpio.h>
> +#include <linux/hte.h>

Ok with the hte re-order.

But moving the gpio subsystem header after the gpio/driver is not
alphabetical ('.' precedes '/') and it read better and made more sense
to me the way it was.

>  #include <linux/interrupt.h>
>  #include <linux/irqreturn.h>
>  #include <linux/kernel.h>
> @@ -20,11 +21,12 @@
>  #include <linux/mutex.h>
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/poll.h>
> +#include <linux/seq_file.h>

I wasn't aware that we use anything from seq_file.
What am I missing?

Cheers,
Kent.

>  #include <linux/spinlock.h>
>  #include <linux/timekeeping.h>
>  #include <linux/uaccess.h>
>  #include <linux/workqueue.h>
> -#include <linux/hte.h>
> +
>  #include <uapi/linux/gpio.h>
>  
>  #include "gpiolib.h"
> -- 
> 2.35.1
> 

