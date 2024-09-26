Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E23CCEBF60
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Sep 2024 23:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=97MJYpYNh2OXN36yrgEntTFOxNkCwTKF272jX4EBFYg=; b=WGowiRZ/Fepv1U+OMed+DwoA9l
	wKBGuLY3L/uvzl5hrwkFQ87ogoacj/2xDx3XjH8e42mCEMhj+DPSXXFtc0rrOPSrNn2wx81OWSdGh
	D7k3dR52S8JRwvMuug6fsw4garulk3aJQWHFeyGPuspignvLILrV8OyOtRLmztnpGMjXqV1upyYJk
	SuA9+jmLcVlegUHmTrb1FfGlj7PludRTii4qvk1e7W9vvj8EnR3TZNks7TdPRCYaGwWboABodQaaq
	ZvoF0W8j0q9ghA4OSUOqWPet+3bN/9oblccTl78Vmf1cfETRNqVZWmExRPFWWD3eOY2aqQ8sYnSIK
	JbIGpD9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stxtJ-00000009aPU-0sJA;
	Thu, 26 Sep 2024 23:27:21 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stxnc-00000009Yth-0YTt;
	Thu, 26 Sep 2024 23:21:30 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a83562f9be9so137010266b.0;
        Thu, 26 Sep 2024 16:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727392886; x=1727997686; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=97MJYpYNh2OXN36yrgEntTFOxNkCwTKF272jX4EBFYg=;
        b=S3Q4UFQiVebFRWMEIJrX7xdkPIAGSxdyeG3QGlB3BTf7izdedkbWbuRI/HHmu5eGah
         ZFBd2n9T7KvELvMtRgPlEhzPt800CJvvrOEjoy2aDjQZSujM21wb7kJuNV4kjRSMnAYp
         6/ZwmJv1Fvd27aiR83XmRxgqla0H8ix1MQ/Ril4s3rmcMOlY1S2UK+C+M7/bw2V+exiJ
         cyLSMBWxBFPfo5vc2Hqf3odDKHDT1oW2nYiRJgOqpEKGG6dOmMw9Y4TUcXKxWrSSK0Ny
         qgQqfl33Ie1SE8LsNYl1K6F4k0zERhe7yVPSBo3qEQ/Tza9Q3Sb1dWXAlywrZ8Iojf5i
         B1Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727392886; x=1727997686;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=97MJYpYNh2OXN36yrgEntTFOxNkCwTKF272jX4EBFYg=;
        b=UI5FADjrGaKrT3W99cdjjP4BkwNnhbENb24ZnA5pLtzIWO4B06R2YMseEUByPTXDZ5
         oecIUqcxCbjwIjUazsHTt4di3iO4WdW9lBsF0njanVN/e8FjliGZ+CSJSj5pw15b0pZ2
         V3H14Mfh2ermGb12oeuOx5O2SYdUdLALQfI35vp4gB7yetF9wnCDuMf2cOg2M/pGYsd7
         kL+IAM7rOylp6YmksVSeT8VUvpy8bcErcHvCoS9ZQgd3SSxepjPsoBgEkBAnUXBmnCjH
         +Nkbafy0YuMrbPyB4p+jA/dnXmLW/q6Myoq5De6awz8jmJIUsCGhSbVoITVcVdbkvuqL
         Eo9A==
X-Forwarded-Encrypted: i=1; AJvYcCUssvQ5kl9kfQSX1cELB1GA2SUpDnJC5V+dvyJjhYazUacauwfZtLgy7ZflQMgFO3SAKqL5bW52x/OjlukI1sXI@lists.infradead.org, AJvYcCVzgM4BuRRNvKXx5T4C1hah2ztr82Wnxvx82T9nMwPW70MushjL/wrJkuAyOfUo4dOy5nwmWbQtTfWa5NulHpU=@lists.infradead.org
X-Gm-Message-State: AOJu0YzCPijEPT8xD8WgHpECXb4Ivp8hh/ZzxjPCgJ7vDRSVpmi/UVFh
	uG7t63z0MqU3A8r1ZUq68rJAyB4UXaAFNOcXz73zGUOQrywIv3LkrYeOUwL9
X-Google-Smtp-Source: AGHT+IGEbTyX4azDhptvTAbyqHSfEzTyPNNE/JgVuXwIVkiF6dJaxNfrq6Yp0EW4PANwfpfda2QaAA==
X-Received: by 2002:a17:907:d14:b0:a8a:83e9:43e2 with SMTP id a640c23a62f3a-a93c48f926amr75943566b.12.1727392886119;
        Thu, 26 Sep 2024 16:21:26 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3989-b03c-7705-998b.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3989:b03c:7705:998b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27773c0sm50368166b.1.2024.09.26.16.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 16:21:25 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 27 Sep 2024 01:20:55 +0200
Subject: [PATCH 04/18] leds: aw200xx: switch to
 device_for_each_child_node_scoped()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240927-leds_device_for_each_child_node_scoped-v1-4-95c0614b38c8@gmail.com>
References: <20240927-leds_device_for_each_child_node_scoped-v1-0-95c0614b38c8@gmail.com>
In-Reply-To: <20240927-leds_device_for_each_child_node_scoped-v1-0-95c0614b38c8@gmail.com>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Gene Chen <gene_chen@richtek.com>, 
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727392874; l=1474;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=d0/jBZeOQ8xCvysG4yJkfCKJi0DJ8XXoa660caQmywM=;
 b=tR0vcqDoOSP5Z2owKMnAB9bhX8x7lqHl3M+byu6E1aArGwC6Yf4PxLgUabwsOkMjFx/oaq0zI
 VzAnF+19OBbC8V0VBuGNYGHfa/Q/kR9spuC+zWidBB4bco6IBrAZbCS
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_162128_291696_AF5DC138 
X-CRM114-Status: GOOD (  13.33  )
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

Switch to device_for_each_child_node_scoped() to simplify the code by
removing the need for calls to fwnode_handle_put() in the error paths.

This also prevents possible memory leaks if new error paths are added
without the required call to fwnode_handle_put().

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/leds/leds-aw200xx.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/leds-aw200xx.c b/drivers/leds/leds-aw200xx.c
index f9d9844e0273..08cca128458c 100644
--- a/drivers/leds/leds-aw200xx.c
+++ b/drivers/leds/leds-aw200xx.c
@@ -409,7 +409,6 @@ static int aw200xx_probe_get_display_rows(struct device *dev,
 
 static int aw200xx_probe_fw(struct device *dev, struct aw200xx *chip)
 {
-	struct fwnode_handle *child;
 	u32 current_min, current_max, min_uA;
 	int ret;
 	int i;
@@ -424,7 +423,7 @@ static int aw200xx_probe_fw(struct device *dev, struct aw200xx *chip)
 	min_uA = UINT_MAX;
 	i = 0;
 
-	device_for_each_child_node(dev, child) {
+	device_for_each_child_node_scoped(dev, child) {
 		struct led_init_data init_data = {};
 		struct aw200xx_led *led;
 		u32 source, imax;
@@ -468,10 +467,8 @@ static int aw200xx_probe_fw(struct device *dev, struct aw200xx *chip)
 
 		ret = devm_led_classdev_register_ext(dev, &led->cdev,
 						     &init_data);
-		if (ret) {
-			fwnode_handle_put(child);
+		if (ret)
 			break;
-		}
 
 		i++;
 	}

-- 
2.43.0


