Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC89CCD37B0
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 10:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oXGZxMwhZWTw9RpNS/HAHuZ8JZRTDtDRBCtSru2d9KA=; b=lbqPgPKMZTB0QsYPP700zJ2KUB
	cN66M+sc1N4rbxcxR+ikz015Au3C53GcSlC5PomRljGyQPwiYUPqik4OXxaYNv+VYyKv+L9xhgIlD
	FgeowBOc47aOQu22zUrMEkR93TGdbk8XbJGP5ghL19TiDdEkhCvj+lTlvbEIyhOXAhsRCZXkJZbq2
	UW0enB030LI2/XFiacz3Wh1dwM0q7MHGMmo/xY19jmUU8t/R87w1ioNwZWDSQkzMPc8JTAEgtUfkK
	z1yBoGnTCAFBVPOQX1rA7JtFjndtgHyscIKIgYrLIZeWTd1jXHWcb8RYuvtoQJpJQQaO2YYvJSBjs
	Wl8ywsSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiBWL-00F87E-2T;
	Mon, 18 Sep 2023 10:30:25 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiBWJ-00F84F-0p
	for linux-mediatek@lists.infradead.org;
	Mon, 18 Sep 2023 10:30:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id DA425B80B4E;
	Mon, 18 Sep 2023 10:30:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37F8DC433C7;
	Mon, 18 Sep 2023 10:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695033020;
	bh=NuGvozSv9WccAC4JHs7SvmzDslrfdkBPTRpl9vmfPbQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dajBe8UHcmpSZTSecA7UhBzpGvpnNc4/ioZoZMETuar3JcSVv077OZnnutDz40M/d
	 bIxylgnm/0H2XrSz+o7wFZsifiMHeahDJMYBbgZGVVZrXERrpjFCvYFhs//GZySct9
	 s8MBhygrDL0340oeSHc/t2IGzshV6CwCsKFal917RXuircBh0xX/LQnnjWFVGZLz+2
	 oaLHMARfAslpoBjBIto4hS+IW9Ilx1P4lBdNvQCdEGfSQaNAx9pKjTnSSm66RM04dl
	 RCellb8cr2jBJjH0b+DKZ4RJELuRAMFZD4sPVFB8IxzQDm110Q/5s3ZB6LAfyvERIG
	 QdbJuOUyAiXbw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: lorenzo.bianconi@redhat.com,
	nbd@nbd.name,
	john@phrozen.org,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	daniel@makrotopia.org,
	linux-mediatek@lists.infradead.org,
	sujuan.chen@mediatek.com,
	horms@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 net-next 07/17] net: ethernet: mtk_wed: move mem_region array out of mtk_wed_mcu_load_firmware
Date: Mon, 18 Sep 2023 12:29:09 +0200
Message-ID: <6bc5ddb33661134118f3897c226f7b3f641db9c9.1695032291.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1695032290.git.lorenzo@kernel.org>
References: <cover.1695032290.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_033023_590333_B62C6095 
X-CRM114-Status: GOOD (  14.08  )
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

Remove mtk_wed_wo_memory_region boot structure in mtk_wed_wo.
This is a preliminary patch to introduce WED support for MT7988 SoC.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/mtk_wed_mcu.c | 37 ++++++++++-----------
 drivers/net/ethernet/mediatek/mtk_wed_wo.h  |  1 -
 2 files changed, 18 insertions(+), 20 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed_mcu.c b/drivers/net/ethernet/mediatek/mtk_wed_mcu.c
index 4e48905ac70d..cc54fbd7380a 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed_mcu.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed_mcu.c
@@ -16,14 +16,30 @@
 #include "mtk_wed_wo.h"
 #include "mtk_wed.h"
 
+static struct mtk_wed_wo_memory_region mem_region[] = {
+	[MTK_WED_WO_REGION_EMI] = {
+		.name = "wo-emi",
+	},
+	[MTK_WED_WO_REGION_ILM] = {
+		.name = "wo-ilm",
+	},
+	[MTK_WED_WO_REGION_DATA] = {
+		.name = "wo-data",
+		.shared = true,
+	},
+	[MTK_WED_WO_REGION_BOOT] = {
+		.name = "wo-boot",
+	},
+};
+
 static u32 wo_r32(struct mtk_wed_wo *wo, u32 reg)
 {
-	return readl(wo->boot.addr + reg);
+	return readl(mem_region[MTK_WED_WO_REGION_BOOT].addr + reg);
 }
 
 static void wo_w32(struct mtk_wed_wo *wo, u32 reg, u32 val)
 {
-	writel(val, wo->boot.addr + reg);
+	writel(val, mem_region[MTK_WED_WO_REGION_BOOT].addr + reg);
 }
 
 static struct sk_buff *
@@ -294,18 +310,6 @@ mtk_wed_mcu_run_firmware(struct mtk_wed_wo *wo, const struct firmware *fw,
 static int
 mtk_wed_mcu_load_firmware(struct mtk_wed_wo *wo)
 {
-	static struct mtk_wed_wo_memory_region mem_region[] = {
-		[MTK_WED_WO_REGION_EMI] = {
-			.name = "wo-emi",
-		},
-		[MTK_WED_WO_REGION_ILM] = {
-			.name = "wo-ilm",
-		},
-		[MTK_WED_WO_REGION_DATA] = {
-			.name = "wo-data",
-			.shared = true,
-		},
-	};
 	const struct mtk_wed_fw_trailer *trailer;
 	const struct firmware *fw;
 	const char *fw_name;
@@ -319,11 +323,6 @@ mtk_wed_mcu_load_firmware(struct mtk_wed_wo *wo)
 			return ret;
 	}
 
-	wo->boot.name = "wo-boot";
-	ret = mtk_wed_get_memory_region(wo, &wo->boot);
-	if (ret)
-		return ret;
-
 	/* set dummy cr */
 	wed_w32(wo->hw->wed_dev, MTK_WED_SCR0 + 4 * MTK_WED_DUMMY_CR_FWDL,
 		wo->hw->index + 1);
diff --git a/drivers/net/ethernet/mediatek/mtk_wed_wo.h b/drivers/net/ethernet/mediatek/mtk_wed_wo.h
index 7a1a2a28f1ac..8ed81761bf10 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed_wo.h
+++ b/drivers/net/ethernet/mediatek/mtk_wed_wo.h
@@ -228,7 +228,6 @@ struct mtk_wed_wo_queue {
 
 struct mtk_wed_wo {
 	struct mtk_wed_hw *hw;
-	struct mtk_wed_wo_memory_region boot;
 
 	struct mtk_wed_wo_queue q_tx;
 	struct mtk_wed_wo_queue q_rx;
-- 
2.41.0


