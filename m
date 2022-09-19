Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 581E0ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Sep 2022 03:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8wzd/IsQMAz4yliZb1FsJ3OfMRVNZc5tTLnz3lR7QHQ=; b=M411C2XxMzZ3KPupdWAjF/7UD+
	qpqEWUJnRQuqMUGReP9kCo8M4OyobwWMMNmJ72MjRP8I5o1G6NbrEGKbH1JjUP2PMasnLZlKHmqWr
	jwMHX0I+jRxW5Ho1e7gEVAjvSx0LKQLJK0qfAFX2/y3q0DntLSKnQEw/mJU+n6cs+vUgouwmwSE04
	u+SIctn/4cFLWk1fNSa09StwMPUBvbJZ+Dirm9OLAhosg9gtmqUAD8l8piVDxMLxOVzqndGW26CQi
	EQsoZnFReMD2mwrlFYB8MZGgiEv3XBb+SkEqHUvE4tQptZAzx7K4cb5HPHoyNr8/dnbrcFUUNqTb6
	kbHauOKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oa7iJ-006zCr-IH; Mon, 19 Sep 2022 03:44:55 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oa7i6-006yvw-LD
	for linux-mediatek@lists.infradead.org; Mon, 19 Sep 2022 03:44:47 +0000
Received: by mail-ed1-x530.google.com with SMTP id e18so39477433edj.3
        for <linux-mediatek@lists.infradead.org>; Sun, 18 Sep 2022 20:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=8wzd/IsQMAz4yliZb1FsJ3OfMRVNZc5tTLnz3lR7QHQ=;
        b=EuFCJAkszMPKPtxQSyMQ0NoboaeVB7t96eFw9rPXwH9oSHUro5o77bxEeYAtANDzyR
         I9BMOm4HMiosCb0pcsiSHEAZo2qSCtvZawUq0/zPNIdwAvDvQAPS+8+0uFrWbUJgoTtd
         ExLo8MeQP7GyQ+rW2rlFvIPPT75kqxCAKPhOGjeDjYZZFhuAOfywggSn5a+jZu6mJGBr
         cWVHHoToy9UWA6nPxBqZcAZLzmJoxjkbRc1yLhwZYNZgNQEBRnr86m6GI/e/+J8MoRAT
         suDLw8ILYZpcoPAOh+pvz4Lu/zfiYh6RXQKy+jZAxuRvjXsVxLmt63JqorCueNp9TEEJ
         9kQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=8wzd/IsQMAz4yliZb1FsJ3OfMRVNZc5tTLnz3lR7QHQ=;
        b=qQZ8+sKtb0K3G7v8qlD1Iy1CYWmUd/2vyBMbLmk1QbN4NpPFoL5rZQEvjiCxRfPGH6
         ae5WK3R8n/zxhShZWj+JzlftGFOLEsGw326vNf+ChpMhY78DFkQBqi3L4ZVes+hItf2c
         w4eBJEoSfgK0Li/J+gibZqBP8tRiAETCM1lWsXytJVlYWqeLyEB1TfPCZdJmHOWPhUO0
         Az88zu0wLTIM2MlSs+g6owBgYr+wkUwHo1BH43ASMYAZE/2fX/BdIczm02UXqimPNx4O
         kGYWe4R3H+X+JlIIV8Oj1uWHgv22eg1ZH7btXRoz0h1oPJMrwNNSzkHQ1mQDVPUA/Jin
         pI+w==
X-Gm-Message-State: ACrzQf1PeOJCYkklqQGcXBodH2wZn6wlVNt5annJHgpBkaOGsjyvRbCd
	wuu9QGU8MTitZgMJfp5yS+QJA6eXJ+u/hgG7g4TyTg==
X-Google-Smtp-Source: AMsMyM67X4fHgNHGRzRNZ0AalOVh8oZlYNRkDoycvf7zBAcHx4qOwSpxEraLAwYUCmYCoDnGs0xLR1B5pb/N312tK3I=
X-Received: by 2002:aa7:cc8a:0:b0:446:7668:2969 with SMTP id
 p10-20020aa7cc8a000000b0044676682969mr13821510edt.206.1663559079248; Sun, 18
 Sep 2022 20:44:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220701012647.2007122-1-saravanak@google.com> <YwS5J3effuHQJRZ5@kroah.com>
In-Reply-To: <YwS5J3effuHQJRZ5@kroah.com>
From: Olof Johansson <olof@lixom.net>
Date: Sun, 18 Sep 2022 20:44:27 -0700
Message-ID: <CAOesGMivJ5Q-jdeGKw32yhjmNiYctHjpEAnoMMRghYqWD2m2tw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Fix console probe delay when stdout-path isn't set
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Saravana Kannan <saravanak@google.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Laurentiu Tudor <laurentiu.tudor@nxp.com>, Jiri Slaby <jirislaby@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
	Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, 
	Nicolas Saenz Julienne <nsaenz@kernel.org>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Al Cooper <alcooperx@gmail.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Paul Cercueil <paul@crapouillou.net>, 
	Vladimir Zapolskiy <vz@mleia.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Tobias Klauser <tklauser@distanz.ch>, Russell King <linux@armlinux.org.uk>, 
	Vineet Gupta <vgupta@kernel.org>, Richard Genoud <richard.genoud@gmail.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, Alexander Shiyan <shc_work@mail.ru>, 
	Baruch Siach <baruch@tkos.co.il>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Karol Gugala <kgugala@antmicro.com>, Mateusz Holenko <mholenko@antmicro.com>, 
	Gabriel Somlo <gsomlo@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Taichi Sugaya <sugaya.taichi@socionext.com>, Takao Orito <orito.takao@socionext.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <bjorn.andersson@linaro.org>, Pali Rohar <pali@kernel.org>, 
	Andreas Farber <afaerber@suse.de>, Manivannan Sadhasivam <mani@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Laxman Dewangan <ldewangan@nvidia.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang7@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, "David S. Miller" <davem@davemloft.net>, 
	Hammer Hsieh <hammerh0314@gmail.com>, Peter Korsgaard <jacmet@sunsite.dk>, Timur Tabi <timur@kernel.org>, 
	Michal Simek <michal.simek@xilinx.com>, Rob Herring <robh@kernel.org>, 
	sascha hauer <sha@pengutronix.de>, peng fan <peng.fan@nxp.com>, kevin hilman <khilman@kernel.org>, 
	ulf hansson <ulf.hansson@linaro.org>, len brown <len.brown@intel.com>, 
	pavel machek <pavel@ucw.cz>, joerg roedel <joro@8bytes.org>, will deacon <will@kernel.org>, 
	andrew lunn <andrew@lunn.ch>, heiner kallweit <hkallweit1@gmail.com>, 
	eric dumazet <edumazet@google.com>, jakub kicinski <kuba@kernel.org>, paolo abeni <pabeni@redhat.com>, 
	linus walleij <linus.walleij@linaro.org>, hideaki yoshifuji <yoshfuji@linux-ipv6.org>, 
	david ahern <dsahern@kernel.org>, kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, iommu@lists.linux-foundation.org, 
	netdev@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-serial@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-rpi-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org, 
	linux-unisoc@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220918_204442_807991_71075D9D 
X-CRM114-Status: GOOD (  20.97  )
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

On Tue, Aug 23, 2022 at 8:37 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Jun 30, 2022 at 06:26:38PM -0700, Saravana Kannan wrote:
> > These patches are on top of driver-core-next.
> >
> > Even if stdout-path isn't set in DT, this patch should take console
> > probe times back to how they were before the deferred_probe_timeout
> > clean up series[1].
>
> Now dropped from my queue due to lack of a response to other reviewer's
> questions.

What happened to this patch? I have a 10 second timeout on console
probe on my SiFive Unmatched, and I don't see this flag being set for
the serial driver. In fact, I don't see it anywhere in-tree. I can't
seem to locate another patchset from Saravana around this though, so
I'm not sure where to look for a missing piece for the sifive serial
driver.

This is the second boot time regression (this one not fatal, unlike
the Layerscape PCIe one) from the fw_devlink patchset.

Greg, can you revert the whole set for 6.0, please? It's obviously
nowhere near tested enough to go in and I expect we'll see a bunch of
-stable fixups due to this if we let it remain in.

This seems to be one of the worst releases I've encountered in recent
years on my hardware here due to this patchset. :-(


-Olof

