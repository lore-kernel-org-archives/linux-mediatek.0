Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5278CCF857A
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Oct 2024 11:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c41nJRYH0CuFqPdC78bvCdogVQBHoK7TTdQjK/E9Gno=; b=kv1b8C0orCLAF9WSUQQQ+VyC5Q
	WeBIAngBsa1SCCIV/ipCCmljWltWxPGEFh0dUbRPz/agQMYUdsQvFmFJHO8YO22NOT2sGO4PmvM7w
	OHnSDMS1q9P1z5mA0KL8kmF8hlBCu/Cr+WbA+K1xS0WO/FNjUplfXisQZ5YIZQlslT2XKn6x2b0Ob
	2t78FIwGI/W23kvHxOknf3dhyt6aiZdrMErOOQO5XzPOQ1Y111HiV293SHXFMYDwueKwybi2mII+B
	TWVfOAZqeYtwgg2u56inx2yinU1FcCuTb4qg6/HFaCAd/Wl4iYftadddWLijU6c0Ui43BVULnA9Zk
	Wwg/rFaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swJsO-00000008tGz-149q;
	Thu, 03 Oct 2024 11:20:08 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swJrH-00000008stU-0s34;
	Thu, 03 Oct 2024 11:19:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727954339; x=1759490339;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=s33xKLkAQRIbAlUPTP5cQcxaqv1POeyGIhVy9Hi8rOI=;
  b=Xp8uOe5dz6HST0D8A1l4YOjdYH1gT+N/2YGUDCdIIUQAenlhcikkrE3A
   I3lsG/NDXygDO24ocjcDBf4Kg6LHLWl98SbjhqJy+LmVgQHV7e5FhIR2B
   M5NNEZiVdZ+/ztSRiTrLpIXO/+7FQQqKZSFpDWAASSICTW+7nbXQeEYJx
   j+S1lrF/1i4sLWaJbwwO8OG/7suuCiqQh/c23EBhVraZbg4oo2/a+sxYk
   phMYhCMJhpMY83tEk8bh34yPN+XTTai9h0lsxZHwlmNH1tRVBsP08YcOt
   DuziS4PxXxJYaJlvjrMekIzRfY/xlC6TwrkFodT/WgwZ+5uulbKbkUaO5
   Q==;
X-CSE-ConnectionGUID: Tu5FkiVNQT2JHsqZznzvGw==
X-CSE-MsgGUID: 6Lm3aJaiR5eyhhpWEDnnSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="27012951"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="27012951"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 04:18:56 -0700
X-CSE-ConnectionGUID: 8n45Wya1R0GbuLQ0RLNqqA==
X-CSE-MsgGUID: SBXF83x3Qry5MaAdfgh5yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="74423646"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
  by fmviesa008.fm.intel.com with SMTP; 03 Oct 2024 04:18:52 -0700
Received: by stinkbox (sSMTP sendmail emulation); Thu, 03 Oct 2024 14:18:51 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Alison Wang <alison.wang@nxp.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Lucas Stach <l.stach@pengutronix.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Stefan Agner <stefan@agner.ch>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 00/10] drm: Increase COMPILE_TEST=y coverage
Date: Thu,  3 Oct 2024 14:18:41 +0300
Message-ID: <20241003111851.10453-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_041859_318793_317BC675 
X-CRM114-Status: UNSURE (   7.81  )
X-CRM114-Notice: Please train this message.
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Repost of the stragglers from
https://patchwork.freedesktop.org/series/132164/

Cc: Alison Wang <alison.wang@nxp.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: linux-amlogic@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Stefan Agner <stefan@agner.ch>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Ville Syrjälä (10):
  drm/tilcdc: Allow build without __iowmb()
  drm/tilcdc: Allow build with COMPILE_TEST=y
  drm/armada: Fix printk arguments
  drm/armada: Fix armada_debugfs_crtc_reg_write() return type
  drm/armada: Allow build with COMPILE_TEST=y
  drm/imx/dcss: Fix 64bit divisions
  drm/imx/dcss: Allow build with COMPILE_TEST=y
  drm/fsl-dcu: Allow build with COMPILE_TEST=y
  drm/mediatek: Allow build with COMPILE_TEST=y
  drm/meson: Allow build with COMPILE_TEST=y

 drivers/gpu/drm/armada/Kconfig          | 2 +-
 drivers/gpu/drm/armada/armada_debugfs.c | 2 +-
 drivers/gpu/drm/armada/armada_gem.c     | 2 +-
 drivers/gpu/drm/fsl-dcu/Kconfig         | 2 +-
 drivers/gpu/drm/imx/dcss/Kconfig        | 2 +-
 drivers/gpu/drm/imx/dcss/dcss-scaler.c  | 4 ++--
 drivers/gpu/drm/mediatek/Kconfig        | 4 ++--
 drivers/gpu/drm/meson/Kconfig           | 2 +-
 drivers/gpu/drm/tilcdc/Kconfig          | 2 +-
 drivers/gpu/drm/tilcdc/tilcdc_regs.h    | 3 +++
 10 files changed, 14 insertions(+), 11 deletions(-)

-- 
2.45.2


