Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0636C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 08:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i6KN7qFz99qq/ALEKkoJkPgYJrjmF3EU2O4lIDewe7o=; b=Ic+IeGjTvnQP8oddxEYgAeMdS/
	L6vxvbLVZk1oKXBNIQrt1L3sOGMzIKdyaLn3vFVVt9mn4H5C+GkUgoZ2lnbifpo//LB5a/kJQaI7h
	hdKzI6XnLtnxIcWD77zf4oJzZ0SVz6R2Xc6J2VnVew5YJAQKzBOBKFbp/v1ZaIL4Rq7St1/syj15l
	A/W/LTFFgwouVJ7KEPxhlmmzDX9tIEXkXDJGp5PfOU+vsuvuv0bYZXjgQ+U+Wpt/u8RM00xhKp9ym
	lfGglHgbhi2g3xyoLae8mAvJS4r756B9xX5PiGMYS+uVq10xPSOTF7bjUcp2q9bDzMKfs485rxr72
	/OL4pLIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o27Ci-006Fyb-ET; Fri, 17 Jun 2022 08:19:44 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o27CC-006Foc-Go
	for linux-mediatek@lists.infradead.org; Fri, 17 Jun 2022 08:19:15 +0000
Received: by mail-wm1-x32e.google.com with SMTP id q15so1920837wmj.2
        for <linux-mediatek@lists.infradead.org>; Fri, 17 Jun 2022 01:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i6KN7qFz99qq/ALEKkoJkPgYJrjmF3EU2O4lIDewe7o=;
        b=mtQXnNncLkH5+APNy+qa+gXYlCjcWp0W7PGKAfj+IFRVykr8G5oPo2oW38RIlhfBIU
         oHB2kCRIZLFlAiyyfIO7CcTf6m9MP6snoDpTRdcgCiv3tt2YmCcZBI2LYbw7xDmuXHgv
         Xzqez09XcW9J3W5ttBTNwR498IHRR0N1umoe0EGDdtFJr4ZlYS69p9OsslUiAP5Lpol2
         ver6MQNRB2CHNr5Hi4xAXUv1Rtm5mG973JnVAcSh12HRLgsQBj4HC/Up35ID4CuwmMga
         B7A+t9iG/jUgKD+7gIm1fbV7/Oy33nNsJF7mPodlfOmQHpvYxf7Bn4i1VBxdesgUKVhC
         bxBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i6KN7qFz99qq/ALEKkoJkPgYJrjmF3EU2O4lIDewe7o=;
        b=67KivaryvRSc2/W5FoQJpHKwLG16+sFLWCkn4wWYgd1WJssvxJm9kl5HYogVtsKi59
         Dqr9GGwfM8+zyW6NFZ41cScYRtrL7Uzhoa4Gj3MBUIqFZpr6dT/WyzubeoIBq1++7kuA
         ogYrzsgLUGPdWRR+OLbJ8rYWlfMvj2xqRymZf/gdqYoGvffhq3kNKziinwQtcJoO1PcM
         zMeZ9e5l6Ym+zV+7BnufzGadvOL2sxS5FRXD+DiD8z2c9POWAbfNYOqDhrpBOmoYtRZH
         +jppyibiuY7VeV2YJ9XeNwLYvQhHoCu0JFXlzrTV0MPgZP+Ke6ASL8Skx4TxFq8Gw13D
         y7XA==
X-Gm-Message-State: AJIora/jsrYdvcsU9o1guAdwdK5emkOwQD9XfUW6e280q3uSzu/UzlgA
	tOPO31FjCMCFBjPsre96Yq2/GA==
X-Google-Smtp-Source: AGRyM1tIXg2YoKkkCqDilEVxCCUSgr+DQnIy9x2PWUwFyjbZee7lkDg9EWeYCjC81sWbPrxlGE3Bvg==
X-Received: by 2002:a05:600c:4f4e:b0:39c:1bbb:734f with SMTP id m14-20020a05600c4f4e00b0039c1bbb734fmr8830394wmq.116.1655453950431;
        Fri, 17 Jun 2022 01:19:10 -0700 (PDT)
Received: from groot.. ([2a01:cb19:85e6:1900:b8a0:45dd:a367:2e65])
        by smtp.gmail.com with ESMTPSA id l9-20020a05600c4f0900b0039db500714fsm4970245wmq.6.2022.06.17.01.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 01:19:09 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Fabien Parent <fparent@baylibre.com>,
	linux-input@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mattijs Korpershoek <mkorpershoek@baylibre.com>
Subject: [PATCH v3 2/2] Input: mt6779-keypad - implement row/column selection
Date: Fri, 17 Jun 2022 10:19:02 +0200
Message-Id: <20220617081902.2931099-3-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220617081902.2931099-1-mkorpershoek@baylibre.com>
References: <20220617081902.2931099-1-mkorpershoek@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_011912_615260_AD299E7B 
X-CRM114-Status: GOOD (  11.50  )
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
index bd86cb95bde3..bf447bf598fb 100644
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
 
@@ -161,6 +166,11 @@ static int mt6779_keypad_pdrv_probe(struct platform_device *pdev)
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


