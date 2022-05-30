Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3BC8C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 18:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zn2L9r4QCjqTttiPItYxNx0nsFvPc+vNpjUq6w0OzJA=; b=S1ISeW7SQ/YYn6
	3VAMBHRkZnyHJbm/44C13/JLRy8XCvdV9SCps6D1w/yuIp2Q8+nHggoiBUdE2l0b7srr1Y0vY4rzd
	TfmczdGviolyS1brnHaUWBphbGFsJV+2f1DHMxr4zRUnrY/TdnyxsOx9EcbOuXu4exXikwFPparJk
	oY676g5BW92FfmGulL5vKPcizTw2pTrhJZ9rux4tJjEl26oM1LkhmEx0IVC5iaCE5iFcj+k4TmeHz
	zgnKfGBk5JgGxxPJKAwCubTUKJnzYyXEiFa8jLX3Hra/PtqYALNNd4NdfFkgncq0BMs6dv7QHRQWx
	+efGt+anYu0ySPy88jWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvjkd-007mTq-S7; Mon, 30 May 2022 18:04:23 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvjkG-007mIC-A7
	for linux-mediatek@lists.infradead.org; Mon, 30 May 2022 18:04:03 +0000
Received: by mail-wr1-x429.google.com with SMTP id q21so4480792wra.2
        for <linux-mediatek@lists.infradead.org>; Mon, 30 May 2022 11:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eEF/THqP4/KMnhR3Jx46Pp2/fGel1OrMSQe1WykeaFE=;
        b=YjA/47czGUZcB3jHTGA93lpns9MvpQGWDsDLKqd8CFUEsg1VNHhCm2d7nwCGBfQvja
         E7bGvlwNaBeG/I0zVOqu77Y2ZNhxxc3/1DkrFu6rxz08JUgpYX1cMjrVpm+M9HET6FRa
         yS5VYOlJEUvUzgwXXhnfX7VhNKQvOninG0lZEJqPss8cwi0GrsZtu0pdyN6SIsiy55+m
         oW4sbMy84PoQgMFQ1rI0dknEbE8i08PEYhC+NU3e4mv5JCYQYqyOedDXKp5i4CsYMfDB
         wtXofgV58zwq8U8hgNi42vXMkUF6nmV31OKlRYNzQpZ+7K70ot1UtCVuanhwp9pxzAlz
         NGqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eEF/THqP4/KMnhR3Jx46Pp2/fGel1OrMSQe1WykeaFE=;
        b=ax0QPaoV+zl5y/NSpsaR4sP+dHIntUdyJDMPtcQb2B96yC88TFHZk2rieERV0+9gFX
         6VW3E4rYg3cewJhg/9vv/8kx00pLSRSA9Srq/qw1JtKf6YAUCUqi5OWLhthmoO1QRCbZ
         N/X8RCRkP8r6YNmfCFG8yfilTZG1wviDvqIk9UnYBYjxo5Uq/zmO+HhUW46QITu9CVGj
         9WV1cLTql8CqSIM8ug53tQ5g6XhFpXzGuYgsjxhdQvC2waDG5IVckkw0lqU3tCyL4mhh
         GPzNNoAjwKXzzcyYJZtA8V16swRXDpboaBAyxsZfwKjOggmp8eMnFyEM7KOrhTxlJ3nR
         9+bA==
X-Gm-Message-State: AOAM530CXKBWmrhxEOIKShyJi5hgRRjODELkLAUq4seFSRykZySb3idm
	03lec/ZtqSndry4WDM2MyWikUA==
X-Google-Smtp-Source: ABdhPJwy5EGuO92uUYbYm+RoosB6dUYzPz/zHdWaBA9pWwIWvfY+x51eD4gAdsAxVp9Fy19bMTkIcg==
X-Received: by 2002:a5d:6a92:0:b0:210:3387:23ec with SMTP id s18-20020a5d6a92000000b00210338723ecmr5422504wru.102.1653933836689;
        Mon, 30 May 2022 11:03:56 -0700 (PDT)
Received: from helium.lan ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id 9-20020a1c0209000000b00397550b387bsm1647wmc.23.2022.05.30.11.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 11:03:55 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Yong Wu <yong.wu@mediatek.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>,
	iommu@lists.linux-foundation.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/3] dt-bindings: iommu: mediatek: add binding documentation for MT8365 SoC
Date: Mon, 30 May 2022 20:03:26 +0200
Message-Id: <20220530180328.845692-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_110400_541001_7F034417 
X-CRM114-Status: GOOD (  13.23  )
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

Add IOMMU binding documentation for the MT8365 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 .../bindings/iommu/mediatek,iommu.yaml        |  2 +
 include/dt-bindings/memory/mt8365-larb-port.h | 96 +++++++++++++++++++
 2 files changed, 98 insertions(+)
 create mode 100644 include/dt-bindings/memory/mt8365-larb-port.h

diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
index 97e8c471a5e8..5ba688365da5 100644
--- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
+++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
@@ -77,6 +77,7 @@ properties:
           - mediatek,mt8173-m4u  # generation two
           - mediatek,mt8183-m4u  # generation two
           - mediatek,mt8192-m4u  # generation two
+          - mediatek,mt8365-m4u  # generation two
 
       - description: mt7623 generation one
         items:
@@ -120,6 +121,7 @@ properties:
       dt-binding/memory/mt8173-larb-port.h for mt8173,
       dt-binding/memory/mt8183-larb-port.h for mt8183,
       dt-binding/memory/mt8192-larb-port.h for mt8192.
+      dt-binding/memory/mt8365-larb-port.h for mt8365.
 
   power-domains:
     maxItems: 1
diff --git a/include/dt-bindings/memory/mt8365-larb-port.h b/include/dt-bindings/memory/mt8365-larb-port.h
new file mode 100644
index 000000000000..e7d5637aa38e
--- /dev/null
+++ b/include/dt-bindings/memory/mt8365-larb-port.h
@@ -0,0 +1,96 @@
+/* SPDX-License-Identifier: GPL-2.0 */
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
+#define M4U_LARB4_ID			4
+#define M4U_LARB5_ID			5
+#define M4U_LARB6_ID			6
+#define M4U_LARB7_ID			7
+
+/* larb0 */
+#define M4U_PORT_DISP_OVL0		MTK_M4U_ID(0, 0)
+#define M4U_PORT_DISP_OVL0_2L		MTK_M4U_ID(0, 1)
+#define M4U_PORT_DISP_RDMA0		MTK_M4U_ID(0, 2)
+#define M4U_PORT_DISP_WDMA0		MTK_M4U_ID(0, 3)
+#define M4U_PORT_DISP_RDMA1		MTK_M4U_ID(0, 4)
+#define M4U_PORT_MDP_RDMA0		MTK_M4U_ID(0, 5)
+#define M4U_PORT_MDP_WROT1		MTK_M4U_ID(0, 6)
+#define M4U_PORT_MDP_WROT0		MTK_M4U_ID(0, 7)
+#define M4U_PORT_MDP_RDMA1		MTK_M4U_ID(0, 8)
+#define M4U_PORT_DISP_FAKE0		MTK_M4U_ID(0, 9)
+
+/* larb1 */
+#define M4U_PORT_VENC_RCPU		MTK_M4U_ID(1, 0)
+#define M4U_PORT_VENC_REC		MTK_M4U_ID(1, 1)
+#define M4U_PORT_VENC_BSDMA		MTK_M4U_ID(1, 2)
+#define M4U_PORT_VENC_SV_COMV		MTK_M4U_ID(1, 3)
+#define M4U_PORT_VENC_RD_COMV		MTK_M4U_ID(1, 4)
+#define M4U_PORT_VENC_NBM_RDMA		MTK_M4U_ID(1, 5)
+#define M4U_PORT_VENC_NBM_RDMA_LITE	MTK_M4U_ID(1, 6)
+#define M4U_PORT_JPGENC_Y_RDMA		MTK_M4U_ID(1, 7)
+#define M4U_PORT_JPGENC_C_RDMA		MTK_M4U_ID(1, 8)
+#define M4U_PORT_JPGENC_Q_TABLE		MTK_M4U_ID(1, 9)
+#define M4U_PORT_JPGENC_BSDMA		MTK_M4U_ID(1, 10)
+#define M4U_PORT_JPGDEC_WDMA		MTK_M4U_ID(1, 11)
+#define M4U_PORT_JPGDEC_BSDMA		MTK_M4U_ID(1, 12)
+#define M4U_PORT_VENC_NBM_WDMA		MTK_M4U_ID(1, 13)
+#define M4U_PORT_VENC_NBM_WDMA_LITE	MTK_M4U_ID(1, 14)
+#define M4U_PORT_VENC_CUR_LUMA		MTK_M4U_ID(1, 15)
+#define M4U_PORT_VENC_CUR_CHROMA	MTK_M4U_ID(1, 16)
+#define M4U_PORT_VENC_REF_LUMA		MTK_M4U_ID(1, 17)
+#define M4U_PORT_VENC_REF_CHROMA	MTK_M4U_ID(1, 18)
+
+/* larb2 */
+#define M4U_PORT_CAM_IMGO		MTK_M4U_ID(2, 0)
+#define M4U_PORT_CAM_RRZO		MTK_M4U_ID(2, 1)
+#define M4U_PORT_CAM_AAO		MTK_M4U_ID(2, 2)
+#define M4U_PORT_CAM_LCS		MTK_M4U_ID(2, 3)
+#define M4U_PORT_CAM_ESFKO		MTK_M4U_ID(2, 4)
+#define M4U_PORT_CAM_CAM_SV0		MTK_M4U_ID(2, 5)
+#define M4U_PORT_CAM_CAM_SV1		MTK_M4U_ID(2, 6)
+#define M4U_PORT_CAM_LSCI		MTK_M4U_ID(2, 7)
+#define M4U_PORT_CAM_LSCI_D		MTK_M4U_ID(2, 8)
+#define M4U_PORT_CAM_AFO		MTK_M4U_ID(2, 9)
+#define M4U_PORT_CAM_SPARE		MTK_M4U_ID(2, 10)
+#define M4U_PORT_CAM_BPCI		MTK_M4U_ID(2, 11)
+#define M4U_PORT_CAM_BPCI_D		MTK_M4U_ID(2, 12)
+#define M4U_PORT_CAM_UFDI		MTK_M4U_ID(2, 13)
+#define M4U_PORT_CAM_IMGI		MTK_M4U_ID(2, 14)
+#define M4U_PORT_CAM_IMG2O		MTK_M4U_ID(2, 15)
+#define M4U_PORT_CAM_IMG3O		MTK_M4U_ID(2, 16)
+#define M4U_PORT_CAM_WPE0_I		MTK_M4U_ID(2, 17)
+#define M4U_PORT_CAM_WPE1_I		MTK_M4U_ID(2, 18)
+#define M4U_PORT_CAM_WPE_O		MTK_M4U_ID(2, 19)
+#define M4U_PORT_CAM_FD0_I		MTK_M4U_ID(2, 20)
+#define M4U_PORT_CAM_FD1_I		MTK_M4U_ID(2, 21)
+#define M4U_PORT_CAM_FD0_O		MTK_M4U_ID(2, 22)
+#define M4U_PORT_CAM_FD1_O		MTK_M4U_ID(2, 23)
+
+/* larb3 */
+#define M4U_PORT_HW_VDEC_MC_EXT		MTK_M4U_ID(3, 0)
+#define M4U_PORT_HW_VDEC_UFO_EXT	MTK_M4U_ID(3, 1)
+#define M4U_PORT_HW_VDEC_PP_EXT		MTK_M4U_ID(3, 2)
+#define M4U_PORT_HW_VDEC_PRED_RD_EXT	MTK_M4U_ID(3, 3)
+#define M4U_PORT_HW_VDEC_PRED_WR_EXT	MTK_M4U_ID(3, 4)
+#define M4U_PORT_HW_VDEC_PPWRAP_EXT	MTK_M4U_ID(3, 5)
+#define M4U_PORT_HW_VDEC_TILE_EXT	MTK_M4U_ID(3, 6)
+#define M4U_PORT_HW_VDEC_VLD_EXT	MTK_M4U_ID(3, 7)
+#define M4U_PORT_HW_VDEC_VLD2_EXT	MTK_M4U_ID(3, 8)
+#define M4U_PORT_HW_VDEC_AVC_MV_EXT	MTK_M4U_ID(3, 9)
+#define M4U_PORT_HW_VDEC_RG_CTRL_DMA_EXT MTK_M4U_ID(3, 10)
+
+/* larb4 */
+#define M4U_PORT_APU_READ		MTK_M4U_ID(0, 0)
+#define M4U_PORT_APU_WRITE		MTK_M4U_ID(0, 1)
+
+#endif
-- 
2.36.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
