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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FC48C433E1
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 08:34:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E4BC2072D
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 08:34:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bkBJgxKy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DhBo3QVZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E4BC2072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2l/dfY6CTiNry2p70fw2aq5bqC6Rb5GXEn2wnDvlihY=; b=bkBJgxKyzmJPpRgGFuHrd9fmJO
	VpDi27QoqE90XWlIATx9qk/xatYu7cNLMS7JV163/S0X8MUbAnwLYzJY5qHM6nBp+9xw3slvgUEaN
	MYB6jLG8TGOgbv3b2Kes2CuzCjolkjKgSnkT0N+Mw+HFeJDewvX1gaT8l5ADTiOSRuuvuFTSFjbGV
	2hFCfhGOgWJC3bHTI7dXQ097fU59QlXELAT9qS0nKNDxh51glnKY0SU2ogeMnGYjw8w5dXOe3zrc6
	JpR7St5y/wiI+PSxZL7T7M4b8WCxSCbBfZWQric2zbgC4djIn8pKGKBT2EDamk3xUmNhYZLhWPIe6
	5DHf7wcw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7aap-0006xh-33; Mon, 17 Aug 2020 08:34:11 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7aO3-0008Tx-GR; Mon, 17 Aug 2020 08:21:01 +0000
Received: by mail-pf1-x442.google.com with SMTP id m8so7874229pfh.3;
 Mon, 17 Aug 2020 01:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=dBdUK8kTW7LlD2iWbT6JIJ3+2TeLAftGafICpZAEwWI=;
 b=DhBo3QVZ7RG3vmgoNkItvwt1S5mOvic4xOre9KplQouw/zjrMkde3nmUrVsRNShSgQ
 tPrNCl473k5OZbUWRxdiDJpQXpEIYG14b+73qK8djI5DITUJ6lihsmtYD7kPn1KlDVX2
 ZtX0p/IGpjDOl4xzqiKlPdZfFh+q96wAvw/z5dqY/kpvVYALHYAYtGZzvFEd4k1jYUTa
 QYPpbUn5w1xwiPMA3ppiW0gqQX1HFzJUDf85kqm+UcfpWqbypl3AQdwR1TfnHTaB0lvq
 bYrknS9FRIOZUI/R2DT1dEU2sI7BXsnpQLIayv3U4tE70PZpg0yne09vnOwYATGXrAWi
 AeEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=dBdUK8kTW7LlD2iWbT6JIJ3+2TeLAftGafICpZAEwWI=;
 b=B8Qq8JcnDkPbSNMfGKlbJ8JRlycqwaVEk/XbSuQvOAbb8OEufr654JRH4BHjGK4/zh
 04F5zXUO4RkD/EzNKjeNq7swQYHmwdAnBPxh2C7Q3sUGVqixG7KzVZ5H20FvQ/ZCOXUd
 gGMemqlYhngwIhjSuJEtks+VgBjQX44R0D2rtl7dFpm3SQyMZay0cnUA1sEooozn979d
 9rb7R01y4y2/7eLyf7fNDbofcdrK87r2KFUkt8fV/oo3NGoDmpLjFynthQoHh7AyFWE8
 1zaM9a1EpvzXgVUVygKNjNf/qT2F0YX7MHbfXMvyj46Do4L/+DylYy3PE9+p06eEYa78
 Ejcg==
X-Gm-Message-State: AOAM531rlpzyOZjEQbudPz5Sq73dNbixSSmi+KzuPMO/ahNSxWfN0xtk
 NF7OAv0DwOnjRksoprn0ev+qsTd/hpiiEQ==
X-Google-Smtp-Source: ABdhPJxV6aGgsyONYJ85KZCc26Mwj2MNfgxuNI7M/Y4k7HNeoWAcKtP56vFtLZwXEmS9pw15U3I4EQ==
X-Received: by 2002:a63:d40d:: with SMTP id a13mr385021pgh.232.1597652457198; 
 Mon, 17 Aug 2020 01:20:57 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id d93sm16735334pjk.44.2020.08.17.01.20.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:20:56 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, ast@kernel.org,
 daniel@iogearbox.net, kafai@fb.com, songliubraving@fb.com, yhs@fb.com,
 andriin@fb.com, john.fastabend@gmail.com, kpsingh@chromium.org,
 baohua@kernel.org, mripard@kernel.org, wens@csie.org,
 thierry.reding@gmail.com, jonathanh@nvidia.com, michal.simek@xilinx.com,
 matthias.bgg@gmail.com
Subject: [PATCH 19/35] dma: pch_dma: convert tasklets to use new
 tasklet_setup() API
Date: Mon, 17 Aug 2020 13:47:10 +0530
Message-Id: <20200817081726.20213-20-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817081726.20213-1-allen.lkml@gmail.com>
References: <20200817081726.20213-1-allen.lkml@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_042059_700597_42A50F83 
X-CRM114-Status: GOOD (  12.72  )
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
 Romain Perier <romain.perier@gmail.com>, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In preparation for unconditionally passing the
struct tasklet_struct pointer to all tasklet
callbacks, switch to using the new tasklet_setup()
and from_tasklet() to pass the tasklet pointer explicitly.

Signed-off-by: Romain Perier <romain.perier@gmail.com>
Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/pch_dma.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/pch_dma.c b/drivers/dma/pch_dma.c
index a3b0b4c56a19..0cd0311e6e87 100644
--- a/drivers/dma/pch_dma.c
+++ b/drivers/dma/pch_dma.c
@@ -670,9 +670,9 @@ static int pd_device_terminate_all(struct dma_chan *chan)
 	return 0;
 }
 
-static void pdc_tasklet(unsigned long data)
+static void pdc_tasklet(struct tasklet_struct *t)
 {
-	struct pch_dma_chan *pd_chan = (struct pch_dma_chan *)data;
+	struct pch_dma_chan *pd_chan = from_tasklet(pd_chan, t, tasklet);
 	unsigned long flags;
 
 	if (!pdc_is_idle(pd_chan)) {
@@ -898,8 +898,7 @@ static int pch_dma_probe(struct pci_dev *pdev,
 		INIT_LIST_HEAD(&pd_chan->queue);
 		INIT_LIST_HEAD(&pd_chan->free_list);
 
-		tasklet_init(&pd_chan->tasklet, pdc_tasklet,
-			     (unsigned long)pd_chan);
+		tasklet_setup(&pd_chan->tasklet, pdc_tasklet);
 		list_add_tail(&pd_chan->chan.device_node, &pd->dma.channels);
 	}
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
