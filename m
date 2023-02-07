Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE9EC636CC
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Feb 2023 17:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JLrL4iWympNnVNwAETpNE1kjBqSNjCEjKLn1CYJsz9g=; b=pZmoRsEXL4GiGL
	VioDjyCFufGF0ICONXctCMpTB/xSSsRcWDAEsZU+YGnpKOTKcMMSkOJ9TER6cUIoSfNc4MEBCCDG7
	WGTXpzHMUJ2FLFJwAErzTQEIiucOCFLEElgkvKo327UTUZzoxa6HFGA8D4QRj3UK0lYrLsmsvFUqQ
	wLLe7dPWlmXv913Yusj949Lt6U0d+lqfL+8zhQ7cAbUmsM++D3zLs0RnH2q8/xoP+/0CPxtjI0sFy
	CT+uvlMV1sATTGP7ONSLrhtacf48rLTFnDA3mfyY2l0Ktq274nk9/JH2OyZiyYwvxgVD5nBDtGl7V
	NVEe79UA27PGwUfYWfMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPRZ6-00Ctgp-QA; Tue, 07 Feb 2023 17:15:32 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPRYw-00Ctf1-L1; Tue, 07 Feb 2023 17:15:24 +0000
Received: from mxbox4.masterlogin.de (unknown [192.168.10.79])
	by mxout1.routing.net (Postfix) with ESMTP id E42B441A6D;
	Tue,  7 Feb 2023 17:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1675790119;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JLrL4iWympNnVNwAETpNE1kjBqSNjCEjKLn1CYJsz9g=;
	b=s8/mNx/3hM5Z1BYZzXx5/GGPmL6fAfaQZV9DpVzN3oIYNqzMtl75EC9k/1Y8y/zd0bRaWX
	CgAB6WfedG3wqUIB5pJxKlSjm4keFwfeeYJvkRapmLtnr8O7fbAGOEpFdmDoag7+LkCu4U
	obWTm6EXVkSvv9RzF0AUXySe+yJj6g4=
Received: from frank-G5.. (fttx-pool-217.61.159.155.bambit.de [217.61.159.155])
	by mxbox4.masterlogin.de (Postfix) with ESMTPSA id 8A269802E7;
	Tue,  7 Feb 2023 17:15:17 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH] dt-bindings: mt76: allow up to 4 interrupts for mt7986
Date: Tue,  7 Feb 2023 18:15:12 +0100
Message-Id: <20230207171512.35425-1-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 335c7e56-e374-4379-9b78-55056f0c79f6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_091522_914113_2D008ED7 
X-CRM114-Status: GOOD (  11.04  )
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
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>, netdev@vger.kernel.org, Kalle Valo <kvalo@kernel.org>, Sean Wang <sean.wang@mediatek.com>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Shayne Chen <shayne.chen@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Mt7986 needs 4 interrupts which are already defined in mt7986a.dtsi.
Update binding to reflect it

This fixes this error in dtbs_check (here only bpi-r3 example):

arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: wifi@18000000:
interrupts: [[0, 213, 4], [0, 214, 4], [0, 215, 4], [0, 216, 4]] is too long
	From schema: Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: wifi@18000000:
Unevaluated properties are not allowed ('interrupts' was unexpected)
	From schema: Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 .../devicetree/bindings/net/wireless/mediatek,mt76.yaml      | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
index 212508672979..222b657fe4ea 100644
--- a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
@@ -38,7 +38,10 @@ properties:
       MT7986 should contain 3 regions consys, dcm, and sku, in this order.
 
   interrupts:
-    maxItems: 1
+    minItems: 1
+    maxItems: 4
+    description:
+      MT7986 should contain 4 items.
 
   power-domains:
     maxItems: 1
-- 
2.34.1


