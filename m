Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5CF1CA0EFA
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Aug 2025 07:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ALvE+g5yody5i1C0PvIajCyD5iliYlZJvD5/MAYEAlk=; b=HP8i8mH6fuE71RkaZ1+powrh0C
	lg2TSXvGm5mzIdwQ8CPx2HZKnZPi7sYuNEcQDjiFMi/5c4lGIAy8ce2PwhKe9amIioxirOIfWhbSy
	8zbvgf3HMkfj+u2Cp3z/kl1Oy0C6Ae4dFDmtUI4DlDaAIQINQ3DMHceLJfxEuVVc2wo+Gt7stfPKM
	NMVAFU88q/5UOt/LHMmLNSoRenRQ316q6mHOPGrL/8Pp/XefWsGGCYDy9X5mEOV7wwh+wnylQ0FPV
	EaXgvkQKjKjVZQ9F6mxoSAs8nNTiz8Nbuw5wML7SWTJHbJ59WjKBkzdHUOvfoVNYiKTkG4N8WBVOe
	Uc1BcTYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqoL6-0000000AtHi-04yf;
	Tue, 26 Aug 2025 07:43:32 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqoHM-0000000AsOB-1vc2;
	Tue, 26 Aug 2025 07:39:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756193978;
	bh=RxFt5IVTUDQtMRnz+kIvAEi3r6lg/xIgb5vkotIBCak=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JlRvaWF6aIZXqncQh3CJPV3C3H5m3WZfJcpGKgsXjNd1gu8WmqMicUqj00wMkpkAF
	 1Z2TKtTGL7m+WGARPg07OglJ/MX2wGQLpOo8ieJXVHm3aRmCPGSyczEhtvpMguLAfg
	 PPCD3XouAI0Nc4mGWNMlw2V/L0MjzeMQkb0okyA0HiMLs0UUuOsrMZV3JGGqo8YavG
	 06WPCls+umGNsZDr2mAlHxXeMbJd2rpOACOlfIZ32xb5CbYoXwDFj6kE2bxzzI6kp4
	 PHY5rDwgd5vZ0yvVRKeZyCznRY+HkhQrT5AINjb2z+z8neQ8ZUaZeLz6nQA2qRwpbo
	 gf40/dW2tzW9w==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892F2D600C8F85cF092d4AF51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CF04217E0A28;
	Tue, 26 Aug 2025 09:39:37 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Tue, 26 Aug 2025 09:39:34 +0200
Subject: [PATCH v3 1/6] dt-bindings: clock: mediatek: Add power-domains
 property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250826-mtk-dtb-warnings-v3-1-20e89886a20e@collabora.com>
References: <20250826-mtk-dtb-warnings-v3-0-20e89886a20e@collabora.com>
In-Reply-To: <20250826-mtk-dtb-warnings-v3-0-20e89886a20e@collabora.com>
To: kernel@collabora.com, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Ikjoon Jang <ikjn@chromium.org>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>, 
 Chen-Yu Tsai <wenst@chromium.org>, Weiyi Lu <weiyi.lu@mediatek.com>, 
 Eugen Hristev <eugen.hristev@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Julien Massot <jmassot@collabora.com>, Sean Wang <sean.wang@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Julien Massot <julien.massot@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_003940_649965_400688B1 
X-CRM114-Status: UNSURE (   8.99  )
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

The mt8183-mfgcfg node uses a power domain in its device tree node.
To prevent schema validation warnings, add the optional `power-domains`
property to the binding schema for mediatek syscon clocks.

Fixes: 1781f2c46180 ("arm64: dts: mediatek: mt8183: Add power-domains properity to mfgcfg")
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 .../devicetree/bindings/clock/mediatek,syscon.yaml        | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/mediatek,syscon.yaml b/Documentation/devicetree/bindings/clock/mediatek,syscon.yaml
index a86a64893c675ac134af609b3a49242565db6ad8..a52f90bfc9f92b52feb9f488db5550630ac55f0a 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,syscon.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,syscon.yaml
@@ -76,6 +76,9 @@ properties:
           - const: mediatek,mt2701-vdecsys
           - const: syscon
 
+  power-domains:
+    maxItems: 1
+
   reg:
     maxItems: 1
 
@@ -86,6 +89,18 @@ required:
   - compatible
   - '#clock-cells'
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: mediatek,mt8183-mfgcfg
+then:
+  properties:
+    power-domains: true
+else:
+  properties:
+    power-domains: false
+
 additionalProperties: false
 
 examples:

-- 
2.50.1


