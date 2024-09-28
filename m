Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7047CF6491
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Sep 2024 16:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zyrcqApW95Q2aWx98qWljKFWpxGj2v/UkzKAGl15Gc8=; b=Nxqf1MTNj0rXI0DRmVHiZljSN9
	XtcgCm9L3jBKLqYRwyFTsjOOB6xGAauCkg7q/3DF1OGHJEhtJV5WNWrykN/6iF1uaBKVhtq4JTmEH
	dfXq885melwh2rARyS/aCaq+GOUk8MZ7a/Zj+yTJsotwpfO+W4xtsJrWjZ9nKOjTTcOTnoOU0QGvj
	wRnzJxi3N8mg2SEaE1etyhZKx9M8K9W3j1Nen7FecWyEKGHU0UDaz/ZPRhDbzrr3JSsiZUDes9THG
	PMA8zpExrDIkRYI/HnQUMsU8sfeNWrVKBaZSDR73WRRtIhQZ0nFynAVG49hHE043+wKBoW2QvXql+
	nC8qItiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sua4Z-0000000DJZ8-2hVK;
	Sat, 28 Sep 2024 16:13:31 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sua3M-0000000DJRk-3sdt;
	Sat, 28 Sep 2024 16:12:18 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-7d7a9200947so2109868a12.3;
        Sat, 28 Sep 2024 09:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727539935; x=1728144735; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zyrcqApW95Q2aWx98qWljKFWpxGj2v/UkzKAGl15Gc8=;
        b=C9Tjw6fE9zS6Zo1HySl4iLA78WHMJX6P9VF2uv9cakAUFuqvJZn3AriYiUocLulpgK
         toeJUx/kpHOFyQVJBhBX/9JzwlNqseOqyTS+JB4YKIM6WNkcf3ULaxn9MeTfYL59sZin
         sA4J8hT5kZtE2v2XZIjRGWjr3AQ7gJo7kjS/pDARuZm+DEIPwwT5+OgGunGtEIoetD+N
         j4Ofc2g/zmeD9aZb6WCN6V9fhDX9AVF8VWJAnIsri0ecOJ/Wq9xvlZK5vQDgEsjX4jrY
         VrQoqqRHPseaDSchZ5xWMx+cGly4r65EDckgiHwPK/LIaMTrA2fSpBJ/KGvCeLp3X8t5
         eCDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727539935; x=1728144735;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zyrcqApW95Q2aWx98qWljKFWpxGj2v/UkzKAGl15Gc8=;
        b=Bp4PRetDxH6oo+cfvT1qAi5hTA5sgtW4yRZIwLxgqhVAdANC+CBDsu3eLaKBSK74+n
         cHqFFsCbmwnMaKE6aBYwrMgWQJ2Ki9GFRhE89e28oigq2M8QLCgB/NE7As9qJ7yiVqM9
         Bpp3EYJV0i7V1i+n94wziiObCy6UcKrCowsoFzu62jx64vlJwgKEt/uiNHuodvMn0VB2
         XP1ywYIieI5WHJJQEdfFiwG58MNQJr20AIJUGWO0qpHUdDHwMLt8xZ7O3oG1af7tC444
         aRBoXkm1QrCivBR46WCeBo5leb4+RrbqYBTCqjC9QlzKQRK2UDk8j9jVwgJRE0m0QcWo
         oyKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUb1iNZGo94Ll41aHuhphpjOhFiRpUnJj84xU2ylp50ZANhFYcbB6ng/2ujjrKhcHsNSfhnEIEjaqCC7DxMn5k=@lists.infradead.org, AJvYcCUmpDehgIOnQqe91Ck9rnZimg3fpoYxYmuUReHAoluysy4IZ8uwrgOmg0thmFe1vhpdQKQOCsBTpBnbOM1oB+GW@lists.infradead.org
X-Gm-Message-State: AOJu0YzJEJlIwZ9PRhgJwf0c7ljQ2/SGGOHXBSKRKDUAmUpGiPWaBT0L
	TLf2xnTcpEOKoAtvCzrRLIYN1d74RC8oCe61dG54qhLCEDavWd/E
X-Google-Smtp-Source: AGHT+IHTqVx49maAhen143fo0jfg0pGCcGEiZZtqePeA/hEG7RnqvaBiKcmHwsik88zG99isUcDKOQ==
X-Received: by 2002:a17:90a:de92:b0:2e0:9fe3:346e with SMTP id 98e67ed59e1d1-2e0b89ad30emr8197450a91.2.1727539935323;
        Sat, 28 Sep 2024 09:12:15 -0700 (PDT)
Received: from abhash-IdeaPad-L340-15IRH-Gaming.. ([136.233.9.100])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2e1073feb9bsm216693a91.47.2024.09.28.09.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Sep 2024 09:12:14 -0700 (PDT)
From: Abhash Jha <abhashkumarjha123@gmail.com>
To: linux-iio@vger.kernel.org
Cc: angelogioacchino.delregno@collabora.com,
	matthias.bgg@gmail.com,
	jic23@kernel.org,
	lars@metafoo.de,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Abhash Jha <abhashkumarjha123@gmail.com>
Subject: [PATCH] iio: adc: mt6360-adc: Converted to use get_unaligned_be16()
Date: Sat, 28 Sep 2024 21:41:08 +0530
Message-ID: <20240928161108.163647-1-abhashkumarjha123@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240928_091216_986392_B43ED9E0 
X-CRM114-Status: GOOD (  10.83  )
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

Changed the manual shifting and adding of bytes to use
get_unaligned_be16() api instead.

Signed-off-by: Abhash Jha <abhashkumarjha123@gmail.com>
---
 drivers/iio/adc/mt6360-adc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/adc/mt6360-adc.c b/drivers/iio/adc/mt6360-adc.c
index 3710473e5..91befe2cd 100644
--- a/drivers/iio/adc/mt6360-adc.c
+++ b/drivers/iio/adc/mt6360-adc.c
@@ -124,7 +124,7 @@ static int mt6360_adc_read_channel(struct mt6360_adc_data *mad, int channel, int
 		usleep_range(ADC_LOOP_TIME_US / 2, ADC_LOOP_TIME_US);
 	}
 
-	*val = rpt[1] << 8 | rpt[2];
+	*val = get_unaligned_be16(&rpt[1]);
 	ret = IIO_VAL_INT;
 
 out_adc_conv:
-- 
2.43.0


