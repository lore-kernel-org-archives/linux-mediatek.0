Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D0CC77B7D
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 May 2023 13:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RM5yV3fF5gKE56bxc1cOV79hli7f8DGGaV04Y7Q5Cb8=; b=jPq3hk/O2Wua1XK5eFCsNUdiIS
	576XKbGN2L+O13ZjhiQzaNxBT8K/wgOnnW0IWWg9Pd04mSxJStvkE7Y56mVZmPgkdqfrw6xepim4p
	J9TJsAtieHpJzwMKU4MyYPvs26fLwi8FUfoFI1NS4PbhnWQl5InA7vBUUZOq+j4eGDvHqR5rDrg5N
	DdVVgyP5EEEkP7wuBXlvAO4rZYW1yktgTMDCvUBYVWiWfmOz/MAb5+TxShEMTcHJzuYuRydDktpY9
	lcYFs6d25SjhPD6sJt0/HHWlPdcDYJTBX+ZkynyHF/NeK2gr5TmMRcTxbt7IBWU8xGAxLDBTmXtII
	aA1FaKbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwk92-006Gmv-2p;
	Wed, 10 May 2023 13:46:16 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwk90-006Glk-0c
	for linux-mediatek@lists.infradead.org;
	Wed, 10 May 2023 13:46:15 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-643846c006fso7692415b3a.0
        for <linux-mediatek@lists.infradead.org>; Wed, 10 May 2023 06:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1683726371; x=1686318371;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RM5yV3fF5gKE56bxc1cOV79hli7f8DGGaV04Y7Q5Cb8=;
        b=QfVoNHjWXMTP4GR1BsI1CRB6+mtvIe2OlpcUNSt239/K+wgCQzVGXSXWl7/euDulMg
         2gB1dUuX2Xcae3Bqf4bU7j3PWIOCK/wGPLV5K0WIkQ7EOzeGtL0ZlwBNYLwHEyqFcwlO
         rN7JOUKCM/Hqg2SdHLJJcPDluwN94UGc5T0fM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683726371; x=1686318371;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RM5yV3fF5gKE56bxc1cOV79hli7f8DGGaV04Y7Q5Cb8=;
        b=larapIlXv8iT0N/sIgK6GltxDmKxPqhQr2WauyOt4HuHQXFP+iYKobWI8WtMSQYdfc
         aL400Z8LuUQAGlfDWAjhra5M6ykQK7t4iHWBoAoop3cd9MhA815JUXtZ21y5tUbmUf1D
         n8qlvUmgIZB4caNTRLJJ0zhNaAJdL7xPBxILMa1Hl8vc8u6KrSgzZoT1W7h9z9/Lfo8T
         iXfWMq4MlTRkgM4I27Oov7U6nbvAz/8te9NSdum0v9W1wKcYrfWWU91XLj3JhcSYLuSM
         KaIxhkNrWhxrWXtCDlqJpEDjKYZs/RHlx6evVXZiKpK32yfo8ktkv7qr0i6AWHR/Yxbe
         71LA==
X-Gm-Message-State: AC+VfDzjWpMRi9eAe+7gtz1FcQl2iw1y6da8S/+zgP+7dB1FI4ERiG/J
	oZp0vKqEHnTFyQJ13J86kka0/g==
X-Google-Smtp-Source: ACHHUZ7pR7D7PmBS45weghaimrr9QW7i0Q9nBwX5lYK5EAyr/YfSAnFEMC9PG2+2idXRHobnZd/E1Q==
X-Received: by 2002:a05:6a00:14ce:b0:640:f313:efba with SMTP id w14-20020a056a0014ce00b00640f313efbamr24169070pfu.19.1683726371653;
        Wed, 10 May 2023 06:46:11 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:2ae3:7297:fad0:1ee3])
        by smtp.gmail.com with ESMTPSA id t23-20020a62ea17000000b0063d2dae6243sm3545251pfh.115.2023.05.10.06.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 06:46:10 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Chaotian Jing <chaotian.jing@mediatek.com>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Yong Mao <yong.mao@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-mmc@vger.kernel.org
Subject: [PATCH] mmc: mediatek: Avoid ugly error message when SDIO wakeup IRQ isn't used
Date: Wed, 10 May 2023 06:44:54 -0700
Message-ID: <20230510064434.1.I935404c5396e6bf952e99bb7ffb744c6f7fd430b@changeid>
X-Mailer: git-send-email 2.40.1.521.gf1e218fcd8-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_064614_252616_C1634A43 
X-CRM114-Status: GOOD (  14.31  )
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

When I boot a kukui-kodama board, I see an ugly warning in my kernel
log:
  mtk-msdc 11240000.mmc: error -ENXIO: IRQ sdio_wakeup not found

It's pretty normal not to have an "sdio_wakeup" IRQ defined. In fact,
no device trees in mainline seem to have it. Let's use the
platform_get_irq_byname_optional() to avoid the error message.

Fixes: 527f36f5efa4 ("mmc: mediatek: add support for SDIO eint wakup IRQ")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/mmc/host/mtk-sd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index edade0e54a0c..8ce864169986 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -2707,7 +2707,7 @@ static int msdc_drv_probe(struct platform_device *pdev)
 
 	/* Support for SDIO eint irq ? */
 	if ((mmc->pm_caps & MMC_PM_WAKE_SDIO_IRQ) && (mmc->pm_caps & MMC_PM_KEEP_POWER)) {
-		host->eint_irq = platform_get_irq_byname(pdev, "sdio_wakeup");
+		host->eint_irq = platform_get_irq_byname_optional(pdev, "sdio_wakeup");
 		if (host->eint_irq > 0) {
 			host->pins_eint = pinctrl_lookup_state(host->pinctrl, "state_eint");
 			if (IS_ERR(host->pins_eint)) {
-- 
2.40.1.521.gf1e218fcd8-goog


