Return-Path: <SRS0=wYRt=DE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 088C4C4346E
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Sep 2020 08:44:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E676207BC
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Sep 2020 08:44:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TgcUbwNJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="otxsTcnm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E676207BC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gDu3hlkakxHafKb+mkuNa2tFD7sdWfSfuiLWZs6or0I=; b=TgcUbwNJ5wsU59ev65HON6yGjR
	GoWZN+3TB6RFCBU9GSx4cfUB1X+mnLKHtBTUigfuEA7xWTWf9wOq1obMnu9wtx1h1qqsWTPiIMxbv
	gV7UdS7MQGOgnw88v5IzWWHAABeQMBEEDi1BAF3982eSDDJ2fPqkgzzQI21fUg3NtKLeg2hwbGGGT
	alMEYS3mz6aVw4DmR8vM6o8Ni9+o0YHB+iRQVUPE8RdvNdFXUG1Gl3JEcDG2bjNjQ+uJDMYMQQRXp
	vXy8/6xd0144wGL5tfvhajoRJV0gEq58OXS1aAn/rFrdUu90BXwTSvQwZvuVsWLbvircAFFWBbG+3
	rIxBByQQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMSI0-0000o9-8g; Sun, 27 Sep 2020 08:44:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMSHw-0000mr-3G; Sun, 27 Sep 2020 08:44:10 +0000
X-UUID: 2486eb21bafb4d4eac03a8471dcc0351-20200927
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=QleYhuwnbelTuGStTKgnywWSqh557Do7nZMw55hQZz8=; 
 b=otxsTcnmb6tbqxhjZx+jrMRs+YX6X7UdeHQQHzqdZ4+bwwG3whTfHlYO69asIMWrzUm+/VI+6ir4cDyGagJJNg8WteKGMNoCxIdb0uGJVVM8dSDpKr5k5xGAZf4RcHhEq4qSSj/NgLpT8b6+rqoaj2S4wk6m7qguIzXsGX7hwxw=;
X-UUID: 2486eb21bafb4d4eac03a8471dcc0351-20200927
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <gray.jia@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1449360273; Sun, 27 Sep 2020 00:41:54 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 27 Sep 2020 01:41:52 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 27 Sep 2020 16:41:50 +0800
Received: from localhost.localdomain (10.15.20.246) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 27 Sep 2020 16:41:49 +0800
From: Gray Jia <gray.jia@mediatek.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Chaotian Jing
 <chaotian.jing@mediatek.com>, Adrian Hunter <adrian.hunter@intel.com>
Subject: [PATCH] MMC: Add MMC host software CQHCI interface
Date: Sun, 27 Sep 2020 16:36:06 +0800
Message-ID: <1601195766-26648-1-git-send-email-gray.jia@mediatek.com>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200927_044408_421347_C49A7BBA 
X-CRM114-Status: GOOD (  20.71  )
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
Cc: Ritesh Harjani <riteshh@codeaurora.org>, srv_heupstream@mediatek.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-mmc@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-mediatek@lists.infradead.org,
 Ben Chuang <ben.chuang@genesyslogic.com.tw>,
 Takao Orito <orito.takao@socionext.com>,
 Angelo Dureghello <angelo.dureghello@timesys.com>,
 linux-arm-kernel@lists.infradead.org, Gray Jia <gray.jia@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

	Some emmc hosts may not support cqhci hardware, but cmds can be sent
during data transmission.
	In this case, using the traditional host send class11 cmds to manage
device cmdq(eMMC device after spec5.0) can gain the significant performance
improvement. We have done experiments on the mtk platform(mt6761).
	The performance shows that :
		--benchmark(android apk: androbench speed: MB/s)
	sequential_read  sequential_write  random_read  random_write
	w/  swcmdq         272             142             62            35
	w/o swcmdq         270             142             25            34

	Perhaps it can be called software cqhci infterface. And the source code
relies on the management of three 32-bits bitmaps for task management :
tasks to be set(cmd44/45),
tasks to be execute(cmd46/47),
tasks to be poll ready(cmd13 with qsr request).

Signed-off-by: Gray Jia <gray.jia@mediatek.com>
---
 MAINTAINERS                 |   5 +
 drivers/mmc/core/queue.h    | 118 +---------
 drivers/mmc/host/Kconfig    |  11 +
 drivers/mmc/host/Makefile   |   1 +
 drivers/mmc/host/mtk-sd.c   | 307 ++++++++++++++++++++----
 drivers/mmc/host/sw-cqhci.c | 450 ++++++++++++++++++++++++++++++++++++
 drivers/mmc/host/sw-cqhci.h |  69 ++++++
 include/linux/mmc/host.h    |   1 +
 include/linux/mmc/queue.h   | 115 +++++++++
 9 files changed, 915 insertions(+), 162 deletions(-)
 create mode 100644 drivers/mmc/host/sw-cqhci.c
 create mode 100644 drivers/mmc/host/sw-cqhci.h
 create mode 100644 include/linux/mmc/queue.h

diff --git a/MAINTAINERS b/MAINTAINERS
index deaafb617361..1f7856b1b002 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6401,6 +6401,11 @@ L:	linux-mmc@vger.kernel.org
 S:	Maintained
 F:	drivers/mmc/host/cqhci*
 
+EMMC SW CMDQ HOST CONTROLLER INTERFACE (CQHCI) DRIVER
+M:	Gray Jia <gray.jia@mediatek.com>
+S:	Supported
+F:	drivers/mmc/host/sw-cqhci.*
+
 EMULEX 10Gbps iSCSI - OneConnect DRIVER
 M:	Subbu Seetharaman <subbu.seetharaman@broadcom.com>
 M:	Ketan Mukadam <ketan.mukadam@broadcom.com>
diff --git a/drivers/mmc/core/queue.h b/drivers/mmc/core/queue.h
index fd11491ced9f..b3f4595ea79c 100644
--- a/drivers/mmc/core/queue.h
+++ b/drivers/mmc/core/queue.h
@@ -2,123 +2,19 @@
 #ifndef MMC_QUEUE_H
 #define MMC_QUEUE_H
 
-#include <linux/types.h>
-#include <linux/blkdev.h>
-#include <linux/blk-mq.h>
-#include <linux/mmc/core.h>
-#include <linux/mmc/host.h>
+#include <linux/mmc/queue.h>
 
-enum mmc_issued {
-	MMC_REQ_STARTED,
-	MMC_REQ_BUSY,
-	MMC_REQ_FAILED_TO_START,
-	MMC_REQ_FINISHED,
-};
-
-enum mmc_issue_type {
-	MMC_ISSUE_SYNC,
-	MMC_ISSUE_DCMD,
-	MMC_ISSUE_ASYNC,
-	MMC_ISSUE_MAX,
-};
-
-static inline struct mmc_queue_req *req_to_mmc_queue_req(struct request *rq)
-{
-	return blk_mq_rq_to_pdu(rq);
-}
-
-struct mmc_queue_req;
-
-static inline struct request *mmc_queue_req_to_req(struct mmc_queue_req *mqr)
-{
-	return blk_mq_rq_from_pdu(mqr);
-}
-
-struct mmc_blk_data;
-struct mmc_blk_ioc_data;
-
-struct mmc_blk_request {
-	struct mmc_request	mrq;
-	struct mmc_command	sbc;
-	struct mmc_command	cmd;
-	struct mmc_command	stop;
-	struct mmc_data		data;
-};
-
-/**
- * enum mmc_drv_op - enumerates the operations in the mmc_queue_req
- * @MMC_DRV_OP_IOCTL: ioctl operation
- * @MMC_DRV_OP_IOCTL_RPMB: RPMB-oriented ioctl operation
- * @MMC_DRV_OP_BOOT_WP: write protect boot partitions
- * @MMC_DRV_OP_GET_CARD_STATUS: get card status
- * @MMC_DRV_OP_GET_EXT_CSD: get the EXT CSD from an eMMC card
- */
-enum mmc_drv_op {
-	MMC_DRV_OP_IOCTL,
-	MMC_DRV_OP_IOCTL_RPMB,
-	MMC_DRV_OP_BOOT_WP,
-	MMC_DRV_OP_GET_CARD_STATUS,
-	MMC_DRV_OP_GET_EXT_CSD,
-};
-
-struct mmc_queue_req {
-	struct mmc_blk_request	brq;
-	struct scatterlist	*sg;
-	enum mmc_drv_op		drv_op;
-	int			drv_op_result;
-	void			*drv_op_data;
-	unsigned int		ioc_count;
-	int			retries;
-};
-
-struct mmc_queue {
-	struct mmc_card		*card;
-	struct mmc_ctx		ctx;
-	struct blk_mq_tag_set	tag_set;
-	struct mmc_blk_data	*blkdata;
-	struct request_queue	*queue;
-	spinlock_t		lock;
-	int			in_flight[MMC_ISSUE_MAX];
-	unsigned int		cqe_busy;
-#define MMC_CQE_DCMD_BUSY	BIT(0)
-#define MMC_CQE_QUEUE_FULL	BIT(1)
-	bool			busy;
-	bool			use_cqe;
-	bool			recovery_needed;
-	bool			in_recovery;
-	bool			rw_wait;
-	bool			waiting;
-	struct work_struct	recovery_work;
-	wait_queue_head_t	wait;
-	struct request		*recovery_req;
-	struct request		*complete_req;
-	struct mutex		complete_lock;
-	struct work_struct	complete_work;
-};
-
-extern int mmc_init_queue(struct mmc_queue *, struct mmc_card *);
-extern void mmc_cleanup_queue(struct mmc_queue *);
-extern void mmc_queue_suspend(struct mmc_queue *);
-extern void mmc_queue_resume(struct mmc_queue *);
-extern unsigned int mmc_queue_map_sg(struct mmc_queue *,
-				     struct mmc_queue_req *);
+int mmc_init_queue(struct mmc_queue *, struct mmc_card *card);
+void mmc_cleanup_queue(struct mmc_queue *mq);
+void mmc_queue_suspend(struct mmc_queue *mq);
+void mmc_queue_resume(struct mmc_queue *mq);
+unsigned int mmc_queue_map_sg(struct mmc_queue *mq,
+				     struct mmc_queue_req *mqrq);
 
 void mmc_cqe_check_busy(struct mmc_queue *mq);
 void mmc_cqe_recovery_notifier(struct mmc_request *mrq);
 
 enum mmc_issue_type mmc_issue_type(struct mmc_queue *mq, struct request *req);
 
-static inline int mmc_tot_in_flight(struct mmc_queue *mq)
-{
-	return mq->in_flight[MMC_ISSUE_SYNC] +
-	       mq->in_flight[MMC_ISSUE_DCMD] +
-	       mq->in_flight[MMC_ISSUE_ASYNC];
-}
-
-static inline int mmc_cqe_qcnt(struct mmc_queue *mq)
-{
-	return mq->in_flight[MMC_ISSUE_DCMD] +
-	       mq->in_flight[MMC_ISSUE_ASYNC];
-}
 
 #endif
diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
index 9c89a5b780e8..e0f59d675cf1 100644
--- a/drivers/mmc/host/Kconfig
+++ b/drivers/mmc/host/Kconfig
@@ -977,6 +977,17 @@ config MMC_CQHCI
 
 	  If unsure, say N.
 
+config MMC_SW_CQHCI
+	tristate "Sofeware Command Queue Host Controller Interface support"
+	help
+	  Some mmc host maybe not have CQHCI hardware.
+	  This selects the Softeware Command Queue Host Controller Interface
+	  , which will get better performance but will consume more CPU time.
+
+	  If you want, say Y or M here.
+
+	  If unsure, say N.
+
 config MMC_HSQ
 	tristate "MMC Host Software Queue support"
 	help
diff --git a/drivers/mmc/host/Makefile b/drivers/mmc/host/Makefile
index 4d5bcb0144a0..98e39853056b 100644
--- a/drivers/mmc/host/Makefile
+++ b/drivers/mmc/host/Makefile
@@ -103,6 +103,7 @@ obj-$(CONFIG_MMC_SDHCI_BRCMSTB)		+= sdhci-brcmstb.o
 obj-$(CONFIG_MMC_SDHCI_OMAP)		+= sdhci-omap.o
 obj-$(CONFIG_MMC_SDHCI_SPRD)		+= sdhci-sprd.o
 obj-$(CONFIG_MMC_CQHCI)			+= cqhci.o
+obj-$(CONFIG_MMC_SW_CQHCI)		+= sw-cqhci.o
 obj-$(CONFIG_MMC_HSQ)			+= mmc_hsq.o
 
 ifeq ($(CONFIG_CB710_DEBUG),y)
diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index 4e2583f69a63..f572f714014d 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -19,6 +19,7 @@
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
+#include <linux/sched/clock.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/interrupt.h>
@@ -33,6 +34,9 @@
 
 #include "cqhci.h"
 
+#ifdef CONFIG_MMC_SW_CQHCI
+#include "sw-cqhci.h"
+#endif
 #define MAX_BD_NUM          1024
 
 /*--------------------------------------------------------------------------*/
@@ -76,6 +80,7 @@
 #define MSDC_PAD_TUNE0   0xf0
 #define PAD_DS_TUNE      0x188
 #define PAD_CMD_TUNE     0x18c
+#define EMMC51_CFG0      0x204
 #define EMMC50_CFG0      0x208
 #define EMMC50_CFG3      0x220
 #define SDC_FIFO_CFG     0x228
@@ -268,6 +273,14 @@
 #define SDC_FIFO_CFG_WRVALIDSEL   (0x1 << 24)  /* RW */
 #define SDC_FIFO_CFG_RDVALIDSEL   (0x1 << 25)  /* RW */
 
+/* EMMC51_CFG0 mask, host use these registers bits
+ * to send class11(CMDQ) cmds during data transmission.
+ */
+#define EMMC51_CFG_CMDQEN          (0x1    <<  0)
+#define EMMC51_CFG_NUM             (0x3F   <<  1)
+#define EMMC51_CFG_RSPTYPE         (0x7    <<  7)
+#define EMMC51_CFG_DTYPE           (0x3    << 10)
+#define EMMC51_CMDQ_MASK           (0xFFF)
 /* EMMC_TOP_CONTROL mask */
 #define PAD_RXDLY_SEL           (0x1 << 0)      /* RW */
 #define DELAY_EN                (0x1 << 1)      /* RW */
@@ -441,6 +454,7 @@ struct msdc_host {
 	struct msdc_tune_para def_tune_para; /* default tune setting */
 	struct msdc_tune_para saved_tune_para; /* tune result of CMD21/CMD19 */
 	struct cqhci_host *cq_host;
+	struct swcq_host *swcq_host;
 };
 
 static const struct mtk_mmc_compatible mt8135_compat = {
@@ -557,6 +571,18 @@ static const struct mtk_mmc_compatible mt6779_compat = {
 	.support_64g = true,
 };
 
+static const struct mtk_mmc_compatible mt6761_compat = {
+	.clk_div_bits = 12,
+	.hs400_tune = true,
+	.pad_tune_reg = MSDC_PAD_TUNE0,
+	.async_fifo = true,
+	.data_tune = true,
+	.busy_check = true,
+	.stop_clk_fix = true,
+	.enhance_rx = true,
+	.support_64g = true,
+};
+
 static const struct of_device_id msdc_of_ids[] = {
 	{ .compatible = "mediatek,mt8135-mmc", .data = &mt8135_compat},
 	{ .compatible = "mediatek,mt8173-mmc", .data = &mt8173_compat},
@@ -567,6 +593,7 @@ static const struct of_device_id msdc_of_ids[] = {
 	{ .compatible = "mediatek,mt8516-mmc", .data = &mt8516_compat},
 	{ .compatible = "mediatek,mt7620-mmc", .data = &mt7620_compat},
 	{ .compatible = "mediatek,mt6779-mmc", .data = &mt6779_compat},
+	{ .compatible = "mediatek,mt6761-mmc", .data = &mt6761_compat},
 	{}
 };
 MODULE_DEVICE_TABLE(of, msdc_of_ids);
@@ -1016,24 +1043,6 @@ static inline u32 msdc_cmd_prepare_raw_cmd(struct msdc_host *host,
 	return rawcmd;
 }
 
-static void msdc_start_data(struct msdc_host *host, struct mmc_request *mrq,
-			    struct mmc_command *cmd, struct mmc_data *data)
-{
-	bool read;
-
-	WARN_ON(host->data);
-	host->data = data;
-	read = data->flags & MMC_DATA_READ;
-
-	mod_delayed_work(system_wq, &host->req_timeout, DAT_TIMEOUT);
-	msdc_dma_setup(host, &host->dma, data);
-	sdr_set_bits(host->base + MSDC_INTEN, data_ints_mask);
-	sdr_set_field(host->base + MSDC_DMA_CTRL, MSDC_DMA_CTRL_START, 1);
-	dev_dbg(host->dev, "DMA start\n");
-	dev_dbg(host->dev, "%s: cmd=%d DMA data: %d blocks; read=%d\n",
-			__func__, cmd->opcode, data->blocks, read);
-}
-
 static int msdc_auto_cmd_done(struct msdc_host *host, int events,
 		struct mmc_command *cmd)
 {
@@ -1222,6 +1231,30 @@ static inline bool msdc_cmd_is_ready(struct msdc_host *host,
 	return true;
 }
 
+static void msdc_start_data(struct msdc_host *host, struct mmc_request *mrq,
+			    struct mmc_command *cmd, struct mmc_data *data)
+{
+	bool read;
+
+	WARN_ON(host->data);
+	host->data = data;
+	read = data->flags & MMC_DATA_READ;
+
+	mod_delayed_work(system_wq, &host->req_timeout, DAT_TIMEOUT);
+	msdc_dma_setup(host, &host->dma, data);
+	sdr_set_bits(host->base + MSDC_INTEN, data_ints_mask);
+	sdr_set_field(host->base + MSDC_DMA_CTRL, MSDC_DMA_CTRL_START, 1);
+	dev_dbg(host->dev, "DMA start\n");
+	dev_dbg(host->dev, "%s: cmd=%d DMA data: %d blocks; read=%d\n",
+			__func__, cmd->opcode, data->blocks, read);
+
+#ifdef CONFIG_MMC_SW_CQHCI
+	if (cmd->opcode == MMC_EXECUTE_READ_TASK
+		|| cmd->opcode == MMC_EXECUTE_WRITE_TASK)
+		msdc_request_done(host, mrq);
+#endif
+}
+
 static void msdc_start_command(struct msdc_host *host,
 		struct mmc_request *mrq, struct mmc_command *cmd)
 {
@@ -1269,17 +1302,122 @@ static void msdc_cmd_next(struct msdc_host *host,
 		msdc_start_data(host, mrq, cmd, cmd->data);
 }
 
-static void msdc_ops_request(struct mmc_host *mmc, struct mmc_request *mrq)
+
+#ifdef CONFIG_MMC_SW_CQHCI
+static inline bool msdc_op_cmdq_on_tran(struct mmc_command *cmd)
+{
+	return cmd->opcode == MMC_QUE_TASK_PARAMS ||
+	       cmd->opcode == MMC_QUE_TASK_ADDR ||
+		   (cmd->opcode == MMC_SEND_STATUS &&
+				cmd->arg & (1 << 15));
+}
+
+static unsigned int msdc_cmdq_command_start(struct msdc_host *host,
+	struct mmc_command *cmd, unsigned long timeout)
+{
+	unsigned long tmo;
+
+	cmd->error = 0;
+	tmo = jiffies + timeout;
+
+	while (!msdc_cmd_is_ready(host, host->mrq, cmd)) {
+		if (time_after(jiffies, tmo) &&
+			!msdc_cmd_is_ready(host, host->mrq, cmd)) {
+			dev_err(host->dev, "cmd_busy timeout: before CMD<%d>",
+				 cmd->opcode);
+			cmd->error = (unsigned int)-ETIMEDOUT;
+			return cmd->error;
+		}
+	}
+
+	sdr_set_field(host->base + EMMC51_CFG0, EMMC51_CMDQ_MASK,
+			(0x81) | (cmd->opcode << 1));
+	writel(cmd->arg, host->base + SDC_ARG);
+	writel(0, host->base + SDC_CMD);
+
+	return 0;
+}
+
+static unsigned int msdc_cmdq_command_resp_polling(struct msdc_host *host,
+	struct mmc_command *cmd,
+	unsigned long timeout)
+{
+	unsigned long flags;
+	u32 events;
+	unsigned long tmo;
+	u32 event_mask = MSDC_INT_CMDRDY | MSDC_INT_RSPCRCERR | MSDC_INT_CMDTMO;
+	u64 rsp_time;
+
+	/* polling */
+	tmo = jiffies + timeout;
+	rsp_time = sched_clock();
+	while (1) {
+		spin_lock_irqsave(&host->lock, flags);
+		events = readl(host->base + MSDC_INT);
+		if (events & event_mask) {
+			/* clear all int flag */
+			events &= event_mask;
+			writel(events, host->base + MSDC_INT);
+			spin_unlock_irqrestore(&host->lock, flags);
+			break;
+		}
+		spin_unlock_irqrestore(&host->lock, flags);
+
+		if (time_after(jiffies, tmo)) {
+			spin_lock_irqsave(&host->lock, flags);
+			events = readl(host->base + MSDC_INT);
+			spin_unlock_irqrestore(&host->lock, flags);
+			if (!(events & event_mask)) {
+				dev_err(host->dev,
+					"[%s]: CMD<%d> polling_for_completion timeout ARG<0x%.8x>",
+					__func__, cmd->opcode, cmd->arg);
+				cmd->error = (unsigned int)-ETIMEDOUT;
+			}
+			goto out;
+		}
+	}
+
+	/* command interrupts */
+	if (events & event_mask) {
+		if (events & MSDC_INT_CMDRDY) {
+			cmd->resp[0] = readl(host->base + SDC_RESP0);
+		} else if (events & MSDC_INT_RSPCRCERR) {
+			cmd->error = (unsigned int)-EILSEQ;
+			dev_err(host->dev,
+				"[%s]: XXX CMD<%d> MSDC_INT_RSPCRCERR Arg<0x%.8x>",
+				__func__, cmd->opcode, cmd->arg);
+		} else if (events & MSDC_INT_CMDTMO) {
+			cmd->error = (unsigned int)-ETIMEDOUT;
+			dev_err(host->dev, "[%s]: XXX CMD<%d> MSDC_INT_CMDTMO Arg<0x%.8x>",
+				__func__, cmd->opcode, cmd->arg);
+		}
+	}
+out:
+	sdr_clr_bits(host->base + EMMC51_CFG0, EMMC51_CFG_CMDQEN);
+	return cmd->error;
+}
+
+#define CMD_CQ_TIMEOUT (HZ * 3)
+static void msdc_start_request_cmdq(struct mmc_host *mmc,
+	struct mmc_request *mrq)
 {
 	struct msdc_host *host = mmc_priv(mmc);
+	if (msdc_cmdq_command_start(host, mrq->cmd, CMD_CQ_TIMEOUT))
+		goto end;
 
-	host->error = 0;
-	WARN_ON(host->mrq);
-	host->mrq = mrq;
+	if (msdc_cmdq_command_resp_polling(host, mrq->cmd, CMD_CQ_TIMEOUT))
+		goto end;
+end:
+	host->mrq = NULL;
+	return;
 
-	if (mrq->data)
-		msdc_prepare_data(host, mrq);
+}
+#endif
 
+static void msdc_start_request_legacy(struct mmc_host *mmc,
+	struct mmc_request *mrq)
+{
+	struct msdc_host *host = mmc_priv(mmc);
 	/* if SBC is required, we have HW option and SW option.
 	 * if HW option is enabled, and SBC does not have "special" flags,
 	 * use HW option,  otherwise use SW option
@@ -1289,8 +1427,28 @@ static void msdc_ops_request(struct mmc_host *mmc, struct mmc_request *mrq)
 		msdc_start_command(host, mrq, mrq->sbc);
 	else
 		msdc_start_command(host, mrq, mrq->cmd);
+
 }
 
+static void msdc_ops_request(struct mmc_host *mmc, struct mmc_request *mrq)
+{
+	struct msdc_host *host = mmc_priv(mmc);
+
+	host->error = 0;
+	WARN_ON(host->mrq);
+	host->mrq = mrq;
+
+	if (mrq->data)
+		msdc_prepare_data(host, mrq);
+
+#ifdef CONFIG_MMC_SW_CQHCI
+	if (msdc_op_cmdq_on_tran(mrq->cmd)) {
+		msdc_start_request_cmdq(mmc, mrq);
+	} else
+#endif
+		msdc_start_request_legacy(mmc, mrq);
+
+}
 static void msdc_pre_req(struct mmc_host *mmc, struct mmc_request *mrq)
 {
 	struct msdc_host *host = mmc_priv(mmc);
@@ -1321,6 +1479,17 @@ static void msdc_post_req(struct mmc_host *mmc, struct mmc_request *mrq,
 static void msdc_data_xfer_next(struct msdc_host *host,
 				struct mmc_request *mrq, struct mmc_data *data)
 {
+#ifdef CONFIG_MMC_SW_CQHCI
+	struct swcq_host *swcq_host = host->swcq_host;
+
+	if (host->cqhci) {
+		if (atomic_read(&swcq_host->ongoing_task.id)
+			!= MMC_SWCQ_TASK_IDLE) {
+			atomic_set(&swcq_host->ongoing_task.done, 1);
+			return;
+		}
+	}
+#endif
 	if (mmc_op_multi(mrq->cmd->opcode) && mrq->stop && !mrq->stop->error &&
 	    !mrq->sbc)
 		msdc_start_command(host, mrq, mrq->stop);
@@ -1355,7 +1524,9 @@ static bool msdc_data_xfer_done(struct msdc_host *host, u32 events,
 				1);
 		while (readl(host->base + MSDC_DMA_CFG) & MSDC_DMA_CFG_STS)
 			cpu_relax();
+		spin_lock_irqsave(&host->lock, flags);
 		sdr_clr_bits(host->base + MSDC_INTEN, data_ints_mask);
+		spin_unlock_irqrestore(&host->lock, flags);
 		dev_dbg(host->dev, "DMA stop\n");
 
 		if ((events & MSDC_INT_XFER_COMPL) && (!stop || !stop->error)) {
@@ -1568,6 +1739,7 @@ static irqreturn_t msdc_irq(int irq, void *dev_id)
 			return IRQ_HANDLED;
 		}
 
+#ifndef CONFIG_MMC_SW_CQHCI
 		if (!mrq) {
 			dev_err(host->dev,
 				"%s: MRQ=NULL; events=%08X; event_mask=%08X\n",
@@ -1575,7 +1747,7 @@ static irqreturn_t msdc_irq(int irq, void *dev_id)
 			WARN_ON(1);
 			break;
 		}
-
+#endif
 		dev_dbg(host->dev, "%s: events=%08X\n", __func__, events);
 
 		if (cmd)
@@ -2021,7 +2193,10 @@ static int hs400_tune_response(struct mmc_host *mmc, u32 opcode)
 		 * more stable, we test each set of parameters 3 times.
 		 */
 		for (j = 0; j < 3; j++) {
-			mmc_send_tuning(mmc, opcode, &cmd_err);
+			if (opcode != MMC_SEND_STATUS)
+				mmc_send_tuning(mmc, opcode, &cmd_err);
+			else
+				cmd_err = mmc_send_status(mmc->card, NULL);
 			if (!cmd_err) {
 				cmd_delay |= (1 << i);
 			} else {
@@ -2104,7 +2279,6 @@ static int msdc_tune_together(struct mmc_host *mmc, u32 opcode)
 
 	sdr_set_field(host->base + MSDC_PATCH_BIT, MSDC_INT_DAT_LATCH_CK_SEL,
 		      host->latch_ck);
-
 	sdr_clr_bits(host->base + MSDC_IOCON, MSDC_IOCON_RSPL);
 	sdr_clr_bits(host->base + MSDC_IOCON,
 		     MSDC_IOCON_DSPL | MSDC_IOCON_W_DSPL);
@@ -2160,7 +2334,9 @@ static int msdc_execute_tuning(struct mmc_host *mmc, u32 opcode)
 	int ret;
 	u32 tune_reg = host->dev_comp->pad_tune_reg;
 
-	if (host->dev_comp->data_tune && host->dev_comp->async_fifo) {
+
+	if (host->dev_comp->data_tune && host->dev_comp->async_fifo
+			&& opcode != MMC_SEND_STATUS) {
 		ret = msdc_tune_together(mmc, opcode);
 		if (host->hs400_mode) {
 			sdr_clr_bits(host->base + MSDC_IOCON,
@@ -2194,6 +2370,7 @@ static int msdc_execute_tuning(struct mmc_host *mmc, u32 opcode)
 		host->saved_tune_para.emmc_top_cmd = readl(host->top_base +
 				EMMC_TOP_CMD);
 	}
+
 	return ret;
 }
 
@@ -2331,6 +2508,21 @@ static void msdc_of_property_parse(struct platform_device *pdev,
 		host->cqhci = false;
 }
 
+#ifdef CONFIG_MMC_SW_CQHCI
+void msdc_swcq_dump(struct mmc_host *host)
+{
+
+}
+void  msdc_swcq_err_handle(struct mmc_host *host)
+{
+
+}
+static const struct swcq_host_ops msdc_swcq_ops = {
+	.dump_info = msdc_swcq_dump,
+	.err_handle = msdc_swcq_err_handle,
+};
+#endif
+
 static int msdc_drv_probe(struct platform_device *pdev)
 {
 	struct mmc_host *mmc;
@@ -2444,8 +2636,6 @@ static int msdc_drv_probe(struct platform_device *pdev)
 		mmc->caps2 |= MMC_CAP2_SDIO_IRQ_NOTHREAD;
 
 	mmc->caps |= MMC_CAP_CMD23;
-	if (host->cqhci)
-		mmc->caps2 |= MMC_CAP2_CQE | MMC_CAP2_CQE_DCMD;
 	/* MMC core transfer sizes tunable parameters */
 	mmc->max_segs = MAX_BD_NUM;
 	if (host->dev_comp->support_64g)
@@ -2461,26 +2651,6 @@ static int msdc_drv_probe(struct platform_device *pdev)
 		host->dma_mask = DMA_BIT_MASK(32);
 	mmc_dev(mmc)->dma_mask = &host->dma_mask;
 
-	if (mmc->caps2 & MMC_CAP2_CQE) {
-		host->cq_host = devm_kzalloc(host->mmc->parent,
-					     sizeof(*host->cq_host),
-					     GFP_KERNEL);
-		if (!host->cq_host) {
-			ret = -ENOMEM;
-			goto host_free;
-		}
-		host->cq_host->caps |= CQHCI_TASK_DESC_SZ_128;
-		host->cq_host->mmio = host->base + 0x800;
-		host->cq_host->ops = &msdc_cmdq_ops;
-		ret = cqhci_init(host->cq_host, mmc, true);
-		if (ret)
-			goto host_free;
-		mmc->max_segs = 128;
-		/* cqhci 16bit length */
-		/* 0 size, means 65536 so we don't have to -1 here */
-		mmc->max_seg_size = 64 * 1024;
-	}
-
 	host->timeout_clks = 3 * 1048576;
 	host->dma.gpd = dma_alloc_coherent(&pdev->dev,
 				2 * sizeof(struct mt_gpdma_desc),
@@ -2492,10 +2662,10 @@ static int msdc_drv_probe(struct platform_device *pdev)
 		ret = -ENOMEM;
 		goto release_mem;
 	}
+
 	msdc_init_gpd_bd(host, &host->dma);
 	INIT_DELAYED_WORK(&host->req_timeout, msdc_request_timeout);
 	spin_lock_init(&host->lock);
-
 	platform_set_drvdata(pdev, mmc);
 	msdc_ungate_clock(host);
 	msdc_init_hw(host);
@@ -2505,6 +2675,41 @@ static int msdc_drv_probe(struct platform_device *pdev)
 	if (ret)
 		goto release;
 
+	if (host->cqhci) {
+#ifdef CONFIG_MMC_CQHCI
+		mmc->caps2 |= MMC_CAP2_CQE | MMC_CAP2_CQE_DCMD;
+		host->cq_host = devm_kzalloc(host->mmc->parent,
+					     sizeof(*host->cq_host),
+					     GFP_KERNEL);
+		if (!host->cq_host) {
+			ret = -ENOMEM;
+			goto host_free;
+		}
+		host->cq_host->caps |= CQHCI_TASK_DESC_SZ_128;
+		host->cq_host->mmio = host->base + 0x800;
+		host->cq_host->ops = &msdc_cmdq_ops;
+		ret = cqhci_init(host->cq_host, mmc, true);
+		if (ret)
+			goto host_free;
+		mmc->max_segs = 128;
+		/* cqhci 16bit length */
+		/* 0 size, means 65536 so we don't have to -1 here */
+		mmc->max_seg_size = 64 * 1024;
+#elif defined(CONFIG_MMC_SW_CQHCI)
+		mmc->caps2 |= MMC_CAP2_CQE;
+		host->swcq_host = devm_kzalloc(host->mmc->parent,
+				sizeof(*host->swcq_host), GFP_KERNEL);
+		if (!host->swcq_host) {
+			ret = -ENOMEM;
+			goto host_free;
+		}
+		host->swcq_host->ops = &msdc_swcq_ops;
+		ret = swcq_init(host->swcq_host, mmc);
+		if (ret)
+			goto host_free;
+#endif
+	}
+
 	pm_runtime_set_active(host->dev);
 	pm_runtime_set_autosuspend_delay(host->dev, MTK_MMC_AUTOSUSPEND_DELAY);
 	pm_runtime_use_autosuspend(host->dev);
diff --git a/drivers/mmc/host/sw-cqhci.c b/drivers/mmc/host/sw-cqhci.c
new file mode 100644
index 000000000000..3d6c7d908ecf
--- /dev/null
+++ b/drivers/mmc/host/sw-cqhci.c
@@ -0,0 +1,450 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * sw-cqhci.c
+ *
+ * eMMC softeware cmdq interface for non-cqhi host.
+ *
+ * Copyright (c) 2019-2020 MediaTek Inc.
+ * Author: Gray.Jia
+ */
+#include <linux/delay.h>
+#include <linux/module.h>
+#include <linux/kthread.h>
+#include <linux/blk-mq.h>
+#include <uapi/linux/sched/types.h>
+#include "sw-cqhci.h"
+
+static int swcq_enable(struct mmc_host *mmc, struct mmc_card *card)
+{
+	//pr_info("%s",__func__);
+	return 0;
+
+}
+
+static void swcq_off(struct mmc_host *mmc)
+{
+	//pr_info("%s",__func__);
+}
+
+static void swcq_disable(struct mmc_host *mmc)
+{
+	//pr_info("%s",__func__);
+}
+
+static void swcq_post_req(struct mmc_host *mmc, struct mmc_request *mrq)
+{
+	if (mmc->ops->post_req)
+		mmc->ops->post_req(mmc, mrq, 0);
+}
+
+int swcq_done_task(struct mmc_host *mmc, int task_id)
+{
+	struct swcq_host *swcq_host = mmc->cqe_private;
+	struct mmc_request *mrq = swcq_host->mrq[task_id];
+
+	if (mrq->data->error) {
+		pr_err("%s: task%d  data error %d\n",
+			__func__, task_id, mrq->data->error);
+		return mrq->data->error;
+	}
+
+	return 0;
+}
+
+int swcq_run_task(struct mmc_host *mmc, int task_id)
+{
+	struct mmc_command cmd = {};
+	struct mmc_request data_mrq = {};
+	struct swcq_host *swcq_host = mmc->cqe_private;
+	int flags = swcq_host->mrq[task_id]->data->flags
+					& MMC_DATA_READ ? 1 : 0;
+
+	cmd.flags = MMC_RSP_R1 | MMC_CMD_AC;
+	cmd.opcode = flags ? MMC_EXECUTE_READ_TASK : MMC_EXECUTE_WRITE_TASK;
+	cmd.arg =  task_id << 16;
+
+	data_mrq.cmd = &cmd;
+	data_mrq.data = swcq_host->mrq[task_id]->data;
+
+	mmc_wait_for_req(mmc, &data_mrq);
+	if (cmd.error) {
+		pr_err("%s: cmd%d error %d\n",
+			__func__, cmd.opcode, cmd.error);
+		return cmd.error;
+	}
+
+	return 0;
+}
+
+int swcq_set_task(struct mmc_host *mmc, int task_id)
+{
+	struct mmc_command cmd = {};
+	struct mmc_request pre_mrq = {};
+	struct swcq_host *swcq_host = mmc->cqe_private;
+	struct mmc_request *mrq = swcq_host->mrq[task_id];
+	int flags;
+	int retry = 5;
+
+	WARN_ON(!mrq);
+	WARN_ON(!mrq->data);
+	flags = mrq->data->flags & MMC_DATA_READ ? 1 : 0;
+#if MMC_SWCQ_DEBUG
+	pr_info("%s task_mrq[%d]=%08x, %s", __func__, task_id,
+		swcq_host->mrq[task_id], flags ? "read" : "write");
+#endif
+
+	while (retry--) {
+		cmd.flags = MMC_RSP_R1 | MMC_CMD_AC;
+		cmd.opcode = MMC_QUE_TASK_PARAMS;
+		cmd.arg =  flags << 30 | task_id << 16 | mrq->data->blocks;
+		pre_mrq.cmd = &cmd;
+
+		mmc->ops->request(mmc, &pre_mrq);
+		if (cmd.error) {
+			pr_info("%s: cmd%d err =%d",
+				__func__, cmd.opcode, cmd.error);
+			continue;
+		}
+
+		memset(&cmd, 0, sizeof(cmd));
+		cmd.flags = MMC_RSP_R1 | MMC_CMD_AC;
+		cmd.opcode = MMC_QUE_TASK_ADDR;
+		cmd.arg = mrq->data->blk_addr;
+		pre_mrq.cmd = &cmd;
+
+		mmc->ops->request(mmc, &pre_mrq);
+		if (cmd.error) {
+			pr_info("%s: cmd%d err =%d",
+				__func__, cmd.opcode, cmd.error);
+			continue;
+		}
+
+		break;
+	}
+
+	if (cmd.error)
+		return cmd.error;
+
+	return 0;
+}
+
+int swcq_poll_task(struct mmc_host *mmc, u32 *status)
+{
+	struct mmc_command cmd = {};
+	struct mmc_request chk_mrq = {};
+
+	cmd.flags = MMC_RSP_R1 | MMC_CMD_AC;
+	cmd.opcode = MMC_SEND_STATUS;
+	cmd.arg = mmc->card->rca << 16 | 1 << 15;
+	chk_mrq.cmd = &cmd;
+
+	mmc->ops->request(mmc, &chk_mrq);
+	if (cmd.error) {
+		pr_info("%s: cmd%d err =%d",
+			__func__, cmd.opcode, cmd.error);
+		return cmd.error;
+	}
+
+	*status = cmd.resp[0];
+
+	return 0;
+}
+
+void swcq_err_handle(struct mmc_host *mmc, int task_id, int step, int err_type)
+{
+	struct swcq_host *swcq_host = mmc->cqe_private;
+	struct mmc_request *mrq = swcq_host->mrq[task_id];
+	struct mmc_queue_req *mqrq = container_of(mrq, struct mmc_queue_req,
+						  brq.mrq);
+	struct request *req = mmc_queue_req_to_req(mqrq);
+	struct request_queue *q = req->q;
+	struct mmc_queue *mq = q->queuedata;
+	unsigned long flags;
+	// 1 means start recovery,  2 means recovery done
+	int recovery_step = 0;
+	bool in_recovery = false;
+
+	WARN_ON(!mrq);
+	swcq_host->ops->dump_info(mmc);
+
+	while (1) {
+		spin_lock_irqsave(&q->queue_lock, flags);
+		in_recovery = mq->recovery_needed;
+		spin_unlock_irqrestore(&q->queue_lock, flags);
+
+		if (!in_recovery && mrq->recovery_notifier) {
+			if (++recovery_step == 2)
+				break;
+			mrq->recovery_notifier(mrq);
+		}
+
+		msleep(20);
+	}
+}
+
+#define	MMC_SWCQ_NONE       (0<<1)
+#define	MMC_SWCQ_DONE       (1<<1)
+#define MMC_SWCQ_RUN        (1<<2)
+#define MMC_SWCQ_SET        (1<<3)
+#define MMC_SWCQ_POLL       (1<<4)
+
+static inline int get_step_of_swcq_host(struct swcq_host *swcq_host)
+{
+	int seq = MMC_SWCQ_NONE;
+
+	if (atomic_read(&swcq_host->ongoing_task.done))
+		seq = MMC_SWCQ_DONE;
+	else if (atomic_read(&swcq_host->ongoing_task.id) == MMC_SWCQ_TASK_IDLE
+			&& swcq_host->rdy_tsks)
+		seq = MMC_SWCQ_RUN;
+	else if (swcq_host->pre_tsks)
+		seq = MMC_SWCQ_SET;
+	else if (swcq_host->qnd_tsks != swcq_host->rdy_tsks
+				&& atomic_read(&swcq_host->ongoing_task.id)
+				== MMC_SWCQ_TASK_IDLE)
+		seq = MMC_SWCQ_POLL;
+
+	return seq;
+}
+
+int mmc_run_queue_thread(void *data)
+{
+	struct mmc_host *mmc = data;
+	struct swcq_host *swcq_host = mmc->cqe_private;
+	int err;
+	int step = -1;
+	int task_id = -1;
+	struct mmc_request *done_mrq;
+	struct sched_param param = { .sched_priority = 1 };
+
+	sched_setscheduler(current, SCHED_FIFO, &param);
+
+	while (1) {
+		step = get_step_of_swcq_host(swcq_host);
+#if MMC_SWCQ_DEBUG
+		if (step)
+			pr_info("%s: S%d C%d P%08x Q%08x R%08x T%d,D%d",
+				__func__,
+				step,
+				atomic_read(&swcq_host->q_cnt),
+				swcq_host->pre_tsks,
+				swcq_host->qnd_tsks,
+				swcq_host->rdy_tsks,
+				atomic_read(&swcq_host->ongoing_task.id),
+				atomic_read(&swcq_host->ongoing_task.done));
+#endif
+		switch (step) {
+		case MMC_SWCQ_DONE:
+			task_id = atomic_read(&swcq_host->ongoing_task.id);
+			err = swcq_done_task(mmc, task_id);
+			if (!err) {
+				done_mrq = swcq_host->mrq[task_id];
+				atomic_set(&swcq_host->ongoing_task.done, 0);
+				atomic_set(&swcq_host->ongoing_task.id, MMC_SWCQ_TASK_IDLE);
+				swcq_host->mrq[task_id] = NULL;
+				atomic_dec(&swcq_host->q_cnt);
+				if (!atomic_read(&swcq_host->q_cnt))
+					wake_up_interruptible(&swcq_host->wait_cmdq_empty);
+				mmc_cqe_request_done(mmc, done_mrq);
+			} else {
+				spin_lock(&swcq_host->lock);
+				swcq_host->pre_tsks |= (1 << task_id);
+				spin_unlock(&swcq_host->lock);
+				goto SWCQ_ERR_HANDLE;
+			}
+			break;
+		case MMC_SWCQ_RUN:
+			task_id = ffs(swcq_host->rdy_tsks) - 1;
+			atomic_set(&swcq_host->ongoing_task.id, task_id);
+			err = swcq_run_task(mmc, task_id);
+			if (!err) {
+				swcq_host->rdy_tsks &= ~(1<<task_id);
+				swcq_host->qnd_tsks &= ~(1<<task_id);
+			} else
+				goto SWCQ_ERR_HANDLE;
+			break;
+		case MMC_SWCQ_SET:
+			spin_lock(&swcq_host->lock);
+			task_id = ffs(swcq_host->pre_tsks) - 1;
+			spin_unlock(&swcq_host->lock);
+			err = swcq_set_task(mmc, task_id);
+			if (!err) {
+				spin_lock(&swcq_host->lock);
+				swcq_host->pre_tsks &= ~(1<<task_id);
+				spin_unlock(&swcq_host->lock);
+				swcq_host->qnd_tsks |= (1<<task_id);
+			} else
+				goto SWCQ_ERR_HANDLE;
+			break;
+		case MMC_SWCQ_POLL:
+			err = swcq_poll_task(mmc, &swcq_host->rdy_tsks);
+			if (err) {
+				task_id = ffs(swcq_host->qnd_tsks) - 1;
+				goto SWCQ_ERR_HANDLE;
+			}
+			break;
+		}
+
+		set_current_state(TASK_INTERRUPTIBLE);
+		if (atomic_read(&swcq_host->q_cnt) == 0)
+			schedule();
+
+		set_current_state(TASK_RUNNING);
+		if (kthread_should_stop())
+			break;
+
+		continue;
+SWCQ_ERR_HANDLE:
+		if (err)
+			swcq_err_handle(mmc, task_id, step, err);
+	}
+
+	return 0;
+}
+
+static int swcq_request(struct mmc_host *mmc, struct mmc_request *mrq)
+{
+	struct swcq_host *swcq_host = mmc->cqe_private;
+
+	if (mrq->data) {
+		if (mrq->tag > 31) {
+			pr_info("%s should not issue tag>31 req.", __func__);
+			WARN_ON(1);
+		}
+		spin_lock(&swcq_host->lock);
+		swcq_host->pre_tsks |= (1 << mrq->tag);
+		swcq_host->mrq[mrq->tag] = mrq;
+		spin_unlock(&swcq_host->lock);
+	} else {
+		pr_info("%s should not issue non-data req.", __func__);
+		WARN_ON(1);
+		return -1;
+	}
+
+	atomic_inc(&swcq_host->q_cnt);
+	wake_up_process(swcq_host->cmdq_thread);
+
+	return 0;
+}
+
+static int swcq_wait_for_idle(struct mmc_host *mmc)
+{
+	struct swcq_host *swcq_host = mmc->cqe_private;
+
+	while (atomic_read(&swcq_host->q_cnt)) {
+		wait_event_interruptible(swcq_host->wait_cmdq_empty,
+			atomic_read(&swcq_host->q_cnt) == 0);
+	}
+
+	return 0;
+}
+
+static bool swcq_timeout(struct mmc_host *mmc, struct mmc_request *mrq,
+			  bool *recovery_needed)
+{
+	struct swcq_host *swcq_host = mmc->cqe_private;
+
+	pr_info("%s: C%d P%08x Q%08x R%08x T%d,D%d",
+		__func__,
+		atomic_read(&swcq_host->q_cnt),
+		swcq_host->pre_tsks,
+		swcq_host->qnd_tsks,
+		swcq_host->rdy_tsks,
+		atomic_read(&swcq_host->ongoing_task.id),
+		atomic_read(&swcq_host->ongoing_task.done));
+
+	swcq_host->ops->dump_info(mmc);
+	*recovery_needed = true;
+	return true;
+
+}
+
+static void swcq_reset(struct swcq_host *swcq_host)
+{
+	int id = atomic_read(&swcq_host->ongoing_task.id);
+
+	spin_lock(&swcq_host->lock);
+	swcq_host->pre_tsks |= swcq_host->qnd_tsks | swcq_host->rdy_tsks;
+	if (id != MMC_SWCQ_TASK_IDLE)
+		swcq_host->pre_tsks |= (1<<id);
+	swcq_host->qnd_tsks = 0;
+	swcq_host->rdy_tsks = 0;
+	spin_unlock(&swcq_host->lock);
+	atomic_set(&swcq_host->ongoing_task.done, 0);
+	atomic_set(&swcq_host->ongoing_task.id, MMC_SWCQ_TASK_IDLE);
+}
+
+static void swcq_recovery_start(struct mmc_host *mmc)
+{
+	struct swcq_host *swcq_host = mmc->cqe_private;
+
+	pr_debug("%s: SWCQ recovery start", mmc_hostname(mmc));
+	if (swcq_host->ops->err_handle)
+		swcq_host->ops->err_handle(mmc);
+#if SWCQ_TUNING_CMD
+	/* Maybe it's cmd crc error at this time and cmdq not empty,
+	 * only cmd13 can be used for tuning.
+	 */
+	if (mmc->ops->execute_tuning)
+		mmc->ops->execute_tuning(mmc, MMC_SEND_STATUS);
+#endif
+
+}
+
+static void swcq_recovery_finish(struct mmc_host *mmc)
+{
+	struct swcq_host *swcq_host = mmc->cqe_private;
+
+	swcq_reset(swcq_host);
+	if (mmc->ops->execute_tuning)
+		mmc->ops->execute_tuning(mmc, MMC_SEND_TUNING_BLOCK_HS200);
+
+	pr_debug("%s: SWCQ recovery done", mmc_hostname(mmc));
+}
+
+static const struct mmc_cqe_ops swcq_ops = {
+	.cqe_enable = swcq_enable,
+	.cqe_disable = swcq_disable,
+	.cqe_request = swcq_request,
+	.cqe_post_req = swcq_post_req,
+	.cqe_off = swcq_off,
+	.cqe_wait_for_idle = swcq_wait_for_idle,
+	.cqe_timeout = swcq_timeout,
+	.cqe_recovery_start = swcq_recovery_start,
+	.cqe_recovery_finish = swcq_recovery_finish,
+};
+
+int swcq_init(struct swcq_host *swcq_host, struct mmc_host *mmc)
+{
+	int err;
+
+	swcq_host->mmc = mmc;
+	mmc->cqe_private = swcq_host;
+	mmc->cqe_ops = &swcq_ops;
+	/*swcmdq not have DCMD*/
+	mmc->cqe_qdepth = NUM_SLOTS;
+	atomic_set(&swcq_host->ongoing_task.id, MMC_SWCQ_TASK_IDLE);
+	swcq_host->cmdq_thread = kthread_create(mmc_run_queue_thread, mmc,
+				"mmc-swcq%d", mmc->index);
+
+	if (IS_ERR(swcq_host->cmdq_thread)) {
+		err = PTR_ERR(swcq_host->cmdq_thread);
+		goto out_err;
+	}
+
+	spin_lock_init(&swcq_host->lock);
+	init_waitqueue_head(&swcq_host->wait_cmdq_empty);
+	pr_info("%s: swcq init done", mmc_hostname(mmc));
+
+	return 0;
+
+out_err:
+	pr_err("%s: swcq failed to initialize, error %d\n",
+	       mmc_hostname(mmc), err);
+	return err;
+}
+EXPORT_SYMBOL(swcq_init);
+
+MODULE_AUTHOR("Gray Jia <Gray.Jia@mediatek.com>");
+MODULE_DESCRIPTION("Software Command Queue Host Controller Interface driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/mmc/host/sw-cqhci.h b/drivers/mmc/host/sw-cqhci.h
new file mode 100644
index 000000000000..be00b6ea36e9
--- /dev/null
+++ b/drivers/mmc/host/sw-cqhci.h
@@ -0,0 +1,69 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/******************************************************************************
+ * sw-cqhci.h
+ *
+ * eMMC softeware cmdq interface for non-cqhi host.
+ *
+ * Copyright (c) 2019-2020 MediaTek Inc.
+ * Author: Gray.Jia <gray.jia.@mediatek.com>
+ */
+#ifndef LINUX_MMC_SW_CQHCI_H
+#define LINUX_MMC_SW_CQHCI_H
+
+#include <linux/bitops.h>
+#include <linux/spinlock_types.h>
+#include <linux/completion.h>
+#include <linux/wait.h>
+#include <linux/mmc/mmc.h>
+#include <linux/mmc/host.h>
+#include <linux/mmc/card.h>
+#include <linux/mmc/queue.h>
+
+#define MMC_SWCQ_DEBUG  0
+#define SWCQ_TUNING_CMD 1
+#define NUM_SLOTS 32
+
+struct swcq_ongoing_task {
+/* If a task is running ,id from 0 ->31. And 99 means host
+ * is idle and can perform IO operations.
+ */
+#define MMC_SWCQ_TASK_IDLE  99
+	atomic_t  id;
+	atomic_t done;
+};
+
+
+struct swcq_host_ops {
+	/* Add some ops
+	 * maybe need use in future
+	 */
+	void  (*dump_info)(struct mmc_host *host);
+	void  (*err_handle)(struct mmc_host *host);
+
+};
+
+
+struct swcq_host {
+	struct mmc_host *mmc;
+	spinlock_t lock;
+	/*
+	 *  q_cnt is reqs total cnt
+	 *  pre_tsks is the bit map of tasks need to queue in device
+	 *  qnd_tsks is the bit map of queued tasks in device
+	 *  rdy_tsks is the bit map of ready tasks in device
+	 */
+	atomic_t q_cnt;
+	unsigned int pre_tsks;
+	unsigned int qnd_tsks;
+	unsigned int rdy_tsks;
+	struct swcq_ongoing_task ongoing_task;
+	struct task_struct	*cmdq_thread;
+	wait_queue_head_t wait_cmdq_empty;
+	struct mmc_request *mrq[NUM_SLOTS];
+	const struct swcq_host_ops *ops;
+};
+
+int swcq_init(struct swcq_host *swcq_host, struct mmc_host *mmc);
+
+
+#endif
diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
index c5b6e97cb21a..aa02bd4ca4ee 100644
--- a/include/linux/mmc/host.h
+++ b/include/linux/mmc/host.h
@@ -601,5 +601,6 @@ static inline enum dma_data_direction mmc_get_dma_dir(struct mmc_data *data)
 
 int mmc_send_tuning(struct mmc_host *host, u32 opcode, int *cmd_error);
 int mmc_abort_tuning(struct mmc_host *host, u32 opcode);
+int mmc_send_status(struct mmc_card *card, u32 *status);
 
 #endif /* LINUX_MMC_HOST_H */
diff --git a/include/linux/mmc/queue.h b/include/linux/mmc/queue.h
new file mode 100644
index 000000000000..db9b80629868
--- /dev/null
+++ b/include/linux/mmc/queue.h
@@ -0,0 +1,115 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ *  include/linux/mmc/queue.h
+ *  mmc queue specific definitions.
+ */
+
+#ifndef LINUX_MMC_QUEUE_H
+#define LINUX_MMC_QUEUE_H
+
+#include <linux/types.h>
+#include <linux/blkdev.h>
+#include <linux/blk-mq.h>
+#include <linux/mmc/core.h>
+#include <linux/mmc/host.h>
+
+enum mmc_issued {
+	MMC_REQ_STARTED,
+	MMC_REQ_BUSY,
+	MMC_REQ_FAILED_TO_START,
+	MMC_REQ_FINISHED,
+};
+
+enum mmc_issue_type {
+	MMC_ISSUE_SYNC,
+	MMC_ISSUE_DCMD,
+	MMC_ISSUE_ASYNC,
+	MMC_ISSUE_MAX,
+};
+
+struct mmc_blk_data;
+struct mmc_blk_ioc_data;
+
+struct mmc_blk_request {
+	struct mmc_request	mrq;
+	struct mmc_command	sbc;
+	struct mmc_command	cmd;
+	struct mmc_command	stop;
+	struct mmc_data		data;
+};
+
+/**
+ * enum mmc_drv_op - enumerates the operations in the mmc_queue_req
+ * @MMC_DRV_OP_IOCTL: ioctl operation
+ * @MMC_DRV_OP_IOCTL_RPMB: RPMB-oriented ioctl operation
+ * @MMC_DRV_OP_BOOT_WP: write protect boot partitions
+ * @MMC_DRV_OP_GET_CARD_STATUS: get card status
+ * @MMC_DRV_OP_GET_EXT_CSD: get the EXT CSD from an eMMC card
+ */
+enum mmc_drv_op {
+	MMC_DRV_OP_IOCTL,
+	MMC_DRV_OP_IOCTL_RPMB,
+	MMC_DRV_OP_BOOT_WP,
+	MMC_DRV_OP_GET_CARD_STATUS,
+	MMC_DRV_OP_GET_EXT_CSD,
+};
+
+struct mmc_queue_req {
+	struct mmc_blk_request	brq;
+	struct scatterlist	*sg;
+	enum mmc_drv_op		drv_op;
+	int			drv_op_result;
+	void			*drv_op_data;
+	unsigned int		ioc_count;
+	int			retries;
+};
+
+struct mmc_queue {
+	struct mmc_card		*card;
+	struct mmc_ctx		ctx;
+	struct blk_mq_tag_set	tag_set;
+	struct mmc_blk_data	*blkdata;
+	struct request_queue	*queue;
+	spinlock_t		lock;
+	int			in_flight[MMC_ISSUE_MAX];
+	unsigned int		cqe_busy;
+#define MMC_CQE_DCMD_BUSY	BIT(0)
+#define MMC_CQE_QUEUE_FULL	BIT(1)
+	bool			busy;
+	bool			use_cqe;
+	bool			recovery_needed;
+	bool			in_recovery;
+	bool			rw_wait;
+	bool			waiting;
+	struct work_struct	recovery_work;
+	wait_queue_head_t	wait;
+	struct request		*recovery_req;
+	struct request		*complete_req;
+	struct mutex		complete_lock;
+	struct work_struct	complete_work;
+};
+
+static inline struct mmc_queue_req *req_to_mmc_queue_req(struct request *rq)
+{
+	return blk_mq_rq_to_pdu(rq);
+}
+
+static inline struct request *mmc_queue_req_to_req(struct mmc_queue_req *mqr)
+{
+	return blk_mq_rq_from_pdu(mqr);
+}
+
+static inline int mmc_tot_in_flight(struct mmc_queue *mq)
+{
+	return mq->in_flight[MMC_ISSUE_SYNC] +
+	       mq->in_flight[MMC_ISSUE_DCMD] +
+	       mq->in_flight[MMC_ISSUE_ASYNC];
+}
+
+static inline int mmc_cqe_qcnt(struct mmc_queue *mq)
+{
+	return mq->in_flight[MMC_ISSUE_DCMD] +
+	       mq->in_flight[MMC_ISSUE_ASYNC];
+}
+
+#endif
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
