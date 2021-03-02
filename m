Return-Path: <SRS0=dK9R=IB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 798D8C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Mar 2021 19:32:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F74364EFD
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Mar 2021 19:32:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F74364EFD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=o5vw8CdWX0u04iJgkNV4ModHIclAYxP8dbu2MFg0ig4=; b=G/tBrPfdy1pojlvNRXAgYBUHl
	2pL6lrJo28vYzMZ7nxDSMBDneiBuigoRhLl1q9vofUcy2kUxH+8EaavJbBXvv2xJqlQikLzY1/hjH
	KA/lA/acQQ8GpbQ+elbT2/kqKfytSteRI2frEU8vD86AHGOSJqWFFv4zTKjJVWsmF4HuMTFuMtv3b
	RauC65IE9/R9x9iLWUheUFPs/WqlIOPYiif9hLurq7FkSmEAyYv1bFFti1alM06XIc1R/Sr3mXkGX
	7rKD6LWeOG8C7zm+Aop9MFyHYczPaVGizcxFxGkT5/QvSQQIrRYR9wbkAcBw9ThaHCX1BjyDTx0Mo
	BHLHhDDLA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHXE7-006EFG-8N; Wed, 03 Mar 2021 19:32:08 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHT3T-005I4A-3T; Wed, 03 Mar 2021 15:04:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=62A+kXpDFzLYUa4JCMj/k/eiUW9rVPcAbt9PBJWFeNY=; b=ueCxHo6vToOBwmI1zNxGjYC4v+
 C+Y1FDVa4Eo8cFuEoRgiPtMMtQovO25aaPdQuqeX0q9qfShmQQv3sffPeAhVBanDVnVkSgCQJOa6n
 iwtbXrECDHIgRl3utEIHkwTpn+V3BxH+NfwnabPDr0/MCxA8mou1hJwPquFy9alYh05evqwHc5LOA
 g3XY8t+/byFbcejvqedGV30ulS4zdxV7mCCwoWSa4kkCIeP5VBSjflRuJsETLisPpv3pCvrvq/wx9
 uIFLWFdKAAG/SjHCoXwh9C09ZRCGyJJEt5gmP8Rn6kvlW7MTOA7oSXBJZYbt8mV5uRwhd9sg9lWFa
 ssQm37ww==;
Received: from mail.kernel.org ([198.145.29.99])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lH3eD-00H3CS-Gy; Tue, 02 Mar 2021 11:57:11 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id F370564F4D;
 Tue,  2 Mar 2021 11:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614686219;
 bh=cIkRF14zPcPSqpWRrh6YRDsCHvdb0fJJdHqgkrmKZvU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vF50CTG2UNOTiCEfRH96BRKfLw+6V5biCJ3LjLGW4YpB535K70+LeYEE8vm3WfJ/f
 0orodGpno6ZeTxeaIjj8AyIedO9PCDidZ/zFwOUp+/0CY75QVRKUEI6EVkmUZB1VW3
 AvdoX6ZvymKj8YOJg2xwUuDtccYfAcgWAhK8rPIb3TlEsFtOwni+ez1LnCYdkql05T
 Lb/Gp/hM1lJ792iyVCZIl/20IAPm2LFpzpe8prg9RZm5dqgmFRmz1uBcuSVoLtyTAm
 HD96ToggmOUYaQOp0lZbzyTkx3LigIhyxhMahp0RjRqqeinZcUSZaTlKFdeTSpf54n
 0SVy1TPZeB3Uw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Chaotian Jing <chaotian.jing@mediatek.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Sasha Levin <sashal@kernel.org>,
 linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.10 10/47] mmc: mediatek: fix race condition between
 msdc_request_timeout and irq
Date: Tue,  2 Mar 2021 06:56:09 -0500
Message-Id: <20210302115646.62291-10-sashal@kernel.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210302115646.62291-1-sashal@kernel.org>
References: <20210302115646.62291-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_115711_592129_E385BFBD 
X-CRM114-Status: GOOD (  11.40  )
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

From: Chaotian Jing <chaotian.jing@mediatek.com>

[ Upstream commit 0354ca6edd464a2cf332f390581977b8699ed081 ]

when get request SW timeout, if CMD/DAT xfer done irq coming right now,
then there is race between the msdc_request_timeout work and irq handler,
and the host->cmd and host->data may set to NULL in irq handler. also,
current flow ensure that only one path can go to msdc_request_done(), so
no need check the return value of cancel_delayed_work().

Signed-off-by: Chaotian Jing <chaotian.jing@mediatek.com>
Link: https://lore.kernel.org/r/20201218071611.12276-1-chaotian.jing@mediatek.com
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/mmc/host/mtk-sd.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index 004fbfc23672..dc84e2dff408 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -1101,13 +1101,13 @@ static void msdc_track_cmd_data(struct msdc_host *host,
 static void msdc_request_done(struct msdc_host *host, struct mmc_request *mrq)
 {
 	unsigned long flags;
-	bool ret;
 
-	ret = cancel_delayed_work(&host->req_timeout);
-	if (!ret) {
-		/* delay work already running */
-		return;
-	}
+	/*
+	 * No need check the return value of cancel_delayed_work, as only ONE
+	 * path will go here!
+	 */
+	cancel_delayed_work(&host->req_timeout);
+
 	spin_lock_irqsave(&host->lock, flags);
 	host->mrq = NULL;
 	spin_unlock_irqrestore(&host->lock, flags);
@@ -1129,7 +1129,7 @@ static bool msdc_cmd_done(struct msdc_host *host, int events,
 	bool done = false;
 	bool sbc_error;
 	unsigned long flags;
-	u32 *rsp = cmd->resp;
+	u32 *rsp;
 
 	if (mrq->sbc && cmd == mrq->cmd &&
 	    (events & (MSDC_INT_ACMDRDY | MSDC_INT_ACMDCRCERR
@@ -1150,6 +1150,7 @@ static bool msdc_cmd_done(struct msdc_host *host, int events,
 
 	if (done)
 		return true;
+	rsp = cmd->resp;
 
 	sdr_clr_bits(host->base + MSDC_INTEN, cmd_ints_mask);
 
@@ -1337,7 +1338,7 @@ static void msdc_data_xfer_next(struct msdc_host *host,
 static bool msdc_data_xfer_done(struct msdc_host *host, u32 events,
 				struct mmc_request *mrq, struct mmc_data *data)
 {
-	struct mmc_command *stop = data->stop;
+	struct mmc_command *stop;
 	unsigned long flags;
 	bool done;
 	unsigned int check_data = events &
@@ -1353,6 +1354,7 @@ static bool msdc_data_xfer_done(struct msdc_host *host, u32 events,
 
 	if (done)
 		return true;
+	stop = data->stop;
 
 	if (check_data || (stop && stop->error)) {
 		dev_dbg(host->dev, "DMA status: 0x%8X\n",
-- 
2.30.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
