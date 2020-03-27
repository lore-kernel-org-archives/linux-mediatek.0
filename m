Return-Path: <SRS0=6DyL=5M=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72318C43331
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Mar 2020 08:52:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4991620714
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Mar 2020 08:52:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OXoJVQl3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="g5kQspas"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4991620714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W1XCl85CKCDjA2iflL0UPmEOE0oQm/h1N2Vycepe+tg=; b=OXoJVQl3cJS3DO
	zlgR+z3G5t3Q0qy793oUQ3yFQ6TL7Im6zQuL3q9Lf7pwYh5NvlGcZm1aVkcg0q7dS48yulwfbe9JH
	eARmnkUp/UabI7biQLrlPh8VffzeQZ21r62aYosMPjC3WYT7GR6zrAr22O9vCfhmXP8674sAphIwu
	y6u0gwpx+09Q7qe093Bn4xxwXlCWc6rJcIR6Ud+WrGAdVGKutgI1RFYSG/s4cXRItRPe42i6Jf+OP
	tAYZFW8woHeCXECR8Rc1r0eOgLQTRMfho9OMa4czvkSo/3QptBgMx0sQpPf0Vmi7ktzU8Hzw6oZsx
	iWb7MF5GdGtvrPSZJoug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHkin-0008GY-Dg; Fri, 27 Mar 2020 08:52:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHkiL-0007oH-QX; Fri, 27 Mar 2020 08:51:43 +0000
X-UUID: 7b44feb9cb454b419ab69fb0e90f8122-20200327
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=RTElbvSp69D6eg2X/2aEFPOteskF1Lk4j0eYNpyZIlc=; 
 b=g5kQspaskwNT4Xl27XcqPBa473/rVtQ1UsyC0YGTR+2HyzyTP1fqTlrVRb19PER/ILeveRziQJ5dNE4nUheqDmtV4grs61gQvaniC+pzWUDSKPMKvohPl4208WXw7zwbmpw6GmEHKr55YJzfZO7Nm1NP32ukFqFleuD0afRsGzo=;
X-UUID: 7b44feb9cb454b419ab69fb0e90f8122-20200327
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.mao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 440690823; Fri, 27 Mar 2020 00:51:37 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 27 Mar 2020 01:51:36 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 27 Mar 2020 16:51:34 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 27 Mar 2020 16:51:33 +0800
From: Yong Mao <yong.mao@mediatek.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH v2] mmc: mediatek: fix SDIO irq issue
Date: Fri, 27 Mar 2020 16:51:37 +0800
Message-ID: <1585299097-6897-2-git-send-email-yong.mao@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1585299097-6897-1-git-send-email-yong.mao@mediatek.com>
References: <1585299097-6897-1-git-send-email-yong.mao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200327_015141_866328_7F10D759 
X-CRM114-Status: GOOD (  12.33  )
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

SDIO irq is not triggered by low level, but by falling edge in our
previous IC. This mechanism only have one chance to catch the SDIO irq
if a SDIO irq comes within the multiple block transmission. This SDIO
irq may be easily lost, because falling edge appears only once within 2
clock after data transmission is completed.

SDIO irq recheck mechanism will make sure all irqs can be
processed correctly.

Signed-off-by: Yong Mao <yong.mao@mediatek.com>
---
 drivers/mmc/host/mtk-sd.c | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index 7726dcf..b221c02 100644
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
@@ -591,6 +601,7 @@ static void msdc_reset_hw(struct msdc_host *host)
 
 static void msdc_cmd_next(struct msdc_host *host,
 		struct mmc_request *mrq, struct mmc_command *cmd);
+static void __msdc_enable_sdio_irq(struct msdc_host *host, int enb);
 
 static const u32 cmd_ints_mask = MSDC_INTEN_CMDRDY | MSDC_INTEN_RSPCRCERR |
 			MSDC_INTEN_CMDTMO | MSDC_INTEN_ACMDRDY |
@@ -1007,6 +1018,32 @@ static int msdc_auto_cmd_done(struct msdc_host *host, int events,
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
+	if (host->mmc->caps & MMC_CAP_SDIO_IRQ) {
+		reg_inten = readl(host->base + MSDC_INTEN);
+		if (reg_inten & MSDC_INTEN_SDIOIRQ) {
+			reg_int = readl(host->base + MSDC_INT);
+			reg_ps = readl(host->base + MSDC_PS);
+			if (!(reg_int & MSDC_INT_SDIOIRQ ||
+			      reg_ps & MSDC_PS_DATA1)) {
+				__msdc_enable_sdio_irq(host, 0);
+				sdio_signal_irq(host->mmc);
+			}
+		}
+	}
+}
+
 static void msdc_track_cmd_data(struct msdc_host *host,
 				struct mmc_command *cmd, struct mmc_data *data)
 {
@@ -1035,6 +1072,8 @@ static void msdc_request_done(struct msdc_host *host, struct mmc_request *mrq)
 	if (host->error)
 		msdc_reset_hw(host);
 	mmc_request_done(host->mmc, mrq);
+	if (host->dev_comp->recheck_sdio_irq)
+		msdc_recheck_sdio_irq(host);
 }
 
 /* returns true if command is fully handled; returns false otherwise */
@@ -1393,6 +1432,8 @@ static void __msdc_enable_sdio_irq(struct msdc_host *host, int enb)
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
