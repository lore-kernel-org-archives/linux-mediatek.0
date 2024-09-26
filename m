Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5918CEBF61
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Sep 2024 23:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HGJHwDpR/ji/cnkncpEc2TmRR9IZ/lolVNsmw4iGQAY=; b=obd0uiT+2KAV4XwdFqF9Th44ZF
	qlaFXWv7AzYqVSjBx5N+7HOG099GtjREztCw14kgcqTLC6Su3+6JbEAr+8Gmml7CAUbbrmQgx114p
	MyOOAI2GPpZjqejhfvANG0LmgMMEXTcD+omfFFwAopqqnO8DvdctPqxJlDdONSo2a+61HuSE8QtXZ
	7AshX82CRFCk+AE/7ltrYDd0fKSiPPM3WTkBcyb7WFVgvDXz2V0iYn87r8H42WY1F1w1Mc896w18P
	5aqZqT3TPIWd+GGxaxWPUe0Ts2sLCzPyO/9COAkimp5Grv5LQaILNYEOT2lrtAKLoiL6IMLmOHnuD
	XzEw+Pyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stxpq-00000009ZcD-3byM;
	Thu, 26 Sep 2024 23:23:46 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stxnU-00000009YrT-3jB6;
	Thu, 26 Sep 2024 23:21:22 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a8d6d0fe021so244076466b.1;
        Thu, 26 Sep 2024 16:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727392879; x=1727997679; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HGJHwDpR/ji/cnkncpEc2TmRR9IZ/lolVNsmw4iGQAY=;
        b=Q4Humw6c9oLMoIjMIu3RO/Tjdw3/jraIZtf5/IT6GgfKZDQ9qOX8AGn203R9IKTbls
         IAb/inU+vRzYgRaJAtTUhQ3FNAJjc+12ZqX9WzrmV1abe9uvKEYlyWaFIF/mb8xiLGmK
         YIw0Z0QtZPSg82jGeUMsopqrI5BiGUcG+hSHJ+dr7spKAummSdtRDfjMPcrvFo5zH3XM
         2zMNPRs4yzJ67bpr7kV99kjOs18K59aQp5jxSE0ffgMesay43RPJyGQoqLVQWM6PsDVT
         N1c/cOnVgt2x0V6/4tnO4nIeX8SA3UABla+3y0Yj643MtBnmhEaowD4EScWnkRWH1XTX
         QwLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727392879; x=1727997679;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HGJHwDpR/ji/cnkncpEc2TmRR9IZ/lolVNsmw4iGQAY=;
        b=txJqfybt8NLoaJEdygLMbooc86UX91PM3N/OE0mndq3G+DnesY73SJAW+tm6ksZ1Je
         O1wYYdwb7UvEf6bPhkH8/vEIowslYRFHOuh7IaHn42aBbLn/ZAx66hJfdpd2JzF8CTDR
         GtPGvIujMOg9xKJAfdS01PqnoK0d4FvMwlg+b3nV82sh27drcs6EM2Ln2rcfoklsZZ2u
         yfumMXIK1V+dhRHRBq3zcM5/1UHZVznqKWadKnO9CV2Cl41hqj2KwKVqLT5VdNpGagM7
         qoTS2nBMDUsqh0fdtf8CVpiSwT1rhW1Cp7/+ErbqPWzh9hcmAayMEY8hHCmJPXU8/x3r
         +ALg==
X-Forwarded-Encrypted: i=1; AJvYcCUpRo2xWbqgXUZo6xRseHpG1Ffk1rrYMBsLXrPSL1AdNGRvsv6qm6ru2Da372ZUS/GwuZVyoBXQd9C7ibpsPoo=@lists.infradead.org, AJvYcCVSStKCugo+ODfBy6GWIKc7VQpCA9ZYSEjezj2PgNQxs7aeL/MuLqqUtG7BGeG6dMJF2eunyblYAzHXZNM/PX2l@lists.infradead.org
X-Gm-Message-State: AOJu0YzZwx4AtnHhkEvJ8Pu7yUy0z6cJTRgyizS1D+eoWQ0lmlVDOP2I
	8vqllNOsGANKevoFmgmnPGhlA+a4sthGXB91UT2+GDpfocHU3ZAvnKgJ0SMB
X-Google-Smtp-Source: AGHT+IGY5Dz4pgmEK6u+H4dMIOw35D4e/9hhSxXD8+4Iw9UMbO9AvkfpZ6JWD1p0Ig/DDcHSjiCZSw==
X-Received: by 2002:a17:907:a41:b0:a86:91c3:9517 with SMTP id a640c23a62f3a-a93c496167fmr87272966b.35.1727392878703;
        Thu, 26 Sep 2024 16:21:18 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3989-b03c-7705-998b.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3989:b03c:7705:998b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27773c0sm50368166b.1.2024.09.26.16.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 16:21:18 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 27 Sep 2024 01:20:52 +0200
Subject: [PATCH 01/18] leds: flash: mt6360: fix
 device_for_each_child_node() refcounting in error paths
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240927-leds_device_for_each_child_node_scoped-v1-1-95c0614b38c8@gmail.com>
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
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727392874; l=1575;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=1/lxG5uyf8ycEv9Q6sKFSvHVcULTiG1X47zomtk2GFw=;
 b=l7jxa1PVRIFHMQnforadtxXgycvAan+1W9FAPjf/oLjtSQJykU+rNGG9xia/dfVKvn20xfSza
 2IKbNR03aEtAABYWTigl5u7JrFYAD61XGGxXgkaMcyX799cHVY4tp95
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_162120_965004_907F2D2E 
X-CRM114-Status: GOOD (  14.75  )
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

The device_for_each_child_node() macro requires explicit calls to
fwnode_handle_put() upon early exits to avoid memory leaks, and in
this case the error paths are handled after jumping to
'out_flash_realease', which misses that required call to
to decrement the refcount of the child node.

A more elegant and robust solution is using the scoped variant of the
loop, which automatically handles such early exits.

Fix the child node refcounting in the error paths by using
device_for_each_child_node_scoped().

Cc: stable@vger.kernel.org
Fixes: 679f8652064b ("leds: Add mt6360 driver")
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/leds/flash/leds-mt6360.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/leds/flash/leds-mt6360.c b/drivers/leds/flash/leds-mt6360.c
index 4c74f1cf01f0..676236c19ec4 100644
--- a/drivers/leds/flash/leds-mt6360.c
+++ b/drivers/leds/flash/leds-mt6360.c
@@ -784,7 +784,6 @@ static void mt6360_v4l2_flash_release(struct mt6360_priv *priv)
 static int mt6360_led_probe(struct platform_device *pdev)
 {
 	struct mt6360_priv *priv;
-	struct fwnode_handle *child;
 	size_t count;
 	int i = 0, ret;
 
@@ -811,7 +810,7 @@ static int mt6360_led_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	device_for_each_child_node(&pdev->dev, child) {
+	device_for_each_child_node_scoped(&pdev->dev, child) {
 		struct mt6360_led *led = priv->leds + i;
 		struct led_init_data init_data = { .fwnode = child, };
 		u32 reg, led_color;

-- 
2.43.0


