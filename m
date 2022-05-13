Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67460C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 May 2022 15:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q2lLs0L6XHzyjqTcmE2lN/CMebAP2pei9x3se9TcKN4=; b=YjQCOHlhNYMI7Z
	mc9tDcFO5C+7J2EIDh+JDQny9k0Hxj+oWwEZslRQSknq1N2H2+oqIF3fjNBcYx0lkhOfItA+2DC8h
	ai5Ck8nHD9vokwvsQvjmOdeebjGZyMSHSEFaBhKgb+OMD7wZmsQvDNBfR0492HTOT6LyI7AIIMjo9
	oX68GkgK0bjH8+V7x/m6fVR8VJuvB7pKr+ZuqZLOqkh22BLVWqeN1bSUBN5TsgkY8q4qqRARaPxBt
	2mrLgp6TCf8m2ul6tu5IXGZfxGunl/zrXJDyDiT8Ldgo2DxalD8cTcZatoxqY1FhK6w5xZ1c9j+Va
	3psjXSBrB6nYRWQRtBIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npWnc-00GYIS-HF; Fri, 13 May 2022 15:01:48 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npWnG-00GY9e-O0; Fri, 13 May 2022 15:01:28 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 476321F461F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652454085;
 bh=67EnZKy5K5mDCLThDhmr9nLxfLMQyeNafBIln7pk/sI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=awxNhTv5mMVJ6MJ0xtCh/9vn+Mt9CCoJsJ1Ph4mLIs1aFY7n16LIcp174CFx/NMBj
 qMqBFMp6VF9vxhCSZ8yIIGYoR2663U4OdM/ofcYqdzQUMSSfmrSNGf9T43lrE51bFN
 SayE2b8xjky4cIZu3m0S4dHYjeMskrnQtyJtQ4SiPpMINJGl0yfhxtv1yLGpYgXZGM
 HeJnvlkOr9apf2O3XC9Sdmq2qzzHB8wjK2CNEVgS8tOCe+jjW8g7Y1t3dawPDMRiYl
 dPVOSlu+QVzKwvhrHTk9WQzhe+BXT90nvbstipjAoWHcIGseOhcNGZTxnKwUXyDcCN
 g2tkLdzp5IADQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: yong.wu@mediatek.com
Cc: krzysztof.kozlowski@linaro.org, robh+dt@kernel.org, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
 martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, paul.bouchara@somainline.org,
 kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 1/2] dt-bindings: memory: mtk-smi: Add MT6795 Helio X10
 bindings
Date: Fri, 13 May 2022 17:01:15 +0200
Message-Id: <20220513150116.349744-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220513150116.349744-1-angelogioacchino.delregno@collabora.com>
References: <20220513150116.349744-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_080126_946576_67ACC3EA 
X-CRM114-Status: UNSURE (   7.74  )
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

Add SMI bindings for the MediaTek Helio X10 (MT6795) SoC

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/memory-controllers/mediatek,smi-common.yaml         | 1 +
 .../bindings/memory-controllers/mediatek,smi-larb.yaml           | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
index a98b359bf909..71bc5cefb49c 100644
--- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
@@ -32,6 +32,7 @@ properties:
           - mediatek,mt2701-smi-common
           - mediatek,mt2712-smi-common
           - mediatek,mt6779-smi-common
+          - mediatek,mt6795-smi-common
           - mediatek,mt8167-smi-common
           - mediatek,mt8173-smi-common
           - mediatek,mt8183-smi-common
diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
index c886681f62a7..59dcd163668f 100644
--- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
@@ -20,6 +20,7 @@ properties:
           - mediatek,mt2701-smi-larb
           - mediatek,mt2712-smi-larb
           - mediatek,mt6779-smi-larb
+          - mediatek,mt6795-smi-larb
           - mediatek,mt8167-smi-larb
           - mediatek,mt8173-smi-larb
           - mediatek,mt8183-smi-larb
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
