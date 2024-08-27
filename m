Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD0CEC54731
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Aug 2024 18:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WF4VTRtZNd3clMftLMxr7DHg+OlI4KSvYXGAf+Bu+yg=; b=wyOcq8SeQHxR1YXZdk20pQ5nUY
	90c0Q2QiGen7aa0hKilpBpFtxGN1Z4hC6Cke0NN5XHAzjAyDW35IrIqLdEmGY49xKcTrvO5y6YueN
	GO3To5kg3p+lPTc5LUIQ9llyk5XLKj3Ku7kEYi4v1zG+jA2FfWwgClkG2rbRjmUd5vQoMSYS0/6Ja
	R8E1+tCTYiUGTADc2XoxZ5KjWnocNn25NKGdw+gFZl+OR6qVN/x9u8go9KkR55AotSVRnbb/3ESqc
	+Zw/Bd2yHEwAERRblE4UjCRHmGbb3rv5srAUuzmHPp2ZfcIVH3EVmsiavSsh/6VNsCWLmAiwLEbiV
	biVq732g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sj0Vv-0000000COfO-12fi;
	Tue, 27 Aug 2024 18:01:55 +0000
Received: from mail-pf1-f174.google.com ([209.85.210.174])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sj0V3-0000000COVK-2t8f;
	Tue, 27 Aug 2024 18:01:05 +0000
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7142a93ea9cso4130103b3a.3;
        Tue, 27 Aug 2024 11:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724781660; x=1725386460; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WF4VTRtZNd3clMftLMxr7DHg+OlI4KSvYXGAf+Bu+yg=;
        b=MNZGe1ZvRGKq3EWqWwDQ11b8hwAQrqY5VfbGcSso13tQ5ucoTvgBGmK9JqowWs2O50
         qPPPs4U1Tq3FqukxfdEEOa1/Sv95Ysv3+V++EdiNWWBezw/VvIy+AO+dZDkps6et7wWh
         KGMvMYT/1mrvMPr5Ofg3xNbUjC9WhrYXs0XNh92sIjO7qioOE7tOgFoI5NULa+1gVV4+
         7qVzMxcRJ3MBAYjz01pU3eWh8TlnjsQBZZyqctaEd0e9BxzylDYe+Ykm2ZfsjNTK2lHw
         ERqBBDvtWRdJCO4WQBnasx46bHVbSmlRe8VVWOBhnULQSkcUelUbyndag5gpH6nryYKO
         60zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724781660; x=1725386460;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WF4VTRtZNd3clMftLMxr7DHg+OlI4KSvYXGAf+Bu+yg=;
        b=NZkbmMRKp6LbIw5pMrZG6GC1Fp1g9uetDhqkC5kQFVHe2v7n4exQ+mwZjvus6r8or+
         MPrhKSOrQwhYIjIjPhjlxSZbB8Yr9y84VcmEZFY8MENLd3nNiHTulEMGNbFje3Jz/naV
         Kw6BDnGpuk7qYV0XhfOQrhye/wUZDRMfklSLGFjSAzg682tjAmfFDv5ZQ5F8vjbG089H
         C7U3DIgug0eiHOOlsM3m2Mt2gcWlZbrRJqPQ/WNNIVUn4w+MODQyo0xF1aRpdmzJRc23
         fh3FB3i6vRaHv0JCZ5Uo/V97he8PAdyjY/cxyD5E9Ud0jdfGZZKNIx7ZIL1UVnx0Wns5
         9d0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVkeEkEeXYkCuITMnETtaRQQQ+ogULESIeFIIuihwNUwmNWtG7/CDR3Ay9VxVU+Vf1JPGMuVV05IRhog9Mn+esb@lists.infradead.org, AJvYcCWjFoKthjMzjr2k+OpLwj2268cqCwpnWe/zvNd+WpnuSIqJL2pXWLForB95RW1Ue2alRR//8yMov2hYuWHfQTg=@lists.infradead.org
X-Gm-Message-State: AOJu0YyKP9shiWCs1ESBLZQOV/taWtIbRusCt/bhQgPnm9tml+/QQwID
	fb7p2YEByxDrETn5IsxJWJdWr9hueP2P3cGHlb+ctVREFKuQqCl0
X-Google-Smtp-Source: AGHT+IE8LnpOrHa2Dd6gdAWN/kM8M6D91dSPSnXXq8Wrs/MmG8w2FcHhVbQRORX1zNnNtBCMUDMWHQ==
X-Received: by 2002:a05:6a20:9e49:b0:1c2:905c:dc2 with SMTP id adf61e73a8af0-1cc89d6bab9mr14937066637.15.1724781660186;
        Tue, 27 Aug 2024 11:01:00 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:95c4:e75d:161d:a90])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-714342e440bsm8811619b3a.124.2024.08.27.11.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 11:00:59 -0700 (PDT)
Date: Tue, 27 Aug 2024 11:00:56 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] Input: mt6779-keypad - use devm_clk_get_enabled()
Message-ID: <Zs4UWGKt3hLjNmoP@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240827_110101_753685_94337FD2 
X-CRM114-Status: GOOD (  12.93  )
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

Switch to using devm_clk_get_enable() helper instead of acquiring the
clock with devm_clk_get(), enabling it, and defining and installing
a custom devm action to call clk_disable().

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/mt6779-keypad.c | 18 +-----------------
 1 file changed, 1 insertion(+), 17 deletions(-)

diff --git a/drivers/input/keyboard/mt6779-keypad.c b/drivers/input/keyboard/mt6779-keypad.c
index 19f69d167fbd..c13880103429 100644
--- a/drivers/input/keyboard/mt6779-keypad.c
+++ b/drivers/input/keyboard/mt6779-keypad.c
@@ -92,11 +92,6 @@ static irqreturn_t mt6779_keypad_irq_handler(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static void mt6779_keypad_clk_disable(void *data)
-{
-	clk_disable_unprepare(data);
-}
-
 static void mt6779_keypad_calc_row_col_single(unsigned int key,
 					      unsigned int *row,
 					      unsigned int *col)
@@ -213,21 +208,10 @@ static int mt6779_keypad_pdrv_probe(struct platform_device *pdev)
 	regmap_update_bits(keypad->regmap, MTK_KPD_SEL, MTK_KPD_SEL_COL,
 			   MTK_KPD_SEL_COLMASK(keypad->n_cols));
 
-	keypad->clk = devm_clk_get(&pdev->dev, "kpd");
+	keypad->clk = devm_clk_get_enabled(&pdev->dev, "kpd");
 	if (IS_ERR(keypad->clk))
 		return PTR_ERR(keypad->clk);
 
-	error = clk_prepare_enable(keypad->clk);
-	if (error) {
-		dev_err(&pdev->dev, "cannot prepare/enable keypad clock\n");
-		return error;
-	}
-
-	error = devm_add_action_or_reset(&pdev->dev, mt6779_keypad_clk_disable,
-					 keypad->clk);
-	if (error)
-		return error;
-
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
-- 
2.46.0.295.g3b9ea8a38a-goog


-- 
Dmitry

