Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C05C83F26
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jul 2025 15:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xij2vp2UUU1kYgs70rV8ESVzgyZ+2SJKVeJgzRq1pD8=; b=uAdFdOunBOh10W
	mK5FGXlKuz/ZA8NuGhDGLVrl/r4bVKgpG0H3BeFpo1Xex1rTl/tFcNCzSe1wEuxKp92x8syNkoio6
	g90y7pWlErJ85juVJU04oK/4G/vUjnCyyHMVsdJ38ncaGjH/VeCr1c2xZV4DA6bDSYfu487zyXa+Y
	39qNiTLcrs2n8dLVL85+LbDZao60aAZttwf8hTWZ0GWvusj3EMYkRQ3oecOq0UGir8gwMcIDXVyGI
	lPhTKSLqOHEIqQXQmAYDSN4gDS/VCg4uXmp2oK0NkbRzV1oLGbYjmO4qKA7fSB+NxpZdsni0x+CsF
	vTfjy9AUETdDNo5ZKrkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh8nI-00000001r6M-2W05;
	Wed, 30 Jul 2025 15:32:40 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh8dU-00000001q1u-1whc;
	Wed, 30 Jul 2025 15:22:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753888951;
	bh=GW/BPiYjncxQwEBduf0J/LKc1ZtAsAwkTe1rH5ofBvE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eKjOP4Zeo1MxPIQU/3t4rWGt9Y3D6+fasAxX5RlFQwM5a1HjbAqRGZEdTCAhLjq1w
	 4BdpRGgWIz5WppsiLjEv4JGNf0a5ly0RqZQX5H2tq4PoQnbbveuzUNAeHwuqY9vsX5
	 OIq09nVa90ENFM6JiCXTTYXyMQ+xo8T84KYrhOasyBbt+yNmzJJALvr3ZFxX/yHybL
	 AuVgKFFcdgTR5XM9H95LJr9tdI7OXFPXnAHn9O7Z6ra3xuh9w7AbzP14ZUNeK+dh4u
	 3AoPq0lAMf3zGLwRXGODadFxMTlSTia8mGUzHzM/AGNoxU06Rp8gIgwdX/rrD0Dz5l
	 jr2/M9FvdLNcw==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:41d5:bfd6:7c6f:85ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B5F5E17E1511;
	Wed, 30 Jul 2025 17:22:29 +0200 (CEST)
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
Subject: [PATCH v2 3/9] thermal/drivers/mediatek/lvts: Guard against zero temp_factor in lvts_raw_to_temp
Date: Wed, 30 Jul 2025 17:21:22 +0200
Message-Id: <20250730152128.311109-4-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250730152128.311109-1-laura.nao@collabora.com>
References: <20250730152128.311109-1-laura.nao@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_082232_644264_CC049CB8 
X-CRM114-Status: GOOD (  11.27  )
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
Cc: andrew-ct.chen@mediatek.com, kernel@collabora.com, nfraprado@collabora.com, arnd@arndb.de, linux-pm@vger.kernel.org, Laura Nao <laura.nao@collabora.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, u.kleine-koenig@baylibre.com, linux-arm-kernel@lists.infradead.org, wenst@chromium.org, linux-mediatek@lists.infradead.org, bchihi@baylibre.com, colin.i.king@gmail.com, lala.lin@mediatek.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add a guard against zero temp_factor in lvts_raw_to_temp() to prevent
division by zero and ensure safe conversion.

Fixes: 6725a29321e4 ("thermal/drivers/mediatek/lvts_thermal: Make coeff configurable")
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Signed-off-by: Laura Nao <laura.nao@collabora.com>
---
 drivers/thermal/mediatek/lvts_thermal.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index 05aa8895ccce..8398af657ba2 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -284,11 +284,14 @@ static int lvts_raw_to_temp(u32 raw_temp, int temp_factor)
 
 static u32 lvts_temp_to_raw(int temperature, int temp_factor)
 {
-	u32 raw_temp = ((s64)(golden_temp_offset - temperature)) << 14;
+	u32 raw_temp;
 
-	raw_temp = div_s64(raw_temp, -temp_factor);
+	if (temp_factor == 0)
+		return temperature;
 
-	return raw_temp;
+	raw_temp = ((s64)(golden_temp_offset - temperature)) << 14;
+
+	return div_s64(raw_temp, -temp_factor);
 }
 
 static int lvts_get_temp(struct thermal_zone_device *tz, int *temp)
@@ -1346,6 +1349,9 @@ static int lvts_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
+	if (!lvts_data->temp_factor)
+		dev_warn(dev, "temp_factor should never be zero; check platform data.\n");
+
 	golden_temp_offset = lvts_data->temp_offset;
 
 	ret = lvts_domain_init(dev, lvts_td, lvts_data);
-- 
2.39.5


