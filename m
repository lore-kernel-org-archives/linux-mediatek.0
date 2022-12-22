Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E35DC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Dec 2022 15:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3YL+0SwnDHknhzgQ6pp7N/msITpVHvl3kQk+99TtRW4=; b=bOj4dtTReooX+hAKfoU9Y+6oeJ
	RLPVHIMdoOhjDmaeocVjfU+nb13YfPUDnHzZi6SJotHOATD72w2UNHRDD6+VRAHHKmiOxcX/k71zm
	sXQdusSgQ4uRSK+0Rbq5SMlbUcItdUmnugzAN7V43w42vcO+n3cIOPWlTgn3FTSXQ9acT628CyIjY
	wrqw+EqpibOOaNcKTcFcdWWosrRcCXdO+uxF9STMnZcX/YgMGp+x8q6cOaxPdDB4B2t3RygcL9ZuP
	J0hTprc14HPOZX3l9emVRIuwaV8cExc1WJu/D/j3dNKGWJJlg27CewVU6IYi6vXWU1bCVbxpxRVTv
	WgjlxgUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8NtI-00Dk3O-Oy; Thu, 22 Dec 2022 15:53:52 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8NrR-00Divo-Eh; Thu, 22 Dec 2022 15:51:59 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 857476602CD9;
	Thu, 22 Dec 2022 15:51:52 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1671724313;
	bh=3eFP3ouO4RR+WchS8C8yL39f+/y+XVsgL/MqIts3FDc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Jmn7DTnB6taOrn7Lgc1s7bisSM8rGmZg+9wCyG6xOnmnAfnAfUufSjnmFmA/pO2ZV
	 zghc1NF0SRNEWdHLrxle/LWYjoOZJhELJpRrMu2Pzq8BuLUCq0aa55PKg+z6NrVtPl
	 wUuQiZAf0A32WnoygbMmq9YmWwuy+ntyZkJMQeJcm+nqAtktYOIc2NXmB5vSA6BIqS
	 VrXUGOidpRoTPs0Ve0OVCkE19B4xQJg1LN0TkxL70a44F45IGxwke1IcMIJwXm+Cth
	 LXqzMTm+RgsTQ+XSlxa6E/UbL9yo1D8EsLcgxv3iqB2DBZaMJh2lcqlcPYKJqtgWC4
	 xv4QW+8NF8k/A==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: mturquette@baylibre.com
Cc: sboyd@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	edward-jw.yang@mediatek.com,
	johnson.wang@mediatek.com,
	wenst@chromium.org,
	miles.chen@mediatek.com,
	chun-jie.chen@mediatek.com,
	rex-bc.chen@mediatek.com,
	jose.exposito89@gmail.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v1 2/6] dt-bindings: clock: mediatek,mt8186-fhctl: Support MT6795, MT8173/92/95
Date: Thu, 22 Dec 2022 16:51:43 +0100
Message-Id: <20221222155147.158837-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221222155147.158837-1-angelogioacchino.delregno@collabora.com>
References: <20221222155147.158837-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_075157_768281_4F90754B 
X-CRM114-Status: UNSURE (   7.51  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

MT6795, MT8173, MT8192 and MT8195 support Frequency Hopping: add the
compatibles for them.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/clock/mediatek,mt8186-fhctl.yaml   | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8186-fhctl.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8186-fhctl.yaml
index cfd042ac1e14..d00327d12e1e 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,mt8186-fhctl.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt8186-fhctl.yaml
@@ -16,7 +16,12 @@ description: |
 
 properties:
   compatible:
-    const: mediatek,mt8186-fhctl
+    enum:
+      - mediatek,mt6795-fhctl
+      - mediatek,mt8173-fhctl
+      - mediatek,mt8186-fhctl
+      - mediatek,mt8192-fhctl
+      - mediatek,mt8195-fhctl
 
   reg:
     maxItems: 1
-- 
2.39.0


