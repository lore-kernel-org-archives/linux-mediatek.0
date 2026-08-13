Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EB1BC5B572
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2026 14:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0A8IrhKHQG1tU+EN1faW5fs6vYQdqMgGnDDkxdw1eHA=; b=tc1N+X1KaMh4rJw/7vpNXBLXmb
	G1dB1CaOc7MgwAcaydrq2NTEmeLKsWJq/LM/bOhq2cIQhaq6cXHEuQhJ/d2BDNp9nwFY2bKsPR9Ms
	34uH0MV2Fyr5r6+0nlul+kL2lQOaYCmNsEvB9AB3glAelW7OGcuPVPsKDykCE6fpB1TRh95qECCbW
	W+2ucbOVUTD7RNnUkA6IpEv206KgPcziCAco1UyAl0e+OR3r6GuJcFK9xJ+PazEjx5X5xYKgaRMZU
	FECJThuzFKATVtSdCO2059aLiXSUiTgc/2vs3M1E8GUb9VeEIVucKTTCjSdlJyHdVVR7fTPqWJIag
	N4/bd5mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuWpn-00000000sTe-3Wuz;
	Thu, 13 Aug 2026 14:55:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuWpm-00000000sTX-3r6P
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Aug 2026 14:55:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 20A0F60120;
	Thu, 13 Aug 2026 14:55:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAD5D1F000E9;
	Thu, 13 Aug 2026 14:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786632905;
	bh=0A8IrhKHQG1tU+EN1faW5fs6vYQdqMgGnDDkxdw1eHA=;
	h=From:To:Cc:Subject:Date;
	b=MZ5YJZbzE2Jq7P3zV7P62kqMiI8EW2gtCwP0czuZOXeq+16wUtBV9yFfPc6u7iF7f
	 jkqZXWYnVanvnszPF1WYuE6/P1h2OcNK/KcQceaQORGInh2R2z90B3Ms48xfQGhIH6
	 L+fdMOSj9VqYf3QbuyxeDAqgfHLq2UwLISg0Qtc5lYCbPALt7dTNlRgZ58xCNka6NZ
	 ZPUJt6189Hc6ygxpLFgyAedck0YQerMrKuKv+O0xtRwCETOV419DmHhDSnsrxF1b6N
	 V7pnQ69RvsLfqYSHFzaXOuLh6W2rfaLMi1BdaKFvR35RMUEXpo6cxew2g9I8T7Cp4V
	 me+IYa/bC+UAQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] dt-bindings: interrupt-controller: mediatek,mt6577-sysirq: Drop invalid JSON pointer
Date: Thu, 13 Aug 2026 09:53:59 -0500
Message-ID: <20260813145453.1919998-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The $ref "arm,gic.yaml#/properties/#interrupt-cells" doesn't work when
used with another json-schema implementation (rust). The issue is it not
a valid URI due to the 2nd "#" character in the JSON pointer. Though a
"#" is supposed to be valid within a JSON pointer. A possible solution
is to encode the "#" as "%23" instead, but the dtschema tools don't
handle that.

Just avoid all these issues as the $ref only resolves to a "const: 3"
schema and specify it directly.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/interrupt-controller/mediatek,mt6577-sysirq.yaml  | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/mediatek,mt6577-sysirq.yaml b/Documentation/devicetree/bindings/interrupt-controller/mediatek,mt6577-sysirq.yaml
index 30d76692ca87..b94fc3cec175 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/mediatek,mt6577-sysirq.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/mediatek,mt6577-sysirq.yaml
@@ -49,7 +49,8 @@ properties:
   interrupt-controller: true
 
   "#interrupt-cells":
-    $ref: arm,gic.yaml#/properties/#interrupt-cells
+    const: 3
+    description: The cells have the same encoding as defined in arm,gic.yaml.
 
 required:
   - reg
-- 
2.53.0


