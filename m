Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF839CF857C
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Oct 2024 11:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wuUwlPaiyUoJHkHvoihVq0spD14lhXdcPWIWnLpUedI=; b=VpslvVZEgN+2+9XA2Ok8NbI+u+
	ELwvWAcwvaFdMF3Ki/Itlmq0KpLj6u0fT0DDtJxc4lwtO/L5D0xQ3X/W8SReYWF2uZZa/K7JJ9Muk
	qql77z79gnUhnyWb93NrpBBbQoIM/ttYGwxbgrONorTR5i+tAvw3R4rt5ZMywpJ6plzjYqs7WVX/I
	+qMuwv6acFAK6P2+tcXK0BRfngB/3t/h+lhVEAcsUQtRAts3w7i+t03QBRA9kkiRX2n3XdXnEvHJm
	BGLBXj8pVBMc8zlBMIS7scRCo/6IHigNDcw9IoHhv17ldhURtaae7btVeU4uCRXEeWMU9cHMxAA7b
	g/Uvo4pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swJsO-00000008tHA-2hW1;
	Thu, 03 Oct 2024 11:20:08 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swJrg-00000008t50-2dx7
	for linux-mediatek@lists.infradead.org;
	Thu, 03 Oct 2024 11:19:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727954364; x=1759490364;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=w4FuzTyDGreS0szixpBegUWK/7yzbqINFYrMt9HjXBE=;
  b=KRiOZAtXQ3jw5/MP4jgV3ZV4agXwPG2tsfFSZidLobZrko4jQhH/20iy
   0D1MYm42iz2AwnV5+Rz+fSaLkc0By18VOWvrIR4PdpnMajThO/5yizxFN
   gUZch5Lf6dKT5QDe4lta05Ildd0jRXXooEL1UeiGTuImB6sWyMZ7no3wy
   jyzaD7LPv/vWboSNbrBNLN+DO+Ze31Q1BsgSRDzEtonPnLiIGH6ndzpsD
   d0DR1Ms8QlGsvZsOQ/8QwGtb0DUsWIYEX3s8V2qQMLtDH1ARy1OZyIaOx
   PR+8wWeiJLEfx4Bz0GZR88oFIz3uNsqSnXEJAbpT6FNjuzZl6ry2BSaoE
   g==;
X-CSE-ConnectionGUID: uYbi22hbSwGsyyfP4KUowA==
X-CSE-MsgGUID: r/ORi5y6STW5kM1N3Ckz9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="27013024"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="27013024"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 04:19:24 -0700
X-CSE-ConnectionGUID: n+jyGRUXQiylc0o9f28Znw==
X-CSE-MsgGUID: pL+u723oSLui50F3+/MfPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="74423820"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
  by fmviesa008.fm.intel.com with SMTP; 03 Oct 2024 04:19:21 -0700
Received: by stinkbox (sSMTP sendmail emulation); Thu, 03 Oct 2024 14:19:20 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 09/10] drm/mediatek: Allow build with COMPILE_TEST=y
Date: Thu,  3 Oct 2024 14:18:50 +0300
Message-ID: <20241003111851.10453-10-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241003111851.10453-1-ville.syrjala@linux.intel.com>
References: <20241003111851.10453-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_041924_733518_7AEAD3E6 
X-CRM114-Status: GOOD (  10.82  )
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

Allow mediatek to be built with COMPILE_TEST=y for greater
coverage. Builds fine on x86/x86_64 at least.

Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-mediatek@lists.infradead.org
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/mediatek/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/Kconfig
index 3d2436272ff2..2e0e7c4079b6 100644
--- a/drivers/gpu/drm/mediatek/Kconfig
+++ b/drivers/gpu/drm/mediatek/Kconfig
@@ -2,9 +2,9 @@
 config DRM_MEDIATEK
 	tristate "DRM Support for Mediatek SoCs"
 	depends on DRM
-	depends on ARCH_MEDIATEK || (ARM && COMPILE_TEST)
+	depends on (ARCH_MEDIATEK && ARM) || COMPILE_TEST
 	depends on COMMON_CLK
-	depends on HAVE_ARM_SMCCC
+	depends on HAVE_ARM_SMCCC || COMPILE_TEST
 	depends on OF
 	depends on MTK_MMSYS
 	select DRM_CLIENT_SELECTION
-- 
2.45.2


