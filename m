Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D5D3C77B75
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 May 2023 00:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uISMcfItksDJnkYB8GQbrMA3BsuwGo1DkXUxyS6B2io=; b=tkagsvnYm8ZFpgeJSPIipfKCDV
	/0WTPgkwyPFabLUggssf60QA43vtOKDsgs6D5TbZkCLewsI9FDWCt4TTox0V+B2lwbSsYLyzP2hXZ
	OCC2x3pKjf61DtAlCvH03chwInGwz8J3Y+QrKIunNdgSUMgLeslxtJecHmd+l5ZDERl6TPAeAl3Kn
	IMuT58Eeh6KzkLnfZ9hiB5bbt+C2gl2qEIkM9uQ/A89ICQefRA38npNYL+JLV6vOkHlf3orONM1so
	nFbebB+3cauMN3RJXcejMVxxYLOIxdjD1VkVZw4FMk+A2TVbOChsyiw5jB8x8YR+xqq9ZZZK7nwbd
	8ijKEZng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puN9r-006Cns-2W;
	Thu, 04 May 2023 00:49:19 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puN9j-006Che-0k;
	Thu, 04 May 2023 00:49:12 +0000
Received: from notapiano.myfiosgateway.com (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6F95066056D2;
	Thu,  4 May 2023 01:49:08 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1683161350;
	bh=6J6LMnKpHiGqfs9BHMBviwpoqYtRSSctQEOfYYuBIvE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZbTkggtm998jC6/iaKX1i1wb0W5Bj+rTrttzGDfK8si+eszoYOCmA/xuNOiQv7N5O
	 ERQjUNd7NEnlcXce0kiTxTAuYTvOkx2dHQ45slzenpKFzb5GDpNusFIfFXK2WVUjh+
	 7GrLr2VJYbrEq35+qaZ9vsArI2Ea5sEaBW1sQp3MumrbS5fQCZv5b+pf8DEJ1HADIA
	 MlkFV1iAYgPCheENbkGzN9sOm9nu96XoasmQTWcreUY16YlHyx1OVMH9/wopTuBCRY
	 +9GSDjZpLWE6eCU1xkfRHwnXWbZcsHu4LIvzIlh1ez8SO/17Axv6EDxYyx40VUCArF
	 m0z1KNUaEwcyA==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: kernel@collabora.com,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Balsam CHIHI <bchihi@baylibre.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Alexandre Bailon <abailon@baylibre.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Amit Kucheria <amitk@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v2 5/6] thermal/drivers/mediatek/lvts_thermal: Don't leave threshold zeroed
Date: Wed,  3 May 2023 20:48:51 -0400
Message-Id: <20230504004852.627049-6-nfraprado@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230504004852.627049-1-nfraprado@collabora.com>
References: <20230504004852.627049-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230503_174911_397125_1466D96A 
X-CRM114-Status: GOOD (  13.27  )
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

The thermal framework might leave the low threshold unset if there
aren't any lower trip points. This leaves the register zeroed, which
translates to a very high temperature for the low threshold. The
interrupt for this threshold is then immediately triggered, and the
state machine gets stuck, preventing any other temperature monitoring
interrupts to ever trigger.

(The same happens by not setting the Cold or Hot to Normal thresholds
when using those)

Set the unused threshold to a valid low value. This value was chosen so
that for any valid golden temperature read from the efuse, when the
value is converted to raw and back again to milliCelsius, the result
doesn't underflow.

Fixes: f5f633b18234 ("thermal/drivers/mediatek: Add the Low Voltage Thermal Sensor driver")
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

Changes in v2:
- Added this commit

 drivers/thermal/mediatek/lvts_thermal.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index efd1e938e1c2..951a4cb75ef6 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -82,6 +82,8 @@
 #define LVTS_HW_SHUTDOWN_MT8195		105000
 #define LVTS_HW_SHUTDOWN_MT8192		105000
 
+#define LVTS_MINIUM_THRESHOLD		20000
+
 static int golden_temp = LVTS_GOLDEN_TEMP_DEFAULT;
 static int coeff_b = LVTS_COEFF_B;
 
@@ -309,6 +311,11 @@ static int lvts_set_trips(struct thermal_zone_device *tz, int low, int high)
 		pr_debug("%s: Setting low limit temperature interrupt: %d\n",
 			 thermal_zone_device_type(tz), low);
 		writel(raw_low, LVTS_OFFSETL(base));
+	} else {
+		pr_debug("%s: Setting low limit temperature to minimum\n",
+			 thermal_zone_device_type(tz));
+		raw_low = lvts_temp_to_raw(LVTS_MINIUM_THRESHOLD);
+		writel(raw_low, LVTS_OFFSETL(base));
 	}
 
 	/*
-- 
2.40.1


