Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B2B7EEAA4E
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Sep 2023 15:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Um/SjZ4pzAiGhg6NXq6CSJOaknnO1DgwhyRt+Pqi5pI=; b=Xw2DWA5mCn9YrmRXCQUiJPImpd
	A8DBWYx0AHfSp1mtTXM1i+teV4vyTB8y8igYVYsU6Lb1FIA0OXwfEAWXpYOkQbv0J4XOLSdUxSdwD
	/Y8XFUUoCaxRRxw1CNKz8/rDCqiErSrwcwb/bUMA0Up+/3Rx42QMTk/pK2Eb0oP544y8AWbLPjXL+
	aoWmIs+TNp+TzDeT2yHMD7oMDXFvxXCUcvD7C9JZJbML1ue0E7asHtDW20IAPVG6SX87iorLIqFp2
	Yrsyw3VuVvFV+T3EQdDKl5+T0u+drxuTwEbt0lnTS3ddsD2C5mwmgF8pCxmlLdlVT6p+WouE57fW7
	JISVyEDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgoer-008q1y-12;
	Thu, 14 Sep 2023 15:53:33 +0000
Received: from mgamail.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgoeo-008q0l-02;
	Thu, 14 Sep 2023 15:53:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694706809; x=1726242809;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+Iq4mvDCPkc5NX/TTMSnD5WIVQgpzL/9/gki1RmIoCo=;
  b=VAi7ornknxMLNECRcAGTdzzbxudZqn8CS90eHfhHImfCXYr1AaVukvgo
   sTV96zxaupu0PvnjHP7XWX3my9gWlHqIARHQibV9JaSIGkw0AHvuwpde3
   hkx+Q2wb0vme0b6wo+IxMYtCOQgU7pQAERaFL6Df8rWx/1+N6zz21J8te
   dqJOLYsHAjy8mceRolYwNfrFyG3bQRdu76czSntKqXogT2H43s6B/nr9g
   w5qxis+KS0M6+9BaA2R99mgSJVrMe6p35sTpeGCgbXnF4s3YmtB3UucIv
   xqedwJn4PUe2xRQvhR4XlGCG/tqPPqE1RJSCUADpGS+8vI6velUJLOFar
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="382809806"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; 
   d="scan'208";a="382809806"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 08:53:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="991445022"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; 
   d="scan'208";a="991445022"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.162])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 08:53:23 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Jani Nikula <jani.nikula@intel.com>,
	dri-devel@lists.freedesktop.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Guillaume Ranquet <granquet@baylibre.com>,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Markus Schneider-Pargmann <msp@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Bo-Chen Chen <rex-bc.chen@mediatek.com>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH] drm/mediatek/dp: fix memory leak on ->get_edid callback audio detection
Date: Thu, 14 Sep 2023 18:53:17 +0300
Message-Id: <20230914155317.2511876-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230914131058.2472260-1-jani.nikula@intel.com>
References: <20230914131058.2472260-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_085330_086679_8CDD410F 
X-CRM114-Status: GOOD (  12.55  )
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

The sads returned by drm_edid_to_sad() needs to be freed.

Fixes: e71a8ebbe086 ("drm/mediatek: dp: Audio support for MT8195")
Cc: Guillaume Ranquet <granquet@baylibre.com>
Cc: Bo-Chen Chen <rex-bc.chen@mediatek.com>
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

Found another one. UNTESTED.
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 8fc6eff68e30..0e285df6577e 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -2034,7 +2034,6 @@ static struct edid *mtk_dp_get_edid(struct drm_bridge *bridge,
 	bool enabled = mtk_dp->enabled;
 	struct edid *new_edid = NULL;
 	struct mtk_dp_audio_cfg *audio_caps = &mtk_dp->info.audio_cur_cfg;
-	struct cea_sad *sads;
 
 	if (!enabled) {
 		drm_atomic_bridge_chain_pre_enable(bridge, connector->state->state);
@@ -2054,7 +2053,11 @@ static struct edid *mtk_dp_get_edid(struct drm_bridge *bridge,
 	}
 
 	if (new_edid) {
+		struct cea_sad *sads;
+
 		audio_caps->sad_count = drm_edid_to_sad(new_edid, &sads);
+		kfree(sads);
+
 		audio_caps->detect_monitor = drm_detect_monitor_audio(new_edid);
 	}
 
-- 
2.39.2


