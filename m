Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A890CD6E4C
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 May 2026 10:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DzF9tm7ur7HLo2X6C2bLqmJDq98NOCzuUnqS4td4HdQ=; b=friLXp27hq9nBwkdEHLSeXjab4
	9fjI3U87+Zcg9ePl1A9wbM/MD4DiO/hhMvEHYxCR8Arx0TPP6Xs1X2FhtwLw93QxOieAe9WZMNxw/
	s3cEoOG4/DfGpFA0LMh4Q35WN0fOrDs2VDg/4VahnvMVWRiyZM59scj1g/RWe+xi8Wlk2CyeLl1bL
	7PAHk1KXlQZDtVb/upMRIe1549QHgPzvm3JipgvQnalnFh8ruNePJ998A9Q49jGHmrXGvs3DOE29a
	zeaCRm23tbYakqFiQbBTQVJbnL7wHmuqxo9lFlG9fTyFa/lUXNSxMU+Uh9ufi+ume+2uGPltAY3tE
	7gWcHEzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSuGT-000000079nG-1bJE;
	Fri, 29 May 2026 10:16:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSuGL-000000079ie-1tAN;
	Fri, 29 May 2026 10:16:22 +0000
X-UUID: 6e8a513e5b4711f1afed4741b24580c9-20260529
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=DzF9tm7ur7HLo2X6C2bLqmJDq98NOCzuUnqS4td4HdQ=;
	b=P6+SXkFoQZWUBfyl4koA/qAP7e+4XsQ9hfRQfiymSt1D297Wcp68b/b9t+7a5S8fz/hYBsbnJVEs6KGerADnm9p5pnGoMGEqiWG4ie9xfT0q4a4KLxPwtYcd9n/fKGyJobJ3Xuh06KeT6/q2rPxmjwi+Vdjfa9+zM+xHoqADlGI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:38aa64b8-a17c-4276-9c08-c03f3524f4f4,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e276073,CLOUDID:420992c9-9273-4096-a0ce-fc7a6a4f85f7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|865|888|898,TC:-5,Cont
	ent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6e8a513e5b4711f1afed4741b24580c9-20260529
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <justin.yeh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 196471547; Fri, 29 May 2026 03:16:18 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 29 May 2026 18:16:15 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 29 May 2026 18:16:15 +0800
From: Justin Yeh <justin.yeh@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Justin Yeh <justin.yeh@mediatek.com>
Subject: [PATCH 2/2] soc: mediatek: mtk-infracfg: Export symbols for DDK modules
Date: Fri, 29 May 2026 18:16:03 +0800
Message-ID: <20260529101613.55697-3-justin.yeh@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260529101613.55697-1-justin.yeh@mediatek.com>
References: <20260529101613.55697-1-justin.yeh@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_031621_492536_7B2D5316 
X-CRM114-Status: GOOD (  15.02  )
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

Export mtk_infracfg functions to allow other DDK modules (like
mtk-scpsys) to use bus protection APIs.

Changes:
- Add EXPORT_SYMBOL_GPL for set/clear bus_protection and init functions
- Remove static and __init qualifiers from mtk_infracfg_init
- Add mtk_infracfg_init() declaration to header
- Remove postcore_initcall, let dependent modules call init explicitly
- Add #include <linux/module.h> for export macros
- Add MODULE_LICENSE("GPL") metadata

This allows mtk-infracfg to be built as a DDK module (.ko) and its
functions to be used by other modules like mtk-scpsys for power domain
management.

Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>
---
 drivers/soc/mediatek/mtk-infracfg.c   | 9 +++++++--
 include/linux/soc/mediatek/infracfg.h | 1 +
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-infracfg.c b/drivers/soc/mediatek/mtk-infracfg.c
index 2acf19676af2..8a88805468cc 100644
--- a/drivers/soc/mediatek/mtk-infracfg.c
+++ b/drivers/soc/mediatek/mtk-infracfg.c
@@ -7,6 +7,7 @@
 #include <linux/jiffies.h>
 #include <linux/regmap.h>
 #include <linux/mfd/syscon.h>
+#include <linux/module.h>
 #include <linux/soc/mediatek/infracfg.h>
 #include <asm/processor.h>
 
@@ -43,6 +44,7 @@ int mtk_infracfg_set_bus_protection(struct regmap *infracfg, u32 mask,
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(mtk_infracfg_set_bus_protection);
 
 /**
  * mtk_infracfg_clear_bus_protection - disable bus protection
@@ -73,8 +75,9 @@ int mtk_infracfg_clear_bus_protection(struct regmap *infracfg, u32 mask,
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(mtk_infracfg_clear_bus_protection);
 
-static int __init mtk_infracfg_init(void)
+int mtk_infracfg_init(void)
 {
 	struct regmap *infracfg;
 
@@ -90,4 +93,6 @@ static int __init mtk_infracfg_init(void)
 				MT8192_INFRA_CTRL_DISABLE_MFG2ACP);
 	return 0;
 }
-postcore_initcall(mtk_infracfg_init);
+EXPORT_SYMBOL_GPL(mtk_infracfg_init);
+
+MODULE_LICENSE("GPL");
diff --git a/include/linux/soc/mediatek/infracfg.h b/include/linux/soc/mediatek/infracfg.h
index 9956e18c5ffa..847431a7b967 100644
--- a/include/linux/soc/mediatek/infracfg.h
+++ b/include/linux/soc/mediatek/infracfg.h
@@ -454,4 +454,5 @@ int mtk_infracfg_set_bus_protection(struct regmap *infracfg, u32 mask,
 		bool reg_update);
 int mtk_infracfg_clear_bus_protection(struct regmap *infracfg, u32 mask,
 		bool reg_update);
+int mtk_infracfg_init(void);
 #endif /* __SOC_MEDIATEK_INFRACFG_H */
-- 
2.45.2


