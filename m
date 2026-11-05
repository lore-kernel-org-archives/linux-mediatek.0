Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62E3606A326
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2026 18:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yo98/ySW;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V5XEvT+k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=t6PWC1eE/ypb4qPLQJ8oNFKL36rk1z0wUhJwubCVn0A=; b=yo98/ySWBMkq24Bwxs7QufuFPy
	2AZBraAUf7/eOb+9BrMSccEa8MXpwTWWsfReVnvT/hdw6oyLYIANT5cSeCMJyAvC07iIb7I1tDWJx
	CVbOI250aM8yeGjwetsFImzU7YfjuS5Q43drpQz7i1tT+JtxLi9Aqm8IwwBJS9t/927VGZVerDVE0
	f7WkzYLw9mNDHaZ6OeO+QZJp+4xHroWRxARNv/jfcS9Z0R3VFkY8yi8pje/qDcc09JcEVmhh5pzuJ
	zaPDvUeVko4VjkH32Va7MgCs7xqS14sXy0Pm0n3zwgL+1VPdcdRb9inYzqHrFXRS7MhZdY0IWml6i
	RpRIWQEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP1nW-0000000A3fC-3v6Z;
	Thu, 05 Nov 2026 18:02:55 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP1mn-0000000A3Wp-16ZK;
	Thu, 05 Nov 2026 18:02:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793901726; x=1825437726;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wZcZ+09X62UsmqZYTYOPGpjxgnZfzRH+TDK05Cpt6Zc=;
  b=V5XEvT+k+JYExJEHgTlbv+Q4OE3BeaF9leZU51pUhzs1qpwBrII4UDUm
   8ZQEGI7e/mCh3nKsjXCC5kyjDDzBT9cnrnF9JRkXzp7A9IqGWPhtzy8dm
   qXf3IlPjbfhcQ7sfynnuUFVUqkX0HD2N7ffwHStYqA1DwKofJJivjEoyP
   Xk9KF94JOCPjGr5FMOmauZlUn7CKVjYb1wQ3qlO2IUHRC77QULwH9LoXy
   gIqQ0wKSIHNKQoya5fio2UaIIqUVoRmVSvRh0EneC7jTazCrMpD1KS6th
   vzEc24wwP+KWDRRi100VQPCeddVywb1oPoil9NtUvQtLkmL8JTWSYMVel
   A==;
X-CSE-ConnectionGUID: NvadcxivR7+9QkS+S4aSNQ==
X-CSE-MsgGUID: ExySs2eQRsmzZhmMnTA9Cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2708937"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2708937"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 10:00:00 -0800
X-CSE-ConnectionGUID: p6BdeozpRwGA0VkthoS13A==
X-CSE-MsgGUID: L7eHp5OGTNyb9x3AbVTe5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7491841"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 09:59:46 -0800
Date: Thu, 5 Nov 2026 19:59:44 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Thierry Reding <thierry.reding@kernel.org>, Frank.Li@oss.nxp.com,
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
Message-ID: <auzEEOL4vLgt4z5I@ashevche-desk.local>
References: <20261102175527.3957740-1-Frank.Li@oss.nxp.com>
 <aux2VKHnVLwq_wzi@orome>
 <auyQEVmA2KeGu9DL@ashevche-desk.local>
 <2e12316d-d079-471f-9c29-ef5fb765216a@kernel.org>
 <auys4Yg-qAr4Rt5w@ashevche-desk.local>
 <e515960d-18fb-4d61-8842-beb6a73fbc27@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e515960d-18fb-4d61-8842-beb6a73fbc27@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_100206_883873_E3D1DB54 
X-CRM114-Status: GOOD (  24.34  )
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

On Thu, Nov 05, 2026 at 05:26:18PM +0100, Krzysztof Kozlowski wrote:
> On 05/11/2026 17:20, Andy Shevchenko wrote:
> > On Thu, Nov 05, 2026 at 03:35:20PM +0100, Krzysztof Kozlowski wrote:
> >> On 05/11/2026 15:17, Andy Shevchenko wrote:
> >>>>> ---
> >>>>>  drivers/tty/serial/8250/8250_dma.c  | 6 ++----
> >>>>>  drivers/tty/serial/8250/8250_mtk.c  | 3 +--
> >>>>>  drivers/tty/serial/8250/8250_omap.c | 6 ++----
> >>>>>  drivers/tty/serial/amba-pl011.c     | 6 ++----
> >>>>>  drivers/tty/serial/atmel_serial.c   | 6 ++----
> >>>>>  drivers/tty/serial/fsl_lpuart.c     | 6 ++----
> >>>>>  drivers/tty/serial/imx.c            | 6 ++----
> >>>>>  drivers/tty/serial/msm_serial.c     | 6 ++----
> >>>>>  drivers/tty/serial/mxs-auart.c      | 6 ++----
> >>>>>  drivers/tty/serial/pch_uart.c       | 6 ++----
> >>>>>  drivers/tty/serial/samsung_tty.c    | 6 ++----
> >>>>>  drivers/tty/serial/serial-tegra.c   | 6 ++----
> >>>>>  drivers/tty/serial/sh-sci.c         | 9 +++------
> >>>>>  drivers/tty/serial/sprd_serial.c    | 3 +--
> >>>>>  drivers/tty/serial/stm32-usart.c    | 6 ++----
> >>>>>  15 files changed, 29 insertions(+), 58 deletions(-)
> >>>>
> >>>> Reviewed-by: Thierry Reding <treding@nvidia.com>
> >>>
> >>> Krzysztof, now look at this case. I would argue that this is even less fit than
> >>> # subpart(s) case, because it might imply anything. Again the problem is the
> >>> bundle, and for such a case (when tons of independent changes are bundled in
> >>> the same stuff, *every* Rb tag has to be explained on what has been reviewed!
> >>
> >> I think this case is obvious - Thierry reviewed this patch and gives Rb
> >> tag, according to reviewer's statement of oversight.
> > 
> > It's unclear from a bare tag, It misses that kind of information. Documentation
> > is also unclear to me as it does *not* describe the case what should I do when
> 
> Documentation is clear and I quote to you multiple times, to which you
> did not respond.
> 
> "Reviewed-by:, instead, indicates that *the patch* has been reviewed and
> found acceptable according to the Reviewer's Statement:"
> 
> Important: "THE PATCH"
> 
> Further:
> 
> "I state that:
> (a) I have carried out a technical review of *this patch* to evaluate
> its appropriateness and readiness for inclusion into  the mainline kernel."
> 
> And further:
> 
> "A Reviewed-by tag is a statement of opinion that *the patch* is an"
> 
> All of these are exhaustive (as in complete) statements leaving no
> interpretation whether this is part of patch or entire patch. It is THE
> patch, meaning entire patch.
> 
> You do not drive your car, as only a wheel. You driver *the car*.
> 
> You live in some apartment. *The apartment* is your home, not "piece of
> your apartment is your home".

And I'm trying to explain my point: "the car" in this case is actually "the cars"!
I drive mine, you driver yours. "The PATCH" is wrong term when it's bundled.

-- 
With Best Regards,
Andy Shevchenko



