Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E887606A328
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2026 16:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LuyY9/yZ;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XPgBRsel
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=glWYFJWJY1bRMuBsdlN40Etai5OWB/ptNyzICpjIyVw=; b=LuyY9/yZ4ko0+YhkmP5kbmvIOf
	17goY8YgKG2G5Yvt2lHRXKZxX4eO0mL9WXfR7hVwo6PJe+dKNIf5+zb+ejKZShRmHOy005sWPhfkr
	b0Rfc5hY9xHTiaS1aarALODevkmNktvqBfuTfD5KbmInpBrAOvQg2FUbj8NwDH1lBxB4ss7caO7o6
	eJNYxE5CZ8Xc4oVAPSlVvJVua+L8F4B4oievPx+NgvUQDQHpNpRa6NDOJorGfTcY+uOPf4QFvAdDB
	Sl4Ad6c9JqeK7MgqAJO68cMJYlmZyGlYWp+SInjWebbkueX348Ugit72LWGATUM6RbzwOixmxmBJP
	JAzru7Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP08s-00000009Z0b-0M3u;
	Thu, 05 Nov 2026 16:16:46 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP08p-00000009Yzw-08Ij;
	Thu, 05 Nov 2026 16:16:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793895403; x=1825431403;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BkaWXWS96NrFgGNkwhoCJWLY7qJ4X8CCDmsOslperL0=;
  b=XPgBRseljxXSs2BBm9hhud4jXCu4lyCDyBczvEg5bm+iqJaZg3IlnvBt
   KsfVSjLQtETzQbWTYSxbZoUBFSNePco+pLruUUnsvza05zrf23vkGGDOn
   7UUr1wKKpB8UTqwc/lrB1rpj+FCyFofs03RIT/jmHwPHFBOzOelNeJH+z
   TYMI4CajnAlg/v6c7zphnc242JRW8t2bM9+1pfzFNXIx3Y2TK0M1DdIQq
   pblLYAYytrAEi27T7MxMnxvKGwy97gtUCp84rfcGpvQQakQ/5kD2jbKcr
   KF+n122Ya5T4nsm7nO9ppwi63ibTEUrO7Y91X7jbB5DAcYzkhK8PIkpQh
   A==;
X-CSE-ConnectionGUID: 8PRN/9zLRiyrLjNyVKlr0w==
X-CSE-MsgGUID: B3wxlW/gRDyXPs2FQ0XWwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2568144"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2568144"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 08:16:41 -0800
X-CSE-ConnectionGUID: leBebQCuSFeL56NOhLkwvg==
X-CSE-MsgGUID: YHmuBu+/RLGamxnWF5zYow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7358773"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 08:16:28 -0800
Date: Thu, 5 Nov 2026 18:16:26 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Frank.Li@oss.nxp.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Cunhao Lu <1579567540@qq.com>, Raul E Rangel <rrangel@chromium.org>,
	Yenchia Chen <yenchia.chen@mediatek.com>,
	Zhiyong Tao <zhiyong.tao@mediatek.com>,
	Carlo Caione <ccaione@baylibre.com>, Moteen Shah <m-shah@ti.com>,
	Kendall Willis <k-willis@ti.com>,
	Kartik Rajput <kkartik@nvidia.com>, Fan Wu <fanwu01@zju.edu.cn>,
	Nicolai Buchwitz <nb@tipi-net.de>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	Stefan =?iso-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>,
	Shitalkumar Gandhi <shital.gandhi45@gmail.com>,
	Peng Fan <peng.fan@nxp.com>, Sherry Sun <sherry.sun@nxp.com>,
	John Ogness <john.ogness@linutronix.de>,
	Pan Chuang <panchuang@vivo.com>, Petr Mladek <pmladek@suse.com>,
	Robin Gong <yibin.gong@nxp.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	Zhaoyang Yu <2426767509@qq.com>,
	"Nikola Z. Ivanov" <zlatistiv@gmail.com>,
	Haoxiang Li <haoxiang_li2024@163.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Myeonghun Pak <mhun512@gmail.com>,
	Wenhua Lin <Wenhua.Lin@unisoc.com>, Cixi Geng <cixi.geng@linux.dev>,
	"open list:TTY LAYER AND SERIAL DRIVERS" <linux-kernel@vger.kernel.org>,
	"open list:TTY LAYER AND SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	"open list:ARM/FREESCALE IMX / MXC / LAYERSCAPE ARM ARCHIT..." <imx@lists.linux.dev>,
	"open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>,
	"open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>,
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>,
	vkoul@kernel.org
Subject: Re: [PATCH 1/1] tty: serial: use dmaengine_desc_set_callback()
Message-ID: <auyr2lqlSegIXFnc@ashevche-desk.local>
References: <20261102175527.3957740-1-Frank.Li@oss.nxp.com>
 <aux2VKHnVLwq_wzi@orome>
 <auyQEVmA2KeGu9DL@ashevche-desk.local>
 <2e12316d-d079-471f-9c29-ef5fb765216a@kernel.org>
 <auygwakavp_Uk52V@orome>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auygwakavp_Uk52V@orome>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_081643_083743_10399B36 
X-CRM114-Status: GOOD (  28.30  )
X-Spam-Score: -4.2 (----)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 04:34:15PM +0100, Thierry Reding wrote:
> On Thu, Nov 05, 2026 at 03:35:20PM +0100, Krzysztof Kozlowski wrote:
> > On 05/11/2026 15:17, Andy Shevchenko wrote:
> > >>> ---
> > >>>  drivers/tty/serial/8250/8250_dma.c  | 6 ++----
> > >>>  drivers/tty/serial/8250/8250_mtk.c  | 3 +--
> > >>>  drivers/tty/serial/8250/8250_omap.c | 6 ++----
> > >>>  drivers/tty/serial/amba-pl011.c     | 6 ++----
> > >>>  drivers/tty/serial/atmel_serial.c   | 6 ++----
> > >>>  drivers/tty/serial/fsl_lpuart.c     | 6 ++----
> > >>>  drivers/tty/serial/imx.c            | 6 ++----
> > >>>  drivers/tty/serial/msm_serial.c     | 6 ++----
> > >>>  drivers/tty/serial/mxs-auart.c      | 6 ++----
> > >>>  drivers/tty/serial/pch_uart.c       | 6 ++----
> > >>>  drivers/tty/serial/samsung_tty.c    | 6 ++----
> > >>>  drivers/tty/serial/serial-tegra.c   | 6 ++----
> > >>>  drivers/tty/serial/sh-sci.c         | 9 +++------
> > >>>  drivers/tty/serial/sprd_serial.c    | 3 +--
> > >>>  drivers/tty/serial/stm32-usart.c    | 6 ++----
> > >>>  15 files changed, 29 insertions(+), 58 deletions(-)
> > >>
> > >> Reviewed-by: Thierry Reding <treding@nvidia.com>
> > > 
> > > Krzysztof, now look at this case. I would argue that this is even less fit than
> > > # subpart(s) case, because it might imply anything. Again the problem is the
> > > bundle, and for such a case (when tons of independent changes are bundled in
> > > the same stuff, *every* Rb tag has to be explained on what has been reviewed!
> > 
> > I think this case is obvious - Thierry reviewed this patch and gives Rb
> > tag, according to reviewer's statement of oversight. I don't see a
> > problem here or what is questionable.
> 
> Correct. I looked at this whole thing and approve of it.

for this type of bundles it's not obvious.

> If I review only parts of something at most I'll give an Acked-by.

Which is strange, don't you find it? The review is not an acknowledgement.
These are two different operations.

> I don't think I've ever done partial reviews. I don't think you can reasonably do
> that
> because if you don't know what other parts of a patch are doing, how can
> you say that a specific hunk does what it's supposed to.
> 
> Patches are an atomic set of changes,

Of course, not always the case. This patch is a bundle of atomic changes
in a single drop.

> so I don't think it makes sense to review only parts of it. If you can't be
> bothered to look at the entirety, that's absolutely fine of course, but in
> that case don't provide a Reviewed-by.
> 
> Or, I suppose, you do and then you bear the consequences of lending
> credibility to something that you haven't looked at or understood.

No, I review *my* part, that I understand and I confirm.

-- 
With Best Regards,
Andy Shevchenko



