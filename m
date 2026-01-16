Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6120D47CB8
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jan 2026 01:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bLWOoyw2E8LXJk20xk6S4eG/DnEYq6CXxfM8xw/u51Q=; b=USJM6adOnfOx5ara3zVs1X1Ja1
	uwRI993jgbkHn0M7K4aBVNDRBZEgWb/YIHByzk484Cj+z2t+6p8BLIDH8rb8hTVc+uHJutiLWs/2b
	BU/WzIjmKgL5Oi20bMOI72mAABD7Kyhrn+1+d2vePtm7KCgrpagC9PsMPnuTQFwY/3btz19LWYI9d
	afWnd7r36J0FnhldcnayqCmjYUBy0VAMiilSk7aL1oujYGmsmNuQE+GCqLyO5ZgS6lOGTKTK2CGpv
	YuCiRR71hVu6PQQ+2VJCCINulLZ8TdJjcG5ziLbLaNGtJR1+E67GT7lgbHFzc405qIhKcxTJpEIpl
	OVmIdMUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYHf-0000000DOgK-3efO;
	Fri, 16 Jan 2026 01:05:51 +0000
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYHa-0000000DObX-2KwA
	for linux-mediatek@lists.infradead.org;
	Fri, 16 Jan 2026 01:05:47 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-2b04a410f42so1852817eec.0
        for <linux-mediatek@lists.infradead.org>; Thu, 15 Jan 2026 17:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768525546; x=1769130346; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bLWOoyw2E8LXJk20xk6S4eG/DnEYq6CXxfM8xw/u51Q=;
        b=DCgg1NLd4ExTog6QIGDUnfJYlqfV0GmZAzizGGjCKqnUt0wL9D9FEr3NWWqCq4udfw
         DLIbVHTmiViqaM4BqiW7siF1jaNVLP/ZCj0EAiAlOuQtDMtg3DdG+q8YEO27fKr40IDR
         XXSN0zHKb7hWHi4xW9E2VIVMPHtR7eFe7ZLXcJC5D7QnUy+KQ+DyQN58MEz3t4l884n9
         prfs27aohe58rONGhvcTFguNf/ZhFSzNo/q16QvmFQmBIa6ukulpZ2f3VRnpRqPkIVsP
         bajE+3KmvsOHUjRci8BRyX+EP5scSIs6Rr/YAfWdIo7uLZSIeSPaG8wUu/LozL49G8dT
         q4Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768525546; x=1769130346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bLWOoyw2E8LXJk20xk6S4eG/DnEYq6CXxfM8xw/u51Q=;
        b=ZTA/5wDGxN73cCSeX4Y2eWAtwwsK5+isIiihvognnOQ/TdRYedyOErBxSJt1cgx8xv
         emfwV1oYdgYwIymZPoecr5V5PgOaIcukDXPwtBbY1ttyqN0OgvHnVIiHNSTI9rQHS7+x
         CJy23Ryv81tN+yyJ9bbB9rnw/giJkKBgARhTkw/0xy5n6BOjcrT+c7+EiZXif696gi9O
         EhBl2C/+mImU5zCc+wWFBq9YU6iznfKYRDCLSddBJJJ3oFTS6f6M0UiEKawyXb76QF0Z
         CMdajjDoo4KSMrl5RcKy4fWNixcAVmE/tZM6+zx9WfQs9Z1aAsAgdbOSiAce9Yb3O+0l
         WLnA==
X-Forwarded-Encrypted: i=1; AJvYcCXD/T7mOoM4rbCl57OAIb/eXarw2PHSFSZ+vprwxtrNAe0CdbUNgkzVqtJ04sY40pkZMeSB7NIxcY7CyrBetg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwbOtw8wYnnnOjxfi5R/Lg5SmGh5lthbL3LAAodl4zCDaW3I8jc
	APIcTwp71G+hkOnWsRKhiPlNA2BA0ehBbMPafuCI7ZZLQ6wMfDpyTZFV
X-Gm-Gg: AY/fxX6pBZMvh+wqgEFoX/wZygqfIOjU4ueCbupYg7sxEtkP3fCVQwdxTZHZnDaA6ts
	JOp1Ix7Zi94Zy06pU+22VK0dG6c8ORTHe7OLuaJMfw9dWDj9MMu/LNRlSPkMVEd0af5Rb2h28KL
	0Uz/1e+jufG2a1fPlzDtgDzv0BeDZ3d6eugtgI/XLwh5XsfI0a9Ie32U2O6Lcx6v//O1k655gpP
	U06PzFlEgg8IhGd6l9g2ZZUlmtoMx/bOtA/PGk6vSHw6BuyyrZhn0P9S+leFmfGlZn/K+THRdbA
	fVjpcJgZmwOAj+nRJRV/Xk4/nixaHscow04EAdSwUQGgIB0AhYevXpV3/cn2CAhyp67xrCebuUF
	+gMevH/wAdZbTweCe4TDSdBf6MyA4fPhn3YO31sDtvjVw58LyRcO8H4ttprYYRMSDR55CyBjLu2
	XdrVUdlbZCXOd8F2J23KawFsi8JBaGIMx2OVnhLpF95B2sUqp+9QqSf8vlWMjBIA==
X-Received: by 2002:a05:7301:3804:b0:2ae:5d3b:e1c6 with SMTP id 5a478bee46e88-2b6b4e64b90mr1425584eec.21.1768525545632;
        Thu, 15 Jan 2026 17:05:45 -0800 (PST)
Received: from zcache.home.zacbowling.com ([2001:5a8:60d:bc9:f1d2:502c:a6ff:5556])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b367cbc9sm1019884eec.32.2026.01.15.17.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 17:05:45 -0800 (PST)
From: Zac <zac@zacbowling.com>
To: sean.wang@kernel.org
Cc: deren.wu@mediatek.com,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	lorenzo@kernel.org,
	nbd@nbd.name,
	linux@frame.work,
	ryder.lee@mediatek.com,
	sean.wang@mediatek.com,
	Zac Bowling <zbowling@gmail.com>,
	Zac Bowling <zac@zacbowling.com>
Subject: [PATCH v4 15/21] wifi: mt76: mt792x: fix firmware reload failure after previous load crash
Date: Thu, 15 Jan 2026 17:05:13 -0800
Message-ID: <20260116010519.37001-16-zac@zacbowling.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260116010519.37001-1-zac@zacbowling.com>
References: <CAGp9LzpuyXRDa=TxqY+Xd5ZhDVvNayWbpMGDD1T0g7apkn7P0A@mail.gmail.com>
 <20260116010519.37001-1-zac@zacbowling.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_170546_599285_4683192C 
X-CRM114-Status: GOOD (  11.60  )
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

From: Zac Bowling <zbowling@gmail.com>

If the firmware loading process crashes or is interrupted after
acquiring the patch semaphore but before releasing it, subsequent
firmware load attempts will fail with 'Failed to get patch semaphore'
because the semaphore is still held.

This issue manifests as devices becoming unusable after suspend/resume
failures or firmware crashes, requiring a full hardware reboot to
recover. This has been widely reported on MT7921 and MT7925 devices.

Example error log:
  mt7921e 0000:c2:00.0: Failed to get patch semaphore
  mt7921e 0000:c2:00.0: probe with driver mt7921e failed with error -5

Apply the same fix that was applied to MT7915 in commit 79dd14f:
1. Release the patch semaphore before starting firmware load (in case
   it was held by a previous failed attempt)
2. Restart MCU firmware to ensure clean state
3. Wait briefly for MCU to be ready

This fix applies to both MT7921 and MT7925 drivers which share the
mt792x_load_firmware() function.

Fixes: 583204ae70f9 ("wifi: mt76: mt792x: move mt7921_load_firmware in mt792x-lib module")
Link: https://github.com/openwrt/mt76/commit/79dd14f2e8161b656341b6653261779199aedbe4
Signed-off-by: Zac Bowling <zac@zacbowling.com>
---
 drivers/net/wireless/mediatek/mt76/mt792x_core.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
index 9dc768aa8b..05598202b4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
@@ -936,6 +936,20 @@ int mt792x_load_firmware(struct mt792x_dev *dev)
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
2.52.0


