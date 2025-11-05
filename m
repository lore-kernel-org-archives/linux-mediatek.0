Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FFAFCCF9F8
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Nov 2025 14:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JIqAEW2A47SwKdIX3rkBdS84blRL0FTS3b9HYaYDUAg=; b=W8XWmoIYBbkgeYmqCfIaCdxuzC
	o1KGoZR7Td/2jg6GCQU4rqkeCdfqrZa9NziRwY3/dsNvVWFoHJFeWT4cGSrYHbh5sP7lZF4cBa89t
	c4w+gomPGS3YQTAzStaCpLmCyw6pwISIAyN5fySvn27/uhiSrdLlw0qxEAiIYy26jhUqOP2dc24g9
	InOtrKehbQwVsooCLo+RiqSd4QP/81xO+zgy3Elu4NsXZkY47WRmoohfjY7Rt2ARD7AzHRA1Z4p8L
	+vdwM5OAcL5mTU8EDPLoH6KHOqiv2kurgi9DUMNvmHceEhy2moCUGKc9p8fHVHJQvT2PSvbzCUBSy
	/lat5DAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGey8-0000000Dsg0-3p5z;
	Wed, 05 Nov 2025 14:58:40 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGey5-0000000Dsee-3F6k
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Nov 2025 14:58:39 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-47114a40161so19502545e9.3
        for <linux-mediatek@lists.infradead.org>; Wed, 05 Nov 2025 06:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762354715; x=1762959515; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JIqAEW2A47SwKdIX3rkBdS84blRL0FTS3b9HYaYDUAg=;
        b=MPxuNDD5t5StdfrlfzavszAd99XmE3qnWlqOcqcvXb7/YprrymuqyelBkPq+o++SFi
         RxdyAJqh96cCUbXPXmoUZCkGraNuGlOyo5XsJKPHf1MQv1KWR5Gly42qLruRRdlOzIYH
         B3ooKcSoM1jVqr7SrmGkVQ0UxF2rnJ9tDrMftmtBOc1dtgOfUUMlX/HtZ8DyAcK9OqfO
         B/m1E9QHuHzhOPkF86SHnyfirI8aykK/zxad70vOlfq05L5jXSy+9kQqhWvxY07/bKJ2
         OJBBxO10gC1lQzBoVBN0kflvMLE/+cCOXQzc23PcawPDi8D2LYFE6MvZXPDDMv8IEynz
         Rf5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762354715; x=1762959515;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JIqAEW2A47SwKdIX3rkBdS84blRL0FTS3b9HYaYDUAg=;
        b=dhZhEAaCntG6KXacx6Wj+VC/rLqPt4m2oAVtQrmADqYuXtEM7vHR+zmH7N1KJOjGof
         KSvu0YwmRI3ZydyMdV298FhtJD0I85blMnntB0kQMWHVQFLLZZNPaE0NoRvf+KRSO9qP
         Rlsb/Bwih9bkuQK5f7VxpDV28z29LVDneqoQuVZfXXMlg2VhuvD4C3sm68gDosjDf1+Z
         LOayxNu7En4/qvdFVRSA6sbWoNDbFodUR+HuYrOF50yKJIPP6V9/a1LHS9XfspKoM8gC
         WfAbYaDV6KgttNlZPchv9wtYJNX9uQ+S24eLURWBmU9qv2ZnIFO96JQbpp8AF9TL3E4O
         K2uQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZX+Mx4WYiuvn34Oc88K+r6XKHOSJLtJWPD1wWBJVnpY5AN3PQbnFo+1npC8ZytkU01B0s6A2CDtHe+uoicQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywf0d4XQuTnL61Fj2+Mu02gQhmM0pQwlvP4chdir0Ne56a3mpQ4
	hTblq5pfd1p4A3R6sc3ghPoTpMdx7/xASI7xCaeSek+24+F+mt9s6tjdCLwxpBVre9uXNjXoZlx
	XwxgT
X-Gm-Gg: ASbGnctUFYA6XjzxYJjBRU9o7ytVqTeaquM1QSkSsuwsMWrpQPzdAbhX5Yx9PgkfLkt
	Xd4yCywe3aWfxUPES/EZCw3L/wPRsbLiHZsH6vJKRt1pwohKgSUbq1qtLko3Oeh2hVOJi4WraoJ
	TME2oG0LDumsM5+/jTa6TfTJE5q+v+90zQOH3vZ6JgLaWuDYdm22lTgpQxpjTKD22cvMBDfAXlf
	cRutKVECyJe0BAhdmytZEHugRtaRXVM66gWWtAb5tvoC2HBAZ5no382TjUwQwU6s/vAbmC4R19z
	y04Wb5VQVecHRXulrhk0cYVqU7hU3gywlRDCL2i7ZZ9bjo/uDmABlA/m3kwwhkMGPfU/WSWcLIU
	vVb0FycOrejgx5S2Kqaf3p0El+xCcfgtNs/SCiMafk8lgvEHHEyvbrAD96fGeofjGgzcmYU2R47
	PyFB2oDO28X+Svo3JMIfeuqqM=
X-Google-Smtp-Source: AGHT+IEBPAS+hCxeJqPMaUujS70zIJqZeU6J82mDcJTJLDzYyDph9uIKgB3uob05iMc3orkpINlzew==
X-Received: by 2002:a05:6000:220d:b0:426:ff2f:9c15 with SMTP id ffacd0b85a97d-429e32c8784mr3606026f8f.5.1762354715311;
        Wed, 05 Nov 2025 06:58:35 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429dc200878sm10921977f8f.45.2025.11.05.06.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 06:58:34 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mmc@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Chaotian Jing <chaotian.jing@mediatek.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] mmc: mtk-sd: replace use of system_wq with system_percpu_wq
Date: Wed,  5 Nov 2025 15:58:24 +0100
Message-ID: <20251105145824.239054-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_065837_833951_90B36E38 
X-CRM114-Status: GOOD (  13.11  )
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

Currently if a user enqueues a work item using schedule_delayed_work() the
used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
schedule_work() that is using system_wq and queue_work(), that makes use
again of WORK_CPU_UNBOUND.

This lack of consistency cannot be addressed without refactoring the API.

This patch continues the effort to refactor worqueue APIs, which has begun
with the change introducing new workqueues and a new alloc_workqueue flag:

commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

Replace system_wq with system_percpu_wq, keeping the same old behavior.
The old wq (system_wq) will be kept for a few release cycles.

Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/mmc/host/mtk-sd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index 79074291e9d2..daed659f63f6 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -1214,7 +1214,7 @@ static void msdc_start_data(struct msdc_host *host, struct mmc_command *cmd,
 	host->data = data;
 	read = data->flags & MMC_DATA_READ;
 
-	mod_delayed_work(system_wq, &host->req_timeout, DAT_TIMEOUT);
+	mod_delayed_work(system_percpu_wq, &host->req_timeout, DAT_TIMEOUT);
 	msdc_dma_setup(host, &host->dma, data);
 	sdr_set_bits(host->base + MSDC_INTEN, data_ints_mask);
 	sdr_set_field(host->base + MSDC_DMA_CTRL, MSDC_DMA_CTRL_START, 1);
@@ -1444,7 +1444,7 @@ static void msdc_start_command(struct msdc_host *host,
 	WARN_ON(host->cmd);
 	host->cmd = cmd;
 
-	mod_delayed_work(system_wq, &host->req_timeout, DAT_TIMEOUT);
+	mod_delayed_work(system_percpu_wq, &host->req_timeout, DAT_TIMEOUT);
 	if (!msdc_cmd_is_ready(host, mrq, cmd))
 		return;
 
-- 
2.51.1


