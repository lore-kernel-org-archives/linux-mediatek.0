Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08689C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Oct 2022 07:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UWzZ1XuNbeLhaXKPpthfWABYNiV9h8pGaaiOz8ygNAQ=; b=p3z2Qg3+BFkLdJthurLt6kRo3m
	y4w1GN7KwQ3sN7lzATFU88FRG2Kwa1Hr0ofyB2NTEEk9eaNi92vVpFIhl87/EhEa2E2rhjX5kBuPe
	ytP5+KulDjIl2IB3RihkE3UJeg6yutNBbvUCFa/PpyPXQhK9b7/E/x6wp8cyXcCVgzSpWo3mIW7rw
	6Dy3+NeX8HHPH8MnM41rpPc5Rg1pQQUvdQPitmbJpSG/cDh/bDROoOB2XFbNifPwXoImRztyLKSPz
	IkxAHQv5BtZGgDWuCzJreyjl7EGolyhcg5vReB+5U7KIadCTc3v4/CzOFREmm9H3BXBRb1TriRDsz
	opf77xbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oi9Jd-003WYv-Nl; Tue, 11 Oct 2022 07:04:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oi9JZ-003WWa-RW; Tue, 11 Oct 2022 07:04:35 +0000
X-UUID: 1eaa435e86e8444bb952a036f536f0b3-20221011
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=UWzZ1XuNbeLhaXKPpthfWABYNiV9h8pGaaiOz8ygNAQ=;
	b=VaEZXig2TQnjBUuVp6TMQrl0cnlEv4F3rvdg5OKvSngar0j5mh+VHHyj54UYl1J5lFcYZWo9CBqrf9OB4iL7GwYVAxPqutkGkJ8xwGm6ALoJJKSMFUVSrtLtBWMPq+SK/oCjGv5jxD1gYcYtqME+6SPgi4zJpX2H9gKb8sKo0iI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:66651a22-8ba0-4acf-85db-acc5430e0dbe,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:100
X-CID-INFO: VERSION:1.1.11,REQID:66651a22-8ba0-4acf-85db-acc5430e0dbe,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:100
X-CID-META: VersionHash:39a5ff1,CLOUDID:1ff91501-cdeb-479d-93af-53f947adce9d,B
	ulkID:221011150405RQF47KC5,BulkQuantity:0,Recheck:0,SF:38|28|17|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 1eaa435e86e8444bb952a036f536f0b3-20221011
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 967734179; Tue, 11 Oct 2022 00:04:05 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 11 Oct 2022 15:03:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 11 Oct 2022 15:03:57 +0800
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
Subject: [PATCH v2 6/7] soc: mediatek: mutex: Add mtk_mutex_set_mod support to set MOD1
Date: Tue, 11 Oct 2022 15:03:55 +0800
Message-ID: <20221011070356.682-7-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221011070356.682-1-moudy.ho@mediatek.com>
References: <20221011070356.682-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_000433_913876_6C6B9D13 
X-CRM114-Status: GOOD (  13.46  )
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


