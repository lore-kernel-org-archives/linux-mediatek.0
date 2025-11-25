Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71D5CD0E6F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Nov 2025 16:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BRKL3NHHs2Z4Vn/zxIFm87RKezkaDGYGIl+ZMNTt7Ac=; b=as5/3MXJXIaHHH
	L8U81ybPW3+t+RibZ4drnFN5A0vdEo0a5qUFCGpI/8bosBAolLlMWpnDU/WcnlQsBqsxmpyZDypcd
	Pj5khzlzm97ba6Ri9c9lXtqVB+LdkUDATwNEpBdIIA736rFGMcehhMyYaHzSJ+nuI6Q1B/bK+ljl5
	5pVZQDA+9oOQwXAANGpOJML4udEqU9mnmVfr3/gzLqcWXWPDr+sYzGjDUCKMzXVgCzVtOobzxF0wZ
	xDyE1/okkXCZCC/p/AyZT+kF8qwsqYJSUrw77xWPpVEwiIHBWqoEzZfXGZCDHATtIHGfzMfaBXmBs
	ZJYpB11trZCqv2cba0zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNvji-0000000DZMg-1TBh;
	Tue, 25 Nov 2025 16:17:50 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNvje-0000000DZHR-0Uuc;
	Tue, 25 Nov 2025 16:17:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1764087463;
	bh=zXAXmFln9lKY4IcPOhyXbYN0ZlHQuU+Bqq5haznGK8s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P6ir9ksMovBo2EQJGA6pVNWkJ6MVPHf8iajz6fb5N9jNP1C1DZVd32LZ6MiCvBnC6
	 H5DXe/+7HryU6BsztIHJTHSGF+z208cCKgGwMkLFP0dD92hFuawIgfrD+fHO0JEHYA
	 vSFkSQReb4sEig4iRn4xRNujjZcqBCXj9X/3Nkl23TqPZiP4LPUakZ09m2U0/LTT1M
	 9VcswYTOSGU+dKvFOjzK5LN0l6QQ5+/udHB7krs1qHmarB7jvDijoTnGOaqcI+jRMQ
	 jJzdBCTgUc4j8VuX1U/sIfx74gmLZU2yoJKylm07eFhCJFyKI0uz5Zm/16QXlLRMPU
	 bPt/kbVOR5uTw==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:feae:4183:be92:e051])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C9B7A17E1400;
	Tue, 25 Nov 2025 17:17:41 +0100 (CET)
From: Laura Nao <laura.nao@collabora.com>
To: srini@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rafael@kernel.org,
	daniel.lezcano@linaro.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Subject: [PATCH v5 4/8] thermal/drivers/mediatek/lvts: Add lvts_temp_to_raw variant
Date: Tue, 25 Nov 2025 17:16:54 +0100
Message-Id: <20251125-mt8196-lvts-v4-v5-4-6db7eb903fb7@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251125-mt8196-lvts-v4-v5-0-6db7eb903fb7@collabora.com>
References: <20251125-mt8196-lvts-v4-v5-0-6db7eb903fb7@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_081746_322255_333CB43F 
X-CRM114-Status: UNSURE (   8.69  )
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
Cc: andrew-ct.chen@mediatek.com, Laura Nao <laura.nao@collabora.com>, lala.lin@mediatek.com, arnd@arndb.de, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, nfraprado@collabora.com, devicetree@vger.kernel.org, u.kleine-koenig@baylibre.com, linux-arm-kernel@lists.infradead.org, wenst@chromium.org, linux-mediatek@lists.infradead.org, kernel@collabora.com, colin.i.king@gmail.com, bchihi@baylibre.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

MT8196/MT6991 require a different version of lvts_temp_to_raw(),
specifically the multiplicative inverse of the existing implementation.
Introduce a variant of the function with inverted calculation logic to
match this requirement.

This ensures accurate raw value generation for temperature
thresholds, avoiding spurious thermal interrupts or unintended hardware
resets on MT8196/MT6991.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Fei Shao <fshao@chromium.org>
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Frank Wunderlich <frank-w@public-files.de>
Signed-off-by: Laura Nao <laura.nao@collabora.com>
---
 drivers/thermal/mediatek/lvts_thermal.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index a684f73d3698..e9b9c1c35020 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -308,6 +308,15 @@ static u32 lvts_temp_to_raw_mt7988(int temperature, int temp_factor)
 	return raw_temp;
 }
 
+static u32 lvts_temp_to_raw_mt8196(int temperature, int temp_factor)
+{
+	u32 raw_temp;
+
+	raw_temp = temperature - golden_temp_offset;
+
+	return div_s64((s64)temp_factor << 14, raw_temp);
+}
+
 static int lvts_get_temp(struct thermal_zone_device *tz, int *temp)
 {
 	struct lvts_sensor *lvts_sensor = thermal_zone_device_priv(tz);

-- 
2.39.5

