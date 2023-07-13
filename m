Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0684AC001B0
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jul 2023 15:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aLi96+fb9uCq1E43GmcixMJ0rY27HeV+DdfRSNCmo1M=; b=esUsX9fzhOisv6hYrR9MWixvqR
	tLi4yKsrphfP1fcDUYLC/AK9ypH+eLblDuVtoavTQ5RjAtk7aN3kYV+FIuQ2tS6alpVSwDZsYIOEj
	Pby8AuMCNF6NMeZ+mwFyYbppMsqngohjK+me1Y7CHr0Y59xFm3Rdgxt0QyNxQYPxD37/9o6ZklqG0
	/ysh/8kygapvcoMrzfzE7VXNPd/ffbO9sK3KhSycOwve2M/sGAhQJ/0vUi+4wAe8UgppEp3FtSW+o
	pjBvPMUkEYGIuEwTpsv0GA8OrIc/aSNtutIkj0lTyZkogFJgS0584Ik/9CFPnPQfLgXX36DpIDVvU
	zYv9lKZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJyXv-003ohs-36;
	Thu, 13 Jul 2023 15:47:59 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJyXs-003ogZ-1E;
	Thu, 13 Jul 2023 15:47:57 +0000
Received: from notapiano.myfiosgateway.com (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 990CB6607048;
	Thu, 13 Jul 2023 16:47:48 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689263270;
	bh=NmZWSJBtJogmZ1XmFkqp7N/SRJ1aRoSmIrbWDGiL4Yo=;
	h=From:To:Cc:Subject:Date:From;
	b=TZMD09Y3AycsOcBdEma+Wp2v2dnejJbZ/jERjnsTI/rEa0iyRmq4hPzm4atzRgWxd
	 4HQWF+/xlBagQDvhN5/5cWQxxuoYvSmZwG5YAh4fEHmA8xdB7Zbx+uEi8AanCl0QhT
	 z4WOQ3o0UCE/l0weymA1twrCVYiDzDkST3X7HXNBV6yBxJP9ILH41reEcLC0gZ7UJs
	 r4szl5NTX/NAOBTuld9nrf0onxW5NsxvjZlybR9O1/p8c4ue1SgjIcwN22fUZrqT6l
	 GoURnubugZo2c62BYcniSpmDY/+m+LK5t0CerzDnDYd1tmbxegBch9dJtvcLwj0B42
	 SoZo5oDDxcFkQ==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	=?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Amit Kucheria <amitk@kernel.org>,
	Balsam CHIHI <bchihi@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Yangtao Li <frank.li@vivo.com>,
	Zhang Rui <rui.zhang@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v2] thermal/drivers/mediatek/lvts_thermal: Make readings valid in filtered mode
Date: Thu, 13 Jul 2023 11:42:37 -0400
Message-ID: <20230713154743.611870-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_084756_597001_3B1BDA36 
X-CRM114-Status: GOOD (  15.65  )
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

Currently, when a controller is configured to use filtered mode, thermal
readings are valid only about 30% of the time.

Upon testing, it was noticed that lowering any of the interval settings
resulted in an improved rate of valid data. The same was observed when
decreasing the number of samples for each sensor (which also results in
quicker measurements).

Retrying the read with a timeout longer than the time it takes to
resample (about 344us with these settings and 4 sensors) also improves
the rate.

Lower all timing settings to the minimum, configure the filtering to
single sample, and poll the measurement register for at least one period
to improve the data validity on filtered mode.  With these changes in
place, out of 100000 reads, a single one failed, ie 99.999% of the data
was valid.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

Changes in v2:
- Added macros for the wait and timeout times (and in the process made the wait
  200us instead of 240us, just to simplify, gives the same result)
- Rebased on thermal/bleeding-edge (since the
  "thermal/drivers/mediatek/lvts_thermal: Fixes to the interrupt handling"
  series was merged)

 drivers/thermal/mediatek/lvts_thermal.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index ea89b29ffe5f..1a3cb118ff32 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -58,11 +58,11 @@
 #define LVTS_PROTTC(__base)		(__base + 0x00CC)
 #define LVTS_CLKEN(__base)		(__base + 0x00E4)
 
-#define LVTS_PERIOD_UNIT			((118 * 1000) / (256 * 38))
-#define LVTS_GROUP_INTERVAL			1
-#define LVTS_FILTER_INTERVAL		1
-#define LVTS_SENSOR_INTERVAL		1
-#define LVTS_HW_FILTER				0x2
+#define LVTS_PERIOD_UNIT			0
+#define LVTS_GROUP_INTERVAL			0
+#define LVTS_FILTER_INTERVAL		0
+#define LVTS_SENSOR_INTERVAL		0
+#define LVTS_HW_FILTER				0x0
 #define LVTS_TSSEL_CONF				0x13121110
 #define LVTS_CALSCALE_CONF			0x300
 #define LVTS_MONINT_CONF			0x8300318C
@@ -86,6 +86,9 @@
 #define LVTS_MSR_IMMEDIATE_MODE		0
 #define LVTS_MSR_FILTERED_MODE		1
 
+#define LVTS_MSR_READ_TIMEOUT_US	400
+#define LVTS_MSR_READ_WAIT_US		(LVTS_MSR_READ_TIMEOUT_US / 2)
+
 #define LVTS_HW_SHUTDOWN_MT8195		105000
 
 #define LVTS_MINIMUM_THRESHOLD		20000
@@ -268,6 +271,7 @@ static int lvts_get_temp(struct thermal_zone_device *tz, int *temp)
 	struct lvts_sensor *lvts_sensor = thermal_zone_device_priv(tz);
 	void __iomem *msr = lvts_sensor->msr;
 	u32 value;
+	int rc;
 
 	/*
 	 * Measurement registers:
@@ -280,7 +284,8 @@ static int lvts_get_temp(struct thermal_zone_device *tz, int *temp)
 	 * 16	: Valid temperature
 	 * 15-0	: Raw temperature
 	 */
-	value = readl(msr);
+	rc = readl_poll_timeout(msr, value, value & BIT(16),
+				LVTS_MSR_READ_WAIT_US, LVTS_MSR_READ_TIMEOUT_US);
 
 	/*
 	 * As the thermal zone temperature will read before the
@@ -293,7 +298,7 @@ static int lvts_get_temp(struct thermal_zone_device *tz, int *temp)
 	 * functionning temperature and directly jump to a system
 	 * shutdown.
 	 */
-	if (!(value & BIT(16)))
+	if (rc)
 		return -EAGAIN;
 
 	*temp = lvts_raw_to_temp(value & 0xFFFF);
-- 
2.41.0


