Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1211CCD199
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Oct 2025 19:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=igxuE4+YlcqoxMIVUqIDrPp7f6IAG5T3MudZ+TuXG1Q=; b=kcn9zpfq0AGYMtpSgQ3PtJ0vRi
	Sj/aXlC+wpS66DwUvf7aYjjZRYgVp34zUKapvsei2wV0I6RmQiJvGGSjlCY+jAU63btAvT2JeXHGP
	y3LszJ9ANatJRAxbBPLEauGE9PhesXn9y8i6h/k/w/7bgHMvAdmAUv2Q3Dg8Z+lkJGn+qUGXTSPEe
	fwWRlPRntsL7C1Y/1z0gqkug4mVwK9VtTu+R8bmgMY0aFhDRd0Q0gGEuDJB7m8WKk8Oc9XQwdSHDy
	8mPKve/KKJDFZrbmrTRO8elJw5g9VM+NhEsOjpM2bdRUNAzyKizotc2CV0wtnapnqHWw+pLBGmcuR
	PSi3mykw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9TYO-00000005nUD-10jV;
	Thu, 16 Oct 2025 19:22:24 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9TYL-00000005nTh-39SW;
	Thu, 16 Oct 2025 19:22:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760642541; x=1792178541;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=70CHvEmZWEz+900ZJiNa3jXRD54PcFWARg2uD+iSNUs=;
  b=V1LpRXGN7c1yJ2Iklh3yFxZBQnFZETWFf3WrGxs8jNIUPe5RlR9bQEdU
   M1IvShymTH6nDtmxyFqe8nTJ493Xpu94b/iAk8HWaqpxB4DWSz9FterRt
   wN2eLU/I0VGca4XMo9/x8dZxwPz4HPp2kXD3Qikfyww02QJk7yhDDQaNz
   VPV67SQT6Sa2mlKZPETf1UuSEK7+SkrHZOTqZ5kZZc/egIMpBgfy5VzwD
   68jqBkl7KlJngc5sTk1WG+zebsGMQxuzCyCpRMHOETLSU3TXLBz34V18z
   +RHnI+/doMSERk5YXMvZu0QFH2Uj74bNfQx3a97Auq0yLF1WzAKzudbET
   w==;
X-CSE-ConnectionGUID: rcCdgTmFQPaEdDduN+wsGg==
X-CSE-MsgGUID: Utvhe52bTKafKzw9rpFeag==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="66714849"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="66714849"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 12:22:19 -0700
X-CSE-ConnectionGUID: bRDS3vRKR4SjOvpt8TyPXQ==
X-CSE-MsgGUID: 6oARni81RACAlb0elSOKpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="187816556"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.31])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 12:22:09 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 936D312023C;
	Thu, 16 Oct 2025 22:22:06 +0300 (EEST)
Date: Thu, 16 Oct 2025 22:22:06 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Leon Luo <leonl@leopardimaging.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Daniel Scally <djrscally@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Yong Zhi <yong.zhi@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Yemike Abhilash Chandra <y-abhilashchandra@ti.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, imx@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 00/32] media: Use %pe format specifier
Message-ID: <aPFF3n-e7pAUDH5x@kekkonen.localdomain>
References: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_122221_822568_67B8C04B 
X-CRM114-Status: GOOD (  10.39  )
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

Hi Ricardo,

On Mon, Oct 13, 2025 at 02:14:40PM +0000, Ricardo Ribalda wrote:
> The %pe format specifier is designed to print error pointers. It prints
> a symbolic error name (eg. -EINVAL) and it makes the code simpler by
> omitting PTR_ERR().
> 
> The recently introduced test scripts/coccinelle/misc/ptr_err_to_pe.cocci
> checks that we use %pe. Let's make it happy.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thanks for the set.

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Kind regards,

Sakari Ailus

