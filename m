Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05EE9D2444F
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Oct 2024 21:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T6P7FJOWA2mY2iTIPWe/1vsKU4sSdy22YB05qi0Ew68=; b=dZg7y7Bk4f5eBX7FjA+ekqsN/R
	dHPyIgbyVvxNKuPTYdol4VOUpNvw1kdKKb9MONpaSJiDJbLl5UFlei1U1UaJrJzAOwH4KyW52mz9x
	TRyY/eU4qWvsuMoC3NLrSmINcwCav3NwmU4gSQTGwMiCZyd93CW49wiq87rVpq4zm2Xl0tILxt9w0
	XBuNI1HkVukWAc8048L0ir8txv0xBDFIbVlEeTJOJRzgWnV5I0aCrvL6T+cDCYs2EdKiirl3Z5vGw
	bYRCB/ISZra5wyo3YrdsS0Pfl4aSni+yLVtWx7z7qXSxxtCfcP2NfJyMSObjmz+xg6W8jti7DZuyz
	j7TM4goA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sz0pD-0000000EQHC-416q;
	Thu, 10 Oct 2024 21:35:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sz0fq-0000000EP7L-0d6V;
	Thu, 10 Oct 2024 21:26:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=T6P7FJOWA2mY2iTIPWe/1vsKU4sSdy22YB05qi0Ew68=; b=WhuMMcvSR4/L6X8MTGTaaYYaxK
	Hh1wubP190wrZc9N2ODFv/sWKUFRi/LSz6FvDRVN1wzQFLCoKWjzzy+ULgXigGI2XNmu9mmH3lXV8
	w3KxDPP/9Dx00Ft6pUzX/DFNutyLEEH5VT3sNQT1wrf9j3vLvi7tjwi2etgLoEE553uQ65V0tCYHw
	vLPg8cEkuPTFCpgmkBhT84wXuySyzmKBNum/MP8IWVoocWIYLTuQJ5PvXLPzLdS08LTcvzqwpWoCR
	1Y6ccdEtbq0LoOVZDS8pV60b2w325w6yWZyLeC8zv9BqLedKRIxMfX177oDIH3ur0plMjV9HABzs+
	BV5dLgog==;
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sz0fm-00000005feH-3vVp;
	Thu, 10 Oct 2024 21:26:16 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-37d47b38336so768738f8f.3;
        Thu, 10 Oct 2024 14:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728595572; x=1729200372; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T6P7FJOWA2mY2iTIPWe/1vsKU4sSdy22YB05qi0Ew68=;
        b=Z1Unwjmm43mAvGaeKhdoCxHhgdCEVBw/r2dz/48P2lIZb+1Du0rKTzlJjf8xProvRg
         QiIElF1UJOCtFCl8L6vUNk9JYOFCJInbc7WuIkVwdAJkgTwnihTaJUlvBf/eu4gZYjUk
         TKOG1wraQpchhqNvnMpV8AkJC8+C978jC8tmuM75ho64A2pbz0PX96wcVil8nt8eraBN
         493e7Chs9+gMhCCN9c3a+vmxD5fgAgjN6H5R9PuxOOEyzv/Jyni3qDHxSgolP6eW9iIL
         cLlJWe6Pk/vJu6hPWeFaOAyfIGrlb5TEuMPPHu7nth+sGnOIyqymht9xiqj/L2/d38GN
         br9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728595572; x=1729200372;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T6P7FJOWA2mY2iTIPWe/1vsKU4sSdy22YB05qi0Ew68=;
        b=RoOStLVmNNbsavnKtX2HiVQBBQdEt01vgGyil6npEPLTAOA0bu2sPI369MsdoPnB2k
         XPRhN7ox3NzRFlkIgZKWYseXdlp+MkbAuZmBJUNpcZUJ/XvMDyZg44W/cs28QJjMgwSu
         02W9D04fmimsnbfu3KbKxZ2oiZ4bvwnhYmhTqPx5OVjBUt/Zamt/BzsAdNn/rU8L/jHe
         Pmck/iUWmMUkMgF30jPvGIkhvp8rjuyUqzVo5+CeIFAvDTUPJEIvyGvgwyvuIDSNZULo
         MDiv+clLY2jQXjJhmlyt41WPK4xWY/+af//4BM7uWyAhhJBlHBH5ymCDGMbhv0ToMxDx
         LOXw==
X-Forwarded-Encrypted: i=1; AJvYcCV60x7gbH5VJ8pQ1ICiIPi/ZLR0TldqsETgsf9k/GvzTp0Cgrn4Mrugu1nAwVP9iPY66QcgZddSwINbZPm9vIBxeA==@lists.infradead.org, AJvYcCWYTiTIiNpnFUKReLr4PRgEDjMSpwJUmV3jq3ZVtr/BXh2jgTnomY8mb9EDOIyKwfc2o37gw9e6pdrrxGwWa7g=@lists.infradead.org, AJvYcCWlq6c5313squvF6c9g8gNfG6eVPw/7bM7XvF5MLQ/8z6Ld+OrIqIyXtgCczfJw/tODFiCgm5LWbds0jjhAdf3W@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3lfpvIeDaSlzuzCmBmzRv8BJ/xVbU3Fq75uYAfRyI/fM6I/+l
	gqAM55jpqvrjbH8DZV6Dkp/qQa8OtYYlptY0Ed3lUm28du2dTry7
X-Google-Smtp-Source: AGHT+IH8aKF7ZsrrRJ3ZAqBCFliO5puHhZfFhiaORhFDWMLDX5I92S5u/UpYGz9iWlpxdFrHyFPBzg==
X-Received: by 2002:a5d:4fc6:0:b0:37d:453f:4491 with SMTP id ffacd0b85a97d-37d5518f628mr265658f8f.8.1728595572326;
        Thu, 10 Oct 2024 14:26:12 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3d08-841a-0562-b7b5.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3d08:841a:562:b7b5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6a8940sm2402083f8f.6.2024.10.10.14.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 14:26:11 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 10 Oct 2024 23:25:56 +0200
Subject: [PATCH 06/10] Input: sparcspkr - use cleanup facility for
 device_node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241010-input_automate_of_node_put-v1-6-ebc62138fbf8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728595555; l=1254;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=f+TcIDFO1FofKlmr06Cec6JytdWs70QlHA84jUACDyU=;
 b=rSoTsyqTSVQaxGJxx7Zk2ybfk4klIzu0zmDb1G7zEN3+e165HJnqYXSyzN09nq9Rh5EpSBTea
 SN2ySImkHOKABewNi/o9w3aNg+p9MtGzaFTKn16I0mkRni86QdhGwvt
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_222615_101029_D828B732 
X-CRM114-Status: GOOD (  12.81  )
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
index 20020cbc0752..bb1c732c8f95 100644
--- a/drivers/input/misc/sparcspkr.c
+++ b/drivers/input/misc/sparcspkr.c
@@ -188,7 +188,6 @@ static int bbc_beep_probe(struct platform_device *op)
 {
 	struct sparcspkr_state *state;
 	struct bbc_beep_info *info;
-	struct device_node *dp;
 	int err = -ENOMEM;
 
 	state = kzalloc(sizeof(*state), GFP_KERNEL);
@@ -199,14 +198,13 @@ static int bbc_beep_probe(struct platform_device *op)
 	state->event = bbc_spkr_event;
 	spin_lock_init(&state->lock);
 
-	dp = of_find_node_by_path("/");
 	err = -ENODEV;
+	struct device_node *dp __free(device_node) = of_find_node_by_path("/");
 	if (!dp)
 		goto out_free;
 
 	info = &state->u.bbc;
 	info->clock_freq = of_getintprop_default(dp, "clock-frequency", 0);
-	of_node_put(dp);
 	if (!info->clock_freq)
 		goto out_free;
 

-- 
2.43.0


