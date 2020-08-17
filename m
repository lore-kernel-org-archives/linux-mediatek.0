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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7B96C433E4
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 08:27:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9E852063A
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 08:27:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EORvmKRC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TEUbjnnR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9E852063A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QKO10mAFXs6ubKqxH4X6XMDl6YKSwpsLvJ7Xmx3c8Bg=; b=EORvmKRCRpFDFH+UsKNYdVf+11
	BR43N/t4PZBozhHeYzOw2/EZRPvHjKyBijJTJPrXFlk7dv/licnsKBwqP6ZxPifGT8xF9IEOJs3mQ
	RVD1/bDsI+G2ZG54rnWFNxGgaV1TsXtN2uj1jjXOQ7qwgZt2meAXRH7Aa4gF/4GULHO6UAlqakAoZ
	36kNSdkz7qkNazjl9DPzfp8Y++M1cfI+m03ipZtJxjOIaH3JDjd/sQkPlGazvJ6Rh9CzMa6GUDwVh
	zLBjIaWINU9OeHAmgvzvV4yUIrZMAtOU6jDNrE0duGF+jC/NRsAge/eODfdCAvYlDYssHNroR79AH
	F1heakgQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7aTt-0002vz-OD; Mon, 17 Aug 2020 08:27:01 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7aMD-0007b7-QS; Mon, 17 Aug 2020 08:19:10 +0000
Received: by mail-pf1-x444.google.com with SMTP id u128so7862949pfb.6;
 Mon, 17 Aug 2020 01:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ssSSz7f3Ql8I/02L7v0dEm57rAmAG5QqUNmcYkmicic=;
 b=TEUbjnnRYtLTSLXt82s3M/Tu0/Dfm/cSIzdCRLdoOboLsxmozgAGCXKnGPI2nAAzNC
 EmGMZDaze5DV1KuQa752lOTgT+eqV0fI4Oyujx30mDci1i3Wp0qufhkaGhhWv5em1n2y
 0QA2FUP7JeZ+GKPClXiSVQa3tg2i9QAOCS8UCHqADZAh546W6d38Z6uT9ZRhKV2sj00p
 Y+XLsIKpO3S8Zy53NpFF4k5kkK2Mj6OAdzk+Nrbm4hOz/kwdFdQK36tyhr8mLbQie9pw
 sp0WqRPYbJ3sPhQgxNPh5BwIeb6S4yxbwxB+YDPOg+VIknpzMdPYw2B7XmoGm5Eae2RI
 g8kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ssSSz7f3Ql8I/02L7v0dEm57rAmAG5QqUNmcYkmicic=;
 b=pZKMizF+u5CGxrhypS/vY/hHj5FqThJibH0YFEIzN+0DMSBG+ylhWj6+YOqFMImOlT
 XbclbSorxChP8WybGTdAMZEE8Mw2pFXwvILzybJ33gVe11G6BaJziZZJm0nSxHveB7gQ
 x4eA3Vd1j/zeky48uWdmw/ptb6RChUcqWiMTGRQ/nlgyIuFdExNjYV4Z2AnxfPckAtHL
 lnq7SOI1Q2gS50bkmPEGnlmtixikRhIr4GYBr5zQoQVTOASaB4zzG4vvnC/hLcL/rZsF
 /7QP29XTOcuCzK6iIioRbB1MfsyIZwsy15xHBc3Qh4AIubp7OH7zx3MU0fsL6Lv2Lotb
 EacA==
X-Gm-Message-State: AOAM531kAPJsct6yPxLC4K1VVb20AGlfyKckpd/tRf8MCppep77gccrU
 HqXVo+mKcV5yWaVowU7MCFk=
X-Google-Smtp-Source: ABdhPJy/L1S0pESv+N3Vx6Fjhj55gZLQvmhaIt7kWIR8XqiTFsZtfrFUisjaRrccHbbBe+p68Se4vg==
X-Received: by 2002:a62:79d7:: with SMTP id u206mr10467523pfc.97.1597652343406; 
 Mon, 17 Aug 2020 01:19:03 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id d93sm16735334pjk.44.2020.08.17.01.18.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:19:02 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, ast@kernel.org,
 daniel@iogearbox.net, kafai@fb.com, songliubraving@fb.com, yhs@fb.com,
 andriin@fb.com, john.fastabend@gmail.com, kpsingh@chromium.org,
 baohua@kernel.org, mripard@kernel.org, wens@csie.org,
 thierry.reding@gmail.com, jonathanh@nvidia.com, michal.simek@xilinx.com,
 matthias.bgg@gmail.com
Subject: [PATCH 08/35] dma: imx-dma: convert tasklets to use new
 tasklet_setup() API
Date: Mon, 17 Aug 2020 13:46:59 +0530
Message-Id: <20200817081726.20213-9-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817081726.20213-1-allen.lkml@gmail.com>
References: <20200817081726.20213-1-allen.lkml@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_041906_068988_AAA6F8D0 
X-CRM114-Status: GOOD (  12.91  )
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
 drivers/dma/imx-dma.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/imx-dma.c b/drivers/dma/imx-dma.c
index 5c0fb3134825..67b9f2bf35b7 100644
--- a/drivers/dma/imx-dma.c
+++ b/drivers/dma/imx-dma.c
@@ -613,9 +613,9 @@ static int imxdma_xfer_desc(struct imxdma_desc *d)
 	return 0;
 }
 
-static void imxdma_tasklet(unsigned long data)
+static void imxdma_tasklet(struct tasklet_struct *t)
 {
-	struct imxdma_channel *imxdmac = (void *)data;
+	struct imxdma_channel *imxdmac = from_tasklet(imxdmac, t, dma_tasklet);
 	struct imxdma_engine *imxdma = imxdmac->imxdma;
 	struct imxdma_desc *desc, *next_desc;
 	unsigned long flags;
@@ -1169,8 +1169,7 @@ static int __init imxdma_probe(struct platform_device *pdev)
 		INIT_LIST_HEAD(&imxdmac->ld_free);
 		INIT_LIST_HEAD(&imxdmac->ld_active);
 
-		tasklet_init(&imxdmac->dma_tasklet, imxdma_tasklet,
-			     (unsigned long)imxdmac);
+		tasklet_setup(&imxdmac->dma_tasklet, imxdma_tasklet);
 		imxdmac->chan.device = &imxdma->dma_device;
 		dma_cookie_init(&imxdmac->chan);
 		imxdmac->channel = i;
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
