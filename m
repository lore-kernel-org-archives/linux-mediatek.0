Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F052C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Mar 2022 02:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ymvYy0Du08ktIA7bgntUFQEZpcqxJeyZNvE8wdt71IU=; b=n2x1WAmZq3a9lx
	E1UXTP815nKfkviK5k1/MD2L/qej9xcnC+b7KmkJ4jwM0bh7tvpxdjwvlEMfj1lkXbwIrn/RwDuDi
	gczCiE2UnE0um50vlrcQvcZDlxXdQSPTHLSnwNXl6S9fyoLnHG/7h5taSrfuVGYJfzliSRqA+wSiu
	qDrConwD7kh4pp9wUA0JC5rmkpVq8YGyNw4PidI8OT/90DWmJj/J+r/jNxFcBCj5v5rsAu6G7FWGt
	kVsbmjc8XMGh5+mFDarzqK21V5qvOcBYz9zF0/zk9HswyNauglqXYT3SUbmoi21imLF4mGjetM8KS
	E1b8LgNSr2g3AlZB2Ouw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRPwU-002Ukr-Sk; Tue, 08 Mar 2022 02:51:18 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRPwF-002Ug9-Hd; Tue, 08 Mar 2022 02:51:04 +0000
Received: by mail-qk1-x72e.google.com with SMTP id z66so13730485qke.10;
 Mon, 07 Mar 2022 18:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dHziwswHK6uNSR77kAaO2ffhpQzUQz0uMTDDzxEF4Ok=;
 b=F+Kwc2v0NjeMR4vC8LyG9ZsURiTPhcvH8Epa7frmH6GHTEIUAHL1iAnRFlZR9OhAVy
 HtEXQI7Nph4PySyAjpqSf3vKWyyfwvrZb0PSK950nYBCQk3av2NoEcwrLzewuhSx55Lg
 SBMI5LJJ69CSmcmL303PSjB16okbG3qLF1tllQeG/J6PigTysYUx3hMsIYRu2PjERy4E
 fHKlvBZYTaWFzi5vPKGlm8AWO6WA7wpgx6HFpFfX3HdSy1WV3s3nN0250Xp/Z2E7WGpS
 mzwU5ZzizP/oYsFcdRCIKXEEI62xHUBAA6As0l5UmnMcRDkew4HOW7Wz1lrC3FxphPh0
 OhbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dHziwswHK6uNSR77kAaO2ffhpQzUQz0uMTDDzxEF4Ok=;
 b=Sn+k5Wtt/0a0u9RjXvviSTyUjioLy7VgeQVf6b5FBB2aBlBwAJ47eulfdBSwKPMfhc
 KM3qJhHgvQwtARaUA0EkCVAsNyefMNtI7ngejfTSs7YPWQPR68wBlnUFPXadYxrOq3NX
 MGa8Lnf3k2pqaYFQBZ7rgPY3+KlB0cKrRTcC457Z6VFwUv7Ey9S838SkFS6t/q7sBwgM
 /3iR0qyKbXUhBfEN6ctHPNiam3Zo7Zpv+tPBNlkGfZMD9zXlQQfcsDv+qWNwY0gvGUA8
 DySumt/FwJjSVOA9ZSEDimMF2/g7mhK3s8hKDMEVh5lt/Tj32iUwX+iZ7ue6uXUSkwNm
 o+9g==
X-Gm-Message-State: AOAM532PiwHShLH1xXSWLTjVzMWeADtHQN0TmLXb0YyyZ6TaisTGFKvF
 eAF9E/MuxkV5l+l/q+rIaeQ=
X-Google-Smtp-Source: ABdhPJzRTUy5nLA4k0FOzG3DQXk/0Q2mTdSiWzr1tJiLmP001iyJl/Q2/IX8p96NjKA2WEMjYSob6Q==
X-Received: by 2002:a05:620a:40d1:b0:67b:ce7:702 with SMTP id
 g17-20020a05620a40d100b0067b0ce70702mr7712663qko.183.1646707862525; 
 Mon, 07 Mar 2022 18:51:02 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 d21-20020a05622a101500b002e07151139fsm244291qte.17.2022.03.07.18.50.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 18:51:01 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: lv.ruyi@zte.com.cn
To: dmitry.torokhov@gmail.com
Cc: matthias.bgg@gmail.com, mkorpershoek@baylibre.com, lv.ruyi@zte.com.cn,
 fengping.yu@mediatek.com, m.felsch@pengutronix.de,
 linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH] input: fix variable type
Date: Tue,  8 Mar 2022 02:50:54 +0000
Message-Id: <20220308025054.2077162-1-lv.ruyi@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_185103_620298_7BEF8E09 
X-CRM114-Status: GOOD (  11.09  )
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

From: Lv Ruyi (CGEL ZTE) <lv.ruyi@zte.com.cn>

The irq is defined unsigned int. If the platform_get_irq return a negative
value, data type cast may result in error.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Lv Ruyi (CGEL ZTE) <lv.ruyi@zte.com.cn>
---
 drivers/input/keyboard/mt6779-keypad.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/mt6779-keypad.c b/drivers/input/keyboard/mt6779-keypad.c
index 5ff23250ed37..0dbbddc7f298 100644
--- a/drivers/input/keyboard/mt6779-keypad.c
+++ b/drivers/input/keyboard/mt6779-keypad.c
@@ -91,7 +91,7 @@ static void mt6779_keypad_clk_disable(void *data)
 static int mt6779_keypad_pdrv_probe(struct platform_device *pdev)
 {
 	struct mt6779_keypad *keypad;
-	unsigned int irq;
+	int irq;
 	u32 debounce;
 	bool wakeup;
 	int error;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
