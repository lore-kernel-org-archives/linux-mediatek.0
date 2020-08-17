Return-Path: <SRS0=yC7h=B3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58911C433E3
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 08:42:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 278AA20758
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 08:42:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s0rt9xzz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N1SK+GNo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 278AA20758
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nWM1s8S+MPyyYw88brA/EJEj5pk9ToTejYQV3bXKOb0=; b=s0rt9xzz6/inbwXFD5RntlvAOU
	O0Txdje+oxs0AUaUiDeDW3yIzcdr1WZFHvP3r0lQqb95G7d0TEjKEQdZnpwfDGPh8pmdEqE1pVp3P
	QZodEBWb0z8AOhp0GXWWN+pqki2h3M98O4VkGyRu2kdmvwp1RS/5vrGHqCuEOCqUz7yUkpe4Oh6UI
	NILLcmZtoNxzCvxKZrI97XxdwlHCO46irUvMq4wz0RB4D6druB5Gp6neQNtr/HwaHyOM0aloAMZFG
	+RoyLQmIkbqdEsjid0RiyHzlr4UNrZmTcFMEaZqz66gfbz1wm6PTQ2AHnKLpTmZDBDeXdW2JjFsxb
	c3pbu6Zg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7aiV-0002XE-Ll; Mon, 17 Aug 2020 08:42:07 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7aQI-00016s-Do; Mon, 17 Aug 2020 08:23:33 +0000
Received: by mail-pf1-x444.google.com with SMTP id u20so7874400pfn.0;
 Mon, 17 Aug 2020 01:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=QgRf+wpU/fZBoNxgl2cgbgUN6DgUelo3akwYgZu93dg=;
 b=N1SK+GNofCoZQb2iwyLwbhqMBZ/02t64tvziIKDhXHB8O6S/04VKL49wPxaWWjVmc7
 YJnUvZkq20M1MiASIlZMT8ycvzh2eVJoOkqxpqoMRA9nCKDlmuIOW9N7eTprWc070gUn
 xG/AL5xiEzkyhp4APJ7Z+nMLLuVMDWY4MRHg3ijzzoMoBp7vOdmYArEnqqYuf5byYeuG
 Oc3VfG+wzLnUTBOlvtVBsuL9MLlsLdlxhNal1vMdAcFzTJEi5Ixa+lEDrYSvrc4cYBOf
 wULLGx26MZBlwDggfkDlK0hqGatM2avggFUDeP4KM0mFq3Nyi8lJXqAtfdPX7ui3aftp
 krvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=QgRf+wpU/fZBoNxgl2cgbgUN6DgUelo3akwYgZu93dg=;
 b=Vfm3b7kJDIuU3S1EInabdo+D6TtBzoQc4AVzPZAgtr48Ift/iWmZyjR0xGJFA/1Uii
 LcmEzPvmLK5zBhjdnPuxyyNc6P8qurlOalhYG1pi+1xgrPlqgx4G2/GuuFF03+G9QJd5
 E9pqDtGVwSZQpDEz5ZkkM/p9tK9o8MhdQ/XRhJJU4E+S1fAc0mXCksZEyIQNCaFryLmp
 HWYO/39o7dA/iG0nt6xgUI86vbO1J2LxjHvO20focmYGnsKsTngPYR1nry2kPksxNkEA
 C2+DLbSvHp0AfSIBkNY6cV8UiXrd0n1f9RV5EBkswOyIWZcms/SBRTkTmQ021BVOS3wP
 mdcw==
X-Gm-Message-State: AOAM530VF+DfmfNcIKKcJjLm4T8BY8lsh2zC9lfouuv2ngtX7iFdpBbr
 rfIF8Ggx+or3ZS6K2GZr+ug=
X-Google-Smtp-Source: ABdhPJy4idYpBjz1K02F706gi2k5e1lttvzSxamHoY9LZcYWsmMUV0jwPTbFNXxXTd25zDO71gDp6g==
X-Received: by 2002:aa7:9f8a:: with SMTP id z10mr10842423pfr.176.1597652594564; 
 Mon, 17 Aug 2020 01:23:14 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id d93sm16735334pjk.44.2020.08.17.01.23.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:23:14 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, ast@kernel.org,
 daniel@iogearbox.net, kafai@fb.com, songliubraving@fb.com, yhs@fb.com,
 andriin@fb.com, john.fastabend@gmail.com, kpsingh@chromium.org,
 baohua@kernel.org, mripard@kernel.org, wens@csie.org,
 thierry.reding@gmail.com, jonathanh@nvidia.com, michal.simek@xilinx.com,
 matthias.bgg@gmail.com
Subject: [PATCH 33/35] dma: plx_dma: convert tasklets to use new
 tasklet_setup() API
Date: Mon, 17 Aug 2020 13:47:24 +0530
Message-Id: <20200817081726.20213-34-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817081726.20213-1-allen.lkml@gmail.com>
References: <20200817081726.20213-1-allen.lkml@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_042318_728228_BC5145BC 
X-CRM114-Status: GOOD (  12.76  )
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
Cc: keescook@chromium.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Allen Pais <allen.lkml@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In preparation for unconditionally passing the
struct tasklet_struct pointer to all tasklet
callbacks, switch to using the new tasklet_setup()
and from_tasklet() to pass the tasklet pointer explicitly.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/plx_dma.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/plx_dma.c b/drivers/dma/plx_dma.c
index db4c5fd453a9..f387c5bbc170 100644
--- a/drivers/dma/plx_dma.c
+++ b/drivers/dma/plx_dma.c
@@ -241,9 +241,9 @@ static void plx_dma_stop(struct plx_dma_dev *plxdev)
 	rcu_read_unlock();
 }
 
-static void plx_dma_desc_task(unsigned long data)
+static void plx_dma_desc_task(struct tasklet_struct *t)
 {
-	struct plx_dma_dev *plxdev = (void *)data;
+	struct plx_dma_dev *plxdev = from_tasklet(plxdev, t, desc_task);
 
 	plx_dma_process_desc(plxdev);
 }
@@ -513,8 +513,7 @@ static int plx_dma_create(struct pci_dev *pdev)
 	}
 
 	spin_lock_init(&plxdev->ring_lock);
-	tasklet_init(&plxdev->desc_task, plx_dma_desc_task,
-		     (unsigned long)plxdev);
+	tasklet_setup(&plxdev->desc_task, plx_dma_desc_task);
 
 	RCU_INIT_POINTER(plxdev->pdev, pdev);
 	plxdev->bar = pcim_iomap_table(pdev)[0];
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
