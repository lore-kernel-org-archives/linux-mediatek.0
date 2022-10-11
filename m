Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAEE4C43219
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Oct 2022 22:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sP4CVLuIUUqGyDN5WgNcl+HHfO20Zq1pEkrf2HVCvvk=; b=J+sryhIU4lXsCJckWJCIfHRZis
	AFZEFOIDIWJLuTwU3RYwNQovNEGOAIusDjYBjsDM3OD8qPXZCb/yckaSrorot5Q2qjc0157Rt4RvQ
	RQWrmGKKt81X2PUhZyyIcIBflXMxgf4FVD3ikkrrqC/rkXfB5oOIEBR1bt055AC2u3w7fukb3R1KN
	LElVhB75B9MizZkdj3Znjgco7nGMYO6ImhNTXlC5uCX+Tvv/7aN/JxR3nXE/cDTyVjDMagqxz/CyE
	FTS1V6PQrssGqYDPRYwbK1lP+9qJ4EiPea5i24JwiEqRYaD4oeYjTc0n1CYJuq1OUW1epfFG/JHec
	NA7A3BCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiNbj-0060ZE-V0; Tue, 11 Oct 2022 22:20:15 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiNbG-0060MV-L5; Tue, 11 Oct 2022 22:19:47 +0000
Received: by mail-pf1-x42a.google.com with SMTP id w2so14852995pfb.0;
        Tue, 11 Oct 2022 15:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sP4CVLuIUUqGyDN5WgNcl+HHfO20Zq1pEkrf2HVCvvk=;
        b=fcOv/f56EIKFARHyO8xbxa7fok8UbyeXvggYNyWObyTtGnqVjpIr5M/LlKIqa8Jo50
         KE3k/UahcKbfOjKREk6Len+MyCOJMsO7K3bVdedPZsFkz2NA060/Uwx7OFLtdEUEaZVX
         FcXuqxexqMz0VcSW6/3ykBqarEX78X9TwUfQDfvtQV/7ceIguG3H+Abj7D49IbV62M2X
         fD1JoEAHMl0T2cdqrGfl6Cc1v0WDP2gEWaLjR4fVDbMoOjB5qB0pccUHihLlcrZ/NBeC
         u2k+NbDk6RLeNyrEUPOzA7tGvQmLN2Gi/4+JiqMIs+e6D+F2ANtvV/S1lfQ8K4C6MJHP
         aRDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sP4CVLuIUUqGyDN5WgNcl+HHfO20Zq1pEkrf2HVCvvk=;
        b=7AmueFydFPjW5EDPawProldsgSHFmpFNvefFcLDee1skzQ6W2ffVb/65sjTtcrcnD9
         Yk2rOXPtu0z/wg7UEPmftLZTumJ9lWTA57qZhoaanRcYOvDUOt7CWbTtxwygXlaOJ9vQ
         UTlhIxiGSZHPXohYZOePmw5Jy1eQas6ix0uPUdwvUmmzUG2oJ4TMI1DZkc3RCijoG84J
         lA9cpQMvlEyE6+PW7KJ3atxe+M/JBLuNyttLi7nCV4Odg58qB6jBujTDQbE+N3+pxdTU
         wJPwYPjXzHJRI1dOaMMv8WjRFD7Reskr59yeQbALNMaUDoOpjqfwMT+3FBnz5qV/nUne
         ZJVA==
X-Gm-Message-State: ACrzQf0HWBwuu1EVLbpDhCjLTOEnMIF2gan/Mn0y3VelCYtlzA0eJERF
	4MYRjvcu6/a49fnziZIUeow=
X-Google-Smtp-Source: AMsMyM7JyTtqCtUz4oGyeYuC82Zq4iMUrxtYt5rjUJ/2CibmiDuwu5AZH0jMv5c0Qxd84MuJz5BDNg==
X-Received: by 2002:a63:106:0:b0:460:64ce:51c4 with SMTP id 6-20020a630106000000b0046064ce51c4mr15846958pgb.17.1665526786033;
        Tue, 11 Oct 2022 15:19:46 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:9d:2:becc:db10:eb45:dc35])
        by smtp.gmail.com with ESMTPSA id l6-20020a17090ab70600b0020d39ffe987sm60151pjr.50.2022.10.11.15.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 15:19:45 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH 4/7] gpiolib: of: add a quirk for reset line for Marvell NFC controller
Date: Tue, 11 Oct 2022 15:19:32 -0700
Message-Id: <20221011-gpiolib-quirks-v1-4-e01d9d3e7b29@gmail.com>
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
In-Reply-To: <20221011-gpiolib-quirks-v1-0-e01d9d3e7b29@gmail.com>
References: <20221011-gpiolib-quirks-v1-0-e01d9d3e7b29@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.11.0-dev-5166b
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_151946_717374_99DD2F0A 
X-CRM114-Status: GOOD (  10.59  )
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

The controller is using non-standard "reset-n-io" name for its reset
gpio property, whereas gpiod API expects "<name>-gpios". Add a quirk
so that gpiod API will still work on unmodified DTSes.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpiolib-of.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 576f2f0c3432..7d4193fe36e5 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -383,6 +383,16 @@ static struct gpio_desc *of_find_gpio_rename(struct device_node *np,
 #if IS_ENABLED(CONFIG_MFD_ARIZONA)
 		{ "wlf,reset",	NULL,		NULL },
 #endif
+
+#if IS_ENABLED(CONFIG_NFC_MRVL_I2C)
+		{ "reset",	"reset-n-io",	"marvell,nfc-i2c" },
+#endif
+#if IS_ENABLED(CONFIG_NFC_MRVL_SPI)
+		{ "reset",	"reset-n-io",	"marvell,nfc-spi" },
+#endif
+#if IS_ENABLED(CONFIG_NFC_MRVL_UART)
+		{ "reset",	"reset-n-io",	"marvell,nfc-uart" },
+#endif
 #if !IS_ENABLED(CONFIG_PCI_LANTIQ)
 		/* MIPS Lantiq PCI */
 		{ "reset",	"gpios-reset",	"lantiq,pci-xway" },

-- 
b4 0.11.0-dev-5166b

