Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 879E3D17131
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2024 20:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bnt+KzLj0gBtQtESfccDhJlW0AjYZvv3WXxt0v6eRC8=; b=J0XMQMB9ujyn6y/n6i1Kj4D/CX
	QdfBswSGH6Ft/PcSY45yoHga3vtdBSbE18TaV8xMs+qyYeOyv3UFtjYReQWeBrupqEDJg7oI8Maia
	ZmOwN7lb/pEhX1x3j/STpPG0T1MMiQD1Q7I9ksI1WyWXhn+xq2ioV0MBmCAH0GLdukZy89Ql0aPtL
	7Or0jS02OaaUZsDnK60LwjvGTobDjrfzOwOQJBa8Eivu674KNybQpGhE5CED5YJQvfQXz9LjS2ntA
	Wfv4myELXNjgZnM2StWZ853qw3dOknf885uL7e9J9Bze9hCZuJDtgCAt/y0k9yTJyaWlomhgbljEO
	eGNEWNSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2z44-00000008c6Z-1FbE;
	Mon, 21 Oct 2024 20:31:44 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2z0x-00000008bWt-3WAO;
	Mon, 21 Oct 2024 20:28:33 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-37d4ba20075so3692165f8f.0;
        Mon, 21 Oct 2024 13:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729542509; x=1730147309; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bnt+KzLj0gBtQtESfccDhJlW0AjYZvv3WXxt0v6eRC8=;
        b=SN1X9xtNYjMJUp/BbJdqPiulriBWUVsAXzoee4TwhZVflytgMsi9nKzHH0MyVdILIl
         pKbnK9/hzCzP8wX6j2CvFuK1lNvhO8kLBo7lHZ2t1W8a5upVd6yhpvHKg3uCevLQPhe8
         hxReITTzilH/xGt7UcIfzxca/i248F48G/5A73Y8QfKUR0E7s8KTxffRJgdAKBpQ2HKS
         BLytZP3Lj0eIJoLSoI2DsHfIqC60SMzSuv/7xoloeXIIzHyOVKj6R8/11cqHobO+c383
         1s2IWB+xin+Td7HKiOrOwd0yWjFOrnCcRiBeCT+EGNBxwGPTJq+k3m0Zhzpjt/sqOukM
         8tqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729542509; x=1730147309;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bnt+KzLj0gBtQtESfccDhJlW0AjYZvv3WXxt0v6eRC8=;
        b=Ws6tAgXqUfjHnlMlBzvG4Tiv67Feldix2Vclg9nRh7s1blJ71FeDTLFAUCcd3S906Z
         1IeImbKl3WsD8fI/UqhC0ZLDFNqAiEis44E/0hgjCfyjkNHKNNTYCUEIUSl2rH/vPcHF
         URAtQxkF2+jgEKPK7mVA6CF0JAYHAwYwLAiOCzjg5Y4R2YNuMEWMTKoI663OqxLSuVjw
         4vUcztK38QkgTxbqwWdRIpNTWoeQtVb6ReB6A4J26hcaUQr/R7ZyeShoTFEnUD+bNtnY
         MWId3YS2XGtJPW33uO5CyFH+YeRsxnHpzRXgbqzSy+KafhBGW4BkVbS5YitGFP+lzW4c
         2W0w==
X-Forwarded-Encrypted: i=1; AJvYcCU9CtvLXJ4ir0qI5wmyPEX4lAELLYBRhKzeSzANM95GW4r5RHxy0yLmJH2+OTLeNLIDvbHEbgiOlQ8Gp7RTaB2G@lists.infradead.org, AJvYcCUI6m3agVveFH0ijBKO1G/kZErqjQ0t3AfshfCFEVAg7e3zJDQumcXGrufzgougdO8KR2VPi/4dEH3OBTEjP0M=@lists.infradead.org, AJvYcCWEtIbaEJRshYStS5ac1UZN/3gdu482W7nzDPDugTu70x+2kkTzCPnydxPevU3S6O79stUetoqelY3ET/fnvnxdDw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwpoDy/WcZTDn25ZDw0HKatNijpQeG+RfRPfmMt/iDtt0OqVVur
	RswPRjs25ntMtkumoaPtWkPzd6XA0Tewims9Yx3rHhawoJF3FZpHWJKRKVWX
X-Google-Smtp-Source: AGHT+IHcUlF/WH2MPR2lAsWY2YWdvWUxpJiy03CKuMiiIgxGTQhVcc8bGyCYchZqxExzbbX7v1K48A==
X-Received: by 2002:a5d:5287:0:b0:37d:4d6c:e0ef with SMTP id ffacd0b85a97d-37ef21ac2b1mr254788f8f.43.1729542508922;
        Mon, 21 Oct 2024 13:28:28 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-023d-d91a-ee8e-da73.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:23d:d91a:ee8e:da73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a5b98asm5093263f8f.61.2024.10.21.13.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 13:28:27 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Mon, 21 Oct 2024 22:28:23 +0200
Subject: [PATCH v3 1/2] Input: sparcspkr - use device managed memory for
 'state'
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241021-input_automate_of_node_put-v3-1-cc73f636e1bc@gmail.com>
References: <20241021-input_automate_of_node_put-v3-0-cc73f636e1bc@gmail.com>
In-Reply-To: <20241021-input_automate_of_node_put-v3-0-cc73f636e1bc@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729542504; l=3463;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=M/Qr46XFwQ4/bdir1XHUmm8htVq32+gFJnABKw/M8Is=;
 b=eLC/YTa39ljswAiRUJSjizOUy7uUis4Qgy9tB8DOpHiJSwZttYfbyRD7PSLEhYAB/prbxqkQ9
 6T2OZDUN2oUDuKXvYkBEaNCIezAe0U9OtpB2rKi/1gTULR3vtmiQa8B
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_132831_924379_9CDBD944 
X-CRM114-Status: GOOD (  14.29  )
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

Use devm_kzalloc() in bbc_bee_probe() and grover_beep_probe() to
automatically free 'state' when the device is removed. Drop the
kfree(state) calls from the probe error paths and the remove functions
accordingly.

Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/input/misc/sparcspkr.c | 41 ++++++++++++++---------------------------
 1 file changed, 14 insertions(+), 27 deletions(-)

diff --git a/drivers/input/misc/sparcspkr.c b/drivers/input/misc/sparcspkr.c
index ff7b6291894a..e484d79b5597 100644
--- a/drivers/input/misc/sparcspkr.c
+++ b/drivers/input/misc/sparcspkr.c
@@ -183,46 +183,39 @@ static int bbc_beep_probe(struct platform_device *op)
 	struct sparcspkr_state *state;
 	struct bbc_beep_info *info;
 	struct device_node *dp;
-	int err = -ENOMEM;
+	int err;
 
-	state = kzalloc(sizeof(*state), GFP_KERNEL);
+	state = devm_kzalloc(&op->dev, sizeof(*state), GFP_KERNEL);
 	if (!state)
-		goto out_err;
+		return -ENOMEM;
 
 	state->name = "Sparc BBC Speaker";
 	state->event = bbc_spkr_event;
 	spin_lock_init(&state->lock);
 
 	dp = of_find_node_by_path("/");
-	err = -ENODEV;
 	if (!dp)
-		goto out_free;
+		return -ENODEV;
 
 	info = &state->u.bbc;
 	info->clock_freq = of_getintprop_default(dp, "clock-frequency", 0);
 	of_node_put(dp);
 	if (!info->clock_freq)
-		goto out_free;
+		return -ENODEV;
 
 	info->regs = of_ioremap(&op->resource[0], 0, 6, "bbc beep");
 	if (!info->regs)
-		goto out_free;
+		return -ENODEV;
 
 	platform_set_drvdata(op, state);
 
 	err = sparcspkr_probe(&op->dev);
-	if (err)
-		goto out_clear_drvdata;
+	if (err) {
+		of_iounmap(&op->resource[0], info->regs, 6);
+		return err;
+	}
 
 	return 0;
-
-out_clear_drvdata:
-	of_iounmap(&op->resource[0], info->regs, 6);
-
-out_free:
-	kfree(state);
-out_err:
-	return err;
 }
 
 static void bbc_remove(struct platform_device *op)
@@ -237,8 +230,6 @@ static void bbc_remove(struct platform_device *op)
 	input_unregister_device(input_dev);
 
 	of_iounmap(&op->resource[0], info->regs, 6);
-
-	kfree(state);
 }
 
 static const struct of_device_id bbc_beep_match[] = {
@@ -266,9 +257,9 @@ static int grover_beep_probe(struct platform_device *op)
 	struct grover_beep_info *info;
 	int err = -ENOMEM;
 
-	state = kzalloc(sizeof(*state), GFP_KERNEL);
+	state = devm_kzalloc(&op->dev, sizeof(*state), GFP_KERNEL);
 	if (!state)
-		goto out_err;
+		return err;
 
 	state->name = "Sparc Grover Speaker";
 	state->event = grover_spkr_event;
@@ -277,7 +268,7 @@ static int grover_beep_probe(struct platform_device *op)
 	info = &state->u.grover;
 	info->freq_regs = of_ioremap(&op->resource[2], 0, 2, "grover beep freq");
 	if (!info->freq_regs)
-		goto out_free;
+		return err;
 
 	info->enable_reg = of_ioremap(&op->resource[3], 0, 1, "grover beep enable");
 	if (!info->enable_reg)
@@ -296,9 +287,7 @@ static int grover_beep_probe(struct platform_device *op)
 
 out_unmap_freq_regs:
 	of_iounmap(&op->resource[2], info->freq_regs, 2);
-out_free:
-	kfree(state);
-out_err:
+
 	return err;
 }
 
@@ -315,8 +304,6 @@ static void grover_remove(struct platform_device *op)
 
 	of_iounmap(&op->resource[3], info->enable_reg, 1);
 	of_iounmap(&op->resource[2], info->freq_regs, 2);
-
-	kfree(state);
 }
 
 static const struct of_device_id grover_beep_match[] = {

-- 
2.43.0


