Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 334D7CFA77A
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Nov 2025 11:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nwrZWFruCRFVeMkDxpfmhcer5ovY68cuDak2onLke2c=; b=NUH6S2qQi1EDgY
	cvupHtiwyU+xGqdDDoNoQXN0gE9hR5505zUgMyK8MSd+x6Jk9GZWlhQNCu1P5vbbGk0XAnwvalWPD
	NsjncEv/ItVDbk40SJXjaBvTnr93nGwzoC4ay+Ujvf7c71UbpngG8Y/ULaNQc65gixctf6+3FkYIl
	VHizIWziQKLsq9f1ZJ/Ht3PnI6CGi7pFGxtrqCtFH/jzf5qJXHsXOo7hfsEcGTugUXOpW1FthpaoG
	kz2jZksJ6QKwBnSWOZZyRLkay80iOp+aUyKJ75veFL6B7GsOk/sqNkfVMstKwkfh1kSRpeDngX5w/
	Gv666/OUtCHM7mWd+YPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMP8e-00000008I2c-24ao;
	Fri, 21 Nov 2025 11:17:16 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMP8W-00000008Hx5-4Bqg;
	Fri, 21 Nov 2025 11:17:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1763723824;
	bh=wA3DIGO1oIoEB6lNDjSI7psqvT6nGHbhXESVUEEIA40=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GsmEBZNK/JGmCyT5+qAtlnHeG2t25KgjvJH2bwMJ5HAj2gpNPS5P/ZiCybwuPqv2E
	 3gMc0Zjp3/hI8wcQI2rTNyCXgZoXMSfkucWlL61oVP3Qszcy+XBVblhxoyiNJF8EwW
	 jU4VW975yOPu8tEswfx39lR8SnpMwCDZ+YPO9QRP7ZghPdSieBGvTHRzvmK75gITrc
	 zfluu3wECYl1u5bV/G2dRRLBf6cKIC2UKVLjMbYhW16yM1E9S+Dzny0VAqkYoBHYHf
	 2IbO7CYvoLnrZNoAFYrMUfcmCBxR4Pmwc7U/1cGtqcdiLuxajh6HGlD5shl/HivxcH
	 npoPXoSFf7Kjg==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:c4bf:9969:6e1c:dc69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1817617E090D;
	Fri, 21 Nov 2025 12:17:03 +0100 (CET)
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
Subject: [PATCH v4 1/9] dt-bindings: thermal: mediatek: Add LVTS thermal controller support for MT8196
Date: Fri, 21 Nov 2025 12:16:34 +0100
Message-Id: <20251121-mt8196-lvts-v4-v4-1-357f955a3176@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251121-mt8196-lvts-v4-v4-0-357f955a3176@collabora.com>
References: <20251121-mt8196-lvts-v4-v4-0-357f955a3176@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_031709_211926_CB91EBBE 
X-CRM114-Status: UNSURE (   8.73  )
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
Cc: andrew-ct.chen@mediatek.com, lala.lin@mediatek.com, arnd@arndb.de, linux-pm@vger.kernel.org, Laura Nao <laura.nao@collabora.com>, linux-kernel@vger.kernel.org, nfraprado@collabora.com, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, devicetree@vger.kernel.org, u.kleine-koenig@baylibre.com, linux-arm-kernel@lists.infradead.org, wenst@chromium.org, linux-mediatek@lists.infradead.org, kernel@collabora.com, colin.i.king@gmail.com, bchihi@baylibre.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add LVTS thermal controller binding for MediaTek MT8196.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Frank Wunderlich <frank-w@public-files.de>
Signed-off-by: Laura Nao <laura.nao@collabora.com>
---
 .../bindings/thermal/mediatek,lvts-thermal.yaml    |  2 ++
 .../dt-bindings/thermal/mediatek,lvts-thermal.h    | 26 ++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
index 0259cd3ce9c5..beccdabe110b 100644
--- a/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
@@ -26,6 +26,8 @@ properties:
       - mediatek,mt8192-lvts-mcu
       - mediatek,mt8195-lvts-ap
       - mediatek,mt8195-lvts-mcu
+      - mediatek,mt8196-lvts-ap
+      - mediatek,mt8196-lvts-mcu
 
   reg:
     maxItems: 1
diff --git a/include/dt-bindings/thermal/mediatek,lvts-thermal.h b/include/dt-bindings/thermal/mediatek,lvts-thermal.h
index ddc7302a510a..0ec8ad184d47 100644
--- a/include/dt-bindings/thermal/mediatek,lvts-thermal.h
+++ b/include/dt-bindings/thermal/mediatek,lvts-thermal.h
@@ -80,4 +80,30 @@
 #define MT8192_AP_MD1   15
 #define MT8192_AP_MD2   16
 
+#define MT8196_MCU_MEDIUM_CPU6_0        0
+#define MT8196_MCU_MEDIUM_CPU6_1        1
+#define MT8196_MCU_DSU2                 2
+#define MT8196_MCU_DSU3                 3
+#define MT8196_MCU_LITTLE_CPU3          4
+#define MT8196_MCU_LITTLE_CPU0          5
+#define MT8196_MCU_LITTLE_CPU1          6
+#define MT8196_MCU_LITTLE_CPU2          7
+#define MT8196_MCU_MEDIUM_CPU4_0        8
+#define MT8196_MCU_MEDIUM_CPU4_1        9
+#define MT8196_MCU_MEDIUM_CPU5_0        10
+#define MT8196_MCU_MEDIUM_CPU5_1        11
+#define MT8196_MCU_DSU0                 12
+#define MT8196_MCU_DSU1                 13
+#define MT8196_MCU_BIG_CPU7_0           14
+#define MT8196_MCU_BIG_CPU7_1           15
+
+#define MT8196_AP_TOP0                  0
+#define MT8196_AP_TOP1                  1
+#define MT8196_AP_TOP2                  2
+#define MT8196_AP_TOP3                  3
+#define MT8196_AP_BOT0                  4
+#define MT8196_AP_BOT1                  5
+#define MT8196_AP_BOT2                  6
+#define MT8196_AP_BOT3                  7
+
 #endif /* __MEDIATEK_LVTS_DT_H */

-- 
2.39.5

