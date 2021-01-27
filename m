Return-Path: <SRS0=2T+p=G6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A43ABC433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jan 2021 08:57:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10F0A20754
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jan 2021 08:57:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10F0A20754
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TTc2JfR8f0Wd51nXV9aptz/tWe0xgKIY9yMkqR1Nf2w=; b=WjtxALhwWVRpWg5NF3u20rBjD
	Ru97WK//LnK7ZFr4mG1KACt2H6JtV7GiAt1Dnpg1ov85DRGrkMN62sYz3tLQ1qkKM2pmU/CMETk3r
	dvAP/IC501a7mRb+PeqQ+B+KxwLEYkn0CusqO5FcKvsV9Lg4n94/XKovSJl+AkfpdJ8FQfUfGIzyY
	ZnN/XQHF3IvQd3BcYfzdjWH5U1DoVcCFiWVnCIhfyWaXEuTzGnL+Ocf4uPvwXWwxtpHN+uldZ+0FX
	LwXE+mApq8xM/5J3Mpd8oLrpcJShKnA4NVhCiXN0PGcVhLlHrN/eT70fpKmXrzt+OtRDYo1+QCFe5
	1zg/PwbeA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4gFh-0005p4-Vv; Wed, 27 Jan 2021 08:32:38 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4gFg-0005nw-De
 for linux-mediatek@lists.infradead.org; Wed, 27 Jan 2021 08:32:37 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id k7so1638335ybm.13
 for <linux-mediatek@lists.infradead.org>; Wed, 27 Jan 2021 00:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=SmiMh0LR1+qpBQs71pN3MQ5z1dtkmQlW7LOu3fdZxYc=;
 b=rrXwZ9bm2rsHie+KDd9fWKXYVFbzbfhsHlMQSz9gFMUP3reWooj6uuA2HmrOYrLwiq
 kYs86koHVLx0gEw+UWH7PoHcVPLY4AOA0dZnCcgev+X/R/bdnfebMQb7DrovteE/wM1T
 jV98B5EgPoINEulnzdhCIshFSA/EunLfsVSn21Vn6/RACRPvQmFiNU7hJGXsC8BW8/xP
 rwRXE5q7jG1MgI3J21y5/kpGDvzlBGYhNnaTGKDG5mTNlrX2TJFMJaAtv3/Z1mLrWeMO
 6sizgSXNlb/+n/M64KGj3ZPUQ2gJb1DRhbgiYHDPnVciKsjOG3cfs+X2peN5j9PX+X+L
 g9jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=SmiMh0LR1+qpBQs71pN3MQ5z1dtkmQlW7LOu3fdZxYc=;
 b=XXL2wflGCmZUNad/Dl+fSKKK3AJMIWTnqB5gWip7s7nalOo0xbheVwbzA18WwgbXTh
 YWfIzx7pGv1b/3+EROo5tp0qm6RweiERgP7Zof1rJG4hSf2vX2B38lyZ+gEtBWM86tHM
 gmUwK5oniUap1wi+kZ1LjBQUHdnZcTkORnsDo24ulN/lx0ptX5gARaFmDu0QsnVN4nk0
 Z32Gh1lMC8AVGc44z1rICWImsieQPHwDvNacRx1suYVyswFspKm2bDdvqwQhKkoLgb3t
 3Qf6Uii71K3OmaiDj4MkD4OsM3tTAhg18jZRe66FziJDWqBJL5xShss/HYs3UGeZDBwR
 jWqQ==
X-Gm-Message-State: AOAM532Uxf+QYwJKBgJ6BnWDQCShJDwWNxDW4bl66vzWN+I55CXl5W3B
 hGXuJpW3Z9+b1Yi8txM4YQmRQQtHxIou
X-Google-Smtp-Source: ABdhPJyoBFYN8c1zqNrS1+bqbnoMM0Q2Xo7B1whfoExZWSybm5Lh61Rr2MDPRz8tvDy5a2u+4L+Gn8Y+NvHI
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:d17d:c7bb:69a2:7e2f])
 (user=tzungbi job=sendgmr) by 2002:a25:b813:: with SMTP id
 v19mr14700220ybj.178.1611736352922; Wed, 27 Jan 2021 00:32:32 -0800 (PST)
Date: Wed, 27 Jan 2021 16:31:34 +0800
In-Reply-To: <20210127083136.3745652-1-tzungbi@google.com>
Message-Id: <20210127083136.3745652-3-tzungbi@google.com>
Mime-Version: 1.0
References: <20210127083136.3745652-1-tzungbi@google.com>
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
Subject: [PATCH v3 2/4] remoteproc/mediatek: enable MPU for all memory regions
 in MT8192 SCP
From: Tzung-Bi Shih <tzungbi@google.com>
To: ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210127_033236_492947_0FFD3962 
X-CRM114-Status: GOOD (  11.96  )
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
Cc: devicetree@vger.kernel.org, mathieu.poirier@linaro.org,
 linux-remoteproc@vger.kernel.org, tzungbi@google.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The register MT8192_CORE0_MEM_ATT_PREDEF contains attributes for each
memory region.  It defines whether a memory region can be managed by MPU
or not.

In the past, due to the default settings in the register, MT8192 SCP
works luckily.  After enabling L1TCM, SCP starts to access memory region
that is not included in the default settings.  As a result, SCP hangs.

Enables MPU for all memory regions in MT8192 SCP.

Note that the register is read only once when SCP resets.  Thus, it must
be set from kernel side.

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/remoteproc/mtk_common.h | 1 +
 drivers/remoteproc/mtk_scp.c    | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
index bcab38511bf3..204691138677 100644
--- a/drivers/remoteproc/mtk_common.h
+++ b/drivers/remoteproc/mtk_common.h
@@ -47,6 +47,7 @@
 
 #define MT8192_CORE0_SW_RSTN_CLR	0x10000
 #define MT8192_CORE0_SW_RSTN_SET	0x10004
+#define MT8192_CORE0_MEM_ATT_PREDEF	0x10008
 #define MT8192_CORE0_WDT_IRQ		0x10030
 #define MT8192_CORE0_WDT_CFG		0x10034
 
diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index d83e1164f02f..05b157689121 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -371,6 +371,9 @@ static int mt8192_scp_before_load(struct mtk_scp *scp)
 	mt8192_power_on_sram(scp->reg_base + MT8192_L1TCM_SRAM_PDN);
 	mt8192_power_on_sram(scp->reg_base + MT8192_CPU0_SRAM_PD);
 
+	/* enable MPU for all memory regions */
+	writel(0xff, scp->reg_base + MT8192_CORE0_MEM_ATT_PREDEF);
+
 	return 0;
 }
 
-- 
2.30.0.280.ga3ce27912f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
