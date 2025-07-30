Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D74DC83F26
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jul 2025 15:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4QhqfWOi7Avub4YGpdPmTrKS92Qs1bKnU3KB2baWC+c=; b=ZXFMG7t5pd06B7
	qEqLjL2cKzrp7qRL7/7/WHi/kM7kIAcgEaxfNqhtlm9q/fzpRi1/kgNWD4BsyGaRSjTo4eTHtPpWg
	dn/xpzPoAZWG3hs4STxtw38vLMrHn4rpopCSW3JhMq6c4RfD+i4S2q0MtmiTwVF5Qy8BFna+ZXVg+
	/GI5VXRtXJLDDxewaZa2Ag7+3xDj/mnjPtqWtgIYHcct279FpciOf9EhrYKPpAxZ/KinAs59SKHo/
	nrHJe7gBoeEKHpvb1Z02RM7j6yLvVs2SaBuq7m3ncVRsfWp8lwRs+rfdfwMSGkK3e6DDYRsXpo0ys
	qCXLISw7JpD2LRRhPv2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh8iO-00000001qi0-0cYe;
	Wed, 30 Jul 2025 15:27:36 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh8dR-00000001q1A-2ubh;
	Wed, 30 Jul 2025 15:22:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753888947;
	bh=cPTYsX4JtWbb6aA+SrahhA+I0oaokRqbu1BNrJ3xzRk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ivjxfbL3IgjNp42OxmD6oE5KnRv/CBWH/eOuA71P0MUfPvnWIB4VuWJssWkRHdidK
	 Ygb/XMCAlZJ2Pnnm6Y3Q1+U64V8JbDWM7GyiFpF+ZqbFpsmKxXSgTjhE/DDsknpgFg
	 KY0vyZIxdW/dQPTzJ8sVmUXb7QkgDPPoxlVBap6ekOWGFyzNY3NTTaQNHCTP0bNWPc
	 7yPv7T4s7sy+T+JACLRIOo13cd/5qSWwiTjriNswIAch+DEAq8Mp7t2Vlh3md9cvv/
	 FFwJxO0If3QNurjnZLamNeukOZpMRtD0RqZjbXg2xYGERUPGg250jvNll8Ka7TGKrF
	 ++YHwDHTJ2iNg==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:41d5:bfd6:7c6f:85ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7E72417E130E;
	Wed, 30 Jul 2025 17:22:26 +0200 (CEST)
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
Subject: [PATCH v2 1/9] dt-bindings: thermal: mediatek: Add LVTS thermal controller support for MT8196
Date: Wed, 30 Jul 2025 17:21:20 +0200
Message-Id: <20250730152128.311109-2-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250730152128.311109-1-laura.nao@collabora.com>
References: <20250730152128.311109-1-laura.nao@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_082229_876501_3EE88EB6 
X-CRM114-Status: UNSURE (   8.72  )
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
Cc: andrew-ct.chen@mediatek.com, kernel@collabora.com, nfraprado@collabora.com, arnd@arndb.de, linux-pm@vger.kernel.org, Laura Nao <laura.nao@collabora.com>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, devicetree@vger.kernel.org, u.kleine-koenig@baylibre.com, linux-arm-kernel@lists.infradead.org, wenst@chromium.org, linux-mediatek@lists.infradead.org, bchihi@baylibre.com, colin.i.king@gmail.com, lala.lin@mediatek.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add LVTS thermal controller binding for MediaTek MT8196.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Laura Nao <laura.nao@collabora.com>
---
 .../thermal/mediatek,lvts-thermal.yaml        |  2 ++
 .../thermal/mediatek,lvts-thermal.h           | 26 +++++++++++++++++++
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


