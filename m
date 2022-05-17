Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ABB8C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 May 2022 13:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uj5j0/78aSi0MFlNZ/ejF2ibyc39650DclLQXN8xDyI=; b=kc1jzuA9fjeVGg
	lSHhWj0oprQz0eWIAEFl9zRg2xosJzo/LYI3DLiaJb3IcnlLZ69GQTcc3FLCPmkYFIzpcGyMu4P28
	SjIao0gkYhgCqc6nZAfeXdZJVGaSQUWf8xxxiD1QWpEymwyBf/YLV47WxQGXU9XGW1tTkIjDy1Pml
	tISnyIralCI/a0IG8vTWQYxKaQd+MH6pZFGzXN8+YkFOrMKeVnQSKzmguEeF0qKitY0GLjfQf55vs
	cQrjTD5A3ztcTyz6KK8MFlztQHJSmYwLT8TYTgCIAocyGK4w5zQUdM2KN3oAC14RrjfOOjbcxrdeY
	W3KRPZx7M474WlR8ABrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqxPF-00DyaT-Gr; Tue, 17 May 2022 13:38:33 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqx8Z-00Drxg-QN; Tue, 17 May 2022 13:21:21 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id E218B1F43490
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652793678;
 bh=NSHC9jr1SktgRyogww62O4j6dftElLCQcN59dUpsrwQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mg9vgY26ZsZkR1bhWe/HrA3BhQ0yR740ZsnUBGWgAPNItH3WIG9vIRmfyGM1lrSjX
 Yehh33G3DOMxOp9pEQKx00aIUckLohR2nDQ/pDaTzRxX5Y2lMD1jiywpPKC6P2QHo3
 9z4V8ABheLJI6wDdFRU8O+B2QVUW+Zpy5+GDwrwKBrTj4ghoKzZV9+KkOBkCt2h6o3
 WxYZm90xyFTqs2VF64tTVsZsJJiYi6VuvxosuFdTGd3CxdF+D3cJ1Oq54RDtErmJUA
 K9T+FZmtN6dV3EIi9w6O4/EA8T9dvV1K+M59ooPWlqqZ2aa4vvD3SLSDbbXx+rWI3K
 xOpU1OaJXYQ7Q==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: yong.wu@mediatek.com
Cc: joro@8bytes.org, will@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 7/8] dt-bindings: iommu: mediatek: Require mediatek,
 infracfg for mt2712/8173
Date: Tue, 17 May 2022 15:21:06 +0200
Message-Id: <20220517132107.195932-8-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220517132107.195932-1-angelogioacchino.delregno@collabora.com>
References: <20220517132107.195932-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_062120_017291_2658B6A2 
X-CRM114-Status: UNSURE (   8.34  )
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

Both MT2712 and MT8173 got a mediatek,infracfg phandle: add that to
the required properties for these SoCs to deprecate the old way of
looking for SoC-specific infracfg compatible in the entire devicetree.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/iommu/mediatek,iommu.yaml    | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
index a6cf9678271f..17d78b17027a 100644
--- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
+++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
@@ -175,6 +175,18 @@ allOf:
       required:
         - power-domains
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt2712-m4u
+              - mediatek,mt8173-m4u
+
+    then:
+      required:
+        - mediatek,infracfg
+
   - if: # The IOMMUs don't have larbs.
       not:
         properties:
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
