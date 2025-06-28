Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3BD1C7EE32
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Jun 2025 09:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YcSTaKN401XjS/lTU3UuVzaGoC+mAi1n71I7Mb7VeT4=; b=kv6RbH4T25MDD6
	io3tkz775Cl+7r36W61M3L7qPNbmH22xtmrNcBb/v2fHA1ETDzLJ72Qf92sVGrAxrowq0FxD/CmI3
	YqpTV3IRTRjXg1c6d1etW6SSiMQCOPLa4n3pEYpvLTIq4tiNEkvkY++t9VyxsHBdmco8JwVspkv5w
	79ubmtHmWz/lnRpqsdAkk9xh2HTAS1wU0KmG68mfPZyHVLsp1VNlkI6Aa0AHwX0e1heY9kQgPFaaL
	FMCjYt3IjOvfeSynil9lEs2rRRdvyUUfTKxpfmBQVQzBjpXA+X0mVN0oNaE3hHM6POPaU8kf9HTB+
	Mpdt5WI6xY1LCjSVNXKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVS1b-0000000Gdv0-3Cq2;
	Sat, 28 Jun 2025 09:39:07 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVRaJ-0000000GbE9-3oEO;
	Sat, 28 Jun 2025 09:11:00 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout3.routing.net (Postfix) with ESMTP id BCB5361654;
	Sat, 28 Jun 2025 09:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1751101853;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YcSTaKN401XjS/lTU3UuVzaGoC+mAi1n71I7Mb7VeT4=;
	b=s5b0Y0Z7VZEwnuhyqUiyYldOTv/RnzR2K/IzpDQAfKrAL0O0jJTLeqPQl3QmBb1uqjQDlb
	M5gbW4gHarBX9t+d5nC8kr5oEMGYK3dy5hTpisHmlqn8EudyUOhSEAwugqJZJjS8+O7AWg
	Wzh1UtA6bQTzrb9Fks1vv93XjuOTi/M=
Received: from frank-u24.. (fttx-pool-217.61.150.139.bambit.de [217.61.150.139])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 610F71226F5;
	Sat, 28 Jun 2025 09:10:52 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Georgi Djakov <djakov@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v6 06/15] dt-bindings: interconnect: add mt7988-cci compatible
Date: Sat, 28 Jun 2025 11:10:30 +0200
Message-ID: <20250628091043.57645-7-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250628091043.57645-1-linux@fw-web.de>
References: <20250628091043.57645-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250628_021056_096070_7FAC5639 
X-CRM114-Status: UNSURE (   8.96  )
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
Cc: devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, linux-pm@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, DENG Qingfang <dqfext@gmail.com>, Johnson Wang <johnson.wang@mediatek.com>, linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>, linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Add compatible for Mediatek MT7988 SoC with mediatek,mt8183-cci fallback
which is taken by driver.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Georgi Djakov <djakov@kernel.org>
---
v2:
- no RFC
- drop "items" as sugested by conor
---
 .../bindings/interconnect/mediatek,cci.yaml           | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/interconnect/mediatek,cci.yaml b/Documentation/devicetree/bindings/interconnect/mediatek,cci.yaml
index 58611ba2a0f4..4d72525f407e 100644
--- a/Documentation/devicetree/bindings/interconnect/mediatek,cci.yaml
+++ b/Documentation/devicetree/bindings/interconnect/mediatek,cci.yaml
@@ -17,9 +17,14 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - mediatek,mt8183-cci
-      - mediatek,mt8186-cci
+    oneOf:
+      - enum:
+          - mediatek,mt8183-cci
+          - mediatek,mt8186-cci
+      - items:
+          - enum:
+              - mediatek,mt7988-cci
+          - const: mediatek,mt8183-cci
 
   clocks:
     items:
-- 
2.43.0


