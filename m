Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D480EF36E6
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Mar 2026 06:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Cy1rET3CGr4f2fi75cHO85rqRJdUgZ3r9En6ePvjM8M=; b=iSbIDqR+dHJDvU
	3WK3epu4hk//9aW5uWg/VmSy2BfAywLm+p+hmI14xopgLZMU88QZmjCb915RxlsJg7nPjD8mzp6jL
	mQAaYfOUZamlX19lmHLWCnLPHjFV4k9z0eDQhs+svGoP/qw/goY1SzAysUeQiRIiGTfV5C21vHdM0
	FEnT/NmBN/Ty0ap4qXMAD6P6jQe4XTnN0evwlHb1r6SiiyPzn+eNok7wcM1Eh2Uc5U0qV+KKzTGFU
	FeFq76uKij+0qJGdOj2iJFgDzI84nTRxJkUFtpsIrmu4YlwMfRNgDLnZcvA1KkjXcx9L58WC+I7yL
	ilDjPJxnnjo7hYsYxl+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzUMP-00000006klI-1Zha;
	Mon, 09 Mar 2026 06:45:01 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzUMM-00000006kio-2gvU;
	Mon, 09 Mar 2026 06:44:59 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout4.routing.net (Postfix) with ESMTP id A7E0C100679;
	Mon,  9 Mar 2026 06:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1773038692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Cy1rET3CGr4f2fi75cHO85rqRJdUgZ3r9En6ePvjM8M=;
	b=RV6blo0EiLzHWAE+O9vkx+r9A7twIQh4e/3sNaSVRNRxX+ESBGXD70D9sDgn5kbS2NV8pF
	gPARgAOUpVhI09NgnVi2rvJNoyKPbeJ8bh9BDN4lqaVDIBtrpp/4nZlh76/z8ejUGRn5AL
	A5WN4lYYFSOgjICl3Fy1fPuIEAwqfvQ=
Received: from frank-u24.. (fttx-pool-217.61.159.26.bambit.de [217.61.159.26])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 7085B1226F2;
	Mon,  9 Mar 2026 06:44:52 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] thermal/drivers/mediatek/lvts: fix mt7987 thermal crash
Date: Mon,  9 Mar 2026 07:44:38 +0100
Message-ID: <20260309064439.4296-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_234458_903785_D9428FFE 
X-CRM114-Status: UNSURE (   9.17  )
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

On mt7987 we see a crash due to missing ops entry.

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

Fixes: a4c40559499f ("thermal/drivers/mediatek/lvts: Add platform ops to support alternative conversion logic")
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 drivers/thermal/mediatek/lvts_thermal.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index a9617d5e0077..5671531d4c23 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -2026,6 +2026,7 @@ static const struct lvts_data mt7987_lvts_ap_data = {
 	.temp_offset	= LVTS_COEFF_B_MT7987,
 	.gt_calib_bit_offset = 32,
 	.def_calibration = 19380,
+	.ops = &lvts_platform_ops_mt7988,
 };
 
 static const struct lvts_data mt7988_lvts_ap_data = {
-- 
2.43.0


