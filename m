Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6045DCF9C6F
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Sep 2024 10:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kgtwzFUdDnqEt9tDok1Z/6+uIxyAjbmhq9j5ECJ0Lfc=; b=e4s6A4//kvcRjT/029m2HOEjG4
	IgksZhJ3j11jAr3u+tiWdsdFPXvCwrgNblIfb3WSA3OeO4hZOdJix6GpvPn4aLOuqSwFVSVKU+FNs
	CVuTd9nIyrPJ1xV3AbmVXzRCTIuBZneQsof+s8GOYzQre7KywYATS8AaysGQpi8cAxagDRru0PFYl
	IpRcwLP+xAngTeZGOno0HjlPVd33YkLnfXbjEH2MB7AJc2W8BABcL0AlVJtbrwORi099SXF4lgawT
	c9Qn5FY2HgLDzdFg38D4ko58GR+l+VINJ08Vi1+kXqzAdmAfMN2XJ7XsVXpbCTZiOc6mqzMrqG3kj
	krfEoXDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssfw2-0000000Gubp-1KpK;
	Mon, 23 Sep 2024 10:04:50 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssfrd-0000000Gtu4-01YC;
	Mon, 23 Sep 2024 10:00:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727085615;
	bh=EVa8pFZK1Gg2RTP6+a6/2urfhYG5YFYSX1JAt7R4Yi8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ih89HEvrjCdr+PhyTQoUw7wGQee/jfqo1S+wA+rutY1NkTRHoyBWrb7JUIxxbi6Pr
	 og/QOh/P2Csh+mCIR2i6FJTlxhJ9Gap+3995bEtSzqkVNJg4hwF3NpfgvKWGh3aycB
	 z/NTjbbx1nhKQg8a7G4MrdvnBetbeEfyhStNTE4CBQzOed66K+mpXdIix8KL69QFg5
	 Nh0Hr8IO1rhxfX6QFgYgodk1BXwz3tE7IBpfF3NX8fYzNhzPsqoN/HBU0V8S+fCNWo
	 Kcj4U0Pj3CnuXleHU0ufRDowANlc9b+/gaeo0HnsIrAyN8vJ5V1VhyxjVud/oJufuL
	 MxJBc+gzzplww==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E93C217E10FC;
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
Subject: [PATCH v1 3/3] rtc: mt6359: Use RTC_TC_DOW hardware register for wday
Date: Mon, 23 Sep 2024 12:00:10 +0200
Message-ID: <20240923100010.97470-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240923100010.97470-1-angelogioacchino.delregno@collabora.com>
References: <20240923100010.97470-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_030017_213057_C078E269 
X-CRM114-Status: GOOD (  13.23  )
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

Instead of calculating the number of full days since Sunday with
(days + 4) % 7, read (and write) that to the RTC Day-of-week Time
Counter register (RTC_TC_DOW).

Some transformation (addition and subtraction for set/get) is
still done, as this register's range is [1..7], while the tm_wday
in struct tm's range is [0..6].

Please note that this was added only to set_time() and read_time()
callbacks because set_alarm() and read_alarm() are setting a bit
in RTC_AL_MASK to ignore DOW for RTC HW alarms for unknown reasons.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/rtc/rtc-mt6397.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
index 4785af123a7f..152699219a2b 100644
--- a/drivers/rtc/rtc-mt6397.c
+++ b/drivers/rtc/rtc-mt6397.c
@@ -75,6 +75,7 @@ static int __mtk_rtc_read_time(struct mt6397_rtc *rtc,
 	tm->tm_min = data[RTC_OFFSET_MIN];
 	tm->tm_hour = data[RTC_OFFSET_HOUR];
 	tm->tm_mday = data[RTC_OFFSET_DOM];
+	tm->tm_wday = data[RTC_OFFSET_DOW];
 	tm->tm_mon = data[RTC_OFFSET_MTH] & RTC_TC_MTH_MASK;
 	tm->tm_year = data[RTC_OFFSET_YEAR];
 
@@ -86,9 +87,8 @@ static int __mtk_rtc_read_time(struct mt6397_rtc *rtc,
 
 static int mtk_rtc_read_time(struct device *dev, struct rtc_time *tm)
 {
-	time64_t time;
 	struct mt6397_rtc *rtc = dev_get_drvdata(dev);
-	int days, sec, ret;
+	int sec, ret;
 
 	do {
 		ret = __mtk_rtc_read_time(rtc, tm, &sec);
@@ -96,15 +96,9 @@ static int mtk_rtc_read_time(struct device *dev, struct rtc_time *tm)
 			goto exit;
 	} while (sec < tm->tm_sec);
 
-	/* HW register start mon from one, but tm_mon start from zero. */
+	/* HW register start mon/wday from one, but tm_mon/tm_wday start from zero. */
 	tm->tm_mon--;
-	time = rtc_tm_to_time64(tm);
-
-	/* rtc_tm_to_time64 covert Gregorian date to seconds since
-	 * 01-01-1970 00:00:00, and this date is Thursday.
-	 */
-	days = div_s64(time, 86400);
-	tm->tm_wday = (days + 4) % 7;
+	tm->tm_wday--;
 
 exit:
 	return ret;
@@ -117,11 +111,13 @@ static int mtk_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	u16 data[RTC_OFFSET_COUNT];
 
 	tm->tm_mon++;
+	tm->tm_wday++;
 
 	data[RTC_OFFSET_SEC] = tm->tm_sec;
 	data[RTC_OFFSET_MIN] = tm->tm_min;
 	data[RTC_OFFSET_HOUR] = tm->tm_hour;
 	data[RTC_OFFSET_DOM] = tm->tm_mday;
+	data[RTC_OFFSET_DOW] = tm->tm_wday;
 	data[RTC_OFFSET_MTH] = tm->tm_mon;
 	data[RTC_OFFSET_YEAR] = tm->tm_year;
 
-- 
2.46.0


