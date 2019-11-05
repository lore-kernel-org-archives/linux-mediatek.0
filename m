Return-Path: <SRS0=3chi=Y5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0CB6C5DF61
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Nov 2019 15:08:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C077C214D8
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Nov 2019 15:08:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NOtEcr9S";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IzWJ8eph"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C077C214D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=toYaWsMrb9lDFTVRbzASzGzj4tu5zGD+ksajgZ/7TzM=; b=NOtEcr9SACU3wZ
	LA6KzV90KpT6eN58lt8yfZ+6qzjGVAbi0QQLf0Q66Zt90S+2WNUNHmLCbTDdKH6z8BLBMglUXHGeR
	BGYjxYJ+CMIFmx1SZmJN93yBvC91ZiPwkY2cGtiALKJJbZeoOaW7rzTLwkvKCbhwLKCtFJvAcdOyf
	Addpogwok4b3q2fqve5d4K7jtGgVDjJERdJOz6v4CW5fxiJBq31OxUKhTuwPjhYVRkFflxrDfRvu5
	dMiwvvlx4F1zyJ1+9NnPnc1esEk9ViWdOf4g/7biuy1DnM3cLaiNzkDGBmzZJAdFD/e359ynzeC/o
	+V8YpSrjEh3x6Ib6OWmw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iS0Rp-0002mP-Fg; Tue, 05 Nov 2019 15:08:45 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iS0Rn-0002lV-7M
 for linux-mediatek@lists.infradead.org; Tue, 05 Nov 2019 15:08:44 +0000
Received: by mail-lj1-x243.google.com with SMTP id m9so22209871ljh.8
 for <linux-mediatek@lists.infradead.org>; Tue, 05 Nov 2019 07:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QVqID83DP10XiL25090Kooovcd+jO11tv2frcA+Aozo=;
 b=IzWJ8eph2aMxyPkk5igmYy1MthwwzUaNNXGjE+UmXl4Ai8USe++fFWTr0NBUQsepvF
 LuDljy6BcLt5EAcx3M+jaBI+d0v0YH+d7sqVrZQOAvnT0ZX09AJNiygpNyxOxdMIwK9L
 IPh63EBPqTpUDyn+VeQbr4TTvs0f/TCY8wMi0tbqEi/G6nLyGm+B8sQR6j94wZhVSv2Y
 1aT4qx8YL9Q0syw1LLSaEPv0h7lgfHRLVaZU1iW5/C7mFV2QWT02LHGkn1KP3/WRpFsI
 bO5d4/K1Y74cPxlotdLI6qruTOKAGs6Gf02Ck6aMvxR9mh4VkmpD1KsVZsIu2g0DA4Qj
 OdlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QVqID83DP10XiL25090Kooovcd+jO11tv2frcA+Aozo=;
 b=GaLHeuE5GVGjUl/zJedW3yLEIFYOUjaIRCQwcSrx/1ynS3l90+6djlXKlY3RTxVZWz
 NsCkZLehR1kl8yvzBVbarSlCmAwvmKGznz9DsNaVNqiWX2g4ZK+ILj5ww4B/pgOYhHIq
 66o8S0kHNAMx+qtKzxob8yoQBwBU4boOIt3AeY+Xfaeeavzj1OohSKjfBzOEQiyFbMzH
 iicOPfpJOVXWFKOR9dAHSFLq95ATZOoxV60qLT/M/BJeI0rhhAeu2kcE+So+ixHMGAm5
 Y1/Y6b/GRQxO/UjUJJA9/qa28phgzLZ8IP1TaB/0wmUMVPCZbLj5YC+RZvS+awjpqo2s
 VhKA==
X-Gm-Message-State: APjAAAWWDjD4IfYQjo6R+O6XCKaapaYh4Vcs0STUbixn8Ev6/+JTrHDm
 yby6hnMrH4uJ/U70p5yFie8GMZAwccuG2yduF5k7NA==
X-Google-Smtp-Source: APXvYqynNx7yVsamkmDQicrZYF0b3QMUV7NDAKJOqJVCjIt3Qt+Lg0xp+qeqgaKJN+sWlsoFYyEaDeJbse6mZMDwMIo=
X-Received: by 2002:a2e:9a12:: with SMTP id o18mr16057690lji.191.1572966521035; 
 Tue, 05 Nov 2019 07:08:41 -0800 (PST)
MIME-Version: 1.0
References: <20191104163834.8932-1-andrew.murray@arm.com>
 <20191104163834.8932-8-andrew.murray@arm.com>
In-Reply-To: <20191104163834.8932-8-andrew.murray@arm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 5 Nov 2019 16:08:29 +0100
Message-ID: <CACRpkdb=5i3+H3OtGXSYQEjSq5ROrysfmnG-koGck+chEEgLnQ@mail.gmail.com>
Subject: Re: [PATCH v1 7/7] dt-bindings: PCI: Use IRQ flags for legacy PCI IRQ
 interrupts
To: Andrew Murray <andrew.murray@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191105_070843_279258_39421C7D 
X-CRM114-Status: UNSURE (   8.92  )
X-CRM114-Notice: Please train this message.
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
Cc: Mark Rutland <mark.rutland@arm.com>, Heiko Stuebner <heiko@sntech.de>,
 Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
 David Daney <david.daney@cavium.com>, linux-pci <linux-pci@vger.kernel.org>,
 Shawn Lin <shawn.lin@rock-chips.com>, Binghui Wang <wangbinghui@hisilicon.com>,
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
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Richard Zhu <hongxing.zhu@nxp.com>,
 MSM <linux-arm-msm@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>,
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

Hi Andrew,

thanks for your patch!

On Mon, Nov 4, 2019 at 5:39 PM Andrew Murray <andrew.murray@arm.com> wrote:

> Replace magic numbers used to describe legacy PCI IRQ interrupts
> with #define.
>
> Signed-off-by: Andrew Murray <andrew.murray@arm.com>

When I add examples I usually make sure that above the examples
are the appropriate #include files, this is becoming more important
as we convert to yaml, then you need the right includes because the
examples will get compiled.

With that taken into account:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
