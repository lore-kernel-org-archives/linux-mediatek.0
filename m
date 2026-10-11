Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD1ACA9ECF
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Oct 2026 00:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4/sSbLwCPSp4q8xFYrtdK+Sl95iWhYZVxZM9PhMl9mI=; b=ijMr9Jbb7/msPTOM4xRtaT4fAm
	6dA7JFugyuDtEZC/RnzNH6IYVlbqU0RABhcy4qtcEHfXJw/RW2NSqNqx4Lmeu9jXUCfKorOsLPptj
	MM5LqSre6QBqfIHsdVDjqsQYrPl9n7ST+SEtOKrmX7mOZpCe/Ee1sZGaQrwfQNOta5iYBrlMsTQ2R
	MvL3DOvSbFIllRVCnPZp+8T6ZIyU2fPw4dWepGGosc+jArIEoS811wMFF96RID3gEAol+bfOV4orj
	+KH2ytwwOoe1ib3CbUUn8CzcIXfl48O5nYr0NfVmf2WX6enk6mDdqjmCQ+p7t/V5SPX6dRDybkEKD
	8MDHv5lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFhfA-00000008akR-19G8;
	Sun, 11 Oct 2026 00:43:44 +0000
Received: from mail-qk2-x08.google.com ([2607:f8b0:4864:34::8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFhf1-00000008aeX-3eEs
	for linux-mediatek@lists.infradead.org;
	Sun, 11 Oct 2026 00:43:39 +0000
Received: by mail-qk2-x08.google.com with SMTP id d75a77b69052e-53524092d9cso10206621cf.1
        for <linux-mediatek@lists.infradead.org>; Sat, 10 Oct 2026 17:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791679411; x=1792284211; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4/sSbLwCPSp4q8xFYrtdK+Sl95iWhYZVxZM9PhMl9mI=;
        b=go55O72ZyIHtFpvmuVHuPCWWfkmlDo/8MhNLKUAxiEaieRV4Y/7yAkuXvk3KF1XDlj
         Ms78BjGpK7XjKTDVvOziGHsiDSGdVMp9CHGI6PCIG63y7qC0pwZ0Bl4/WUXwUCX3cIHt
         oMDskl/lpMTFgE2O3Yrz9pPExAeCALa1H76o0g17YobiwgRoBu34s06tRodOzzwUAff3
         DdJYSIVDNoJlRfJr6zQxiW6s8tEsz3gG8bxLi5d2RoQ1OP44vC7o9EIpCvsJUj56OnCq
         z8unmS3Tmq0snR4BBpzGcDtCjO0Q4FdZEYztLlc+Oo8+Wq0orGkSgteeW5NF9+6kEXu0
         Wj0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791679411; x=1792284211;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4/sSbLwCPSp4q8xFYrtdK+Sl95iWhYZVxZM9PhMl9mI=;
        b=JU+g+/+/sXi6Tnf3o4CJ1aQ2JNJ8xMXAn21eOa4OERLmL7x7G4d6HnuT2M/8R4xTLS
         XBPElg0Yp2TDLzoPrJWleJ8Sc3a5obJRXoh0KF5DZUyXYS9OulWd7ixlEirB+anPkWUw
         76AFa7AyeXrcgBTNqHhW7emLkqf5IytFD6fJLrNzJcjbQ3ALbNUBSB07x712mTxd3yN4
         2hD7hXBrdTZwrcsATr2+4dZ+z+TQiXnlQ6y89vHjra27VjuKRTKVNJhqNRu8PUM9JbYi
         nxoe1bI4+InHG8AQqy9GMCw41hXIW2WnO6yRk28SUeCPFGmVCOlYiWoX1Q8/JtmTom84
         r3ZQ==
X-Forwarded-Encrypted: i=1; AKwUvBzXONgcvTdP2pqkNtZDW3LFG5CUccVTbOkfJgsyzglEZQiV8Gsk8Skt4fftXQ9pS+F8r7UTNOAf7VegzHGpgA==@lists.infradead.org
X-Gm-Message-State: AFq9FYLlTKSBWki2TQYWm+STHO3DlMI1gzlj9x0oR8A+4KnBPD8d4Wew
	MIhnu8cKGr1a2ldRJs9DgivvqXBtHn6S1Dk5Oj8350ddLu0gYSFICB7N
X-Gm-Gg: AYBFou1PeIvPUjkCaYfofndJMi1ZWHEG2IVWrjhZ/Qi5DeoTIDMN/qVMT36AhHAYLJk
	fN+qjLlasme9wpP1kQDJ9T1ShoGtSmWVlky8tM1w68esZTpajOKl03qWIcZ1fNR8TFYpZgh7qHd
	JvhAfJnozCGXHti7WGU1Jn7nMYNyZw3oUOrOOZVks4cx+feG6EEyJuYXxKqMaMiaXosKR+3hN0M
	FG/aWMG5lR+LrKvYXE/7z+vOjUqM06i3c5FDmVn5KalHzogsoSvQ7hD4T1o1n3ilxudB5/wnUXX
	8YbMZ74XvA+RlTVd1We8Mzx/flX+LTukRTey+bWgGK8sdrrphIxt5RNH3YHK2i1ED2fXVUpQauN
	07kUia37qF0bqQQmVV7s/eSt9T+O93WnGwT10m343YnBjsAHIoHQlR5bw1m9qSyRRrWUcM7La0Z
	hUKoIJ/Iq1YP445nyfMNUSUAcQCWv2+dj5d45tF7AuVUdhnM7XY59YLYGHJ0aquyceu54=
X-Received: by 2002:ac8:5dcb:0:b0:533:79cf:18ea with SMTP id d75a77b69052e-5359fb88606mr102144591cf.57.1791679410806;
        Sat, 10 Oct 2026 17:43:30 -0700 (PDT)
Received: from omarchy ([2601:804:8780:3df1:6ff:277e:31c7:ac13])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b7dd1a0sm49229871cf.27.2026.10.10.17.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 17:43:30 -0700 (PDT)
From: zoan37 <agentzoan@gmail.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Freddy Hsin <freddy.hsin@mediatek.com>,
	linux-watchdog@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] watchdog: mtk_wdt: Stop a running watchdog over system sleep even if not opened
Date: Sat, 10 Oct 2026 20:43:22 -0400
Message-ID: <20261011004322.1118027-1-agentzoan@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_174338_101253_F16EC019 
X-CRM114-Status: GOOD (  14.54  )
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

mtk_wdt_suspend() and mtk_wdt_resume() only stop and restart the
watchdog when it is active, that is, when userspace has opened it.

But a watchdog that the bootloader left enabled stays enabled at probe,
marked WDOG_HW_RUNNING, and the watchdog core pings it until userspace
takes over; that has been the case since
commit bbece05c0d3a ("watchdog: mtk_wdt: Remove mtk_wdt_stop() in probe()
to prevent the system freeze and it doesn't reboot by watchdog problem").
If the system suspends before userspace opens the device, or userspace
never does, nothing stops the watchdog and nothing pings it while the
system sleeps, so it resets the system one timeout (31 s by default)
into the sleep.

Also stop it on suspend and restart it on resume when it is running in
hardware, like sp805_wdt does.

Fixes: bbece05c0d3a ("watchdog: mtk_wdt: Remove mtk_wdt_stop() in probe() to prevent the system freeze and it doesn't reboot by watchdog problem")
Assisted-by: LLM
Signed-off-by: zoan37 <agentzoan@gmail.com>
---

Notes:
    Testing: on an MT8189 Chromebook (next-20261008 plus MT8189 support)
    whose firmware leaves the watchdog off; a local module parameter starts
    it in probe the same way a bootloader-enabled watchdog is picked up
    (WDOG_HW_RUNNING set, fed by the watchdog core, nobody opening
    /dev/watchdog). Without this patch the board reset about 30 s into
    s2idle; with it a 10-minute s2idle sleep came back without a reset.
    Not tested with a watchdog actually left enabled by a bootloader.
    Compile-tested (W=1) on next-20261008.

 drivers/watchdog/mtk_wdt.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index 1630ab65d593..ff72e0fb1154 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -572,7 +572,8 @@ static int mtk_wdt_suspend(struct device *dev)
 {
 	struct mtk_wdt_dev *mtk_wdt = dev_get_drvdata(dev);
 
-	if (watchdog_active(&mtk_wdt->wdt_dev))
+	if (watchdog_active(&mtk_wdt->wdt_dev) ||
+	    watchdog_hw_running(&mtk_wdt->wdt_dev))
 		mtk_wdt_stop(&mtk_wdt->wdt_dev);
 
 	return 0;
@@ -582,7 +583,8 @@ static int mtk_wdt_resume(struct device *dev)
 {
 	struct mtk_wdt_dev *mtk_wdt = dev_get_drvdata(dev);
 
-	if (watchdog_active(&mtk_wdt->wdt_dev)) {
+	if (watchdog_active(&mtk_wdt->wdt_dev) ||
+	    watchdog_hw_running(&mtk_wdt->wdt_dev)) {
 		mtk_wdt_start(&mtk_wdt->wdt_dev);
 		mtk_wdt_ping(&mtk_wdt->wdt_dev);
 	}

base-commit: aac26bee2287c88af5be5a5ff96d783b19a28790
-- 
2.43.0


