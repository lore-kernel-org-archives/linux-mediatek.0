Return-Path: <SRS0=QZHK=OH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5B4BC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Sep 2021 12:39:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADA3761056
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Sep 2021 12:39:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ADA3761056
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DWyctMmNHQTQz7S1VekiFVsXn9jLCpxTiNOOzI7E9oE=; b=T6aVV7E+nn2k22
	+P6LiOjcE71ZIslITV3Zqp+c6FqHcMThVvAOCasgz8uXJgdTix0pTTyrB+Col7RnfUKCA+2vNp+FU
	XajSPg3AfIad7KsBDisJDaiijhaKqki+vvdgQHpiFi9q3Jgk7AShEU/4EFxwj2LfoVhicTRw941b6
	cHYrDBsfEib/ZfRxX5GK8u+yIVaC+GrG4b1Dy3K+98BLouVuP2oZRmRkyg0LGiTwKbmBg/yxWMLeO
	/2naO1MBBwNzOGDk72EO9E8yN9XyuOXZHh/0jjXyAp+tOSwUP/tvNuptXtgoGz65qKz5nAG/9czDM
	ydhmM175M7oeUgZgfObw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mRD9M-00E7sq-0I; Fri, 17 Sep 2021 12:39:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mRD8x-00E7ll-It; Fri, 17 Sep 2021 12:39:05 +0000
X-UUID: 9e670567c4b840f6be40cc1b4b5854a9-20210917
X-UUID: 9e670567c4b840f6be40cc1b4b5854a9-20210917
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <wenbin.mei@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1607073605; Fri, 17 Sep 2021 05:38:58 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 17 Sep 2021 05:38:56 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 17 Sep 2021 20:38:55 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 17 Sep 2021 20:38:54 +0800
From: Wenbin Mei <wenbin.mei@mediatek.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
CC: Chaotian Jing <chaotian.jing@mediatek.com>, Avri Altman
 <avri.altman@wdc.com>, Wenbin Mei <wenbin.mei@mediatek.com>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Yoshihiro Shimoda
 <yoshihiro.shimoda.uh@renesas.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Yue Hu <huyue2@yulong.com>, Bean Huo <beanhuo@micron.com>, Adrian Hunter
 <adrian.hunter@intel.com>, <linux-mmc@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 3/3] mmc: mediatek: Add HS400 online tuning support
Date: Fri, 17 Sep 2021 20:38:51 +0800
Message-ID: <20210917123851.22741-4-wenbin.mei@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210917123851.22741-1-wenbin.mei@mediatek.com>
References: <20210917123851.22741-1-wenbin.mei@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210917_053903_740463_F7B5E043 
X-CRM114-Status: GOOD (  22.99  )
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

According to JEDEC Spec, there is no need to do tuning under HS400 mode
since the Rx signal is aligned with the DS signal. However, MediaTek's
IC need set its "DS delay" internally to ensure it can latch Rx signal
correctly.
In previous version, We provide an "hs400-ds-delay" in device tree to
cover different chipset/PCB design, and it works fine in most cases.
But, with the development of process technology and the big VCore
voltage scale range(may have 0.7V/0.6V/0.55V), it is difficult to find
a suitable "hs400-ds-delay" to cover all of IC corner
cases(SSSS/TTTT/FFFF).
So that We must have the ability to do hs400 online tuning.

Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
Reviewed-by: Chaotian Jing <chaotian.jing@mediatek.com>
---
 drivers/mmc/host/mtk-sd.c | 79 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 77 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index 4dfc246c5f95..5f98f869545d 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -258,6 +258,7 @@
 #define MSDC_PAD_TUNE_RD_SEL	  (0x1 << 13)   /* RW */
 #define MSDC_PAD_TUNE_CMD_SEL	  (0x1 << 21)   /* RW */
 
+#define PAD_DS_TUNE_DLY_SEL       (0x1 << 0)	/* RW */
 #define PAD_DS_TUNE_DLY1	  (0x1f << 2)   /* RW */
 #define PAD_DS_TUNE_DLY2	  (0x1f << 7)   /* RW */
 #define PAD_DS_TUNE_DLY3	  (0x1f << 12)  /* RW */
@@ -301,6 +302,11 @@
 #define PAD_CMD_RD_RXDLY_SEL    (0x1 << 11)     /* RW */
 #define PAD_CMD_TX_DLY          (0x1f << 12)    /* RW */
 
+/* EMMC50_PAD_DS_TUNE mask */
+#define PAD_DS_DLY_SEL		(0x1 << 16)	/* RW */
+#define PAD_DS_DLY1		(0x1f << 10)	/* RW */
+#define PAD_DS_DLY3		(0x1f << 0)	/* RW */
+
 #define REQ_CMD_EIO  (0x1 << 0)
 #define REQ_CMD_TMO  (0x1 << 1)
 #define REQ_DAT_ERR  (0x1 << 2)
@@ -448,11 +454,13 @@ struct msdc_host {
 	bool vqmmc_enabled;
 	u32 latch_ck;
 	u32 hs400_ds_delay;
+	u32 hs400_ds_dly3;
 	u32 hs200_cmd_int_delay; /* cmd internal delay for HS200/SDR104 */
 	u32 hs400_cmd_int_delay; /* cmd internal delay for HS400 */
 	bool hs400_cmd_resp_sel_rising;
 				 /* cmd response sample selection for HS400 */
 	bool hs400_mode;	/* current eMMC will run at hs400 mode */
+	bool hs400_tuning;	/* hs400 mode online tuning */
 	bool internal_cd;	/* Use internal card-detect logic */
 	bool cqhci;		/* support eMMC hw cmdq */
 	struct msdc_save_para save_para; /* used when gate HCLK */
@@ -1190,7 +1198,8 @@ static bool msdc_cmd_done(struct msdc_host *host, int events,
 	if (!sbc_error && !(events & MSDC_INT_CMDRDY)) {
 		if (events & MSDC_INT_CMDTMO ||
 		    (cmd->opcode != MMC_SEND_TUNING_BLOCK &&
-		     cmd->opcode != MMC_SEND_TUNING_BLOCK_HS200))
+		     cmd->opcode != MMC_SEND_TUNING_BLOCK_HS200 &&
+		     !host->hs400_tuning))
 			/*
 			 * should not clear fifo/interrupt as the tune data
 			 * may have alreay come when cmd19/cmd21 gets response
@@ -1287,7 +1296,8 @@ static void msdc_cmd_next(struct msdc_host *host,
 	if ((cmd->error &&
 	    !(cmd->error == -EILSEQ &&
 	      (cmd->opcode == MMC_SEND_TUNING_BLOCK ||
-	       cmd->opcode == MMC_SEND_TUNING_BLOCK_HS200))) ||
+	       cmd->opcode == MMC_SEND_TUNING_BLOCK_HS200 ||
+	       host->hs400_tuning))) ||
 	    (mrq->sbc && mrq->sbc->error))
 		msdc_request_done(host, mrq);
 	else if (cmd == mrq->sbc)
@@ -2251,6 +2261,67 @@ static int msdc_prepare_hs400_tuning(struct mmc_host *mmc, struct mmc_ios *ios)
 	return 0;
 }
 
+static int msdc_execute_hs400_tuning(struct mmc_host *mmc, struct mmc_card *card)
+{
+	struct msdc_host *host = mmc_priv(mmc);
+	struct msdc_delay_phase dly1_delay;
+	u32 val, result_dly1 = 0;
+	u8 *ext_csd;
+	int i, ret;
+
+	if (host->top_base) {
+		sdr_set_bits(host->top_base + EMMC50_PAD_DS_TUNE,
+			     PAD_DS_DLY_SEL);
+		if (host->hs400_ds_dly3)
+			sdr_set_field(host->top_base + EMMC50_PAD_DS_TUNE,
+				      PAD_DS_DLY3, host->hs400_ds_dly3);
+	} else {
+		sdr_set_bits(host->base + PAD_DS_TUNE, PAD_DS_TUNE_DLY_SEL);
+		if (host->hs400_ds_dly3)
+			sdr_set_field(host->base + PAD_DS_TUNE,
+				      PAD_DS_TUNE_DLY3, host->hs400_ds_dly3);
+	}
+
+	host->hs400_tuning = true;
+	for (i = 0; i < PAD_DELAY_MAX; i++) {
+		if (host->top_base)
+			sdr_set_field(host->top_base + EMMC50_PAD_DS_TUNE,
+				      PAD_DS_DLY1, i);
+		else
+			sdr_set_field(host->base + PAD_DS_TUNE,
+				      PAD_DS_TUNE_DLY1, i);
+		ret = mmc_get_ext_csd(card, &ext_csd);
+		if (!ret)
+			result_dly1 |= (1 << i);
+	}
+	host->hs400_tuning = false;
+
+	dly1_delay = get_best_delay(host, result_dly1);
+	if (dly1_delay.maxlen == 0) {
+		dev_err(host->dev, "Failed to get DLY1 delay!\n");
+		goto fail;
+	}
+	if (host->top_base)
+		sdr_set_field(host->top_base + EMMC50_PAD_DS_TUNE,
+			      PAD_DS_DLY1, dly1_delay.final_phase);
+	else
+		sdr_set_field(host->base + PAD_DS_TUNE,
+			      PAD_DS_TUNE_DLY1, dly1_delay.final_phase);
+
+	if (host->top_base)
+		val = readl(host->top_base + EMMC50_PAD_DS_TUNE);
+	else
+		val = readl(host->base + PAD_DS_TUNE);
+
+	dev_info(host->dev, "Fianl PAD_DS_TUNE: 0x%x\n", val);
+
+	return 0;
+
+fail:
+	dev_err(host->dev, "Failed to tuning DS pin delay!\n");
+	return -EIO;
+}
+
 static void msdc_hw_reset(struct mmc_host *mmc)
 {
 	struct msdc_host *host = mmc_priv(mmc);
@@ -2377,6 +2448,7 @@ static const struct mmc_host_ops mt_msdc_ops = {
 	.card_busy = msdc_card_busy,
 	.execute_tuning = msdc_execute_tuning,
 	.prepare_hs400_tuning = msdc_prepare_hs400_tuning,
+	.execute_hs400_tuning = msdc_execute_hs400_tuning,
 	.hw_reset = msdc_hw_reset,
 };
 
@@ -2396,6 +2468,9 @@ static void msdc_of_property_parse(struct platform_device *pdev,
 	of_property_read_u32(pdev->dev.of_node, "hs400-ds-delay",
 			     &host->hs400_ds_delay);
 
+	of_property_read_u32(pdev->dev.of_node, "mediatek,hs400-ds-dly3",
+			     &host->hs400_ds_dly3);
+
 	of_property_read_u32(pdev->dev.of_node, "mediatek,hs200-cmd-int-delay",
 			     &host->hs200_cmd_int_delay);
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
