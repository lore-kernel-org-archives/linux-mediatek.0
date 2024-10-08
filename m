Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44891CED27C
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Oct 2024 08:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Pq171djiWsbLsNt0VEXIRjKVcrKk+cVbMiitNVgUkz4=; b=vWxqYDkKG6rD+/pgHxdTubjaF/
	MxXnJqZxLw+F9E93H1R9q/wY0xPip+M4tjm4xCvWuEJbeuFS3xnSIJ6vrX16AalX06ouCf70wGgpq
	am3CixbEgj8RVp5Du1NB4NCd9SPdSt5EPM5fCd+hnkwA01ScWGN+cj7dptTTZpjJZ364z1BtwcsjT
	VldUq4j5xSC83xII8zSzZynfwgiQOfJuH4Qk+1vgQ/REfjXn7XUqS0lA15arWP+Ui6DjZ5dAjdUUK
	XfAJ4Ywg5ZzVTEk6lys5f2oAQr/Baz4wGMYidL1YiIi8rAdv+jr7PTnSkWr1ZsQRx58pYGNKm9yRn
	8Ba982Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy5kw-000000055gd-0t8x;
	Tue, 08 Oct 2024 08:39:46 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy5Z1-0000000522A-2RXO
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Oct 2024 08:27:29 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-71e15fe56c9so247169b3a.3
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Oct 2024 01:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728376046; x=1728980846; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pq171djiWsbLsNt0VEXIRjKVcrKk+cVbMiitNVgUkz4=;
        b=H2Vm9PfjFq/OwHU0N0SAiM2yKohYfGKSPYAZvCJSvbzxAbI38FJrXL0mZ2pkXrdj+Q
         0DixXkz0nk/jGBlwZ5Ss6kPSHPQ6mi7ggxTX8ObkiMAiDnbpshPE8VKREyv5JkjJOy1S
         UnxyX2t25GbdYWNW6wBsiYnuYtVvnDRppu8w8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728376046; x=1728980846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pq171djiWsbLsNt0VEXIRjKVcrKk+cVbMiitNVgUkz4=;
        b=aGJAgdHyHWzC84Zucg7Im6rQn89ZjJQB57YK7xPAwRgohgjsISNg4Uj3BX8dvmz14s
         Cc0B3VLPl1zbCURTXVBBxyb120CHCN0UykSTdFa7tlCTsUzs/qtc58xw5p3PlFcr5sHN
         C6NrVmCq/nQyyTv1YxXn7qGRJ2C1ZkUsdgms5k+prrycs73R63c1+LPJWDdiFPl1ZnC7
         vKRh/Gsr1UML1Am9A5cyqloXWeaLCd2nQ/BRnzAlzMex2zy+qIB9UiG3Uofo+UGFshwr
         iB6HkrE9eoKuKFnnDkKBggE6VcFCQriFZnhNXWaWVh4NErSZ/btS+8dBh8tohdjTevyf
         BgnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcuBnig1EUqSRrCM7K9J94um+DXvwJVTsV7nCqzXxWnk6hGB9aDo9KnkYw/4OTjycMBjJ2Bp2aECv7UliLgQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3UoFoGjDAkI5hnO7ltEc8FGL2lJW2IUQLwsZUWHCQuRd8eU8s
	ZUFpxlRZXFKjEWMDhl9fjB2ZHJjPqNX11yWIahx+tW6h+Yz6dpzBpylBz3OrMA==
X-Google-Smtp-Source: AGHT+IEIqHr8weWKtCaAJsfbtil8i9+5MevvrhAdF+gVjtuB5zYMPSCsi2ViwB6KvpVNE65ouqmCNQ==
X-Received: by 2002:a05:6a00:180a:b0:71d:ffef:c165 with SMTP id d2e1a72fcca58-71dffefc803mr10731949b3a.25.1728376046347;
        Tue, 08 Oct 2024 01:27:26 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:10df:d27e:8d4b:6740])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e9f680cd4fsm5286236a12.17.2024.10.08.01.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 01:27:25 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Sean Wang <sean.wang@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-bluetooth@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH RESEND] Bluetooth: btmtksdio: Lookup device node only as fallback
Date: Tue,  8 Oct 2024 16:27:20 +0800
Message-ID: <20241008082721.4004100-1-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_012727_643983_ECB9939C 
X-CRM114-Status: GOOD (  13.40  )
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
Resending after three and a half months.

This follows up on the MT7921S bluetooth binding and DT fixup patches [1].
This should not be backported.

[1] https://lore.kernel.org/linux-bluetooth/20240412073046.1192744-1-wenst@chromium.org/

 drivers/bluetooth/btmtksdio.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index cc097aedc1e1..a1dfcfe43d3a 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -1328,6 +1328,8 @@ static int btmtksdio_probe(struct sdio_func *func,
 {
 	struct btmtksdio_dev *bdev;
 	struct hci_dev *hdev;
+	struct device_node *old_node;
+	bool restore_node;
 	int err;
 
 	bdev = devm_kzalloc(&func->dev, sizeof(*bdev), GFP_KERNEL);
@@ -1411,13 +1413,24 @@ static int btmtksdio_probe(struct sdio_func *func,
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
2.47.0.rc0.187.ge670bccf7e-goog


