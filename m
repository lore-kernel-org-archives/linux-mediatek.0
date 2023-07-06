Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50768EB64D9
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jul 2023 16:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=59otjIptXpnUt0M/p92qk92flLDN9yzuxkyiqJv73hE=; b=alpbFXvIeWGF/UK9pzL5qdl5F2
	umIf6w9n5xGEliCWzNILa4EMzz2JWSpBYC23bLotJ39u8Jr8bhazFfDRjHr0UXhq838omqPAhcSQ8
	EgrPGVP6eQ3dpsbEy6snVUjoHtHcoDP3hdEq+kFb4RKpL2pSDsr07nLz12FP0LU+5YlIBMphvXT3H
	uxQpOjk6kjW/JbGY7WTgduNno7Vzw8KF/eJ6GX0EBz4eAKwdC28Z/wKOgV2bVu7OQjFC3cftamgIJ
	oIxUnimErNo+2+Jgw1OI2ujOLXUv89ToGDA2AuRro5DUOYWuJ+THBCWrjvdq9krs6bnvPTTkW/d8I
	hIikl3rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHRde-0028Nd-02;
	Thu, 06 Jul 2023 16:15:26 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHRdZ-0028J6-0n;
	Thu, 06 Jul 2023 16:15:22 +0000
Received: from notapiano.myfiosgateway.com (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 45AEE6606FC4;
	Thu,  6 Jul 2023 17:15:15 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1688660118;
	bh=j4Ff8jZjJXo7I/FQ5lBog+vo+xtKrEJKPXvRjQjs67g=;
	h=From:To:Cc:Subject:Date:From;
	b=TvWdYc4hqW5CowqNu/0c/JhbwtCGD3WTQS8ADenSlLyffsiXemx2i1bd/M+y0aGsM
	 IiAcCyioCzgtgKQ5Y184uaTbo+oGie9yuPyJ358Jvv4CsC1OFloX3gcNjepCfSSojE
	 UFr0ciczt0GV+LBORO3oAD3NUv7WdVxXzblawz2jVWpcI8XdB8jlWleB1++VnWTMAc
	 B0B1IOqd8mULvYFHFUdL4VFzetSWz0MU9ui4jGfRHrGZmgrF6/ZaId457ZZgSm2jMh
	 DBh5XGqsG+uruHm2l4UKEIDLBjAY0fCXeZGYBTx8VjhbS6kLE2AmRior76CVCJVOD5
	 5zNVnrqBHkW1g==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	=?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Amit Kucheria <amitk@kernel.org>,
	Balsam CHIHI <bchihi@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH] thermal/drivers/mediatek/lvts_thermal: Make readings valid in filtered mode
Date: Thu,  6 Jul 2023 12:14:33 -0400
Message-ID: <20230706161509.204546-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_091521_488231_E0FAAE31 
X-CRM114-Status: GOOD (  14.20  )
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

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

 drivers/thermal/mediatek/lvts_thermal.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index 1e11defe4f35..b5fb1d8bc3d8 100644
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
 #define LVTS_MONINT_CONF			0x9FBF7BDE
@@ -257,6 +257,7 @@ static int lvts_get_temp(struct thermal_zone_device *tz, int *temp)
 	struct lvts_sensor *lvts_sensor = thermal_zone_device_priv(tz);
 	void __iomem *msr = lvts_sensor->msr;
 	u32 value;
+	int rc;
 
 	/*
 	 * Measurement registers:
@@ -269,7 +270,7 @@ static int lvts_get_temp(struct thermal_zone_device *tz, int *temp)
 	 * 16	: Valid temperature
 	 * 15-0	: Raw temperature
 	 */
-	value = readl(msr);
+	rc = readl_poll_timeout(msr, value, value & BIT(16), 240, 400);
 
 	/*
 	 * As the thermal zone temperature will read before the
@@ -282,7 +283,7 @@ static int lvts_get_temp(struct thermal_zone_device *tz, int *temp)
 	 * functionning temperature and directly jump to a system
 	 * shutdown.
 	 */
-	if (!(value & BIT(16)))
+	if (rc)
 		return -EAGAIN;
 
 	*temp = lvts_raw_to_temp(value & 0xFFFF);
-- 
2.41.0


