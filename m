Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F88CED275
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Oct 2024 07:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sPUO/QyLYbgAXcOBLeyWR3uKE5ceZyKuapBUH4+Vdho=; b=JfsCgtT8TV8Hm3OlDFa8e7I2Ps
	sffnyhfjiDFCoWTxofC6M25cEvuw1Sotu2dptw8KmM7bqH00xTxWye6Sh1zwRMmxyYxFIc38bOVoj
	+R67G/CfwLCSdGoDUO2/S/JM2r0u0CWwm6Aj+MtYghRc4pmZuVU6d1zAm8YnXckD2jYvw8GMLOCmr
	hjp0oMEgv4X8H55iFZsTdTyTSw8juh+ffPKqZlY4soNzyCrjtdZ+p3qZJPdNFrATnNsfCPvwWfb1k
	OXVluiU17WvNa8g18k5+vApz+sywu1i7Pm/7vNFvqoxs/smGWIm2wwAFzlN6dr1cAwUDo0yE+tWgz
	zNOCztyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy4qj-00000004qLT-0Ix4;
	Tue, 08 Oct 2024 07:41:41 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy4kM-00000004oQh-1zyJ
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Oct 2024 07:35:08 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-20bb610be6aso59138755ad.1
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Oct 2024 00:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728372906; x=1728977706; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sPUO/QyLYbgAXcOBLeyWR3uKE5ceZyKuapBUH4+Vdho=;
        b=R2+rsC6ac8sy0jA4QmQaYIyej54wfbpKUDpYN6HiwBr4QF64f0phz8NawLRu+6WAdP
         jhPO2VXPbkorCxEnhyXtkWcMDGzxwmCPthX6cznNZyq1ymVzEDkKlhBk3STKGv+KU+i+
         ip3zw/IxV5o+Aa7RY4O99YdHSWSsU5dGrLJiA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728372906; x=1728977706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sPUO/QyLYbgAXcOBLeyWR3uKE5ceZyKuapBUH4+Vdho=;
        b=q4j1FYlh2soQn2oB5I/IHXiHkM1QlQlzL6aXnG4qSxM+1utjW6J9OPlwzs57SjEMgf
         FeL9rts9TVqFG0XMf5dVMNOSA0/TVHxtppPH2VCxqz8+q93wNUuSiSVZ1WrwUoUH+/eD
         StXMSg1WHQpRGVBPB2rhr5ZByusTQypA2CiKTUgNsGLQ3WnFRXSSikWAN5NC1Jvbn9MM
         rTPAImMwG7y6u/psFSyWrLt6sLe3zRxMW71Rt9iAN08CBhHBbfdkRyjC0ZCRx2Dr1jnU
         q42MKVNed6ri7THiyV2h0A4ciPfjHHFQCIoqsLS8lHR5cHZMElw2XeuX8r6pqk6eivPR
         QBcA==
X-Forwarded-Encrypted: i=1; AJvYcCV1PgqXWTVVWAb9Dpur8E03IN7fbv4oMKhvw3QJmKUVVSpTpSodO8f3RumifkZUm46U13j+sELnHHX3hrV1MQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+SFpAoTuIEH/WjE4WcgBhEjUdXGwZL5ocGOOPN/lJ/qLDE48z
	Okjk+dWP+gGN35NPOwEvoHqfCR26f0K3hd0NZA8a7q+n/IGCzIMjeM4sYbC/tedF8JfmcdUB0A4
	=
X-Google-Smtp-Source: AGHT+IHw2VKleWZGjUzsOr2cjHRHd5ZZtRaR+rzZ7wLp6Io7cZVGwb3z9BPQYRo0UmvC/P2G9wcZcg==
X-Received: by 2002:a17:903:22cd:b0:20b:aed1:bf8f with SMTP id d9443c01a7336-20bfe298189mr218586815ad.42.1728372905977;
        Tue, 08 Oct 2024 00:35:05 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:10df:d27e:8d4b:6740])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13939bd7sm50121175ad.120.2024.10.08.00.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 00:35:05 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
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
	linux-i2c@vger.kernel.org,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v8 3/8] i2c: core: Remove extra space in Makefile
Date: Tue,  8 Oct 2024 15:34:22 +0800
Message-ID: <20241008073430.3992087-4-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
In-Reply-To: <20241008073430.3992087-1-wenst@chromium.org>
References: <20241008073430.3992087-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_003506_584394_206E217A 
X-CRM114-Status: GOOD (  10.58  )
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
Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
---
Changes since v7:
- Collected Andi's Reviewed-by
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
2.47.0.rc0.187.ge670bccf7e-goog


