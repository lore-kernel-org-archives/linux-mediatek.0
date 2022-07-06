Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C07C1C43334
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jul 2022 10:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M+d0sFVIGh3BAb5DoIc3hEMMrIrYnc8CV7N9dbREBHY=; b=prNp8VoAb8FGmcf/NGob61pNhz
	weUTS4Opgk1pN7/c7Wa3N6R0moLwT34+et1R1MsfOdRuk/FDrTE37zbTKSN9wS7Ay9Uy6i9l/v+zQ
	PHBk5FLfZSrdD2P+bKeLKqBDLXFYmwlGVAOMf88GVt8zYjSV20MuDNSC1ZbVkmicTxjewWfw4Ta7/
	c1EHQ4kfipI21YzYyLdQtYvnKYYEdYhbMwbc3kIAP+KSJGZyIVezlNWIXfFt6Jme/yygZI9ZmoNPx
	c1yhkGEbAZ/KZJjx9mUr3YG9Bpd8rSYXo/ARbbGhkfIkUrYwHVDkCPr/FJGbrOXczc35jSa+4MSc7
	/+XFq0nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o92Pj-008eZP-VK; Wed, 06 Jul 2022 10:37:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o92Fz-008TJ7-OP; Wed, 06 Jul 2022 10:27:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=M+d0sFVIGh3BAb5DoIc3hEMMrIrYnc8CV7N9dbREBHY=; b=g7yIc6l7ooEwLgjMN6a6paMUMl
	ZXAYkIGn3J+bjg6QoYHem0JfwgNNQ2ULC14bXItbfCvswDochgDO2NM0+oQM1Cue6YuRMr7rLINxb
	yxvM/27bEdiomitW4mAMJqfRUaZ9iso9XkXFx7DkWshm2GB71leWNiXmFRF2RlsmG8w/u/IcLxfnr
	iDXfYkuV40z+KWi/MQvDKA9l3jVSqGVyzGH0mROxXxOHg2gbS8jQQMdDZyaDeEFjJJxXtw7impH5N
	Q1c58JBg6HOrkeNU8ocLMAkZ2cVKGoVWdVsy83iU1NZKT7c8B7YcGaNIK3kEoLOu67vM4b8LvP0dN
	7A6+BPgg==;
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o920J-000QTQ-I2; Wed, 06 Jul 2022 10:11:38 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D3DE566019AB;
	Wed,  6 Jul 2022 11:11:29 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1657102290;
	bh=Xhl1Ow9x+DfI22vAa93ClvjHOF/I+FiiBOeSds25YTo=;
	h=From:To:Cc:Subject:Date:From;
	b=krrLDBECxk0hdNlHvDKeZS2C+hDOHY3M44vURPYvwp1rLnnRGpRQn9y7VE/oW+IeX
	 DhyIlEzxzCla5C9R4zyXioRvvUd8Ix+mmOsj7kBV11kMKbx2h9GS1jq7eRzRgOURoq
	 iSySAHqvClcqZhNNe1GAnUrEP0pjqhckU8fFqo+7oXQ5WTiCe6w+6UigRq04h1H9+N
	 RfvEmeMEoIHQFg5PiRfkqRFNfIddz09A9j4IzgtgiAtTTiIMZRu23tFC5nFK4nZtfT
	 Xd6h8iHFgxnMFKIY27ojZfVWO6Li3oomo1XeyZh38nFKy6J1s0Xzp0IfDPtiOxUKo7
	 WJEDgeCJXp2EA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: dmitry.torokhov@gmail.com
Cc: matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	mkorpershoek@baylibre.com,
	linux-input@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 RESEND] Input: mtk-pmic-keys - Add support for MT6331 PMIC keys
Date: Wed,  6 Jul 2022 12:11:22 +0200
Message-Id: <20220706101122.201007-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_111137_212968_818CADB1 
X-CRM114-Status: GOOD (  10.29  )
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
2.35.1


