Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42FE0CEBF60
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Sep 2024 23:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HNd4acINmmNerLNUmXoF50X4J1ylsjRdPZ4qMlEZiVs=; b=XU8X87Lbjl9gYqkAl10eW/5HRG
	ydK9z8/tpD57OsJqbP0tpmNuJ3BfkiRoD20VVxVYSpbWN5kWuzTv3n8/CApw6jOUw8DIdxZNL04+a
	BGXZpw8OXR+dXvcBKEvgdmFU9Xf72zgi90TImGWfas/TGXI8R0h611E1jOiIrMROP0Dn0spwM9O3D
	DiuIXV8QdpcmbexLB0STqXdDhbZLsCABy5Ee2SnFEK1VK7evXk0P30lRh/ZyavgxFx0HOT6A2M2Cw
	gbmWyxpEtBng5VpTm9yorbM/BWjBuyNs4QuNXT/UGSnZxMIKLQEeeWttvkgd7YxWNMWtGZruhbmaN
	rWPrzlPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stxsB-00000009aGA-0R0d;
	Thu, 26 Sep 2024 23:26:11 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stxna-00000009Yt5-2fIk;
	Thu, 26 Sep 2024 23:21:27 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a93b2070e0cso173533566b.3;
        Thu, 26 Sep 2024 16:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727392884; x=1727997684; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HNd4acINmmNerLNUmXoF50X4J1ylsjRdPZ4qMlEZiVs=;
        b=cTbZAAvlMmCaqlB+qzuJJaf2qTzqsszmi5mAYfRrqNtmrDSxIQF6WNfMC+I1ys2bII
         owPTxpAYGSZIfHS5+LmC325K3qH3M72cJmWS5yZvaL3aRpAcCPHpyi0+rHUVelZGr+dG
         D7q9x4zPkYTApP75LvBCuNqaDmsfIywF96FhcJON3oEKcnE7R9CGXKPSsdzR7CAMHnVw
         EFX8wQ40DJK0R6dD1HQYjKnnYmx3A9+IxDu40FAjzowTgPkYYoumNX72iAUv0RnNeJF8
         aECUOkLZWvD58uXNebeKRLazG2yNiORKJQ9vqd97elZpemHuGL6Hfb3KTyob+tLxNNvT
         3QoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727392884; x=1727997684;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HNd4acINmmNerLNUmXoF50X4J1ylsjRdPZ4qMlEZiVs=;
        b=dhow3LEg5gK3dtesSpcpzV8B6TodHpDTzVvcstk139y0B3DmMzJY27uVCV/EUWEELb
         B4HAIJVNST4aoy7uUcuheeGWpNcZa2NQFYJTc0n9e+DA4Fo+G7rPuxz0KzvO9R06NT8U
         CE4vld+4N4bU9VtCIzuYu/vR5lRZipK9mBmoLFswt3tvFb0ZEi66jbcikRTlgAyv4Q5U
         TNErabaL4mRFEWcMHQaJfwKuCwg8udkuzUDJ917NNhfRbVDmAepGsiBIApFwF8fqx860
         xQRS7CsZRz2EwGB91xMIwAG9LI483S2m2h6a0pWvkO9HKiAIRlVatfmv7gdGNGsUKM/2
         xnnA==
X-Forwarded-Encrypted: i=1; AJvYcCVTi/o+N1lg0WI4QGGAjDCtgMTp9GiuKS2rf861DwkYVFPimLD53Oz9uEhY2dKQlMDPeEAp3Q9puDRhk2ANLNc=@lists.infradead.org, AJvYcCWqPMn+hUVI1F4oAOUaYJ3yMTqJRkNHXuYG/Lo8fn6Hnc1V/MEpdn5mqutIalxyfObAepFLjG9Amc76I+NwgHSF@lists.infradead.org
X-Gm-Message-State: AOJu0YynJxZj+X7ZtfhWaRcBKQs3vLWxLLAUmavJSp+oMfFEdyTR2pWe
	VqsyV9S4HuZGibcLTXj8JuFScDOkjXz3vnfG+ktr+/PnEobssXtkxu8fz/f2
X-Google-Smtp-Source: AGHT+IEaJkjaI1Z6tqe57O4cY/kSpV7TlwQqKprn1eIz034AUHy+NubnWwLak/p5Xh3t4FDbODMYtg==
X-Received: by 2002:a17:907:96a7:b0:a8a:3f78:7b7b with SMTP id a640c23a62f3a-a93c4916e6cmr73897666b.14.1727392884471;
        Thu, 26 Sep 2024 16:21:24 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3989-b03c-7705-998b.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3989:b03c:7705:998b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27773c0sm50368166b.1.2024.09.26.16.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 16:21:24 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 27 Sep 2024 01:20:54 +0200
Subject: [PATCH 03/18] leds: flash: leds-qcom-flash: switch to
 device_for_each_child_node_scoped()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240927-leds_device_for_each_child_node_scoped-v1-3-95c0614b38c8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727392874; l=1584;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=wZ6akrPJfNHUSfXIEENEHvfLrdMCasbCDwbd/LiltB0=;
 b=51y1SjR6ulBD3qqgS2qUF2cR+3GmbQoLP5twgUKAKBCLM1UNA7NMBuE8fYTAvAWvhCwVEKFCh
 S+CcP+wu+pwAJEAW1NzXp4grrO/7Uy2C/nu/OWMtTu//R6mCOAKLHae
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_162126_709097_E10EABFD 
X-CRM114-Status: GOOD (  13.93  )
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
 drivers/leds/flash/leds-qcom-flash.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/leds/flash/leds-qcom-flash.c b/drivers/leds/flash/leds-qcom-flash.c
index 41ce034f700e..ab848c5acd2d 100644
--- a/drivers/leds/flash/leds-qcom-flash.c
+++ b/drivers/leds/flash/leds-qcom-flash.c
@@ -812,7 +812,6 @@ static int qcom_flash_led_probe(struct platform_device *pdev)
 {
 	struct qcom_flash_data *flash_data;
 	struct qcom_flash_led *led;
-	struct fwnode_handle *child;
 	struct device *dev = &pdev->dev;
 	struct regmap *regmap;
 	struct reg_field *regs;
@@ -896,7 +895,7 @@ static int qcom_flash_led_probe(struct platform_device *pdev)
 	if (!flash_data->v4l2_flash)
 		return -ENOMEM;
 
-	device_for_each_child_node(dev, child) {
+	device_for_each_child_node_scoped(dev, child) {
 		led = devm_kzalloc(dev, sizeof(*led), GFP_KERNEL);
 		if (!led) {
 			rc = -ENOMEM;
@@ -914,7 +913,6 @@ static int qcom_flash_led_probe(struct platform_device *pdev)
 	return 0;
 
 release:
-	fwnode_handle_put(child);
 	while (flash_data->v4l2_flash[flash_data->leds_count] && flash_data->leds_count)
 		v4l2_flash_release(flash_data->v4l2_flash[flash_data->leds_count--]);
 	return rc;

-- 
2.43.0


