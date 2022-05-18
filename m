Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71068C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 10:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ltPvbyROkEI5FaYscWcK58fi31g68/uPc7afhSI8SOM=; b=PZcA1Bnx+k0Jh6
	3pxKSv+yMR9CZhBCmtkoTSK38sIbkEOewDsGCdMJVxgB7cuzNk9yEPLah5MB66Ft7t1FHEDp1m2mV
	GrnDKR+x1/y/G1lczLvTvMY1pdfH0YdANr6fuKC/hu+xxotOS/4uH2nUw5h9lUfypH3MniO9RQdH5
	4XvmABu7Ntqr5QnBfSYQfEV0SIQGTLkYXNncN5PXZSy0z9k+JRqr/P4TPyxdH6EjwSelmREPQ6CrR
	aUQd5XSdvGRcKFHDq3jKg/yXJYiMTT6GwyJv9sD58J/c7h9mPA4poO5X47D/pOW9jvKeVEjR50Okq
	0/7iSMGTQz9tiItcbSBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrGYj-001ErX-WE; Wed, 18 May 2022 10:05:38 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrGYM-001Eer-Np; Wed, 18 May 2022 10:05:16 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 61ED61F44E08
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652868312;
 bh=QldET8Tith6XpQTESLUFmBU4bL4nM1vDAby2xnsh/3s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OKHk/q8oiV3Jx3vURxCYvrr6N5xQTM4Rz6VneBa345wqTTsd7cyy706N9/c1Ef0LL
 Uo1pcr/J2bfK7IVi5S9JVpE/Nzf6FstsiVPOvRJl4MlMxGL3Ffaak2NLVO+DSIGoEY
 JuzIue3TVMTOZMsjQrkpI9Klyql3w06eO6Iz1ewjzOf5gReh2QeNyB+tIjoZ01uTu+
 RdSzpYgDrgYJ08oMFOboynMNmbYDJas7zfM/stIogyptfG2a+ilzRJAhVi84l5a61K
 Od5YBOeDWxAzgYZvKUQs10U5B9x8RW2k5FderWzNRBuPsanB3Bl88sZmBErSkoRv4z
 TMN2KNghaK3dA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: yong.wu@mediatek.com
Cc: joro@8bytes.org, will@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, krzysztof.kozlowski@linaro.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 1/7] dt-bindings: iommu: mediatek: Add phandles for
 mediatek infra/pericfg
Date: Wed, 18 May 2022 12:04:57 +0200
Message-Id: <20220518100503.37279-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220518100503.37279-1-angelogioacchino.delregno@collabora.com>
References: <20220518100503.37279-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_030514_946117_7FCD4502 
X-CRM114-Status: UNSURE (   8.95  )
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

Add properties "mediatek,infracfg" and "mediatek,pericfg" to let the
mtk_iommu driver retrieve phandles to the infracfg and pericfg syscon(s)
instead of performing a per-soc compatible lookup.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/iommu/mediatek,iommu.yaml         | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
index 2ae3bbad7f1a..c4af41947593 100644
--- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
+++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
@@ -101,6 +101,10 @@ properties:
     items:
       - const: bclk
 
+  mediatek,infracfg:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle to the mediatek infracfg syscon
+
   mediatek,larbs:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     minItems: 1
@@ -112,6 +116,10 @@ properties:
       Refer to bindings/memory-controllers/mediatek,smi-larb.yaml. It must sort
       according to the local arbiter index, like larb0, larb1, larb2...
 
+  mediatek,pericfg:
+    $ref: /schemas/types.yaml#/definitions/phandle
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
