Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3ECDC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Nov 2021 12:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OwoOYXaKkQRTxTpII02nXcrgLIAWDDpEjsu+PF06Hf4=; b=Ord3J37fDbGR8o
	rM4J/8R51ziZyiOINw1bd9ntA5SqBU52xjBK7zre5XAQf4ItA+2jeoJxUizOnWrk//fcz8lU2qQE2
	MQf8RUe8f6LioTUqORfGsxzOs1ZWO17qFuOnAV2WlCn51DEvIvf3m+9kVpEIfFGCpay8RlU2a2cQc
	gfUfrhjGUtSlfPKNj0E1h1DZWZ0eNP4DKpwYZdIRJr6jI8avcbmBgPKoyId4QomNunwKE/T7nIZND
	n1VaVR1+GfSdNRFx/A0rX31xAXOMZ5v5nZK58KlvdIS/Sdnx1aa1YMDN9pUIQwku/Z/puldMwfGVg
	/VsChiTpH2A56r2FI0sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mp8nJ-00GU0a-Ht; Mon, 22 Nov 2021 12:51:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mp8em-00GQVc-1q; Mon, 22 Nov 2021 12:42:49 +0000
X-UUID: 8e3cc2408d4d460ebfffc91b87519e63-20211122
X-UUID: 8e3cc2408d4d460ebfffc91b87519e63-20211122
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sam.shih@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 213435828; Mon, 22 Nov 2021 05:42:42 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 22 Nov 2021 04:32:45 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 22 Nov 2021 20:32:37 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 22 Nov 2021 20:32:37 +0800
From: Sam Shih <sam.shih@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Hsin-Yi Wang <hsinyi@chromium.org>, "Enric Balletbo
 i Serra" <enric.balletbo@collabora.com>, Fabien Parent
 <fparent@baylibre.com>, Seiya Wang <seiya.wang@mediatek.com>, Sean Wang
 <sean.wang@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
CC: John Crispin <john@phrozen.org>, Ryder Lee <Ryder.Lee@mediatek.com>, "Sam
 Shih" <sam.shih@mediatek.com>
Subject: [PATCH v8 1/2] dt-bindings: arm64: dts: mediatek: Add mt7986 series
Date: Mon, 22 Nov 2021 20:32:21 +0800
Message-ID: <20211122123222.8016-2-sam.shih@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211122123222.8016-1-sam.shih@mediatek.com>
References: <20211122123222.8016-1-sam.shih@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_044248_169941_A293688F 
X-CRM114-Status: GOOD (  11.03  )
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

MT7986 series is Mediatek's new 4-core SoC, which is mainly
for wifi-router application. The difference between mt7986a and mt7986b
is that some pins do not exist on mt7986b.

Signed-off-by: Sam Shih <sam.shih@mediatek.com>
Acked-by: Rob Herring <robh@kernel.org>

---
v6: separate basic part into a single patch series

Original thread:
https://lore.kernel.org/all/315d7823aa108c909a3d36464fe54763b76ab2f4.camel@mediatek.com/

v3: changed 'MT7986' to 'MT7986 series' in the commit message
v2: added an Acked-by tag
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 80a05f6fee85..a9a778269684 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -76,6 +76,14 @@ properties:
           - enum:
               - mediatek,mt7629-rfb
           - const: mediatek,mt7629
+      - items:
+          - enum:
+              - mediatek,mt7986a-rfb
+          - const: mediatek,mt7986a
+      - items:
+          - enum:
+              - mediatek,mt7986b-rfb
+          - const: mediatek,mt7986b
       - items:
           - enum:
               - mediatek,mt8127-moose
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
