Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB7ED24456
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Oct 2024 21:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fHWRZlXxWyBjeMmMTHiCSMSAw8Pbb8irSTDpVqQUOvo=; b=TV2M3KJ3QM/wPpVx+FFsi13ZDX
	+cz8ixkxpZt/nH3SKoLGIf+NJFAKRvinPdMvXw6XWKoJhwO+32WYRx9hcI1zA2q7c99XetlpOfT9R
	n4AKnwnj58ZIz2kOChGW+HS9egds/KKpIju84Bbw96ZKTdpZzUV1ut1I/eJhEm3a/CSqf/5RZjkZV
	KqAWcUHkv8eT4Nq6Fvg/m14fbqxvkkQvh4JwOkhbc3YZGTIvPd9kB9RuoTWS2l0M0bfu5OQh+UnU0
	FDxA9V6uqdRmYTNuLfwy0eUuBOjA3BRMutoezU/7QXnUDMy/Q4fuUAXtrxjBR40fpER6EqUPQAJSc
	P+1hCPyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sz0nu-0000000EQ9Y-26Uw;
	Thu, 10 Oct 2024 21:34:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sz0fo-0000000EP6f-0X1Z;
	Thu, 10 Oct 2024 21:26:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=fHWRZlXxWyBjeMmMTHiCSMSAw8Pbb8irSTDpVqQUOvo=; b=WoLmjiGXrBlnGUJzVJPI82he94
	KNpIxsArIVJ8ztHuVDH+/xLnJ4cej9xPa05sZG9I7k5+BYTkhOHnhirh6M7fkWazKMmfRno0tm7w6
	FCFsA6GVrutWlXqfIXviKjOZg1ar71DwBFhnxm5tLYdzJ0+iCZXiYfwEt2qUmbKtCTu/765cH7Ai7
	VbeU9XrvbOgKzvMaWiSvSBqBWjWP63j9m4ek0IPUdRLqRhAe6BE+ritClmSh5ROEX1ISKDajnM09Q
	2Y1IDT9y2kAEYQ9BokmMyWdnQy3WcNb292pI5Y3PBeSS8X2q318120cy7c3iecH5+xvWtSddiO6Ni
	aIX8VqeQ==;
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sz0fj-00000005fdl-2LJA;
	Thu, 10 Oct 2024 21:26:13 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-42e748f78d6so10326185e9.0;
        Thu, 10 Oct 2024 14:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728595568; x=1729200368; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fHWRZlXxWyBjeMmMTHiCSMSAw8Pbb8irSTDpVqQUOvo=;
        b=hfOO8Qr3cfdTTivpmXhDYZZd2zPM2aTn7DlOShR/nEj3SKLxRQu2BrvPF2zHZLfOwQ
         AVnR5gfg/xIeczuO8oua9CGQ7xyc4cP8zttngmBvGirVF6477nwDG3gLT+otpA2FpKqE
         3apcY/M1CAOkIXF1c0HWXfmhf7/W0yhSWFD8PF36oZohNShNzaj+zvisKxq49HVw3fL+
         yPBa+tXNd1+YV38n2/tByjvsMksExXoAgnHq7NDhnI1SJw3r6S0yF3JiLrTO49rNL77F
         0Avi2GnrrIV4pCNjFz84vMuP+a/v4IDHTeeKsfvl2r9bDYKmGEdf9cW7xlIMDNDcIpSo
         8Hbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728595568; x=1729200368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fHWRZlXxWyBjeMmMTHiCSMSAw8Pbb8irSTDpVqQUOvo=;
        b=cNpRm4WN9Qeqagmf7tkOo5ocv08WcycHmPtJFd8FGdxqvgHR8kopT38osZpBxVdsaB
         4yhJFXu7kZ1syopL1L/OoxyeMcxOsvnMTHEV2dk3XPSNshUONmmvLRk+Ujc72SC7ZM9D
         f8k3tMybeOqH/U/Zl10OfolIf8LcfMHDqS1lZpqn2hoGfgpjvBOjjvlQe9cgRkJhD1XN
         Nz1I5sCqmdZF/5su+JGzGLqa5O8FM2k+BjmfQER52NQltOQbAfk6xfPJO5TyCrrfBt6b
         kfjdHkgAdG2nwIlUZJbY7SE6xd+Lv2j8RaGKiaLZTCmChyF29qoPp2KuqrCPTgmeEXRU
         9ifw==
X-Forwarded-Encrypted: i=1; AJvYcCUZRzYR3r2SjTgLikiIltWqxEZxQ5OfL9NdxHmBpRKYDcx52iWbqMvvLcGP4KfofkhwyYKw1quNU1mrlvLoKFmh@lists.infradead.org, AJvYcCVAGtpdNCQnwlfoMB55a+YOVkIVhxuQ9ps9w9dQTMwtSSrCbYHxS6SLOeKR5BRsooQRO+UqF3X3aohlWNIjigU=@lists.infradead.org, AJvYcCX7ESUg9jwrQqDh4Awc9/UW9AxJogI6NDUPtCia5iX0dJlrPbDjvL0H5EeVZVUhpnYjejpz7sDu8DE1oqNUoIevKQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwTZ4f62nRF2nNjJqZz9Uf/ifybgjfBHI38Y5IepgojbEA8jibC
	J3K+CsuZQzq/Tf11ajyVtL3Ig/aQLR/I4HAsJlLTrSa7f4gK9N5f
X-Google-Smtp-Source: AGHT+IH29d2ZIsfU/u9DFVW+6yCWUZ10F+EwzMZ6/EKx3GvDGWDTA3iS7grS2mWveZO8jUN402sziQ==
X-Received: by 2002:a5d:6843:0:b0:37d:43ad:14eb with SMTP id ffacd0b85a97d-37d551b7365mr236307f8f.14.1728595567520;
        Thu, 10 Oct 2024 14:26:07 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3d08-841a-0562-b7b5.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3d08:841a:562:b7b5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6a8940sm2402083f8f.6.2024.10.10.14.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 14:26:06 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 10 Oct 2024 23:25:54 +0200
Subject: [PATCH 04/10] Input: twl6040-vibra - use cleanup facility for
 device_node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241010-input_automate_of_node_put-v1-4-ebc62138fbf8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728595555; l=1953;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=tDYGmTbXvdvpbRFG0IrCSIV47mvFQRYsGGj+NcIIddk=;
 b=aQSM4gB2oKRbGTKDUnb+JrhfhsQ4SuW3g/7tQuRTKwxhS2Fu6V3AEwkunPJT91s0uiqLyuOB1
 PpjDY5LHIRBAvqrVdAPip7Uj9SnWp7iBwmBWmqkARDaPeBAPVRV8kuS
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_222611_787372_43348D71 
X-CRM114-Status: GOOD (  13.17  )
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
handling. This makes the error handling more robust by ensuring that the
device node is always freed.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/input/misc/twl6040-vibra.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/input/misc/twl6040-vibra.c b/drivers/input/misc/twl6040-vibra.c
index 78f0b63e5c20..afed9af65bf9 100644
--- a/drivers/input/misc/twl6040-vibra.c
+++ b/drivers/input/misc/twl6040-vibra.c
@@ -229,14 +229,13 @@ static DEFINE_SIMPLE_DEV_PM_OPS(twl6040_vibra_pm_ops,
 static int twl6040_vibra_probe(struct platform_device *pdev)
 {
 	struct device *twl6040_core_dev = pdev->dev.parent;
-	struct device_node *twl6040_core_node;
 	struct vibra_info *info;
 	int vddvibl_uV = 0;
 	int vddvibr_uV = 0;
 	int error;
 
-	twl6040_core_node = of_get_child_by_name(twl6040_core_dev->of_node,
-						 "vibra");
+	struct device_node *twl6040_core_node __free(device_node) =
+		of_get_child_by_name(twl6040_core_dev->of_node, "vibra");
 	if (!twl6040_core_node) {
 		dev_err(&pdev->dev, "parent of node is missing?\n");
 		return -EINVAL;
@@ -244,7 +243,6 @@ static int twl6040_vibra_probe(struct platform_device *pdev)
 
 	info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
 	if (!info) {
-		of_node_put(twl6040_core_node);
 		dev_err(&pdev->dev, "couldn't allocate memory\n");
 		return -ENOMEM;
 	}
@@ -264,8 +262,6 @@ static int twl6040_vibra_probe(struct platform_device *pdev)
 	of_property_read_u32(twl6040_core_node, "ti,vddvibl-uV", &vddvibl_uV);
 	of_property_read_u32(twl6040_core_node, "ti,vddvibr-uV", &vddvibr_uV);
 
-	of_node_put(twl6040_core_node);
-
 	if ((!info->vibldrv_res && !info->viblmotor_res) ||
 	    (!info->vibrdrv_res && !info->vibrmotor_res)) {
 		dev_err(info->dev, "invalid vibra driver/motor resistance\n");

-- 
2.43.0


