Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18FC7CA0ED3
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Sep 2024 09:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1lx3yQsWkTb9x7LagKbuMm4vpMCf33yZ7BqsG5IeSJA=; b=bECIwOP8v+qJbsny84qEQ0LZ/c
	nyHKKE2/aeTE+seSlzgWN2y8ZsptOrnXUmChJRf0Td4O8AQqnLmIs0FzuajgQM4wKcxD8vDi6UK8o
	8/XTfVg1yPFZN3NvHeMQm1ZTIH718MYjOSOH0LWTmpkJC6ZyYqfdo71htSw0+BC1QC27NelWy2cAZ
	yBEca8/QsaYD86c2XU5KkUvmY2ew7QFJBxlBaD/v4j6aXzMCOw2adjnU3bsi5JUJM+NdZH9q/6jV/
	KmWw6ox0VqLhRnlLLmomuvdRlBUOQGnsVwkD4lfkWhVURS/0ON564JkyNY5cW9IFZFeCkMEPW6Ltt
	hiTjIBsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slmUi-00000003j6R-3KLs;
	Wed, 04 Sep 2024 09:40:08 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sllsf-00000003Yvh-0WkW
	for linux-mediatek@lists.infradead.org;
	Wed, 04 Sep 2024 09:00:51 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-7176645e440so368567b3a.1
        for <linux-mediatek@lists.infradead.org>; Wed, 04 Sep 2024 02:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725440448; x=1726045248; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1lx3yQsWkTb9x7LagKbuMm4vpMCf33yZ7BqsG5IeSJA=;
        b=cSH3S+V7TT3X2JYOSRfMfTppqszYgpAZx22dDnp8yG82K2ict/GrZqlLG2INjx8u2W
         hDM75Th3aOhZWGq6dGSsSDtKxQ16i48ZqzU8SgjIQYaMlZXQHGAGdXVWDyAfquFNvdQT
         /2ROLBtt2uZSJKX/DfZ+ZfdxYk1++vsN+LOx4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725440448; x=1726045248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1lx3yQsWkTb9x7LagKbuMm4vpMCf33yZ7BqsG5IeSJA=;
        b=E8uALIBOo+4goad2zlSXGfDhcGSRXKM2cked4k6xm8mWJj90Tyw0QwCUeQPDDEw4HN
         TTtiKHeFbMGmELF+OgNy/MWrX3xobyoHL3wwAIyusAUwaxDYodPyDWFjhWd8SpPPPJII
         skkXnmZv7irBtOfCz/klHXVO8LXA1ErGLkEAxf9pjGvxpirwP5vi/hNmSAtLbYOZFdSl
         HgRznZrdeTUkyj5h5crkbywMQ0S34sHt1PQNodRQMqBw2yC4Z0BTztcFY6dWESXyHxt4
         WRd7eSmg/HhbazME0REuRNABtNdsOfk2+ahnywXapZOh5M2sHb2QyqEJvVkQpwWI6Sj5
         dXUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFUil3AaT99v2nHoUc25b//8vyQanHLfOtLvXhKm5YnAz/EDvWa6pBidz8tvXYOiwPxChGZY7BFUZd6eV0dQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyjvTmTB8jpyCnVy1wcyRjpqQ8/U77BG4qm2tlF8HLEQIfDbK8L
	T2pljHWHAfbBk+rEr6cXlyOu2dcoXXmgDUfKwWZnQTM32RFeww1GysWd5Q2dbg==
X-Google-Smtp-Source: AGHT+IFljw5CEOubKFgJs6Qw/4fe2qNKJQ/lUogumRK/GAi7DQzBwRnb7bCkK8F5ANHCSTOzSxDq3Q==
X-Received: by 2002:a05:6a00:2e08:b0:714:228d:e9f2 with SMTP id d2e1a72fcca58-7177a92187bmr2450461b3a.3.1725440448446;
        Wed, 04 Sep 2024 02:00:48 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:83fc:5c8e:13bd:d165])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-717785b5183sm1153279b3a.197.2024.09.04.02.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 02:00:48 -0700 (PDT)
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
Subject: [PATCH v6 07/12] i2c: core: Remove extra space in Makefile
Date: Wed,  4 Sep 2024 17:00:09 +0800
Message-ID: <20240904090016.2841572-8-wenst@chromium.org>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
In-Reply-To: <20240904090016.2841572-1-wenst@chromium.org>
References: <20240904090016.2841572-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_020049_209566_953F54D7 
X-CRM114-Status: GOOD (  11.46  )
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
---
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
2.46.0.469.g59c65b2a67-goog


