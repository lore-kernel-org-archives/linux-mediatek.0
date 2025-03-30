Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4EEEC36013
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 Mar 2025 17:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LsD3ZRTwsDqOrQWq1NMrHzNWOBquSOL3Gwmcst8cUJY=; b=L0dEu1J6ENpIuBSHiI18W53i28
	epaoUWz4/n4sgz9yOzN8iGRfP3ihZvzWSQtGLUPTQrXvQvcX0ZZlJG9AwAziCWW4lQUQMu6HhLIgu
	Z68vZLwvxX8/zA7nzbUuoaZtV6Mmj6OrQIYj/+GRGkOLISoQFSTW4VdNk0h07M5zLokLXJfvKvMze
	2RZOtu63vekm1ruO/+dmm5j1ie5kk/m7Y2DGMl5AWjfDYPJH/jrblZvtf0YmwPqdCtJi4vxrr8luO
	zIoafSlODr4+dZdPECTWFdrD+OUXcV01ruZKeH7jh99W3cQyhoY5cYXI1citp0UXAruBZqbuChR0K
	r2vifMIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyw4i-0000000GQ18-3ZXr;
	Sun, 30 Mar 2025 17:03:56 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyw4g-0000000GPx4-1H43
	for linux-mediatek@lists.infradead.org;
	Sun, 30 Mar 2025 17:03:55 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A461B2FB965;
	Sun, 30 Mar 2025 19:03:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1743354232; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=LsD3ZRTwsDqOrQWq1NMrHzNWOBquSOL3Gwmcst8cUJY=;
	b=OB0u1IAHApexO1FJ4tl4F5FilVUkDoIZLPe7KPInEZLjlh4Jq4seF94rkWe/utfPSUnLS+
	kwaZYi4wTxpqa6xUMrjHRPwN6Hkoj51FWAyvnwqQrXboqLRN+GWX6dcgTyUkY7kUsDShsW
	lRiMszH/ehGhaksCBQy9VdG/CqfiyPSkITx/I3OB8GPib4ZwYRfG3yRcgm9lTamNMmWf4X
	Yv2bwkJcTF+o5vsokTC6CqGLrQXT4Zzb9S9niK7CSbOyqWXogWpaW8QlIlhto1TQo9MjPq
	OGH7JGonW+srmYaY+wjEPjzkar5xdnOyn3C7vJOHOMBdnD3x9cjiSnTpbEhW4A==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-mips@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	benjamin.larsson@genexis.eu,
	linux-mediatek@lists.infradead.org,
	Caleb James DeLisle <cjd@cjdns.fr>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 08/10] dt-bindings: vendor-prefixes: Add SmartFiber
Date: Sun, 30 Mar 2025 17:03:04 +0000
Message-Id: <20250330170306.2584136-9-cjd@cjdns.fr>
In-Reply-To: <20250330170306.2584136-1-cjd@cjdns.fr>
References: <20250330170306.2584136-1-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250330_100354_526759_4C624813 
X-CRM114-Status: UNSURE (   5.88  )
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

Add "smartfiber" vendor prefix for manufactorer of EcoNet based boards.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 371f6bb81f81..dc064e6acf4b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1388,6 +1388,8 @@ patternProperties:
     description: SKOV A/S
   "^skyworks,.*":
     description: Skyworks Solutions, Inc.
+  "^smartfiber,.*":
+    description: ShenZhen Smartfiber Technology Co, Ltd.
   "^smartlabs,.*":
     description: SmartLabs LLC
   "^smartrg,.*":
-- 
2.39.5


