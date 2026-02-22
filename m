Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4215C636B3
	for <linux-mediatek@archiver.kernel.org>; Sun, 22 Feb 2026 18:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KHK7FCGl4BnguL8Rj0NYb8fv6cd9/u3eM4GUsmt3U7A=; b=cB5UgF7y7AFUAGbHS7oCfZfiDA
	t1h9vVS8wmmsqU0rQeTkc/U6dd239OJmzODD+yMDT/YaXRlFWI9/kt3sbY4viGRw+vbUMIY6OX8NL
	BlWk0suQtjHvpD9hccpzrX+iJzXe/HytDzzcq4Ug2FdCZK8qlWdklFaiTgF4boZnn8KTrihqsXizh
	Y7vmxLUf1wFhOpQI7zk9AV0M9miWYYMJmRJAWAEcL7SSeIO5RKObbrVJHbZ1++Cth3I/x3oB+o9PR
	teQDKaLG/48m9vhmL+Kpq/wTD8nsa9Rt8F1tG0dobbfmiWP6XGEzOV6m5e971eSc5oScFBIwJrWad
	muRc0Yag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuE8J-0000000GrQ1-08bo;
	Sun, 22 Feb 2026 18:24:43 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuE8G-0000000GrPI-2yfs
	for linux-mediatek@lists.infradead.org;
	Sun, 22 Feb 2026 18:24:42 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-354b79a9ad5so1505207a91.1
        for <linux-mediatek@lists.infradead.org>; Sun, 22 Feb 2026 10:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771784679; x=1772389479; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KHK7FCGl4BnguL8Rj0NYb8fv6cd9/u3eM4GUsmt3U7A=;
        b=GOuMQKRG9mHiVG+33ffVSMSXoi9XBFx7tlBIK/P3AXqS83o25969ieNHmqf5FOJzCj
         FPJR37EwFZGrrtNIitUoM/4Qp7ikyAscLY+Srq0wqs1pbwoodljenrmyolI4UslbRkkX
         AcSxdL/+7af3noXTpbjnVuccYPNXCBBypfefCHCqvBbHp1pqE0Ell3pL9L91vMV6S02v
         4rid7goUFQsySAWeCAr8Bo4aGBPoDM+43vWke5x08oODPtgxaYflGdizwCVg6NasbK4I
         HQBHmPf++0uzoyBG0IE/EypayGIOZ9S5am+D6hi8PRaxjSyyqCbWjpD1o/yYNLiMQeBd
         dbFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771784679; x=1772389479;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KHK7FCGl4BnguL8Rj0NYb8fv6cd9/u3eM4GUsmt3U7A=;
        b=jUd0dl0qvlIlxMuJAhjjpD1Kkw8LfamrF3lHApCmC7RgNhJfrOpCRDE9W9INzu7yUk
         LzIIqcrWnS8da6mvLCitqwJb1RMps36R57RVmjbV6FcsXvWCf86a1W8DNok+hHl4jgwL
         b23E+cVxvFSw9uywdS2FSssi+XxLvnWCZ+Xzkcl2+X41QK4jkUb63xBtMvjJjAMtMuhY
         /1wFAtFD3Y345oH63XbdbhwoAfQw9xXNOyR6Kf/jsILIMBUzgnbuPtawGAyiqrBxZl7R
         alhwXi6TGhvd+YGBrOhKgDSBgKITNcOGJ1UkKQ9+eqbcozKF1rcA4Ey6Mr7mwoV9H2z+
         2DGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqThsiZSY7Jtt40XtEnoC4J9RCb/CZojdfBEG6s94qxA6EEdt2STl242k4GbpyflxkCXXxW5eArNpIno3qGg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwMEVKIUKakud4tRcmeCofw1Invs9K7yg6PnQCbegFTLe6JCkHz
	ct4w0RpY/GkWdXMS/W/3dFmJbwpbQK3/Fg+N+gTDHq2qqsJWym0Ls40q
X-Gm-Gg: AZuq6aIIcqvbztmMNn1C7EBvCELiGxCCODXNF2wLTQR1Rt2RzgdFkW1cdnw+l720FUy
	VAps/Op3rt6RSno6DYZvTrk8kUzYDJBm4zf8pLE5W0MZVPd0dCRFsGlRwml4Bqu1P0uTWBL6f0t
	Y3iHQZFFvUUav8LBmvgOCiXQ7Alcm0BvinKeDqcWbzKgNOkmuISmtlMQb+YEVrquuPgkoTR+Ate
	2EGJhP+vTzRF+/U1B3/IbAHOBHSQdJPjJ2fI/80NbjCFtv34Xm+3T5W7j4LFc05ytoI749MfK6s
	U1a/rCfU/286FvamBiPVg7SfgwvsmPLQDVmRkXEJCyDzsEq+l56X2MPaVo0/VrDuP1pO6GPpv96
	gyN5l+pTho2ffUPTLICwHBsCP6Kd5bcydCgR6LXHgaclEBSYcs0eI0q7UY3dv+YhOyrrNXP5+7i
	5rqvQBimkNdke4DrwvygX60MzcO4bKl+xwdA==
X-Received: by 2002:a17:90b:3ccd:b0:34c:35ce:3c5f with SMTP id 98e67ed59e1d1-358ae7c960cmr4676492a91.5.1771784679131;
        Sun, 22 Feb 2026 10:24:39 -0800 (PST)
Received: from junjungu-PC.localdomain ([2408:820c:9008:ba52:1:8bf1:8197:6d5f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3589d8e3edcsm8393549a91.13.2026.02.22.10.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 10:24:38 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Mon, 23 Feb 2026 02:24:34 +0800
Subject: [PATCH] regulator: mt6363: Fix incorrect and redundant IRQ
 disposal in probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-mt6363-v1-1-c99a2e8ac621@gmail.com>
X-B4-Tracking: v=1; b=H4sIAOFJm2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDIyNj3dwSM2MzY10Dg+RkEwOzREPD1GQloOKCotS0zAqwQdGxtbUAcyt
 9CFgAAAA=
X-Change-ID: 20260223-mt6363-00cc406a11ec
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771784676; l=1500;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=i93NP6QYfj+ybZpEhaphKCnCCgbg1xiHxnblnb3wK/A=;
 b=Z2IFGz9lFdw34b1ycUw1uJQ1YaF0x1uytXWzC5R46Rdq8PrLz81oxaOdnmTI1gqQ/CGZhh070
 +hS2pHn0F53CP/TCOHaGHDBRonIlYjShXyrnVxPJyTD8F5tCYAWoR8K
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_102440_821972_6FA09C61 
X-CRM114-Status: GOOD (  11.50  )
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

In mt6363_regulator_probe(), devm_add_action_or_reset() is used to
automatically dispose of the IRQ mapping if the probe fails or the
device is removed.

The manual call to irq_dispose_mapping() in the error path was redundant
as the reset action already triggers mt6363_irq_remove(). Furthermore,
the manual call incorrectly passed the hardware IRQ number (info->hwirq)
instead of the virtual IRQ mapping (info->virq).

Remove the redundant and incorrect manual disposal.

Fixes: 3c36965df808 ("regulator: Add support for MediaTek MT6363 SPMI PMIC Regulators")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/regulator/mt6363-regulator.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/regulator/mt6363-regulator.c b/drivers/regulator/mt6363-regulator.c
index 03af5fa53600..0aebcbda0a19 100644
--- a/drivers/regulator/mt6363-regulator.c
+++ b/drivers/regulator/mt6363-regulator.c
@@ -899,10 +899,8 @@ static int mt6363_regulator_probe(struct platform_device *pdev)
 					     "Failed to map IRQ%d\n", info->hwirq);
 
 		ret = devm_add_action_or_reset(dev, mt6363_irq_remove, &info->virq);
-		if (ret) {
-			irq_dispose_mapping(info->hwirq);
+		if (ret)
 			return ret;
-		}
 
 		config.driver_data = info;
 		INIT_DELAYED_WORK(&info->oc_work, mt6363_oc_irq_enable_work);

---
base-commit: d4906ae14a5f136ceb671bb14cedbf13fa560da6
change-id: 20260223-mt6363-00cc406a11ec

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


