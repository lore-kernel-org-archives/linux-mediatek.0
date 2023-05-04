Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE848C7EE22
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 May 2023 00:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xIPE5+CM013nG9jQKV59gUKrHx26ORJxB3HPKE5zJbo=; b=36HDaA0z23yqJ9ZbCPu/34o9fO
	4b0H66t9IVMaSzV77KsJvuVOsOmd1weXdqE/FxYyMwTij4ln7gXUCjlACppoD6fsD/9lhi91imnRy
	Sbq5sc14uBnA3P+mKJW7SpCeuJBS7SB84dj/pzwGey+B7n0pFRvvuB0Ct5NNsRsM+s7keQRrkFop6
	VZPStdBRoQVIubZTvPEaoVMZ90ql93uOgWRJVLHSLCd/UNArxr2EyitaPgYZbYLXmQ5xlctSfHBKY
	Rvj9cLQPZvaDkFAZYwkyhdmc7tBxXTYDf+YsEMzrOD5A9zN1L0izabc4DSw2mfKeQVk+V011CK7Zm
	2PwW1VsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puN9k-006Cid-35;
	Thu, 04 May 2023 00:49:12 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puN9f-006CfJ-0n;
	Thu, 04 May 2023 00:49:08 +0000
Received: from notapiano.myfiosgateway.com (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6E34D66056D0;
	Thu,  4 May 2023 01:49:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1683161346;
	bh=I0TwCLic8TNtbkOyqfw/qj1nZCg2iygKpx0tmYdTpr0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ImOCyceJFSlpUEpX17l8RSswSI7dWLw3v0LauHjxNrxULTxQ6Uo3899XBn7q6RnSx
	 xIPRfHSe6r7iraHXPtDtR1gMRrnxFN4S8iS45KQkSTh6+f7IAIChzpWieeaudHyCaB
	 7cf0gq9cQRIRiC/dVgcdWK7Q0pUcAzUR6WeXKXJ92lD2ESk09lmnSbP65MILuFbycO
	 VfP7t2ZiOQevgUG1jRosAQ61FbU33E5KUPN2xFZqaWq0lCtphVMMyRibO5aDighwa2
	 +X/JPQzXguplSOLRaEd/iutnws3cUdRmRZkbANejlwkL3I9NPjWfdQ03KCgCdxQtY6
	 4aCgkGcOi73bw==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: kernel@collabora.com,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Balsam CHIHI <bchihi@baylibre.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Alexandre Bailon <abailon@baylibre.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Amit Kucheria <amitk@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v2 3/6] thermal/drivers/mediatek/lvts_thermal: Use offset threshold for IRQ
Date: Wed,  3 May 2023 20:48:49 -0400
Message-Id: <20230504004852.627049-4-nfraprado@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230504004852.627049-1-nfraprado@collabora.com>
References: <20230504004852.627049-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230503_174907_417629_2B8DDA80 
X-CRM114-Status: GOOD (  13.94  )
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

There are two kinds of temperature monitoring interrupts available:
* High Offset, Low Offset
* Hot, Hot to normal, Cold

The code currently uses the hot/h2n/cold interrupts, however in a way
that doesn't work: the cold threshold is left uninitialized, which
prevents the other thresholds from ever triggering, and the h2n
interrupt is used as the lower threshold, which prevents the hot
interrupt from triggering again after the thresholds are updated by the
thermal framework, since a hot interrupt can only trigger again after
the hot to normal interrupt has been triggered.

But better yet than addressing those issues, is to use the high/low
offset interrupts instead. This way only two thresholds need to be
managed, which have a simpler state machine, making them a better match
to the thermal framework's high and low thresholds.

Fixes: f5f633b18234 ("thermal/drivers/mediatek: Add the Low Voltage Thermal Sensor driver")
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

Changes in v2:
- Added this commit

 drivers/thermal/mediatek/lvts_thermal.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index f7d998a45ea0..8449ba6ca90e 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -297,9 +297,9 @@ static int lvts_set_trips(struct thermal_zone_device *tz, int low, int high)
 	u32 raw_high = lvts_temp_to_raw(high);
 
 	/*
-	 * Hot to normal temperature threshold
+	 * Low offset temperature threshold
 	 *
-	 * LVTS_H2NTHRE
+	 * LVTS_OFFSETL
 	 *
 	 * Bits:
 	 *
@@ -308,13 +308,13 @@ static int lvts_set_trips(struct thermal_zone_device *tz, int low, int high)
 	if (low != -INT_MAX) {
 		pr_debug("%s: Setting low limit temperature interrupt: %d\n",
 			 thermal_zone_device_type(tz), low);
-		writel(raw_low, LVTS_H2NTHRE(base));
+		writel(raw_low, LVTS_OFFSETL(base));
 	}
 
 	/*
-	 * Hot temperature threshold
+	 * High offset temperature threshold
 	 *
-	 * LVTS_HTHRE
+	 * LVTS_OFFSETH
 	 *
 	 * Bits:
 	 *
@@ -322,7 +322,7 @@ static int lvts_set_trips(struct thermal_zone_device *tz, int low, int high)
 	 */
 	pr_debug("%s: Setting high limit temperature interrupt: %d\n",
 		 thermal_zone_device_type(tz), high);
-	writel(raw_high, LVTS_HTHRE(base));
+	writel(raw_high, LVTS_OFFSETH(base));
 
 	return 0;
 }
-- 
2.40.1


