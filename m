Return-Path: <SRS0=UOtS=CP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8527C10DAA
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Sep 2020 15:19:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B2FA20714
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Sep 2020 15:19:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YPmQDzD5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="fhe19DSI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B2FA20714
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EGLQ61k8CP2rgQD08d1KiVhHS+JpgSAzj0fMDMny6sg=; b=YPmQDzD5ZL1qdUjooIZaXUqWnF
	b7aKJXwvj0AL0i4GVZBEnH9gSw5z4r5irzOpFuP+O0HFe5umMOR4mfEHcHNpVNBY35AAXCA1maTkq
	RYupcDXDplombevot6pSlaqIXT4dHguqiZgXCZ7XdfKAzeidYzs6Pj7VeIj7w2nLTT9owRRlJxtrL
	U5X0etFH94wBNFGe+I636FlXVTj8zie2S/vh6fPe/X689Saac36/4Rwvv4kVdY4llewX/C4MRL5FD
	pTqpH9D3l50DFHADBOCXCPXsRbCfIZyodqpp90c6g+AgMV6XXj+ZkuDi3LC1u6SUcriRKkCEwXytq
	P+Zz5vyQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kEwSC-0004NF-KB; Sun, 06 Sep 2020 15:19:40 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEwS7-0004L9-EQ
 for linux-mediatek@lists.infradead.org; Sun, 06 Sep 2020 15:19:36 +0000
Received: by mail-wr1-x441.google.com with SMTP id m6so12270274wrn.0
 for <linux-mediatek@lists.infradead.org>; Sun, 06 Sep 2020 08:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rzOHXc1d4k+GJMLhr6jfXTiNep26puRM1VtdB2kOKb0=;
 b=fhe19DSITZ6BPZd78ZKWlr7CcS8NZ6AJvNW7U0n9Z0iEnKSOJyfHYqnWH4VuNphBiW
 ofy6sQZcnvqb7uoPytvE3ALMoWTiGurVYJVMJMqL0OFafGunUn05BNQOUT5rI7YlIwTh
 GPPe4txfILYuOrQIUrnIp50CT+J0N1fSz68g1LkwK6GLLdX3RABSyw4Y64h1SW016y0b
 okri/H/I/IMFcwYSqOVvlJu02AskDj6TBhGIVfeAZK5tAGtcQ/vrHamWgBDzvZJH4cbg
 7JNT9ZnFhcbmmOMK8GptS3e5mpUBNBTvXxr7ZgJnNec713x+ch/rTnvy0TFabJFaJ+B/
 aPAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rzOHXc1d4k+GJMLhr6jfXTiNep26puRM1VtdB2kOKb0=;
 b=ax4jdHYKVPBFELr4ZytvBX7GvEb5XF7JKH4d4sCOwWjS+bXJ/+D2sSFphWO6ZSW8xn
 PFqhT0/KBbtDdNjhimwwV372IzGXJkv0BC7rG921rNMDwE4DKgb3kY5Zes7QYV++C8Yf
 vq0TXJgzxlpqAhp4pPX8H8C70XRB06btQrCWMKaTC91PescgJnPJKiK6hIplAdjE4Bs9
 vjOOt4YX79b9ZEyN84zDLAfTkw4nPI/v3z+KoIF5vxylw1d2R5RF6JQ7X54ZA++QQR/j
 9OxjOBeZuqz+/pL/LNxFA1L8rIiOj71ctU+Hqyf/IJq+PWoCdSTbFq/RSU8ODYmeL3OO
 qB1A==
X-Gm-Message-State: AOAM533HMAdFrSC7DKQO1qeaNZ2EVvWGonYM7JTkkstZNZmGlenTG0Gv
 ZVhj3akPs98qztQEv653BtYRPA==
X-Google-Smtp-Source: ABdhPJyl8p21LBzUGs8D2VcvLawqx3pNb5sITCS0B0dwpHTp8fs8DMe+tEasMp/Uhj0QNNnH0r0zVg==
X-Received: by 2002:adf:b784:: with SMTP id s4mr18393368wre.116.1599405573150; 
 Sun, 06 Sep 2020 08:19:33 -0700 (PDT)
Received: from localhost.localdomain (208.19.23.93.rev.sfr.net. [93.23.19.208])
 by smtp.gmail.com with ESMTPSA id a15sm26420646wrn.3.2020.09.06.08.19.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Sep 2020 08:19:32 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v3 1/3] dt-bindings: iommu: Add binding for MediaTek MT8167
 IOMMU
Date: Sun,  6 Sep 2020 17:19:26 +0200
Message-Id: <20200906151928.881209-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200906_111935_645685_611415B0 
X-CRM114-Status: GOOD (  14.62  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, joro@8bytes.org,
 Fabien Parent <fparent@baylibre.com>, robh+dt@kernel.org,
 matthias.bgg@gmail.com, yong.wu@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This commit adds IOMMU binding documentation and larb port definitions
for the MT8167 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Acked-by: Rob Herring <robh@kernel.org>
---

V3: Added mt8167-larb-port.h file for iommu port definitions
V2: no change

---
 .../bindings/iommu/mediatek,iommu.txt         |  1 +
 include/dt-bindings/memory/mt8167-larb-port.h | 49 +++++++++++++++++++
 2 files changed, 50 insertions(+)
 create mode 100644 include/dt-bindings/memory/mt8167-larb-port.h

diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.txt b/Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
index c1ccd8582eb2..f7a348f48e0d 100644
--- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
+++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
@@ -61,6 +61,7 @@ Required properties:
 	"mediatek,mt6779-m4u" for mt6779 which uses generation two m4u HW.
 	"mediatek,mt7623-m4u", "mediatek,mt2701-m4u" for mt7623 which uses
 						     generation one m4u HW.
+	"mediatek,mt8167-m4u" for mt8167 which uses generation two m4u HW.
 	"mediatek,mt8173-m4u" for mt8173 which uses generation two m4u HW.
 	"mediatek,mt8183-m4u" for mt8183 which uses generation two m4u HW.
 - reg : m4u register base and size.
diff --git a/include/dt-bindings/memory/mt8167-larb-port.h b/include/dt-bindings/memory/mt8167-larb-port.h
new file mode 100644
index 000000000000..4dd44d1037a7
--- /dev/null
+++ b/include/dt-bindings/memory/mt8167-larb-port.h
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2020 BayLibre, SAS
+ * Author: Fabien Parent <fparent@baylibre.com>
+ */
+#ifndef __DTS_IOMMU_PORT_MT8167_H
+#define __DTS_IOMMU_PORT_MT8167_H
+
+#define MTK_M4U_ID(larb, port)		(((larb) << 5) | (port))
+
+#define M4U_LARB0_ID			0
+#define M4U_LARB1_ID			1
+#define M4U_LARB2_ID			2
+
+/* larb0 */
+#define M4U_PORT_DISP_OVL0		MTK_M4U_ID(M4U_LARB0_ID, 0)
+#define M4U_PORT_DISP_RDMA0		MTK_M4U_ID(M4U_LARB0_ID, 1)
+#define M4U_PORT_DISP_WDMA0		MTK_M4U_ID(M4U_LARB0_ID, 2)
+#define M4U_PORT_DISP_RDMA1		MTK_M4U_ID(M4U_LARB0_ID, 3)
+#define M4U_PORT_MDP_RDMA		MTK_M4U_ID(M4U_LARB0_ID, 4)
+#define M4U_PORT_MDP_WDMA		MTK_M4U_ID(M4U_LARB0_ID, 5)
+#define M4U_PORT_MDP_WROT		MTK_M4U_ID(M4U_LARB0_ID, 6)
+#define M4U_PORT_DISP_FAKE		MTK_M4U_ID(M4U_LARB0_ID, 7)
+
+/* IMG larb1*/
+#define M4U_PORT_CAM_IMGO		MTK_M4U_ID(M4U_LARB1_ID, 0)
+#define M4U_PORT_CAM_IMG2O		MTK_M4U_ID(M4U_LARB1_ID, 1)
+#define M4U_PORT_CAM_LSCI		MTK_M4U_ID(M4U_LARB1_ID, 2)
+#define M4U_PORT_CAM_ESFKO		MTK_M4U_ID(M4U_LARB1_ID, 3)
+#define M4U_PORT_CAM_AAO		MTK_M4U_ID(M4U_LARB1_ID, 4)
+#define M4U_PORT_VENC_REC		MTK_M4U_ID(M4U_LARB1_ID, 5)
+#define M4U_PORT_VENC_BSDMA		MTK_M4U_ID(M4U_LARB1_ID, 6)
+#define M4U_PORT_VENC_RD_COMV		MTK_M4U_ID(M4U_LARB1_ID, 7)
+#define M4U_PORT_CAM_IMGI		MTK_M4U_ID(M4U_LARB1_ID, 8)
+#define M4U_PORT_VENC_CUR_LUMA		MTK_M4U_ID(M4U_LARB1_ID, 9)
+#define M4U_PORT_VENC_CUR_CHROMA	MTK_M4U_ID(M4U_LARB1_ID, 10)
+#define M4U_PORT_VENC_REF_LUMA		MTK_M4U_ID(M4U_LARB1_ID, 11)
+#define M4U_PORT_VENC_REF_CHROMA	MTK_M4U_ID(M4U_LARB1_ID, 12)
+
+/* VDEC larb2*/
+#define M4U_PORT_HW_VDEC_MC_EXT		MTK_M4U_ID(M4U_LARB2_ID, 0)
+#define M4U_PORT_HW_VDEC_PP_EXT		MTK_M4U_ID(M4U_LARB2_ID, 1)
+#define M4U_PORT_HW_VDEC_VLD_EXT	MTK_M4U_ID(M4U_LARB2_ID, 2)
+#define M4U_PORT_HW_VDEC_AVC_MV_EXT	MTK_M4U_ID(M4U_LARB2_ID, 3)
+#define M4U_PORT_HW_VDEC_PRED_RD_EXT	MTK_M4U_ID(M4U_LARB2_ID, 4)
+#define M4U_PORT_HW_VDEC_PRED_WR_EXT	MTK_M4U_ID(M4U_LARB2_ID, 5)
+#define M4U_PORT_HW_VDEC_PPWRAP_EXT	MTK_M4U_ID(M4U_LARB2_ID, 6)
+
+#endif
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
