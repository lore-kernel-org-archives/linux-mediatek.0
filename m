Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D53C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 20:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RJdJ/JDYc61OVsPQdgdyW0vXNC26F3jWod8/mfDNGoQ=; b=q3ihnfl7p4b5Vm
	ofE7hGz4gdQ0OyfdnEN8cvYPhSQFUw77uV7599iw//zCzr5J9upLp5ldvFnlZOmsWX3h1ZdJtMPyi
	TLAMclKgoldlVPaz07nHfb6wB+WDrc0Xo43Ena91ky/Llq10cxVMlFyatPSEDrmoqJdTdN8uUU8b0
	rFrucoBiHY9+RT4aiaiqqo33nGfAXJvoORI8Ly0kjdMZmKIOe9saBr5eO61uxml/qzspMuoXy2HFL
	Li2YD/DH+vRyg+4Off6Ckm7NkoCkgaQZsSLc36/iCttuPJKP25y7DbOUzQetAoLGucQovGwlMWS+E
	ra8oJ1jrWCCXPCYTIaGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvluJ-008C9h-Ds; Mon, 30 May 2022 20:22:31 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvltj-008BwF-0R
	for linux-mediatek@lists.infradead.org; Mon, 30 May 2022 20:21:57 +0000
Received: by mail-wr1-x431.google.com with SMTP id q7so5068456wrg.5
        for <linux-mediatek@lists.infradead.org>; Mon, 30 May 2022 13:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=L1vM38OHwAw07wuSGNIKDmB9lfDMUrNeDwo+6N+zaQs=;
        b=rbdYWKHYaxO3Oo8biiJo4zPn/Ul+w5RbkvyVOEB3/4mnXnlGjHkQehTA3Koq7wkzna
         FanKAs5XeFi7bavoqnYVyXkGtIJPIdz1+W1Nm8pyYiizUkUEFFw2pkjPoQl2uq6c9/z5
         nSjTLmzejeBhrDY4LRaF1mPc7TLZboHRNtzkdVCZAYdDl8Tw1T1NXswiZGzXbcHfoePd
         uFR+KgaUg1jZpAie1lzpXFgk/wiMyjpTZdAZ5Dmq3QX0LgO3CAmoNXcqRjRrVBXUeK9q
         othnVsbT+f1fp5rxwduR7JhVfhUemm9rQOBeheHbp9zfpzNfinf4FFdNzteofmqhara0
         hCIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L1vM38OHwAw07wuSGNIKDmB9lfDMUrNeDwo+6N+zaQs=;
        b=dqE6l76Mfb+CDM3C2/9uNkAGb5BwOBpp3GJDoLaGEDo2/5XXnt7rt7sVv3UjRClInc
         xcjjYwHQfZcaDZ+azomn/+cvcNZtjXVQxVjEKjasJ0s7717RP6UPZSQ00FP/CE3vzgiC
         7+tWtCZT3Fvy4YYi6ogdqI/d70/iRJK61QhXLftCUAcaohiwFXHOoa0ZBTLtscL1iSy2
         vrwjBNiubND2YKnTeWxLzAuwH1UsMpFGgxSkV3UQDZJ8fKUJT+8dVO9TdS3bQaBjWYsn
         oiGZUPyWEGUQlzaOJSv7vPB6bbWXsTYIuVJjIwwGKJLImgbjDr+MSOfC1l45GvG4Tlos
         rMTA==
X-Gm-Message-State: AOAM530Z8aaQftUgulCpIkyTjZlQklEg+OPYwsRfVZqbOFt+dCVPruDQ
	AFGQskJPewv93MX5L2uqDr2CpQ==
X-Google-Smtp-Source: ABdhPJzqnMXzNaCigIjz1GAjTxyI8tshTxFw9D7Ucx2lKOehy+yE5Khqw9vdo4X+p+YlrV2WOmcARw==
X-Received: by 2002:adf:fb04:0:b0:20c:dcbb:95bc with SMTP id c4-20020adffb04000000b0020cdcbb95bcmr47590696wrr.393.1653942112182;
        Mon, 30 May 2022 13:21:52 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id q9-20020a1cf309000000b0039754d1d327sm261860wmq.13.2022.05.30.13.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 13:21:51 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Lee Jones <lee.jones@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>,
	linux-pwm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 2/2] pwm: mediatek: add MT8365 support
Date: Mon, 30 May 2022 22:21:35 +0200
Message-Id: <20220530202136.906407-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220530202136.906407-1-fparent@baylibre.com>
References: <20220530202136.906407-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_132155_098804_DA7185EC 
X-CRM114-Status: GOOD (  11.07  )
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

Add support for PWM on MT8365

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 drivers/pwm/pwm-mediatek.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
index 568b13a48717..fd586bc51c5f 100644
--- a/drivers/pwm/pwm-mediatek.c
+++ b/drivers/pwm/pwm-mediatek.c
@@ -294,6 +294,12 @@ static const struct pwm_mediatek_of_data mt8183_pwm_data = {
 	.has_ck_26m_sel = true,
 };
 
+static const struct pwm_mediatek_of_data mt8365_pwm_data = {
+	.num_pwms = 3,
+	.pwm45_fixup = false,
+	.has_ck_26m_sel = true,
+};
+
 static const struct pwm_mediatek_of_data mt8516_pwm_data = {
 	.num_pwms = 5,
 	.pwm45_fixup = false,
@@ -307,6 +313,7 @@ static const struct of_device_id pwm_mediatek_of_match[] = {
 	{ .compatible = "mediatek,mt7628-pwm", .data = &mt7628_pwm_data },
 	{ .compatible = "mediatek,mt7629-pwm", .data = &mt7629_pwm_data },
 	{ .compatible = "mediatek,mt8183-pwm", .data = &mt8183_pwm_data },
+	{ .compatible = "mediatek,mt8365-pwm", .data = &mt8365_pwm_data },
 	{ .compatible = "mediatek,mt8516-pwm", .data = &mt8516_pwm_data },
 	{ },
 };
-- 
2.36.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
