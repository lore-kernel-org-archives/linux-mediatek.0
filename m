Return-Path: <SRS0=O6hk=3K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3798EC2D0DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jan 2020 07:32:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B19021734
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jan 2020 07:32:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JaHmDbc6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="G6GJ0WK0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B19021734
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YGp1GnRGL8wlbGstJInpM0ufO0fi/BDPBJHfKBPDn4M=; b=JaHmDbc6Se4KnW
	/Sx4T2z7MeQdyftdRQ4Rc1CfYH4JA+XMF4Jjqj0FYDDQFSEq1+Caxz8giMWG1brAZ0pXJaLEQkbcl
	9P30PHDPYOnMfDV7wGcSMw8cRpKw3wA5DNCPydqGSVFQ7GE7cBxCKfkki+PmucqzXMpn4qxrYfMBx
	BR4HWVJVnl52PLsbmDblGJ33GfOY1ezwGkCs9YDzsHfdn1AeQlGiIqhmGSxGzKyjO8RfbWi/2OHod
	UOHEE16HDzzg8bJ6NUoBWETkxvCkl09G2mZu7PD+BD9VNAJpuvzs2kE5QW3Mu8/3VCDSvgPN+hZ5J
	aisGROokz0KAxUlYrqyQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ito1C-0000X3-IM; Tue, 21 Jan 2020 07:32:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ito0z-0000Ox-UO; Tue, 21 Jan 2020 07:32:02 +0000
X-UUID: 945bb207cc3743ecbaa959008d9aaec9-20200120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=RTFuTKew6Bbm3rHXc1VuNfPD8aZnX6svfZSE96XCyyo=; 
 b=G6GJ0WK0KJLZHBZHmKZEHKQeb4uL81/0+KuDml2kO3lqqls2rmeHT7qjXZCGRjvPPCKCT4yuve7e7RtrIj8s2Q1HHudI6Ir3vgdTqIpCLhM00xmyz7Tl5FAXsFJv1b42jxHrTD3hk6bWY/Wiub4o/g5n7iu2LLiTtMvEajDytCg=;
X-UUID: 945bb207cc3743ecbaa959008d9aaec9-20200120
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.mao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1240833627; Mon, 20 Jan 2020 23:31:50 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 20 Jan 2020 23:22:46 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 21 Jan 2020 15:21:06 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 21 Jan 2020 15:19:25 +0800
From: Yong Mao <yong.mao@mediatek.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH] mmc: mediatek: fix SDIO irq issue
Date: Tue, 21 Jan 2020 15:20:58 +0800
Message-ID: <1579591258-30940-2-git-send-email-yong.mao@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1579591258-30940-1-git-send-email-yong.mao@mediatek.com>
References: <1579591258-30940-1-git-send-email-yong.mao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200120_233157_987803_93DB1367 
X-CRM114-Status: GOOD (  12.65  )
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
Cc: srv_heupstream@mediatek.com, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, yong mao <yong.mao@mediatek.com>,
 linux-mediatek@lists.infradead.org, Chaotian Jing <chaotian.jing@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: yong mao <yong.mao@mediatek.com>

Host controller may lost interrupt in some specail case.
Add SDIO irq recheck mechanism to make sure all interrupts
can be processed immediately.

Signed-off-by: Yong Mao <yong.mao@mediatek.com>
---
 drivers/mmc/host/mtk-sd.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index 7726dcf..18a1b86 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -128,6 +128,7 @@
 #define MSDC_PS_CDSTS           (0x1 << 1)	/* R  */
 #define MSDC_PS_CDDEBOUNCE      (0xf << 12)	/* RW */
 #define MSDC_PS_DAT             (0xff << 16)	/* R  */
+#define MSDC_PS_DATA1           (0x1 << 17)	/* R  */
 #define MSDC_PS_CMD             (0x1 << 24)	/* R  */
 #define MSDC_PS_WP              (0x1 << 31)	/* R  */
 
@@ -361,6 +362,7 @@ struct msdc_save_para {
 
 struct mtk_mmc_compatible {
 	u8 clk_div_bits;
+	bool recheck_sdio_irq;
 	bool hs400_tune; /* only used for MT8173 */
 	u32 pad_tune_reg;
 	bool async_fifo;
@@ -436,6 +438,7 @@ struct msdc_host {
 
 static const struct mtk_mmc_compatible mt8135_compat = {
 	.clk_div_bits = 8,
+	.recheck_sdio_irq = false,
 	.hs400_tune = false,
 	.pad_tune_reg = MSDC_PAD_TUNE,
 	.async_fifo = false,
@@ -448,6 +451,7 @@ struct msdc_host {
 
 static const struct mtk_mmc_compatible mt8173_compat = {
 	.clk_div_bits = 8,
+	.recheck_sdio_irq = true,
 	.hs400_tune = true,
 	.pad_tune_reg = MSDC_PAD_TUNE,
 	.async_fifo = false,
@@ -460,6 +464,7 @@ struct msdc_host {
 
 static const struct mtk_mmc_compatible mt8183_compat = {
 	.clk_div_bits = 12,
+	.recheck_sdio_irq = false,
 	.hs400_tune = false,
 	.pad_tune_reg = MSDC_PAD_TUNE0,
 	.async_fifo = true,
@@ -472,6 +477,7 @@ struct msdc_host {
 
 static const struct mtk_mmc_compatible mt2701_compat = {
 	.clk_div_bits = 12,
+	.recheck_sdio_irq = false,
 	.hs400_tune = false,
 	.pad_tune_reg = MSDC_PAD_TUNE0,
 	.async_fifo = true,
@@ -484,6 +490,7 @@ struct msdc_host {
 
 static const struct mtk_mmc_compatible mt2712_compat = {
 	.clk_div_bits = 12,
+	.recheck_sdio_irq = false,
 	.hs400_tune = false,
 	.pad_tune_reg = MSDC_PAD_TUNE0,
 	.async_fifo = true,
@@ -496,6 +503,7 @@ struct msdc_host {
 
 static const struct mtk_mmc_compatible mt7622_compat = {
 	.clk_div_bits = 12,
+	.recheck_sdio_irq = false,
 	.hs400_tune = false,
 	.pad_tune_reg = MSDC_PAD_TUNE0,
 	.async_fifo = true,
@@ -508,6 +516,7 @@ struct msdc_host {
 
 static const struct mtk_mmc_compatible mt8516_compat = {
 	.clk_div_bits = 12,
+	.recheck_sdio_irq = false,
 	.hs400_tune = false,
 	.pad_tune_reg = MSDC_PAD_TUNE0,
 	.async_fifo = true,
@@ -518,6 +527,7 @@ struct msdc_host {
 
 static const struct mtk_mmc_compatible mt7620_compat = {
 	.clk_div_bits = 8,
+	.recheck_sdio_irq = false,
 	.hs400_tune = false,
 	.pad_tune_reg = MSDC_PAD_TUNE,
 	.async_fifo = false,
@@ -1007,6 +1017,30 @@ static int msdc_auto_cmd_done(struct msdc_host *host, int events,
 	return cmd->error;
 }
 
+/**
+ * msdc_recheck_sdio_irq - recheck whether the SDIO irq is lost
+ *
+ * Host controller may lost interrupt in some special case.
+ * Add SDIO irq recheck mechanism to make sure all interrupts
+ * can be processed immediately
+ *
+ */
+static void msdc_recheck_sdio_irq(struct msdc_host *host)
+{
+	u32 reg_int, reg_inten, reg_ps;
+
+	if ((host->mmc->caps & MMC_CAP_SDIO_IRQ)) {
+		reg_inten = readl(host->base + MSDC_INTEN);
+		if (reg_inten & MSDC_INTEN_SDIOIRQ) {
+			reg_int = readl(host->base + MSDC_INT);
+			reg_ps = readl(host->base + MSDC_PS);
+			if (!((reg_int & MSDC_INT_SDIOIRQ) ||
+			      (reg_ps & MSDC_PS_DATA1)))
+				sdio_signal_irq(host->mmc);
+		}
+	}
+}
+
 static void msdc_track_cmd_data(struct msdc_host *host,
 				struct mmc_command *cmd, struct mmc_data *data)
 {
@@ -1035,6 +1069,8 @@ static void msdc_request_done(struct msdc_host *host, struct mmc_request *mrq)
 	if (host->error)
 		msdc_reset_hw(host);
 	mmc_request_done(host->mmc, mrq);
+	if (host->dev_comp->recheck_sdio_irq)
+		msdc_recheck_sdio_irq(host);
 }
 
 /* returns true if command is fully handled; returns false otherwise */
@@ -1393,6 +1429,8 @@ static void __msdc_enable_sdio_irq(struct msdc_host *host, int enb)
 	if (enb) {
 		sdr_set_bits(host->base + MSDC_INTEN, MSDC_INTEN_SDIOIRQ);
 		sdr_set_bits(host->base + SDC_CFG, SDC_CFG_SDIOIDE);
+		if (host->dev_comp->recheck_sdio_irq)
+			msdc_recheck_sdio_irq(host);
 	} else {
 		sdr_clr_bits(host->base + MSDC_INTEN, MSDC_INTEN_SDIOIRQ);
 		sdr_clr_bits(host->base + SDC_CFG, SDC_CFG_SDIOIDE);
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
