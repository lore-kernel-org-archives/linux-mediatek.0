Return-Path: <SRS0=pvhC=NQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45770C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 10:39:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 164E960C3E
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 10:39:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 164E960C3E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nolNDL2GEhE8VXmDNOq7u1DydV37bIlCgGOFivSD2tE=; b=kjdiYgyGcJ1Otx
	DUoA4GMFX+qSYC3y4TxzKwFjibroWq9A2QzZA3wHXmPtAyGLWL8cCaJyrUOGFfyZhnFg650bKSKMZ
	b42gQR6Rm2ohl4cyrYgiMl72pjk+0Dm1vlmbweeF7feHD+wP9SMMAxqmM0nSG016vgQ0G0qupgg6Q
	YgTlErqh80fKBzbafInhlmlbhfYrmr7MOHjyCqmyKTRIvQZfvsVZ3lz238PXfMgZexZlK3cqwKB3I
	H0rFY/c+Ggbo5q0YWmAZqDsJvBo0PeSBbQQGy8HTLiqftqSmHsZmFuHd30SOpOmF2zdg8KI5jEaop
	LiJ1rJ64Wferi0BiiIHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIqJ5-006ZKj-De; Wed, 25 Aug 2021 10:38:55 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIq7G-006Tno-Ta; Wed, 25 Aug 2021 10:26:45 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id AE0041F43704
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: matthias.bgg@gmail.com, hsinyi@chromium.org,
 linux-mediatek@lists.infradead.org, jitao.shi@mediatek.com,
 eizan@chromium.org, drinkcat@chromium.org, chunkuang.hu@kernel.org,
 kernel@collabora.com, Fabien Parent <fparent@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 2/7] dt-bindings: mediatek: Add #reset-cells to mmsys
 system controller
Date: Wed, 25 Aug 2021 12:26:27 +0200
Message-Id: <20210825122613.v3.2.I3f7f1c9a8e46be07d1757ddf4e0097535f3a7d41@changeid>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210825102632.601614-1-enric.balletbo@collabora.com>
References: <20210825102632.601614-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210825_032643_165278_F8C8516D 
X-CRM114-Status: GOOD (  10.71  )
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

Changes in v3:
- Based on top of the patch that converts mmsys to schema

 .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml      | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
index 2d4ff0ce387b..96ca16927a06 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
@@ -42,6 +42,9 @@ properties:
   "#clock-cells":
     const: 1
 
+  '#reset-cells':
+    const: 1
+
 required:
   - compatible
   - reg
@@ -55,4 +58,5 @@ examples:
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
