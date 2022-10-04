Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 353CBC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Oct 2022 09:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0QxUE/VPUJjsy7nXdMh61J7IP+GEbz08zlvj71VE+wc=; b=0hLWh1Bwe9EZHugirb0ILmZzFI
	hmMyPxuJaRosBmoeTtEZ3dhjMKeY/L/jht6ikZviIJX6LMtcM+fRoSc2vt4eQMw2ePShxOPflZ5o6
	LHVkVmYmo3eju23MKha9z6elAwUb8KCiD3j4gtus9IFSpipvbfHTjJSq0Dc1KCDSQdSar7A5FQKJy
	irQpf5v/AuxMXfI7rTgYqWwYCa4OYobo8NVqjs9E9GhhIkZDys+jW21Fk40ANX0lsrtQEZ8LRLZao
	syg66wcYzihmrEhmeynyymPtQcospcQQrf3pZi+bu0NqDmO3w2gFWTlCcZ+sSg7y8hX9nIHrbZPzY
	HrMaPW2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofeK6-0098fB-HT; Tue, 04 Oct 2022 09:34:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofeJx-0098az-JQ; Tue, 04 Oct 2022 09:34:44 +0000
X-UUID: 57985fdb2753471d98af0c58dda82145-20221004
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=0QxUE/VPUJjsy7nXdMh61J7IP+GEbz08zlvj71VE+wc=;
	b=HbWt5Mn0WCEbBLRS1AqWfYlP0sWJyCVUT0YwO8bj7jvS2gVglMHBTdsWtaaMgbroYIpiofTR6zumsDnXhdvyCWPvc4nfMGXKkTX9G9OurSyXO1L3ejYbQyaFsXmI2iqZBdpd0XHJSpiyC/NS01OgZQ21bQF/E5vqdQRRIf0bhCk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:3b024167-a4f1-4bc2-8918-4357ecb18695,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:791bee07-1cee-4c38-b21b-a45f9682fdc0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 57985fdb2753471d98af0c58dda82145-20221004
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 394045647; Tue, 04 Oct 2022 02:34:28 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 4 Oct 2022 17:33:22 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 4 Oct 2022 17:33:22 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Roy-CW.Yeh
	<roy-cw.yeh@mediatek.com>
Subject: [PATCH v1 5/6] soc: mediatek: mutex: Add mtk_mutex_set_mod support to set MOD1
Date: Tue, 4 Oct 2022 17:33:18 +0800
Message-ID: <20221004093319.5069-6-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221004093319.5069-1-moudy.ho@mediatek.com>
References: <20221004093319.5069-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_023441_879638_39ABC608 
X-CRM114-Status: GOOD (  12.49  )
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
---
 drivers/soc/mediatek/mtk-mutex.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index c1a33d52038e..5dcbd61fe42c 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -23,6 +23,7 @@
 #define DISP_REG_MUTEX(n)			(0x24 + 0x20 * (n))
 #define DISP_REG_MUTEX_RST(n)			(0x28 + 0x20 * (n))
 #define DISP_REG_MUTEX_MOD(mutex_mod_reg, n)	(mutex_mod_reg + 0x20 * (n))
+#define DISP_REG_MUTEX_MOD1(mutex_mod_reg, n)	((mutex_mod_reg) + 0x20 * (n) + 0x4)
 #define DISP_REG_MUTEX_SOF(mutex_sof_reg, n)	(mutex_sof_reg + 0x20 * (n))
 #define DISP_REG_MUTEX_MOD2(n)			(0x34 + 0x20 * (n))
 
@@ -750,14 +751,24 @@ int mtk_mutex_write_mod(struct mtk_mutex *mutex,
 		return -EINVAL;
 	}
 
-	offset = DISP_REG_MUTEX_MOD(mtx->data->mutex_mod_reg,
-				    mutex->id);
-	reg = readl_relaxed(mtx->regs + offset);
-
-	if (clear)
-		reg &= ~BIT(mtx->data->mutex_table_mod[idx]);
-	else
-		reg |= BIT(mtx->data->mutex_table_mod[idx]);
+	if (mtx->data->mutex_table_mod[idx] < 32) {
+		offset = DISP_REG_MUTEX_MOD(mtx->data->mutex_mod_reg,
+					    mutex->id);
+		reg = readl_relaxed(mtx->regs + offset);
+		if (clear)
+			reg &= ~BIT(mtx->data->mutex_table_mod[idx]);
+		else
+			reg |= BIT(mtx->data->mutex_table_mod[idx]);
+
+	} else {
+		offset = DISP_REG_MUTEX_MOD1(mtx->data->mutex_mod_reg,
+					     mutex->id);
+		reg = readl_relaxed(mtx->regs + offset);
+		if (clear)
+			reg &= ~BIT(mtx->data->mutex_table_mod[idx] - 32);
+		else
+			reg |= BIT(mtx->data->mutex_table_mod[idx] - 32);
+	}
 
 	writel_relaxed(reg, mtx->regs + offset);
 
-- 
2.18.0


