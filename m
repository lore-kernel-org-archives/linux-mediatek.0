Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF3EC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jul 2022 14:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bLWM+s+iR5LdVaHPuafu7iCm3mwz2NHAzkIzkY8xmTY=; b=ozwz7AazXXVMsbYbuuan7E77ep
	OfiCm+waK5qR3RjLhloa2m5z/lbnmNMuWzsqgDjLAjFYr9avCdB2gZtIsuuLxeuWCOWy+0QXbBjDa
	uMyya9y3uu9fOUvvRs34xfnjzPNXFI4fAw9vAVc3r13LfP9BkKrUtNDq8MjIa8uSwwKJRiPlsHK1H
	SCG0Z+fhc6yRh9gHp/mrpbuoXul64JnTAmLqE1Ld+/9UUjmFgcXTW3lKjrGKe0K0I/YwoB1CVDhox
	cita/+F+Vl71S8Ay6snpNVjt/uRlUbLYZDepirZgRkhL8zEmyam82FZ3y7RlsCTe2pMO5rgZjF0N6
	6CLTgNAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEB0h-0075C9-Fy; Wed, 20 Jul 2022 14:49:11 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEB0F-0074gm-Ax
	for linux-mediatek@lists.infradead.org; Wed, 20 Jul 2022 14:48:46 +0000
Received: by mail-wr1-x42c.google.com with SMTP id d8so6506027wrp.6
        for <linux-mediatek@lists.infradead.org>; Wed, 20 Jul 2022 07:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:date:subject:mime-version:content-transfer-encoding:message-id
         :references:in-reply-to:to:cc;
        bh=bLWM+s+iR5LdVaHPuafu7iCm3mwz2NHAzkIzkY8xmTY=;
        b=3o97zfA5+8dQXwtwy7pQ9pIIsD5FJ3qzv88L5rTytIICFhHWbxdWnJ9vUD26bICVLZ
         b4WQu8J+7rgfsC3O53slfyN9BObsbC0xNBezoPWL6JvxhPsCac/td0xgxZAAV2A6TtyA
         4fLEJ1TIJRgwWxfwo+JPQdzaQiqGUbTZbTFh57fmlNNc7wH3Am48OgcX1yT5GO2Ph5ep
         jLuFQRALqw50jBJQb7SNOjZbTZkmbsZP7i7I2SZ8jlE20tl3ya59X7uUoVYLB/OxgXWY
         YVKnie59wwIK2I5VIWeQ+ESe12NplRAeK0z7sxIO0TGu4ZME7CKjxHvvEgNtfeuQeO2c
         1JMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:date:subject:mime-version
         :content-transfer-encoding:message-id:references:in-reply-to:to:cc;
        bh=bLWM+s+iR5LdVaHPuafu7iCm3mwz2NHAzkIzkY8xmTY=;
        b=2hplKQihE7UUa4CTsH2NE9Qrye/XvV0mdpDd8Qqr6WFb9FcoRQgjt0pXpPGp9+1vyT
         a3u7qWJ+GynzhO9YYOY9AzhHyo0woI1tikn0tGjcshmdMCFczDUcwly9BkYy3R7suAQO
         K94mvXxVtsyLYuXV1Ox38RPd95crnKngxyGjK1JNVjBVKhHg/M6acP7a+1wWkrIvHVMJ
         2knJNWMqI5w5AaBxoMdqdUV01qtUfknjYGtgHDUREc8bbk/GAUlJLnh7JOOWhKIhW4Rg
         4rOjE+OpKAycPq6mwRcIVMWrqtou291TGLIsrPZl09jxa2Esgk5WcZ4FICVkI4wpf2vV
         kusQ==
X-Gm-Message-State: AJIora+HMCcSUx6JIMV7WS05hZ06cl7zDm0IXytYp0vLvqcKbw0LFohb
	Bmj3m3GPyvU8CrI/dlC3dzRolg==
X-Google-Smtp-Source: AGRyM1uqyELZOTi1y1+BWMg0rNkGod1uVK9t35VqzqBXcj/DigJ522rSj8SmtDKiiJo4GtoMoIymsA==
X-Received: by 2002:a5d:6110:0:b0:21e:4fe4:f7ba with SMTP id v16-20020a5d6110000000b0021e4fe4f7bamr727919wrt.69.1658328519755;
        Wed, 20 Jul 2022 07:48:39 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb19:85e6:1900:c639:22f8:bed9:44dd])
        by smtp.gmail.com with ESMTPSA id f8-20020a05600c4e8800b003a31673515bsm3321121wmq.7.2022.07.20.07.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 07:48:39 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Date: Wed, 20 Jul 2022 16:48:37 +0200
Subject: [PATCH v1 1/6] MAINTAINERS: input: add mattijs for mt6779-keypad
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220720-mt8183-keypad-v1-1-ef9fc29dbff4@baylibre.com>
References: <20220720-mt8183-keypad-v1-0-ef9fc29dbff4@baylibre.com>
In-Reply-To: <20220720-mt8183-keypad-v1-0-ef9fc29dbff4@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, Fabien Parent <parent.f@gmail.com>,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>,
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.10.0-dev-54fef
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_074843_571716_3DFBBF20 
X-CRM114-Status: UNSURE (   7.37  )
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

As stated in [1]:
Fengping has no longer interest and time to maintain this driver so he
agreed to transfer maintainership over to me.

Add a dedicated maintainer entry as well for the driver to make sure
that I can help with patch reviews.

[1] https://lore.kernel.org/r/20220421140255.2781505-1-mkorpershoek@baylibre.com
Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

diff --git a/MAINTAINERS b/MAINTAINERS
index 264e7a72afd6..f7a0bae74dc8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12771,6 +12771,12 @@ S:	Supported
 F:	Documentation/devicetree/bindings/media/mediatek-jpeg-*.yaml
 F:	drivers/media/platform/mediatek/jpeg/
 
+MEDIATEK KEYPAD DRIVER
+M:	Mattijs Korpershoek <mkorpershoek@baylibre.com>
+S:	Supported
+F:	Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
+F:	drivers/input/keyboard/mt6779-keypad.c
+
 MEDIATEK MDP DRIVER
 M:	Minghsiu Tsai <minghsiu.tsai@mediatek.com>
 M:	Houlong Wei <houlong.wei@mediatek.com>

-- 
b4 0.10.0-dev-54fef

