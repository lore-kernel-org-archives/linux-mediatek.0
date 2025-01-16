Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E4FE77188
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jan 2025 04:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+oUEeSVLxJyACe9zcGnIcrOr/UNqBupfY9WFzURq6nE=; b=vMYeRoSmf3lkG65eO4Fkl+QpL0
	G0Vf6SWVbkjBO9d04OaUBclkVRic5T5kfD2dbrTLBh3Xe9YMeuRQGGjY46p4QOFOkZaeaMIUdlNjq
	GG25K6Vo60mjtsqOLE2C+K2IH3xgvY0qmo9AaeNrhkaTaOkbybOgVnOypdUhOU0yRBmZaEKDeXuY1
	0FqdRrfaFJWyNvlK9A63ZH4vInixOkme9Kw2uBB25IEdevdQVysoglniZm8ZUe7nK9T5+g3s7jPUP
	w4Elh92vyToiRHHJqQGQ14RUDHuJh4EZ8J7/7zJydHZXYNmOSd0rzdGt8Kl7S9BZZkhSguhgnQCLE
	+apP2FOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYHn9-0000000Dp3P-2GgX;
	Thu, 16 Jan 2025 04:47:39 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYHn5-0000000Dp2j-3jWO
	for linux-mediatek@lists.infradead.org;
	Thu, 16 Jan 2025 04:47:37 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-21619108a6bso6749385ad.3
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Jan 2025 20:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1737002854; x=1737607654; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+oUEeSVLxJyACe9zcGnIcrOr/UNqBupfY9WFzURq6nE=;
        b=X1hyBxslUxRw2HYqeyFLwbDRPOSFTxy8nr1g2m+ndIOYNaZciGHCbaXHdGz2kj2xBF
         7jYubrWbQ4XLM0hQhoseHCNwmfiSgimUYnd5zh8E74rwN5n8eG5tAjj2cLW9QAFNbBA+
         lciBkLjCW3NPtN8Q4tSha9U3S7BJz/4+u9o9xsRQFZzRKvDk58M8zreyhdeineSKNWyR
         9IflmteVFLgA7LugvOIftxOZQq6oHgl1i2AB9dkcG8UUfSNESMmkEwflKWR5fkIrKAI3
         jverOJ0iRdQd27AULngIGhhRzTJVM4HeKhJ1PQAcpsdmpbLvhaX6ERV8Pyh1l/ZunQpS
         RtSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737002854; x=1737607654;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+oUEeSVLxJyACe9zcGnIcrOr/UNqBupfY9WFzURq6nE=;
        b=XwNwMPDFeI4opD/cQl4YVqXreZPQQsVE9wsdIN+AfE+IaXLseQredg3L+pkIldruhr
         kG7uZQzeWf2G5ZGGsRWWwpfw+evSEDCsJvaUNeN9eSKQOzuLe1iDWcJTdEO5Q+Rewdsd
         hrEmxoXzr/A66oNWVEokUOErN9advrbRnPvcNf+SzdSztZ4MZ35Wj6oFo+eNhy/+20aZ
         1JIZ+/SyNVoe/KqgZXZMMLYFFUQ9T/9aQyO2Cfhl8PJb3ez1WVECnrlYM1QBtfWh0KFW
         yBP7okKRjzfMd6IfT5La42biFcHHpCBSzMHJo5GDUbyRkZCF0MJ3HEmaUQQPBpJP3F2h
         Xzlw==
X-Forwarded-Encrypted: i=1; AJvYcCVxhKywWvcXWfBmrmEKWX2TGCrcxQJkpUqNvRMFm863Zju3NH+6WuQcPlPybXx3Pcbpl5Zr0Buq08TWN2LKnQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxJRMVn0zqYeIV2Lf6wB/xKlHJxzdLpdR5Ooz6keToES4AOrLey
	lQz0LLSYH/iCQ3PUBg+Z1vr3zruiyv3ecUx4eTxoyaUhW9oqRXSHgqtgnaCrz3DjjnK9L7LwPqP
	b
X-Gm-Gg: ASbGnctd5HYZiXA8K55InPO5R1zEKQ/rQenf+ksQ0RW1y6aqGMVPkGzei6GtYdbjIPc
	q7xbnNtZpW6w0hmGIfb4OexonEG+OLdzCwpZCmbhkO3vx4XPTYViTNeScAciWqQlw/9FLoDdmel
	7DX5G6SdM+PLUGhhijIEek+Q2VRY6FPEVyyek2fa8JYb7hG9RTvTtnbIPNTbSCHxcDB15gVYJzZ
	WjlOu4z60FDznldwuy/06e9wUa4+he/SrJNr1nFkcIthPCCJICJZtTBo+BbIkO4Hq3WYWOSAEST
	3w==
X-Google-Smtp-Source: AGHT+IGM9wfi6d8bcKoIqL+AasZgn6bnQ6PxlMKh4ZwouSG1BClEURf8U1p38bGBT8jcz4A9LPNnXQ==
X-Received: by 2002:a17:902:f685:b0:215:b473:1dc9 with SMTP id d9443c01a7336-21a83fdf10fmr490381715ad.46.1737002853230;
        Wed, 15 Jan 2025 20:47:33 -0800 (PST)
Received: from localhost.localdomain ([157.82.204.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21bc9411d96sm35492225ad.119.2025.01.15.20.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 20:47:32 -0800 (PST)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: mchehab+huawei@kernel.org,
	sboyd@kernel.org
Cc: konradybcio@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	marijn.suijten@somainline.org,
	bjorn.andersson@oss.qualcomm.com,
	abel.vesa@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: [PATCH] spmi: hisi-spmi-controller: Drop duplicated OF node assignment in spmi_controller_probe()
Date: Thu, 16 Jan 2025 13:47:25 +0900
Message-Id: <20250116044725.2946205-1-joe@pf.is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_204736_166574_D5B49273 
X-CRM114-Status: UNSURE (   8.69  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

spmi_controller_probe() assigns a parent device and an OF node to an
SPMI controller. However, the operations are not needed as they are
already assigned in spmi_controller_alloc(). Thus, remove the duplicated
assignments. An unnecessary OF node reference acquisition is also
dropped by this patch.

Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Suggested-by: Stephen Boyd <sboyd@kernel.org>
---
 drivers/spmi/hisi-spmi-controller.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/spmi/hisi-spmi-controller.c b/drivers/spmi/hisi-spmi-controller.c
index 3cafdf22c909..122140b97579 100644
--- a/drivers/spmi/hisi-spmi-controller.c
+++ b/drivers/spmi/hisi-spmi-controller.c
@@ -300,9 +300,6 @@ static int spmi_controller_probe(struct platform_device *pdev)
 
 	spin_lock_init(&spmi_controller->lock);
 
-	ctrl->dev.parent = pdev->dev.parent;
-	ctrl->dev.of_node = of_node_get(pdev->dev.of_node);
-
 	/* Callbacks */
 	ctrl->read_cmd = spmi_read_cmd;
 	ctrl->write_cmd = spmi_write_cmd;
-- 
2.34.1


