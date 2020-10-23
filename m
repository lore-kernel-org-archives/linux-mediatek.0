Return-Path: <SRS0=bV6b=D6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7338FC4363A
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 12:30:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D25B120829
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 12:30:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mxqDsU7F";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="1sfZ/A80"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D25B120829
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gS1bg3wUv7orOFipOVT2thcx65QV7Bg8SIIcFlbFJH0=; b=mxqDsU7F/dozk02oAnrICfIRXF
	Dkn8HYkTTf9RZRfJaxXoC5BX4akFXwuYq+zLyQI/v6mcc6FyT5QAToWbwveyHjYvFL/Z/OkPXstnY
	gC2V0Z10HqqCoP6EcR3s2zzlurWPtQYBDB2Wo9JZD2hcPiYDP5vxefjJb9+s8VJZ4ozAaYrogEkED
	nGPjiAtV5x/3AJr8i1eSJLxJkGBfSp8/eB4QxUlu2zak22bbfa+OS7trRgsGMqCOngOGslzZv48AC
	CBtPq+rWZjitYaCFUBqhmglY+t4eYcbH3LMQLUfN/x55TOrOlFWIO2y2lMn3DwQybMLqSNFffT1p1
	SjHVD6Vw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVwCt-00031X-Fe; Fri, 23 Oct 2020 12:30:07 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVwCk-0002wy-5J
 for linux-mediatek@lists.infradead.org; Fri, 23 Oct 2020 12:29:59 +0000
Received: by mail-wm1-x344.google.com with SMTP id k18so1312664wmj.5
 for <linux-mediatek@lists.infradead.org>; Fri, 23 Oct 2020 05:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7rIF8N/i8VFiSPcWy7t2VnCvFrWFZsMucLJqXY/Ky6I=;
 b=1sfZ/A80DOJRkuDn+aMTJEqRnTd7jlDaBzl/CTej9gD9qfX1ZXXwxvI9nL7Mhm2zCy
 ppp30/JsZrruqfWCbWJvNoRaBZqiukoFqxkMsDnWCvp3OOvc8RXTvrYb4BM+JnII9wtx
 vuu8zwt4MUCheX8x2ne4bex/JPdNTKobo4TXdbwrB2OkXP1PTIPGeUdA5qxC6TEgw/2H
 io/sCFvCAYFZj3Nvg8qIEhdXdn4scXwM0VjR2jviSTN4KdxZXtJiSwPSp6T9HPcA0GSX
 cq9+t8tjpmvOZQz5iYSwz2ArAQ6dTVS3ILRv0D67dVDYJqX+xgfOIBbSY3KgeA6k35I2
 vY/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7rIF8N/i8VFiSPcWy7t2VnCvFrWFZsMucLJqXY/Ky6I=;
 b=FDGSiiy8kJnRpjlJzyJ29piNiwXWQeLNPOUDSfz8gXf9Jqva073y1A1i0g3KXjUmCd
 6qt0kAf2AXqOEinO3HkvawjcoWUbb1GoB565saTLIcWHNU9hXyjfJILXs2CJK7IhMRKf
 5pJSw0qTk/uAZF7KGNEfu5PwoXYaG7o+mgMVrQObNhLFzimm4kqse23g9TzrXbISGuDH
 hEubulLNE0V3t1XMiwQrc+y9BBvs3E8w13pOGO+PAxRiurZLPCdLWahkI9Kroirp0OTU
 p/3LVfQp4C5jBD2m5DEcCyiHNnKO3KXJcP+9BaHWGFXm8kVeXJ9b6vSsdDNGkz3EexXE
 2Paw==
X-Gm-Message-State: AOAM5320THRqTkNlggjruz1RPEzMW2CwmSosOJfwjEtc1hdxEBoLGl8r
 /PmJog09cSNraiuvxVmxpsUKYg==
X-Google-Smtp-Source: ABdhPJy8hebC8ysED7iakQTxAZEuNSTOYysF1RdKWxwQs5f/GemG//s/NvSNRjFXup1EEZ3JM+edIw==
X-Received: by 2002:a1c:2905:: with SMTP id p5mr2116034wmp.187.1603456195733; 
 Fri, 23 Oct 2020 05:29:55 -0700 (PDT)
Received: from localhost.localdomain (211.160.185.81.rev.sfr.net.
 [81.185.160.211])
 by smtp.gmail.com with ESMTPSA id z15sm3138527wrq.24.2020.10.23.05.29.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2020 05:29:54 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org
Subject: [PATCH] mmc: host: mtk-sd: enable recheck_sdio_irq for MT8516 SoC
Date: Fri, 23 Oct 2020 14:29:50 +0200
Message-Id: <20201023122950.60903-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201023_082958_238676_B645FB85 
X-CRM114-Status: GOOD (  12.58  )
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
Cc: matthias.bgg@gmail.com, Fabien Parent <fparent@baylibre.com>,
 ulf.hansson@linaro.org, chaotian.jing@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

MT8516 SoC suffers from sometimes losing SDIO IRQs, this makes SDIO
devices sometimes unstable. Make use of the new property
recheck_sdio_irq to fix the SDIO stability issues on MT8516.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 drivers/mmc/host/mtk-sd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index a704745e5882..3dc102eefe49 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -524,7 +524,7 @@ static const struct mtk_mmc_compatible mt7622_compat = {
 
 static const struct mtk_mmc_compatible mt8516_compat = {
 	.clk_div_bits = 12,
-	.recheck_sdio_irq = false,
+	.recheck_sdio_irq = true,
 	.hs400_tune = false,
 	.pad_tune_reg = MSDC_PAD_TUNE0,
 	.async_fifo = true,
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
