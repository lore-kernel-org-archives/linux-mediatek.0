Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC47C369C4
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Apr 2025 10:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zRgDtNzjWlmBlKxgWUbFr0kAVAlRPqY5m6T9fKKPW3o=; b=v9Dza8/LDnYlRm
	2RgZcF38cxUtA1q9lRSDnq8wJeOrFEsrg1WbucRPDufWDUtzeST13jLSNTwvMh+Y2hkANpLKmHr2E
	12Sn7+NyQpNkIb0h1QBsvQ8cqE13g2SzbzQTrbCNZaOvDHckcPGZOLx1FS6zGDKS/d07w1B7m9VvB
	AP2uiEXIalI7DKW+bDgEsUrFRvK0IfVtr5UaCWXYehPIOUmlqI3BBge0zzp6FTAc+VmqgGTrpJ3ZY
	Z1odenHpw2oLm1guYhbJGGcWXZaOu2IQ6q/xAWOJz97yqpcqjRF2AT5+zqe+zMuHx778qHr1F6SMa
	CKQgU1QGRnLNtog7WJkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u504e-00000009Buu-3WxZ;
	Wed, 16 Apr 2025 10:32:56 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4zTJ-0000000934O-2Vv5;
	Wed, 16 Apr 2025 09:54:23 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout1.routing.net (Postfix) with ESMTP id 95BC4400C5;
	Wed, 16 Apr 2025 09:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1744797257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zRgDtNzjWlmBlKxgWUbFr0kAVAlRPqY5m6T9fKKPW3o=;
	b=OmBywSVI08bANUw30P1zxMuoqkXaEnsNmPoatNF3mjYe+OHVuSlvjVvEFVVG+kRmERsSlv
	p6Oa/bP5uNHAHOkAf/Iun0bGPINkyREaAZ8S6K56BcjLAiSuERJgC8piHNpqwlGqJloq/Z
	q5hZISy2B077ed8J7iPq7TF16YB3xak=
Received: from frank-u24.. (fttx-pool-80.245.72.47.bambit.de [80.245.72.47])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 8DB6D3600F2;
	Wed, 16 Apr 2025 09:54:16 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v3 1/8] dt-bindings: arm: mediatek: add bpi-r4 2g5 phy variant
Date: Wed, 16 Apr 2025 11:53:53 +0200
Message-ID: <20250416095402.90543-2-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250416095402.90543-1-linux@fw-web.de>
References: <20250416095402.90543-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: b70a6ed7-f168-47b1-8fc9-816fd0c482a2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_025421_774836_43CC9977 
X-CRM114-Status: UNSURE (   8.28  )
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
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, linux-mediatek@lists.infradead.org, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Add new compatible for Bananapi R4 with 2.5G phy.
Base board is compatible with existing BPI-R4 only 1 SFP is replaced
by RJ45 port and use mt7988 internal phy.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
v3:
- new patch adding compatible for 2.5g variant
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 108ae5e0185d..3aed03df0e3c 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -104,6 +104,10 @@ properties:
           - enum:
               - bananapi,bpi-r4
           - const: mediatek,mt7988a
+      - items:
+          - const: bananapi,bpi-r4-2g5
+          - const: bananapi,bpi-r4
+          - const: mediatek,mt7988a
       - items:
           - enum:
               - mediatek,mt8127-moose
-- 
2.43.0


