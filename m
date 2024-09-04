Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B4ACD3431
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Sep 2024 09:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oXe0bTAdK4fzeVHk0iwWr+4YgaeXrtwwmT3G1fAlM0c=; b=KfLvWFJ+tNyAK5nb/TZmEIDA+m
	WvAUK1HF+m6LZ+MYzuiMUr/TUfO0KjYResj36uMpgoPeei4+hQD/FMdxmbN3wrZyfqBnJUVKi3ESY
	xFbVGmRuykk57DdD/k6m5QvLB5sUjAcEm+BG6PwpysdjROOGBe+tBCnPQqShbnPv2hHUm50UE0SXq
	dyRv86JKRZb0tVUFCMigTWk1ugnZD42dd5z55BYCFNwIRdb0Lj66SlcC8wutyT/LNn5g/Heuy0H2a
	Q4LKqyDsUzScuEGpawXPMTa5QfVEEpJz5tdXipXT0l+jrVNum6F2OHPmCKi32waeT+sXZjJRi3zIF
	rx2QIhQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slmTp-00000003iru-03Kc;
	Wed, 04 Sep 2024 09:39:13 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sllsb-00000003YtK-1pC6
	for linux-mediatek@lists.infradead.org;
	Wed, 04 Sep 2024 09:00:46 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-70cec4aa1e4so4530549b3a.1
        for <linux-mediatek@lists.infradead.org>; Wed, 04 Sep 2024 02:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725440445; x=1726045245; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oXe0bTAdK4fzeVHk0iwWr+4YgaeXrtwwmT3G1fAlM0c=;
        b=XQdfrNjutGUIBe2/XwPDYvEn+AP0z8AsthSaC5lHzJqyN82N6+4bMzA/IRyTAjvzuw
         Nj/ZdEJ7bAtlyz54SQ4ewsOJVOGHlDapx44X/0PrGn49Wp2m3O3nIeKJUWaB+rIqfKEB
         cjQA4gyBPs4od8BL86m5p2dIcmAvqML6SYhLc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725440445; x=1726045245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oXe0bTAdK4fzeVHk0iwWr+4YgaeXrtwwmT3G1fAlM0c=;
        b=Eu5WF2RP7JmtUWJftSYBxCLfDdZudYzg5POfPSlCxC9ecqc1HXPZq18WAYi9SflsdH
         kChmhLk6jrniZ9q5GowBcpB7GLEGgJsPEmaU6MOFmEyW8pMdbtL9+MeKzJXKAABcUAbe
         cGC/AqXsys3+Arj6eMNyenjFTmXHC76dVcf9w2l6DAgQiZQbPUbNOqKmQ0HI6h8ekicc
         g/UGgWdlWfGj5Sr04GPLsorjVtM7vgav0lccb+anX5yDQzFJoMNYz5xHB3DG8WDg5tYQ
         0qSppvZcgIUtoC6zcp4KCwZtR7HtQ7wKefbrQzZt0JIUCt1AU0C+DkOl76h0W8Y5iyRA
         qkWQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7DnwUvD6Rlw7JhVH5HPrCHDNwLfbe0Tvkq0CXAlNXADzEAsGLRr73sS9kR4VEOpVeq6gWreFtpEeohJ+xQA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxkwoXi6O9LgRR537mlPvglFRC+Z7Y7CKxAYiE7/jmlCbR6NNKJ
	feNgb5KZZw+zZxkFfbTFL6CEMO99fT5F4tH4Gb7fr5Lj9jXyaUJMK2gtj4C4Hw==
X-Google-Smtp-Source: AGHT+IGxijmAvO+pYlgJ7hjMKsPERsrObcLBwxYEKhBRWkHQTmof+srMssUjYemzBoLP7fiuqVV5Ew==
X-Received: by 2002:a05:6a20:d48c:b0:1be:c929:e269 with SMTP id adf61e73a8af0-1cce10ab242mr24768495637.34.1725440444657;
        Wed, 04 Sep 2024 02:00:44 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:83fc:5c8e:13bd:d165])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-717785b5183sm1153279b3a.197.2024.09.04.02.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 02:00:44 -0700 (PDT)
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
Subject: [PATCH v6 06/12] gpiolib: Add gpio_get_property_name_length()
Date: Wed,  4 Sep 2024 17:00:08 +0800
Message-ID: <20240904090016.2841572-7-wenst@chromium.org>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
In-Reply-To: <20240904090016.2841572-1-wenst@chromium.org>
References: <20240904090016.2841572-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_020045_511054_E0B200AC 
X-CRM114-Status: GOOD (  19.78  )
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

Andy suggested a much shorter implementation.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

---
Changes since v5:
- Changed function name to "gpio_get_property_name_length()"
- Changed argument name to "propname"
- Clarified return value for "*-<GPIO suffix>" case
- Reworked according to Andy's suggestion
- Added stub function

Changes since v4:
- new patch
---
 drivers/gpio/gpiolib.c        | 25 +++++++++++++++++++++++++
 include/linux/gpio/consumer.h |  7 +++++++
 2 files changed, 32 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 3903d0a75304..86527cc7991b 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -4295,6 +4295,31 @@ struct gpio_desc *fwnode_gpiod_get_index(struct fwnode_handle *fwnode,
 }
 EXPORT_SYMBOL_GPL(fwnode_gpiod_get_index);
 
+/**
+ * gpio_get_property_name_length - Returns the GPIO name length from a property name
+ * @propname:	name of the property to check
+ *
+ * This function checks if the given property name matches the GPIO property
+ * patterns, and returns the length of the name of the GPIO. The pattern is
+ * "*-<GPIO suffix>" or just "<GPIO suffix>".
+ *
+ * Returns:
+ * The length of the string before '-<GPIO suffix>' if it matches
+ * "*-<GPIO suffix>", or 0 if no name part, just the suffix, or
+ * -EINVAL if the string doesn't match the pattern.
+ */
+int gpio_get_property_name_length(const char *propname)
+{
+	const char *dash = strrchr(propname, '-');
+
+	for (const char *const *p = gpio_suffixes; *p; p++)
+		if (!strcmp(dash ? dash + 1 : propname, *p))
+			return dash ? dash - propname : 0;
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(gpio_get_property_name_length);
+
 /**
  * gpiod_count - return the number of GPIOs associated with a device / function
  *		or -ENOENT if no GPIO has been assigned to the requested function
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index db2dfbae8edb..494dde33ca44 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -56,6 +56,8 @@ enum gpiod_flags {
 
 #ifdef CONFIG_GPIOLIB
 
+int gpio_get_property_name_length(const char *propname);
+
 /* Return the number of GPIOs associated with a device / function */
 int gpiod_count(struct device *dev, const char *con_id);
 
@@ -188,6 +190,11 @@ struct gpio_desc *devm_fwnode_gpiod_get_index(struct device *dev,
 
 #include <asm/bug.h>
 
+static inline int gpio_get_property_name_length(const char *propname)
+{
+	return ERR_PTR(-ENOSYS);
+}
+
 static inline int gpiod_count(struct device *dev, const char *con_id)
 {
 	return 0;
-- 
2.46.0.469.g59c65b2a67-goog


