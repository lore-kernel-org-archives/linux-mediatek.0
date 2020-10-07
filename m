Return-Path: <SRS0=2/VK=DO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 065F9C4363C
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Oct 2020 10:33:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 878CC207EA
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Oct 2020 10:33:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ReJyqwpa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e9hD9Og8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 878CC207EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=47Z91aflt5nHgV43lRnvHn648r9hs+OBRwk8/yBwPEs=; b=ReJyqwpazXQxNd2dpfWChM5G9
	mmKxdBpBGFbVGcA0X7sU7ZW4KSUbsMSVj6/j+AWEMAr46ieXM3GssH/LLaAo+Ah//C/N0veoAFoMb
	BMewzZn9kiWbJloSbxB5fdc1fhCVeDREYw3zzEJPdKZxc9a8rAZAU+gaNxw19Pjw4qccV9DWJ/6Lc
	D8RrmlfYYaBIPkHuGmRdm6gvdUV/a+ClIf6kRyapBKVIBXrhf5RhuDmN3OYN3gbGxAzkrN/PEwzNP
	BxfWx3OjDDG5ierenFp/NS8nRBE4SXiA2/+Ugk/65RwnPhU5hjfyjOTfeYZtteX4YWil6RvBBwYzB
	CoIdWDxVQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQ6lM-0004jQ-5R; Wed, 07 Oct 2020 10:33:36 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQ6lJ-0004gF-Da; Wed, 07 Oct 2020 10:33:34 +0000
Received: by mail-pf1-x444.google.com with SMTP id a200so1083449pfa.10;
 Wed, 07 Oct 2020 03:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HG9ZKAE8Yu52ExRQDDjN81ZIm6yQmKnq3Y0AJ5grKyA=;
 b=e9hD9Og8ygIqfuCpfy3OgSoXmTi3hRHN1uIsUZEY2oi+kh+bEHV3em+CNt62TmC87J
 B4Yta4tMlFRyCBc46R9hrTkonZ1bY3VvPR9wRKCI1Vnoe+BYo1CEzgIeJ52BsSzky++W
 bYAlFMylan/q+9LZzHKbRuiC/vIIAdqkSzODPa3KgBUfK6h+b8zAfZi3qhW/2tZhJyCy
 w1ZPb6d4uA4Uj3uuK8wYrBEC7xuU388xncC2RktPEOTivF93X4I5tcw5AOdxpV80Pf+s
 FYo/++Z16AxQtqB1idjslrbaTFWW2ItKXwANFqas2Xq7q68qc+V59YsS023fYOblBYOR
 Pt3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HG9ZKAE8Yu52ExRQDDjN81ZIm6yQmKnq3Y0AJ5grKyA=;
 b=FW+NoX0FwQ0UC1DVaxoSEbs8wqfCAEEjMMVk2dQrMmArw3KIpFlfQ0SkSyEJ1H/gjq
 1zq86bgsoIwjZHN37RrXqpYxBnyx8Hzi1ANyTmRn+NkdZ7gUN0c0DT75Qry3yYBqErmz
 Jn2D2kFSTcAbbSz//mpzjzHdQ6CO8dTp5jxtk2p0VCjN5hnwL1GtEWrbRCNa135JCuLZ
 rDRxcHZ6tG7uu2LQDVW9TlZpgGz06FPvhT9GJ4HJ+FV6ePHYCzRkC1h1Xm2wnvvNL/Ve
 4HxcZ61PzZ4jmuUXxRU9EqTveI9TMLpH12PTcyoMpN0C4qlOMX1OARIanIwi1iVacXHp
 kkHA==
X-Gm-Message-State: AOAM53019AaCY5zGsRkgOmN9tRpBMpgtcBY7k4Z1NhgsnC4+CO+TGH4e
 ZZhb/tX5cviHQ4WyPxZVZtY=
X-Google-Smtp-Source: ABdhPJw2/zeJqETexwSce8Lc2Mbg8nsRB34u08hVBEL7qWLWZ5DIFVo2pnpRv8Khrnnm9nMQAc6xXg==
X-Received: by 2002:a62:178d:0:b029:13e:d13d:a0f8 with SMTP id
 135-20020a62178d0000b029013ed13da0f8mr2301077pfx.20.1602066811396; 
 Wed, 07 Oct 2020 03:33:31 -0700 (PDT)
Received: from localhost.localdomain ([49.207.204.22])
 by smtp.gmail.com with ESMTPSA id v129sm2705327pfc.76.2020.10.07.03.33.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 03:33:30 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: kvalo@codeaurora.org
Subject: [PATCH v2 3/3] ath11k: convert tasklets to use new tasklet_setup() API
Date: Wed,  7 Oct 2020 16:03:09 +0530
Message-Id: <20201007103309.363737-4-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201007103309.363737-1-allen.lkml@gmail.com>
References: <20201007103309.363737-1-allen.lkml@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201007_063333_471641_61D07555 
X-CRM114-Status: GOOD (  12.15  )
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
