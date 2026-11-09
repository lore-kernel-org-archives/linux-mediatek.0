Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349B1606A31C
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2026 18:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vsdNdSku;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OA0dNs1o
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qBL546n84kVw8zSWbG66JT4Kv5FLqZ7Q9evIqEtakAI=; b=vsdNdSku42uBWEjf7DPMLvFjL2
	8rww7o8QjlZ5WwN4GKlitCaa03iMN6HDFiloK+76ewfJ8cNDHGom6PGnqkO+oSrvjE0Jc+Q3yCAui
	diYcIOQWbIF6ZyCTK7Itc6VjPTmWE7ctHzCTxlzAzJz84X2q8XDHOA77rU9UIjQx9iKKGEIqcW9mZ
	wS13UZh09cDG6mvGb/LgwZn/XlC3u5pt+59l0cJ7pGT5MQjefY/E16+WodwJLvxVAuvlnw0yqq4gg
	0ZxY8noh85xpKLD1l+V5i1FB0Lhx2VrFqp+4Zvk22WmPCx7ulcaU7mcT+UV2wkLhKj/1uA8dwb8ZF
	tmeikA2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQThh-00000001Qmv-2OgJ;
	Mon, 09 Nov 2026 18:02:49 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQThc-00000001Qlx-2Bp9;
	Mon, 09 Nov 2026 18:02:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794247365; x=1825783365;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lTSpr2GI78io7MkEyt4FUNnh+Ze4ac0+NixA3FDB8nQ=;
  b=OA0dNs1oX1enJ54EFrsQbWRE/+we302ILhH1wrrZlezjDQucwcsvTUzm
   bXLBKkONqFobxDVfxh1V5yZH7zmyW707aIRugwtCCsuEJ7QeRdGtuETWt
   7jJOIGJGTW7KgVZmkqFWp7n/u/fXw0KRfpUjZNbcXqycFma8RMiw64CXf
   wUCZGJcjrE/pHOGaTy1qwDPa/33WyA3EDIDsRaXCXCFJ0bD2eCoAoEZ8X
   DYC2Zxf81fyCQbL5q4batsH0CCibubKao7iDUNbXYRLY+6g6ProsRwiB5
   usvz3VgoNFRtP3NPG23/F1FNP05c3IaKlwBVWKJGv9M6WhdJLMZ4rUnKe
   A==;
X-CSE-ConnectionGUID: 5Y5PFTOGSBGbzSPpPkOhxQ==
X-CSE-MsgGUID: vZzvKC0XTdu+BxZqx+uHAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2877429"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="2877429"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 10:02:43 -0800
X-CSE-ConnectionGUID: kh6S7vkjRge2Au/8/Y2xMw==
X-CSE-MsgGUID: Z/nSAtfmRl2XXURKPF7N5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="8243221"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 10:02:29 -0800
Date: Mon, 9 Nov 2026 20:02:27 +0200
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
Message-ID: <avIKs_b3cxRLXpGm@ashevche-desk.local>
References: <20261102175527.3957740-1-Frank.Li@oss.nxp.com>
 <aux2VKHnVLwq_wzi@orome>
 <auyQEVmA2KeGu9DL@ashevche-desk.local>
 <auyiAE3lhnFahBK2@orome>
 <auysTnqWgz2kE7e9@ashevche-desk.local>
 <2209947d-0b9b-417f-9ffb-1c81790af9db@kernel.org>
 <auzEupFd_Ek2HpLG@ashevche-desk.local>
 <au3GYOP5P7B90-bX@orome>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <au3GYOP5P7B90-bX@orome>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_100244_613545_3D1C80A8 
X-CRM114-Status: GOOD (  55.84  )
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

On Fri, Nov 06, 2026 at 01:40:15PM +0100, Thierry Reding wrote:
> On Thu, Nov 05, 2026 at 08:02:34PM +0200, Andy Shevchenko wrote:
> > On Thu, Nov 05, 2026 at 05:21:06PM +0100, Krzysztof Kozlowski wrote:
> > > On 05/11/2026 17:18, Andy Shevchenko wrote:
> > > > On Thu, Nov 05, 2026 at 04:36:38PM +0100, Thierry Reding wrote:
> > > >> On Thu, Nov 05, 2026 at 04:17:53PM +0200, Andy Shevchenko wrote:
> > > >>> On Thu, Nov 05, 2026 at 01:28:46PM +0100, Thierry Reding wrote:
> > > >>>> On Mon, Nov 02, 2026 at 12:54:48PM -0500, Frank.Li@oss.nxp.com wrote:
> > > >>>>>
> > > >>>>> Replace open-coded assignments to callback and callback_param fields
> > > >>>>> of struct dma_async_tx_descriptor with calls to the
> > > >>>>> dmaengine_desc_set_callback() helper across serial drivers.
> > > >>>>>
> > > >>>>> No functional change intended. Prepare to make struct
> > > >>>>> dma_async_tx_descriptor private to the DMA engine.
> > > >>>>>
> > > >>>>> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > >>>>> ---
> > > >>>>>  drivers/tty/serial/8250/8250_dma.c  | 6 ++----
> > > >>>>>  drivers/tty/serial/8250/8250_mtk.c  | 3 +--
> > > >>>>>  drivers/tty/serial/8250/8250_omap.c | 6 ++----
> > > >>>>>  drivers/tty/serial/amba-pl011.c     | 6 ++----
> > > >>>>>  drivers/tty/serial/atmel_serial.c   | 6 ++----
> > > >>>>>  drivers/tty/serial/fsl_lpuart.c     | 6 ++----
> > > >>>>>  drivers/tty/serial/imx.c            | 6 ++----
> > > >>>>>  drivers/tty/serial/msm_serial.c     | 6 ++----
> > > >>>>>  drivers/tty/serial/mxs-auart.c      | 6 ++----
> > > >>>>>  drivers/tty/serial/pch_uart.c       | 6 ++----
> > > >>>>>  drivers/tty/serial/samsung_tty.c    | 6 ++----
> > > >>>>>  drivers/tty/serial/serial-tegra.c   | 6 ++----
> > > >>>>>  drivers/tty/serial/sh-sci.c         | 9 +++------
> > > >>>>>  drivers/tty/serial/sprd_serial.c    | 3 +--
> > > >>>>>  drivers/tty/serial/stm32-usart.c    | 6 ++----
> > > >>>>>  15 files changed, 29 insertions(+), 58 deletions(-)
> > > >>>>
> > > >>>> Reviewed-by: Thierry Reding <treding@nvidia.com>
> > > >>>
> > > >>> Krzysztof, now look at this case. I would argue that this is even less fit than
> > > >>> # subpart(s) case, because it might imply anything. Again the problem is the
> > > >>> bundle, and for such a case (when tons of independent changes are bundled in
> > > >>> the same stuff, *every* Rb tag has to be explained on what has been reviewed!
> > > >>
> > > >> It may be a bit subtle, but the placement of the tag indicates that it
> > > >> applies to the entirety of the changes. I didn't crop the list of
> > > >> changed files, nor did I omit the summary.
> > > > 
> > > > This doesn't clarify the question. Wordless Rb tag on a bundles is an oddity.
> > > 
> > > No, it's perfectly normal and typical. I would not expect anything else,
> > > because writing "LGTM" is pointless. We are experienced reviewers and we
> > > do understand what Reviewer's statement of oversight means, thus giving
> > > the tag is obvious, explicit and not odd.
> > > 
> > > > 
> > > >> That bit of meta-data obviously isn't picked up into the tag line, but
> > > >> I think the default meaning of Reviewed-by is that it applies to the
> > > >> entire thing.
> > > > 
> > > > And I interpret it otherwise, because this is a set of independent changes
> > > > bundled into a single patch!
> > > 
> > > It's not set of independent changes, but even if it was then it would
> > > not matter. We review the code regardless how we actually judge the
> > > atomicity of a patch.
> > 
> > And I confront exactly that! When the patch may be split it has to. This is
> > seems the outcome of this discussion to me. From now on I think I will NAK
> > any bundle patch until piece that I in charge to is split from the bundle.
> 
> I'd like to caution against this. There's effectively one change in this
> patch and it converts all the drivers in the same way. This was probably
> generated using a script or semantic patch. Requiring this to be split
> up is going to make the author spend a lot of time creating 15 patches
> instead of just one. They will have to write the same commit message
> with tiny variations, which they'll most likely just use a script for
> because it's tedious. Or they don't use a script and likely get at least
> one commit message wrong. And then we're not reviewing a patch for
> technical correctness anymore but waste a lot of time on nit-picking on
> a subject or commit message. Each of these commit messages is not going
> to add any new information either, so the only thing you really achieve
> is to increase the signal-to-noise ratio.
> 
> That's completely absurd.
> 
> Also, reviewing 15 miniature patches is going to take much more time
> that reviewing this monolithic one, so I suspect potential reviewers are
> more likely to just stay away from it to begin with.
> 
> In the end you make life miserable for everyone. Well, except for
> individual driver maintainers that want a quick and easy way to slap
> their approval onto only the one driver change that they really care
> about.
> 
> But there's already a way that they can do that. Acked-by can just mean
> "I maintain this driver and I agree with the direction, but I haven't
> bothered to do a full technical review". That's what most of these
> "partial" Reviewed-bys are, so why not just use that existing tool?
> 
> And I'm saying all of this without judgement, because sometimes you do
> not have the time to do a full review but you still want to lend your
> support to ongoing work. I do that quite often myself.
> 
> But at other times I do want to look at something in more detail, or
> just ended up looking thoroughly enough for it to count as a full review
> and when I do I'll let people know with a Reviewed-by.

Okay, the only way I see now is to ignore bundles where patches have different
maintainers. Or NAK, or request to split (depending on the content).

Ignoring is an easy way out, of course. Makes me more time for something more
useful. Thanks folks, for the fruitful discussion.

-- 
With Best Regards,
Andy Shevchenko



