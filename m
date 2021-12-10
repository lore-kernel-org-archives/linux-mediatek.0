Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E762BC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Dec 2021 18:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YR73c3aJ/MDf7ZdVY58Qyc/EthgqV/K27IQ/oL3m7eU=; b=jB6kyw//y+NsOy
	cT/1XFQv4GcVHTrB/RqZftPmh2O4s4bxKJAZwidjaR3w8bmrvgZIW8cJOgzkzaqm5FL/e3EUYwqnn
	eXr1Pb05fheeSNw+Pr4b55nUc0rZ6i27SAEpSU2W7bcuXKZY/sPOzE/4L8GpKrS7JywSbqJzAoUO9
	3+Nfj16vOfAQQzGOB2Cp6qoW/pixcmSDLtq5ER7yZYcAmjWR+iFZc5YD0cpyFIL8MfOhsvb1E617O
	8QDzUcqSojS1IYz9ZJWXfK2Z+EN28DzAjxG2bIvtTrMdw2J0LNJNOM0gmxdb8q2X1iehcTEIhXMsw
	0YldFPR4H8MRu65O/0cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvkFv-0036ij-So; Fri, 10 Dec 2021 18:04:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvkEC-00362J-Pu; Fri, 10 Dec 2021 18:02:43 +0000
X-UUID: 718360b1c89347be9a1d4a40c21e1404-20211210
X-UUID: 718360b1c89347be9a1d4a40c21e1404-20211210
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <flora.fu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1126745823; Fri, 10 Dec 2021 11:02:37 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Dec 2021 09:52:34 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Sat, 11 Dec 2021 01:52:33 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 11 Dec 2021 01:52:33 +0800
From: Flora Fu <flora.fu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Pi-Cheng Chen
 <pi-cheng.chen@mediatek.com>, Yong Wu <yong.wu@mediatek.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Flora Fu <flora.fu@mediatek.com>, "JB
 Tsai" <jb.tsai@mediatek.com>
Subject: [PATCH 03/12] dt-bindings: soc: mediatek: apu: Add MT8195 APU power
 bindings
Date: Sat, 11 Dec 2021 01:52:14 +0800
Message-ID: <20211210175223.31131-4-flora.fu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211210175223.31131-1-flora.fu@mediatek.com>
References: <20211210175223.31131-1-flora.fu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_100240_898333_184EF586 
X-CRM114-Status: UNSURE (   8.74  )
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

Add MT8195 APU power bindings.

Signed-off-by: Flora Fu <flora.fu@mediatek.com>

---
 .../soc/mediatek/mediatek,apu-pwr.yaml        | 23 ++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,apu-pwr.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,apu-pwr.yaml
index 00f67dddb162..93afb9919f1f 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,apu-pwr.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,apu-pwr.yaml
@@ -19,6 +19,7 @@ properties:
     items:
       - enum:
           - mediatek,mt8192-apu-power
+          - mediatek,mt8195-apu-power
   reg:
     minItems: 1
 
@@ -47,7 +48,27 @@ required:
   - vvpu-supply
   - vmdla-supply
 
-additionalProperties: false
+additionalProperties:
+  if:
+    properties:
+      compatible:
+        enum:
+          - mediatek,mt8195-apu-power
+  then:
+    type: object
+    description:
+      Represent node that will trigger early probing to all iommu device.
+      The APU device all iommu device to be probed before boot remote tinysys.
+    properties:
+      compatible:
+        enum:
+          - mediatek,apu_combo_iommu0
+          - mediatek,apu_combo_iommu1
+      iommus:
+        maxItems: 1
+    required:
+      - compatible
+      - iommus
 
 examples:
   - |
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
