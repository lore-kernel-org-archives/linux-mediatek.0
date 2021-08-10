Return-Path: <SRS0=C/QR=NB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 655EFC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Aug 2021 08:11:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C69C361075
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Aug 2021 08:11:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C69C361075
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0i3WIkFbIvz3RWFAKTx/W/Ku5EYGLpmScubRC/Ch4IE=; b=hajssL7A2+kvv5
	kJSogUz//zNhnmeFq5ZhAMib9+TG/ROh/eicNig8VUyoWmuhDqbACBxygYXDG+EFlO2LlRTeghPD5
	AbAfpnYTGlIKlP8iiceMSr/GT3BcX36gsHX2uUHI7myYCkGFlN7xW+6lRSaSA/XxgAQ81YDQww81G
	GOnf34NXLvlaWHZUPFdBvGNDq5tABPlTtFjZIJaduYVoVyvyed5N2+9sJns2RBhgUvEXADH2an2fD
	T8mH8yiEaXIe2Ee9JevIds6w1rUv/W7ZcW6PDqc2QXYm9kFb1eIVLL76V1IgTTiSro2EdxRtWYk5S
	J7aBHT2f4n1ZyiYBh4ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDMr5-002uP6-Ci; Tue, 10 Aug 2021 08:11:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDMqA-002trz-9t; Tue, 10 Aug 2021 08:10:30 +0000
X-UUID: c9271d3101834355ae6b53fb5eb62f51-20210810
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=OXIbWtwyMtGSksRYWFIfBuMU8gCDF8wlvHPYF8NO2w8=; 
 b=chfLkoJJ0vrxj9X89fRm5gw7Aq9g51YFOOq2VjwuK+nm8EcAM4Cy5fPXNoRM7qZkIdE3aJmPHdXshkDgxqFbzvI+2bLGynpy3W8+bjvV679sj8U+5zPOCMPXBELEV3ZqXlJ7PaT/2q4OrNJD+sEYqzqtoqQpHOaMhYIgpND5yB8=;
X-UUID: c9271d3101834355ae6b53fb5eb62f51-20210810
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 219065169; Tue, 10 Aug 2021 01:10:23 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 Aug 2021 01:10:21 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 Aug 2021 16:10:20 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 10 Aug 2021 16:10:19 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Tomasz
 Figa" <tfiga@chromium.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <iommu@lists.linux-foundation.org>, <yong.wu@mediatek.com>,
 <youlin.pei@mediatek.com>, <anan.sun@mediatek.com>,
 <ming-fan.chen@mediatek.com>, <yi.kuo@mediatek.com>,
 <anthony.huang@mediatek.com>, Ikjoon Jang <ikjn@chromium.org>
Subject: [PATCH v3 08/13] memory: mtk-smi: Add clocks for smi-sub-common
Date: Tue, 10 Aug 2021 16:08:54 +0800
Message-ID: <20210810080859.29511-9-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210810080859.29511-1-yong.wu@mediatek.com>
References: <20210810080859.29511-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_011026_411516_24A8F219 
X-CRM114-Status: GOOD (  14.20  )
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

SMI sub common only have one output port. thus it has only one gals
clocks(gals0). then, smi-sub-common require the three clocks(apb/smi/gals0)
in has_gals case.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/memory/mtk-smi.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index 5c2bd5795cfd..58d9f7667490 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -74,10 +74,12 @@ static const char * const mtk_smi_larb_clks[] = {"apb", "smi", "gals"};
 
 /*
  * common: Require these four clocks in has_gals case. Otherwise, only apb/smi are required.
+ * sub common: Require apb/smi/gals0 clocks in has_gals case. Otherwise, only apb/smi are required.
  */
 static const char * const mtk_smi_common_clks[] = {"apb", "smi", "gals0", "gals1"};
 #define MTK_SMI_COM_REQ_CLK_NR		2
 #define MTK_SMI_COM_GALS_REQ_CLK_NR	MTK_SMI_CLK_NR_MAX
+#define MTK_SMI_SUB_COM_GALS_REQ_CLK_NR 3
 
 struct mtk_smi_common_plat {
 	enum mtk_smi_type	type;
@@ -467,8 +469,12 @@ static int mtk_smi_common_probe(struct platform_device *pdev)
 	common->dev = dev;
 	common->plat = of_device_get_match_data(dev);
 
-	if (common->plat->has_gals)
-		clk_required = MTK_SMI_COM_GALS_REQ_CLK_NR;
+	if (common->plat->has_gals) {
+		if (common->plat->type == MTK_SMI_GEN2)
+			clk_required = MTK_SMI_COM_GALS_REQ_CLK_NR;
+		else if (common->plat->type == MTK_SMI_GEN2_SUB_COMM)
+			clk_required = MTK_SMI_SUB_COM_GALS_REQ_CLK_NR;
+	}
 	ret = mtk_smi_dts_clk_init(dev, common, mtk_smi_common_clks, clk_required, 0);
 	if (ret)
 		return ret;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
