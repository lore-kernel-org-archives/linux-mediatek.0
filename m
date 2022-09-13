Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FD0DC6FA82
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Sep 2022 12:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3Xm5H0rtGkypaZ8EhTgwJ1LPd4bDN6mTj9DOBanR/TA=; b=2eAJR3O63+Arm9N1AHFreOh+Er
	DxImZm+xJjecB3jogu9nlSDRXBl9Xsf9BRvPMBCwVrF5latt+b7f7urEwbppgmN0B1M/wYFq63xjv
	1FdRE3pwZWml3AM4PAzzxvivuogQjsluUg4t7RBnLmR4G3yjjTIQxLXm189MbVhBZ5WN5wY5/5lMP
	PTAOHqE1qiuKhD6g+UmOP0RhJ1b/9ZI+J7Rysu9m5s83FY3YrWDsNBReSQCp3f+bdEnDzRgKP+v6O
	5S1W/SRz8X6pzYZvG5FxPQYuxbL/Idg+evDiBVyMhC8IMJUXh/BJaBI/ha5Jgn55ylFG1zJoDh12e
	zCTyADqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY5Cu-00A77O-Ef; Tue, 13 Sep 2022 12:40:04 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY5Cd-00A6rY-Sa; Tue, 13 Sep 2022 12:39:49 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D20A56602004;
	Tue, 13 Sep 2022 13:39:45 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663072786;
	bh=4aHkfIG0KyeHeioBIbpPVvyCjS4/hravDIIXVa8y+co=;
	h=From:To:Cc:Subject:Date:From;
	b=FoB378OLYcBw9msFo6rgSXlb52EcgjU/9ofr5v+VWUMz4z3ikf6OVhLBsFjL8YcJJ
	 12LP66OhY+GixrcsPGzBt41KPsRf2TKXulDVwvUZ7M0RxPxGeINNXYk1IUdIVNcXZX
	 s194ZkaN2z9lDROvw0z1BdlLx+kHRwwanWjkCeKRTeJVPMH5KvCEMDqcbhNrtkvdLF
	 fz2W2+4hLYm40i1KdNe4XX7CKvvAmyoJspWCjN5rqzwVerfNJGQAGCMRcT+n2rhk7/
	 iSWVJJn/d3rGvY4DiMf4mlah7JTgqTQyFwfJVaSo0mkZ/c3NIYzS+CeufUpCAiUHpm
	 32ZFnODAGs/9Q==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: dmitry.torokhov@gmail.com
Cc: matthias.bgg@gmail.com,
	mkorpershoek@baylibre.com,
	angelogioacchino.delregno@collabora.com,
	linux-input@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] Input: mtk-pmic-keys - Add support for MT6331 PMIC keys
Date: Tue, 13 Sep 2022 14:39:41 +0200
Message-Id: <20220913123941.385349-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_053948_082016_71B6FA8F 
X-CRM114-Status: GOOD (  10.56  )
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

Add support for PMIC Keys of the MT6331 PMIC.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
---

v3: Rebased on next-20220909, leftover patch from series
    https://patchwork.kernel.org/project/linux-mediatek/list/?series=644591

 drivers/input/keyboard/mtk-pmic-keys.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index 6404081253ea..9b34da0ec260 100644
--- a/drivers/input/keyboard/mtk-pmic-keys.c
+++ b/drivers/input/keyboard/mtk-pmic-keys.c
@@ -9,6 +9,7 @@
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/mfd/mt6323/registers.h>
+#include <linux/mfd/mt6331/registers.h>
 #include <linux/mfd/mt6358/registers.h>
 #include <linux/mfd/mt6397/core.h>
 #include <linux/mfd/mt6397/registers.h>
@@ -22,6 +23,10 @@
 #define MTK_PMIC_PWRKEY_RST	BIT(6)
 #define MTK_PMIC_HOMEKEY_RST	BIT(5)
 
+#define MTK_PMIC_MT6331_RST_DU_MASK	GENMASK(13, 12)
+#define MTK_PMIC_MT6331_PWRKEY_RST	BIT(9)
+#define MTK_PMIC_MT6331_HOMEKEY_RST	BIT(8)
+
 #define MTK_PMIC_PWRKEY_INDEX	0
 #define MTK_PMIC_HOMEKEY_INDEX	1
 #define MTK_PMIC_MAX_KEY_COUNT	2
@@ -72,6 +77,19 @@ static const struct mtk_pmic_regs mt6323_regs = {
 	.rst_lprst_mask = MTK_PMIC_RST_DU_MASK,
 };
 
+static const struct mtk_pmic_regs mt6331_regs = {
+	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
+		MTK_PMIC_KEYS_REGS(MT6331_TOPSTATUS, 0x2,
+				   MT6331_INT_MISC_CON, 0x4,
+				   MTK_PMIC_MT6331_PWRKEY_RST),
+	.keys_regs[MTK_PMIC_HOMEKEY_INDEX] =
+		MTK_PMIC_KEYS_REGS(MT6331_TOPSTATUS, 0x4,
+				   MT6331_INT_MISC_CON, 0x2,
+				   MTK_PMIC_MT6331_HOMEKEY_RST),
+	.pmic_rst_reg = MT6331_TOP_RST_MISC,
+	.rst_lprst_mask = MTK_PMIC_MT6331_RST_DU_MASK,
+};
+
 static const struct mtk_pmic_regs mt6358_regs = {
 	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
 		MTK_PMIC_KEYS_REGS(MT6358_TOPSTATUS,
@@ -255,6 +273,9 @@ static const struct of_device_id of_mtk_pmic_keys_match_tbl[] = {
 	}, {
 		.compatible = "mediatek,mt6323-keys",
 		.data = &mt6323_regs,
+	}, {
+		.compatible = "mediatek,mt6331-keys",
+		.data = &mt6331_regs,
 	}, {
 		.compatible = "mediatek,mt6358-keys",
 		.data = &mt6358_regs,
-- 
2.37.2


