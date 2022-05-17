Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5580C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 May 2022 10:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kc5SCfA0pmN6g3Mhm3VeYJtZE/mlyIUt0Spjy800Pkg=; b=pzZofuFryFn7XK
	d3mKNeTXBZv3saf2amdrNf3Mjx+xkMoxDV57TGrsTBOcv2NsEM37MW1zXIk7UPHBsixN7bFMsybfX
	GxjuDmW0tpiHuAtjxq0rBNb3zfjVTCRK4Rc+ouUnER436IT9O/lZSE5MOtxDVmiQfm0vDBPsFjYtk
	5VSxy7S4GABZT+BbFxTbnltRcTIbVxcf3veQO5o6qodwfv4zJXnAuFlM1ZzzKkeyZ1Af8F6CC5gCG
	EBAbkiwRXUog9PLHmFR1XOSJpxbeTmIBzpJD/9M+AFLlzpX5rbcpmHtaqez5IXFBgIwFiXr/IvCTd
	gHQhseSpwcTW5MIGG6Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nquGV-00D0Tb-8D; Tue, 17 May 2022 10:17:19 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nquEc-00CzMT-Ar; Tue, 17 May 2022 10:15:25 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 7FCC21F443BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652782521;
 bh=76NF72B8a2gMolt43X8BzVRYK4WEYiFGDLPEdSSrRTQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CqcHwQ2FsnS7kVkpskTrMoiYGrfVPZ394PExWNM8/pkn/M7nUM2h+JQHn+rLew74Q
 oanuUerPW5o90g2YYwGsKY4tlHul/Gp3L3zFh0Sbw0nVTsmQuzbCNO/12dZ6NUIl/M
 lxyqrOqu1UGRXuZ3WyvG3uNHomt83Vl00tajwDLvxf7Ttme3uCmWGboHj/BG+LhYV2
 8L5tRZNLiAe3fdErgfVNkOBAG8A/9RGamWmsoNIh6upk26WSiAlRGXa/VDLQbTSBoR
 LEqq5tQoah1/lwx7brKYGQbKKr1gsStDaRDEk+N1RWXqQgniaEZSSfiXbTbmDjNtOF
 z9/q3kcYkixRQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, sboyd@kernel.org,
 chun-jie.chen@mediatek.com, rex-bc.chen@mediatek.com, wenst@chromium.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] dt-bindings: arm: mt8186: Set #clock-cells as required
 property
Date: Tue, 17 May 2022 12:15:10 +0200
Message-Id: <20220517101514.21639-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220517101514.21639-1-angelogioacchino.delregno@collabora.com>
References: <20220517101514.21639-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_031522_576132_65D1CA4E 
X-CRM114-Status: UNSURE (   8.55  )
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

Fixes: f113a51aa2cf ("dt-bindings: ARM: MediaTek: Add new document bindings of MT8186 clock")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/arm/mediatek/mediatek,mt8186-clock.yaml  | 1 +
 .../bindings/arm/mediatek/mediatek,mt8186-sys-clock.yaml         | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-clock.yaml
index 371eace6780b..70d7b393140e 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-clock.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-clock.yaml
@@ -44,6 +44,7 @@ properties:
 required:
   - compatible
   - reg
+  - '#clock-cells'
 
 additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-sys-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-sys-clock.yaml
index 0886e2e335bb..48ebd2112789 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-sys-clock.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-sys-clock.yaml
@@ -42,6 +42,7 @@ properties:
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
