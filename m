Return-Path: <SRS0=jUzJ=FH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F7F3C4361A
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 15:59:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0945207A5
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 15:59:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0945207A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:Mime-Version:Message-Id:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tc4s3wz6Wch3Jv0Pia9Rhz8/F0m7L27bcUnAtVV+7es=; b=hrUnxnBqJ5nZOAmTNWC8xFjcM0
	z86V/Vn+mg6Fi+hLoqIuaMUXM7fJihz5at6WOyO3HN5VFDfy1xBs1SJ61Zw6Lv9gf35gSFwnh2swG
	/q6Q9LiJ0jOz6tktbb3p5SOEdTxBkFdGoYrpArUq3G1su61t3fB6OqqLO3Za+ZF8iWOC+GU0Dhfnn
	huvyrFkJmdVuGDFTxAFhRimlZ+jjQX1pfLS7MT6+1/1eINGtAy82WRN7gGEumthkUohWw94o5URyy
	u352uzGX7sNDUoPjMCMiJT2sy7GP0W32fTe2F+nc+HW1K551EtFeFeb2ztCUKWe2xUNiEp7ai4LaV
	RI6/a2Fw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkr17-0003LW-8x; Thu, 03 Dec 2020 15:59:37 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkr12-0003K5-S2
 for linux-mediatek@lists.infradead.org; Thu, 03 Dec 2020 15:59:34 +0000
Received: by mail-pf1-x44a.google.com with SMTP id x20so1669307pfm.6
 for <linux-mediatek@lists.infradead.org>; Thu, 03 Dec 2020 07:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=6HgvkaQctZ39JQLge67/z5sx8Qune1Xo2JUMse28/RE=;
 b=Queth6MrO/59wTlsy5aNmyQhZ/H27qYAc0006X179F/ZV0wEn+c6iXSIH9/dMrIdSQ
 9/rM+NV7svjaMTwCmrmxU3vOKzdiddBQHabn+AsIq5IZYyCAErWX7tNqyxzfo5sK97Zd
 W3NxWUSSec8jqEi3yaDuMl6KF2dX7d2EVatshuS72MuEchpOw1shcJ3edIoxN+GmQROg
 XwhOr+C/WvKdrm/B+RdPIpPDrRD2ulG2qMBMuDMnOstZdiN4HGk8lG9i7I89x2AFhzEp
 OhGf/Puz85FPx57sqVH0HxyeR4IOXlzEJDu49OUuZbiaaqpRI5bwTwgzD0jv4uisA8YA
 1M5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=6HgvkaQctZ39JQLge67/z5sx8Qune1Xo2JUMse28/RE=;
 b=GxeUClhlAnd4wmVyqeo00kx79zysJI2D24+8yb9h/rlz9+Y5jULfwh6ctlEBndlWzJ
 WIH00Iu6Qu1T0zyAETqNBNhDqGjlXtAhjC4Y2Bn2aFD/0Kivg/QNwMFKcctW0k6JXqsW
 8Ugo9scL4h0Xs8egnQ38TrLqTaXWvn4Tpq+3xgMmcPBmAlX3QuERjnFpeVsHFnGbgyQb
 QBii+UK3XyFC/03ypLOEPH5o82HPJMvraAHbccjBzAR5ea0cA21NUcDALt6s6kZIGaXK
 r9hKJwL7gzcZruFUqhTja8Z5cgduur79dgex6ZUe+DN0ltPgI59vYYWwqCXd9+sOam8k
 d/mg==
X-Gm-Message-State: AOAM5334ZHC/7reTL3BS+vlorktfnk8KHasYgz69RLjahpA47Tx7LnzP
 gn0afqtVw1ZR7NjOAAePXKt46tGjEZ2O
X-Google-Smtp-Source: ABdhPJz+1XJC9kxgToM5jl+h5Yn+AzhAPNrKOpubWS4WAxsCrAuq2jhUyDztT9ag7Zqi5ju0VUh6IiWiEftc
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a17:90a:17a4:: with SMTP id
 q33mr707022pja.0.1607011168564; Thu, 03 Dec 2020 07:59:28 -0800 (PST)
Date: Thu,  3 Dec 2020 23:59:14 +0800
Message-Id: <20201203155914.3844426-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
Subject: [PATCH v3] remoteproc/mediatek: unprepare clk if scp_before_load fails
From: Tzung-Bi Shih <tzungbi@google.com>
To: ohad@wizery.com, bjorn.andersson@linaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_105933_012509_90707116 
X-CRM114-Status: GOOD (  10.99  )
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
Cc: mathieu.poirier@linaro.org, linux-remoteproc@vger.kernel.org,
 tzungbi@google.com, linux-mediatek@lists.infradead.org, pihsun@chromium.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Fixes the error handling to unprepare clk if scp_before_load fails.

Fixes: fd0b6c1ff85a ("remoteproc/mediatek: Add support for mt8192 SCP")
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
Changes from v2[2]:
- fix the "Fixes" tag format

Changes from v1[1]:
- add "Fixes" tag
- remove an unneeded change

[1]: https://patchwork.kernel.org/project/linux-remoteproc/patch/20201202044537.2500497-1-tzungbi@google.com/
[2]: https://patchwork.kernel.org/project/linux-remoteproc/patch/20201203030436.3583198-1-tzungbi@google.com/

 drivers/remoteproc/mtk_scp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 5f42b9ce7185..5e5705fe35a8 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -350,9 +350,10 @@ static int scp_load(struct rproc *rproc, const struct firmware *fw)
 
 	ret = scp->data->scp_before_load(scp);
 	if (ret < 0)
-		return ret;
+		goto leave;
 
 	ret = scp_elf_load_segments(rproc, fw);
+leave:
 	clk_disable_unprepare(scp->clk);
 
 	return ret;
-- 
2.29.2.454.gaff20da3a2-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
