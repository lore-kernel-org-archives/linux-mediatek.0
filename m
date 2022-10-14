Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D172EC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Oct 2022 17:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hifOoY9aqLLHbcQa2d9K53VxHn7l+VlC4N3fss0zE6o=; b=4bq01ivNuDEhb31Bl9f51rkt8L
	F/Q5c1FZSAYvow61/5QIoFi7prGebFosF2HpWOm4bpEMcW+QsWus+og7PvZJjwUI+6aFAUcN9ARWK
	i6SlgFAKVg/YVYvFLQbPOFdhYFjOjyTdQkQHMD8+jpTZoqW9rpZp/pyNviUppJCaWvDc7lcIO3t+F
	ugrnj4RwVaDaHGTeh09+o7RKl2EChA9SpHXRKIa5MzMO3GsW18ekOkdBeHyWLxbTgIPmiA9Rn4dcP
	p3d8eVxc2iu8Fv6rYYkTfxG6iWLxg+S58LC0kEeA+vuAd/VNiAPmTcmNDv2K14V+lWZWpbMugI2qr
	qpReeZMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojOvL-00FY1G-BY; Fri, 14 Oct 2022 17:56:43 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojOtX-00FX2d-RU; Fri, 14 Oct 2022 17:54:53 +0000
Received: by mail-pj1-x1034.google.com with SMTP id t10-20020a17090a4e4a00b0020af4bcae10so5395597pjl.3;
        Fri, 14 Oct 2022 10:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hifOoY9aqLLHbcQa2d9K53VxHn7l+VlC4N3fss0zE6o=;
        b=TrpvH1TyIPvuJXDWY1g6ts8rJV3gvM9Nm0JNTBhFYpx2VK44z8Rht7w/Ag7is45ey3
         5ezFxZHhpI1YuXCQLbvQ5ecv06+V+SpA8r3lf/wFqfbcgHg5EQdjS2WVhz1pQNfTH8mw
         66b2PU7ve2MOYaj8Nme0hrcf44ijbJ7sLBuHf9KH/FcrhkMupMn0xH7cQ80fAJa1R7uo
         AJ0nAeFYhJKaANAWnQj8t4Ny1oxgPj9ldWk8x9jBk/mz5+5Uh893cGshBAVNMPpVORGV
         Vnbw5tMxeBSEBR0PeLMJWfW7uuE7fsZLMNQrIgS7369saBkiEQeJV6Y5zPq0r3LNSy6l
         ahqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hifOoY9aqLLHbcQa2d9K53VxHn7l+VlC4N3fss0zE6o=;
        b=bV+BJ2E6eysYg4OZF2G/R5d4/ub3qC90uHXZVQlUsZA45lHfTSdrPxuBysJzlVBrcu
         Xn5d2F85okh7zvWChGh6pR2D1rBNktWPB+7kwgC9hS/RaKDNhNwqrZkm6tNWs9EGlha3
         xvF7DX3x65UL2z83pYi9lQ+hafi7WrulTIsKs7OSWGUl7hhGp8BmtbWZwTCR0EEvi4py
         H7IY4GqC/lJt8zRAUdoNOYhaHNiAYq7pdvErxDMCLV9A6VHQWOzMIOc9EY5pvYkZQ+j2
         L9LypqhkJ7UJV0XICQ/Ms2dtB984wDvwqMbFP9xpr9cbIVsa1OcV7TEdrn2dyppcafFp
         PW2A==
X-Gm-Message-State: ACrzQf3plsMj9o5bH9cjFpUUsjnn/WwC/enhEXgNrSmebmITd2LVSFPS
	JaSjS5T6DBVY/TvP3wvckIs=
X-Google-Smtp-Source: AMsMyM7wLkfeK7I1F9q2E31QSGa2I946SkJ4WKVNKK++Nlyyi1mDDFQDfViwRLKauuXRwbgorVoV9Q==
X-Received: by 2002:a17:90b:1804:b0:20d:a753:7d4c with SMTP id lw4-20020a17090b180400b0020da7537d4cmr11027033pjb.78.1665770087982;
        Fri, 14 Oct 2022 10:54:47 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:9d:2:da06:5604:594f:f6af])
        by smtp.gmail.com with ESMTPSA id jj19-20020a170903049300b0017f7819732dsm2011780plb.77.2022.10.14.10.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 10:54:47 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-kernel@vger.kernel.org,
	Daniel Thompson <daniel.thompson@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org
Subject: [PATCH v2 6/9] gpiolib: of: add a quirk for reset line for Cirrus CS42L56 codec
Date: Fri, 14 Oct 2022 10:54:30 -0700
Message-Id: <20221011-gpiolib-quirks-v2-6-73cb7176fd94@gmail.com>
X-Mailer: git-send-email 2.38.0.413.g74048e4d9e-goog
In-Reply-To: <20221011-gpiolib-quirks-v2-0-73cb7176fd94@gmail.com>
References: <20221011-gpiolib-quirks-v2-0-73cb7176fd94@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.11.0-dev-5166b
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221014_105451_913416_933C4082 
X-CRM114-Status: GOOD (  10.49  )
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

The controller is using non-standard "cirrus,gpio-nreset" name for its
reset gpio property, whereas gpiod API expects "<name>-gpios".
Add a quirk so that gpiod API will still work on unmodified DTSes.

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpiolib-of.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 5c11ee7638d1..77cabcfb2da0 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -418,6 +418,9 @@ static struct gpio_desc *of_find_gpio_rename(struct device_node *np,
 		{ "wlf,ldo2ena", NULL,		NULL }, /* WM8994 */
 #endif
 
+#if IS_ENABLED(CONFIG_SND_SOC_CS42L56)
+		{ "reset",	"cirrus,gpio-nreset",	"cirrus,cs42l56" },
+#endif
 #if IS_ENABLED(CONFIG_SND_SOC_TLV320AIC3X)
 		{ "reset",	"gpio-reset",	"ti,tlv320aic3x" },
 		{ "reset",	"gpio-reset",	"ti,tlv320aic33" },

-- 
b4 0.11.0-dev-5166b

