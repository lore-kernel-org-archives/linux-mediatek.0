Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 845EECCD1A5
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Oct 2025 12:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ho+w8/wSlfCk13S0AyROefe1juINq8GVHtpVrKG2OZs=; b=n/04AEbQhF0KMm
	DV21YOq8YfuIgpQD7XTq7zB0sjJzf7UeQ07rzLim7HLtaT3lZQ6gEqK6vk6x131WcULPjQJstMoqx
	gXbMOUAb/WQj/mYRdIOF2jeRtiCPenASGIb1NyRjeYFHx125P4Rv7Sb9egaraz2C7G7E/mKbvHysv
	ub4h33jTjEq+VXpt9M9agqDBDSPdZ0RVYXWxyHCvX/E9zyCRs+mD4OFuT7RuEhqHChF3U49asFkBG
	D3n92omXvZN37pz1AAjdXAF3xGddauAFtcHyA30u4INnmoSn69odN295rn8S23jq3BFDiMJ6PRfES
	GG04gYKYFi+3LmqID5yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCzlG-0000000CJC6-10sr;
	Sun, 26 Oct 2025 12:22:14 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCzlC-0000000CJ8C-0uCE;
	Sun, 26 Oct 2025 12:22:12 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout2.routing.net (Postfix) with ESMTP id 34C575FE3B;
	Sun, 26 Oct 2025 12:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1761481325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ho+w8/wSlfCk13S0AyROefe1juINq8GVHtpVrKG2OZs=;
	b=nVr8C+Vn+KAo+Bd+a4p465nQp0MfJnNckoX0+J3zBPfUZ6730yJqjkPXPOg0gVrNqSd9BL
	lUDlXaRy/xNHuOhNc/qQni2AWjgh+izzFJKxFSbygcy92F83hU7sXkgqz29unsA5hvsHp8
	offO6xk3GadQLvRKQsoHWPjvUBrLfVc=
Received: from frank-u24.. (fttx-pool-217.61.154.70.bambit.de [217.61.154.70])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id E847A122700;
	Sun, 26 Oct 2025 12:22:04 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v1 2/5] dt-bindings: thermal: mediatek: Add LVTS thermal controller definition for MT7987
Date: Sun, 26 Oct 2025 13:21:31 +0100
Message-ID: <20251026122143.71100-3-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251026122143.71100-1-linux@fw-web.de>
References: <20251026122143.71100-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_052210_504459_A7B29E87 
X-CRM114-Status: UNSURE (   8.37  )
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
Cc: devicetree@vger.kernel.org, Mason Chang <mason-cw.chang@mediatek.com>, =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Balsam CHIHI <bchihi@baylibre.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Add thermal controller definition for MT7987.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 .../devicetree/bindings/thermal/mediatek,lvts-thermal.yaml     | 1 +
 include/dt-bindings/thermal/mediatek,lvts-thermal.h            | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
index 7ec9c46eef22..13e948a2a909 100644
--- a/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
@@ -18,6 +18,7 @@ description: |
 properties:
   compatible:
     enum:
+      - mediatek,mt7987-lvts-ap
       - mediatek,mt7988-lvts-ap
       - mediatek,mt8186-lvts
       - mediatek,mt8188-lvts-ap
diff --git a/include/dt-bindings/thermal/mediatek,lvts-thermal.h b/include/dt-bindings/thermal/mediatek,lvts-thermal.h
index ddc7302a510a..e9780edcd26c 100644
--- a/include/dt-bindings/thermal/mediatek,lvts-thermal.h
+++ b/include/dt-bindings/thermal/mediatek,lvts-thermal.h
@@ -7,6 +7,9 @@
 #ifndef __MEDIATEK_LVTS_DT_H
 #define __MEDIATEK_LVTS_DT_H
 
+#define MT7987_CPU		0
+#define MT7987_ETH2P5G		1
+
 #define MT7988_CPU_0		0
 #define MT7988_CPU_1		1
 #define MT7988_ETH2P5G_0	2
-- 
2.43.0


