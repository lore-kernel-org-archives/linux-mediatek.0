Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 266D2C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 Mar 2024 21:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=61v4scjVgIk2ToFnkXS2oeqx/czO/u3CzUzarujt/iQ=; b=UdRekTcfvm1CQHmDhqwSiVz0OT
	AOxkcvaIbdgFKWdpjn90IS88+CcfanLXl77AHGiG/j5CShPe4TCGtk4MHe5LrdQYD2DBMnqQZJ07j
	YlA4f3BeJSMqVJvrPEH2Ln0pnCpv4/ob9fBVlAeJUuk6jG6ZuOuCoRqt5LSp1gmRUQQXq7XqkApOM
	XtAd3C8k4EcGqB0LfBGq0LQKoQ6HKjuQXcOownCOc1ag+y3jJMKRQyVipnTaWtH5KV91D4FapB/2s
	iFjmUFkhi4dsucndV+yG1a4ZKvgzHwZRZ5X9Yf0ApFE0UByUcVzMUHIYHdQYXT1Td8kawG1a8MP16
	a2tKfnqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqfyN-00000004GI2-2fvP;
	Sat, 30 Mar 2024 21:10:43 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqfyL-00000004GGr-1nOS
	for linux-mediatek@lists.infradead.org;
	Sat, 30 Mar 2024 21:10:42 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-415573263bfso5354525e9.0
        for <linux-mediatek@lists.infradead.org>; Sat, 30 Mar 2024 14:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711833039; x=1712437839; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=61v4scjVgIk2ToFnkXS2oeqx/czO/u3CzUzarujt/iQ=;
        b=Vmp0qob+2SrPiXTrgOGkUgmpJXciSmPjyfksgCI68NGQdIXV1gK7UeyzCk4/aIpddv
         DlME6yDRtHK811epUafNNe2BV7NtGG5Muql2fhy0Qy3scIVSeRHT0SeM9uOgJxfa+Dt+
         3haq8i4TGAmowpyzUtmualcRiobYAzbAHWgTn937H63Ubtblty320zqOUTqEmQ4T32Ku
         qPTigbxaKZH8BYznq7LJC28kjpH7IJHSwYFz/ZV981SfV3YrYW0yKGKCWTM/+yHn7dAA
         TQx6uAPT6XbTdhAR3ZXy+1dDcJjvdh5nkfMm4nrrT0fGaQfgWAVsUzjXphj646wqo3J2
         U1xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711833039; x=1712437839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=61v4scjVgIk2ToFnkXS2oeqx/czO/u3CzUzarujt/iQ=;
        b=nFPR6YxVPn1gb5iaoFULFwHNI74FcmenJUNVoq90lPAuNpkYL7FeLrdQX+8FZege9R
         o5LgLx7r6YB0KkpHN4cUHHj1vnqv/mku0OoXWPV+jC7hvb/sqkFlpAateNluNWd7+yAK
         9ReacCDvIxkX+7N7EVhOHSOSDVz34bB4QqwJ0J4tmRK599Yq54bWheAi4ZLfd0RFY5Ps
         ItgoWyoEjgcOBl07VUwlXhY6vCNr2agvq/xzvV23O11ekiwzdfUT0HBczI13ek0SLnBg
         IT/FRNARMB8mm7Gi/lorhRxnQVDnYF5X6zzScj/eabgOeZ4F7hyc72nakiulG9114WjK
         rsxA==
X-Forwarded-Encrypted: i=1; AJvYcCXk1rmFxTcD/L67nBrBx0PrJO2tZ4XcgEwSQQFZkRKD+JfVd8pAap5aba5/HmpOtXeXmsVtdYcGptG8nSIikSE1Od8r9SHXdZEuMmOUmRvgf25j
X-Gm-Message-State: AOJu0YxIK0ijbybVQVDLGUsUndw+HKiPF4RWNlQltktE0y/+cUlvQSGN
	b3pgYUu+8jm59NFdEnJHM6//WQKbYqpgYMHT8nuhu4l7lay5Oyqxuzk6Vf4GEj8=
X-Google-Smtp-Source: AGHT+IGvC5puYahyLfoRxaBZa5kEc2+uWb+/xISXFXurHNo+cizr9pJb/P/tTe/zgahZkVnF1kYg5g==
X-Received: by 2002:a05:600c:4e8b:b0:414:f60:5d6a with SMTP id f11-20020a05600c4e8b00b004140f605d6amr4142782wmq.0.1711833039552;
        Sat, 30 Mar 2024 14:10:39 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id ay8-20020a05600c1e0800b0041559c59ee3sm2758210wmb.12.2024.03.30.14.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Mar 2024 14:10:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] pmdomain: mediatek: scpsys: drop driver owner assignment
Date: Sat, 30 Mar 2024 22:10:36 +0100
Message-Id: <20240330211036.100956-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240330_141041_524933_62ABB9DF 
X-CRM114-Status: GOOD (  10.74  )
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

Core in platform_driver_register() already sets the .owner, so driver
does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pmdomain/mediatek/mtk-scpsys.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pmdomain/mediatek/mtk-scpsys.c b/drivers/pmdomain/mediatek/mtk-scpsys.c
index 59a7a8c261ed..1a80c1537a43 100644
--- a/drivers/pmdomain/mediatek/mtk-scpsys.c
+++ b/drivers/pmdomain/mediatek/mtk-scpsys.c
@@ -1138,7 +1138,6 @@ static struct platform_driver scpsys_drv = {
 	.driver = {
 		.name = "mtk-scpsys",
 		.suppress_bind_attrs = true,
-		.owner = THIS_MODULE,
 		.of_match_table = of_scpsys_match_tbl,
 	},
 };
-- 
2.34.1


