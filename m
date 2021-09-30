Return-Path: <SRS0=rLIJ=OU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4D61C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 08:33:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76F0B615A7
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 08:33:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 76F0B615A7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D6jMo8u1aoy4JphRe1SouJ5Lx+gRORc7JTu6IT1Euf8=; b=Le4EW/b5av5uIB
	b0664VKRjfFPWkCI2vSQxfBXxw1rt2cxhB0jYCrOsqd4hTbBEDomQv4TEsuaQax4f8VrRuEOcOfzR
	uc4DWvGCsfq28ekJakWfYjm+F6MEJzivrM7Sk+LlVEIvob23P+617aywf82KhvsNBA6bAhWEW6hQH
	5tkHcBfXZsPB1XPfzlz9CEgt7O2WF7teB53PPMjwfNysVtM7JyrmAYUqX/xgB1NA3pFPFxDrDcnje
	3r/LQTArep+9r72kMJ/QNhhW0LgLxM1kCT4CJPsY5DJxWjS52xI1nIxl2K6jHrWzYa+7T4sjyroqf
	YqMXy4k/pD3FUT+zpWmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVrV2-00DOVG-2f; Thu, 30 Sep 2021 08:33:04 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVrU1-00DO1u-LI; Thu, 30 Sep 2021 08:32:03 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 510A71F449EC
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org, eizan@chromium.org,
 kernel@collabora.com, drinkcat@chromium.org, jitao.shi@mediatek.com,
 chunkuang.hu@kernel.org, hsinyi@chromium.org, matthias.bgg@gmail.com,
 Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 2/7] dt-bindings: mediatek: Add #reset-cells to mmsys
 system controller
Date: Thu, 30 Sep 2021 10:31:45 +0200
Message-Id: <20210930103105.v4.2.I3f7f1c9a8e46be07d1757ddf4e0097535f3a7d41@changeid>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210930083150.3317003-1-enric.balletbo@collabora.com>
References: <20210930083150.3317003-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210930_013201_847026_B5AF27E0 
X-CRM114-Status: GOOD (  10.33  )
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

The mmsys system controller exposes a set of memory client resets and
needs to specify the #reset-cells property in order to advertise the
number of cells needed to describe each of the resets.

Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---

(no changes since v3)

Changes in v3:
- Based on top of the patch that converts mmsys to schema

 .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml      | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
index f9ffa5b703a5..763c62323a74 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
@@ -43,6 +43,9 @@ properties:
   "#clock-cells":
     const: 1
 
+  '#reset-cells':
+    const: 1
+
 required:
   - compatible
   - reg
@@ -56,4 +59,5 @@ examples:
         compatible = "mediatek,mt8173-mmsys", "syscon";
         reg = <0x14000000 0x1000>;
         #clock-cells = <1>;
+        #reset-cells = <1>;
     };
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
