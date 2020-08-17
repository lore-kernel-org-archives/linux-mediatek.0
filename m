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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70898C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 08:40:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E51272072D
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 08:40:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UNMQKWzH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S2U5GXmo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E51272072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pFpbz71fJcMPcX07/oO3n2mS79JHgiLtjfdz18PrL+M=; b=UNMQKWzHXlPcVXyNSlWybb7d9a
	GG1xTWsLmQUpfQOc6iwi+m356YMubbKNX77V7FRofMhvEAl2ZDDge1o8vQjnHNWWckudDeEanVFkc
	hPPimfgpXAhNIPzseSVOPQUEgGhn72gRNyO8qnM+83jdDzcIstWIfQapxeNoYhU+/xTWpXIhC+J5L
	Llb3u6zapDIQYBkics4q9w2xjhr6kFWx744G/cUkshQ2HGUl4EwhPnBMshbtFuqiNKkmrJLvI/sxi
	mz5Xb7eeLhbwj6hQb5ffsMELHCWtIbpctucjCSmfY92kdy3SjS2SAHas5Ir+0LTbYXFrRU/w7ZMQL
	FmXaRvCA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7agS-0001So-Kf; Mon, 17 Aug 2020 08:40:00 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7aPk-0000qz-52; Mon, 17 Aug 2020 08:22:59 +0000
Received: by mail-pj1-x1042.google.com with SMTP id d4so7334727pjx.5;
 Mon, 17 Aug 2020 01:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=qnSx2Xs+5F55vipJ1GlRPOngMDb///4cheR/5/8gimc=;
 b=S2U5GXmo7ck1ZKahunFhTHxDXIlZOzEOfz2Ldo3lZV7wXaGbijFjmYJ6y9GPe7JEsb
 Zn0a9L4YvyzqdxmEdh9mSRBc7jpS+mRrU1u1MIJVwQLetIacicrbdTW87QgABnCSr4TR
 9+WfoJ7On1pmQAwDIGbyc5OKqz+7QW1J46cDvWGHmvKts/B91ywfzpGgmAM7C1gBjgNh
 sBwomzHfku5xWTvFJdYd8tXQQ5ErKNGJFOxhZ401NpR/uznNn/kfbHAabowljDvIo426
 jFeeopQuofHpn5V6pqn99ZwpbE4Cs7WtzeyZm8YPRzvgxsRXtBoKAJtFxKybqvNmw93E
 kH6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=qnSx2Xs+5F55vipJ1GlRPOngMDb///4cheR/5/8gimc=;
 b=R3SLL+NlFsSMku/7fcRNmJOBSsiNBrg48V+pL17v5dgFK+iSui2K1ktjpZfOSGkiqT
 BcR0Fqm9Rm9rP1u2jBQS7mOqN7ikwY7BCyg6m9kFz0zzTnli59W9ZWIKxueasFNQIW+G
 xwZbfWV5yIX16ibgDiOGeShFERfghEIaTcgReFqyieuSq2KIV9MiqvzsyPu5NJk2G4FP
 oAEsuZm8VPksJ0NTWBllJVHZQE+Tp+oYOGy/p+wydnMnCmKvkcxkfRSSP7JXp5NK2Ela
 OuN9rEnaTMcTdwRuVgr4Ar81Qr1pICkinQDU4weghyOGeScfhes+0qd3748XHb8mpCWw
 36fQ==
X-Gm-Message-State: AOAM531Kq8xWHB8OW5G6oszePcP2i56BnFtS/Cxh54Xsbphi/5YCSe2Q
 g2ZlVCCucTDf6fQnj1BI+Wc=
X-Google-Smtp-Source: ABdhPJzg5CA1taulVojf7+8vPbJsAwASHRozrU6aj+DjWYr3Cf2FaYf6IONr7tFFIkdkCyLlL5Anow==
X-Received: by 2002:a17:90b:2092:: with SMTP id
 hb18mr12059879pjb.118.1597652561292; 
 Mon, 17 Aug 2020 01:22:41 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id d93sm16735334pjk.44.2020.08.17.01.22.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:22:40 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, ast@kernel.org,
 daniel@iogearbox.net, kafai@fb.com, songliubraving@fb.com, yhs@fb.com,
 andriin@fb.com, john.fastabend@gmail.com, kpsingh@chromium.org,
 baohua@kernel.org, mripard@kernel.org, wens@csie.org,
 thierry.reding@gmail.com, jonathanh@nvidia.com, michal.simek@xilinx.com,
 matthias.bgg@gmail.com
Subject: [PATCH 30/35] dma: virt-dma: convert tasklets to use new
 tasklet_setup() API
Date: Mon, 17 Aug 2020 13:47:21 +0530
Message-Id: <20200817081726.20213-31-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817081726.20213-1-allen.lkml@gmail.com>
References: <20200817081726.20213-1-allen.lkml@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_042244_452013_007D7635 
X-CRM114-Status: GOOD (  12.82  )
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
 drivers/dma/virt-dma.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/virt-dma.c b/drivers/dma/virt-dma.c
index 23e33a85f033..a6f4265be0c9 100644
--- a/drivers/dma/virt-dma.c
+++ b/drivers/dma/virt-dma.c
@@ -80,9 +80,9 @@ EXPORT_SYMBOL_GPL(vchan_find_desc);
  * This tasklet handles the completion of a DMA descriptor by
  * calling its callback and freeing it.
  */
-static void vchan_complete(unsigned long arg)
+static void vchan_complete(struct tasklet_struct *t)
 {
-	struct virt_dma_chan *vc = (struct virt_dma_chan *)arg;
+	struct virt_dma_chan *vc = from_tasklet(vc, t, task);
 	struct virt_dma_desc *vd, *_vd;
 	struct dmaengine_desc_callback cb;
 	LIST_HEAD(head);
@@ -131,7 +131,7 @@ void vchan_init(struct virt_dma_chan *vc, struct dma_device *dmadev)
 	INIT_LIST_HEAD(&vc->desc_completed);
 	INIT_LIST_HEAD(&vc->desc_terminated);
 
-	tasklet_init(&vc->task, vchan_complete, (unsigned long)vc);
+	tasklet_setup(&vc->task, vchan_complete);
 
 	vc->chan.device = dmadev;
 	list_add_tail(&vc->chan.device_node, &dmadev->channels);
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
