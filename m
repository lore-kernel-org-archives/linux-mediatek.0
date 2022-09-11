Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 308FCC6FA86
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Sep 2022 15:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oAvQ607/aY4vDYDpBvbK7U5/HWXwEVR2GiLNFSXONBE=; b=C+YOMho4NJxqK+tmrFNLoDTMOI
	NiZr4i2AzGsDKLzApKUz2aQb9crad+Qz9Tav8ZF+xQ9Pp4MldVqom/svZjAABBXwUuIXy6PLRY2jo
	r7AEeMQHd4+5664u9dj8Mcn01Wz/rzi6HKKf9bLdXtryVEKx/rGhtkBUyNr09FYt04nXbq+AKO6Qn
	gR3Qq9PeJAEyuw2atHAChNaEALuNjN+hHHczuzKO5qDlRGueFYNZm7GCOiHjxP56NM0NzBNwNspjc
	pGVwn8OJRU1f0f+hjTd2K7DNTEisPQFxm8M1tWvPRsT1qYrrliHy2xoylF0Ne0rZ3lmULB/yB8JHc
	JwbkFrig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXP3N-002qhL-F6; Sun, 11 Sep 2022 15:39:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXP1r-002pjQ-KK; Sun, 11 Sep 2022 15:37:54 +0000
X-UUID: ed550ad7259249f08d6ddcd9526a4b4e-20220911
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=oAvQ607/aY4vDYDpBvbK7U5/HWXwEVR2GiLNFSXONBE=;
	b=VZYWXA5U+v+tdakhA1d9Qj4BumVoJV3wMgxoDs0OdWkue7FtPkiFofH3LovO4zB/SWJNW430ThXvMmy8M/gblPJQlN6VmGBe3XgOTQNpfIAVdArf7n8mjnZx/SC+QQv0htWt4buzUAStC3cklKhhY4p9BhVRsYAlr9AbbhQ1CPw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:c41401fc-e23c-440b-9080-14dfa8957989,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:63503e5d-5ed4-4e28-8b00-66ed9f042fbd,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: ed550ad7259249f08d6ddcd9526a4b4e-20220911
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 897147119; Sun, 11 Sep 2022 08:37:48 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Sun, 11 Sep 2022 23:37:43 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Sun, 11 Sep 2022 23:37:43 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: CK Hu <ck.hu@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>, "Singo
 Chang" <singo.chang@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jason-JH.Lin
	<jason-jh.lin@mediatek.com>
Subject: [PATCH v3 6/9] drm/mediatek: Add gamma support different bank_size for other SoC
Date: Sun, 11 Sep 2022 23:37:31 +0800
Message-ID: <20220911153734.24243-7-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220911153734.24243-1-jason-jh.lin@mediatek.com>
References: <20220911153734.24243-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220911_083751_789291_5173E0DF 
X-CRM114-Status: GOOD (  14.62  )
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

Add multiple bank support for mt8195.
If bank size is 0 which means no bank support.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 45 +++++++++++++----------
 1 file changed, 26 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index 155fb5d94d79..9983318e8e3e 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -21,6 +21,7 @@
 #define GAMMA_LUT_EN					BIT(1)
 #define GAMMA_DITHERING					BIT(2)
 #define DISP_GAMMA_SIZE				0x0030
+#define DISP_GAMMA_BANK				0x0100
 #define DISP_GAMMA_LUT				0x0700
 
 #define LUT_10BIT_MASK				0x03ff
@@ -33,6 +34,7 @@ struct mtk_disp_gamma_data {
 	bool lut_diff;
 	u16 lut_size;
 	u8 lut_bits;
+	u16 bank_size;
 };
 
 /*
@@ -75,9 +77,10 @@ void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crt
 	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
 	bool lut_diff = false;
 	u16 lut_size = LUT_SIZE_DEFAULT;
+	u16 bank_size = lut_size;
 	u8 lut_bits = LUT_BITS_DEFAULT;
 	u8 shift_bits;
-	unsigned int i, reg;
+	unsigned int i, j, reg, bank_num;
 	struct drm_color_lut *lut;
 	void __iomem *lut_base;
 	u32 word, mask;
@@ -87,8 +90,10 @@ void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crt
 		lut_diff = gamma->data->lut_diff;
 		lut_size = gamma->data->lut_size;
 		lut_bits = gamma->data->lut_bits;
+		bank_size = gamma->data->bank_size;
 	}
 
+	bank_num = lut_size / bank_size;
 	shift_bits = LUT_INPUT_BITS - lut_bits;
 	mask = GENMASK(lut_bits - 1, 0);
 
@@ -98,25 +103,27 @@ void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crt
 		writel(reg, regs + DISP_GAMMA_CFG);
 		lut_base = regs + DISP_GAMMA_LUT;
 		lut = (struct drm_color_lut *)state->gamma_lut->data;
-		for (i = 0; i < lut_size; i++) {
-
-			if (!lut_diff || (i % 2 == 0)) {
-				word = (((lut[i].red >> shift_bits) & mask) << 20) +
-					(((lut[i].green >> shift_bits) & mask) << 10) +
-					((lut[i].blue >> shift_bits) & mask);
-			} else {
-				diff[0] = (lut[i].red >> shift_bits) -
-					  (lut[i - 1].red >> shift_bits);
-				diff[1] = (lut[i].green >> shift_bits) -
-					  (lut[i - 1].green >> shift_bits);
-				diff[2] = (lut[i].blue >> shift_bits) -
-					  (lut[i - 1].blue >> shift_bits);
-
-				word = ((diff[0] & mask) << 20) +
-					((diff[1] & mask) << 10) +
-					(diff[2] & mask);
+		for (j = 0; j < bank_num; j++) {
+			writel(j, regs + DISP_GAMMA_BANK);
+			for (i = 0; i < bank_size; i++) {
+				if (!lut_diff || (i % 2 == 0)) {
+					word = (((lut[i].red >> shift_bits) & mask) << 20) +
+						(((lut[i].green >> shift_bits) & mask) << 10) +
+						((lut[i].blue >> shift_bits) & mask);
+				} else {
+					diff[0] = (lut[i].red >> shift_bits) -
+						  (lut[i - 1].red >> shift_bits);
+					diff[1] = (lut[i].green >> shift_bits) -
+						  (lut[i - 1].green >> shift_bits);
+					diff[2] = (lut[i].blue >> shift_bits) -
+						  (lut[i - 1].blue >> shift_bits);
+
+					word = ((diff[0] & mask) << 20) +
+						((diff[1] & mask) << 10) +
+						(diff[2] & mask);
+				}
+				writel(word, (lut_base + i * 4));
 			}
-			writel(word, (lut_base + i * 4));
 		}
 	}
 }
-- 
2.18.0


