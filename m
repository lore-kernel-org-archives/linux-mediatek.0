Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F3BC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 10:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YpPGihTAG2lgpY02Mktgd6LXvXHsDXOSxApw15KQhdI=; b=NfY5JSxeSXxjKc
	OYTmbfRac8Ezb6NXpno/fKvzp1FMRxNdavXAiEo1GEWCAJY6owM/WIYvDMGuLybcpCyIFVrtpU28S
	YMtICEpj1dPYFurbXAZu0jPstrawJa3hHQf+CnI3tk7jI2ROgI/KD6115VF4vE74TYLhyu1j6CXNS
	eMOeBtC2SAbQZjXjrPf3mKoNnKLaijbfxqNygzBTaDYhrEu97STH00tj/ON9xxnxKxHYKPQGrwId0
	SbSYRHTLDCbZBa2shiH9kFaI3CNyb9NwTkG1+ShuYBeha1EajAWOb98Ig+He9f0JPNoa9H21S9a/T
	aoBFFr3tHnfN3F0Ochdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrGZy-001FZh-Au; Wed, 18 May 2022 10:06:54 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrGYQ-001EgU-F5; Wed, 18 May 2022 10:05:20 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 73E8D1F44E0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652868316;
 bh=xqId+HG46WeS4vw+PN9qoFt/EVggOMa2jWD4Kmnw1DA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CcH2GTIWkCcwoJU3BLHr5f1qUd7wqGQkjJekXU6U9Z4nAbjLOKs/wV5uP2lzrWZ6T
 OR2k6euZ8hcdFlYR59HkJ9iRL8NjE0ED2ht9+ZqSen4bmw0kgmQXIfUa9RFvk+ucxo
 sA2oIVPaJd18oEVgvQrvkLC145fNbL734lDh+MSlb+4R7aiMIoDfz9EZGkoXB0v9Dt
 c0PPEFRq6NcjoTJIRscHV2yuJ7f4uLHw5n6omifVwt2rVo0RpiXsE2FCeO9w8vilJ/
 b4Zt5gX7hJ+qtHOCCQ/irB01cBBt1rIQxfBlEmRqp5pOHoIPMAGtLoe+mKVGlm4nhD
 Y2usH/93JX1Jg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: yong.wu@mediatek.com
Cc: joro@8bytes.org, will@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, krzysztof.kozlowski@linaro.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>
Subject: [PATCH v2 6/7] dt-bindings: iommu: mediatek: Require mediatek,
 infracfg for mt2712/8173
Date: Wed, 18 May 2022 12:05:02 +0200
Message-Id: <20220518100503.37279-7-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220518100503.37279-1-angelogioacchino.delregno@collabora.com>
References: <20220518100503.37279-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_030518_669085_32B8C456 
X-CRM114-Status: UNSURE (   8.54  )
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
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/iommu/mediatek,iommu.yaml    | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
index c4af41947593..acc2d7e63a9f 100644
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
