Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 832A0E77199
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jan 2025 15:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tva2aDKV+/MDffuSfl+zRdtzIydM4Toy2VF4f9o1/Mk=; b=jYX0eMZf8TodL6B4RMkEGLsui3
	EbjHajUFhvM80Dnh8Y6XdGdtc1PaPIOoViPxRvD01UhSBwBi1rCSU3Jv1GUE6lPutgJhSxDUX0viM
	COuRR3C3CojEQI+3+XjUt5mRSO6vdGwvUcLaxsPmRm/LfOTTxEUkditLr2zn9BiqlYgAewPIzpwyr
	PWEFqLDRLDMvK7W1k1pwogR38jrE4WFs6x2Jz9zaFF8CyhKkqjjjJDiHMNFukExz7/a5aqz9tzkSa
	UENjWd7p2CARrTI4heZ+rikrajfnKzBLVjSk1YdZPDHMv8DVsUPk0Mt4FROu8CkIJA4O6PXANH5Xg
	JZhgFx9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVuX2-0000000CUTS-2ood;
	Thu, 09 Jan 2025 15:33:12 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVuU2-0000000CTnl-3pRO
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Jan 2025 15:30:08 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-436345cc17bso8840155e9.0
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Jan 2025 07:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736436605; x=1737041405; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tva2aDKV+/MDffuSfl+zRdtzIydM4Toy2VF4f9o1/Mk=;
        b=cnfuJnxLsHOCHN1kyBtHsnzruzuV9Q10S/u2Etp85Ahk+GwEPqqDlyGLCC5xt4Fd4v
         zKG3tyFq7ixHtPjaXEtMZeKk7k74Q7YHujue1nda2aHMo9nfgMTKgRvKu0bQ3c28yAWW
         vLGQMnH35GZA+KqHGoe3v+aHCFr/XrYPAYyOXkXgOOEW0DQTEZMtV/sY2Iu5g/mBox0X
         ykE4PANo/h9l4bvarPXi2tW2ruTdnAuVvLjYnpF14F2E+gV+2hn60yS5AJgFCDac/Y35
         j0MaE9frp3Sdm7cffiOrD7u8iMn2jT2NFy2wdl+jYWx/3s9lkrD2uva9sjjyYZCdTS0o
         su8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736436605; x=1737041405;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tva2aDKV+/MDffuSfl+zRdtzIydM4Toy2VF4f9o1/Mk=;
        b=qE8T9jCMB1GQH1DFl6nrApVoQwoB7Q5i7UTSBbxmu912gk66H+PWpW5ysIOQweQJCD
         56Oh17r32v6ztlDpKSYEb2uzRUo9aK2rKcQQh/HN3WCnV/aB531ZsvjS1wU+9Y8XJPPJ
         kTbUpeVBdRCWYJi6PGMDI7ru957O8LpE0bTmWqe0iB/oQOmOetJRN4immb3J+rsPqUdw
         M1d0h9cKuBEVgEG47nXHDlesMPwjf8CmwMESNDhBUkv1iCrBxazizS2aXmBmhuA8JWZh
         j7KPW8hut73ndRKk0gV9ScoA7JRomrrf6f9qxgVPOAoowPTFL/fieI+4FVgd4bpsR92y
         n5Mg==
X-Forwarded-Encrypted: i=1; AJvYcCVYVO9vCkJWzwCKeVZbCZA51osbfy8pUK/Kb9ChYSheghjKiriUlkUx4S+3ZdNUBdCU9uROmcvJNc5hSNuS9A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxdIn6RGMi5P3ZYbsdoWWag/nzHyQ3368g0nkoVGW9UuhfhE9Zi
	Hme62LE3NwKDP2mB6MavbchnGI4mGTgLf1CZOTIr6tKBqm+R8+RIbw+GAwwSW/A=
X-Gm-Gg: ASbGncvqaACT7d//9l2TgAk+FREI/l8jRUp9C+9a7HUkqn/nxn6S5OKnS3J/STkW/GO
	SrRreOLzfxEvXi2FKvts0ALQgrQ7Xg+9OivbBAq9BzvJYitapjSM7Q4ckfWh8nQBGT1IC+MfCOl
	nJPJfrP+wVe4uO5jMkAKXtAmnS7k1C+HcS9/I3f5oxUKH0hXCIn+m6ac4tSaAOdIR6q5Uz3psld
	qxK08tO5TyWTd6KTp3TkBrxoyzrW2QxLSYrSxgCD6QjzY0GaTJxmCccz3M=
X-Google-Smtp-Source: AGHT+IFZu92+O1xFBM1o4OIIzCf4RxwxPT44klM4biAbIGEw2EXkTR7f4KbFlUulK4lpC9hB8MpfFA==
X-Received: by 2002:a05:600c:3b0c:b0:434:fbda:1f36 with SMTP id 5b1f17b1804b1-436e26e51a0mr65752665e9.20.1736436604907;
        Thu, 09 Jan 2025 07:30:04 -0800 (PST)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:125:358f:ea05:210e])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-436e2df3610sm58307805e9.20.2025.01.09.07.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 07:30:04 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 09 Jan 2025 16:29:52 +0100
Subject: [PATCH 2/2] rtc: mt6359: fix year issue
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250109-enable-rtc-v1-2-e8223bf55bb8@baylibre.com>
References: <20250109-enable-rtc-v1-0-e8223bf55bb8@baylibre.com>
In-Reply-To: <20250109-enable-rtc-v1-0-e8223bf55bb8@baylibre.com>
To: Eddie Huang <eddie.huang@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2101; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=8DXsWpDVt7tmuo4MQdFq4zvSAYEr9Hi3ET8gNU0ixjk=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBnf+t6dswjfIEHCOw16BhoepRMqsP3UcnAyvPeeJTX
 +3PsW1qJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ3/regAKCRArRkmdfjHURWq5D/
 4yF/Ns7bGrrNmICUNd3lSvbkchkjrbu8Lq6i1dTdPTLlcSHcgDb3j392v31EGvxWxyiunuUgQXlU+A
 G9jBBc9pdeoKUJo7fOCXYo4cwzmAD5PjxxpFNNVkAS4o6VY2aplaJ0adohCh30xx88Q+B4eBLqI/kh
 FKAKCTzXzK9RrXUg2MHPW70tcfjkJR1CFd5lOqaWfAUjSHWH4BLLd9/LCH9DF3IqLuujJnql/2zZyU
 UgmgJvX3kyRNiZlw8Q8YuqahHJ0oei9M37IcGZPQRwQ3KRo/APehxXJZTzEmGhgwVCikjYKlInBJsV
 ZrX779i4J+SlgOmQeg3ZzbW32/UceHOssj3w2x75lI5oYSvNEwZbvD5XaK7sKsSMSZzap6Oi7wl8ff
 bBiuF0rsBfnptgR4+SfW39cJ4yGyt6hHl5UYu7AvRQp9G1ESykM2aEut/lelQnowEX1qSt9tVD9q7j
 BriB+K4hDUMfG8qc90D7rC2xmBleraXwfk43ef6kAGFbbO2t4V+RgNc9liQqljtOWpSahYmFvXZMaP
 ypWxcobpydIIRi4tgRlllWAA7IC6ddljoKO7g7BADDv9rfhJMLIXkkQVdVFeZnbhIr3JsVMqkOeLEc
 qCPohlusM48uw+H1+KO4XmL5uRVAo28yfO0tPOntC9c6UPUjLzoLhfUH0pKg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_073006_993180_1EED0C20 
X-CRM114-Status: GOOD (  10.73  )
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

Removing the RTC_MIN_YEAR_OFFSET addition and subtraction has
introduced a regression.

~# hwclock -r --verbose
hwclock from util-linux 2.37.4
System Time: 1262312013.143552
Trying to open: /dev/rtc0
Using the rtc interface to the clock.
Assuming hardware clock is kept in UTC time.
Waiting for clock tick...
hwclock: select() to /dev/rtc0 to wait for clock tick timed out
...synchronization failed

Bring back the RTC_MIN_YEAR_OFFSET to fix the RTC.

Fixes: 34bbdc12d04e ("rtc: mt6359: Add RTC hardware range and add support for start-year")
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/rtc/rtc-mt6397.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
index 55e75712edd4..9930b6bdb6ca 100644
--- a/drivers/rtc/rtc-mt6397.c
+++ b/drivers/rtc/rtc-mt6397.c
@@ -96,6 +96,12 @@ static int mtk_rtc_read_time(struct device *dev, struct rtc_time *tm)
 			goto exit;
 	} while (sec < tm->tm_sec);
 
+	/* HW register use 7 bits to store year data, minus
+	 * RTC_MIN_YEAR_OFFSET before write year data to register, and plus
+	 * RTC_MIN_YEAR_OFFSET back after read year from register
+	 */
+	tm->tm_year += RTC_MIN_YEAR_OFFSET;
+
 	/* HW register start mon/wday from one, but tm_mon/tm_wday start from zero. */
 	tm->tm_mon--;
 	tm->tm_wday--;
@@ -110,6 +116,7 @@ static int mtk_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	int ret;
 	u16 data[RTC_OFFSET_COUNT];
 
+	tm->tm_year -= RTC_MIN_YEAR_OFFSET;
 	tm->tm_mon++;
 	tm->tm_wday++;
 
@@ -167,6 +174,7 @@ static int mtk_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alm)
 	tm->tm_mon = data[RTC_OFFSET_MTH] & RTC_AL_MTH_MASK;
 	tm->tm_year = data[RTC_OFFSET_YEAR] & RTC_AL_YEA_MASK;
 
+	tm->tm_year += RTC_MIN_YEAR_OFFSET;
 	tm->tm_mon--;
 
 	return 0;
@@ -182,6 +190,7 @@ static int mtk_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alm)
 	int ret;
 	u16 data[RTC_OFFSET_COUNT];
 
+	tm->tm_year -= RTC_MIN_YEAR_OFFSET;
 	tm->tm_mon++;
 
 	mutex_lock(&rtc->lock);

-- 
2.25.1


