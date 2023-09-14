Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 178D7CA553E
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Sep 2023 13:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AaRGJ1kf12rVln3LsRgrnbnCAaf0LvAvi5fzIfjrvRg=; b=BF4QzsOmX1UBRTdUu2c5ZWOMwG
	d/sYw6mFQDxFqdGhCM0CoMZDVVPEi9lzW7bhOYvHK0X2YbiVz0O5bOQL7PUH++JliJQlg6wnV5xwI
	x7vslZquKOVgrXkkrSRQ+q/DwMZAX7kllDgvUZl+LDr5Um7hemc4KPsgJGBzzukVfB3B9byP/W7zd
	HA6T7Dcn4zCFdTDYC3qQYbRhNnd7kDX8c/rYmdh+ru5lGHSvthQJV+yPGEnziEyjXnwf6Bjn30vbg
	/RaJnA/78eXH8N6wCaCnfAxNR336yV934wXyC/BmaRNGCylbzyF9ZiRhkr1jX7adyi2SpO/AUC0HC
	3nFIrhlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmA6-008QRm-0D;
	Thu, 14 Sep 2023 13:13:38 +0000
Received: from mgamail.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgmA2-008QP1-36;
	Thu, 14 Sep 2023 13:13:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694697214; x=1726233214;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7XDGJ0Ht6oXKb4r3a9CM/U+PgCZCGhp2zPWfhO1jsQk=;
  b=hkpGEvvV0Kwo8RSREyw2sbxxW0FEeOH6xXy47O7113Kw89d+sDQEDXmX
   EcQoV96UePqO7OzDFiwAjHfoU1jVsaFoLJawTr4h1S1ArPbWBbFiYujdg
   G5iMglBfyv8uXhtuerSzhqWix/H7Whzk+2+xknUkZT4bwIrJZeJ0f8bDD
   +fr4XFM/W+wjuDEEGa9fCW5FaA0acKbuIFBFCxfoRKgKP4nMeaijqIHkd
   OiQx1sPWzRPNwVa21t7P0dVC0zsmLuKEXIYvNDkfq06hiJiFc+23caFiT
   MlBuZqDu2OVML6b8DQr7ezer5MnEtqGhmYQv4rbiZfpWfy9cO8S23LC3D
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="376281304"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; 
   d="scan'208";a="376281304"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 06:11:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="887801992"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; 
   d="scan'208";a="887801992"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.162])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 06:10:31 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	Markus Schneider-Pargmann <msp@baylibre.com>,
	Guillaume Ranquet <granquet@baylibre.com>,
	Bo-Chen Chen <rex-bc.chen@mediatek.com>,
	CK Hu <ck.hu@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH] drm/mediatek/dp: fix memory leak on ->get_edid callback error path
Date: Thu, 14 Sep 2023 16:10:58 +0300
Message-Id: <20230914131058.2472260-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_061335_007059_79DC2384 
X-CRM114-Status: GOOD (  10.86  )
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

Setting new_edid to NULL leaks the buffer.

Fixes: f70ac097a2cf ("drm/mediatek: Add MT8195 Embedded DisplayPort driver")
Cc: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: Guillaume Ranquet <granquet@baylibre.com>
Cc: Bo-Chen Chen <rex-bc.chen@mediatek.com>
Cc: CK Hu <ck.hu@mediatek.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: <stable@vger.kernel.org> # v6.1+
Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

UNTESTED
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 2cb47f663756..8fc6eff68e30 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -2049,6 +2049,7 @@ static struct edid *mtk_dp_get_edid(struct drm_bridge *bridge,
 	 */
 	if (mtk_dp_parse_capabilities(mtk_dp)) {
 		drm_err(mtk_dp->drm_dev, "Can't parse capabilities\n");
+		kfree(new_edid);
 		new_edid = NULL;
 	}
 
-- 
2.39.2


