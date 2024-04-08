Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49DCACD129A
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Apr 2024 17:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XmPBJGngcQkfHoo/y28g53Fu330Ti/7ClsaaYpHpQU8=; b=c38wvkocO0pIqTq7tnUPhB8BLA
	Is5q7jzpp1M/WSWnEMkj8DPfMEgL8VpCdg80fGulF/KBwn1quXurPRWm7ZH5tAPGyVxrQworzS5pD
	mEe027WVC3vdqSJzBILbtu4ZbSgGTp8yaI6ds5453cVsXv3IxuvNgeZic4Qam5m7zGwY//z5Ef0rR
	ix1ROBwT45WzuXFPchqOGnufyGNeBGcQq1nA9jboTKmjUN0Wll0i6VJOrvS1QkwalzJetcvmZ2dXT
	3LdziiAnxZ9f5BadhWO6RlYvzBeLgCc0gia/Cbgm53HmG7eReDAtaXIHoKemS302AqPvpYAXlOtVN
	iaABeKlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtsR4-0000000GI3S-40Lj;
	Mon, 08 Apr 2024 17:05:35 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtsR2-0000000GI1Z-1cih
	for linux-mediatek@lists.infradead.org;
	Mon, 08 Apr 2024 17:05:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712595933; x=1744131933;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=s41Sdv2GSjV1+VTAar/7MoJTxXLUIFIvIg2/MmK9lDo=;
  b=Pi/ApJN3Kb+DNRkM9kFCY/uy+Iyeh7/CG8qPvaRlIpYXKat/OXg4y69h
   7WI/UgNxcDlGExLsTAcBBvkpFBQQuZ63Kh0KUAOwRpOHI4pjUxDeiyIQo
   /88AonL1f+CdbIzRdg09m6j37BPSpgJTRBy1Sch1FWnVWHiZfA/iBqOJC
   RPuafIQcdtii9B/lsnIXAX5s8kqeqJ6m/1lNnp0kEmlMFOud6K+dIDOjf
   KgwQ/PJx9/xLjCPq9cnbGd71lQCVjrylfjNw74+sNvjiN7W02nSncfcSr
   aF7+f7Cj1YJTeKwc9ab0razk7axSsUgQxchHkYFYXHN0kIW7orJDdUc4K
   g==;
X-CSE-ConnectionGUID: HF57/ecyRGC9jc0WjFTImw==
X-CSE-MsgGUID: H3Nt3O30Sai9WtvVgE11Hw==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="7793481"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="7793481"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 10:05:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="827792342"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="827792342"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
  by orsmga001.jf.intel.com with SMTP; 08 Apr 2024 10:05:27 -0700
Received: by stinkbox (sSMTP sendmail emulation); Mon, 08 Apr 2024 20:05:27 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 18/21] drm/mediatek: Allow build with COMPILE_TEST=y
Date: Mon,  8 Apr 2024 20:04:23 +0300
Message-ID: <20240408170426.9285-19-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240408170426.9285-1-ville.syrjala@linux.intel.com>
References: <20240408170426.9285-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_100532_480445_A688FD1A 
X-CRM114-Status: GOOD (  11.86  )
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
index 6caab8d4d4e0..d770936e238b 100644
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
 	select DRM_KMS_HELPER
-- 
2.43.2


