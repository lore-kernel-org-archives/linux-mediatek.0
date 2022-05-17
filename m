Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4909C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 May 2022 13:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pKSospZ62Zc947nfVWoQchn8IdKMa6MSbN1Z/L8AKYI=; b=YZBXtaFQDSDqmV
	DAbMxvxlL3Wn/1WK9d+uPTR873B1kl5GZHEEKLunRmqGtvSuzmF7UmJVhISchNGcBCM1hqQcmUOT5
	eOfYhNiVcfr2bRQihfKstiVEzZEp9rq6A0B/YqfEheMxkDnoUeRhz+tvqw5Z0GOzyuiqbacKD2H7n
	LezzJY04AhsdN0vX3GjNCcSJRQog9o/+AwDE+YEStjCYl25loRupML6QCLnmqIJ2o0FGJNAU1CvxI
	rUXXwI/MFjo4RB0s5lgxgbR9V3sirCdttjgGXPTpQW7vovG7f7rZbdgmki4tmc+Dm9WQwXcKfYeJj
	Umnjt9mw2UzA60IBVhRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqxNA-00Dxi6-Rx; Tue, 17 May 2022 13:36:24 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqx8V-00DrvZ-PG; Tue, 17 May 2022 13:21:17 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id C94481F433FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652793673;
 bh=PV/c5CsQfIEeeK1hM+QeRKiJih/2FjYi3kjZiefnius=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FbaJmAgGCe4rbB7Isi1Deq0+sZu4HnAwVsOVzYvgyjc0lzSa+1eAGbdlEzNtP/cU0
 ajJjmmbxhCPuTdRzhI4o6sX/Dji+385KB8uRFWgxlqGGyeWyEHN36wxJdr7dX2FEVY
 9H9Gdh54JH9NRpRookRdVCLcE7cjDzGm3YUQGo7C3o4rJDQfaBMgcFKN9P0zEbLViT
 RwCSEf44skMDOYcWkthTAxfc1Tg9MLX9CguAwgHdp0Cw4dfZHSiAqY+aT7ekvz4g/M
 FgPb6F4oW9fZSN4A07DWbZM4Z0sYPU3d+wF54oPBbRM/nIELyQRPVysFBHOUv+JnWY
 je++8ZeN7B16w==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: yong.wu@mediatek.com
Cc: joro@8bytes.org, will@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 1/8] dt-bindings: iommu: mediatek: Add mediatek,
 infracfg phandle
Date: Tue, 17 May 2022 15:21:00 +0200
Message-Id: <20220517132107.195932-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220517132107.195932-1-angelogioacchino.delregno@collabora.com>
References: <20220517132107.195932-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_062116_014170_B49F253D 
X-CRM114-Status: UNSURE (   8.57  )
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

Add property "mediatek,infracfg" to let the mtk_iommu driver retrieve
a phandle to the infracfg syscon instead of performing a per-soc
compatible lookup.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
index 2ae3bbad7f1a..78c72c22740b 100644
--- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
+++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
@@ -101,6 +101,10 @@ properties:
     items:
       - const: bclk
 
+  mediatek,infracfg:
+    $ref: "/schemas/types.yaml#/definitions/phandle"
+    description: The phandle to the mediatek infracfg syscon
+
   mediatek,larbs:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     minItems: 1
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
