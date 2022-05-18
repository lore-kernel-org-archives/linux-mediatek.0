Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 412FAC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 10:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uIZ/mRbG/FS8qRW2tdojconYVvxIqByv+MaEyYQZi8Y=; b=zAIWOlOnfVyzVW
	3twDf84NEQ6TwnZxcd1oko+4XkBfGJa9ZCJyunD7TDlx/ImHstQPIpdOlDYdv0/olSiypGpogww5C
	J4HrmyWaHuOV12LCvijR8Cp08FqH0WpYY4wYK6j7ojVoLy5HhGYhjCiTUGLnSUzSkjiwB2tbRLvtZ
	+yJGaqO/NKki3hai+ki+/vRrSKmYLkZLtxnmSCSWl9GUakbghJaylngB/ieNMpI6H/j/FKWEPP6w6
	28Sv4lRFTi5VmptXJdsG4b0NkXlaw286dVBMymN1MbCysv5tCXZdUYokZv24KEwMjS4wEsI7NUHVT
	ydrCPpaTys0QJlWT7D/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrGZc-001FJB-Ds; Wed, 18 May 2022 10:06:32 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrGYQ-001EgN-60; Wed, 18 May 2022 10:05:19 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 541381F44E0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652868317;
 bh=4U43Hk0oR+7PqSrme9R8NUK5uKhAJqw2cEX5plkCcas=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oISrE18fc4v2OSj7weSR5GM4xjVru/lLSV6xAoSfBKZ5F6BfOIJuhtbEZ2K5P3phv
 YPkg54ufDLgpHUk+spVlQnoW0QNyQMmx3o5tfIhl7sPjLxuUMjirt+6DTD2vfj897L
 CjE/1xubPJ7W9f3tD4d9BknMRlYxde+xPH2bPhQLgCRFqpXIzAA39HOra8AyMGePfp
 6Hx6MKCgWuCaFwsnBBw7WviOisT1smTGVGrmjWOKjv1Cb71nnS/MkYrpmYbJxicHjv
 FzXp9VlkKFH53Sdv3qRCOMqCcmGvV8ycijBhi38tfiilDVwTRMltr7qPuXT9FAbMR8
 Rxi/DboN31xQQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: yong.wu@mediatek.com
Cc: joro@8bytes.org, will@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, krzysztof.kozlowski@linaro.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>
Subject: [PATCH v2 7/7] dt-bindings: iommu: mediatek: Require mediatek,
 pericfg for mt8195-infra
Date: Wed, 18 May 2022 12:05:03 +0200
Message-Id: <20220518100503.37279-8-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220518100503.37279-1-angelogioacchino.delregno@collabora.com>
References: <20220518100503.37279-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_030518_426255_14D2885A 
X-CRM114-Status: UNSURE (   7.35  )
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

The MT8195 SoC has IOMMU related registers in the pericfg_ao iospace:
require a phandle to that.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/iommu/mediatek,iommu.yaml      | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
index acc2d7e63a9f..d5e3272a54e8 100644
--- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
+++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
@@ -187,6 +187,16 @@ allOf:
       required:
         - mediatek,infracfg
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8195-iommu-infra
+
+    then:
+      required:
+        - mediatek,pericfg
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
