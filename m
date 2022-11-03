Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECFCBC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Nov 2022 22:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j4CAka8JWrD12kJYu0OkVFCCsQ3S+hDEruai69AMqu8=; b=cShe8J5gmXfxHHHT991BoLaU8h
	JVl8vQ0yL7CSXAFw2xx8FeJ6PFWGuMQg0RlQ0zheY5+kZsraUQEaBZVNdMJCbHeg0Ai2ppPn5rooz
	ivFUuriKRqx6NnnpWcS1X4skNYfVqD0t2MWQZiWD8idBmE/GA/Uhs++V7ZkwMqlU98Co/ALYIiCU6
	749xi61ZY3kqd4WE7On4CtCOC9jDpRMXdl32aSXkkGd8Rq7sqo5JpZ8f7A0eminUwpar6ZBbo+lsd
	xtG9H2qsXl5R37KJFyl6dVuX1Qa9Q01QKqVMqv0HB9LXmviB4fOAlIWlnMHRI16R3WGBiPLElmxhU
	HGimVNFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqiRE-001qOl-4e; Thu, 03 Nov 2022 22:11:52 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqiR1-001qKm-Sl; Thu, 03 Nov 2022 22:11:41 +0000
Received: from notapiano (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 88186660295F;
	Thu,  3 Nov 2022 22:11:33 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667513495;
	bh=pgY0dvtyM8FwNva19FmPelXivw7RaAAO4XKizZMcieY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CFxur4ptUBDg7nGhx6dDOLzWzdzgMgpxTlSmAPSCP55GF1G+wVuCCHQeFU6+igc2b
	 jOhlKLfU2M0GUXM+S0c6g/JTL6GBReHOEz3BEbJsm9rTAe9hkY9ASLOMVKu9HY+y1T
	 H8YQpaU63a+D1cbi+B2YA5wUoFHz0n+L+rUTdURifcJPTfF0vf8BOmGrfAquN1YTsc
	 5LLR36LQ7R30Ony0YDIp59ut26FmT5HX79waVCxst2/XyNkDt+Pkb5gVHmRRKDaXKZ
	 1bHzhBQtXoHsmBvyRI6thybjEcHTPudxLp360clRIl7OlICUHJj+uVW2GcAxHHkEQ9
	 Qv6dp8PWOTxEw==
Date: Thu, 3 Nov 2022 18:11:30 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Rex-BC Chen =?utf-8?B?KOmZs+afj+i+sCk=?= <Rex-BC.Chen@mediatek.com>
Cc: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"sboyd@kernel.org" <sboyd@kernel.org>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"wenst@chromium.org" <wenst@chromium.org>,
	Runyang Chen =?utf-8?B?KOmZiOa2pua0iyk=?= <Runyang.Chen@mediatek.com>,
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Miles Chen =?utf-8?B?KOmZs+awkeaouik=?= <Miles.Chen@mediatek.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v6 1/3] reset: mediatek: Move MediaTek system clock reset
 to reset/mediatek
Message-ID: <20221103221130.eosmwl2vjo36va6c@notapiano>
References: <20221021104804.21391-1-rex-bc.chen@mediatek.com>
 <20221021104804.21391-2-rex-bc.chen@mediatek.com>
 <8b73e38b-ae78-1f85-f5f0-f13bce6e45de@collabora.com>
 <bcfd608b029377565dc656adf24effeba95d2433.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bcfd608b029377565dc656adf24effeba95d2433.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_151140_325446_9EE51144 
X-CRM114-Status: GOOD (  28.54  )
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

On Mon, Oct 31, 2022 at 05:14:40AM +0000, Rex-BC Chen (陳柏辰) wrote:
> On Tue, 2022-10-25 at 12:36 +0200, AngeloGioacchino Del Regno wrote:
> > Il 21/10/22 12:48, Bo-Chen Chen ha scritto:
[..]
> > > --- a/drivers/clk/mediatek/Kconfig
> > > +++ b/drivers/clk/mediatek/Kconfig
> > > @@ -8,6 +8,7 @@ menu "Clock driver for MediaTek SoC"
> > >   config COMMON_CLK_MEDIATEK
> > >   	tristate
> > >   	select RESET_CONTROLLER
> > > +	select RESET_MEDIATEK_SYSCLK
> > >   	help
> > >   	  MediaTek SoCs' clock support.
> > >   
> > 
> > ..snip..
> > 
> > > diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> > > index 3e7e5fd633a8..5cef7ccc9a7d 100644
> > > --- a/drivers/reset/Makefile
> > > +++ b/drivers/reset/Makefile
> > > @@ -1,6 +1,7 @@
> > >   # SPDX-License-Identifier: GPL-2.0
> > >   obj-y += core.o
> > >   obj-y += hisilicon/
> > > +obj-y += mediatek/
> > 
> > I'd be more for
> > 
> > obj-$(CONFIG_ARCH_MEDIATEK) += mediatek/
> > 
> > as there's no reason to even compile these if MTK support isn't
> > enabled at all.
> > 
> 
> Hello Angelo,
> 
> thanks for your review.
> I obj-y += mediatek/ because if I don't write like this, it will build
> fail for x86.
> Is there any suggestion for this?
> 
> /tmp/src_kernel/prebuilt/toolchain/0day/gcc/x86_64-linux/bin/x86_64-
> linux-ld: vmlinux.o: in function `mtk_pericfg_init':
> clk-mt8135.c:(.init.text+0x12a2b7): undefined reference to
> `mtk_reset_init_with_node'
> /tmp/src_kernel/prebuilt/toolchain/0day/gcc/x86_64-linux/bin/x86_64-
> linux-ld: vmlinux.o: in function `mtk_infrasys_init':
> clk-mt8135.c:(.init.text+0x12a3bb): undefined reference to
> `mtk_reset_init_with_node'
> /tmp/src_kernel/prebuilt/toolchain/0day/gcc/x86_64-linux/bin/x86_64-
> linux-ld: vmlinux.o: in function `mtk_infrasys_init':
> clk-mt8173.c:(.init.text+0x12ac47): undefined reference to
> `mtk_reset_init_with_node'
> /tmp/src_kernel/prebuilt/toolchain/0day/gcc/x86_64-linux/bin/x86_64-
> linux-ld: vmlinux.o: in function `mtk_pericfg_init':
> clk-mt8173.c:(.init.text+0x12ad25): undefined reference to
> `mtk_reset_init_with_node'
> /tmp/src_kernel/kernel/mediatek/scripts/Makefile.vmlinux:34: recipe for
> target 'vmlinux' failed
> make[3]: *** [vmlinux] Error 1
> make[3]: Target '__default' not remade because of errors.
> /tmp/src_kernel/kernel/mediatek/Makefile:1236: recipe for target
> 'vmlinux' failed
> make[2]: *** [vmlinux] Error 2
> make[2]: Target '__all' not remade because of errors.
> make[2]: Leaving directory '/tmp/out_kernel/out/allyesconfig.x86_64'
> Makefile:231: recipe for target '__sub-make' failed
> make[1]: *** [__sub-make] Error 2
> make[1]: Target '__all' not remade because of errors.
> make[1]: Leaving directory '/tmp/src_kernel/kernel/mediatek'
> build/core/kbuild_test.mk:61: recipe for target 'all' failed
> make: *** [all] Error 2
> [11:44:04] Error: failed to build allyesconfig.x86_64

From the errors it seems like you're compiling the clock drivers (like
clk-mt8135.c) but not the sysclk reset driver (reset-mediatek-sysclk.c). Given
that this happened when you added CONFIG_ARCH_MEDIATEK to that Makefile, then it
must mean that that config is disabled, which would make sense for a x86 build.
But then the fact that the clock driver was built even in this case must mean
that you have COMPILE_TEST enabled.

I guess in order to have a working COMPILE_TEST=y build, you do need to have
obj-y += mediatek/, and on the Kconfig below...

> 
> > >   obj-$(CONFIG_ARCH_STI) += sti/
> > >   obj-$(CONFIG_ARCH_TEGRA) += tegra/
> > >   obj-$(CONFIG_RESET_A10SR) += reset-a10sr.o
> > > diff --git a/drivers/reset/mediatek/Kconfig
> > > b/drivers/reset/mediatek/Kconfig
> > > new file mode 100644
> > > index 000000000000..a416cb938753
> > > --- /dev/null
> > > +++ b/drivers/reset/mediatek/Kconfig
> > > @@ -0,0 +1,5 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only
> > 
> > Similarly, we should at this point also do....
> > 
> > if ARCH_MEDIATEK

... have instead

if ARCH_MEDIATEK || COMPILE_TEST

I think that should fix the issue.

Thanks,
Nícolas

> > 
> > > +config RESET_MEDIATEK_SYSCLK
> > > +	tristate "MediaTek System Clock Reset Driver"
> > > +	help
> > > +	  This enables the system clock reset driver for MediaTek SoCs.
> > 
> > endif # ARCH_MEDIATEK

