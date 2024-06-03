Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64EC2C25B75
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Jun 2024 12:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vzs/x1WCN5t2imfhC6zu+ZDUGVxVyZ0jYD0hK5bZuVY=; b=ECanqfe1QwVQWJvzDt83rvyzBR
	fV+1WhNg3vNRlfILl13i3zR+T0d4boItFkdw8EN2JxTf1W4dBc9+ylW2Otstv4+eYWFdDfjjbOa3Y
	aAnE89i9mSqpbe77NpC9KEDt+AZ+ttytSAwjaEZtoc0CwI5DMJBolSXEw9oR01jjl6VdwhKEZRUUU
	DGCXaHmVSq+duMaoYeMsPMpxWolMs6E+Ab1PTb06ZIs/LCYkTtX6AAu5HVEw5B/ZVOKPWKwQd2MdE
	UWPQ+l8xKdh2o+NFLEb5zBV+xLoVlfnYYi94QlLmNKAQU8lqDVgEwVPFno9PRistYyp5a+HA/eOer
	WuLhuTaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE6St-0000000GcZq-0tqv;
	Mon, 03 Jun 2024 12:07:03 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE6Sp-0000000GcYP-28fd
	for linux-mediatek@lists.infradead.org;
	Mon, 03 Jun 2024 12:07:02 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4214053918aso3571155e9.2
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Jun 2024 05:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1717416415; x=1718021215; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vzs/x1WCN5t2imfhC6zu+ZDUGVxVyZ0jYD0hK5bZuVY=;
        b=Qn37HwVfFB6GWTvAiLfJGqLJOBM3K4pWyvZxLAl4rWZiq6zOlVPY5dQA5KsP5uubqm
         GRhwzGyMb7xUDyrN61yf3x89qSyrSzo2vC6CqSmUWKnqSInuiTqtOCZrnXgpqGBa9/DQ
         8uoqOEFbnizAWNzS6tIzBfGlXHglP19huszxSYExyEzozazAqwClko+MvHVAEY7H5CDq
         nn7h+KoiGB5qlL4S9VQX0a+OmQo+/3qkHGKpClfaW6P8jAQjhVhcUJIc2zMd2UJruZ5m
         eQkrmELDV9TH7H15xWTTHMaH9PmazcLW3Oop13EDf+iXrhypq0eu2GaHZAb3u/pIfSy3
         oL0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717416415; x=1718021215;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vzs/x1WCN5t2imfhC6zu+ZDUGVxVyZ0jYD0hK5bZuVY=;
        b=vxLgv7/+iGuOWcPv70r2l9obeQZncH9U+3Mj5CIGuz08a1/H8vdXFl8LZOe+/hdoGj
         R4xFXqKfZX1wrgbm1AvexYZM2HoVglO6mNqrmKXRdm2hu/HOYln9OSI018bx4+2uB47+
         bwStVRcG0WMLNzBE4B63fAu21OtdpTAg22b0TiEWVw6vILz8r7hxgjYXwwLQ0HIw8krb
         /aUHjsKylgbyqj6nnj89NHwlTV0dDBPfWxmpYjpo/uN1kuJfrj/dx8VDefIKE1uCmAgN
         o6pcHHWBO85ekB4B2jHjaFnu+D29H2RtQQSNstTsQNMJuG8tL1lBVf+kj6KWm0/Xs3ri
         aQjg==
X-Forwarded-Encrypted: i=1; AJvYcCX1eodm2zJ5ZNGeIWnuE9DCU3gUDVGQSO+SOvmtQ4OOVWjMU3AVUMN64Qu3SmXCMP3bbTJoGYys/qubEeUo3OGWDYqTD37Wv12B+ePTA+Q7idKg
X-Gm-Message-State: AOJu0YwW4kYWYj/x/xkpELAlkeu11sYsWAUfth8eZRgEmMLqKu/ov+lv
	fi4qPqHaH6VJGRujKfLYtSqdSHgoRvZHyGk6IIQAdLgU/S23hs7E6Q/rgWU7JgE=
X-Google-Smtp-Source: AGHT+IHUt9RC5PnZgMhb+jbLRK9Usa/RFjFRgNU7nFyyp0EjKf8YEFj7904Gl2PsM4H49yscOAhb2A==
X-Received: by 2002:a05:600c:1e27:b0:41b:de8d:dcd7 with SMTP id 5b1f17b1804b1-4212e05f21dmr64794825e9.20.1717416414555;
        Mon, 03 Jun 2024 05:06:54 -0700 (PDT)
Received: from [127.0.1.1] ([84.102.31.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4212b8a758csm114805625e9.36.2024.06.03.05.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 05:06:54 -0700 (PDT)
From: Julien Panis <jpanis@baylibre.com>
Date: Mon, 03 Jun 2024 14:06:49 +0200
Subject: [PATCH] thermal/drivers/mediatek/lvts_thermal: Return error in
 case of invalid efuse data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240603-mtk-thermal-calib-check-v1-1-5d6bf040414c@baylibre.com>
X-B4-Tracking: v=1; b=H4sIANixXWYC/x3MPQqAMAxA4atIZgM1ioNXEYcYow3+0ooI4t0tj
 t/w3gNRg2mEJnsg6GXR9i2hyDMQz9ukaEMykKPK1a7E9Zzx9BpWXlB4sR7Fq8zYM6lQxYWUBKk
 +go52/+e2e98PFKMvwGkAAAA=
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Nicolas Pitre <npitre@baylibre.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Julien Panis <jpanis@baylibre.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717416412; l=1350;
 i=jpanis@baylibre.com; s=20230526; h=from:subject:message-id;
 bh=K0CDQC1akX83WqstZzLmNolRnOazVmg2PvHJe4bg5Q0=;
 b=sKRmkGPrCbvTekNrVxBLMIUjflnb9FNPMqlYmPYKF9gHcSfU2hOCEY6bHSIh7DWFYzVrvifv+
 y++zucbPtypDRYxmAMdAcYHk+bJiO+sNe3XEydI64hVHnRlwdB73rxL
X-Developer-Key: i=jpanis@baylibre.com; a=ed25519;
 pk=8eSM4/xkiHWz2M1Cw1U3m2/YfPbsUdEJPCWY3Mh9ekQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_050659_693829_A5C1B7AE 
X-CRM114-Status: GOOD (  11.54  )
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

This patch prevents from registering thermal entries and letting the
driver misbehave if efuse data is invalid. A device is not properly
calibrated if the golden temperature is zero.

Signed-off-by: Julien Panis <jpanis@baylibre.com>
---
Guard against invalid calibration data, following this discussion:
https://lore.kernel.org/all/ad047631-16b8-42ce-8a8d-1429e6af4517@collabora.com/
---
 drivers/thermal/mediatek/lvts_thermal.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index 0bb3a495b56e..185d5a32711f 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -769,7 +769,11 @@ static int lvts_golden_temp_init(struct device *dev, u8 *calib,
 	 */
 	gt = (((u32 *)calib)[0] >> lvts_data->gt_calib_bit_offset) & 0xff;
 
-	if (gt && gt < LVTS_GOLDEN_TEMP_MAX)
+	/* A zero value for gt means that device has invalid efuse data */
+	if (!gt)
+		return -ENODATA;
+
+	if (gt < LVTS_GOLDEN_TEMP_MAX)
 		golden_temp = gt;
 
 	golden_temp_offset = golden_temp * 500 + lvts_data->temp_offset;

---
base-commit: 632483ea8004edfadd035de36e1ab2c7c4f53158
change-id: 20240603-mtk-thermal-calib-check-ba2ec24a1c32

Best regards,
-- 
Julien Panis <jpanis@baylibre.com>


