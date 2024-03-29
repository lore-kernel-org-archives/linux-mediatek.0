Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4683BC6FD1F
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Mar 2024 17:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Roqxke+jisLthE7YZS3ozhXKeGeqrvDxoYL7VwBZiOM=; b=SLUIX3WqBEldYvG8tDxEOfDizn
	AysSqBrUgOp3N6VLewrqZnZr6vGqMAZXptmwhs6SmpiwAWs3lPU1kuCFsggvhqLkZUc40vlRKXGcK
	pcHYVbix3VPlfD6TJpcqKSqeF+Q5QVV0fZZKS4CGf4X643Jw8eTt2uX6ZUh3BlKzvGicqyo7H+xO9
	kjgMeBObaz+Ub7ZPY6C8tOcTE4VxVXlitoAiig/xfhIQ665eZVIv5XaZ11DYnitej5xm7Ri4Cdcg9
	Jze82JISOzAT5CtL8qI/SIoLdk4XQg7GxzjtURkftziekL3XvkcN4hUTGhZf7kJ37PRBhgGy8rm8l
	5npyYvsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqFzF-00000001TCK-2wwQ;
	Fri, 29 Mar 2024 17:25:53 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqFyP-00000001ScI-1X5H
	for linux-mediatek@lists.infradead.org;
	Fri, 29 Mar 2024 17:25:03 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-41551526477so3671945e9.0
        for <linux-mediatek@lists.infradead.org>; Fri, 29 Mar 2024 10:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711733098; x=1712337898; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Roqxke+jisLthE7YZS3ozhXKeGeqrvDxoYL7VwBZiOM=;
        b=X+5UOEmBroOcrAsWAjPZr6wczN/wdLp0CR5tWUeFPVyUQRTxrJfBqE7qIQGWm9QQh3
         Cd11d/mykwW4PUvRrPEwyrXIU8GqXk0mgLSmpEXfjDs6uZLCKLM1tIZQUp3PMzb77lKw
         3GFXSjXBpTpIqrrFh0gA/Qke29UjUwjLejOt8CAgtCTp6OTShVV2SNNR96daXbVTm49x
         wjyJbOYULIOQ7UCcj6O6qFjLAZvjocJLFvFJ/IQqJOGO3lzdYhVxmd7PZg1KaG/H7hvC
         aeYqVlcvpHlPOqGb9xoGPv+uaf4V1F/rrHyYp/BDfiwlBHBq0fitRbFxn8XzeHahRkwa
         lYDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711733098; x=1712337898;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Roqxke+jisLthE7YZS3ozhXKeGeqrvDxoYL7VwBZiOM=;
        b=V5AhS0ucAzGhbHtvRT1e4Ie4bmpLkqzwOAOrJBR/kxF48ouHhFaf9X806JMRhU/4Ku
         NW59kXjLEdSlT/2QDjRHONklkyUEC/1WHMoLmL8UpG56GsCfYYCsbfo6FnBl05ZA9aL9
         +uafxlqD22Nhv0AbyorrUWtY+r9Ze1yaJVUWwpY/f6WbU6nzzHOCr6uCfo3/CLfXVfdw
         7pW3FDDWcmnAouEaMKqus9OSePPvjRmjoAbKGyrW5xiBLTI45KZPUTkYFlkzBBgTqs5C
         zWKBFZoaWX3siyRCmXiP8XVZO831hw4dQY/yHdrJG52cbe9JWbMpGPkQR3QlVofjWoAQ
         +jcA==
X-Forwarded-Encrypted: i=1; AJvYcCWrQta6MlsqBRQKtoTuy2Y0nli8Kc86W4Y8pT7cP7j7F4LzkuxK8Xx755qOOKv5kAsLH46hCrlrvs7rMBKwQoIzKWptV4+eSDnBuzSbfXPuAyjg
X-Gm-Message-State: AOJu0YyJRi+y6Lq4SFVG0ekEmll9V12oLDEI27TkUlLIhkm6OQDu5LAA
	xdyEcHF9xMsp0cN5Al78PMIP1cpOj7kfOrhpLe3tB40Zxy8OaIuffdAp23J9Vr0=
X-Google-Smtp-Source: AGHT+IHX1RYKXweNoW/4aWXP4wll4zlnxIIegaGH0ndDYfOaiowD/kZKctfWDkTRS7cSWKil7XXIoQ==
X-Received: by 2002:a05:600c:3556:b0:415:45ea:9922 with SMTP id i22-20020a05600c355600b0041545ea9922mr1810546wmq.35.1711733097986;
        Fri, 29 Mar 2024 10:24:57 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id v8-20020a05600c470800b004149543c82fsm8491069wmo.39.2024.03.29.10.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 10:24:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 29 Mar 2024 18:24:36 +0100
Subject: [PATCH 6/7] wifi: marvell: mwifiex: drop driver owner
 initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240329-module-owner-sdio-v1-6-e4010b11ccaa@linaro.org>
References: <20240329-module-owner-sdio-v1-0-e4010b11ccaa@linaro.org>
In-Reply-To: <20240329-module-owner-sdio-v1-0-e4010b11ccaa@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
 Arend van Spriel <arend.vanspriel@broadcom.com>, 
 Brian Norris <briannorris@chromium.org>, 
 =?utf-8?q?J=C3=A9r=C3=B4me_Pouiller?= <jerome.pouiller@silabs.com>
Cc: linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-bluetooth@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org, 
 ath10k@lists.infradead.org, brcm80211@lists.linux.dev, 
 brcm80211-dev-list.pdl@broadcom.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=792;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=nydkRqQqfWxB+bwGXT+pWOUlUp96ndfzIb+plXc0Luk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmBvlbB3ikwQPsoocZuYMqkRrpjcu9xVmLzCYer
 i6ERPR5OLmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgb5WwAKCRDBN2bmhouD
 1xrED/9h7qikJ7wiFUT5mJeAPPb56pHQIR3znbanFDO8iSSWRpJqkniw3tF0vuvMayv8QUnMn8k
 gbqHlF+enH3aqH0STc32gU582CkuZAI3UE2s3B5cQOYtxyDqYLA2F8bllNV3XEAABvOErLxU02x
 CJdEx6q0e+XPHvbxjfDX7r3Umv50WsrfGjtvLJVVRYCqRHMXei+5w2VrOILx89PegmnLbMZ6vn1
 oBTzHypnSTmhweyK2O/o+7mfO5WZ2azj6PNiBVPCXh+Fu1ENwjnJCUE8pfB2k7e8mxPK3FXQ6Ph
 njBzMk5BNW+RPXqN+yMOy+cC2wievLZtxKFVAca32Psvq5KbdZb48tOkYI5grOkigkFYjHzX0yK
 3OpZj4z/mB5A/Ioe3NYSq0tuvuEyYT+2IAC8DuBZ49JpcYqHkQEF3EwbLqOCKz/whyziiIYSZ+B
 tSIWpe4XmJVH6/NhmPLfR9ggYy7Z8SyZQp3gD1KHpkVRqVUIoIyMZQGYzYuRVxmnECSpi2zLda8
 g7pggI5y4t4k8puQZld/fxmKSYrfoAeIhgFnDjmHucgYUEbd70PChlJaGfKXIUBQhsbjoU38vLh
 72VvpFmDV0wLK5iUYnAT6fSG8bB88zS2LroeJ3y1rfCTA/1VMPT9fVOnZCCwLWyQ+kJ3JMCUHVK
 /ald/SQ8O0m98sg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_102501_639796_B493948D 
X-CRM114-Status: GOOD (  10.45  )
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

Core in sdio_register_driver() already sets the .owner, so driver does
not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on the first patch.
---
 drivers/net/wireless/marvell/mwifiex/sdio.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/marvell/mwifiex/sdio.c b/drivers/net/wireless/marvell/mwifiex/sdio.c
index e1b58ca1b3ba..588140453821 100644
--- a/drivers/net/wireless/marvell/mwifiex/sdio.c
+++ b/drivers/net/wireless/marvell/mwifiex/sdio.c
@@ -979,7 +979,6 @@ static struct sdio_driver mwifiex_sdio = {
 	.probe = mwifiex_sdio_probe,
 	.remove = mwifiex_sdio_remove,
 	.drv = {
-		.owner = THIS_MODULE,
 		.coredump = mwifiex_sdio_coredump,
 		.pm = &mwifiex_sdio_pm_ops,
 	}

-- 
2.34.1


