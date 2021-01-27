Return-Path: <SRS0=2T+p=G6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23C18C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jan 2021 08:21:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9A582074F
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jan 2021 08:21:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9A582074F
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:Mime-Version:Message-Id:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7N0dvS7kzehlbyvokAQ7JgXAkTSswqhG1jzLtCes5L4=; b=O7GRq0F9KCYmu/1kJLAKHLUBOh
	4rnO+iquBva9yaEs423qwEY0b0hlWhRfyy+z7hnH0VO6A5fK50ZZp2ZdV1JU4bELPWR+wQlocPWCQ
	gUOBw0PUsv9J+0BBTFh2fovlyfURwgkSrmC1OQ+D4yQMptVxG1BVNwc3ZlOG5cXaovnFtOXaLvpYc
	zW8yIACTuoYDN2EHpnUGcH675cHVjd3TeKyXrd+UdM2sHEDlbCCV4c2xVlNpeYEdGY6ip56mj1AiQ
	vSOCEff3SsNrPk3gIYzSf5tRjyn/DlJ6sa980s+vQ1FelRygaP0bQa8hbwL0TQSbmm6QGvUm7eYTU
	Vvw1YWsQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4g4Q-00049d-Rv; Wed, 27 Jan 2021 08:20:58 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4g4P-00047p-47
 for linux-mediatek@lists.infradead.org; Wed, 27 Jan 2021 08:20:57 +0000
Received: by mail-yb1-xb49.google.com with SMTP id s64so1586347yba.20
 for <linux-mediatek@lists.infradead.org>; Wed, 27 Jan 2021 00:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=m63EAmeXqIPZihoN5M7lU0BGu+fGoCuFKs5wvqm9uCA=;
 b=A38tSlugr9efDA+LeHkBD/HUda1hBTlNbl7J32yuQz1GqzRWG8F58h/i1UGyDUEepF
 +ClPSZhqCa0Mu2UWQl4mFrhisFN2pM+cto10cgBLwrZFkG4+dlu97XDYTRGx7Dj48N1n
 fWYGVmUrPGwPkqomLxlUN+TGFAYnmZSnNgQbtOky9TVF7dxVAtR8hY0NDmcdcB1dZoMA
 O7u4Ii3AYfhqAG6E2MozUXAIBh4+/23JhFRQiij3ZgSq9OyCSSTBASlk1NbRN7lc635s
 x9xjeZWshFWULgKzpV56PWfVpX3Xgnn/y940vBQ8Ygb+wUuxwo6VyYEERswUpILwKICU
 fBNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=m63EAmeXqIPZihoN5M7lU0BGu+fGoCuFKs5wvqm9uCA=;
 b=PNsM+4VYph4teBOt4PhleWG8L3ANRimLwhJ4RbF2ih8skoXf47ly1H+oC56LwJQnmZ
 DH3XzaY0SGlsYYm/8xBStxD0lCW20YN81bVdu4PcHGiW3cTwLus5XOj/LYkMOIfNsW/2
 IBGxQ8MQD/u6z3xLTMpqBYql01iDJlpC7qivIwXYd7v8lLAmH3DA0p0T/asS7mdIxOKy
 6KNPVijkPEJ4hPSlVp48kOEZlVgBCVGyK5VDMOx/2S7D2VxTiM7iG0cXVEZcXlJXtQsT
 Q7Vm7WscxpcZEqEN7E9joSBDUgzp5zO5CRAiNufGPjkpd05FLthO/ftzrTEsUqSQnflS
 laag==
X-Gm-Message-State: AOAM530AsrSS8ElwuRZljWJq6I+lq8D95co/uCLd74PhdF6vefaQ82uZ
 FelAnJ/19xRTKCLJA29l4Moy8ggfPbd/
X-Google-Smtp-Source: ABdhPJynQgwplEBxjt9UAAah6WMRYX2BQntT4VDdhIhRFxcAABTS8xP8M0U6ru671sdENwBgDKegwjsfmrsK
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:d17d:c7bb:69a2:7e2f])
 (user=tzungbi job=sendgmr) by 2002:a25:b8ca:: with SMTP id
 g10mr13488161ybm.517.1611735651150; Wed, 27 Jan 2021 00:20:51 -0800 (PST)
Date: Wed, 27 Jan 2021 16:20:46 +0800
Message-Id: <20210127082046.3735157-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
Subject: [PATCH] remoteproc/mediatek: acknowledge watchdog IRQ after handled
From: Tzung-Bi Shih <tzungbi@google.com>
To: ohad@wizery.com, bjorn.andersson@linaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210127_032057_227259_193A4868 
X-CRM114-Status: GOOD (  11.05  )
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
Cc: matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
 linux-remoteproc@vger.kernel.org, tzungbi@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Acknowledges watchdog IRQ after handled or kernel keeps receiving the
interrupt.

Fixes: fd0b6c1ff85a ("remoteproc/mediatek: Add support for mt8192 SCP")
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/remoteproc/mtk_common.h |  1 +
 drivers/remoteproc/mtk_scp.c    | 20 +++++++++++---------
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
index 988edb4977c3..bcab38511bf3 100644
--- a/drivers/remoteproc/mtk_common.h
+++ b/drivers/remoteproc/mtk_common.h
@@ -47,6 +47,7 @@
 
 #define MT8192_CORE0_SW_RSTN_CLR	0x10000
 #define MT8192_CORE0_SW_RSTN_SET	0x10004
+#define MT8192_CORE0_WDT_IRQ		0x10030
 #define MT8192_CORE0_WDT_CFG		0x10034
 
 #define SCP_FW_VER_LEN			32
diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index e0c235690361..eba825b46696 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -197,17 +197,19 @@ static void mt8192_scp_irq_handler(struct mtk_scp *scp)
 
 	scp_to_host = readl(scp->reg_base + MT8192_SCP2APMCU_IPC_SET);
 
-	if (scp_to_host & MT8192_SCP_IPC_INT_BIT)
+	if (scp_to_host & MT8192_SCP_IPC_INT_BIT) {
 		scp_ipi_handler(scp);
-	else
-		scp_wdt_handler(scp, scp_to_host);
 
-	/*
-	 * SCP won't send another interrupt until we clear
-	 * MT8192_SCP2APMCU_IPC.
-	 */
-	writel(MT8192_SCP_IPC_INT_BIT,
-	       scp->reg_base + MT8192_SCP2APMCU_IPC_CLR);
+		/*
+		 * SCP won't send another interrupt until we clear
+		 * MT8192_SCP2APMCU_IPC.
+		 */
+		writel(MT8192_SCP_IPC_INT_BIT,
+		       scp->reg_base + MT8192_SCP2APMCU_IPC_CLR);
+	} else {
+		scp_wdt_handler(scp, scp_to_host);
+		writel(1, scp->reg_base + MT8192_CORE0_WDT_IRQ);
+	}
 }
 
 static irqreturn_t scp_irq_handler(int irq, void *priv)
-- 
2.30.0.280.ga3ce27912f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
