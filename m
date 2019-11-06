Return-Path: <SRS0=ljL/=Y6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E066FC6194
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Nov 2019 23:47:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06E00217F4
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Nov 2019 23:47:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mrBrvXmQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06E00217F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gBLhu7pFrq4tnlgaLHSIGy9Gp6m0BZIRRMWhYHUZjeI=; b=mrBrvXmQb3onMJ
	DiGeFgAtedNYjS2X7ntuCrsk6cla9DtuYThf24SY9KG2vLsB+FiJ7QEXE9sgx4YoU6lBp+4olJPoE
	wre5A7pTpNxrgDxbKpitmNaB/C5Z/Z2NrQO2kFyW16jbZJDRKFCgdCOC+NuvDB6vQ8R/IYnF+Hdnp
	i5neRvMUrmZNucZem0kT85kjdwZYwSApH7Spv05qYv8HPE1kY91sB7kEAs5us4sudsz+arloKSJ4g
	e2L3f6aXTb/EJ4NFFDxLdc0NuvakrK6c/faOmrBdvVgLlPPy2kvi5wiVc8lLt4g+k2Lj13qAk4F6o
	6VQsWeWdMFdy3QMiTKJw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSV1P-0002Ms-5f; Wed, 06 Nov 2019 23:47:31 +0000
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSV1G-0002Em-N6; Wed, 06 Nov 2019 23:47:23 +0000
Received: by mail-ot1-f66.google.com with SMTP id z6so396936otb.2;
 Wed, 06 Nov 2019 15:47:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=OhvMwzjLJJk+Opkedo2FzZT49wBAToYYlbi+l98niDU=;
 b=IJMtLOTWAejtY6qY5B/iVHADw2VGNmjWsvRBvwP7MJjciGys5RSb7AFDvbNoQoiOth
 Gis1rFGJqPbQY/W+Zwz5roWuI1BHtwY70w8aGtgGoV/hUcwCFHKfEpDbu/stYyBEHZL9
 zNVCcxulJS34nmRtmWKj5zik9kPh278JXsEFRlyS/v+GrYlz8JQNmXDtbi1JL7jMXESp
 6lKvCiPcffBAuFJ5fpeGgtIgxBOGr8V+HLaGygrEu15hZ0eStEwbiVKDC1aad4JW/V7f
 IgkpYTwYQpqvaQyHQxcQGLu8VJj/V02CoiLNnriH5V3dGyRKjgAxQxP/DbqmlW3rzkjP
 APZQ==
X-Gm-Message-State: APjAAAV0I9BFPa51Ud0JQ+lZz0ExRb5ZSELbOp96Fv3yYgVnN8A+5GDh
 0biaT9XgI63MiOWMUtAFKA==
X-Google-Smtp-Source: APXvYqwXXl9PdvHuNaY2+1epy0scUXC1o7/ARTIzt7q0aSxaAky+4OlJjSZj4YK0CDFyaIUB6lOHYg==
X-Received: by 2002:a9d:7642:: with SMTP id o2mr355916otl.66.1573084041390;
 Wed, 06 Nov 2019 15:47:21 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id r14sm87057oij.6.2019.11.06.15.47.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2019 15:47:20 -0800 (PST)
Date: Wed, 6 Nov 2019 17:47:19 -0600
From: Rob Herring <robh@kernel.org>
To: Andrew Murray <andrew.murray@arm.com>
Subject: Re: [PATCH v1 7/7] dt-bindings: PCI: Use IRQ flags for legacy PCI
 IRQ interrupts
Message-ID: <20191106234719.GA23983@bogus>
References: <20191104163834.8932-1-andrew.murray@arm.com>
 <20191104163834.8932-8-andrew.murray@arm.com>
 <CACRpkdb=5i3+H3OtGXSYQEjSq5ROrysfmnG-koGck+chEEgLnQ@mail.gmail.com>
 <20191105151622.GN9723@e119886-lin.cambridge.arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191105151622.GN9723@e119886-lin.cambridge.arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191106_154722_754108_411D6000 
X-CRM114-Status: GOOD (  16.27  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Heiko Stuebner <heiko@sntech.de>,
 Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
 David Daney <david.daney@cavium.com>, linux-pci <linux-pci@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Binghui Wang <wangbinghui@hisilicon.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jonathan Chocron <jonnyc@amazon.com>, Toan Le <toan@os.amperecomputing.com>,
 Will Deacon <will@kernel.org>, Jesper Nilsson <jesper.nilsson@axis.com>,
 Ryder Lee <ryder.lee@mediatek.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Fabio Estevam <festevam@gmail.com>, Tom Joseph <tjoseph@cadence.com>,
 linux-arm-kernel@axis.com, Kishon Vijay Abraham I <kishon@ti.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Andy Gross <agross@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, Xiaowei Song <songxiaowei@hisilicon.com>,
 Shawn Lin <shawn.lin@rock-chips.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Richard Zhu <hongxing.zhu@nxp.com>,
 MSM <linux-arm-msm@vger.kernel.org>, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Linux-OMAP <linux-omap@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, rfi@lists.rocketboards.org,
 Zhou Wang <wangzhou1@hisilicon.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Ley Foon Tan <lftan@altera.com>, Shawn Guo <shawnguo@kernel.org>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Nov 05, 2019 at 03:16:23PM +0000, Andrew Murray wrote:
> On Tue, Nov 05, 2019 at 04:08:29PM +0100, Linus Walleij wrote:
> > Hi Andrew,
> > 
> > thanks for your patch!
> 
> Thanks for the review.
> 
> > 
> > On Mon, Nov 4, 2019 at 5:39 PM Andrew Murray <andrew.murray@arm.com> wrote:
> > 
> > > Replace magic numbers used to describe legacy PCI IRQ interrupts
> > > with #define.
> > >
> > > Signed-off-by: Andrew Murray <andrew.murray@arm.com>
> > 
> > When I add examples I usually make sure that above the examples
> > are the appropriate #include files, this is becoming more important
> > as we convert to yaml, then you need the right includes because the
> > examples will get compiled.
> 
> OK thanks - I can see other files in Documentation that take this approach
> I'll update this patch on my respin.

FYI, It's been on my todo to add common includes like irq.h and gpio.h 
to the example template used to compile the examples, so everyone 
doesn't have to add them.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
