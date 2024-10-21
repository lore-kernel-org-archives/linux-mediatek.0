Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D864CD17130
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2024 20:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EXOGORusAheGbXjY9YsHgDJ6EQdczoB5sORBvnGhFxE=; b=0HvnGIlup5KmRD6EX/G/EM7i6t
	pGMhT/udsMsPJnmPzqjXqJmc2FFTJ24ylqSdya/0EDJQXr/F78InuE2kClun7zro4gYFZEyFYdPsW
	3sBg9lleqhLXSOBce0fFqbk69cLqb0P9v595ZExKp9/GQMU021BvLqMp5AlL8LKcl145Lg2YlDYJS
	/G2XrfQM5VC39/eGg2aOim5w3q+g+gJZzRohVoppbHZ1buFbKtFsoJgjfqU4VmjuMemlxN6aFd4Pa
	jDkhFeNMRHiC+6B/x4iDUwVOVzXtSiVusHQa99xDf26gzdVA6ZkBG+vuioXuedC8Aods/53v0M9zJ
	An5q44VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2z5e-00000008cI3-3ujT;
	Mon, 21 Oct 2024 20:33:22 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2z0z-00000008bXh-3Jko;
	Mon, 21 Oct 2024 20:28:35 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4314c452180so39599075e9.0;
        Mon, 21 Oct 2024 13:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729542511; x=1730147311; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EXOGORusAheGbXjY9YsHgDJ6EQdczoB5sORBvnGhFxE=;
        b=YVw/Q/6IU56w8GVn1ZpIkV4Br9W949xWG9l4UArgW0Sp6dXYX0AWQXr90LdTXqRl8A
         JUyXQNGvLbyAWjvxwiWfRIcApur8EJGHe19B7Y3PChAd912Ff3QOrA/AUsWxhwwZqs9d
         cvsin4DB0WmzEqHi5r0eeOcOf/kiQMYqJIfQt1Nu1Ziwf8MfVMkp7Ew6mau+AQHWH1Lk
         c/GcOH3JOFRBGrRFDiYnVbtOWq3tB/yrAI7iZ9XfQYgpfK6Dd0RZMwWInvl4tEEO63Ak
         tEE+je3WRUcJsgTtAOxvBmHCSgANPymakBFS/E5Ypw3hEzXDeT1mhqy/5/Oyg1w4P/bK
         vszw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729542511; x=1730147311;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EXOGORusAheGbXjY9YsHgDJ6EQdczoB5sORBvnGhFxE=;
        b=G+z4rJQm27vMH83EXYZBqo0R3c3Oz3Cy5fK6W/Ewj+fIbkdHuEc4ia4lvS0IreT+st
         vppZVmBg91GCt6lmJ1GaqwFBIcQRMzJgOSyAai0iNjX909upP9obm4EURAFNTTvOocOr
         KeaSvCoU54DQTS6+yVgy9vy5iHtrEVdrcq5tuOTV6wjbbx2vo0kFI86USO++coJtgojn
         Dnk4ENnbYjOytNwStwSH2kEIKq4CgPu1au54QYCM1MsEISmCRwA5gkjb4UKMrp7CUqf8
         YCJTSfkFUK7zd34WOdlF6qE5g/FnPPUKZJuwddcls/CjELpNWgpeGCpxxYeTFjkMtpd2
         Q4ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVailwFPTX1iNYRyeIkn26S2j5Ovt2eTAnWbpVyoVsJfh3KliET2HN/+yWXfIP2t6cfVTCLvOO0zrbQril1w1Q=@lists.infradead.org, AJvYcCW5NCXkbR7cn8dd6FKOKrAvG8Y+gzrghjz5/FWDOZavvW+CfWDlJ55SlYkHtQeIpBTer4a+ATWnXCSmmnh/Seb+QA==@lists.infradead.org, AJvYcCWoAtlarrYG1csTsWkc8Y6itC0GflRNG3iWqXrfvJgHK0HmnrRdLBUSJLsnpHzIR9kzDJAHtkNhYpkH5fuowoZN@lists.infradead.org
X-Gm-Message-State: AOJu0YxhD5Fj9QIgrkl/FJo27aeZpO87edeokRjJ9qH69BVPP+kbommv
	/ZQJj+hgaapkrNt9UujQCNaK9bTWSF4gc3SUntqugn3NMMQXDd1r5EGe74ZW
X-Google-Smtp-Source: AGHT+IFeBUJWb0/ZbDfeWjDseKy/gwO7cFLphK1AYxGeWiXouKa5IzBBH4eytV8fsrQlZUdSg1h2BQ==
X-Received: by 2002:adf:e00c:0:b0:37c:cc7c:761c with SMTP id ffacd0b85a97d-37ef12628famr494947f8f.3.1729542511079;
        Mon, 21 Oct 2024 13:28:31 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-023d-d91a-ee8e-da73.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:23d:d91a:ee8e:da73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a5b98asm5093263f8f.61.2024.10.21.13.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 13:28:29 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Mon, 21 Oct 2024 22:28:24 +0200
Subject: [PATCH v3 2/2] Input: sparcspkr - use cleanup facility for
 device_node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241021-input_automate_of_node_put-v3-2-cc73f636e1bc@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729542504; l=1243;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=F8YQ3HQYY2w+VhZkKOD4BkQV8/JYW/XDhWfSKzi9Psg=;
 b=M3sNpqf8PQCbKNRdH+2y4CtcxjbUY0Y4O+QhTzB0pxtLymehiwDv34D4DGZCIPoFG4+SgMjxG
 o6LPTXFYrTVCCVm12J/rHqr8htvu+Jf/gW7E3cYP+i57YZdxSIDbWpb
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_132833_867120_648E2CAD 
X-CRM114-Status: GOOD (  12.98  )
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

Use the 'free(device_node)' macro to simplify the code by automatically
freeing the device node, which removes the need for explicit calls to
'of_node_put()'.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/input/misc/sparcspkr.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/input/misc/sparcspkr.c b/drivers/input/misc/sparcspkr.c
index e484d79b5597..8d7303fc13bc 100644
--- a/drivers/input/misc/sparcspkr.c
+++ b/drivers/input/misc/sparcspkr.c
@@ -182,7 +182,6 @@ static int bbc_beep_probe(struct platform_device *op)
 {
 	struct sparcspkr_state *state;
 	struct bbc_beep_info *info;
-	struct device_node *dp;
 	int err;
 
 	state = devm_kzalloc(&op->dev, sizeof(*state), GFP_KERNEL);
@@ -193,13 +192,12 @@ static int bbc_beep_probe(struct platform_device *op)
 	state->event = bbc_spkr_event;
 	spin_lock_init(&state->lock);
 
-	dp = of_find_node_by_path("/");
+	struct device_node *dp __free(device_node) = of_find_node_by_path("/");
 	if (!dp)
 		return -ENODEV;
 
 	info = &state->u.bbc;
 	info->clock_freq = of_getintprop_default(dp, "clock-frequency", 0);
-	of_node_put(dp);
 	if (!info->clock_freq)
 		return -ENODEV;
 

-- 
2.43.0


