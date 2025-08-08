Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 223DBC87FD2
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Aug 2025 07:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vC9kSzidZ3lEzWsQIFhc/wqeFJziVL3H7AjboZgOxSk=; b=q4MDsrKWq+M30GeHEVIXYthnwe
	F493F1wdwh42y0fKuEbvzER2MsqDUR4slktoGuBbuiSTVjW4KcIv6WL4HN2jTASzRcA+RkC/Oo3G2
	/GW5+hu97CmOUdEpO6hxBWMTJzWE2Ddu71o3yLQx5/As30NMnE0rsQMWFJNa/jevbnvHBY2u60/DF
	Pc3lOImCBEPR9ExXpIaAexqgCkxcGas5IO+X8tD9t8rJ8FfOY/DzYOJPdtV4+CLcMfi6l5ixMpQ7D
	JIAkvGtuhZwnobnk4LWrcg+z4lEXxq6oCrnBOna/ihMmHH9TJ6jqno/UIdOffreg1PVenqcNhuOpF
	F4D/ML+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukHjt-00000002EXH-3wOC;
	Fri, 08 Aug 2025 07:42:09 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukHR6-00000002BSN-1RiA;
	Fri, 08 Aug 2025 07:22:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754637764; x=1786173764;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fbLBorPezoJWXQtvSg4WV87SLfHofuZpGSIX8FwjR+A=;
  b=dSy2AUy9aybB9w1TePUjoVyp/VDYXlPV5dP3oY7PLSgw7uMaUhEk3BDB
   bLiXOW8BuZeU03MMaP0QOoNIiDGiBY3vCXlO76XCM6avoo2lWMrY1YRWH
   4bdiBxeQkh3IHR3cNpJeFgUeGYRRNWV1mJAg3Uz9FOP/7AL7/DIQaBKvF
   ntw7cI6MAGi4p0TpZdA+B8ck02yml8XKFc0eDPyxsARyGXkmLNItkVnmU
   N0CXCoDUyfAWLcrd9wdL8SF9nz/6p1i+BqTx0h+aQmerYzHssv8AZPBo5
   U7AUmJ5CsjmHCCmI69vMUdpUyenjAdOQ7yl5CjsSBOJQxdCI60xsb1uMS
   w==;
X-CSE-ConnectionGUID: RbTz6xd1TyKxfaj0BjlemQ==
X-CSE-MsgGUID: HTc/G7zVTiOj12eazPNREQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="82427461"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="82427461"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2025 00:22:44 -0700
X-CSE-ConnectionGUID: OdNPlVlrR9m1H28JVd9Cfw==
X-CSE-MsgGUID: 6MIOtN9XTOqpGi12upForA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="188944168"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.151])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2025 00:22:33 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 7FB8211FC97;
	Fri,  8 Aug 2025 10:22:31 +0300 (EEST)
Date: Fri, 8 Aug 2025 07:22:31 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Devarsh Thakkar <devarsht@ti.com>, Benoit Parrot <bparrot@ti.com>, Hans Verkuil <hverkuil@kernel.org>, Mike Isely <isely@pobox.com>, Hans de Goede <hansg@kernel.org>, Parthiban Veerasooran <parthiban.veerasooran@microchip.com>, Christian Gromm <christian.gromm@microchip.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, Jonathan Corbet <corbet@lwn.net>, Tomasz Figa <tfiga@chromium.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Andy Walls <awalls@md.metrocast.net>, Michael Tretter <m.tretter@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Bin Liu <bin.liu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Michal Simek <michal.simek@amd.com>, Ming Qian <ming.qian@nxp.com>, Zhou Peng <eagle.zhou@nxp.com>, Xavier Roumegue <xavier.roumegue@oss.nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>, Vikash Garodia <quic_vgarodia@quicinc.com>, Dikshita Agarwal <quic_dikshita@quicinc.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Daniel Almeida <daniel.almeida@collabora.com>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Nas Chung <nas.chung@chipsnmedia.com>, Jackson Lee <jackson.lee@chipsnmedia.com>, Minghsiu Tsai <minghsiu.tsai@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Tiffany Lin <tiffany.lin@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>, Jacob Chen <jacob-chen@iotwrt.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Heiko Stuebner <heiko@sntech.de>, Detlev Casanova <detlev.casanova@collabora.com>, Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, =?utf-8?Q?=C5=81ukasz?= Stelmach <l.stelmach@samsung.com>, Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Fabien Dessenne <fabien.dessenne@foss.st.com>, Hugues Fruchet <hugues.fruchet@foss.st.com>, Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, Steve Longerbeam <slongerbeam@gmail.com>, Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>, Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>, Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Corentin Labbe <clabbe@baylibre.com>, Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-usb@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, mjpeg-users@lists.sourceforge.net
Subject: Re: [PATCH 64/65] media: staging: ipu7: isys: Don't set
 V4L2_FL_USES_V4L2_FH manually
Message-ID: <aJWltxB6NfXg53KI@kekkonen.localdomain>
References: <20250802-media-private-data-v1-0-eb140ddd6a9d@ideasonboard.com>
 <20250802-media-private-data-v1-64-eb140ddd6a9d@ideasonboard.com>
 <aJRswZIVKCuzqCpr@kekkonen.localdomain>
 <20250807170135.GH11583@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250807170135.GH11583@pendragon.ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_002244_395203_8458C3D0 
X-CRM114-Status: GOOD (  15.79  )
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

On Thu, Aug 07, 2025 at 08:01:35PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> On Thu, Aug 07, 2025 at 09:07:13AM +0000, Sakari Ailus wrote:
> > On Sat, Aug 02, 2025 at 11:23:26AM +0200, Jacopo Mondi wrote:
> > > From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > 
> > > The V4L2_FL_USES_V4L2_FH flag is set by v4l2_fh_init(). It is not meant
> > > to be set manually by drivers. Drop it from the ipu7-isys driver.
> > > 
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > 
> > Thanks, Jacopo!
> > 
> > Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> Can we get you review on patch 63/65 too (for the IPU6 driver) too ?

Done.

-- 
Sakari Ailus

