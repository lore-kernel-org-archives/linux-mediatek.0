Return-Path: <SRS0=UyV0=DN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AB29C4727E
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Oct 2020 05:52:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E0402078A
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Oct 2020 05:52:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OrRQisTf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZE35pdO7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E0402078A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=47Z91aflt5nHgV43lRnvHn648r9hs+OBRwk8/yBwPEs=; b=OrRQisTfR9/jR09aXDGs9MewL
	PvTZFqDCNiw50ikeWh9eEb3TVfeg5qSOV2b+Vd/nx7buCNRCEBRRGuIR6KbOC9NCwUP8YdXHrdCD8
	Az/fzzK7jYNUCGlX280SfvVfCjXP8R53teYz5+rcINnni9HMzQQ1sAyypHePVrWvAjTtsm2Ce2azM
	NygS6JQfUAjSXKE1dQiGaNKQbyZCKEx0rYiV3reTIEJ+FyAWmBohl7K3R0ajAvN+nL/X8dkKzZp9D
	C0g6dxNq0JfvLXIP11k8B7SqtuPUBN3E4h1M1knU/1Wy3veH2ytsdVOXXX/tZ1hbzIloZo0ogqygM
	nUE4BtS6A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPftG-0005GC-RM; Tue, 06 Oct 2020 05:51:58 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPftD-0005Es-Rx; Tue, 06 Oct 2020 05:51:56 +0000
Received: by mail-pj1-x1044.google.com with SMTP id gm14so1029112pjb.2;
 Mon, 05 Oct 2020 22:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HG9ZKAE8Yu52ExRQDDjN81ZIm6yQmKnq3Y0AJ5grKyA=;
 b=ZE35pdO771g061VVZvdcfjKDlEaKTtMv2VvZruNsfJfCANlH+YDd8wjr6DGkxecbAz
 JdT1LLSkyMjrGxzQR4toNXBIWe9B0gGCi56oWxmAby8URbCd6s/YLS6Lmggcev774XpA
 XO+q8IzPHmuKCLov/Rc1y4Lf5zURJzUnoS/0ZH/q5GptNSNToZzAS8PltwTycZ6ip7MT
 6/xusvttVjGrhXt6OVfP5A0idA/mFhTu2HiFR/pQAc2dHalPl/ZyqVtT1XF/xDeNftY5
 Z0hkBvBed0MLnmOkmV/t640uRLLiUvtD3L5CxVWRJ1SFb84AzBXFnexpHROWTdxp6pAx
 rOWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HG9ZKAE8Yu52ExRQDDjN81ZIm6yQmKnq3Y0AJ5grKyA=;
 b=njoqMMh8VKbV98qU3Q5RBhuuLfRN3dd0QWoXcFjr76C2LcbiZrTXwJWdRasoUeEw/G
 NXRuDPhubwZ01dSGCwBQebrniHJBKLu18Zi/Ig10oz/+Tf1rXUYnBhHIhr4zautCiNp5
 pKNNJWDo+kO/S1IA97OaHVv+nmsY+oXSSp+stzVfLEJXa/1d56dGIClz0zrz2PywwKeu
 F3Uc7Jnd6WTRz5vlDLv1JuR8Iv4OMTV4dG1DcxHk7zLl1JbCXSi6idQwmrvMgMY3h2vj
 4orPMNM+ea2j6DnChtOaQj9nldxnRQue3W6qvy+6pye14nKugwzgSFxh3LsOl1n8dFuT
 27JQ==
X-Gm-Message-State: AOAM533K3WSVU99hcdRnzbQsYdsI6QiSecalWtjL+aAjZP/t5fFH6XiX
 a1+Kegg/xGJNL7DE2LgOKZo=
X-Google-Smtp-Source: ABdhPJw08TMPOmdXZyG3xQkc/cspaq8QZ61XkT6c69l9DZxa7bqDYxtbbmAUMNtuStXMz4Mil3GclA==
X-Received: by 2002:a17:90a:7f8c:: with SMTP id
 m12mr2966652pjl.22.1601963514072; 
 Mon, 05 Oct 2020 22:51:54 -0700 (PDT)
Received: from localhost.localdomain ([49.207.203.202])
 by smtp.gmail.com with ESMTPSA id x6sm1413685pjp.25.2020.10.05.22.51.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2020 22:51:53 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: kvalo@codeaurora.org
Subject: [PATCH 1/2] ath11k: convert tasklets to use new tasklet_setup() API
Date: Tue,  6 Oct 2020 11:21:34 +0530
Message-Id: <20201006055135.291411-2-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201006055135.291411-1-allen.lkml@gmail.com>
References: <20201006055135.291411-1-allen.lkml@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201006_015155_908338_3013D392 
X-CRM114-Status: GOOD (  11.84  )
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
Cc: ryder.lee@mediatek.com, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
 lorenzo.bianconi83@gmail.com, kuba@kernel.org,
 Romain Perier <romain.perier@gmail.com>,
 Allen Pais <apais@linux.microsoft.com>, davem@davemloft.net, nbd@nbd.name
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Allen Pais <apais@linux.microsoft.com>

In preparation for unconditionally passing the
struct tasklet_struct pointer to all tasklet
callbacks, switch to using the new tasklet_setup()
and from_tasklet() to pass the tasklet pointer explicitly.

Signed-off-by: Romain Perier <romain.perier@gmail.com>
Signed-off-by: Allen Pais <apais@linux.microsoft.com>
---
 drivers/net/wireless/ath/ath11k/pci.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index d7eb6b716..b75f47dc3 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -380,9 +380,9 @@ static void ath11k_pci_sync_ce_irqs(struct ath11k_base *ab)
 	}
 }
 
-static void ath11k_pci_ce_tasklet(unsigned long data)
+static void ath11k_pci_ce_tasklet(struct tasklet_struct *t)
 {
-	struct ath11k_ce_pipe *ce_pipe = (struct ath11k_ce_pipe *)data;
+	struct ath11k_ce_pipe *ce_pipe = from_tasklet(ce_pipe, t, intr_tq);
 
 	ath11k_ce_per_engine_service(ce_pipe->ab, ce_pipe->pipe_num);
 
@@ -581,8 +581,7 @@ static int ath11k_pci_config_irq(struct ath11k_base *ab)
 
 		irq_idx = ATH11K_PCI_IRQ_CE0_OFFSET + i;
 
-		tasklet_init(&ce_pipe->intr_tq, ath11k_pci_ce_tasklet,
-			     (unsigned long)ce_pipe);
+		tasklet_setup(&ce_pipe->intr_tq, ath11k_pci_ce_tasklet);
 
 		ret = request_irq(irq, ath11k_pci_ce_interrupt_handler,
 				  IRQF_SHARED, irq_name[irq_idx],
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
