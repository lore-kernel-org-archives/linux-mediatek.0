Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 338EDD2444F
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Oct 2024 21:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vDpMMaqPXUoFVzi9A3PDhKb1T42MjqvUb4kdLnoWycw=; b=QvZqMngz2aF/bGJIwGmRftVCS/
	l32eOWaEfFLXro1lH55xS9cyck3e5ruNXD14fNZXlNT7cASrR632G3Gck+Zijg9CpPVQDbRDqHhf+
	lBe0ymZAjQn0TC1z6PbH8f4Yp8SjsRb0yMeEM7s35Y/3oHXWI6n4sI/INaduyVjxY4mat0bxfFyxH
	QvZwwuhZKtDuLppjGB7IR1R2NWlQJj+eAXKe7eaQI1av6HArp7b2ER6trrZ/+usHUprcVjrdjYhq9
	cpQ1ZXZc+I8HLfliITkv7jZw8zvYSmLQI7bh7zSGln4n+kNLqEvX3Jno7G12NK6cYpQ1VczcuHbUh
	e9h+kJTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sz0qh-0000000EQTR-0RuT;
	Thu, 10 Oct 2024 21:37:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sz0fr-0000000EP7v-25GD;
	Thu, 10 Oct 2024 21:26:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=vDpMMaqPXUoFVzi9A3PDhKb1T42MjqvUb4kdLnoWycw=; b=prxxyHv7VvbENinXmPnJF9+UYB
	ZqFq5cQWI1/uwhgBhBd8gqhSeP2H3cbhFVWGZih3SjI+N97mWwLFmwlqVrSfN0+/l/r8Efw+A1QPK
	ylq1Yw4TlR1FD7j7wGseTKW5e8ibPaesxJyKPBQkAl9t+r7kTN2WUo599T5I6Ghw2Zir84M1bSct2
	ehVyVBsqJ1VQUVIv0h8iYRGgZ1UvNyc6DUlomJNwMAuYjc1yBauiNsJl4VNmZtv0YxrM7Q6SjT0Ws
	GuKNsRM8gNk8tFe5cU3/KtLMbgSLY9rHI8acCLX+eOEd922HDCdLaB2Io85APuhRo13q534FiZ/of
	H74pl0XA==;
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sz0fn-00000005feo-40eL;
	Thu, 10 Oct 2024 21:26:18 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-37d538fe5f2so232672f8f.2;
        Thu, 10 Oct 2024 14:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728595575; x=1729200375; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vDpMMaqPXUoFVzi9A3PDhKb1T42MjqvUb4kdLnoWycw=;
        b=XOWNzVCxmia4wKc5byZqxsuVEIwZJ0UCnvn0mr9P8WUyuCOscTs5G8UnqSKSxsAoYN
         U59xOejHqm+R31B2TqRLQIXfqbIV37jU/2q8ioRFIV8NiOz+n2BqJ3R3SDBBAKpgzOVS
         3qg9mAinImySE04GK45JIfXbpSdsUUhLcgUSFXq1XCn0bRVOJGDf3CNRh3dtMK+Du3rm
         LZCFmRMzQz+Fr/9cKunbZs9HeiWrDQCy7B4aexz9TFBX0ptK6QYwKNkGfwa4ZFtUSHCG
         +sBWKsZe8+/zDAP5DOzup3QV1+MNadTldZalL+7mm0GV46PyW6rFp7LmEpwAojsCUG9E
         WiRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728595575; x=1729200375;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vDpMMaqPXUoFVzi9A3PDhKb1T42MjqvUb4kdLnoWycw=;
        b=uKzQ91qTCD2xsZHd9QxDa52+E+9RTsaNjxkETNR5HFNZNwGLnsBbwZvT4H+zj0buiy
         MlSmwZ53geroeP6Z00NBVLV2nZLdKVGBw7kWKcsWUloKFPE9x+/9z2Nne99OlM3IQR1Y
         wO+gy+2ge6UqOmdQ/td9oegYcVz1Z4ARAtCGGYgIy3kVoIojgWumFb07LPhOGyuK3ilj
         xMLM6aAQqfCgH8cexI5Ck5P6g1AWXp/R8BHQC7RAz3UbIt1TScCttj1LXha871UFTWKd
         sgJW9PcQG+gnG7NfOxK6nRWqs5S2eorilXV8HRLvetovnyrco5Flj+va76y7RmfRJGex
         DYiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUm3FzYNkS9BouHXVsakGQOWK/mW0nu67amp4AJImb/x1KIAmWc8Gku1prV1gZrXeRgMlcsMq2aavfR6lXfj8Xt@lists.infradead.org, AJvYcCUy1QuVnsE/qvKQMzdQcG0/X4ue/cDydpNbbTMcZN0LfwW8SXcItrDa6zSDePO6UuFpggH3vYQQySs+az1nQZMseg==@lists.infradead.org, AJvYcCWr7GMFgKFg8qHwZtPmeg4PT+d65gUECeCFNm0yGBqVGN1V44qgYnbFrKrD9ZaZAk5kcLVDaNVLNUlwB88fzYI=@lists.infradead.org
X-Gm-Message-State: AOJu0YyT0IO46JLXscpyTbO5pbjVhmMQ6Up2hTctBy+OAGhUETEbP61O
	HJOzpGfM6M4TK23Zp7aw6kqFuSmndLAHSGJ8K07ltGiawC/BZFAe
X-Google-Smtp-Source: AGHT+IHdMahvsk2hiPcLQLFTajRterRsAVRoLlPSao00sFi2GHvdnhGLq5Smgs1qAUipDrz8egxq6w==
X-Received: by 2002:a05:6000:1203:b0:37d:4e03:635c with SMTP id ffacd0b85a97d-37d551d512emr359593f8f.21.1728595574599;
        Thu, 10 Oct 2024 14:26:14 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3d08-841a-0562-b7b5.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3d08:841a:562:b7b5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6a8940sm2402083f8f.6.2024.10.10.14.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 14:26:13 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 10 Oct 2024 23:25:57 +0200
Subject: [PATCH 07/10] Input: 88pm860x - use cleanup facility for
 device_node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241010-input_automate_of_node_put-v1-7-ebc62138fbf8@gmail.com>
References: <20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com>
In-Reply-To: <20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-rpi-kernel@lists.infradead.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728595555; l=2328;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=TCHsuzKnwrSzC8ELBgoH5r2aJODW1HU03jHewVR1CdI=;
 b=xHiUPq+0uEXEYbsSevTTOS03OD5A3ZbaOvxx2BJWcX2dzwkxmfC/OCrEYTRrgYVjPrjRoPxHD
 FE5yXQzgkTbBtgRrI9dLa6stp5BoMUgaC+F6ClAuNoxJm5fgiV8x+tC
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_222616_282989_30DDE3CB 
X-CRM114-Status: GOOD (  14.16  )
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

Use the '__free(device_node)' macro to simplify the code and error
handling. This makes the code more robust by ensuring that the device
node is always freed.

Drop the first assignment to 'pdev->dev.parent->of_node', as it was only
a shortcut, and tie 'np' to its usage as a child node.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/input/touchscreen/88pm860x-ts.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/input/touchscreen/88pm860x-ts.c b/drivers/input/touchscreen/88pm860x-ts.c
index 81a3ea4b9a3d..0468ce2b216f 100644
--- a/drivers/input/touchscreen/88pm860x-ts.c
+++ b/drivers/input/touchscreen/88pm860x-ts.c
@@ -117,13 +117,14 @@ static int pm860x_touch_dt_init(struct platform_device *pdev,
 					  struct pm860x_chip *chip,
 					  int *res_x)
 {
-	struct device_node *np = pdev->dev.parent->of_node;
 	struct i2c_client *i2c = (chip->id == CHIP_PM8607) ? chip->client \
 				 : chip->companion;
 	int data, n, ret;
-	if (!np)
+	if (!pdev->dev.parent->of_node)
 		return -ENODEV;
-	np = of_get_child_by_name(np, "touch");
+
+	struct device_node *np __free(device_node) =
+		of_get_child_by_name(pdev->dev.parent->of_node, "touch");
 	if (!np) {
 		dev_err(&pdev->dev, "Can't find touch node\n");
 		return -EINVAL;
@@ -141,13 +142,13 @@ static int pm860x_touch_dt_init(struct platform_device *pdev,
 	if (data) {
 		ret = pm860x_reg_write(i2c, PM8607_GPADC_MISC1, data);
 		if (ret < 0)
-			goto err_put_node;
+			return -EINVAL;
 	}
 	/* set tsi prebias time */
 	if (!of_property_read_u32(np, "marvell,88pm860x-tsi-prebias", &data)) {
 		ret = pm860x_reg_write(i2c, PM8607_TSI_PREBIAS, data);
 		if (ret < 0)
-			goto err_put_node;
+			return -EINVAL;
 	}
 	/* set prebias & prechg time of pen detect */
 	data = 0;
@@ -158,18 +159,11 @@ static int pm860x_touch_dt_init(struct platform_device *pdev,
 	if (data) {
 		ret = pm860x_reg_write(i2c, PM8607_PD_PREBIAS, data);
 		if (ret < 0)
-			goto err_put_node;
+			return -EINVAL;
 	}
 	of_property_read_u32(np, "marvell,88pm860x-resistor-X", res_x);
 
-	of_node_put(np);
-
 	return 0;
-
-err_put_node:
-	of_node_put(np);
-
-	return -EINVAL;
 }
 #else
 #define pm860x_touch_dt_init(x, y, z)	(-1)

-- 
2.43.0


