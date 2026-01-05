Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 933C6C2A074
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jan 2026 00:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RJjfGhYzMRnwgUAUKvlNtXxtk0atD56wzBEV6PIqpWc=; b=FGzt7yPz7oYE5nLrs2II6Jc+iN
	W4xRKDUk0ObqmMC9IoP0UUQXSQkfBKLr6qtOG+URaVsy7EKcWJLwhp8vu0G1F7qTduBbh81VFeYVv
	nnMMyEv3GClCW1j4591Pg74CHVMTdS8LSG4USnnEMCH4oMxCDvXraU7XpMU7cWry868+Fl5IHNZvA
	iZG1h0SeJxFPeW5EmgHBo5IhVozVQPqBhWgtfLOabLzTC4SIn6Lu4wxGEFWzRmYSirsO6/gzqeHCi
	uvhXlPch9bn+E/NGA8+E4w4kaGL/NNykz90yir5vZSDCshCWdNpEvPKZH+XVDBwss33RqORc/eYox
	T1YWCRTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcYRG-0000000AaAo-2P26;
	Mon, 05 Jan 2026 00:27:14 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcYR9-0000000Aa4M-3Jt4
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Jan 2026 00:27:10 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2a0834769f0so132187085ad.2
        for <linux-mediatek@lists.infradead.org>; Sun, 04 Jan 2026 16:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767572827; x=1768177627; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RJjfGhYzMRnwgUAUKvlNtXxtk0atD56wzBEV6PIqpWc=;
        b=mtQogsfUH4QqSRT8NjrU9TghL7jVR8Sc0MIFv3+8ELPOFRADt99SRRtCDDpdio4UfQ
         BtKA7kBm1EB8zbQrD/27sv4REQ9D075koT+BchtwPRX3KAlrW2/RWM1GvnZzqcNo4qX/
         s1LarvLp4MQNT5no4wXgOGwUqUkuMVMwOYM8H0ezGbUx4z5tVyIqEOzFhiEg62+FxkPC
         JzGFzorRqsymR7C2eh4Nhh7EIIJI4MTgxnRIwfMgsZqYnat1A7fFdQ78V/eVBmKYjRCm
         L/JF5vQNv9UGUYSWUrgn8pHhMd8iJIDlp3F6oOm+u7Q/9/1Myy0AcYIBaMlHER4swuyh
         4tPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767572827; x=1768177627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RJjfGhYzMRnwgUAUKvlNtXxtk0atD56wzBEV6PIqpWc=;
        b=BWJ6QwU6/Ne5ZgPPbtoNTtRf+5QmzNKr+G/ak9imh4qpzp1kDMWIMCwanAvmDUaJA2
         EzRYLYqUmAN+mF74rr7LCewbVfXr82mzQm/un/zOrkbM+ssGYK/vFZdc4Ps+Z1GOqWKp
         AjsWv0I9WVlxI+tQIS218sygGw89pG+9e8q8ZMwhanvqwqEVusyPsr2v+5F4lpytk9Oy
         TqmEHAgbC3VtfQEzN1WjWFSHhHH54Bq7rLPyW63bAZrC1EhPNxqAum11lAXmHqXDJqJz
         gak8kDfnDDDG6sNN3phpU2p7JKvXPPXBSGqndYjNXQjaxPBnmQQiqG/1vbr93r094DSQ
         AwlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUcLuNl6qCyQaNB1jI3zq3oxiXfiwIxLzqcjzArEeg87cT9hLkAAgjXPOT9p+gDszJmpe2Sh5eusqhSIzxrA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxYx71GrCUJloQpzubZoaoWbFLyyV3HjzFQgVy3oAtBILkO29QQ
	QxE8PBHa92QALyT/zPwewxCbI951UAfZWUsfRlgUO8Cl0XZTYUZXEXZd
X-Gm-Gg: AY/fxX6PBBgarHdsVzfWs62xt7HMF2nY2bHbc+n9ZKVcmM8L31/3tbLKGkrKjwE3+Ik
	6GDbVO4HmwnJj2c6wQL59tolioZIbrwqwe/a1Wda3HpJGQd2nSrUzIrNGBEftrHyIUKyAPQSJXC
	bElw07KZUgixHknRDbk2j6XN/uNRGy9wKDimNmzfP6EVDPHTyCB0R1arDBT92Nor49tQ5i7YnDn
	C5ipROeiWPUK4EU/6nbOERc4fuG695Tc3kgHxASlkLLAvLlhKtEtLZ4SDl6Hu/mvIEtU3W3b2d6
	ciwtQfdzVhDH1O5bdXJhoPgX1WD0t4if4U3Gt0c4od4k7TW672CpZIPaZmT5eFaaZ3T1bRFErpK
	cpaFtL8F78l4A0WF2PYq6XoCrhJ2NT310ws1/Eymnrrfjvig32v2g8gm/cMQiY1OEdqYkxZLF/z
	CTPhBi30vaf+BmvVw5xoGG0gOofB+dAEc7p8LCd14o0BJkEzIPe1o3tl4DmRqU6EU=
X-Google-Smtp-Source: AGHT+IEgwdZc2sv9zKx5KjMOni7rSof10mVUH9VaD1BavVlI4TZ/Co6GlilKA9YVOKhSaEIPSjDGFQ==
X-Received: by 2002:a05:701a:ca08:b0:11b:9386:825b with SMTP id a92af1059eb24-12172302a23mr38511025c88.48.1767572827042;
        Sun, 04 Jan 2026 16:27:07 -0800 (PST)
Received: from zubuntu.bengal-mercat.ts.net ([2001:5a8:60d:bc9:9ebf:dff:fe00:f8f2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724de268sm133378109c88.8.2026.01.04.16.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 16:27:06 -0800 (PST)
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
Subject: [PATCH 15/17] wifi: mt76: mt792x: fix firmware reload failure after previous load crash
Date: Sun,  4 Jan 2026 16:26:36 -0800
Message-ID: <20260105002638.668723-16-zbowling@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260105002638.668723-1-zbowling@gmail.com>
References: <20260102200524.290779-1-zbowling@gmail.com>
 <20260105002638.668723-1-zbowling@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_162708_927151_FBA178E7 
X-CRM114-Status: GOOD (  11.80  )
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
index 9dc768aa8b9c..05598202b488 100644
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
2.51.0


