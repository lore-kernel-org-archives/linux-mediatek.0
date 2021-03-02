Return-Path: <SRS0=dK9R=IB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B8A0C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Mar 2021 18:19:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C363864EF3
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Mar 2021 18:19:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C363864EF3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=A87ZoerXMESLvpwhBSUg5XCKyU2w1xEemHacF1kXE1s=; b=R6/OFz1IH7Lza+ZemSj2T+BvE
	zWOJU9aBvZUB/Fp1c4fzNPLNxVdiBeKGzetPhEF6cu442tuXj3eFkixK1ko8do7dzC8Erlv8nt9eA
	65t0Xc4enAUCwXq9RBNgVgoFH0NLiyMM1KMxIWmkEMSpVDZ1KDA1pK5kZhsQwe2If4TE4IMipgYF7
	4f4GXDOjsoX5qyp9wNF47x8yFqBoctOmWxzXe1Vikh+kalinFCjNT+AZnq4IKPAdSjQqSiOCeSPaf
	UPllPchQjasIAsJIC8liBW+q8a2J9YHuPnSvqpiKZR+k5x3K+h8AZgO49E6K0C6+GIQold++06sYB
	lYwobsXvQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHW5s-005zOv-Sm; Wed, 03 Mar 2021 18:19:33 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHSzs-005Gpl-BR; Wed, 03 Mar 2021 15:01:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=XezwQx2F/92HywSiX1349dDZgvNEBRZ9H/v1e8WhbU0=; b=YkUlpZI/yWkkqz26Tu0HN7rhB+
 aQv+aiuZfNglcyixThmad7dB6tJGOoCTrIrLLIz5YvYBDhpp1KP7gcM1jFAWdFN36BocZUSZFL1VA
 yFYWymOLMuECAX7WJMKyBkrU+gPXYmn+eHyUmqNywA3xISFDk6QrONBmRpeAyxwXEGWv4GsMOJe2s
 vDLjPrkee7XuDn06bzWMFKCMq1FxsfTgynk18qrSBCddymCEx1Cqi0NLtXLyKxQChKRFWjM3Lf4Sm
 LhyxdYlOn57N6xkYvlzTNEPRpqg4nckDdtkfazNYQ6hAd+uPpriiX1ziSdxWZg4ODHh654h7z2mN4
 dmPxL+xg==;
Received: from mail.kernel.org ([198.145.29.99])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lH3gG-00H3Su-KD; Tue, 02 Mar 2021 11:59:16 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7317E64FB9;
 Tue,  2 Mar 2021 11:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614686348;
 bh=vplPV7EZZYdJ86Fwz8KtVDuVluunvX1Tp2mxcsWRerk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=F3wCFPuyNXMDLSVs15nmFkOrmT2bsUhRCD6MjAj/aLcivj3JeYA1cu7IMtBZog0V3
 WS4fLm+62a0dbShwwpHXZYp5DFzbI5EuXJBSlZUUguk5kP3zCoPKJnaLduRZWoK0Kf
 /aiMDNHhshYC+ItgZsJVdyxTD+6UEJQdHIj2B6W+yX+h9YvNK6I4rOPRxAImVofpO2
 9Qgzzr4b0hJOBntgEDVALfbNNvwpeJko2XTWd+4xu6a4T/t6geWPKqJ1JhasPL5Wcz
 F5XDXkfVD2sSqmpQsmxwXe8yqYwXtmb0hNCinstDKkg+XSozX8nZRHuOUlNkPxHaUY
 +GLj3V0YMV0TQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Chaotian Jing <chaotian.jing@mediatek.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Sasha Levin <sashal@kernel.org>,
 linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 4.14 03/13] mmc: mediatek: fix race condition between
 msdc_request_timeout and irq
Date: Tue,  2 Mar 2021 06:58:53 -0500
Message-Id: <20210302115903.63458-3-sashal@kernel.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210302115903.63458-1-sashal@kernel.org>
References: <20210302115903.63458-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_115916_220131_F5FBC836 
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
index 1a5d5c40324b..e51a62cff5ec 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -758,13 +758,13 @@ static void msdc_track_cmd_data(struct msdc_host *host,
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
@@ -782,7 +782,7 @@ static bool msdc_cmd_done(struct msdc_host *host, int events,
 	bool done = false;
 	bool sbc_error;
 	unsigned long flags;
-	u32 *rsp = cmd->resp;
+	u32 *rsp;
 
 	if (mrq->sbc && cmd == mrq->cmd &&
 	    (events & (MSDC_INT_ACMDRDY | MSDC_INT_ACMDCRCERR
@@ -803,6 +803,7 @@ static bool msdc_cmd_done(struct msdc_host *host, int events,
 
 	if (done)
 		return true;
+	rsp = cmd->resp;
 
 	sdr_clr_bits(host->base + MSDC_INTEN, cmd_ints_mask);
 
@@ -984,7 +985,7 @@ static void msdc_data_xfer_next(struct msdc_host *host,
 static bool msdc_data_xfer_done(struct msdc_host *host, u32 events,
 				struct mmc_request *mrq, struct mmc_data *data)
 {
-	struct mmc_command *stop = data->stop;
+	struct mmc_command *stop;
 	unsigned long flags;
 	bool done;
 	unsigned int check_data = events &
@@ -1000,6 +1001,7 @@ static bool msdc_data_xfer_done(struct msdc_host *host, u32 events,
 
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
