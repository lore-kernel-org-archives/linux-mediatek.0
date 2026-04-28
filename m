Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A326FF8864
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Apr 2026 02:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BHQ2XadwvL8sO2gmMjzHrXHFd8fYwTAjs/sjK9AivAw=; b=IG/vqMP/dCT7xMxa12y58+7UJa
	cwcLgqI0VEfGpEBMkIvUsyJoH77V1nNk3NXVVw+/sSNtCaHt27u7qHRx6gnXUnYVPHCxiYbjIrbL3
	k2TYY2j502Z4057refKzUvHQIZQPHltZt2IPjkopAJFo+BVndpHGAq8sgGTviZGrj+MUeM4ksVeS0
	gqdNMPCqbnXI4f1neV55u0XMI2TOjgss5Z+Lf41+dqVBgZ9Vo8gTryLY0ZQ0Pjs+oYpMoiD7Ylgj6
	NN2FytU3GsE+nq6zCQ2c/4SCLNmugqvPspLwMCT05DimJIg4kJIL/vUIsrczbVak6wCSOEcLKcHdy
	Ll2rybCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHYca-00000000TRC-3I3L;
	Tue, 28 Apr 2026 02:56:24 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHYcX-00000000TQM-465g
	for linux-mediatek@lists.infradead.org;
	Tue, 28 Apr 2026 02:56:23 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-35d95017a68so7289869a91.3
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Apr 2026 19:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777344980; x=1777949780; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BHQ2XadwvL8sO2gmMjzHrXHFd8fYwTAjs/sjK9AivAw=;
        b=hoshnvzlUQjF7rEO6F6ewF35E3Oh64jFACFvwyKOb0uifv1p4X3vSahoBVwisnveNH
         LL9QRuN0Yj1MM7Qbq6V5g+p666nIbCYzCt7taKjJB9jxwuQEyxRZHjeUcTahilSwlMfc
         z64iuLcqHfslvmXWs8wYdY7SEgM43Dy+MSs2k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777344980; x=1777949780;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BHQ2XadwvL8sO2gmMjzHrXHFd8fYwTAjs/sjK9AivAw=;
        b=HNMd8YucT1vMynC2fC08IDPCUE39KrUXwngw3aVUQvBIxN81Jc+jVke8dw4W+65WjN
         qmudW7pBzHlWuCXIz79pdE7WK44wq8svSv4a+yYzSXh6cA3t4RN0m8L8WqDaLdV9+8Gl
         Q+Ky8UZ2rEKQXdDg56om78y0FLI0fsiMH0/v5MjiHgpjzSAyCS/MkWGbuM37FNFRdeXU
         JYzHg5eLiREAJ0rlWKkiKaHjmJ31i5GvhLuY1pMS33iUmAk6lNF6F7OOYIq7VKw6jsa5
         QSUY4doktZH2K8kA5J51Q9Z+rAHqAJS/KBU7d/sUlSuOpbAxOcggo+b9WaZXcZgjy87O
         EG4A==
X-Forwarded-Encrypted: i=1; AFNElJ/UZ2NO4q7BmMqNZ03Cs4zuZgi3T+sSqH85Wjm3JTz8BC3+xSvxOuQ1X40icEZRRRQGmM7FTr6PvLBaU2sMgw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyYLiPJFZOCYB6Lf1FeI7M8LpzuVlazfWzqAI78FQtxZHeyKBCP
	WD2jLhyBqk2DLNInbdnCzewF5wjN7L6KbpDe556Bi6UKtxhbG/qLopzBurEfuQh2Yw==
X-Gm-Gg: AeBDiesnCXGJ9tosH2m8ePbf/mO844Ggawk7xZkhtoxKT7TsdZL7ESpp3poK6aTlTsq
	N6reJGuzvAJtB2ccaP/HDkVa0OXtLKYbfqgLWIsCsMKY1HoSBfB2sXvmk9iOaeQJyTWnrJy8qF0
	L04VmRYr+LgkBCyGwgcHQTiiF8TXx88wG3hEiRVPlyEn2A2j5gMd41egsRYUwaz1cuXhEhRIaVI
	umzm0pwsy5dHsCXp8uC+khl+w8FYNOvAd8mHfln+mDnUCrqxfrdkktTpzXwg6J1C6TA2y0KD7JQ
	k0UIENpZzNBVSW0QZpGmzGQ9KoxdF99zoWZbc5m+xOcF3Ucgubz4sxYNHDM/nyXKjQqfoE5nbyg
	1WWirPHwEFWiVnnPwqjSHHGIlCPkDnC8BA0is0H616WkCwV/1v+Uj5tTsHBdKRPxVhO+Gr5o4N7
	FpvD5aV+fxTxIwVFzhO2rhzBfQtA19AggrQIfWPzEmbryKxJZCjwAl9v7e02qSvXpWKZUWq2Q1s
	mdIzrdwKsVbqLes9YyZGaFD
X-Received: by 2002:a17:90b:4f91:b0:35e:5051:fb18 with SMTP id 98e67ed59e1d1-3649206916emr1119860a91.26.1777344980513;
        Mon, 27 Apr 2026 19:56:20 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2a00:79e0:2031:6:b64e:793f:a44e:7279])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36490026a45sm1236408a91.3.2026.04.27.19.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 19:56:20 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>,
	YC Hung <yc.hung@mediatek.com>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH] mailbox: mtk-adsp: fix UAF during device teardown
Date: Tue, 28 Apr 2026 11:55:44 +0900
Message-ID: <20260428025614.1094085-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_195622_062308_09D442EC 
X-CRM114-Status: GOOD (  15.54  )
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

When the SOF audio driver fails to initialize (e.g. firmware boot
timeout), its devres unwind frees the snd_sof_dev object that the
mailbox client (mtk-adsp-ipc) reaches via chan->cl->rx_callback.
The mtk-adsp-mailbox shutdown clears the mailbox command registers
but leaves the IRQ line unmasked, so a late interrupt can still
queue a threaded handler after mbox_free_channel() had cleared
chan->cl, and mbox_chan_received_data() would then trigger UAF:

  BUG: KASAN: slab-use-after-free in sof_ipc3_validate_fw_version
   sof_ipc3_validate_fw_version
   sof_ipc3_do_rx_work
   sof_ipc3_rx_msg
   mt8196_dsp_handle_request
   mtk_adsp_ipc_recv
   mbox_chan_received_data
   mtk_adsp_mbox_isr
   irq_thread_fn
  Freed by task ...:
   kfree
   devres_release_all
   really_probe
   ... (sof-audio-of-mt8196 probe failure)

The crash was observed roughly three seconds after the failed probe.

disable_irq() in shutdown and enable_irq() in startup. disable_irq()
also waits for any in-flight interrupts, so by the time
mbox_free_channel() proceeds to clear chan->cl no rx_callback can run.

In addition, request the IRQ with IRQF_NO_AUTOEN so it stays masked
between probe and the first client bind — otherwise an early interrupt
can crash on chan->cl == NULL in mbox_chan_received_data().

Fixes: af2dfa96c52d ("mailbox: mediatek: add support for adsp mailbox controller")
Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/mailbox/mtk-adsp-mailbox.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/mailbox/mtk-adsp-mailbox.c b/drivers/mailbox/mtk-adsp-mailbox.c
index 91487aa4d7da..8bcecddee0eb 100644
--- a/drivers/mailbox/mtk-adsp-mailbox.c
+++ b/drivers/mailbox/mtk-adsp-mailbox.c
@@ -19,6 +19,7 @@ struct mtk_adsp_mbox_priv {
 	struct mbox_controller mbox;
 	void __iomem *va_mboxreg;
 	const struct mtk_adsp_mbox_cfg *cfg;
+	int irq;
 };
 
 struct mtk_adsp_mbox_cfg {
@@ -67,6 +68,8 @@ static int mtk_adsp_mbox_startup(struct mbox_chan *chan)
 	writel(0xFFFFFFFF, priv->va_mboxreg + priv->cfg->clr_in);
 	writel(0xFFFFFFFF, priv->va_mboxreg + priv->cfg->clr_out);
 
+	enable_irq(priv->irq);
+
 	return 0;
 }
 
@@ -74,6 +77,8 @@ static void mtk_adsp_mbox_shutdown(struct mbox_chan *chan)
 {
 	struct mtk_adsp_mbox_priv *priv = get_mtk_adsp_mbox_priv(chan->mbox);
 
+	disable_irq(priv->irq);
+
 	/* Clear ADSP mbox command */
 	writel(0xFFFFFFFF, priv->va_mboxreg + priv->cfg->clr_in);
 	writel(0xFFFFFFFF, priv->va_mboxreg + priv->cfg->clr_out);
@@ -139,8 +144,10 @@ static int mtk_adsp_mbox_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
+	priv->irq = irq;
 	ret = devm_request_threaded_irq(dev, irq, mtk_adsp_mbox_irq,
-					mtk_adsp_mbox_isr, IRQF_TRIGGER_NONE,
+					mtk_adsp_mbox_isr,
+					IRQF_TRIGGER_NONE | IRQF_NO_AUTOEN,
 					dev_name(dev), mbox->chans);
 	if (ret < 0)
 		return ret;
-- 
2.54.0.545.g6539524ca2-goog


