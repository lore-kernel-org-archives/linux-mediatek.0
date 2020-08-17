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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 770E3C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 08:34:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4769B2072D
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 08:34:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n5OYlPJG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KRBYv0V7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4769B2072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zPq+sdhQYgS9/zWui8XnY9YEpv3BxNKoGO2YEac0u/A=; b=n5OYlPJGs4mWE/8a/+RLlbSn0j
	Y2Y6zwygdEipiw9a+OR1zdeHjVf6JibpWE21m/khaFBZGskvKOLKvS2O69PjoygUuY61+fDl1CKtP
	pm60CzH2rXaGQOXA362JRyawa5Icyzn2mh3Ac05p2WTpHnYSKlERb1lXnEpLny5QI5pX+PGQ6QCBd
	LVKD/d4gVwH5dQbGd/p3ifwh5xPF8R2E+WwHMot3GXbWN2FwfNF8pHhr06QSs5eE1KXIbJVoAMdQc
	eRFyLr+TPKIorNq3fiTcCyPe19+NSE20Nk0oIA9DftMeMzPN2UKGAeI0UbQfSma0cq7NWnHKt205A
	miVV/fkQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7aad-0006pa-K6; Mon, 17 Aug 2020 08:33:59 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7aNv-0008PC-T0; Mon, 17 Aug 2020 08:20:53 +0000
Received: by mail-pg1-x541.google.com with SMTP id 189so7122396pgg.13;
 Mon, 17 Aug 2020 01:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=dqznZ0QFtNhvUqAjtholQ/Q+9qOGKPjtIbAySrocxDs=;
 b=KRBYv0V7RGxjCNY2koURdTLqlf5T4Z5jbej72if9UXEFoL/RlV6R2AvNxEL7dsnkWj
 0Ocb0N5z5mpfGDeBczn80DTSBEiOrPHHULXZM2bbF2PT18waNq8KIv/teDOjtojWbR/o
 +utDsvnj0AiO/C0hDKdBK5L3ZEIFNo1ncyj3M37kjc5nrD+4woYiqlvpl7WkU63sNC3s
 /z4oHsk2a5X6cL0vJjbAo8Q0jygbeBZTUK1omsbE3UDj2SLH/dnrgSMmm41FmZ4H/Jqb
 uQF+QmUGHr2ATgAq4IklyAkVPA8988eGdhnOuKCkWnKzJ1jh6EvOFScbKkNP2V/Z+eeY
 +WTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=dqznZ0QFtNhvUqAjtholQ/Q+9qOGKPjtIbAySrocxDs=;
 b=Bvqs8HnMjNPCll+vrUCA4fWg/QJg6vVpY4j3jHt5ny6nDTxuHpM3Uo7Nbsb2gUZQKL
 mSCrT5vUKL06NsgVH5tiv57UHNSxDg/nBEX9vt0XOo2ep1Z0Jn/YZ6+cOWsg3msE+8ff
 aOO0VT1aKqekqIZ3uc7yjynMlcQIQ7/d/IhIUytoxoqiXd5+fg4tDNeQjBAc66z1Wvrj
 ttt4BsUJtIa7rk6czPtwuKcoYBh+rFc6m0VeSBCsY1wKaZVaIe0x3VrI/+ZxPplinqy2
 eWwQwiU+Y6GlNwAuJ3QkcXbTNmq+3mpAovBQeXeRZTG2soQ27AM+Hkns3MLrpBP86F60
 rk1Q==
X-Gm-Message-State: AOAM531J07Rhfs5Nc+Xgpem83GwS7AMx+j0enROhM3pP6osk4FkbetEJ
 xgu/TVVBtSZHeJgabR2EWrk=
X-Google-Smtp-Source: ABdhPJzX+N/OkXU+vrrmrFmCMg/4yjHapdnCrzQXpTIDVt6HxLMh86+qWux6PojScRvt2WSRNYNUQw==
X-Received: by 2002:a62:1543:: with SMTP id 64mr10645592pfv.242.1597652447996; 
 Mon, 17 Aug 2020 01:20:47 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id d93sm16735334pjk.44.2020.08.17.01.20.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:20:47 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, ast@kernel.org,
 daniel@iogearbox.net, kafai@fb.com, songliubraving@fb.com, yhs@fb.com,
 andriin@fb.com, john.fastabend@gmail.com, kpsingh@chromium.org,
 baohua@kernel.org, mripard@kernel.org, wens@csie.org,
 thierry.reding@gmail.com, jonathanh@nvidia.com, michal.simek@xilinx.com,
 matthias.bgg@gmail.com
Subject: [PATCH 18/35] dma: nbpfaxi: convert tasklets to use new
 tasklet_setup() API
Date: Mon, 17 Aug 2020 13:47:09 +0530
Message-Id: <20200817081726.20213-19-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817081726.20213-1-allen.lkml@gmail.com>
References: <20200817081726.20213-1-allen.lkml@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_042052_235770_CBBDD2C9 
X-CRM114-Status: GOOD (  13.30  )
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
 drivers/dma/nbpfaxi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/nbpfaxi.c b/drivers/dma/nbpfaxi.c
index 74df621402e1..4ef0838840f3 100644
--- a/drivers/dma/nbpfaxi.c
+++ b/drivers/dma/nbpfaxi.c
@@ -1113,9 +1113,9 @@ static struct dma_chan *nbpf_of_xlate(struct of_phandle_args *dma_spec,
 	return dchan;
 }
 
-static void nbpf_chan_tasklet(unsigned long data)
+static void nbpf_chan_tasklet(struct tasklet_struct *t)
 {
-	struct nbpf_channel *chan = (struct nbpf_channel *)data;
+	struct nbpf_channel *chan = from_tasklet(chan, t, tasklet);
 	struct nbpf_desc *desc, *tmp;
 	struct dmaengine_desc_callback cb;
 
@@ -1260,7 +1260,7 @@ static int nbpf_chan_probe(struct nbpf_device *nbpf, int n)
 
 	snprintf(chan->name, sizeof(chan->name), "nbpf %d", n);
 
-	tasklet_init(&chan->tasklet, nbpf_chan_tasklet, (unsigned long)chan);
+	tasklet_setup(&chan->tasklet, nbpf_chan_tasklet);
 	ret = devm_request_irq(dma_dev->dev, chan->irq,
 			nbpf_chan_irq, IRQF_SHARED,
 			chan->name, chan);
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
