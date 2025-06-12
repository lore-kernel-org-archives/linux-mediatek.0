Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3835DC71143
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Jun 2025 13:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lFHYqoHj11Pf7C9Bg1GN9jEeWSJy3J0EFTOrzRw6uz8=; b=TtknB+XiM7DShSSSmnczfYndwB
	/3Sw0mw4YQTktIWaxzhMnXes1B22TAaI9bH4c5gOHYmH+Ldl+gFpr6+iuitZTBLLq4gor9VehBTfI
	C9pDdpyLnvO0nPsiM3VW9HqCtEY9R6oofmciDOluSGfxFpgAcVMHEG6fug9AvDak/OlRxmNO7hFEp
	CicX4hEHUl/nfC1I4nrGu7i38sQh8zkrHRQPWVSE8X0yLRlSnbRlgqcjjEyrWcGexkHgoEb58fmga
	2bxQKYbCI23JX/p4kPr47UzyFDpQUXkyg4gdV8yafbP2yvD0osEKSxhpxHZO3o3LN3HAmJfuOmi7u
	Iw1YfIMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhq4-0000000DNSg-3UTT;
	Thu, 12 Jun 2025 13:19:28 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPg4V-0000000D8ir-3SKc;
	Thu, 12 Jun 2025 11:26:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7F52EA51C07;
	Thu, 12 Jun 2025 11:26:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0BFEC4CEEA;
	Thu, 12 Jun 2025 11:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749727574;
	bh=Wr3zLVYuYfWGn+MSJ4fOyJXUCAJrNU6nB+Tbsj+k/iU=;
	h=From:To:Cc:Subject:Date:From;
	b=suHdLQXP65AqhZVXPaBfZJ5EJOGqG4tRoTejZ33KOs6rNHz/jZQ2DjOB1d4n6k8ac
	 vODQ10GDg36OJ1lTqsWE/Jo+ItxEdyB71INni/2nHKasIoFbNmRUQMM091SoDAZoAl
	 xOSwtsoGcmcB+ng0JK+fJGZCLFU/ixkrZBUds2/vpQs2baRKDAC5FLyqzFKnAhiMAV
	 PrWRNU/1wENhvT4D7bGh93F/oraWclj2JU1tphs0tyWLUcSChs+vmuJkLR50dQ0loA
	 Uoj0aw32ZptKrU4aNlDJNse2llCnkXH7SpvbQoiO6jlgpnAcDS0QtacOnA9DdEe718
	 T8BEvYTjfl+rQ==
From: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
To: Chaotian Jing <chaotian.jing@mediatek.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mhiramat@kernel.org,
	Tomasz Figa <tfiga@chromium.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] mtk-sd: Prevent memory corruption from DMA map failure
Date: Thu, 12 Jun 2025 20:26:10 +0900
Message-ID: <174972756982.3337526.6755001617701603082.stgit@mhiramat.tok.corp.google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_042615_928821_39D26726 
X-CRM114-Status: GOOD (  11.70  )
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

From: Masami Hiramatsu (Google) <mhiramat@kernel.org>

If msdc_prepare_data() fails to map the DMA region, the request is
not prepared for data receiving, but msdc_start_data() proceeds
the DMA with previous setting.
Since this will lead a memory corruption, we have to stop the
request operation soon after the msdc_prepare_data() fails to
prepare it.

Signed-off-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
---
 drivers/mmc/host/mtk-sd.c |   17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index 3594010bc229..56b4999fe58f 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -834,6 +834,11 @@ static void msdc_prepare_data(struct msdc_host *host, struct mmc_data *data)
 	}
 }
 
+static bool msdc_data_prepared(struct mmc_data *data)
+{
+	return data->host_cookie & MSDC_PREPARE_FLAG;
+}
+
 static void msdc_unprepare_data(struct msdc_host *host, struct mmc_data *data)
 {
 	if (data->host_cookie & MSDC_ASYNC_FLAG)
@@ -1466,8 +1471,18 @@ static void msdc_ops_request(struct mmc_host *mmc, struct mmc_request *mrq)
 	WARN_ON(!host->hsq_en && host->mrq);
 	host->mrq = mrq;
 
-	if (mrq->data)
+	if (mrq->data) {
 		msdc_prepare_data(host, mrq->data);
+		if (!msdc_data_prepared(mrq->data)) {
+			/*
+			 * Failed to prepare DMA area, fail fast before
+			 * starting any commands.
+			 */
+			mrq->cmd->error = -ENOSPC;
+			mmc_request_done(mmc_from_priv(host), mrq);
+			return;
+		}
+	}
 
 	/* if SBC is required, we have HW option and SW option.
 	 * if HW option is enabled, and SBC does not have "special" flags,


