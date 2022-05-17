Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E486C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 May 2022 10:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hfCsLHE35FFIfvJMoJtX7VvpKiwYn1WXtnsVu5QNYR4=; b=ytVR1/Qb39pfcc
	TdJWGdCayF8ohE48bn7JF4PBTFNy6cPEmRdUnOgJdrOWY68277JJ/fZspRNcj9uOb6vdnipgqi+w3
	wuL8B5lP4YAInFXjtVABklwrUi6vkykqRaNIAMAsYc3mLfrjLvfmIEpHdqMJ0L+2Acl1DWlmMt4o6
	4G3hhGs/B8BvFTVSLjQGvM4/bDhY4wMTcjDArXW+6CosTP0mqV2ong89/nMN9582drpotwnzQR32r
	7qL7wTMFZeHi5Qz+gxkGZ8gFtcIJpOtJTRIFWTZ56MWl0PmRfur0rsotcQxPxQAdEXbx9znr5sN+U
	XPSMaJahaphRej51NbgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nquGy-00D0sA-2l; Tue, 17 May 2022 10:17:48 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nquEf-00CzOf-FU; Tue, 17 May 2022 10:15:27 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id A046A1F443CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652782524;
 bh=TA9UXIS48xhTYwd+gX+zeRbwLmONL3/Sq7xEOCoXFLo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Yg+1zCo9/fwn7mpBbPaYRlDMc/ohqk1I26nDTD4ozx/HL8wZO8X+/ijWJ8YwVOIWX
 sxwzZsAYgYzvpjfkrLYIpQeTM5+HLfEeYC/luFjL3JisMKmHz6vIatgSyhEWlbuZas
 ExczweUIOJdru4rxegiKzeAAhildp+w6otsLODqDoA1xxijTq6Xt/pRQI/VTeUEtPR
 ZAXURudOYwhkCnTOJgtiXJDn2SXWcCb9r5I7IlUgk6VlFGX17Bg8waSddmNbd3EC/5
 LcYUKZH3eucBaUN1xalZc3EaET9DDyZVHgxeA7zIazP4i9HN8gt1jUOsTztfGfrYC8
 wWtDiliy6UEYw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, sboyd@kernel.org,
 chun-jie.chen@mediatek.com, rex-bc.chen@mediatek.com, wenst@chromium.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] dt-bindings: arm: mt8192: Set #clock-cells as required
 property
Date: Tue, 17 May 2022 12:15:14 +0200
Message-Id: <20220517101514.21639-7-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220517101514.21639-1-angelogioacchino.delregno@collabora.com>
References: <20220517101514.21639-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_031525_719577_F55A459F 
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

Fixes: 4a803990aeb1 ("dt-bindings: ARM: Mediatek: Add new document bindings of MT8192 clock")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml  | 1 +
 .../bindings/arm/mediatek/mediatek,mt8192-sys-clock.yaml         | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml
index bb410b178f33..b61d7635dfdd 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml
@@ -46,6 +46,7 @@ properties:
 required:
   - compatible
   - reg
+  - '#clock-cells'
 
 additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-sys-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-sys-clock.yaml
index 27f79175c678..580450e94c02 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-sys-clock.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-sys-clock.yaml
@@ -35,6 +35,7 @@ properties:
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
