Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DFC606A331
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2026 16:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=avXaHW1a;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Anw7d1xW;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FcI27rk4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jjGITOFEbZVfMgIGnW+wZ1UcQbDHnChGWTS+tVJ4LPo=; b=avXaHW1aqiGpby5zOsrg2aDOdj
	JIoQkncAsSfoaggBh/uH6uxNr2TlC1s2PqFhVRXOu4sMZgApDqo2vP8F9DAZHUNV29MGB9zL35JA4
	+nOVHDE9fpji1RjlmBUbnfS6vpXzMM5OWCuvP1r6z94zN+ngJ4G5W1BcqKZlLj6tAPPrDVHXxP0Sm
	ldUUewnnMKEKjjyajPXZNaU+HFyjUhJoCwr9mZTGcDdoCzeXvexol4j0qtWdBX7ZbaeUkHwWwsf5o
	o+B59woFF5fw9z2PfyzpkOFEquN80dhJWxMJc0vFazuniHII0rkkdyATu21CJhhXyzPp8jdDNpTUC
	4RELhwuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP0Aw-00000009ZeZ-0C9W;
	Thu, 05 Nov 2026 16:18:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP0An-00000009ZUx-2Ppg;
	Thu, 05 Nov 2026 16:18:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=jjGITOFEbZVfMgIGnW+wZ1UcQbDHnChGWTS+tVJ4LPo=; b=Anw7d1xWK2/v55ECitj11db9jr
	tzr4RvgFfx2SgaGrYtyAoDIQFnSqLNcjEsNvT0/UC668+DTguoEoXBP/VkMm7EflXtvtvODeNLF+F
	3rBKmMutVKNoG55FcTJQ1mZ0bapROXhtMreRTRx5m6fzERCfvEQl1QS7Z6aKrlGa390tSEi4nGWa6
	RYCbxc4JWANxyR49hYtWnH7kYY/OOSTO36Crqby2R1rfQWYaFGLjDwJchR8XVngtvCuwjTqAImDhx
	SYHgvjmcKFqfxchzkqNvl4mbHEGMiRBd84ihZNRdrZ0kRXiPistkom0TILYd7xVJ6FKHaNN6wd25H
	vm7JQsxg==;
Received: from mgamail.intel.com ([198.175.65.17])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP0Ak-00000003Exk-2jdF;
	Thu, 05 Nov 2026 16:18:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793895523; x=1825431523;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+tKMfQT08C0WHdhvauaJZ31Qu1iXJYv2JxCKBEvtIII=;
  b=FcI27rk49cy0ipz2EWuCutPorHdLnySyyo2Aq3Tc1c7iXIc1eOs+DXyO
   ODbBmHl1U0VmfA4NSZxZro/VNFkXuPLxYkkOgwJerNzoAuRlYaONCIGw6
   wsDf34ShJvK8DlpMUtLO5TMG4JIe36xOo90F0QMJhF8KAXCP2bBaB8p8w
   KmSOSdjOGToDbQqYuQ2Gom4zNnVHw7gwCz1KX+9zCqjrGw7+dWwhaKsnL
   9cyo9wUyLuhZbgbkHPsA2geCbf98lhhjbjKa3fTgXjjX50Uo2SudPMJlC
   BMQqTaJQX0IwUHrQexynDczKOZ/q9wo6vNgsc1W3c9/84g2Z4Wzlb/hJG
   g==;
X-CSE-ConnectionGUID: NTknOsEMRXG2IWUkqoGahw==
X-CSE-MsgGUID: 5pjojYFcSb2CdXCW/3SH+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2716013"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2716013"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 08:18:39 -0800
X-CSE-ConnectionGUID: VPPaJ+9hRqqWnjtDTyPN5g==
X-CSE-MsgGUID: 2X+7AsqFSfaAFSLbFky6Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7368194"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 08:18:24 -0800
Date: Thu, 5 Nov 2026 18:18:22 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Frank.Li@oss.nxp.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
	Krzysztof Kozlowski <krzk@kernel.org>,
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
Message-ID: <auysTnqWgz2kE7e9@ashevche-desk.local>
References: <20261102175527.3957740-1-Frank.Li@oss.nxp.com>
 <aux2VKHnVLwq_wzi@orome>
 <auyQEVmA2KeGu9DL@ashevche-desk.local>
 <auyiAE3lhnFahBK2@orome>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auyiAE3lhnFahBK2@orome>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_161842_891974_F58DEBD2 
X-CRM114-Status: GOOD (  27.02  )
X-Spam-Score: -2.3 (--)
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

On Thu, Nov 05, 2026 at 04:36:38PM +0100, Thierry Reding wrote:
> On Thu, Nov 05, 2026 at 04:17:53PM +0200, Andy Shevchenko wrote:
> > On Thu, Nov 05, 2026 at 01:28:46PM +0100, Thierry Reding wrote:
> > > On Mon, Nov 02, 2026 at 12:54:48PM -0500, Frank.Li@oss.nxp.com wrote:
> > > > 
> > > > Replace open-coded assignments to callback and callback_param fields
> > > > of struct dma_async_tx_descriptor with calls to the
> > > > dmaengine_desc_set_callback() helper across serial drivers.
> > > > 
> > > > No functional change intended. Prepare to make struct
> > > > dma_async_tx_descriptor private to the DMA engine.
> > > > 
> > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > > ---
> > > >  drivers/tty/serial/8250/8250_dma.c  | 6 ++----
> > > >  drivers/tty/serial/8250/8250_mtk.c  | 3 +--
> > > >  drivers/tty/serial/8250/8250_omap.c | 6 ++----
> > > >  drivers/tty/serial/amba-pl011.c     | 6 ++----
> > > >  drivers/tty/serial/atmel_serial.c   | 6 ++----
> > > >  drivers/tty/serial/fsl_lpuart.c     | 6 ++----
> > > >  drivers/tty/serial/imx.c            | 6 ++----
> > > >  drivers/tty/serial/msm_serial.c     | 6 ++----
> > > >  drivers/tty/serial/mxs-auart.c      | 6 ++----
> > > >  drivers/tty/serial/pch_uart.c       | 6 ++----
> > > >  drivers/tty/serial/samsung_tty.c    | 6 ++----
> > > >  drivers/tty/serial/serial-tegra.c   | 6 ++----
> > > >  drivers/tty/serial/sh-sci.c         | 9 +++------
> > > >  drivers/tty/serial/sprd_serial.c    | 3 +--
> > > >  drivers/tty/serial/stm32-usart.c    | 6 ++----
> > > >  15 files changed, 29 insertions(+), 58 deletions(-)
> > > 
> > > Reviewed-by: Thierry Reding <treding@nvidia.com>
> > 
> > Krzysztof, now look at this case. I would argue that this is even less fit than
> > # subpart(s) case, because it might imply anything. Again the problem is the
> > bundle, and for such a case (when tons of independent changes are bundled in
> > the same stuff, *every* Rb tag has to be explained on what has been reviewed!
> 
> It may be a bit subtle, but the placement of the tag indicates that it
> applies to the entirety of the changes. I didn't crop the list of
> changed files, nor did I omit the summary.

This doesn't clarify the question. Wordless Rb tag on a bundles is an oddity.

> That bit of meta-data obviously isn't picked up into the tag line, but
> I think the default meaning of Reviewed-by is that it applies to the
> entire thing.

And I interpret it otherwise, because this is a set of independent changes
bundled into a single patch!

-- 
With Best Regards,
Andy Shevchenko



