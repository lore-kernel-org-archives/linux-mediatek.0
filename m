Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC71D2444F
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Oct 2024 21:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gv2lnH1bFL+wtFjxRgBI14o1ODjTXUiEC0mw6OfkCr4=; b=PoiyEWsJR6nBooAa0Qm0ssjyBa
	JtRCwo2bLpPZ+opdIyVxOGFOcOm+1816erjAULbfEF1dVFEZzXxkYjlwt+YC5GZHFhQ8pCW0ZCamc
	3vVC2M/63qqOs68nEQgRBtX/p/byNnaglBlfZhRMGog8bAR6FII+SXyjcmtnMnElWLjlnvruIwGiA
	W8arc1vfwzWWqIAWrPrpCxfxhesnDLUx9CPRVP6tD/hnFlIGnm4xvLkv2S0Cx8muhwER3mGdqUIL6
	u4R9f7Whe+ZStpMKRQG4EsZ72tG7jC7y92MIrrBqwdHc0+rhCdaXX3w8z3Xm+d0KkazuDuA5GVywM
	cnExeQNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sz0mX-0000000EQ3O-2QWS;
	Thu, 10 Oct 2024 21:33:13 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sz0fk-0000000EP5P-12jG;
	Thu, 10 Oct 2024 21:26:13 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-37d5038c653so535503f8f.2;
        Thu, 10 Oct 2024 14:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728595570; x=1729200370; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gv2lnH1bFL+wtFjxRgBI14o1ODjTXUiEC0mw6OfkCr4=;
        b=FrZKvqXA/3kCP0SZ+Sb6LMj1QBzpsUUR+smS32frwjD9bbil2Q4XTSE9Iu83Q7Jryg
         ZthrzAGs9ZC8VGdEBlUQ6c8NoFk8Fg2c4oM5/lgRvUJPAjwUR/dSxWlqozj8S2S2P7RD
         QmizfITd2lwnt5p5+UkOP3ABZiSNO3E/793d5FWZZGuwR8ybHVcxGvvmELWHswCVSd9B
         KWYleCmhMloXbtViNvd4jQCysWBfSgj9SXaR24TX7+SjaRF7Z9jxxGS1FqmVbth5C28L
         KSwg91LgPQxyEaJIzQbc4MKcBc5ZYWGVmj7O0uyRq9iFEo+qoqIBAIXcU0a7FKuWOFVS
         DoJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728595570; x=1729200370;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gv2lnH1bFL+wtFjxRgBI14o1ODjTXUiEC0mw6OfkCr4=;
        b=fwlYhR3cHwzNjnyMzUkyE8DlYKvqu0a9PO6Nc0XIfv+KcIdBuyToz0/K4/y6r1gNGL
         854P5jcA5kRujzyL/4fvd0RjE+l0J7RRopjNxhX1JakRGtQq6wW51z3015Ix/VNJzh6N
         91Kt6erepnOT5X5JRCdfu89Cepx/NOZL5Utwb8m5nQSKzCOio4Zp5nEr79USqJwnAL9M
         VF6aM4q3VIypco9wxEv2AGTOtF9GVc1QJcFYidNrcOu9Mm7+dHxwXg1QnZKbUxMOT6j1
         bqBCgY7w9MrqlXPH64vZ3SSyvaSnFeDm5H+N+mTvhXIIe8HWn3oVm8ZfjOZ8jG6ysOC/
         90xQ==
X-Forwarded-Encrypted: i=1; AJvYcCVC7smsscjBQnFX5kYUkgaZ2Ugmq8ptQyImSg/+89Cw4/u0xZboNfCqm04LVIDoztXNZDFEshZY7frqYAjvg6U=@lists.infradead.org, AJvYcCXFaEBhL1ziQQ93IBDMe/hd2eWvHrsdBYhifekR1+n8gfYdGBapNykd/IK/IvogJI3DPksCaWC5kyRPIDMoEftGMg==@lists.infradead.org, AJvYcCXyJ6d/eTnfrxgXzTuI/W6h3ZfB2hNwDK95lvg4BdSwsDfzCr3Iq/WO6e5XrWXwuRfRAT6ovOuFG9iJG30aSia4@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7784Cf5AWQoVTLz7drI/7o20qWRRy8w8Bpi5Bb6G0uyMJTZE+
	+I/Vduic/CHRjgmOk+8nDcfrIWT6L+OVXluUdInrriK6/L0j+5IwzU1LW6KG
X-Google-Smtp-Source: AGHT+IHrNABpkE9MoIs4OHjPtix9N5xn9oz/4v1rJOCBX1LbPoC+c+XJfnpTq5HfizfEkADdbQPIpw==
X-Received: by 2002:a05:6000:1092:b0:375:c4c7:c7ac with SMTP id ffacd0b85a97d-37d552cb121mr309436f8f.49.1728595570453;
        Thu, 10 Oct 2024 14:26:10 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3d08-841a-0562-b7b5.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3d08:841a:562:b7b5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6a8940sm2402083f8f.6.2024.10.10.14.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 14:26:08 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 10 Oct 2024 23:25:55 +0200
Subject: [PATCH 05/10] Input: twl4030-vibra - use cleanup facility for
 device_node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241010-input_automate_of_node_put-v1-5-ebc62138fbf8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728595555; l=1014;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=8XjuIi1Czg4gxADzAUScoPXbznvngqAftxkGhXUC4pg=;
 b=/4+JFcJpLeL4D0LEVXjbes3plish7dWoFirHhI5dayVbYW4PEtxEp0kTrBT1nHE4UHbh0m0sS
 RPzjoyarLQcDfkWazC5yuILBtuqtMJaAHXEwwvzs+7J+Ee6KQ/9rewD
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_142612_324832_AE9DD4EF 
X-CRM114-Status: GOOD (  11.04  )
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

Use the '__free(device_node)' macro to simplify the code by
automatically freeing the device node.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/input/misc/twl4030-vibra.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/input/misc/twl4030-vibra.c b/drivers/input/misc/twl4030-vibra.c
index 101548b35ee3..b8ec5c7c5bce 100644
--- a/drivers/input/misc/twl4030-vibra.c
+++ b/drivers/input/misc/twl4030-vibra.c
@@ -165,15 +165,10 @@ static DEFINE_SIMPLE_DEV_PM_OPS(twl4030_vibra_pm_ops,
 
 static bool twl4030_vibra_check_coexist(struct device_node *parent)
 {
-	struct device_node *node;
+	struct device_node *node __free(device_node) =
+		of_get_child_by_name(parent, "codec");
 
-	node = of_get_child_by_name(parent, "codec");
-	if (node) {
-		of_node_put(node);
-		return true;
-	}
-
-	return false;
+	return node ? true : false;
 }
 
 static int twl4030_vibra_probe(struct platform_device *pdev)

-- 
2.43.0


