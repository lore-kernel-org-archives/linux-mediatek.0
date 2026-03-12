Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B93C106ACE4
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Mar 2026 20:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4QtKqKrKXA9mINSd6Rhs9VqIBwngxO4PNYOuvXQmlPU=; b=ZWaZJSmqqfikxj
	iTF7jk1BuAkb5qDO2uGyIvRjkLqlqcJ/ZXjfwumoMIEIfin7k3rSIeJWm7ed9pmR2Z0Rg3HHHk1cD
	7YqZ4OST0+UxrFw1vDcXbH7mRO48PqjpR+GgAmawKrZFFbcRLxNuG3AYZVbgJgHUuwiiQHcKH+kmO
	4O8Yhp/F+V242MILA8umcEs7fwRptJo9CVHucvyyNxUuyHMH3ica5tstsiMGEd7qGXpTFH713IZGo
	tvvVCSVUaqiu2X/O1F1QMKpAWxC0SQgjUcubzGEAxlcqHbrHPm/i+a1Qef815pgQ1Yut/xtid8kDb
	A3+J+HsWXmD0TOx+yC0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0maM-0000000FGAQ-1KyQ;
	Thu, 12 Mar 2026 20:24:46 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0maJ-0000000FG9I-2J0s;
	Thu, 12 Mar 2026 20:24:44 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout1.routing.net (Postfix) with ESMTP id B171140288;
	Thu, 12 Mar 2026 20:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1773347080;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4QtKqKrKXA9mINSd6Rhs9VqIBwngxO4PNYOuvXQmlPU=;
	b=h7QOH/3kOksmM3xBpdfa3Z+KmgGvA09uoldDw407O3IuE3YKf2t61zwpP8tjwsUmijYXjX
	CAxLS80gpKblSFZS5eE6j6YY13MlithH2blXzjDqnZ4N9i+eWDJSTgleIM37edcbqLM33P
	RLqwccn/sRnGhHksz8bzf1emPSuIkX0=
Received: from frank-u24.. (fttx-pool-217.61.148.188.bambit.de [217.61.148.188])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 78AC71226B7;
	Thu, 12 Mar 2026 20:24:40 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2] thermal/drivers/mediatek/lvts: add missing fields for mt7987
Date: Thu, 12 Mar 2026 21:24:32 +0100
Message-ID: <20260312202433.39092-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_132443_799578_2B422DC3 
X-CRM114-Status: UNSURE (   9.69  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, Laura Nao <laura.nao@collabora.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Commit a4c40559499f ("thermal/drivers/mediatek/lvts: Add platform ops to
support alternative conversion logic") added new ops field which causes
crash on mt7987.

[    1.518540] Internal error: Oops: 0000000096000005 [#1]  SMP
...
[    1.564481] pc : lvts_get_temp+0x84/0xc4
[    1.564492] lr : lvts_get_temp+0x60/0xc4
...
[    1.620900] Call trace:
[    1.631753]  lvts_get_temp+0x84/0xc4 (P)
[    1.645471]  __thermal_zone_get_temp+0x24/0x11c
[    1.656502]  __thermal_zone_device_update+0x9c/0x52c

Add the new ops member added in 7.0-rc1 for mt7987 too.

Commit 6931d597c5ef ("thermal/drivers/mediatek/lvts: Make number of
calibration offsets configurable") introduced field num_cal_offsets
in lvts_data. Add this for mt7987 too.

Fixes: 78c24e67d6f8 ("thermal/drivers/mediatek/lvts_thermal: Add mt7987 support")
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 drivers/thermal/mediatek/lvts_thermal.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index a9617d5e0077..1224ce0c1507 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -2026,6 +2026,8 @@ static const struct lvts_data mt7987_lvts_ap_data = {
 	.temp_offset	= LVTS_COEFF_B_MT7987,
 	.gt_calib_bit_offset = 32,
 	.def_calibration = 19380,
+	.num_cal_offsets = LVTS_NUM_CAL_OFFSETS_MT7988,
+	.ops = &lvts_platform_ops_mt7988,
 };
 
 static const struct lvts_data mt7988_lvts_ap_data = {
-- 
2.43.0


