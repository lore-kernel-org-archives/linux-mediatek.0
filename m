Return-Path: <SRS0=p/XJ=EW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBC26C55ABD
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 08:26:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B7F520702
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 08:26:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O/qK0P++";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="QOBEhTLv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B7F520702
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=In7pOsPcTpEvhTLcYK6TnTs+rhj00ibCZqoARDr1AEY=; b=O/qK0P++1V7YHhankDMMO4O8U
	VyRT+Gu3qtzDk+Bhl74cfZHVoJEaxqtyz8UOXTXWjprHIBpcQeHMGCH6OArUrYWmIpo85IeDmG+DI
	yOvQDd2xNEb1OzOPS4/s5k0nzKLMRqph+mjjAAS4QEfuyZVZKbPyF1B7hkC4rpVEwkvJc92cA1zFO
	LhF33noU0NhPWrQ3acrTAOm9D+RLuSn2Qs3+0H9twOF0HdLR6cqrowx1get4dqaOKZBZauOG1gNgJ
	xMVdW59bOTMu+sIlseImwwuWrQeZ2rKJc2up3nrVxTOSwGhg5vP2rGMxHgl4yG7BLfXr/bNqcX4NY
	z2p+iQF+w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keZqH-0007RU-VE; Mon, 16 Nov 2020 08:26:30 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keZq4-0007NK-RD
 for linux-mediatek@lists.infradead.org; Mon, 16 Nov 2020 08:26:18 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id k196so19551993ybf.9
 for <linux-mediatek@lists.infradead.org>; Mon, 16 Nov 2020 00:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=iRKdGUeQKewf5nuXxBX2agP7HYNBW301CirwCFhx4pU=;
 b=QOBEhTLv6QVv/QjZqTP+H+yyG/6mzw35iNQXRNy1YtY/1cays5xvfiDfdKHvbTTDS+
 2YSyEvQ1HADSKiodkgTxOjX1QQDG/L/gJ5iA9Hz6adaEPpASQUu9DvqifQpNAgE0nU5T
 PFlgzbIQ6XbOXWAe2kerZkJUBEkmpnLyQ/IFB7WXMy76lv+rK/fasC7cEZd6DmdebDpv
 S9uV5tIvfjS1zglfg1qhhPaqBfBcIyqFWgO309RdbxgEAR6aj4e4GoSvWVjA7JrnV0Un
 l8bNzLcVj+e56k+Eq1KzcueJlH62U0gTkqNjKyzsuqyyr4g2L8Ist6sX40HSJZh9IgFE
 7Tmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=iRKdGUeQKewf5nuXxBX2agP7HYNBW301CirwCFhx4pU=;
 b=OOkdhRKJjXy4YDKGJlIH1d9ejOPbyeEc7vrwwRy9jiDW+7f4afdH3kjsOO6Bt0hVoE
 6gjBIzKFywQmP2sIka+wsQc1rNW+P5HD4ZRNqv/4fHm8Wn9jr5HXkGeqdVZYaTNN7OqJ
 5AR7uurAmZN+jnKNsjw91fTQ2Yx33K++M+gxWty8+oL8VttjZFrxOFVUCTn8w1ZyxmSM
 7bMQzPSnGkEkmuR6W4VRsV34hP58C0D0vpxrS/LdHWFsUsFTO/ekfm2xxhg/2L6LuzkU
 Afjg+WOaDQM34ROR2qaTjg+V4aXjNic4Tskbqr0x30cd9nHPHNiW0qV+2j3LFED4ZPaW
 Molg==
X-Gm-Message-State: AOAM533x5BJLOxnoChNWo0SrbG8hJD9bL51AY16h4JpX69xdHtY+j5Rh
 fGLun5CfMeLUKNjmA9hPvTiBnMSMgpka
X-Google-Smtp-Source: ABdhPJw0N0XKpM+KTbbElpvFZIMiwftJ2h8EAOI91tZQq6qWMiAPMPFuFLr/2HlvN0EDQXvVSWUOTPNvIvX4
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a25:da0f:: with SMTP id
 n15mr13910518ybf.481.1605515172335; Mon, 16 Nov 2020 00:26:12 -0800 (PST)
Date: Mon, 16 Nov 2020 16:25:37 +0800
In-Reply-To: <20201116082537.3287009-1-tzungbi@google.com>
Message-Id: <20201116082537.3287009-3-tzungbi@google.com>
Mime-Version: 1.0
References: <20201116082537.3287009-1-tzungbi@google.com>
X-Mailer: git-send-email 2.29.2.299.gdc1121823c-goog
Subject: [PATCH v2 2/2] remoteproc/mediatek: fix sparse errors on dma_alloc
 and dma_free
From: Tzung-Bi Shih <tzungbi@google.com>
To: ohad@wizery.com, bjorn.andersson@linaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_032616_949768_0C6F1E22 
X-CRM114-Status: GOOD (  13.26  )
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
Cc: drinkcat@chromium.org, kernel test robot <lkp@intel.com>,
 tzungbi@google.com, linux-remoteproc@vger.kernel.org, groeck@chromium.org,
 linux-mediatek@lists.infradead.org, pihsun@chromium.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Fixes the following sparse errors on dma_alloc_coherent() and
dma_free_coherent().

On drivers/remoteproc/mtk_scp.c:559:23:
warning: incorrect type in assignment (different address spaces)
   expected void [noderef] __iomem *cpu_addr
   got void *

On drivers/remoteproc/mtk_scp.c:572:56:
warning: incorrect type in argument 3 (different address spaces)
   expected void *cpu_addr
   got void [noderef] __iomem *cpu_addr

The cpu_addr is not a __iomem address.  Removes the marker.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/remoteproc/mtk_common.h | 2 +-
 drivers/remoteproc/mtk_scp.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
index 47b4561443a9..b3397d327786 100644
--- a/drivers/remoteproc/mtk_common.h
+++ b/drivers/remoteproc/mtk_common.h
@@ -99,7 +99,7 @@ struct mtk_scp {
 	bool ipi_id_ack[SCP_IPI_MAX];
 	wait_queue_head_t ack_wq;
 
-	void __iomem *cpu_addr;
+	void *cpu_addr;
 	dma_addr_t dma_addr;
 	size_t dram_size;
 
diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 8ed89ea1eb78..a1e23b5f19b9 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -413,7 +413,7 @@ static void *scp_da_to_va(struct rproc *rproc, u64 da, size_t len)
 	} else if (scp->dram_size) {
 		offset = da - scp->dma_addr;
 		if (offset >= 0 && (offset + len) < scp->dram_size)
-			return (void __force *)scp->cpu_addr + offset;
+			return scp->cpu_addr + offset;
 	}
 
 	return NULL;
-- 
2.29.2.299.gdc1121823c-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
