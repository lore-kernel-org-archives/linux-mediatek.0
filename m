Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9075CC43219
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Oct 2022 08:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Up4hmzyymHTjoWT3TmVNVIxdTbx/P09flhMWRWRA0Mw=; b=FmfkFi3vj6ssl9TXUH+r9fqRs/
	x1cWv8I/1Ykrf9PxkzdENhOzuWpub1hgxPUYmW0BiJF4NRccYl2nFB5fGKMLXcqAZDjn8FntspKjk
	BAGHrC9ts37K/lUgPnQ8X7XINmfI3CYXvx14x2qmviWlkpGroswdYTFLluCF5hDH+sQB2qoN0NCya
	Vg+K1skNp0eCG+65Q+RpelGIjIR5UEqK6PcJgbBSzxGGOaVMyWs5rLWxDpq3gvpz4TH6dYB5xFb6c
	wMy5jGwHgp3XAX5QqKjNOJsLpHjgpwVk7IH9m77S6F2wodl7tefeDHYAeVt8K5QTzHSzGuu6f5xYP
	7RjP8VRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojGKL-00E8CA-Uu; Fri, 14 Oct 2022 08:45:57 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojGK0-00E844-3b
	for linux-mediatek@lists.infradead.org; Fri, 14 Oct 2022 08:45:38 +0000
Received: by mail-wr1-x432.google.com with SMTP id u10so6520417wrq.2
        for <linux-mediatek@lists.infradead.org>; Fri, 14 Oct 2022 01:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Up4hmzyymHTjoWT3TmVNVIxdTbx/P09flhMWRWRA0Mw=;
        b=k+hJjH5ZQG2OfVOeLe8wHf3VzQdJnSqsThOpkISa8gSdb4m2YIzd0HeNf6VoH3uI99
         CBVAUM2+NMvS/FijeRXRp7HDyh0we/VsisbBOOOu1osdK/nretXGfgwammhB4qoIUuEH
         1TrWc8IowZSea33wtH5c32oEn/KxwvYOtjKmlef2teBNxqPa7+fg9XT7GmoGe4DKkRiY
         kjRz5nWeyAHVNzQgJph79117CJxO3BDMVMU8oE49ksTs1AB/Ga5lnvl0vtxazbteiJtl
         eVe7BSgexsSnQcGmrUI7eSTFS6cEahUJ6xrW3WJO4WJxBcpqONpOZlRdm8ziK9bM/r+i
         Ch9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Up4hmzyymHTjoWT3TmVNVIxdTbx/P09flhMWRWRA0Mw=;
        b=us8hLCbSwNho+kS7P5Yd2eQtTi+BQqvegxBfGOc0lRiXZIpxrCpSd9ndl1X4jzV3Qy
         AqZJuKXAPGhe0M607kRxmLFNES+QZKodKZa7FOQ4fqtUp8pM+j2JRZnUMb/skbZwJqLp
         eUTNTRIIE/APKAwhoGFEEDiGd+PUR5oK7TkJkMyJRxoWcIPaeLVjRMZl1j9BVGVoKPS0
         ybCfDg79yNFVmhgIoTsVRfeDxn9ZntiJYbwusJvhHk9pJ8NrXOECb4vofUvVy0Esu5pR
         JE03ZAUEjKzlATGNbTeGnsk25cYg981lNPH9CgwkwJzaT+JtoIk3dyD0/UjIrW+MixrT
         p38g==
X-Gm-Message-State: ACrzQf174HVSS7FCXWTG0G7VBCfYp6obmWI9XbiQKFNeQ3uLjHoDVunQ
	ZYI+NqTbdfMLJGJ79gOVwO9mVg==
X-Google-Smtp-Source: AMsMyM7g/1PC1TaG0pPAdFupK9gWD8iTrYU/UHkDcwmMXgSSgK6GVs8P3o9eH06ycOfaavxHuxPYow==
X-Received: by 2002:adf:f5c5:0:b0:22e:264b:2179 with SMTP id k5-20020adff5c5000000b0022e264b2179mr2497665wrp.386.1665737133973;
        Fri, 14 Oct 2022 01:45:33 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id m6-20020a1c2606000000b003c452678025sm6684633wmm.4.2022.10.14.01.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 01:45:33 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 14 Oct 2022 10:45:29 +0200
Subject: [PATCH v4 1/3] dt-bindings: iommu: mediatek: add binding documentation for
 MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221001-iommu-support-v4-1-f1e13438dfd2@baylibre.com>
References: <20221001-iommu-support-v4-0-f1e13438dfd2@baylibre.com>
In-Reply-To: <20221001-iommu-support-v4-0-f1e13438dfd2@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, Yong Wu <yong.wu@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-mediatek@lists.infradead.org, Markus Schneider-Pargmann <msp@baylibre.com>,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>, Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org,
 Alexandre Mergnat <amergnat@baylibre.com>, iommu@lists.linux.dev,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=6314; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=veY/apXDPl5JMIMezq7x83zfGltq7KQ6mfnT4iv01CU=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBjSSGrhq0TEcFEc1lz1vsbXk564BtZHQWu+3GtCWRm
 JjPq7u2JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCY0khqwAKCRArRkmdfjHURQxID/
 9KEI/aU1lXOcwXiIqR3Ee+66WlY3ezvJxXIOqeeQ8H1pXPY8RKgjMmh0Hd4S6WkpE+vjAWIhcy9Wv+
 +8jnay2wcSZsaP0xfCiaEFMGtIoq/+d7PAwxQaouojcdkI8at/Uc1prm5B2rM++K8v23CvajfPqpPe
 t7o/7jydpAuquxMYTuib9+F2M2SFTsNGbfWSwf1bReMy6pJEZ2L6qjZzAUnbWHEuPiEOPJUWBupigF
 k1xWAaR6YnJ+VGBQcMS9kETqA3RJtyZN1WfNEtgzTUaMIiKOIafbp3IRhm5o8CfrsQLTvIFxwZYBu8
 WQ3TLCxeVs7BYh04ySB7NWtld+c7pk+UL6l5+xFuh2lKq9ZVgfD5b3L0zNe3PwaN8Ev7mqQ9VhLlj0
 j+so5bgeMEUwXDUbDtVaLHvSkQpmpmbtmUOsQamya/3S1D4W8DmFmatlvprRBHGtTFJjHBjkulw/Fj
 D+HFb0mSuxUVU7+fIJt4dWkKtbKuVovCRFaIBuNTvIkgppKPy3WuLWaHJg1iUfHpo+rwCpGILrFEGY
 w/f+0RKQBl3l4fHcthNKtpYFTJGeco1Apu2EGOUsoApiTAUpKnSGKsoXqar4ezzxkrRjipF9IfV9zO
 PkpB5wGQZnLMTPFlLHr3TIG19MTbR20Xth8HKAMAt5TityhYGOK/nnPNMqdA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221014_014536_154596_F4E10392 
X-CRM114-Status: GOOD (  11.51  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Fabien Parent <fparent@baylibre.com>

Add IOMMU binding documentation for the MT8365 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 .../devicetree/bindings/iommu/mediatek,iommu.yaml  |  2 +
 .../dt-bindings/memory/mediatek,mt8365-larb-port.h | 90 ++++++++++++++++++++++
 2 files changed, 92 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
index fee0241b5098..4b8cf3ce6963 100644
--- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
+++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
@@ -81,6 +81,7 @@ properties:
           - mediatek,mt8195-iommu-vdo        # generation two
           - mediatek,mt8195-iommu-vpp        # generation two
           - mediatek,mt8195-iommu-infra      # generation two
+          - mediatek,mt8365-m4u  # generation two
 
       - description: mt7623 generation one
         items:
@@ -130,6 +131,7 @@ properties:
       dt-binding/memory/mt8186-memory-port.h for mt8186,
       dt-binding/memory/mt8192-larb-port.h for mt8192.
       dt-binding/memory/mt8195-memory-port.h for mt8195.
+      dt-binding/memory/mt8365-larb-port.h for mt8365.
 
   power-domains:
     maxItems: 1
diff --git a/include/dt-bindings/memory/mediatek,mt8365-larb-port.h b/include/dt-bindings/memory/mediatek,mt8365-larb-port.h
new file mode 100644
index 000000000000..56d5a5dd519e
--- /dev/null
+++ b/include/dt-bindings/memory/mediatek,mt8365-larb-port.h
@@ -0,0 +1,90 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2022 MediaTek Inc.
+ * Author: Yong Wu <yong.wu@mediatek.com>
+ */
+#ifndef _DT_BINDINGS_MEMORY_MT8365_LARB_PORT_H_
+#define _DT_BINDINGS_MEMORY_MT8365_LARB_PORT_H_
+
+#include <dt-bindings/memory/mtk-memory-port.h>
+
+#define M4U_LARB0_ID			0
+#define M4U_LARB1_ID			1
+#define M4U_LARB2_ID			2
+#define M4U_LARB3_ID			3
+
+/* larb0 */
+#define M4U_PORT_DISP_OVL0		MTK_M4U_ID(M4U_LARB0_ID, 0)
+#define M4U_PORT_DISP_OVL0_2L		MTK_M4U_ID(M4U_LARB0_ID, 1)
+#define M4U_PORT_DISP_RDMA0		MTK_M4U_ID(M4U_LARB0_ID, 2)
+#define M4U_PORT_DISP_WDMA0		MTK_M4U_ID(M4U_LARB0_ID, 3)
+#define M4U_PORT_DISP_RDMA1		MTK_M4U_ID(M4U_LARB0_ID, 4)
+#define M4U_PORT_MDP_RDMA0		MTK_M4U_ID(M4U_LARB0_ID, 5)
+#define M4U_PORT_MDP_WROT1		MTK_M4U_ID(M4U_LARB0_ID, 6)
+#define M4U_PORT_MDP_WROT0		MTK_M4U_ID(M4U_LARB0_ID, 7)
+#define M4U_PORT_MDP_RDMA1		MTK_M4U_ID(M4U_LARB0_ID, 8)
+#define M4U_PORT_DISP_FAKE0		MTK_M4U_ID(M4U_LARB0_ID, 9)
+#define M4U_PORT_APU_READ		MTK_M4U_ID(M4U_LARB0_ID, 10)
+#define M4U_PORT_APU_WRITE		MTK_M4U_ID(M4U_LARB0_ID, 11)
+
+/* larb1 */
+#define M4U_PORT_VENC_RCPU		MTK_M4U_ID(M4U_LARB1_ID, 0)
+#define M4U_PORT_VENC_REC		MTK_M4U_ID(M4U_LARB1_ID, 1)
+#define M4U_PORT_VENC_BSDMA		MTK_M4U_ID(M4U_LARB1_ID, 2)
+#define M4U_PORT_VENC_SV_COMV		MTK_M4U_ID(M4U_LARB1_ID, 3)
+#define M4U_PORT_VENC_RD_COMV		MTK_M4U_ID(M4U_LARB1_ID, 4)
+#define M4U_PORT_VENC_NBM_RDMA		MTK_M4U_ID(M4U_LARB1_ID, 5)
+#define M4U_PORT_VENC_NBM_RDMA_LITE	MTK_M4U_ID(M4U_LARB1_ID, 6)
+#define M4U_PORT_JPGENC_Y_RDMA		MTK_M4U_ID(M4U_LARB1_ID, 7)
+#define M4U_PORT_JPGENC_C_RDMA		MTK_M4U_ID(M4U_LARB1_ID, 8)
+#define M4U_PORT_JPGENC_Q_TABLE		MTK_M4U_ID(M4U_LARB1_ID, 9)
+#define M4U_PORT_JPGENC_BSDMA		MTK_M4U_ID(M4U_LARB1_ID, 10)
+#define M4U_PORT_JPGDEC_WDMA		MTK_M4U_ID(M4U_LARB1_ID, 11)
+#define M4U_PORT_JPGDEC_BSDMA		MTK_M4U_ID(M4U_LARB1_ID, 12)
+#define M4U_PORT_VENC_NBM_WDMA		MTK_M4U_ID(M4U_LARB1_ID, 13)
+#define M4U_PORT_VENC_NBM_WDMA_LITE	MTK_M4U_ID(M4U_LARB1_ID, 14)
+#define M4U_PORT_VENC_CUR_LUMA		MTK_M4U_ID(M4U_LARB1_ID, 15)
+#define M4U_PORT_VENC_CUR_CHROMA	MTK_M4U_ID(M4U_LARB1_ID, 16)
+#define M4U_PORT_VENC_REF_LUMA		MTK_M4U_ID(M4U_LARB1_ID, 17)
+#define M4U_PORT_VENC_REF_CHROMA	MTK_M4U_ID(M4U_LARB1_ID, 18)
+
+/* larb2 */
+#define M4U_PORT_CAM_IMGO		MTK_M4U_ID(M4U_LARB2_ID, 0)
+#define M4U_PORT_CAM_RRZO		MTK_M4U_ID(M4U_LARB2_ID, 1)
+#define M4U_PORT_CAM_AAO		MTK_M4U_ID(M4U_LARB2_ID, 2)
+#define M4U_PORT_CAM_LCS		MTK_M4U_ID(M4U_LARB2_ID, 3)
+#define M4U_PORT_CAM_ESFKO		MTK_M4U_ID(M4U_LARB2_ID, 4)
+#define M4U_PORT_CAM_CAM_SV0		MTK_M4U_ID(M4U_LARB2_ID, 5)
+#define M4U_PORT_CAM_CAM_SV1		MTK_M4U_ID(M4U_LARB2_ID, 6)
+#define M4U_PORT_CAM_LSCI		MTK_M4U_ID(M4U_LARB2_ID, 7)
+#define M4U_PORT_CAM_LSCI_D		MTK_M4U_ID(M4U_LARB2_ID, 8)
+#define M4U_PORT_CAM_AFO		MTK_M4U_ID(M4U_LARB2_ID, 9)
+#define M4U_PORT_CAM_SPARE		MTK_M4U_ID(M4U_LARB2_ID, 10)
+#define M4U_PORT_CAM_BPCI		MTK_M4U_ID(M4U_LARB2_ID, 11)
+#define M4U_PORT_CAM_BPCI_D		MTK_M4U_ID(M4U_LARB2_ID, 12)
+#define M4U_PORT_CAM_UFDI		MTK_M4U_ID(M4U_LARB2_ID, 13)
+#define M4U_PORT_CAM_IMGI		MTK_M4U_ID(M4U_LARB2_ID, 14)
+#define M4U_PORT_CAM_IMG2O		MTK_M4U_ID(M4U_LARB2_ID, 15)
+#define M4U_PORT_CAM_IMG3O		MTK_M4U_ID(M4U_LARB2_ID, 16)
+#define M4U_PORT_CAM_WPE0_I		MTK_M4U_ID(M4U_LARB2_ID, 17)
+#define M4U_PORT_CAM_WPE1_I		MTK_M4U_ID(M4U_LARB2_ID, 18)
+#define M4U_PORT_CAM_WPE_O		MTK_M4U_ID(M4U_LARB2_ID, 19)
+#define M4U_PORT_CAM_FD0_I		MTK_M4U_ID(M4U_LARB2_ID, 20)
+#define M4U_PORT_CAM_FD1_I		MTK_M4U_ID(M4U_LARB2_ID, 21)
+#define M4U_PORT_CAM_FD0_O		MTK_M4U_ID(M4U_LARB2_ID, 22)
+#define M4U_PORT_CAM_FD1_O		MTK_M4U_ID(M4U_LARB2_ID, 23)
+
+/* larb3 */
+#define M4U_PORT_HW_VDEC_MC_EXT		MTK_M4U_ID(M4U_LARB3_ID, 0)
+#define M4U_PORT_HW_VDEC_UFO_EXT	MTK_M4U_ID(M4U_LARB3_ID, 1)
+#define M4U_PORT_HW_VDEC_PP_EXT		MTK_M4U_ID(M4U_LARB3_ID, 2)
+#define M4U_PORT_HW_VDEC_PRED_RD_EXT	MTK_M4U_ID(M4U_LARB3_ID, 3)
+#define M4U_PORT_HW_VDEC_PRED_WR_EXT	MTK_M4U_ID(M4U_LARB3_ID, 4)
+#define M4U_PORT_HW_VDEC_PPWRAP_EXT	MTK_M4U_ID(M4U_LARB3_ID, 5)
+#define M4U_PORT_HW_VDEC_TILE_EXT	MTK_M4U_ID(M4U_LARB3_ID, 6)
+#define M4U_PORT_HW_VDEC_VLD_EXT	MTK_M4U_ID(M4U_LARB3_ID, 7)
+#define M4U_PORT_HW_VDEC_VLD2_EXT	MTK_M4U_ID(M4U_LARB3_ID, 8)
+#define M4U_PORT_HW_VDEC_AVC_MV_EXT	MTK_M4U_ID(M4U_LARB3_ID, 9)
+#define M4U_PORT_HW_VDEC_RG_CTRL_DMA_EXT MTK_M4U_ID(M4U_LARB3_ID, 10)
+
+#endif

-- 
b4 0.10.1

