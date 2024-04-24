Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF02AC4345F
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Apr 2024 19:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=laQLXPxaXY0Fuw9VQ1f+p8Q1ts8OW8v8cl0aB0gDyqc=; b=17YMRoWp881Jkl/FAQCPOQUQBR
	CCtzMBcx1wOK6UhJR5bfnmvdCqaXTpE+vgXqRo1Oplz+z/pcytu5bG9Qdn5xzg6pX4y14VKAggcPR
	0ljL6JY8ilSbsHWlLhnf/p+N/eaMubIKoKz7PffSNBSrNpX8QAcz3xQM7KZnLO0c+azBEFG0RRc/D
	MstZF9leXVx+z3UTh4p2wHotdbKdhlQFFgj64PT4C8pWNQhcACRx9DRWbP42goy6aP9rNLUoZJW9M
	5PEuVHj2TMWrZoz2mavB/lGap/7xNJexGDydCp58f70AEOqHLOTH99AjW0sBb8Ot0VuESayBEYUeH
	5KxVPEcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzhug-00000005YFE-22Sd;
	Wed, 24 Apr 2024 19:04:14 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzhud-00000005YE3-1GmK;
	Wed, 24 Apr 2024 19:04:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7D2C4CE1813;
	Wed, 24 Apr 2024 19:04:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88102C113CD;
	Wed, 24 Apr 2024 19:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713985448;
	bh=lf3gUKAZg+5HWPL/HBuxTOwojliXLX/XwXpqq85sjDU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AOqJHgg7/rdvu8eCspTWBEqD70ZnfT8SNhnp/IZYYQTTarBB4oqAw/KnEO338S/4f
	 OzZ3G/GoLvNy55uIm6S3UrKwdJEPyvOlC70Cm0tHmxoTvCNpPYMYuodz4HCgYtYzZd
	 yPXWHDKaLmyuhUeADnLTMucGYePF9piKD2Y47rfj7e2tcDPuLP5gjWMwuawWDcQHoM
	 FnVZSdIZEX+3DdyJoySR3+EIBTKiAGXFVoEWpdbESZuuiqkJSXSvB8pQOhtWTbxxtK
	 aUij5Wxps3qvVBIUB+MHizJDaj2O0r/9m1RWN2Vv52tDJX0QkP77TVo+jFk2fUYwC3
	 FukUwxLvHsYFw==
Date: Wed, 24 Apr 2024 12:04:05 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: djakov@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com, lgirdwood@gmail.com,
	broonie@kernel.org, keescook@chromium.org, gustavoars@kernel.org,
	henryc.chen@mediatek.com, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com,
	wenst@chromium.org, amergnat@baylibre.com,
	Dawei Chien <dawei.chien@mediatek.com>
Subject: Re: [PATCH v5 4/7] soc: mediatek: Add MediaTek DVFS Resource
 Collector (DVFSRC) driver
Message-ID: <20240424190405.GA2803128@dev-arch.thelio-3990X>
References: <20240424095416.1105639-1-angelogioacchino.delregno@collabora.com>
 <20240424095416.1105639-5-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240424095416.1105639-5-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_120411_720023_DB7E3761 
X-CRM114-Status: GOOD (  17.94  )
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

Hi Angelo,

On Wed, Apr 24, 2024 at 11:54:13AM +0200, AngeloGioacchino Del Regno wrote:
> The Dynamic Voltage and Frequency Scaling Resource Collector (DVFSRC) is a
> Hardware module used to collect all the requests from both software and the
> various remote processors embedded into the SoC and decide about a minimum
> operating voltage and a minimum DRAM frequency to fulfill those requests in
> an effort to provide the best achievable performance per watt.
> 
> This hardware IP is capable of transparently performing direct register R/W
> on all of the DVFSRC-controlled regulators and SoC bandwidth knobs.
> 
> This driver includes support for MT8183, MT8192 and MT8195.
> 
> Co-Developed-by: Dawei Chien <dawei.chien@mediatek.com>
> [Angelo: Partial refactoring and cleanups]
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
...
>  drivers/soc/mediatek/mtk-dvfsrc.c        | 551 +++++++++++++++++++++++
...
> +#define KBPS_TO_MBPS(x)			((x) / 1000)
...
> +static void __dvfsrc_set_dram_bw_v1(struct mtk_dvfsrc *dvfsrc, u32 reg,
> +				    u16 max_bw, u16 min_bw, u64 bw)
> +{
> +	u32 new_bw = (u32)div_u64(KBPS_TO_MBPS(bw), 100);
> +
> +	/* If bw constraints (in mbps) are defined make sure to respect them */
> +	if (max_bw)
> +		new_bw = min(new_bw, max_bw);
> +	if (min_bw && new_bw > 0)
> +		new_bw = max(new_bw, min_bw);
> +
> +	dvfsrc_writel(dvfsrc, reg, new_bw);
> +}

Using KBPS_TO_MBPS here results in

  ERROR: modpost: "__aeabi_uldivmod" [drivers/soc/mediatek/mtk-dvfsrc.ko] undefined!

when building ARCH=arm allmodconfig with clang. I did not check to see
if this is visible with GCC but if it is not, it is only because GCC
implements certain transformations for constant division that clang may
or may not have implemented (there was some work on getting all
transformations that GCC has supported in clang as well but I do not
think was ever completed). Perhaps KBPS_TO_MBPS() should be dropped and
the new_bw assignement turned into

  u32 new_bw = (u32)div_u64(bw, 100 * 1000); /* Multiply divisor by 1000 to convert bw from Kbps to Mbps */

or something like that.

Cheers,
Nathan

