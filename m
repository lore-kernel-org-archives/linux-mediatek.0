Return-Path: <SRS0=j19f=JZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F6EBC433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Apr 2021 16:44:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0878613FF
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Apr 2021 16:44:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0878613FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QlQh9PsRUqXuFmomB2E2NDN0x2dQS3ZUtEvg94JGqbA=; b=d0bGL66lfyu7tlwN8FvFOL2Ww
	TKLfD8v2LzI3jWk7iR5xzSk0OBdjVJizUyckxLMcWOnd2X5gAQ00GZa2OHh/Yiowtl2syZSR3AgXS
	t7N+chn5jTfOzVoKL+oMVCgDebyOahPCHKeYP6FPFFH7hol+AUwX/N6gCmelwGrOXOAJ1q9yaIBvj
	0NkVuDEcgL34nCdBobXRNl798MpdR3R/4fkXltrtFuT9z6BtTp6CoV6zeJiNu8uQH1Yxlgd5knspD
	xgcKPdZ9HvJo0amoNSz+nMlppN1HqSNu7dzMbc+hzM4bNJbSG0i2NvNyz76RwMXqwE4TWh7JiagK3
	pLDeIXNlQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbnIS-003rsh-GA; Wed, 28 Apr 2021 16:44:20 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbnGi-003rH3-So
 for linux-mediatek@desiato.infradead.org; Wed, 28 Apr 2021 16:42:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=aE6tbol598vm7TcSOWd/ixIJR/NZPP5/XzZKCEl8Zf8=; b=x6YM2b96kZ8bdCiW9wSviMA8jD
 0quXOC8Asd/ZS1Nz4TvWoO8nTjr0BQQSyoV0pp4A9/2H5UmyBeTLperPKZ4YjCdLvAiprTthRKTcv
 rjtdBca2cWPyk3dH3sIU1iC8XnAEFABtTEc/A2ye/pw9q/4litPSolneC1nddxd7FxTLo8owfENJA
 OYhPGCrOprINetKhmjUbpR13LwH8fjUnsra/JZ5VeGPKRKCZP9KyXh6Xhj7OtoFUFr40UzSfpMzML
 Yx+VmxA2RgvvSCGzIrJhFxSzkEPGdy0qXw+vJ1EtiYpFKISWzl66LYpANgG04aNv/TiHpgvhCE3sf
 32/IoZUg==;
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbnGf-0001eV-S9
 for linux-mediatek@lists.infradead.org; Wed, 28 Apr 2021 16:42:31 +0000
Received: by mail-wm1-x32c.google.com with SMTP id
 l189-20020a1cbbc60000b0290140319ad207so7233538wmf.2
 for <linux-mediatek@lists.infradead.org>; Wed, 28 Apr 2021 09:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aE6tbol598vm7TcSOWd/ixIJR/NZPP5/XzZKCEl8Zf8=;
 b=J4dqcVhdcBzsqgSFLeh+i1+i5o0SxHlpn8OGQobH8KV71ucEb/6O56IXT8ve1pcz4F
 4VKoRxjcAAUGn+wTtkxSK+khCRvmSVVstBfHNcxI3I8ikMuMvedh6k54p84Ee3nOmlUX
 10ddhHbR2H1KqB2Q+YU+knIDw/qNWId1at7U/vK5K7LbV/2IYmO3Qdp+xUBsaro9qc7s
 yI8E9KY6rJGj/CpuP/xcz56ui3AnHXxkW/NTVr9C3h83kt2XnJfv++P7DNQY6qaSBbc4
 NTuwPTxqFnTRJ8G37M9Gr00xh0SmAi0p69hTXdcC0BGQmSxbC/noKyP85oM/DgNhWXSP
 yfiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aE6tbol598vm7TcSOWd/ixIJR/NZPP5/XzZKCEl8Zf8=;
 b=DmKIT6l7oTvrKyXhedvHKO0dRZXvnnHXhfmb/dNkwEPreKINzh7NyXsB1ZWvVmTek6
 B2CTbSJ9ZbKoHqEh1DWy9xtmsgoRkeTyRdr1tpVNDxc91RjWrUIg0I2GJkbnUjtnYGRe
 sYjAruGhUXY1OEMQve8W0kh8W+un40yWXWaCuSMU2VBDpAredJZysEbEPodjPPnJ5E5v
 grknULLq+l2yUVn8pT0YJs1vb1mOBjX/oyvwH/BFxUpgZHs+qzAY8294ZVHW6ckS2DXU
 U+gTpi6bE1a1Tv+M4yas+uwIgEaNf0pb1M8Y+4gjLFzYFS2Kr207nBsEY00/oZQScJ4R
 v1xg==
X-Gm-Message-State: AOAM5305sM0oO7I1aeO26SaiFXUln3Ewd4KoXkcJfFmw/18y1r7PiHXk
 Dfyg5CUPpPcsS2bM0ef/uu+Gew==
X-Google-Smtp-Source: ABdhPJyVYbQkgOcOPhTj6Vjo77V2V6rBqhdeMpvSmiZrGZE7iyBdjx+zJuPQ8eC1m25VyF+WiKW55A==
X-Received: by 2002:a1c:740c:: with SMTP id p12mr13689713wmc.112.1619628147980; 
 Wed, 28 Apr 2021 09:42:27 -0700 (PDT)
Received: from groot.home ([2a01:cb19:826e:8e00:5864:ddd1:d623:f912])
 by smtp.gmail.com with ESMTPSA id o10sm351299wrx.35.2021.04.28.09.42.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 09:42:27 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>
Cc: fparent@baylibre.com, Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] mfd: mt6397: keys: use named IRQs instead of index
Date: Wed, 28 Apr 2021 18:42:15 +0200
Message-Id: <20210428164219.1115537-4-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210428164219.1115537-1-mkorpershoek@baylibre.com>
References: <20210428164219.1115537-1-mkorpershoek@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210428_094229_916709_1D1825A1 
X-CRM114-Status: GOOD (  14.91  )
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

For some compatible pmics (such as MT6358), there are two IRQs per
physical key: one for press event, another for release event.

Currently, the mtk-pmic-keys driver assumes that each key only has one
IRQ. The key index and the RES_IRQ resource index have a 1/1 mapping.

This won't work for MT6358, as we have multiple resources (2) for one key.

To prepare mtk-pmic-keys to support MT6358, retrieve IRQs by name
instead of by index.

Note: The keys_resources are not part of the device-tree bindings so
this won't break any DT schemas.

Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
---
 drivers/input/keyboard/mtk-pmic-keys.c | 7 +++++--
 drivers/mfd/mt6397-core.c              | 8 ++++----
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index 12c449eed026..b877bf98db38 100644
--- a/drivers/input/keyboard/mtk-pmic-keys.c
+++ b/drivers/input/keyboard/mtk-pmic-keys.c
@@ -241,6 +241,7 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
 	unsigned int keycount;
 	struct mt6397_chip *pmic_chip = dev_get_drvdata(pdev->dev.parent);
 	struct device_node *node = pdev->dev.of_node, *child;
+	static const char *const irqnames[] = { "powerkey", "homekey" };
 	struct mtk_pmic_keys *keys;
 	const struct mtk_pmic_regs *mtk_pmic_regs;
 	struct input_dev *input_dev;
@@ -271,7 +272,8 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
 	input_dev->id.version = 0x0001;
 
 	keycount = of_get_available_child_count(node);
-	if (keycount > MTK_PMIC_MAX_KEY_COUNT) {
+	if (keycount > MTK_PMIC_MAX_KEY_COUNT ||
+	    keycount > ARRAY_SIZE(irqnames)) {
 		dev_err(keys->dev, "too many keys defined (%d)\n", keycount);
 		return -EINVAL;
 	}
@@ -279,7 +281,8 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
 	for_each_child_of_node(node, child) {
 		keys->keys[index].regs = &mtk_pmic_regs->keys_regs[index];
 
-		keys->keys[index].irq = platform_get_irq(pdev, index);
+		keys->keys[index].irq =
+			platform_get_irq_byname(pdev, irqnames[index]);
 		if (keys->keys[index].irq < 0) {
 			of_node_put(child);
 			return keys->keys[index].irq;
diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index 7518d74c3b4c..8738b5524783 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -46,13 +46,13 @@ static const struct resource mt6397_rtc_resources[] = {
 };
 
 static const struct resource mt6323_keys_resources[] = {
-	DEFINE_RES_IRQ(MT6323_IRQ_STATUS_PWRKEY),
-	DEFINE_RES_IRQ(MT6323_IRQ_STATUS_FCHRKEY),
+	DEFINE_RES_IRQ_NAMED(MT6323_IRQ_STATUS_PWRKEY, "powerkey"),
+	DEFINE_RES_IRQ_NAMED(MT6323_IRQ_STATUS_FCHRKEY, "homekey"),
 };
 
 static const struct resource mt6397_keys_resources[] = {
-	DEFINE_RES_IRQ(MT6397_IRQ_PWRKEY),
-	DEFINE_RES_IRQ(MT6397_IRQ_HOMEKEY),
+	DEFINE_RES_IRQ_NAMED(MT6397_IRQ_PWRKEY, "powerkey"),
+	DEFINE_RES_IRQ_NAMED(MT6397_IRQ_HOMEKEY, "homekey"),
 };
 
 static const struct resource mt6323_pwrc_resources[] = {
-- 
2.27.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
