Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D31EDE998
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 07:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TZj+Rwt2K/givoXdUXg/sARHG7LMQ+JDTIquBzN2oCY=; b=P7ayieaGvpN8E/VPlD3rs7eXp/
	vQT2+kS79++T6Te+vsZf2cfioq63NVT88GMvXBGF/uvpwgBLlVG4/8D1mT8NH1IZ0G9nd68mNwG4J
	ZloLVF/1pqRON5G5JVpwFf0+xlf3P1zWBRartBlt5Ej/WWXKqWG3fUd0NQEHA+sCDcKuFSRXADywL
	rBsIBw0/U1MXqNVYDvMCCpr3N6+TOIMqaVIUY+UGczOnqbu4mecuPuI3m0gqUmwDDtFqNSMPzCdoL
	J0/tZX67rErRQecYq3EJi2tgwu204K3ePYY8cNkH4Gs44yDICxHJ65hucNmMtO7MGadcZmtgxAt/C
	vGaXTIyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soHsk-00000008STJ-1Zd4;
	Wed, 11 Sep 2024 07:35:18 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soHmH-00000008QoJ-2C2L
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Sep 2024 07:28:39 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-656d8b346d2so4118508a12.2
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Sep 2024 00:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726039716; x=1726644516; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TZj+Rwt2K/givoXdUXg/sARHG7LMQ+JDTIquBzN2oCY=;
        b=LQsF5FW4egImV8Z9QLfA0yXFoILANe7YbhO9HV5X8bV7QJvgIgj0z3KPV1QHxSo+V2
         s8q1+7+CKg2C1LUa1zBSj7Yta+2R4E1hHkbL/6Xc6Vn29xhu7R+xza9B4XFoGkJh5t0U
         I71r+riucLT/5g29hX3agrEdhpNtw3woAFx0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726039716; x=1726644516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TZj+Rwt2K/givoXdUXg/sARHG7LMQ+JDTIquBzN2oCY=;
        b=sm2YX3Ga7JU9t6R9qNjvTAxpShFzMb4yJJ4hzHPjt3RY4mjkCPhXkqeh+FGS9JK3W/
         CKD8t77XfKnFXAXImybjUNMZyauSL7uxXp6h1HyOpRzetYWLj42CuUZ4G6vq+sYwmMdr
         XcFiTxyynqFTkbi685aMDa/tyfrWlBpQ/SJO87Wt+CTc6z3NZOHYoInw8Zl350sMsGd1
         OJYH1Kiy0fQoF4bwtZmavNaXTXO46kz1Wcffg6c/7VnZKHGfXWN1iAGSGeM91JjqGcqR
         f5v96zDIqMHjcz01owdOb+o6ZjpCQYLYLWkX6pXN6l0PliUMX1/yE+IJLU3m97kJRxxV
         2r2g==
X-Forwarded-Encrypted: i=1; AJvYcCXUVrW2/+VfPDpuho1CjZOxZ0FrEiApSON6EGiDL6r16CIm3JFSPSwEvFZxT8WZsRYwD4ftogBEqIhQlvV9Kg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyLnQ1KJ3FGEQ02IFZuYTlCGF7lJl+nNoI5VvXxpL/xgTkWZ/gf
	DO82ZL1HaXqPztmGcpwHLcJofmWKVVW9HHZ8ESn8/y/LTY1cdjnwTitD802BUA==
X-Google-Smtp-Source: AGHT+IHedUO15STr+MI+20JywnkGwOWN1412qS2q6DZSwhZSeZ7SKRwPtcyUrKy5SFYgpsHfqp5wRg==
X-Received: by 2002:a05:6a20:cd0e:b0:1c0:eba5:e192 with SMTP id adf61e73a8af0-1cf5e0f52bcmr4279897637.27.1726039716399;
        Wed, 11 Sep 2024 00:28:36 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:8398:fe34:eba2:f301])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71908fe4e7esm2399415b3a.80.2024.09.11.00.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 00:28:36 -0700 (PDT)
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
Subject: [PATCH v7 05/10] i2c: core: Remove extra space in Makefile
Date: Wed, 11 Sep 2024 15:27:43 +0800
Message-ID: <20240911072751.365361-6-wenst@chromium.org>
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
In-Reply-To: <20240911072751.365361-1-wenst@chromium.org>
References: <20240911072751.365361-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_002837_638156_D1C3DF92 
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

Some lines in the Makefile have a space before tabs. Remove those.

Reported-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Closes: https://lore.kernel.org/all/ZsdE0PxKnGRjzChl@smile.fi.intel.com/
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
Changes since v6:
- Collected Andy's Reviewed-by
Changes since v5:
- new patch
---
 drivers/i2c/Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/Makefile b/drivers/i2c/Makefile
index 3f71ce4711e3..f12d6b10a85e 100644
--- a/drivers/i2c/Makefile
+++ b/drivers/i2c/Makefile
@@ -5,10 +5,10 @@
 
 obj-$(CONFIG_I2C_BOARDINFO)	+= i2c-boardinfo.o
 obj-$(CONFIG_I2C)		+= i2c-core.o
-i2c-core-objs 			:= i2c-core-base.o i2c-core-smbus.o
+i2c-core-objs			:= i2c-core-base.o i2c-core-smbus.o
 i2c-core-$(CONFIG_ACPI)		+= i2c-core-acpi.o
-i2c-core-$(CONFIG_I2C_SLAVE) 	+= i2c-core-slave.o
-i2c-core-$(CONFIG_OF) 		+= i2c-core-of.o
+i2c-core-$(CONFIG_I2C_SLAVE)	+= i2c-core-slave.o
+i2c-core-$(CONFIG_OF)		+= i2c-core-of.o
 
 obj-$(CONFIG_I2C_SMBUS)		+= i2c-smbus.o
 obj-$(CONFIG_I2C_CHARDEV)	+= i2c-dev.o
-- 
2.46.0.598.g6f2099f65c-goog


