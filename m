Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 505E2C04ABC
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Sep 2023 17:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EpXyE3pyrLeXOoW/vTn/35mmwMMGT5ciC6Nn0z7I4eI=; b=BPij9P0TdWJa3n
	ejRX+tfmgL2yL4HvAAqCZ2zf1XPgdqxwqCK7NrdeWVUYCYXBDfMcnDdXxrfSM0P6DBQamLllgvgpz
	MDI/Iuf7hWn6drUjQo8upn8tyVYBQFniwC+hqVRzwBQd5O5ZK8tPa32WWXKpKX8WYIgsLGKNSxtND
	6tMUaIypEl3qHO0Ik9abNnlbMW2uiN9NK4aqH6PdPNfpkl4m8FZZDZrPjM9QoS8T3fivg8KCnjB7+
	6FU+h9v2gylOkhLAfUPbHGMDtPvSNKhGai0lm1RvLQ1COHW83yCDPf5PSXDs9pV/54+x0JftdGGSa
	gkjUBD8zF36Xgy9OtaMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qj1L9-003mCY-2V;
	Wed, 20 Sep 2023 17:50:19 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qj1L4-003m9U-1O;
	Wed, 20 Sep 2023 17:50:16 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout2.routing.net (Postfix) with ESMTP id 0817F6035B;
	Wed, 20 Sep 2023 17:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1695232209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EpXyE3pyrLeXOoW/vTn/35mmwMMGT5ciC6Nn0z7I4eI=;
	b=h3BGCFCnFpKrXPsRyyuYxjScEcHuE5yKI+5VscIyM7e7qLus6YOrnwRwLFbkKcXdFMSYQn
	m5hNdJW/WcuqODSErRv/CIL4K5wM4z5EC31U7rZbwkdsTsflW1wyRhE2xZsfc6WNeoDGrl
	G04GkiedV1LYm7WjGhG2R4//uig4pg0=
Received: from frank-G5.. (fttx-pool-217.61.152.105.bambit.de [217.61.152.105])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 3BE701006A2;
	Wed, 20 Sep 2023 17:50:08 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v2 1/4] dt-bindings: thermal: mediatek: add mt7988 lvts compatible
Date: Wed, 20 Sep 2023 19:49:58 +0200
Message-Id: <20230920175001.47563-2-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230920175001.47563-1-linux@fw-web.de>
References: <20230920175001.47563-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 5430aa16-e26a-4aa4-9ee0-76ea05442544
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_105014_752844_26FE7195 
X-CRM114-Status: UNSURE (   9.08  )
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
Cc: devicetree@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org, Amit Kucheria <amitk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Zhang Rui <rui.zhang@intel.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Add compatible string for mt7988 lvts application processor.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
v2:
- change mt7988-lvts to mt7988-lvts-ap (Application Processor)
- not added Ack from Rob because of this change
---
 .../devicetree/bindings/thermal/mediatek,lvts-thermal.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
index fe9ae4c425c0..e6665af52ee6 100644
--- a/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
@@ -18,6 +18,7 @@ description: |
 properties:
   compatible:
     enum:
+      - mediatek,mt7988-lvts-ap
       - mediatek,mt8192-lvts-ap
       - mediatek,mt8192-lvts-mcu
       - mediatek,mt8195-lvts-ap
-- 
2.34.1


