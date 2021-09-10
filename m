Return-Path: <SRS0=J3PH=OA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F34DC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Sep 2021 09:49:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EFDD61186
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Sep 2021 09:49:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5EFDD61186
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tD4fT8D6SW5+vtEz++l+X/TXWGqh9SQ3uvumME4uoZc=; b=j8/VK0t1LFTlBN
	026k0qpFuBJQUnpUatHPkLAtPi8YmMrBBgH7nxfgHYTytDNrMhxEBVK+eMY7RPwBzNYaL9my3MXpo
	btDAyptMbzIvDbM469juEQssUiW7R02WlH2DtrXKtCQwWzWOGjf9t+sVrd6pimYNO68OHDhgfnz4t
	hurQBgKK7a61Mve0ERdcIWRZAzpNpfH/ckYZKzIKL5R7dWHaBnIRN4lyP5mff7Ei0KpKOTG0/DVwD
	UgtoWwjXihTT1+J5I/LwWBCjxKyNJQYP9SUJC/SYIGbi4IcQ04QOVQIougeqFBTC0gUJTnnOipa2+
	aWxQ84WR5vuOlKOs77zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOd9b-00CNpa-Cr; Fri, 10 Sep 2021 09:49:03 +0000
Received: from galois.linutronix.de ([193.142.43.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOd9Z-00CNoR-0T
 for linux-mediatek@lists.infradead.org; Fri, 10 Sep 2021 09:49:02 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1631267333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Rz3tGDgPBAXnGujrHD1zuoc/hzbCNasdjn/vbgjqVZc=;
 b=IWXUQcggOUvVlNYQ0ipUwpR1IMWcLIw4NGD7l4EaZ0tn81gv+bURr4N24isCgrmgb9esQu
 I5NgeP7u3R1Ds9R5XEjF0c0jA9IYATnKHVOBNsvsqHopgiDXNmPlB91p8Fp70VDRLKm339
 r8RK0SkrFUO5pTRrTC3WPAMyqAoPdOKpUiVrFhXXz5K4pzpJIFIPPqx5qWC/A3UO5EuMjD
 m0mfgqv5g+MtonTiWI8GoIXHQZ2DSKTlOqRXTcvaGTaNuJRwIvwpeCO2oAe13/ycF2IfW/
 vpKApnmcNtTGdqoH8D6RiaIRnw5RGNfG4tyEVnz+e0WXS4zenc/0BBslRSabCw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1631267333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Rz3tGDgPBAXnGujrHD1zuoc/hzbCNasdjn/vbgjqVZc=;
 b=7V3YOok7yjsuyehPZ0LQi0YSZQnk8m5JfR/bGiu7fRG7aaCgmLkjnV+AQABPdnQCm3O7by
 asB7vC1BL143otBw==
To: alsa-devel@alsa-project.org,
	linux-mediatek@lists.infradead.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] ASoC: mediatek: mt8195: Remove unsued irqs_lock.
Date: Fri, 10 Sep 2021 11:48:47 +0200
Message-Id: <20210910094847.3430413-1-bigeasy@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210910_024901_242218_C6662383 
X-CRM114-Status: UNSURE (   7.11  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

irqs_lock is not used, never was.

Remove irqs_lock.

Fixes: 283b612429a27 ("ASoC: mediatek: implement mediatek common structure")
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 sound/soc/mediatek/common/mtk-afe-fe-dai.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/mediatek/common/mtk-afe-fe-dai.c b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
index baaa5881b1d48..0c2482b7ce584 100644
--- a/sound/soc/mediatek/common/mtk-afe-fe-dai.c
+++ b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
@@ -288,7 +288,6 @@ const struct snd_soc_dai_ops mtk_afe_fe_ops = {
 };
 EXPORT_SYMBOL_GPL(mtk_afe_fe_ops);
 
-static DEFINE_MUTEX(irqs_lock);
 int mtk_dynamic_irq_acquire(struct mtk_base_afe *afe)
 {
 	int i;
-- 
2.33.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
