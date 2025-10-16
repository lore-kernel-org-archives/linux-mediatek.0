Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAA7ECCD195
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Oct 2025 14:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zeidlvP9hS0pf+wH1BH4wQMIC5ia2tLKRYKwTV4U4vE=; b=aeqYytvyrUsYAM
	QWu7qCqwNqm2kMDFrf5/6WY/NWIX91CrpNxDuLn5Klzkh02mOR6Z0E7AMnc9xucGyF7MdPBSYxyGj
	fNQ1xkwopVKQuSzjIum+9BGWRt4dGto6mXKMZtNNBwmXqsbz0y0RI1ojhawtNbdKtSS+b5qL73PZX
	aWd6xz2Lj8AylIHGFYtaO2jDsOyWsCfAn8Ry3uEMNxB+Sbpy3F9ddhQWG9k1mSP12dZbmqX0ZfkK0
	vBCa4O8terukv04Jh78OK1Wkd7LQZTlPjZM5TZUdTnG+FyK42BWpstqEdS4uKk5i7xLq5FJZN7WTd
	cCM55pMLq+5fvMPDpvDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Osi-00000004ygt-0Qhr;
	Thu, 16 Oct 2025 14:23:04 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9OsT-00000004yRy-2ZTP;
	Thu, 16 Oct 2025 14:22:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760624567;
	bh=HJgqsUhPqd5O/gXRMV+eNJx1cOPKuak3AdTmCh0UBNk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XfsubArnyRiHivfenQ7w8x/ypaLvbCN705lmoU+o5pNioWXx9qaf0bKn55Ht+Vq0n
	 U/n4pTujAPE2vyJT5mN7Lev1aIq/wTU/itvAhdAuj+xcBeJ017fq/Dc5L/KoDJL7B+
	 ijwwaVc8jAC/jthRBtbZtilF24AP7DxfKTlem2vPWclDX80x8/8t93f2k2LHLlqw5G
	 vtt4e8lkJjrYLuzlkDT6CIH07Dx6AIZ0dFhzxsLXOVS/Sn5F6jmU0aMdA89irxi+Ch
	 E053TQs8166kaXHXm2AtsqH+vWxc0yIADc0nqSqr3235cYQmNBSmhuEe2AGbReQEPc
	 2/iu/gI3U1iew==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:655a:5eaa:d2ad:4ee4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6CFED17E14FF;
	Thu, 16 Oct 2025 16:22:46 +0200 (CEST)
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
Subject: [PATCH RESEND v3 5/9] thermal/drivers/mediatek/lvts: Add lvts_temp_to_raw variant
Date: Thu, 16 Oct 2025 16:21:54 +0200
Message-Id: <20251016142158.740242-6-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251016142158.740242-1-laura.nao@collabora.com>
References: <20251016142158.740242-1-laura.nao@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_072249_981518_C6F76EA0 
X-CRM114-Status: UNSURE (   9.30  )
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
Cc: andrew-ct.chen@mediatek.com, lala.lin@mediatek.com, arnd@arndb.de, linux-pm@vger.kernel.org, Laura Nao <laura.nao@collabora.com>, linux-kernel@vger.kernel.org, nfraprado@collabora.com, devicetree@vger.kernel.org, u.kleine-koenig@baylibre.com, linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>, linux-mediatek@lists.infradead.org, kernel@collabora.com, colin.i.king@gmail.com, bchihi@baylibre.com
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
Signed-off-by: Laura Nao <laura.nao@collabora.com>
---
 drivers/thermal/mediatek/lvts_thermal.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index df1c0f059ad0..31796a5b8858 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -300,6 +300,18 @@ static u32 lvts_temp_to_raw(int temperature, int temp_factor)
 	return div_s64(raw_temp, -temp_factor);
 }
 
+static u32 lvts_temp_to_raw_v2(int temperature, int temp_factor)
+{
+	u32 raw_temp;
+
+	if (temp_factor == 0)
+		return temperature;
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


