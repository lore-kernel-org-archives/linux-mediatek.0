Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39BE6C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Oct 2022 13:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mjs+yH1Iz0BH8osNCRNlGRJBryN3MA31rka3aIbAkrk=; b=AIl2bf4lsKmpZzd2NuSo3J2oH1
	8/VuZ3PVpiQwx1rjX9CnX68px5wBBGLXNzjYG1Rg9GvW/U2dTT9V1Jd+OxubnnRXqfPqLoYF5nJmd
	lxN2t3BB9xYL1ZUCfnT8EoHCVuZlsYLYxxkYLv2Tfz8PAGZOsL3elkEbGZgYQJ6fyZL4GSkjxiUJj
	aXSM8D9EDiKD7KWr9vpy6BhcYehDWfG4d1qk+fIhGB/6cLXgHySisWIRaat7Uot2ppRTOBVT8AUSa
	16vTjPMe7554FODFj4wz+898b6EyrbZXXzRKL0ynKUqzFDTKTF5MCtUAwBfv9q2y/BdptX3OD6LFs
	KBVGvZsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olsIM-00861T-Ul; Fri, 21 Oct 2022 13:42:42 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olsI2-0085oy-Oy
	for linux-mediatek@lists.infradead.org; Fri, 21 Oct 2022 13:42:27 +0000
Received: by mail-wr1-x431.google.com with SMTP id bv10so4925552wrb.4
        for <linux-mediatek@lists.infradead.org>; Fri, 21 Oct 2022 06:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mjs+yH1Iz0BH8osNCRNlGRJBryN3MA31rka3aIbAkrk=;
        b=TpetprZ9Jpe+mwO8M1cTCMDW+uqrilKaaHBKWS9o2SRIqE/N6hFVBub7PS34IXWwCs
         GQGjhVDULnPCQIT9ZHZiLKZ0Zbhwcd+hMDhR7L3P3FJsCyGDRHNYq99rEG/3HfFXtd1K
         c6djBtGH1+pPUL9QgKh9mx0QB7G9eXizwnZT/IjuTHKj072VnZodsVRzF8B16UKodfRE
         wvzMq/xU9sYHijuNUsIOI9GSIVIEDH48NuKLNCnRlhkKw5pEp+aILuwfYXckkgfSIQS/
         bgx4735rfFGhzXXC1/eBUp5LpJxGKzmJ/Q4UajbS5rclN4nDis5aJtSGQ7y4AF3FyXQA
         fI3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mjs+yH1Iz0BH8osNCRNlGRJBryN3MA31rka3aIbAkrk=;
        b=QUSetaPrly5+iXYmu1bRwgNqEWZfvssz1mLFxC76cfkRhpPzvL+qbeBmQLCiaS7YDe
         Uv7EfATWsuxPBP89ZR9QIiSliVnDGAt04g6LKYIbsfXMDCQPM1GhdOR/lMd9ztQ35w1o
         eCfGYJBhwffkMAL2F8MX7I8CgcnDwXaGGhWTv0bxrXEr4JWHhY8dx6/kI6j9Z+S5KB4n
         ahjpEX2/Bi6Pq7fS/4hFmiDF/b1hiew04uBdeyx7+MxopiaH1YdaDeZORlpKf5IoyqUy
         TT2CZwxtILB5ldJXQQEyClEgf566n3RKsGe7ae5/qWHMg27sWbfzL24VAR+V+r8WS3Ff
         BLGQ==
X-Gm-Message-State: ACrzQf2E5ySf54eK4Oxtv2BCrWqzyxPvCP70GJbqRkXRbHZffI3/yGo5
	sv8yOgde3slyUVmypr6DDpA+hw==
X-Google-Smtp-Source: AMsMyM6Y2lZTPOHJXGMbEI3ZmuWcHzEFa8E/W24ygiw1pQ+lFxTYaFU357vJcTvltlKWsDOJTCTeDw==
X-Received: by 2002:a5d:4c44:0:b0:22e:3503:41bf with SMTP id n4-20020a5d4c44000000b0022e350341bfmr12744044wrt.0.1666359741231;
        Fri, 21 Oct 2022 06:42:21 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id h5-20020adfe985000000b002322bff5b3bsm22966355wrm.54.2022.10.21.06.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 06:42:20 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 21 Oct 2022 15:42:16 +0200
Subject: [PATCH v5 1/3] dt-bindings: iommu: mediatek: add binding documentation for
 MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221001-iommu-support-v5-1-92cdbb83bbb8@baylibre.com>
References: <20221001-iommu-support-v5-0-92cdbb83bbb8@baylibre.com>
In-Reply-To: <20221001-iommu-support-v5-0-92cdbb83bbb8@baylibre.com>
To: Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Yong Wu <yong.wu@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Will Deacon <will@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Alexandre Mergnat <amergnat@baylibre.com>, linux-kernel@vger.kernel.org,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>, devicetree@vger.kernel.org, Fabien Parent <fparent@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, Markus Schneider-Pargmann <msp@baylibre.com>, linux-mediatek@lists.infradead.org,
 iommu@lists.linux.dev, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=6323; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=bjujOEJOmte4Q0nMLGC9jOfT8P/gg1zyjtAa0WESOcE=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBjUqG7vaKmb7CwtuCwQKbjClqBPo0wbEMORrM/Bahf
 TETIfjaJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCY1KhuwAKCRArRkmdfjHURTyOD/
 kB33ak4rZf5dqO2TurFoY1j54p7473J0+KzBW9kU+Al8iWlxU5eE/1bqRK6MjhTm3KetP5TRcXHKng
 xNIlYYFxqYUK5JJDvA2fyM0YNb8janMwmJn1EMy9G7P3a8qlg7kHFrKW8FK2VqMUqIx9DHz1nGFtC/
 4is3+IpQTlRZMuoe6Jmi9CXqxUOOh2OYzIJXLZ+zEBGGGDHS0HxH/PdWqcWd2vnCcLew44WoSbMRkM
 n1qyVHz2FIoBFRmLuTnsPUGWVlrjWYIVFHecVoRaZTf2Dr2ij0loSDU1g190BHMIEmgtei6N81DbXW
 uDo4O9Ut3rOkW4sZ7mmOqsbTEbtVToz2SO05OE7gB1GPL5jbbRXPTGYh8aUIgzEBFB1JH7E15Jq/6O
 AEvZbRZGqt5AWRMpSYVsBTVmm3djf2e4/XLeSg9qVezEu2NqLD1YF6aoBCsaA8ZyIpfDNklrGil/2w
 46B2VDpSnYpOSvb82aKn3ztpBRppU6w0slBr6evJ7FchsLE2jIACgDb2Soa22BI3z04K/HWRd2rYN+
 XpHKvrqHqip46iOc4WQ8NjhnVEOHtlo6bfYSvysH+87d5Y7bIDbjgJhTBYBuWWk6mSLpoQ4sulrook
 ecpjS60ylAtBZzDU/iIoGMvTZSPuMkKgBpTRPUnvIiTI1axP+2aiye3fOEig==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_064222_865207_C3BCD926 
X-CRM114-Status: GOOD (  11.09  )
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
index fee0241b5098..725434d9d646 100644
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
+      dt-binding/memory/mediatek,mt8365-larb-port.h for mt8365.
 
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

