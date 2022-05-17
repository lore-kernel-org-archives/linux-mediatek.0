Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC74C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 May 2022 13:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eJiYKzFfKHdcmt2EQVSQBtgux/HFAAXBcTzXd4CTAwM=; b=jI3jbhwSVylAqW
	68uxaZsx7QNZWJRABk/xM9G0/FIeYLAnhpHEw9vmqIlhvxiH2APugIcDdSXwnuCSLz0dvMtjfZEER
	J2YjylWkxwzat0rwd1j/PfoEQdvcU2hRmtqSGVi905eLar2FUm/j3wQLu4KbMSUDausAtTswl7kHl
	0fu/5L069VPS+Wv9myKxQYjg/PahUw386ugvvgZju9ombIZli0YhyloOf3ha9j1ZsowfTWWVqG9Ae
	T3nL8vwWCUpHhh8lsOoJL1ZikqOluvGoYniC5z007pONrUnHdsiN9+O9r6ApF5DJBP8p2ttzEpSyg
	UIzcsTSc9GmJGdKBOEAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqxP3-00DyVB-SM; Tue, 17 May 2022 13:38:21 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqx8W-00Drvn-Cp; Tue, 17 May 2022 13:21:18 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 826481F43400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652793675;
 bh=4okfIjIm+hnY/zUZA5OTvdiC6J+Y0f3qgmZrTuLC8jo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TDFVs0hPgbko7BwC7qA+BryOxNJ0dC6XXfmGM/pL3VlOhXUD09UOGsL6T1IT+ilxy
 mJ+QvxRTpivjB4gGUX/NF3Ko5RFm3NIeg8ZlW3es8DcLbcTZywdHk2/8D8ioAanG1X
 lh6IqWT+v8oNE+QJEOnJgAQ0MDfouEFehge+mwrrxaFJaFWUCrduWiizjR5YOBwy/x
 SdKEKe7m5jdz7e6JKnEy+BRMiI/P0xO4iulYZCOD8pUNwU3uNdhVqCdiLGY0usH0Gp
 qPQlLCZEp0nAEbA89nZyk6em/SbdaO2vmJXi/prvdtBociicl2ceoToEnK+XzTjA4g
 LGyxAXDr1t8SA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: yong.wu@mediatek.com
Cc: joro@8bytes.org, will@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 3/8] dt-bindings: iommu: mediatek: Add mediatek,
 pericfg phandle
Date: Tue, 17 May 2022 15:21:02 +0200
Message-Id: <20220517132107.195932-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220517132107.195932-1-angelogioacchino.delregno@collabora.com>
References: <20220517132107.195932-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_062116_633678_2CA23FC3 
X-CRM114-Status: UNSURE (   9.17  )
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

Add property "mediatek,pericfg" to let the mtk_iommu driver retrieve
a phandle to the pericfg syscon instead of performing a per-soc
compatible lookup, as it was also done with infracfg.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
index 78c72c22740b..a6cf9678271f 100644
--- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
+++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
@@ -116,6 +116,10 @@ properties:
       Refer to bindings/memory-controllers/mediatek,smi-larb.yaml. It must sort
       according to the local arbiter index, like larb0, larb1, larb2...
 
+  mediatek,pericfg:
+    $ref: "/schemas/types.yaml#/definitions/phandle"
+    description: The phandle to the mediatek pericfg syscon
+
   '#iommu-cells':
     const: 1
     description: |
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
