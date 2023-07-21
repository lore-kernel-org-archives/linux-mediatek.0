Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F09CEB64DC
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jul 2023 13:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CtlyWn2I3ogc2VsptqSvO9P1T5RQycoIkTmKOHueTBg=; b=i2vbLRkC1etLQ6QE624m1OONol
	paT9GuDbTOUX54wLca46+TgV+vb8L08kAEIybXTtqWAdS+eDtIUQTx7GZ4gxABNuD8bf211/hfeuk
	EWsTv6vTg7BADTk5WRBT87w7eARAO4X9dLJnTJA/5PuXU90wfSk2SvEyJ9edingn8dwRp4qynBvn9
	2Dksw28CuHVuhBoq/u+MJi/IvMabRj5Nnl6goWiSdfVDP4UJQDTGE6pDKMcObM/9X+w5KwOvyrFF+
	9T8t667d9iPTJw3+YGtuFPWjWNGjEadwzCd+SchAlL+VGYEFz+Teg1tqMTIHG/RIjxrknIQnRXbKU
	4p0Z14Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMpsW-00E6pf-2E;
	Fri, 21 Jul 2023 13:09:04 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMpsU-00E6oO-1A;
	Fri, 21 Jul 2023 13:09:03 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4fdd31bf179so3111667e87.2;
        Fri, 21 Jul 2023 06:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689944933; x=1690549733;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CtlyWn2I3ogc2VsptqSvO9P1T5RQycoIkTmKOHueTBg=;
        b=S8PTRVUMNu8G4Msql+QdzSAXokDbUKFUuzdDgIlBAjtRnFSD1ZQSop+HhaiOkZ33VJ
         9cmr14AoKtGPPl7TIRE4XATfTXThA8ZmVQyPrBvZmKRd8P3vihO0ZVKQFNRfBdz/p6+p
         FmbHdZo2zhe0WVn7XA4PyyUITo7Pu129O3HmSGMAgpdW1bupOTSkFYCSFj+FytORoElR
         QxvIfTAw1ZNQoiscEAs0udy/ZZIAd93tGtHWlAVBWmIm7UewZjaUQ3rMK6f0HLZecFgJ
         ugIrycFAnq0MRIMihz6GFJ8Z3J4Cye2/Sru3s6hgOg3j25nIgfaQMX+lgjPK2oTaEAw1
         9IwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689944933; x=1690549733;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CtlyWn2I3ogc2VsptqSvO9P1T5RQycoIkTmKOHueTBg=;
        b=ghwLw+utehjryFdWhHAcW9L5crEMyMNOySgSVpdqd5De9W5i5u5W4c/uHEZjjCsYwG
         65EILXVqSrIiakaev1kHYYRWDYOEHFDef42fGWT+M1G88VE8sIMKMsKiDvprev9zFLa1
         3tcagIaI8pS9B6b0nuGaoWqg4Rp72rJ4skrak7jSYVUcGpyaX/vBAxeFJ2DAPN+XVCUg
         paWyjrgQotASzoY6JPWlo6vbcaXgEqZwgFSTT/BP4z/y1gKKtmfzwGFu6U1cIlsAwYAg
         Slyp1ZpCDUrAXVNaHknCJHl088NQJ1zMqb7j+ubVa92d24VNP13VLrKcKRnwkYRj5tVj
         jX3w==
X-Gm-Message-State: ABy/qLb5bRNt3SFq9A9jvZOcpNPYg3ftx/6+jprsP9bE2iKj4wO0I88N
	spu0e1+BI9/EAzaJQs5OnuqMoDlLZr3GOw==
X-Google-Smtp-Source: APBJJlGWg54hXrgHwtVxHtuUFDOm84BpYP/EqgGmtO39iCY1GtfP9Z2VtWTVC8s94tfgVprnEgBW3w==
X-Received: by 2002:a05:6512:3243:b0:4fb:7666:3bc0 with SMTP id c3-20020a056512324300b004fb76663bc0mr1141674lfr.47.1689944932468;
        Fri, 21 Jul 2023 06:08:52 -0700 (PDT)
Received: from localhost.localdomain ([92.85.190.61])
        by smtp.gmail.com with ESMTPSA id d17-20020aa7ce11000000b00521d42fb41asm2087154edv.67.2023.07.21.06.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 06:08:51 -0700 (PDT)
From: Andrei Coardos <aboutphysycs@gmail.com>
To: linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: angelogioacchino.delregno@collabora.com,
	matthias.bgg@gmail.com,
	andy@kernel.org,
	brgl@bgdev.pl,
	linus.walleij@linaro.org,
	Andrei Coardos <aboutphysycs@gmail.com>,
	Alexandru Ardelean <alex@shruggie.ro>
Subject: [PATCH] gpio: mt7621: remove unnecessary call to platfrom_set_drvdata()
Date: Fri, 21 Jul 2023 16:08:38 +0300
Message-Id: <20230721130838.26616-1-aboutphysycs@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_060902_400812_2C8FE6DC 
X-CRM114-Status: GOOD (  12.12  )
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

This function call was found to be unnecessary as there is no equivalent
platform_get_drvdata() call to access the private data of the driver.
Also, the private data is defined in this driver, so there is no risk of
it being accessed outside of this driver file.

Reviewed-by: Alexandru Ardelean <alex@shruggie.ro>
Signed-off-by: Andrei Coardos <aboutphysycs@gmail.com>
---
 drivers/gpio/gpio-mt7621.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/gpio-mt7621.c b/drivers/gpio/gpio-mt7621.c
index 93facbebb80e..c0c715167d9c 100644
--- a/drivers/gpio/gpio-mt7621.c
+++ b/drivers/gpio/gpio-mt7621.c
@@ -315,7 +315,6 @@ mediatek_gpio_probe(struct platform_device *pdev)
 		return mtk->gpio_irq;
 
 	mtk->dev = dev;
-	platform_set_drvdata(pdev, mtk);
 
 	for (i = 0; i < MTK_BANK_CNT; i++) {
 		ret = mediatek_gpio_bank_probe(dev, i);
-- 
2.34.1


