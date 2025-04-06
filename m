Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE5A1C3601A
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Apr 2025 20:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d0bCgywlp6kaDxRJG12fl3NMTv2SIFaAtl9wSse2RnE=; b=ptho/1p8Z64pHAwT7Fn1LFirhM
	rrHApeB4n15m9MTn0k0NQVAUnzWwjACKD/UCNH6aoqBjLpNkhwememBAfu4T6EvBqX3M+J3ZWMgCJ
	Rx0kkO1MBzQBDQp5iXS6HB9SeBLgJBJECQSOvyVjwEQ0bagn/GWvyUF4tluBXYIbSWDDXubR4+BEl
	YJ8PqNE6QL1Zwk5R76u7Lkrp1QLFyoFLpSTtuAuHvne8WY25/evUFaaUJ3TFnpAanm7J6NB3JKWh8
	CdQoLWoWWlgos9g8xce+9582lGXM65oyrYSS/Ce+efgKKf9KGklTuvJFHzArb26YUL2HowkIBW/Tk
	8MZDdovg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1WO0-0000000Fl3u-3KDw;
	Sun, 06 Apr 2025 20:14:32 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1WK0-0000000Fkgb-0dxn
	for linux-mediatek@lists.infradead.org;
	Sun, 06 Apr 2025 20:10:26 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-39123ad8a9fso369894f8f.2
        for <linux-mediatek@lists.infradead.org>; Sun, 06 Apr 2025 13:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743970222; x=1744575022; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d0bCgywlp6kaDxRJG12fl3NMTv2SIFaAtl9wSse2RnE=;
        b=eOmiPNfqyhp+OdT8XEFT0nsscC9GCxJxezOhtb/IRhliQFA3X/di86ja1XV1uGmjyS
         U0Q6kw0y2K4zqETO4naTOrGr/oytaVgoF831b8lcrrV3J6sH6u+3/LuIIw2Hcd6XFRWr
         if0BwlUZeXJv9lfasraeamGNf7sTTJQPRUDTFk6euy8LPEsZEn9cShHQZ90tjME3EP3z
         HJQsvmvL2sicuFy8IL0MNZOMka2I7sd4LwTTSA1KItiDbbISLhMHzJCk4oUlIFL5omHO
         +Bvdha/yT3FHLDoh1dtQaFFmVXXy5m7bJUHIQApp82kALeKd2+orm0g1rzs3t6YXHO1e
         YQlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743970222; x=1744575022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d0bCgywlp6kaDxRJG12fl3NMTv2SIFaAtl9wSse2RnE=;
        b=jbqjXojuMVAjd9/BZjCf9MClkaSsGlPRSN3v9DXU1XWu4DAjoNqshxuTlW05UIe0LW
         TaalrwkUECczEDPC3xALyhpc4nh0OUKo3pk/cwGdTJPT8vzBrP3NZWJzt0LR2MruHngz
         eHm46MsktuVjrHMiH12AgsuPkpNyMaSNL473Jeqoy9VElkKDFbeWKuFfemS6bvepUSw/
         s/OSjmBL3flFu863ReIQdAwaM6CUdhAHxw7uNAFaddxaDK09H2Xfhp1qGS5F2i55MBwf
         Gw1ua/NSSn8BrW1EaY2S5wKfXt5WjDo3iSPZdGizC57S5/YrqhGMxMQ7K5sl6jyARuz/
         wWLg==
X-Forwarded-Encrypted: i=1; AJvYcCV3n3+UjlaiOuXF5BmzhD651QMTGC8TPI3MSK9Ouc37+NcRSHGneUf9C5cc4wEZmrKlyk3lDrsTj+Mp/ijM0g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzwOwjQ1bBKIuKg6NEltoPTS95IXZ9xN02ebZD+K6kVtI61LVFy
	t1DFjE3+Iw5PkzARW7EFFVp1mrykKUinSifR7ssck+g0/Oprt0Bl4+aAFBiOPCA=
X-Gm-Gg: ASbGncv1c8ET84v+yQXrfeL/gAqRNWSZPxhEZ5/zl3QA7G88V7SSDxxXAsE7hMqfhRV
	kPfjr5s/AFTgeMiDRoaacNdK5hY7nZyK+2h77U2yCGwl0XXXdGjM7JLK/M54HHG4PEPTXeEfY/l
	UK4TnT+av9S5fP9aOKpNN2y/deSFHzQ+df1hRFm8Gunrj3jgFZFz4RSBLR69MXA0oLZ3Vkc8D7P
	cPOiLaascjr71dlxGOO9iG96r4R9QPAhNergwkZCeSUlhUZyZf3nZOl7W9+Hkv6zzbg5QZzdOmY
	xni4lZ91dt+ljE8tfj3+zY10Cn3B4aHWMqL5p/jq9PwQ7l0/D28uXA==
X-Google-Smtp-Source: AGHT+IHX4ogO0j9l/DVFfDe0o53qqxRjbgFXh9pHpQJLcNqGVqDaNvFPF3GPRIgR8kG8COOn0609yQ==
X-Received: by 2002:a05:6000:4022:b0:391:319c:193f with SMTP id ffacd0b85a97d-39cba93cfc3mr3063727f8f.13.1743970222445;
        Sun, 06 Apr 2025 13:10:22 -0700 (PDT)
Received: from shite.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301acec9sm10080656f8f.40.2025.04.06.13.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 13:10:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] Bluetooth: btmtksdio: Fix wakeup source leaks on device unbind
Date: Sun,  6 Apr 2025 22:10:17 +0200
Message-ID: <20250406201017.47727-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250406201017.47727-1-krzysztof.kozlowski@linaro.org>
References: <20250406201017.47727-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_131024_191270_A66F55D9 
X-CRM114-Status: GOOD (  10.95  )
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

Device can be unbound or probe can fail, so driver must also release
memory for the wakeup source.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/bluetooth/btmtksdio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index edd5eead1e93..566c136e83bf 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -1410,7 +1410,7 @@ static int btmtksdio_probe(struct sdio_func *func,
 	 */
 	pm_runtime_put_noidle(bdev->dev);
 
-	err = device_init_wakeup(bdev->dev, true);
+	err = devm_device_init_wakeup(bdev->dev);
 	if (err)
 		bt_dev_err(hdev, "failed to initialize device wakeup");
 
-- 
2.45.2


