Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D64CEBF60
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Sep 2024 23:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WkHqvkI/1/i2Yqceu5g2GJiVANgvtprMciXZ8BQ+brY=; b=O+IKJohUcuS34YNLVicziALv+l
	olJW50w4on2BTC6WRcpHInZ0KlYmdIQIE5mLMOk3tbnKYnvWBi099/Ck9/8DzY9RF2q/bhs839CvW
	Lptn2O8PkY18F9tPnaow6sKmAdQzePU2Kg+7+vDp4CBdaCG1oRorXSZhPyUJuzRkFiFPu5JcR5hJU
	E8O09uwjfZvXpIw4z1nlMFrZGP6BGRS1pIM50yAPOHPDFfsI9wnIyBiuLTBTwkc3G/TdhPHMjmA3J
	EgJsY5W0MncNHyLbEc/ZogHmSHXUkYmjl7+8z8oasyem/mtE+X+6/qPgi/GsJcgrC6/IGJT5V+YcB
	Hd/mk6IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sty9R-00000009d6j-0tby;
	Thu, 26 Sep 2024 23:44:01 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stxo5-00000009Z7S-2dpD;
	Thu, 26 Sep 2024 23:21:59 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a8d0d82e76aso214563466b.3;
        Thu, 26 Sep 2024 16:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727392916; x=1727997716; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WkHqvkI/1/i2Yqceu5g2GJiVANgvtprMciXZ8BQ+brY=;
        b=bTL9N6Bock9ASFVAaLZ98jG+QZYQ0CHUDd4Cj1lnB8fLDe1XBZvmpFMTDTr5WDVLbG
         413CLIqrwbb9IGka/4Ck5VWQ9r34FSk4rZ9xs+PlUep1KUIKgL4NA14gXRmV2B+GXK0y
         Mm+3xUmzv+I2Sks7+wcTUr+2uaebvTSj+LsiiP9nDX47DN4LfTH+NhMcp/UNbGOsbzb2
         PFZCcxooGkzpM35AkkyAQXdSQHYCBjKkUFwaeQan8FR++5R3JsaltVnXEL+6qaqvufFa
         LfBcdUBo9jYHMDKf1n0Rm5eo2guMC10wOJYogbFcGUMul1qS2tWRCyKXhd+Cpu8omuLW
         qfxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727392916; x=1727997716;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WkHqvkI/1/i2Yqceu5g2GJiVANgvtprMciXZ8BQ+brY=;
        b=q4yppVGd3+v1gI5vlzIKmAsnNriozPgpbKgzCo+mEEL2r6LKwaAdYHngwIHORz1gWJ
         zyXkRl50aoqqNUj7mk9PMhW/nHSrofIY905Z3ZVTiSCG26mZ5UeBEJ/A74w/S1/P43SJ
         qk3q1s+iHVO93z2qc6WHGLjBbCx/DhvMJcW73XcoCizhm8KcY+jybAdShQVyrGthFMrm
         vaWNNObOygdYjTYP4w8OrFEMTLyX/LCRm9RF1o5BaPkB3jTH7Nitd+IrNAez1tpGZsC+
         qV4JqgShSQTpUFFy/YeEAp7GvH+5gbv3cyMkoZ0y5KvwpA5gXWPrq3kbFRbFfR52Rbzb
         Hd+g==
X-Forwarded-Encrypted: i=1; AJvYcCUSUuTL3hjCd92RyjhcTnon1IYg5sdKFuEpSg1zmzS/BgD0oq0ZTbl4HH2SzZx0xd/9BG60HMdLKvvZZ5gCJN4=@lists.infradead.org, AJvYcCVrS7hnyneWW7iiueyQSFsDYNoi9thOjhGqYK9w0iesxojPjP6ULg5NaRQf3G3ayRkodsujMW7mmxDqUbSC8PLs@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0Wr8Qkx6FZPAixmr72UtOs0pOlfFX6DHK2SmUybACIkm9gSYj
	RhMQxmwcHdqmUqFjkn76WhjYJCxrH1m03arVhYRLW6LzYaRFzYsYRVQXPAby
X-Google-Smtp-Source: AGHT+IHu7GUf4pEGuh3ajW4RTtn5QFJeznBoUNPfpuLLhiJAhuYOKyTqQymBYsqixg5g1+2YdfLoVw==
X-Received: by 2002:a17:907:7b91:b0:a86:c825:7678 with SMTP id a640c23a62f3a-a93c4a98df0mr96575666b.64.1727392915679;
        Thu, 26 Sep 2024 16:21:55 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3989-b03c-7705-998b.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3989:b03c:7705:998b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27773c0sm50368166b.1.2024.09.26.16.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 16:21:54 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 27 Sep 2024 01:21:08 +0200
Subject: [PATCH 17/18] leds: rgb: ktd202x: switch to
 device_for_each_child_node_scoped()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240927-leds_device_for_each_child_node_scoped-v1-17-95c0614b38c8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727392874; l=1313;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=Upol74WYOlhW6c4peUbPQECrXBC2IELBkPGR+0SYZwE=;
 b=f5ds5pKXTIF+B1jMaYwlb8PPJAHi7VfKk6RXlM18dKn8C3IQVGT8JccELHUU4Z+ooOWcfqKQS
 27cVaVRUn+uAh7+rCzd53VFlBKfzGLxtf5g5DJWnaFLJwjdJFD+8kOV
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_162157_740935_97ADEC2A 
X-CRM114-Status: GOOD (  14.59  )
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
removing the need for calls to fwnode_handle_put() in the error path.

This also prevents possible memory leaks if new error paths are added
without the required call to fwnode_handle_put().

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/leds/rgb/leds-ktd202x.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/rgb/leds-ktd202x.c b/drivers/leds/rgb/leds-ktd202x.c
index d5c442163c46..04e62faa3a00 100644
--- a/drivers/leds/rgb/leds-ktd202x.c
+++ b/drivers/leds/rgb/leds-ktd202x.c
@@ -495,7 +495,6 @@ static int ktd202x_add_led(struct ktd202x *chip, struct fwnode_handle *fwnode, u
 
 static int ktd202x_probe_fw(struct ktd202x *chip)
 {
-	struct fwnode_handle *child;
 	struct device *dev = chip->dev;
 	int count;
 	int i = 0;
@@ -509,13 +508,12 @@ static int ktd202x_probe_fw(struct ktd202x *chip)
 	/* Allow the device to execute the complete reset */
 	usleep_range(200, 300);
 
-	device_for_each_child_node(dev, child) {
+	device_for_each_child_node_scoped(dev, child) {
 		int ret = ktd202x_add_led(chip, child, i);
 
-		if (ret) {
-			fwnode_handle_put(child);
+		if (ret)
 			return ret;
-		}
+
 		i++;
 	}
 

-- 
2.43.0


