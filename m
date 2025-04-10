Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A72D7C3601E
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Apr 2025 07:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6DooyLKKYj3wKO7vJaSrsdZC2t9Wx01KgJ5YQqX5GS4=; b=bbYU6vQ5uIfsLwinZZ6ubKacyb
	sHgky0bls/kfTF+IMjIfPkAdOmHq3J7RMGqC8bxbo14HLFkDUiWKH3Fei6Yk1Beb6eD4zsqju+43Z
	rGBrGIgJIOsR6J7rLlks0SUuYV6dpMTPpWHqSgG3lx9uTqV2gp9WVsez8k5Dhc7fX1408xRr0KnOj
	nTmPangksj8UMTfbu3NGic9CyM11WzTN7u5BMtNZ13pP3gbCvJDVNu28gHZGi3U7fRMFEm/sAJQkd
	qAQlNzfh4y0z+19yI4Rh2y3IK/kdcQC9urVoW2DpECsR8bP5GzNN0k0EiCGLoLOrOr2ZhRKSnAvGB
	ENC4sNnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2mbX-00000009cBX-3ACJ;
	Thu, 10 Apr 2025 07:45:43 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2lzn-00000009TQV-1BuE;
	Thu, 10 Apr 2025 07:06:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744268803; x=1775804803;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eTuV2CyB5vjAJ0CZ1BcbW4eb89Fsn/ZCIyYBD5yo6Ow=;
  b=YaK6mTkxeFIznD1IS58l51Y2krecFKZcNKwVGZ6BV+QBTRMLUgzxz0fc
   3xJblumxzt7jPmD3PezAEllZGEy/08yZEOgRKYEQU8FzRXlNVzlTv6/gO
   nEJYT4FwaaH1BOYNRBZu4Wr3vk0geKuOJSWU72zyphh/lJl4qIbKQcn8i
   YkHjP2lwtI0DXqfi/0RBysp9SHA5H6o0/LLf7EUex19pGOcVD2MEzccBI
   BhfXbAwSruWnnhkvkB4cwpB6W+EycKbOTP/Fx6YgNL6tTQ++reEjFFUdr
   GV558wJFv5zEQOv5L/GyMTO6r+xBiaHrsYyUBfq/n/jDlEVHLTcLBaeOL
   w==;
X-CSE-ConnectionGUID: nVumitD0TdO3auYsD/LwJA==
X-CSE-MsgGUID: giUP06k1THCtMIiL+/y53A==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="45484815"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="45484815"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 00:06:40 -0700
X-CSE-ConnectionGUID: /9qgZoukRT2V3k+E473utg==
X-CSE-MsgGUID: eCd3L+qyRjqOTOU2EOJUdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="128791505"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 00:06:36 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id B0BBE1203B9;
	Thu, 10 Apr 2025 10:06:33 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1u2lzd-00FQTF-2I;
	Thu, 10 Apr 2025 10:06:33 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-crypto@vger.kernel.org
Cc: Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH 3/3] hwrng: npcm - Add a local variable for struct device pointer
Date: Thu, 10 Apr 2025 10:06:23 +0300
Message-Id: <20250410070623.3676647-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250410070623.3676647-1-sakari.ailus@linux.intel.com>
References: <20250410070623.3676647-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_000643_405455_3E1AB3EB 
X-CRM114-Status: GOOD (  11.40  )
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

Add a local variable for a struct device pointer instead of obtaining the
hwrng priv field and casting it as a struct device pointer whenever it's
needed.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/char/hw_random/npcm-rng.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/char/hw_random/npcm-rng.c b/drivers/char/hw_random/npcm-rng.c
index 9ff00f096f38..beec96391af7 100644
--- a/drivers/char/hw_random/npcm-rng.c
+++ b/drivers/char/hw_random/npcm-rng.c
@@ -54,10 +54,11 @@ static void npcm_rng_cleanup(struct hwrng *rng)
 static int npcm_rng_read(struct hwrng *rng, void *buf, size_t max, bool wait)
 {
 	struct npcm_rng *priv = to_npcm_rng(rng);
+	struct device *dev = (struct device *)priv->rng.priv
 	int retval = 0;
 	int ready;
 
-	pm_runtime_get_sync((struct device *)priv->rng.priv);
+	pm_runtime_get_sync(dev);
 
 	while (max) {
 		if (wait) {
@@ -79,8 +80,8 @@ static int npcm_rng_read(struct hwrng *rng, void *buf, size_t max, bool wait)
 		max--;
 	}
 
-	pm_runtime_mark_last_busy((struct device *)priv->rng.priv);
-	pm_runtime_put_sync_autosuspend((struct device *)priv->rng.priv);
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_sync_autosuspend(dev);
 
 	return retval || !wait ? retval : -EIO;
 }
-- 
2.39.5


