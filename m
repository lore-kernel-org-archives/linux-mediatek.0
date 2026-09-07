Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1808FC79F9E
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2026 06:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0YpADwP/mkKyGO+EKdZI2bBLv0b75u6CTO5qSfwEOn4=; b=zqlMoadWdIH/oAnEiNwW247GA7
	aQEGeMkNisUMo0zcl2m1/SQsAGhBTkdKBj3NVz6NfgXFi5kyt9N2gYZ2Ivn3W0VJ+KPEjplhSnhnN
	GOsTkjLIgzC/r5iIQX1b1KYHsfsT+YhZuxnB+e0Vpj0wOyPpx3TqOY9w32gKBC3YQvC3Xa0M/7KFQ
	WpXlGzsbV5/mE6ozCt2rUCOoErxg3YfkyQQ7jUPkhEacWzbZOpqQjJAquG+RB3F692UZoLqsz0W0v
	YVTj/N4zoZQYlr4YDULXT8U7DfANaFTV+ggkf9yoAKxzG1Q2wqDvg5W5aa9xpA37tJXxi52OaquAt
	kSPK6sqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3TEZ-000000064Mc-33S3;
	Mon, 07 Sep 2026 06:53:39 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3TEW-000000064LG-0nmF
	for linux-mediatek@lists.infradead.org;
	Mon, 07 Sep 2026 06:53:38 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-cc1cf287ef8so2787714a12.3
        for <linux-mediatek@lists.infradead.org>; Sun, 06 Sep 2026 23:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788764015; x=1789368815; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0YpADwP/mkKyGO+EKdZI2bBLv0b75u6CTO5qSfwEOn4=;
        b=PsH2DVrf4yLxVUH/J/UgJ5mxKmOl6ujVzTXA0Zgv3DM9PIs9QDOdZxrMo92XprdNq9
         kiI2stOs1lcPpbYuqKQPYUA7nfyZy1Ky2+r9Ej33vdvIRSnsDATrkrHmUnodivF7WLos
         5BEghFcgpuov6UylGAG97SUxg0mJVk1xdswPLFlDs85litINGz4nSAElG6GjUmI0/gUa
         PiEj14fuDf50soUyXShynPTx5pmk5YGDtzfxZ4ou0YYSMh6HqgPgo4xzE++1O32Rr0Lj
         kjZtyWNwWfaO6BiAsO4uzydvq+3/svvl7gdsWr1OR9+q9yefS/9Ix1djlJZkhJEK8Vov
         5faQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788764015; x=1789368815;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0YpADwP/mkKyGO+EKdZI2bBLv0b75u6CTO5qSfwEOn4=;
        b=jyhPycehmwoBdwgn15qTSpoVzzgJxD2bgzi9RvYQ9V8CJOrIykJ5hgcBwWUnePq60C
         28HpGY1r8OLybkWKv1wzDBKKE5AvWSK7pnSnhsSeMecfow9wMqh2+NFkMhA61wx0BdcR
         FMskHHkeGHk053tVp8TheDr+5yUmpUxu0Bz7Hj3l0fOVWZmzlMbvwgx2+doy0HXkYOtd
         xc0eMCL9/qi5VN2mVElTjNbHOo2r27/MDlKIMwZg6d8DqFZvbld91PcMR8b3w4PnoqLh
         +G+dIRDEZ8JVmEgJOFCMcjNni2xdYOU/qkYepPCBTL+AHc5qxUU0TJ5Vw5NNNh89qY5I
         1tmA==
X-Forwarded-Encrypted: i=1; AKwUvByNj12YJ4WMlkQm8WVMYwxX/O/PZ1KsXipvs2g5mt2GEwHR+XNu0u+0Jtd7iauSjH7E3h8HRrT95c/akhF1RQ==@lists.infradead.org
X-Gm-Message-State: AFuF++lDBQ5/SMOSDKpOcsoxAFLh0iqsrifMWeE5cVNu0XSGetjpGcZZ
	bfIHcLq/gCaUAtITrvvlFm9m3WZ99aScoxd178+OzcSkEFMhXy4D1P1i
X-Gm-Gg: AYBFou2mlpJ7lxtsuNxGsHbhQKANCW80cnTozdrGb9Dylk+I9XPLhdNy7Pvrsc1/Yox
	S14Iz9zzvcwhuC2uu8iqr+8pdMydlyp1gxjvC70EiNR2CozC+EMHdRiNdTAvdo2BT9YT7puL4kP
	ylce14Y8UR4blB0/0S46urlgWTSVqWCKSZzoGh8Dhfc3gZhIXQlp8DFL76D7SgntptS2g2Wluu8
	hc67R2M80W2abcLd/oR+R+qkfAGs5ktsbi+NxKJJOhaYmiuuAue56QIK5Gxq4LsgTWnmoy6k5iL
	CBvjCpLI5YEXdvoAWDC000rKX1NBEc3uVVutuA2YIKMB3P1oV1S8z2+klfCy4M5+T6uLCTv75Uj
	NDKaRS2oxGvDFoYtxIUS2U8jJUEugBLtR+s6uO6mQWRUdFTrs41SQyiI0hPKssUmIaPQNg4jS99
	j1v3DNpEWqihgfkKF9kHfcKv2CB+WvvUn0z5uan+pgg089q2VnZPlAaUJHmUIcd6JJxLSCNhhK/
	VJ1DUujOdj2/w==
X-Received: by 2002:a05:6a20:e607:b0:3d3:ae0f:5267 with SMTP id adf61e73a8af0-3da3a152a11mr33125804637.19.1788764015179;
        Sun, 06 Sep 2026 23:53:35 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa33e96sm24822574eec.12.2026.09.06.23.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:53:34 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Linus Walleij <linusw@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 02/14] irqchip: fix typos in comments
Date: Mon,  7 Sep 2026 12:23:28 +0530
Message-ID: <20260907065328.32009-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_235336_232389_7185F0AB 
X-CRM114-Status: GOOD (  14.32  )
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

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/irqchip/irq-mtk-cirq.c    | 2 +-
 drivers/irqchip/irq-sifive-plic.c | 2 +-
 drivers/irqchip/irq-vic.c         | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-mtk-cirq.c b/drivers/irqchip/irq-mtk-cirq.c
index 914d1d639fe3..d30c34ce0f56 100644
--- a/drivers/irqchip/irq-mtk-cirq.c
+++ b/drivers/irqchip/irq-mtk-cirq.c
@@ -247,7 +247,7 @@ static int mtk_cirq_suspend(void *data)
 		writel_relaxed(mask, reg);
 	}
 
-	/* set edge_only mode, record edge-triggerd interrupts */
+	/* set edge_only mode, record edge-triggered interrupts */
 	/* enable cirq */
 	reg = mtk_cirq_reg(cirq_data, CIRQ_CONTROL);
 	value = readl_relaxed(reg);
diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 5b0dac104814..a7cddadddf40 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -452,7 +452,7 @@ static irq_hw_number_t cp100_get_hwirq(struct plic_handler *handler, void __iome
 		return 0;
 
 	/*
-	 * Interrupts delievered to hardware still become pending, but only
+	 * Interrupts delivered to hardware still become pending, but only
 	 * interrupts that are both pending and enabled can be claimed.
 	 * Clearing the enable bit for all interrupts but the first pending
 	 * one avoids a hardware bug that occurs during read from the claim
diff --git a/drivers/irqchip/irq-vic.c b/drivers/irqchip/irq-vic.c
index e38104c5064e..607e3284f700 100644
--- a/drivers/irqchip/irq-vic.c
+++ b/drivers/irqchip/irq-vic.c
@@ -478,7 +478,7 @@ static void __init __vic_init(void __iomem *base, int parent_irq, int irq_start,
 /**
  * vic_init() - initialise a vectored interrupt controller
  * @base: iomem base address
- * @irq_start: starting interrupt number, must be muliple of 32
+ * @irq_start: starting interrupt number, must be multiple of 32
  * @vic_sources: bitmask of interrupt sources to allow
  * @resume_sources: bitmask of interrupt sources to allow for resume
  */

