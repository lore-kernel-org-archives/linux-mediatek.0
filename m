Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7D5FC352A1
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Dec 2022 09:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RwIzkqZDNUF77Vh/sEKkllJuBWJIBT09XZvdLNUSwN8=; b=1KvcQNSb3w7HHH9BIfMSwieg53
	7gibY6ChcBnb8ZqbMl2Xnbs7KfwZzpPIZOKGWxeUklt/xuFWbo526u6cyXXlrZfflJ2s3ugX0CEcl
	6jYn7n556Wz5IzNx+ujFHSZ3jW+jTCeix2iYx8LKUBGBEVQMbqn8a5zyNmrhS/4OatRbYLQZvpPoK
	VaSP6CUI+Wa97qd+LufUdZYx9sszht4jAjubC+N0I+E7HbUvhOK6MwUCDWOP/FWXtG8b74e2wEd9f
	4r12D7Ba9wJrR0DNJ3xUEGsMplRqicHcvGt7omni4AlHw7zXdC1u3+1KepfkCQ3a456UxxzYFzdlb
	HiAio/IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2r73-00Gd2g-9W; Wed, 07 Dec 2022 09:53:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2r44-00GZle-37; Wed, 07 Dec 2022 09:50:14 +0000
X-UUID: 0af4216270a2427baa34f70d652af0a9-20221207
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=RwIzkqZDNUF77Vh/sEKkllJuBWJIBT09XZvdLNUSwN8=;
	b=QAlMLbc35112HU+ziO5/M68bCS6PyOtXrNi5SKeEqAu0BE8OgURDnBwj6qQ+6CW/6GyiqCluA2PF6GxatXu+dzuqkaocVNk/VpNE0fVzWl8g5V2joF4UmUj9fDnj+FfqtHvBdQypJSEtmXdY23gBHy9sr5WIxPKvSxugAKJjVmQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:805a623e-a688-4e5a-8f87-4956d5948a28,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.14,REQID:805a623e-a688-4e5a-8f87-4956d5948a28,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:dcaaed0,CLOUDID:1005ce16-b863-49f8-8228-cbdfeedd1fa4,B
	ulkID:221207174928UEDA4PZP,BulkQuantity:1,Recheck:0,SF:38|28|17|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0
X-UUID: 0af4216270a2427baa34f70d652af0a9-20221207
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1703264870; Wed, 07 Dec 2022 02:50:03 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 7 Dec 2022 17:49:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 7 Dec 2022 17:49:24 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Roy-CW.Yeh
	<roy-cw.yeh@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>
Subject: [PATCH v4 7/8] soc: mediatek: mutex: Add mtk_mutex_set_mod support to set MOD1
Date: Wed, 7 Dec 2022 17:49:20 +0800
Message-ID: <20221207094921.15450-8-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221207094921.15450-1-moudy.ho@mediatek.com>
References: <20221207094921.15450-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_015008_164744_D2AA3495 
X-CRM114-Status: GOOD (  14.77  )
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

From: "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>

Add mtk_mutex_set_mod support to set MOD1

Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>
Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-mutex.c | 33 +++++++++++++++++++++++++-------
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index c1a33d52038e..a2be15a5c93a 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -23,6 +23,7 @@
 #define DISP_REG_MUTEX(n)			(0x24 + 0x20 * (n))
 #define DISP_REG_MUTEX_RST(n)			(0x28 + 0x20 * (n))
 #define DISP_REG_MUTEX_MOD(mutex_mod_reg, n)	(mutex_mod_reg + 0x20 * (n))
+#define DISP_REG_MUTEX_MOD1(mutex_mod_reg, n)	((mutex_mod_reg) + 0x20 * (n) + 0x4)
 #define DISP_REG_MUTEX_SOF(mutex_sof_reg, n)	(mutex_sof_reg + 0x20 * (n))
 #define DISP_REG_MUTEX_MOD2(n)			(0x34 + 0x20 * (n))
 
@@ -740,7 +741,7 @@ int mtk_mutex_write_mod(struct mtk_mutex *mutex,
 	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
 						 mutex[mutex->id]);
 	unsigned int reg;
-	unsigned int offset;
+	u32 reg_offset, id_offset = 0;
 
 	WARN_ON(&mtx->mutex[mutex->id] != mutex);
 
@@ -750,16 +751,34 @@ int mtk_mutex_write_mod(struct mtk_mutex *mutex,
 		return -EINVAL;
 	}
 
-	offset = DISP_REG_MUTEX_MOD(mtx->data->mutex_mod_reg,
-				    mutex->id);
-	reg = readl_relaxed(mtx->regs + offset);
+	/*
+	 * Some SoCs may have multiple MUTEX_MOD registers as more than 32 mods
+	 * are present, hence requiring multiple 32-bits registers.
+	 *
+	 * The mutex_table_mod fully represents that by defining the number of
+	 * the mod sequentially, later used as a bit number, which can be more
+	 * than 0..31.
+	 *
+	 * In order to retain compatibility with older SoCs, we perform R/W on
+	 * the single 32 bits registers, but this requires us to translate the
+	 * mutex ID bit accordingly.
+	 */
+	if (mtx->data->mutex_table_mod[idx] < 32) {
+		reg_offset = DISP_REG_MUTEX_MOD(mtx->data->mutex_mod_reg,
+						mutex->id);
+	} else {
+		reg_offset = DISP_REG_MUTEX_MOD1(mtx->data->mutex_mod_reg,
+						 mutex->id);
+		id_offset = 32;
+	}
 
+	reg = readl_relaxed(mtx->regs + reg_offset);
 	if (clear)
-		reg &= ~BIT(mtx->data->mutex_table_mod[idx]);
+		reg &= ~BIT(mtx->data->mutex_table_mod[idx] - id_offset);
 	else
-		reg |= BIT(mtx->data->mutex_table_mod[idx]);
+		reg |= BIT(mtx->data->mutex_table_mod[idx] - id_offset);
 
-	writel_relaxed(reg, mtx->regs + offset);
+	writel_relaxed(reg, mtx->regs + reg_offset);
 
 	return 0;
 }
-- 
2.18.0


