Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB5C1C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Dec 2021 10:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sBwkE41ernumCP1zj3Ac13FjBhuIaAKK6lj/gPCEGqY=; b=cto1XEF9CMLk9I
	hfY5mrJBQQkSClECr9tyYEGlrJR77ptGu5xXyFq6ePSXeanGOLRes7tXpldKlCPAjhPGiGohfxBAp
	FrVcpohyOxSgyMru6bz8mxikqT2KyGspgplzrZUDtrRxApb94piOSqDOoFLpBEEmpQic7cTE5zuoz
	QaycmzQMM7rQkXlCJ77jA9BkjsMXzLm/82/Z3JLm16t8TVQPvW8ki5M8YVw/tkYPE8YfGBtIsO/Jt
	KuAbPeei7JWVAiQKCqFmlwzMRAE8ojt2yqNEOFNLzSTGtD+98BHW69lZHnZ6Ghqh6kt2JO8aScyjl
	DWMHujZaOLC6TTUS7aRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxRWm-000Axk-Hh; Wed, 15 Dec 2021 10:28:52 +0000
Received: from mail-ua1-f52.google.com ([209.85.222.52])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxRWj-000Awe-7P; Wed, 15 Dec 2021 10:28:50 +0000
Received: by mail-ua1-f52.google.com with SMTP id u40so6890075uad.1;
 Wed, 15 Dec 2021 02:28:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6KatagByVh+i+7U2cQTugmti3xcd82C2QfCSX1Fy8Jo=;
 b=TO9MC3EKtjdXs6dXCXKHAcy/XM4PedEA2loS0nLTCV6CigtFGCKb8uwRO3HTSHJxiM
 Lv6WKGY8N1VimqgmWQZ/97oUI/jw8tHAGMmO7yw2mjCdRJLlrQo5JnG2g4XLGr+5WYUr
 954KJwmqj4FvcXL1uqyVNHAF7A/gVt3gpnB0vc9oyJt4B176PMwcQiRrXti0WjTrMABs
 b51FY0cX549hcLmTpPwRKtcM2BFnV2ox0VI2i+mre394rWQ7Iw9kUBM3meUCH5mhKqyO
 ESryiKTWy3I54EWY4/tfUAavR2NOGL7lijxQAAjFNm+y8HEerWBqm/8e4L6HGqcryloc
 Z6pg==
X-Gm-Message-State: AOAM530xlZa0nUB+1j/EIFqxpwYNsMl0CsH/LDgXtYa2oQo7HNJlzdlv
 ToJRDLcBIvhjB4MhoP0QK4M1SgBeSo7ZiA==
X-Google-Smtp-Source: ABdhPJz53r2CNl0i+8dLDWzVHs/t8XYZv50jif0T8CHseUOD9vFFEKH5TQwgJmwc6cMkzBsFS2ftGw==
X-Received: by 2002:ab0:3301:: with SMTP id r1mr9110448uao.96.1639564127181;
 Wed, 15 Dec 2021 02:28:47 -0800 (PST)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com.
 [209.85.221.170])
 by smtp.gmail.com with ESMTPSA id u145sm305035vsu.25.2021.12.15.02.28.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 02:28:46 -0800 (PST)
Received: by mail-vk1-f170.google.com with SMTP id s17so14339221vka.5;
 Wed, 15 Dec 2021 02:28:45 -0800 (PST)
X-Received: by 2002:a05:6122:920:: with SMTP id
 j32mr2889520vka.20.1639564125403; 
 Wed, 15 Dec 2021 02:28:45 -0800 (PST)
MIME-Version: 1.0
References: <20211213163929.7509-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20211213163929.7509-1-andriy.shevchenko@linux.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Dec 2021 11:28:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW_CKcXwOSUAbCreHVM62E35yjiCfpXC_wM0zK-V43CnA@mail.gmail.com>
Message-ID: <CAMuHMdW_CKcXwOSUAbCreHVM62E35yjiCfpXC_wM0zK-V43CnA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] pinctrl: Get rid of duplicate of_node assignment
 in the drivers
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Marc Zyngier <maz@kernel.org>, 
 Sam Shih <sam.shih@mediatek.com>, Zhiyong Tao <zhiyong.tao@mediatek.com>, 
 Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@microchip.com>, 
 Radim Pavlik <radim.pavlik@tbs-biometrics.com>, 
 Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>, 
 Colin Foster <colin.foster@in-advantage.com>,
 Douglas Anderson <dianders@chromium.org>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Herve Codina <herve.codina@bootlin.com>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-actions@lists.infradead.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, 
 linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>,
 - <patches@opensource.cirrus.com>, 
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 linux-mediatek@lists.infradead.org, 
 linux-oxnas@groups.io, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Manivannan Sadhasivam <mani@kernel.org>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>, 
 Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, Sean Wang <sean.wang@kernel.org>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Support Opensource <support.opensource@diasemi.com>,
 Baruch Siach <baruch@tkos.co.il>, 
 Neil Armstrong <narmstrong@baylibre.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Andy Gross <agross@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Viresh Kumar <vireshk@kernel.org>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>, arm-soc <soc@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211215_022849_289196_195E56E0 
X-CRM114-Status: GOOD (  19.54  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Dec 13, 2021 at 5:40 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> GPIO library does copy the of_node from the parent device of
> the GPIO chip, there is no need to repeat this in the individual
> drivers. Remove these assignment all at once.
>
> For the details one may look into the of_gpio_dev_init() implementation.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

>  drivers/pinctrl/renesas/pinctrl-rza2.c     | 1 -

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
