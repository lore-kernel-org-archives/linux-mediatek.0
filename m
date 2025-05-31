Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 683F3C5B549
	for <linux-mediatek@archiver.kernel.org>; Sat, 31 May 2025 16:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g3/7b7sAur+LGqclPpSqvB9KECRV68HTQpr4XmjRfR0=; b=Zqly4W6vOayGtbFaryAS7QX16q
	vIncUDWEjXR6Qo1GQYpWBgrUT55l+ZfUMlzFsPkAYsisq/hQCNyf3cwjtlXOXz0B5Oggyksrj4JZg
	Wgs+R+vhJS0o7EZBvXKPKbq1chsOpxz0TIu3an+S3MWaXThsfgYoXHz3I93qTUHRP9QqhEYdNhE21
	rLrk1LyyddWov0ehBfooq00N/SCA5iNpGsyxZ9JyUhqFkNsoDziXGVgUKHcCzGPzZ67qYgdA7x4P3
	HtEypZt3HIpd5US1l3xilCm8gN2cvQDClrCS5l+vLpIWCTA1I84aNRozahLadr3PGUACMPQzVsBTC
	545nK5nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLOcx-0000000413p-1yPD;
	Sat, 31 May 2025 16:00:07 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLOcu-0000000413N-1Iwt
	for linux-mediatek@lists.infradead.org;
	Sat, 31 May 2025 16:00:05 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3a4e749d7b2so537772f8f.0
        for <linux-mediatek@lists.infradead.org>; Sat, 31 May 2025 09:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748707202; x=1749312002; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g3/7b7sAur+LGqclPpSqvB9KECRV68HTQpr4XmjRfR0=;
        b=VP8G3lvpgrk37b4z1/N/wZq8yqPcOjRppkB2w/Ixx4Cp4K2lm7jJSgjYQ9GkF2X1V7
         GvUHI2jlvOp5QUmK8LCRYY7yUxxDx3yeibQ5Uu/rmozphYVb4YEQwSmDyTIxdBDornyH
         X/NfQlkVTcQizx42Rh662+ZGmiYPvTGXGyJLaXU7eeAfyoWHWLPp73mJgMnNF044grSq
         JdLdGmiSjTCE73leB754OnaStp5yUMgiNlz5mtVinSMcvqlYWw+X8ZdQs9/NpJQkjaeW
         HLILBW8t+tvUgDMRRYnuWmwYPDx0lBcoKVCRmnlAiSrB0DStaWTwBkpMQ5uh5a+RzEfj
         4O4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748707202; x=1749312002;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g3/7b7sAur+LGqclPpSqvB9KECRV68HTQpr4XmjRfR0=;
        b=vz+4827jMIsen3G1v1EhDjX91c7nySvi/npr0QCTfAjba8Nn4m0QOsdKqlLZ3XbOSz
         Z0+NIamGdUtwRLOjK2qpmYv0VNnFOzCBX7c+8tvWKkrARex4yjJ2VhUWFuJ8kzpmxnE3
         +RCVajKc1N4SYRl+/UDnyn+9L2lGQrv8BnP0awJJoILaGURtrkNgbxqPELzTx7GCqUGI
         tLeWSYMJ1p/RXmb0Xc6CoxLXEasIMxwJIV11AVy1tzR/cUdugZ1A2yOWX49TXLYKyjES
         H9vyvfcPQX7DWH3ESJRypQXbyFI9dmirAGuNcKZ/Jj7sYIo94pHjsSP2lrpMipO1h4fe
         hjzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVB0G52rEJN2eW0K9DRlpQxYRjidSORDiAwHXvNM9gOOY5GAijgFHaijWsJ3AjaLHLMgphxFnWQtdhx2cGgw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyhH0TJHVXl5CWKLsoLQiWDicLt8dHWxNVMkxSWf7poobGmmFIg
	J1RlfpSF0InFGNMMWHghyDRbiZRQmW+QzDU2kL1LyWVR3C2AOSde93I=
X-Gm-Gg: ASbGncve1pdiK2JhK/sN2klwLTl+llYjvviKspDr40vjemegxcIFYvGt55eB4mQkhPU
	JKl88bwaH5g0JJXlyKxtrI/nlvdnTRuGssztXhGPElk9V0g9vN676t9l4xGt4IzhOtLEPcRYWMl
	epKItfUQefiJsutmi4x6nqeS9A1gYVfMmeEfrztj9Y6REvic6lNMbg1Imyjy+K3rK90NZ0eCNhz
	pfJHSN4okCOPfMfLWALn8B+HcCoKtc7HwlBs8AZ/SdrXLNjSGQ+NbA+RQeKMvRD/vtt4/WmPB8R
	MqKhX5W+F3JMg0UE4dy0F2ApBlEQ8CxGze+2dLXN8Q1OmhG/B3M/LVmW8NVMQWH8ZHiw3lm8tC1
	5GxsxYgql6iaKSm35W4YBxCfGbw==
X-Google-Smtp-Source: AGHT+IG24VPqGTUlEu40NhO7aglqx2+Gnxxp+tCh5n+1wu6jubU6cE/Nh3inPKaAhC8Cjn9YWQ924Q==
X-Received: by 2002:a05:600c:358e:b0:439:8c80:6aee with SMTP id 5b1f17b1804b1-450d6543c86mr24150645e9.4.1748707201605;
        Sat, 31 May 2025 09:00:01 -0700 (PDT)
Received: from localhost (131.red-80-39-31.staticip.rima-tde.net. [80.39.31.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7fb0467sm53630305e9.19.2025.05.31.09.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 May 2025 09:00:01 -0700 (PDT)
From: Xose Vazquez Perez <xose.vazquez@gmail.com>
To: 
Cc: Xose Vazquez Perez <xose.vazquez@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	SOUND ML <linux-sound@vger.kernel.org>,
	MEDIATEK ML <linux-mediatek@lists.infradead.org>
Subject: [PATCH] ASoC: mt6660: delete MODULE_VERSION
Date: Sat, 31 May 2025 17:59:49 +0200
Message-ID: <20250531155950.101164-1-xose.vazquez@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250531_090004_351590_0CE21486 
X-CRM114-Status: UNSURE (   7.83  )
X-CRM114-Notice: Please train this message.
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

Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: SOUND ML <linux-sound@vger.kernel.org>
Cc: MEDIATEK ML <linux-mediatek@lists.infradead.org>
---
 sound/soc/codecs/mt6660.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/mt6660.c b/sound/soc/codecs/mt6660.c
index d16bccebae52..9415656f8285 100644
--- a/sound/soc/codecs/mt6660.c
+++ b/sound/soc/codecs/mt6660.c
@@ -578,4 +578,3 @@ module_i2c_driver(mt6660_i2c_driver);
 MODULE_AUTHOR("Jeff Chang <jeff_chang@richtek.com>");
 MODULE_DESCRIPTION("MT6660 SPKAMP Driver");
 MODULE_LICENSE("GPL");
-MODULE_VERSION("1.0.8_G");
-- 
2.49.0

