Return-Path: <SRS0=DDi+=L7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF197C07E95
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jul 2021 04:13:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF05661CB8
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jul 2021 04:13:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF05661CB8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uhMMp/YykLuX6DKSp/mXYgNYpYpFQo1csgiZwp4Xm48=; b=OtMe0jH9C1uylI
	kCGi91K5Rwfolf40IT7F/+yRHdVO+vUL1cwgiEZDEKUmh03UaSmI9Khs6FJ+XEayo5E1FjtuP0Bqz
	DNKnD70196jpJHNatgWz4ZhmZpsSLDGbwdt6s0uDpJm9+YEXzc1FS7cA57Hpqf7hAnCTONtGIBNGp
	66PRGVIDhbYofh/EU4mUtbpV5RaWLbbd7+kiJSy/YAGkNduZOcP35r5we38pZJ1LT0q0G/Kg2pExB
	zvn2X3AvpXQlimd/VmjOzbkw9TRxwyYFBqKAsA9X+VmnqoZcEaktzBFUX5iHBrEXMdA8DcWgNRf65
	A6zFoGBWgXXKjDZFVNMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0ywL-00DJ2c-Ez; Wed, 07 Jul 2021 04:13:37 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0yvr-00DIt3-Ed; Wed, 07 Jul 2021 04:13:12 +0000
X-UUID: 1cafc88b4a7e4f04a65543fb038d1df2-20210706
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=GEnXYQ3cihg4f3zwcfmfC6xsXKcRuf73PWj2ynSMeQM=; 
 b=M2/j8cIXBemiY0odSRCtBXL8fp9CB3l8/SNEPo3pj9tAWSF0UsPd0UITtAyFhyIQfUAfLPZlX3xfNX9Qyije04HvQi4CKXInTWYhjSiJO+8/xPKCXOJFRnqgYXqFSuUJOUFnrbWPxgXB5t9jSebTE7oLQNkWPh+6CEt6KYKXEWg=;
X-UUID: 1cafc88b4a7e4f04a65543fb038d1df2-20210706
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1782184104; Tue, 06 Jul 2021 21:13:00 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 6 Jul 2021 21:13:00 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 7 Jul 2021 12:12:57 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 7 Jul 2021 12:12:57 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>
CC: <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <fshao@google.com>,
 <jason-jh.lin@mediatek.com>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>
Subject: [PATCH v1 09/17] drm/mediatek: add OVL support multi-layer
Date: Wed, 7 Jul 2021 12:12:41 +0800
Message-ID: <20210707041249.29816-10-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210707041249.29816-1-jason-jh.lin@mediatek.com>
References: <20210707041249.29816-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_211308_675269_9D6DD3AE 
X-CRM114-Status: GOOD (  10.93  )
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

Add datapath_con settings to support multi-layer output.

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 7504e86b167a..95fd5e00eb91 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -18,14 +18,17 @@
 #include "mtk_drm_ddp_comp.h"
 
 #define DISP_REG_OVL_INTEN			0x0004
-#define OVL_FME_CPL_INT					BIT(1)
+#define OVL_FME_CPL_INT				BIT(1)
 #define DISP_REG_OVL_INTSTA			0x0008
 #define DISP_REG_OVL_EN				0x000c
 #define DISP_REG_OVL_RST			0x0014
 #define DISP_REG_OVL_ROI_SIZE			0x0020
 #define DISP_REG_OVL_DATAPATH_CON		0x0024
-#define OVL_LAYER_SMI_ID_EN				BIT(0)
-#define OVL_BGCLR_SEL_IN				BIT(2)
+#define OVL_LAYER_SMI_ID_EN			BIT(0)
+#define OVL_BGCLR_SEL_IN			BIT(2)
+#define OVL_GCLAST_EN				BIT(24)
+#define OVL_HDR_GCLAST_EN			BIT(25)
+#define OVL_OUTPUT_CLAMP			BIT(26)
 #define DISP_REG_OVL_ROI_BGCLR			0x0028
 #define DISP_REG_OVL_SRC_CON			0x002c
 #define DISP_REG_OVL_CON(n)			(0x0030 + 0x20 * (n))
@@ -222,6 +225,7 @@ void mtk_ovl_layer_on(struct device *dev, unsigned int idx,
 	unsigned int gmc_thrshd_l;
 	unsigned int gmc_thrshd_h;
 	unsigned int gmc_value;
+	unsigned int datapatch_con;
 	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
 
 	mtk_ddp_write(cmdq_pkt, 0x1, &ovl->cmdq_reg, ovl->regs,
@@ -237,6 +241,11 @@ void mtk_ovl_layer_on(struct device *dev, unsigned int idx,
 			    gmc_thrshd_h << 16 | gmc_thrshd_h << 24;
 	mtk_ddp_write(cmdq_pkt, gmc_value,
 		      &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_RDMA_GMC(idx));
+
+	datapatch_con = OVL_GCLAST_EN | OVL_HDR_GCLAST_EN | OVL_OUTPUT_CLAMP;
+	mtk_ddp_write_mask(cmdq_pkt, datapatch_con, &ovl->cmdq_reg, ovl->regs,
+				 DISP_REG_OVL_DATAPATH_CON, datapatch_con);
+
 	mtk_ddp_write_mask(cmdq_pkt, BIT(idx), &ovl->cmdq_reg, ovl->regs,
 			   DISP_REG_OVL_SRC_CON, BIT(idx));
 }
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
