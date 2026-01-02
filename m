Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30DC6FA3758
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jan 2026 20:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c7qZYSeLZChIxDrw/4tv0b/VSzAX1CnFXje+sP60SRE=; b=1tbXEVpJJrJwg+rqNCRHMTdfyt
	yVT4PUfDcdgOg8oXxOrQEBR5YOhns67OJdKcFhGvWs8nirEm85h016Z2qzvrQQBKVMRHvQKBbjYVt
	Lps1ij2w270fwWGOePTZ0UWJNMinK77AYXwvkj6FUXpXnf9jSqIwrhludZB4vit3eV+QcJ/DcJdYM
	AQYY6XjHaciMGrmmUOaCCI58FTjznQh7WvRxHU8nG6NW/1JNXPu9IxAgvY7w/wEJp5fjkp3AKpw1H
	P9es95+GVXnfuBlNFvHOnaayIvuF0S8VQH2XW8AaEuRrvW5fBUszpAQkSgrOtCmP8PqXZX9WL/1cr
	cVq6vGBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vblMt-00000008gkE-32ng;
	Fri, 02 Jan 2026 20:03:27 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vblMp-00000008gg5-1D5i
	for linux-mediatek@lists.infradead.org;
	Fri, 02 Jan 2026 20:03:24 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-29f30233d8aso142989505ad.0
        for <linux-mediatek@lists.infradead.org>; Fri, 02 Jan 2026 12:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767384202; x=1767989002; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c7qZYSeLZChIxDrw/4tv0b/VSzAX1CnFXje+sP60SRE=;
        b=SRcAQhH7vflp3zZNMrenfOtqw4d19DcWn+ZWxBZ/PN6MZLrpGGcBWM9z6NJKhNVLSU
         eQ73+WCfAu+oLXsrsf70OiIm9YQrNglNges+cNFfCvSxriVeneu7vrJysOKscWrfAN3W
         PVPbxbP8YLv523a7CuzmYWYRdZu5kLhzBrSo7HBOhkrcBqhg8drEEDNF8CA6SHT+z6vB
         Y/TFuWt8Elw0hebOvyfCx7rYrTSYcmFOuouPDyRNX1nXO0+QfeBIwMYKqMhPxEj+b1Eb
         OtYGZfxqhkwfoM9IG5jRNTbHBbP6xOsCAEXg02L54SdZ9V1wKGsbxF/IupAnK9oBMPAW
         XxCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767384202; x=1767989002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c7qZYSeLZChIxDrw/4tv0b/VSzAX1CnFXje+sP60SRE=;
        b=q9vd8ainlg+1IXdC0npXEPUmBxJ0EzYbHvISWWdOacMmTWISMxvk/hCE08fnOR3mOR
         bXndi2lx1SF7DX3jhEk0Ox8MqkAY5a6hFJUMSY3RH2V2KZ0f65lZE4a2shHr04QAbAto
         BpbquOXdrlqdQT0ChXFx2179ytwxnkKCT2xM2FvYRbNSmiXMItyIh+zuSMimS8kFsUHo
         o0kiYXzKE2PGXDkQnJPmm2sQdY21LmLaYkPVtYbk7lvEbz6BFFXn0s0FSfOcvoAslK58
         jxt1xzEhJj2v3tbkehVa51NA5dY0p/isd5KdIcyekPOBug0vcXXsJpiej0JRSesrdDBB
         peSA==
X-Forwarded-Encrypted: i=1; AJvYcCUYRaOmqQif3jm4xm6Ux9X1dxOibhi6ZfTfeW/mpKCBVPGCaagSCuF9BnKUKsY8RlFSe+n3hpsgsQO7EQjKIg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwkZqqe5dcwCakVnK51qWE15EYEE7OaDth8+v7o5naEe/uFsJ+I
	K1ZFv91FHtHcv5bQjjvFclizP1ated0sr1mBRRbq/j/vabA7LyXLVj2FmZ572EST
X-Gm-Gg: AY/fxX7mCF89/asl9G3+n1mQuYcJhNIk8nLcx0c2xbfHQxht5ALym+mpaEV6RTRbv7V
	BisJgNRleeI1NIxJQ38IOiP5ZmZxzIXDLhrJWW8Ny0dmNU5WUjvOCcntP1f+qzyaFT5vz6V2gR2
	5neV77FScTcTWYm9T2u4h9WUoQu4COvrvPiCOig+Bw0/v4dQFSxkuV4R+1NaHLBTJdtwYr8zsXn
	SFZr1x/1hZUzA/pvLJ1DobfqVA0L1rlI+Q+NzreM/2IgQvAIGOkHzw2SUwPmpbAtmjQW0TFwdU+
	Meqg4NaB3hcKzLSLP02NZx20RMN5WbPXXmw5T3aMsUkpuWaDOgz7mOF9SXiYS3aBuKaBsb6becn
	etRNjj/bVUMuRZGhmujz77rveu7yQPFXhN/ssHwFsAo7iX9/W72EFEHRGAGHwM2H0fRfzWnkFFn
	ydJuKbJbBDwPwzegYqMeVyDLau9EnuGMqInfOizkqnbowIoeZCCctXqdf7UAUnoVg=
X-Google-Smtp-Source: AGHT+IGGD10yYGQ2fi7EjrvXcQ2RpewtLBipkaRDvFeki8yg8+BUwMUf7qrB19+RqRFSHDwFrqgGrg==
X-Received: by 2002:a05:7022:6199:b0:11f:1e59:4c2d with SMTP id a92af1059eb24-121721acb6dmr36824686c88.7.1767384202231;
        Fri, 02 Jan 2026 12:03:22 -0800 (PST)
Received: from zubuntu.bengal-mercat.ts.net ([2001:5a8:60d:bc9:9ebf:dff:fe00:f8f2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217253bfe2sm120203795c88.10.2026.01.02.12.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 12:03:21 -0800 (PST)
From: Zac Bowling <zbowling@gmail.com>
To: zbowling@gmail.com
Cc: deren.wu@mediatek.com,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	lorenzo@kernel.org,
	nbd@nbd.name,
	ryder.lee@mediatek.com,
	sean.wang@mediatek.com
Subject: [PATCH] wifi: mt76: mt792x: fix firmware reload failure after previous load crash
Date: Fri,  2 Jan 2026 12:03:13 -0800
Message-ID: <20260102200315.290015-5-zbowling@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260102200315.290015-1-zbowling@gmail.com>
References: <20260101062543.186499-1-zbowling@gmail.com>
 <20260102200315.290015-1-zbowling@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_120323_336146_F2326374 
X-CRM114-Status: GOOD (  12.30  )
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

If the firmware loading process crashes or is interrupted after
acquiring the patch semaphore but before releasing it, subsequent
firmware load attempts will fail with 'Failed to get patch semaphore'
because the semaphore is still held.

This issue manifests as devices becoming unusable after suspend/resume
failures or firmware crashes, requiring a full hardware reboot to
recover. This has been widely reported on MT7921 and MT7925 devices.

Apply the same fix that was applied to MT7915 in commit 79dd14f:
1. Release the patch semaphore before starting firmware load (in case
   it was held by a previous failed attempt)
2. Restart MCU firmware to ensure clean state
3. Wait briefly for MCU to be ready

This fix applies to both MT7921 and MT7925 drivers which share the
mt792x_load_firmware() function.

Fixes: 'Failed to get patch semaphore' errors after firmware crash
Signed-off-by: Zac Bowling <zac@zacbowling.com>
---
 mt792x_core.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/mt792x_core.c b/mt792x_core.c
index cc488ee9..b82e4470 100644
--- a/mt792x_core.c
+++ b/mt792x_core.c
@@ -927,6 +927,20 @@ int mt792x_load_firmware(struct mt792x_dev *dev)
 {
 	int ret;
 
+	/* Release semaphore if taken by previous failed load attempt.
+	 * This prevents "Failed to get patch semaphore" errors when
+	 * recovering from firmware crashes or suspend/resume failures.
+	 */
+	ret = mt76_connac_mcu_patch_sem_ctrl(&dev->mt76, false);
+	if (ret < 0)
+		dev_dbg(dev->mt76.dev, "Semaphore release returned %d (may be expected)\n", ret);
+
+	/* Always restart MCU to ensure clean state before loading firmware */
+	mt76_connac_mcu_restart(&dev->mt76);
+
+	/* Wait for MCU to be ready after restart */
+	msleep(100);
+
 	ret = mt76_connac2_load_patch(&dev->mt76, mt792x_patch_name(dev));
 	if (ret)
 		return ret;
-- 
2.51.0



