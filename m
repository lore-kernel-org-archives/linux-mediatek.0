Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A332AC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Mar 2022 07:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:In-Reply-To:
	Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/PvKmzGg5BRI2opxM2kXN5Fywsa3jb1YandXAR30fe4=; b=etDaDk/UE2EcxNMP4g1s5hGXNK
	0ZbdwnUeiKWUZhqazva7+raEB6Gj0xQMPKjEWbe/DSZ/cIhb01oIJwed2Gzl46kpcpvxByHHjJplc
	yfNLAgxhvInAlrnbKShd0Rz9jNI6WGlIu86QqEQnYCsAHw2t/+bZmmVSPblgXxX2w12viNajoLTWl
	QMkUmcxp4i7ULEIqJvhF2CN7fdtwJwCBJIla+e0oFU8q32naEZMVVDc9mHC9qPiTHS6SzWDgwKp6l
	/x1Ve/j4nZ791KJ4ysQuzXszOiZD3T1DA8Y+xkwuvFdHRAVXTW4v/fqQxAFLZAwkZbOt7yQT50Gc4
	hS9QeA/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYkG3-007hPc-3L; Mon, 28 Mar 2022 07:57:47 +0000
Received: from xavier.telenet-ops.be ([2a02:1800:120:4::f00:14])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYkFo-007hIA-DJ
 for linux-mediatek@lists.infradead.org; Mon, 28 Mar 2022 07:57:34 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:e89f:bbc:3ef3:db3f])
 by xavier.telenet-ops.be with bizsmtp
 id Bjx82700v1mfJzQ01jx8mS; Mon, 28 Mar 2022 09:57:26 +0200
Received: from geert (helo=localhost)
 by ramsan.of.borg with local-esmtp (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nYkFQ-0074P3-Bn; Mon, 28 Mar 2022 09:57:08 +0200
Date: Mon, 28 Mar 2022 09:57:08 +0200 (CEST)
From: Geert Uytterhoeven <geert@linux-m68k.org>
X-X-Sender: geert@ramsan.of.borg
To: Ansuel Smith <ansuelsmth@gmail.com>
cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-actions@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-omap@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@axis.com, 
 linux-aspeed@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org, 
 chrome-platform@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, kernel@dh-electronics.com, 
 linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org, 
 linux-tegra@vger.kernel.org, linux-oxnas@groups.io, 
 linux-arm-msm@vger.kernel.org, linux-unisoc@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-realtek-soc@lists.infradead.org
Subject: Re: [PATCH RFC 1/1] ARM/arm64: categorize dts in arm dir and fix
 dependency in arm64
In-Reply-To: <20220328000915.15041-2-ansuelsmth@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2203280956080.1685195@ramsan.of.borg>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <20220328000915.15041-2-ansuelsmth@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_005732_617738_A5FEF1A7 
X-CRM114-Status: GOOD (  15.96  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

 	Hi Ansuel,

On Mon, 28 Mar 2022, Ansuel Smith wrote:
> - Categorize every dts in arm directory in subdirectory
> - Fix Makefile to address for the arm subdirectory
> - Fix any arm64 dependency
>
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm/boot/dts/renasas/Makefile

s/renasas/renesas/

The actual split for the Renesas parts LGTM.

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
