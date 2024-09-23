Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEFDFCF9C5B
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Sep 2024 10:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7QIDGBJkxcmnvPA7pNjWrrUjxxIBOBco1l2oo2/sTnQ=; b=3Y5tp/OPlVj8RYUskW4u5wm0us
	SDcW5xyYZNRcawo0xzlVUb3Q6VsqJQbzaJs8slMzR/h3Gs+dQrMO8/I/J8m4mRjcAk+wqRot1DCJ5
	zL6Ee1Ea57Mo5T1DqTO2orjZgp0btnTXH+9p/5qbZe3jWCXVFkiWbxGJCtHveksMatd09jMKO7/Wn
	ZPEJYnLkMsQHv1uJoGMjzVyx8e8A/soINaVKz4YcPvg/stwuA04U3piW4WUH7f/tI2Lmb/C3CL2y7
	y0fHH6laVHPgfRKIPQfEhAmLzGhkHyR+31RaY+A8BPnlqFJjnGSFP0c7WgYJjfgGSEjcoOxhFlyWS
	IaM7tbiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssfw1-0000000GubT-34Ps;
	Mon, 23 Sep 2024 10:04:49 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssfrc-0000000Gttm-0kQG;
	Mon, 23 Sep 2024 10:00:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727085614;
	bh=YrvCOBRllTDZcvuPynXFN1lDKpyxG284BO/X9CnemNY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h8Jax48P/c+QVuNQ6JkqF+x+nTEam9eaf+PQGnzo4bF0PAqJ+6UhtwoOaeJtaijvd
	 z5Gsq1lzk2b+jBztRd9rDFQP96QEUVNMjJ5iODjPnRTm+lVV9YrdcxJJ6uvg6ESYWk
	 9XritmaOw2DS1cIuPEyPV05crKdkYhtNQWCvv/DyCTDUmyKoj3SCaOXjgd5kOoOKf4
	 LlUbRDDj2kMAPlmM6Ys9DwH1S08kIDBhhKq4HZp+t4ly7rYXCGQxdM33d9c0Tz3qjw
	 HUYtQ9IRruDe2usZXAO21mMRxoB9KjOJ3ZXlV4vxNm2PqJYOweMToni3Gvg6LSY7TC
	 l4GjVjxIJ0g7A==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 28C1817E10D3;
	Mon, 23 Sep 2024 12:00:14 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: lee@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	eddie.huang@mediatek.com,
	sean.wang@mediatek.com,
	alexandre.belloni@bootlin.com,
	sen.chu@mediatek.com,
	macpaul.lin@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-rtc@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v1 2/3] rtc: mt6359: Add RTC hardware range and add support for start-year
Date: Mon, 23 Sep 2024 12:00:09 +0200
Message-ID: <20240923100010.97470-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240923100010.97470-1-angelogioacchino.delregno@collabora.com>
References: <20240923100010.97470-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_030016_388101_F9D4034B 
X-CRM114-Status: GOOD (  14.59  )
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

Add the RTC hardware range parameters to enable the possibility
of using the `start-year` devicetree property which, if present,
will set the start_secs parameter by overriding the defaults
that this driver is setting;

To keep compatibility with (hence have the same date/time reading
as) the old behavior, set:
 - range_min to 1900-01-01 00:00:00
 - range_max to 2027-12-31 23:59:59 (HW year max range is 0-127)
 - start_secs defaulting to 1968-01-02 00:00:00

Please note that the oddness of starting from January 2nd is not
a hardware quirk and it's done only to get the same date/time
reading as an RTC which time was set before this commit.

Also remove the RTC_MIN_YEAR_OFFSET addition and subtraction in
callbacks set_time() and read_time() respectively, as now this
is already done by the API.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/rtc/rtc-mt6397.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
index 1617063669cc..4785af123a7f 100644
--- a/drivers/rtc/rtc-mt6397.c
+++ b/drivers/rtc/rtc-mt6397.c
@@ -96,12 +96,6 @@ static int mtk_rtc_read_time(struct device *dev, struct rtc_time *tm)
 			goto exit;
 	} while (sec < tm->tm_sec);
 
-	/* HW register use 7 bits to store year data, minus
-	 * RTC_MIN_YEAR_OFFSET before write year data to register, and plus
-	 * RTC_MIN_YEAR_OFFSET back after read year from register
-	 */
-	tm->tm_year += RTC_MIN_YEAR_OFFSET;
-
 	/* HW register start mon from one, but tm_mon start from zero. */
 	tm->tm_mon--;
 	time = rtc_tm_to_time64(tm);
@@ -122,7 +116,6 @@ static int mtk_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	int ret;
 	u16 data[RTC_OFFSET_COUNT];
 
-	tm->tm_year -= RTC_MIN_YEAR_OFFSET;
 	tm->tm_mon++;
 
 	data[RTC_OFFSET_SEC] = tm->tm_sec;
@@ -178,7 +171,6 @@ static int mtk_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alm)
 	tm->tm_mon = data[RTC_OFFSET_MTH] & RTC_AL_MTH_MASK;
 	tm->tm_year = data[RTC_OFFSET_YEAR] & RTC_AL_YEA_MASK;
 
-	tm->tm_year += RTC_MIN_YEAR_OFFSET;
 	tm->tm_mon--;
 
 	return 0;
@@ -194,7 +186,6 @@ static int mtk_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alm)
 	int ret;
 	u16 data[RTC_OFFSET_COUNT];
 
-	tm->tm_year -= RTC_MIN_YEAR_OFFSET;
 	tm->tm_mon++;
 
 	mutex_lock(&rtc->lock);
@@ -302,6 +293,10 @@ static int mtk_rtc_probe(struct platform_device *pdev)
 	device_init_wakeup(&pdev->dev, 1);
 
 	rtc->rtc_dev->ops = &mtk_rtc_ops;
+	rtc->rtc_dev->range_min = RTC_TIMESTAMP_BEGIN_1900;
+	rtc->rtc_dev->range_max = mktime64(2027, 12, 31, 23, 59, 59);
+	rtc->rtc_dev->start_secs = mktime64(1968, 1, 2, 0, 0, 0);
+	rtc->rtc_dev->set_start_time = true;
 
 	return devm_rtc_register_device(rtc->rtc_dev);
 }
-- 
2.46.0


