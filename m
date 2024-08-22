Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE5C4C5321D
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Aug 2024 09:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OGdOo23OjShZKKUPhP64Sm0t2nst66j12GqHlKAMLTI=; b=ipi5FnHP12vXPhHWtIiobC5DjP
	gaqRQF5jg7ZVnpEn586HpOcpGHCkggGQ04yd3UqrSsxC3qe4LMF8GEXb2nxD84JGTs5R7Ynfaf2qA
	z9IoVZc6o5p3HyVT9NIVeIevNeQvVVqxqW8xZbedtE6gFJqwn9BGZIDw47FmY7XZQKjGhbKdnFnLa
	HaxiWUjLz+xUoQiKyC3IZSLMagBe5oQAk21pgIfS+C4a1lE+w1w4AuwM4751Ss8WF9k+TU6y0g7iu
	j35PHetp0bam+imJK5xF415sMs2Rx3PN8U4lnLabb2WWJ6Ue8ezvWtP4q4CFlURHNXkHzJzawTNVx
	6cOyWVOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh43t-0000000CDYM-1uwJ;
	Thu, 22 Aug 2024 09:24:57 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh3zk-0000000CCEA-1l0l
	for linux-mediatek@lists.infradead.org;
	Thu, 22 Aug 2024 09:20:41 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-5d5bb03fe42so350635eaf.3
        for <linux-mediatek@lists.infradead.org>; Thu, 22 Aug 2024 02:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724318439; x=1724923239; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OGdOo23OjShZKKUPhP64Sm0t2nst66j12GqHlKAMLTI=;
        b=EqlqYN0yIjMMgOGbJ4IklhMZLKLU3b2nUicuMrcYFOr3VsR57qHeiTbOS9TK/JSzp2
         fZ0ZT1m6G0+T3ayeZkV3YYtyt3jJJx2FZYFGMFW3Twvv73nORVgO7IefVhvbpVwXhmVb
         xBtugEmyq5D1XEFA5+sL0NKUWBikWvBcUJKTA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724318439; x=1724923239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OGdOo23OjShZKKUPhP64Sm0t2nst66j12GqHlKAMLTI=;
        b=FETTeYwFHWiAVMS8sH5xNmm2BANYam2CqxLjs5aAUyzNx7YAeNpctuP/f34Ia8p3wv
         9Avlphw4Jd9WDlkE7WiGJ+fwX3nu6yXj7xEWd6C/9Va/aMg+0FJji+C9rSXfwajCprP7
         L1mIBa03qlayJF7tmgi26c4ZslhzBtlwVIX6YRBKM2GlZtHLs6q463eW0/JkMWa3lUfl
         JAmOKLPzm+snQvETxfaXAxd7/4+XgAqGQ1sK8JjUQ5w66o9UDuQX1twCXDW6wgnYP43N
         4yy9Kcy8siy7vAC+nT15myVKxPSBxwdpfkwzN9yLv7pBCvq4nw15utN+weVQ9HVWRkc0
         NBHA==
X-Forwarded-Encrypted: i=1; AJvYcCWjNZY2RzWj06A21u7qSmChtUeelpWADM1mk8XBeOms09a/ZmcZeFe18G9XiStUaPEoEIrg1wsadg9Si3qe0w==@lists.infradead.org
X-Gm-Message-State: AOJu0YySxBnJO9oGdpuydqrrYW7OsQMBeZCFJrdtwdeRxnSpd5Zb1ouZ
	giAMivl1HWOKSKwBM1GLhE2eKm5KsYXjrRy5Q0yQgaRnGHTo2nMIfPrE4TSdwPaXxykLFoIXgoo
	=
X-Google-Smtp-Source: AGHT+IGg4vXGxgKXD8IY1cy882/n6HazEz1G403uPDeFfsv+SBpWVZIvn3E7WqFDu7Zn4wJDa5xJAA==
X-Received: by 2002:a05:6358:2624:b0:1af:3b39:8183 with SMTP id e5c5f4694b2df-1b59fce12c4mr581766055d.20.1724318439044;
        Thu, 22 Aug 2024 02:20:39 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:8470:6a67:8877:ce2c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71434335e69sm951398b3a.194.2024.08.22.02.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 02:20:38 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>,
	Jiri Kosina <jikos@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org
Subject: [PATCH v5 05/10] gpiolib: Add gpio_property_name_length()
Date: Thu, 22 Aug 2024 17:19:58 +0800
Message-ID: <20240822092006.3134096-6-wenst@chromium.org>
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
In-Reply-To: <20240822092006.3134096-1-wenst@chromium.org>
References: <20240822092006.3134096-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_022040_479745_66C1E02C 
X-CRM114-Status: GOOD (  21.90  )
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

The I2C device tree component prober needs to get and toggle GPIO lines
for the components it intends to probe. These components may not use the
same name for their GPIO lines, so the prober must go through the device
tree, check each property to see it is a GPIO property, and get the GPIO
line.

Instead of duplicating the GPIO suffixes, or exporting them to the
prober to do pattern matching, simply add and export a new function that
does the pattern matching and returns the length of the GPIO name. The
caller can then use that to copy out the name if it needs to.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

---
Changes since v4:
- new patch

Depends on commit 4b91188dced8 ("gpiolib: Replace gpio_suffix_count
with NULL-terminated array").
---
 drivers/gpio/gpiolib.c        | 44 +++++++++++++++++++++++++++++++++++
 include/linux/gpio/consumer.h |  2 ++
 2 files changed, 46 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 3903d0a75304..e4228ef6f131 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -4295,6 +4295,50 @@ struct gpio_desc *fwnode_gpiod_get_index(struct fwnode_handle *fwnode,
 }
 EXPORT_SYMBOL_GPL(fwnode_gpiod_get_index);
 
+/**
+ * gpio_property_name_length - Returns the GPIO name length from a property name
+ * @str:	string to check
+ *
+ * This function checks if the given name matches the GPIO property patterns, and
+ * returns the length of the name of the GPIO. The pattern is "*-<GPIO suffix>"
+ * or just "<GPIO suffix>".
+ *
+ * Returns:
+ * The length of the string before '-' if it matches "*-<GPIO suffix>", or
+ * 0 if no name part, just the suffix, or
+ * -EINVAL if the string doesn't match the pattern.
+ */
+int gpio_property_name_length(const char *str)
+{
+	size_t len;
+
+	len = strlen(str);
+
+	/* string need to be at minimum len(gpio) */
+	if (len < 4)
+		return -EINVAL;
+
+	/* Check for no-name case: "gpio" / "gpios" */
+	for (const char *const *p = gpio_suffixes; *p; p++)
+		if (!strcmp(str, *p))
+			return 0;
+
+	for (size_t i = len - 4; i > 0; i--) {
+		/* find right-most '-' and check if remainder matches suffix */
+		if (str[i] != '-')
+			continue;
+
+		for (const char *const *p = gpio_suffixes; *p; p++)
+			if (!strcmp(str + i + 1, *p))
+				return i;
+
+		return -EINVAL;
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(gpio_property_name_length);
+
 /**
  * gpiod_count - return the number of GPIOs associated with a device / function
  *		or -ENOENT if no GPIO has been assigned to the requested function
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index db2dfbae8edb..ce3a5f86a037 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -56,6 +56,8 @@ enum gpiod_flags {
 
 #ifdef CONFIG_GPIOLIB
 
+int gpio_property_name_length(const char *name);
+
 /* Return the number of GPIOs associated with a device / function */
 int gpiod_count(struct device *dev, const char *con_id);
 
-- 
2.46.0.184.g6999bdac58-goog


