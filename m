Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9528C2BBCA
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jun 2024 10:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+VjACVZoPp7eN7kJksXj5MfvnAImL5JxKUjwBijavO4=; b=BX0eW7gK2DwsVGHSEGPx9flOAw
	MW09vEc1FCHRpu8QNWHswc+M7qSJRhSbpR83RR8jbdWXELRMLXW4E1lANTldhKy5c8aTVdmScbEQq
	EpiIwlLfrp0G2ACHlaZrrgCAwfdgtrKHhf6w6cHKMWiaF8A5p+dd0XnNHZIauyGxXxvSJJgOErQ0O
	T1ARa7NN80tvnVDpPMN5ByDCX7YSGaMuJy8Fd1QxoRq7E9g9QrUNNiME3TLckFk14J56/86RGXgGs
	r0EIvzE7ZhGXJPkru5bR6UBf5L+wmvfQk/vurc9P9Cam4XlKCMdAy8joNlsXxdSypgwc6YuEaaPIM
	AyNCRxeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM3JH-00000002OJA-1qHJ;
	Tue, 25 Jun 2024 10:21:59 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM3JE-00000002OIc-1iJM
	for linux-mediatek@lists.infradead.org;
	Tue, 25 Jun 2024 10:21:58 +0000
Received: by mail-pl1-x644.google.com with SMTP id d9443c01a7336-1f6fabe9da3so43175025ad.0
        for <linux-mediatek@lists.infradead.org>; Tue, 25 Jun 2024 03:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1719310915; x=1719915715; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+VjACVZoPp7eN7kJksXj5MfvnAImL5JxKUjwBijavO4=;
        b=bT/KirDiQ4cAx+pa2HAqIVksT1/F9s1HCmXfKwZ2lk27AU+R3IiQ/JmJbtU4d4117s
         rPhTICOxh6DpotJNjOVw6iR/xNK7nh2ljf2NrKbV9QpV1pOLe2VRH9e0omGli/vrDbbi
         GuFF2RtkHnYhKt0JNODd8KBuUBQwfSUnPoAHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719310915; x=1719915715;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+VjACVZoPp7eN7kJksXj5MfvnAImL5JxKUjwBijavO4=;
        b=tjoCt1IfDX551Ac7l5Pn0a8SjIoceG08usXGn69flq+Ah+Shhp4IirfrHivk9p5O5c
         HEEfHnPO4hZxKobn/e09y21rikJKOM+mNUsV/u10ZZkJw/yMt9w04mYIxM4BbgbnKWXk
         NE/RllN0xf95iAREapDrWRmERrP0rAR3UaKn4t+/60y/oR+cpu8UGcCcokXJIqPj6DGu
         jEk23OgusTMiZ4V+z7KIUYpMfn1HRtoQQsRS63OTM5c4OnDh/X+DnkNvx9c5d+rhSRan
         8LUiARnVwbHPNg2t4uroxxXCcQH9OmVmQboFzq+H0hgxd/W6GU1oUAI4iLkVAcYlNSFx
         sZNQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7vXH2if4OqDET9J19UqAzAAg4//c8cfVv21WqHUMFTYv7ngkN4TacWYQEh1b49Exb/Afg75MG2nJRiFjqd/Xhb8x45HGUJe8OsDkDCNtpJqKh
X-Gm-Message-State: AOJu0YwZxJcmVz49MHapnwcfHDc8rNj9yKX99hwShZKnqS3ZnfVCZeNP
	nZFK0KlCqO4owOdMCLbIY3mPyCvnIw0+jZz0WbrNzXG4EHGcI9nlNDYiv6nOHw==
X-Google-Smtp-Source: AGHT+IGncBwvYK00pVmw01gvxPmXxXQ/V/u6BoVJ3vRhjdCIb8ngRmdVTYU+9aqp9QEJNIvJV3icOw==
X-Received: by 2002:a17:902:d50b:b0:1f7:4ff:d03 with SMTP id d9443c01a7336-1fa23f4a0e0mr73386365ad.67.1719310915385;
        Tue, 25 Jun 2024 03:21:55 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:ea5a:67dd:bd1e:edef])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb328f57sm77590855ad.110.2024.06.25.03.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 03:21:54 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-bluetooth@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sean Wang <sean.wang@kernel.org>
Subject: [PATCH] Bluetooth: btmtksdio: Lookup device node only as fallback
Date: Tue, 25 Jun 2024 18:21:45 +0800
Message-ID: <20240625102147.3496597-1-wenst@chromium.org>
X-Mailer: git-send-email 2.45.2.741.gdbec12cfda-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_032156_507754_A8FD85C0 
X-CRM114-Status: GOOD (  13.41  )
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

If the device tree is properly written, the SDIO function device node
should be correctly defined, and the mmc core in Linux should correctly
tie it to the device being probed.

Only fall back to searching for the device node by compatible if the
original device node tied to the device is incorrect, as seen in older
device trees.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
This follows up on the MT7921S bluetooth binding and DT fixup patches [1].
This should not be backported.

[1] https://lore.kernel.org/linux-bluetooth/20240412073046.1192744-1-wenst@chromium.org/

 drivers/bluetooth/btmtksdio.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index b4e560a17aa6..d81fa8dacb4e 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -1330,6 +1330,8 @@ static int btmtksdio_probe(struct sdio_func *func,
 {
 	struct btmtksdio_dev *bdev;
 	struct hci_dev *hdev;
+	struct device_node *old_node;
+	bool restore_node;
 	int err;
 
 	bdev = devm_kzalloc(&func->dev, sizeof(*bdev), GFP_KERNEL);
@@ -1413,13 +1415,24 @@ static int btmtksdio_probe(struct sdio_func *func,
 	if (err)
 		bt_dev_err(hdev, "failed to initialize device wakeup");
 
-	bdev->dev->of_node = of_find_compatible_node(NULL, NULL,
-						     "mediatek,mt7921s-bluetooth");
+	restore_node = false;
+	if (!of_device_is_compatible(bdev->dev->of_node, "mediatek,mt7921s-bluetooth")) {
+		restore_node = true;
+		old_node = bdev->dev->of_node;
+		bdev->dev->of_node = of_find_compatible_node(NULL, NULL,
+							     "mediatek,mt7921s-bluetooth");
+	}
+
 	bdev->reset = devm_gpiod_get_optional(bdev->dev, "reset",
 					      GPIOD_OUT_LOW);
 	if (IS_ERR(bdev->reset))
 		err = PTR_ERR(bdev->reset);
 
+	if (restore_node) {
+		of_node_put(bdev->dev->of_node);
+		bdev->dev->of_node = old_node;
+	}
+
 	return err;
 }
 
-- 
2.45.2.741.gdbec12cfda-goog


