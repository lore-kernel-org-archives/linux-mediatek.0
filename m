Return-Path: <SRS0=3B0C=5F=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03B70C4332B
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Mar 2020 07:42:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEB322072D
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Mar 2020 07:42:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bHkh/X7X";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="MCstwFlz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEB322072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pDoeAyX9qpo7Wh86FvAnfA1h5Ev+aJhsES5j4edsgVQ=; b=bHkh/X7XL0IOjy
	9fpJg/ItsfezsBbEVLWuo3ZImZa4ECPjZ9sDRUUs6IT90TA5znVFvkQ7n/0pnCpE0oZ+omqUgfMxk
	kInZPLe4490WaahSj4PUNEL3Qtpg2ec4gptjWYXktYAAf2r8zeZR3LjTFNrBSAnz4b8DLCt6Xen9O
	GaAB/+rSbEcMFqvp8M4Pitli4ZnvCBpF5LnzBB9toxti852p8LlYFoLeHYgT4TfcOtHO0+z65DP9L
	cdgNZzte+jva9wHBz0R6LNJmvq9kCLJcVcXo05R3OhegQGyeFD89iO5GbuIsvRqSGX7tk/GqXod0v
	Yx0bmaKq+6y7HQnycGsA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jFCIh-0007zB-Du; Fri, 20 Mar 2020 07:42:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jFCIe-0007xo-KR; Fri, 20 Mar 2020 07:42:38 +0000
X-UUID: 3f7914f243cd4665b9c45ad5f1043c1f-20200319
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=CNJCkVUjHNfglySeQk6l/dMidP8MpvHpn3ZQ8HhLFK0=; 
 b=MCstwFlzOCqHk5WYt/7SS9hfM2/WBlN5nanyYiILLpIQJpucLrsutKKOkRYfgWSwR9S5OoYcpuVsvjJGDRWBr63Okl6rVaW6Eox8C7MIaRG5NRS0qiq3flT43rCgDNHCqEsGT1MgOi12PrTEhmeSlMIq9Nw/gKnXiMIhoJb7kOc=;
X-UUID: 3f7914f243cd4665b9c45ad5f1043c1f-20200319
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 443257487; Thu, 19 Mar 2020 23:42:34 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 20 Mar 2020 00:32:35 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 20 Mar 2020 15:29:30 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Fri, 20 Mar 2020 15:29:19 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Nicolas Boichat
 <drinkcat@chromium.org>, Rob Herring <robh@kernel.org>, Sascha Hauer
 <kernel@pengutronix.de>
Subject: [PATCH v13 09/11] soc: mediatek: Add a comma at the end
Date: Fri, 20 Mar 2020 15:32:18 +0800
Message-ID: <1584689540-5227-10-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1584689540-5227-1-git-send-email-weiyi.lu@mediatek.com>
References: <1584689540-5227-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 6517BB6049B43F6435E03951A65B04C9067DFE9AE334AE332E674281AEF591BD2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200320_004236_679807_6FC843D9 
X-CRM114-Status: UNSURE (   8.39  )
X-CRM114-Notice: Please train this message.
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
Cc: James Liao <jamesjj.liao@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 Fan Chen <fan.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

A minor coding style fix

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 drivers/soc/mediatek/mtk-scpsys.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
index 94823e2..8538408 100644
--- a/drivers/soc/mediatek/mtk-scpsys.c
+++ b/drivers/soc/mediatek/mtk-scpsys.c
@@ -1374,7 +1374,7 @@ static void mtk_register_power_domains(struct platform_device *pdev,
 	.num_domains = ARRAY_SIZE(scp_domain_data_mt2701),
 	.regs = {
 		.pwr_sta_offs = SPM_PWR_STATUS,
-		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND
+		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND,
 	},
 };
 
@@ -1385,7 +1385,7 @@ static void mtk_register_power_domains(struct platform_device *pdev,
 	.num_subdomains = ARRAY_SIZE(scp_subdomain_mt2712),
 	.regs = {
 		.pwr_sta_offs = SPM_PWR_STATUS,
-		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND
+		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND,
 	},
 };
 
@@ -1396,7 +1396,7 @@ static void mtk_register_power_domains(struct platform_device *pdev,
 	.num_subdomains = ARRAY_SIZE(scp_subdomain_mt6797),
 	.regs = {
 		.pwr_sta_offs = SPM_PWR_STATUS_MT6797,
-		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND_MT6797
+		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND_MT6797,
 	},
 };
 
@@ -1405,7 +1405,7 @@ static void mtk_register_power_domains(struct platform_device *pdev,
 	.num_domains = ARRAY_SIZE(scp_domain_data_mt7622),
 	.regs = {
 		.pwr_sta_offs = SPM_PWR_STATUS,
-		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND
+		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND,
 	},
 };
 
@@ -1414,7 +1414,7 @@ static void mtk_register_power_domains(struct platform_device *pdev,
 	.num_domains = ARRAY_SIZE(scp_domain_data_mt7623a),
 	.regs = {
 		.pwr_sta_offs = SPM_PWR_STATUS,
-		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND
+		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND,
 	},
 };
 
@@ -1425,7 +1425,7 @@ static void mtk_register_power_domains(struct platform_device *pdev,
 	.num_subdomains = ARRAY_SIZE(scp_subdomain_mt8173),
 	.regs = {
 		.pwr_sta_offs = SPM_PWR_STATUS,
-		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND
+		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND,
 	},
 };
 
@@ -1436,7 +1436,7 @@ static void mtk_register_power_domains(struct platform_device *pdev,
 	.num_subdomains = ARRAY_SIZE(scp_subdomain_mt8183),
 	.regs = {
 		.pwr_sta_offs = 0x0180,
-		.pwr_sta2nd_offs = 0x0184
+		.pwr_sta2nd_offs = 0x0184,
 	}
 };
 
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
