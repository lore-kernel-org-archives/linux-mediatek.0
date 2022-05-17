Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4402C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 May 2022 10:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9sk3DLgLgCH64AgvZaU3KSHzHE/mYTbDhqFqT2L5cyA=; b=AwB7gtMS+VhPY+
	UZiLlwitp0SlvNf9tYy3ztHYs75uZ5O7ikbhVvfrMVofjFdkWf7drXJvv49xTDjkJDCOCNOeZOdqd
	cRV8vZkILI1VV7vvkGnti7lIO8QQjJPtB50Cx5XcDZkpLxZiG18FEGgx2eTavj5n1xL1mmfE0owUO
	72VX1s+IAqWJCCf5q+yfNoUIZLcjDNDnNYiHO8JOzkqTVug7Jk6hkGeKSxmH8jP6DVLGr8p3FWuVz
	d6aj1PGCK724XUvNbbRuMjvvHGU6bg5FqpzoaT1eUfyieko0inywJ6mFAceEu+1sD3FlA7LCwfd3y
	zUmbKjHaann/nrO7Wk3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nquGw-00D0qR-0p; Tue, 17 May 2022 10:17:46 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nquEd-00CzNj-SF; Tue, 17 May 2022 10:15:25 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 180091F443BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652782522;
 bh=eBRkr4WqaZlr+7CsJBZHJn+mlNJWVhtlI7s9X1ia8g4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NlOqhjo49ohOAQ2ZuFAreXPXG4V8YZCcT4aUTIrU+HQMawU1y6ySWiM1Jz9xb63+N
 KQbL4F7qdpnW8HAobgwSwl/GcOkEi6/coy15eH/wBr2QpDOmfE36NI5s3a7td5Hmt1
 JgpQT7ojwuCE+NAon9JXBdBHoes31kOpYhfdwOB9hs+QdPg6k6bWEiWMmOkNZUwqW6
 VOIAMAJ3nSkMIMbYuU9sonPTaQ8nB6yjOmme433gdR1HhBQGzwBDrKK+cjAWX8JqUc
 YtZAAoWFw4NRKtGo63e/tF1zqwXIspJH5P04O3+u2vrBGnLxjREJePZsCZ2oydm/7Z
 wiMKaaoFq+y5g==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, sboyd@kernel.org,
 chun-jie.chen@mediatek.com, rex-bc.chen@mediatek.com, wenst@chromium.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] dt-bindings: arm: mt8195: Set #clock-cells as required
 property
Date: Tue, 17 May 2022 12:15:12 +0200
Message-Id: <20220517101514.21639-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220517101514.21639-1-angelogioacchino.delregno@collabora.com>
References: <20220517101514.21639-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_031524_154297_DFC2B489 
X-CRM114-Status: UNSURE (   8.65  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This is a clock-controller binding, so it needs #clock-cells, or
it would be of no use: add that to the list of required properties.

Fixes: 34d3ed3b9a00 ("dt-bindings: ARM: Mediatek: Add new document bindings of MT8195 clock")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/arm/mediatek/mediatek,mt8195-clock.yaml  | 1 +
 .../bindings/arm/mediatek/mediatek,mt8195-sys-clock.yaml         | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-clock.yaml
index 0189aa0e34d4..aabd9f0df2de 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-clock.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-clock.yaml
@@ -60,6 +60,7 @@ properties:
 required:
   - compatible
   - reg
+  - '#clock-cells'
 
 additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-sys-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-sys-clock.yaml
index 95b6bdf99936..e2ba37830d4e 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-sys-clock.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-sys-clock.yaml
@@ -43,6 +43,7 @@ properties:
 required:
   - compatible
   - reg
+  - '#clock-cells'
 
 additionalProperties: false
 
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
