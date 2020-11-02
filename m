Return-Path: <SRS0=vtlS=EI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 839C7C00A89
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Nov 2020 09:29:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCB6C2223C
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Nov 2020 09:29:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pSkQzv7A";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="A8tcWOiw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCB6C2223C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NZGeLGi7Fp79/IMKvu4y4hXuYAwudqxVdTOBg06pzZA=; b=pSkQzv7AQ0o4J1I3Pvd1ex/ZE
	WwHittl8SbDSPjU4GZEZUmOTgxMYu+xV6oImX32t5jGt3nnYARQdo8nCN9q/z6xbBwiiElxJ1OQSa
	aW5BoemCDHyp+sQQRNtwJ5IZFa9Pqy3/1DzdPlwI5AVRjaUGIjdHHKDjfH8VrXIVCy/LNsTleQbIo
	wV8ZXts1e0sEYXV538XZs/Yik7llZhpJyxtvRzP4nnHvWXyw3wT8nvmY529ZcLOUGhSD/QnpHSYuS
	/eBn6FQ3CoPtkEjOclA/e7zeAlgojvAatei6ZeiEOjZ2U+KJVZt7vGnvjOudYSW/PKKq2M5rH4WxL
	W/qtYyDfQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZW96-0008Hn-Ib; Mon, 02 Nov 2020 09:29:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZW8h-00083U-OY; Mon, 02 Nov 2020 09:28:40 +0000
X-UUID: 6fd34b30f0674b0f97a3ea98b9bff5f5-20201102
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=C5PzwEDrXq2uJ9flwu0b/suH13npBpu+DCWJz4q7t2Y=; 
 b=A8tcWOiwfj21CPpl9YnqzwYTtPQVBdCUx97Ge7RZmyyf6Lo9m+IesAlxe5NKw+7ilo+rHO7oEZQ+9TFzwODRwLH47LZTZT14BJOuQJToCU0BDHMlJkOhJsHE4bqkVUS+hbuq0S3jCSmcsEoXUOCa4WEimUQ43azU15x5UZuR86o=;
X-UUID: 6fd34b30f0674b0f97a3ea98b9bff5f5-20201102
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <wenbin.mei@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 911244752; Mon, 02 Nov 2020 01:28:28 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 2 Nov 2020 01:28:26 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 2 Nov 2020 17:28:24 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 2 Nov 2020 17:28:24 +0800
From: Wenbin Mei <wenbin.mei@mediatek.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH v1 1/1] mmc: mediatek: add HS400 enhanced strobe support
Date: Mon, 2 Nov 2020 17:28:22 +0800
Message-ID: <20201102092822.5301-2-wenbin.mei@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201102092822.5301-1-wenbin.mei@mediatek.com>
References: <20201102092822.5301-1-wenbin.mei@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_042836_008325_20C2DD67 
X-CRM114-Status: GOOD (  13.64  )
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
Cc: Wenbin Mei <wenbin.mei@mediatek.com>, srv_heupstream@mediatek.com,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Chaotian Jing <chaotian.jing@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add support for HS400ES mode to MediaTek MMC Card Driver.

Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
---
 drivers/mmc/host/mtk-sd.c | 40 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index f7f68623fefc..fc5ee5df91ad 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -78,9 +78,12 @@
 #define MSDC_PAD_TUNE0   0xf0
 #define PAD_DS_TUNE      0x188
 #define PAD_CMD_TUNE     0x18c
+#define EMMC51_CFG0	 0x204
 #define EMMC50_CFG0      0x208
+#define EMMC50_CFG1      0x20c
 #define EMMC50_CFG3      0x220
 #define SDC_FIFO_CFG     0x228
+#define CQHCI_SETTING	 0x7fc
 
 /*--------------------------------------------------------------------------*/
 /* Top Pad Register Offset                                                  */
@@ -261,15 +264,26 @@
 
 #define PAD_CMD_TUNE_RX_DLY3	  (0x1f << 1)  /* RW */
 
+/* EMMC51_CFG0 mask */
+#define CMDQ_RDAT_CNT		  (0x3ff << 12)	/* RW */
+
 #define EMMC50_CFG_PADCMD_LATCHCK (0x1 << 0)   /* RW */
 #define EMMC50_CFG_CRCSTS_EDGE    (0x1 << 3)   /* RW */
 #define EMMC50_CFG_CFCSTS_SEL     (0x1 << 4)   /* RW */
+#define EMMC50_CFG_CMD_RESP_SEL   (0x1 << 9)   /* RW */
+
+/* EMMC50_CFG1 mask */
+#define EMMC50_CFG1_DS_CFG        (0x1 << 28)  /* RW */
 
 #define EMMC50_CFG3_OUTS_WR       (0x1f << 0)  /* RW */
 
 #define SDC_FIFO_CFG_WRVALIDSEL   (0x1 << 24)  /* RW */
 #define SDC_FIFO_CFG_RDVALIDSEL   (0x1 << 25)  /* RW */
 
+/* CQHCI_SETTING */
+#define CQHCI_RD_CMD_WND_SEL	  (0x1 << 14) /* RW */
+#define CQHCI_WR_CMD_WND_SEL	  (0x1 << 15) /* RW */
+
 /* EMMC_TOP_CONTROL mask */
 #define PAD_RXDLY_SEL           (0x1 << 0)      /* RW */
 #define DELAY_EN                (0x1 << 1)      /* RW */
@@ -2276,6 +2290,31 @@ static int msdc_get_cd(struct mmc_host *mmc)
 		return !val;
 }
 
+static void msdc_hs400_enhanced_strobe(struct mmc_host *mmc,
+				       struct mmc_ios *ios)
+{
+	struct msdc_host *host = mmc_priv(mmc);
+
+	if (ios->enhanced_strobe) {
+		msdc_prepare_hs400_tuning(mmc, ios);
+		sdr_set_field(host->base + EMMC50_CFG0, EMMC50_CFG_PADCMD_LATCHCK, 1);
+		sdr_set_field(host->base + EMMC50_CFG0, EMMC50_CFG_CMD_RESP_SEL, 1);
+		sdr_set_field(host->base + EMMC50_CFG1, EMMC50_CFG1_DS_CFG, 1);
+
+		sdr_clr_bits(host->base + CQHCI_SETTING, CQHCI_RD_CMD_WND_SEL);
+		sdr_clr_bits(host->base + CQHCI_SETTING, CQHCI_WR_CMD_WND_SEL);
+		sdr_clr_bits(host->base + EMMC51_CFG0, CMDQ_RDAT_CNT);
+	} else {
+		sdr_set_field(host->base + EMMC50_CFG0, EMMC50_CFG_PADCMD_LATCHCK, 0);
+		sdr_set_field(host->base + EMMC50_CFG0, EMMC50_CFG_CMD_RESP_SEL, 0);
+		sdr_set_field(host->base + EMMC50_CFG1, EMMC50_CFG1_DS_CFG, 0);
+
+		sdr_set_bits(host->base + CQHCI_SETTING, CQHCI_RD_CMD_WND_SEL);
+		sdr_set_bits(host->base + CQHCI_SETTING, CQHCI_WR_CMD_WND_SEL);
+		sdr_set_field(host->base + EMMC51_CFG0, CMDQ_RDAT_CNT, 0xb4);
+	}
+}
+
 static void msdc_cqe_enable(struct mmc_host *mmc)
 {
 	struct msdc_host *host = mmc_priv(mmc);
@@ -2333,6 +2372,7 @@ static const struct mmc_host_ops mt_msdc_ops = {
 	.set_ios = msdc_ops_set_ios,
 	.get_ro = mmc_gpio_get_ro,
 	.get_cd = msdc_get_cd,
+	.hs400_enhanced_strobe = msdc_hs400_enhanced_strobe,
 	.enable_sdio_irq = msdc_enable_sdio_irq,
 	.ack_sdio_irq = msdc_ack_sdio_irq,
 	.start_signal_voltage_switch = msdc_ops_switch_volt,
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
