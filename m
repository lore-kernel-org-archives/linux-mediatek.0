Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74DC4C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 08:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zGiyzs65/dTO+B6+0/GeT5MjzznPvsjw61lLY2/g5I8=; b=w5TkWMEFsnamR8
	H6e5748rruFIlBMhn0RAGOBfzsKgmfvkm2orf1PRpYIjmhT0EUXsZhIi5SlQYAvqC75VKE+lYiWU0
	iZrfNqTOAyU52il9DQudy1+W4JURILnFLCEMePZ2Et2A7mo3OceiNiHt+87Ywa4U/47J1g+aeV/sS
	1TY3upKBTp75LzV874eqURPnrUQYT3K46OnixRgefc/uPAznNsKgb0eonopw1IpsSO4ZGx3AcNuQq
	yX13h9yrKVqa102KJehjZMdC7lsZeXRrPrqWZytzTe88wiciViV34E6Xjd3P8cIWVVApb41DqHD/i
	2CV9Q9W6zZrK8qcQfNtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrEm6-000QxI-Tk; Wed, 18 May 2022 08:11:18 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrEaT-000Jkg-Ee
 for linux-mediatek@lists.infradead.org; Wed, 18 May 2022 07:59:19 +0000
Received: by mail-wm1-x335.google.com with SMTP id
 o12-20020a1c4d0c000000b00393fbe2973dso2685400wmh.2
 for <linux-mediatek@lists.infradead.org>; Wed, 18 May 2022 00:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n37OLhluDeZRZjQV8gqjswMetHIVJY0WAfxFDmSPshs=;
 b=BW34tKuFY3dYsRa6d9qALrie8sssLLFboJeX2+kC6OJrQ5TfgGTzIBKQQHohBfcNZk
 bYIds93O59FlA8sQcuxILI1lv/ktt5LDnb0xCg/vN8RCdU5jFzrMPI4ZVWofVgfVOsUd
 14331uJXaQoHYkESFOFgCKOw4Yk8JLeXG4DAaKZPhY0QDFpmf6gI+cGlkIP/YlU6y0TF
 F66rGc4GOx7GT55IR5uFokoMlaFReP33WcQoRNqlwsjhbv7PpkgYT7jrnL5sbuA5Fi1j
 Xy9cu3XfAK4+kwJt+NAT0KPQMCQfFAjUGIj8AFfgVGqJoTw5Ox8ZnRJCXX+jUCeNhQj4
 xmSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n37OLhluDeZRZjQV8gqjswMetHIVJY0WAfxFDmSPshs=;
 b=rfF7b+3Pl/JrXgiOuC9DnTYoeUFp8oHUP0hWxSoxcLrlUNiGENCYfMK6NNmalxfTfp
 u4ZnAkLyomCwIoNOf0SAFRyCqhASW1qEXEBagQbmSvlt9ZFHsQZGEf3x93nX56ssBagW
 5yBcupLY/akQ/7IZFL9Bx+A23ks2Gk1wLfEh4HlnE1UD6hu4Caue47jMzpyKcdCv9XpZ
 zTGmm/P7Ir2xxbU2RtegGY0km5GiwgFN+tatqnUXksb/wa8AGT9VZKJtE2R+KovMeDx6
 r3/6RQHwB13WOvn/6KuENON08IzsvcqdBgITAKn7S602HZT6zpIJdnsJxVk1zcKemtzf
 Wi+w==
X-Gm-Message-State: AOAM533KYPr7Zo0PbXMnxEK77UocKoKlihlk7KVmL7t2nvkFyuVbKHB1
 Y4XDyE8yiVu0idTPtx49EIro7A==
X-Google-Smtp-Source: ABdhPJyEDKmFLRtJYfnFPvmAhLChghVgJ7rMcWed6hs0AcueTZLx1tLS3abGpGneOm6CWaHFi8gqag==
X-Received: by 2002:a1c:2c3:0:b0:38f:f280:caa3 with SMTP id
 186-20020a1c02c3000000b0038ff280caa3mr24284284wmc.14.1652860754650; 
 Wed, 18 May 2022 00:59:14 -0700 (PDT)
Received: from groot.home ([2a01:cb19:85e6:1900:bda6:8356:4db1:4539])
 by smtp.gmail.com with ESMTPSA id
 ay1-20020a05600c1e0100b0039706782e06sm1041300wmb.33.2022.05.18.00.59.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 May 2022 00:59:14 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Kevin Hilman <khilman@baylibre.com>, Fabien Parent <fparent@baylibre.com>,
 linux-input@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>
Subject: [PATCH v2 2/2] Input: mt6779-keypad - implement row/column selection
Date: Wed, 18 May 2022 09:59:09 +0200
Message-Id: <20220518075909.180629-3-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220518075909.180629-1-mkorpershoek@baylibre.com>
References: <20220518075909.180629-1-mkorpershoek@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_005917_558054_EFB74E72 
X-CRM114-Status: GOOD (  12.33  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The MediaTek keypad has a total of 6 input rows and 6 input columns.
By default, rows/columns 0-2 are enabled.

This is controlled by the KP_SEL register:
- bits[9:4]   control row selection
- bits[15:10] control column selection

Each bit enables the corresponding row/column number (e.g KP_SEL[4]
enables ROW0)

Depending on how the keypad is wired, this may result in wrong readings
of the keypad state.

Program the KP_SEL register to limit the key detection to n_rows,
n_cols we retrieve from the device tree.

Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
---
 drivers/input/keyboard/mt6779-keypad.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/input/keyboard/mt6779-keypad.c b/drivers/input/keyboard/mt6779-keypad.c
index 23360de20da5..9a8133970f5b 100644
--- a/drivers/input/keyboard/mt6779-keypad.c
+++ b/drivers/input/keyboard/mt6779-keypad.c
@@ -17,6 +17,11 @@
 #define MTK_KPD_DEBOUNCE	0x0018
 #define MTK_KPD_DEBOUNCE_MASK	GENMASK(13, 0)
 #define MTK_KPD_DEBOUNCE_MAX_MS	256
+#define MTK_KPD_SEL		0x0020
+#define MTK_KPD_SEL_COL	GENMASK(15, 10)
+#define MTK_KPD_SEL_ROW	GENMASK(9, 4)
+#define MTK_KPD_SEL_COLMASK(c)	GENMASK((c) + 9, 10)
+#define MTK_KPD_SEL_ROWMASK(r)	GENMASK((r) + 3, 4)
 #define MTK_KPD_NUM_MEMS	5
 #define MTK_KPD_NUM_BITS	136	/* 4*32+8 MEM5 only use 8 BITS */
 
@@ -171,6 +176,11 @@ static int mt6779_keypad_pdrv_probe(struct platform_device *pdev)
 	regmap_write(keypad->regmap, MTK_KPD_DEBOUNCE,
 		     (debounce * (1 << 5)) & MTK_KPD_DEBOUNCE_MASK);
 
+	regmap_update_bits(keypad->regmap, MTK_KPD_SEL, MTK_KPD_SEL_ROW,
+			   MTK_KPD_SEL_ROWMASK(keypad->n_rows));
+	regmap_update_bits(keypad->regmap, MTK_KPD_SEL, MTK_KPD_SEL_COL,
+			   MTK_KPD_SEL_COLMASK(keypad->n_cols));
+
 	keypad->clk = devm_clk_get(&pdev->dev, "kpd");
 	if (IS_ERR(keypad->clk))
 		return PTR_ERR(keypad->clk);
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
