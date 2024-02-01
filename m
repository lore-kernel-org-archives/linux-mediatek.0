Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6AFAC48BF1
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Feb 2024 18:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WzOWw71XNiTDn9UhRVmQ1YL+kbl79QddxFr5AngwFzk=; b=xMIjwKDxxwTTjR0bovcx7p9/EF
	13026yM7/B94CEXzCX7Z7VbDZj9oS5GrA8weAK7Y9wPY1sQJ3Km3lMHpeHasnnlGAatJCSQPL3bl4
	71aSpeYgw79qOz+HXnaeJT8Wvn7oB4ReRJ3CSLzOGiqNQy1rkoWsq2+Ty4pFBZ+qPln6yXoDQbkt5
	m7gkUXtalN0AoAVADYv1mW37DowNm9jMir8JdQ0U9P1ObPaLoxz2lNF/G6YzWri1BuHtUHLTSMWsJ
	yWQouzW9FwMs0DDXhdzQ8Jwx3hvhR6R35MLOrXzjacLPIb+L++/MuqVfBC23TiXjsePXUUsxX5l6e
	xzfRfCMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVbOL-00000008uKB-2f3J;
	Thu, 01 Feb 2024 18:02:25 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVbNN-00000008tSN-3cUS;
	Thu, 01 Feb 2024 18:01:29 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 411I1Dio065886;
	Thu, 1 Feb 2024 12:01:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1706810473;
	bh=WzOWw71XNiTDn9UhRVmQ1YL+kbl79QddxFr5AngwFzk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=rVR3s6B8tKTCDfJU3grYmIf8QM7v+xDBZBRxj8SPo9VevKcyHwm+NLzJeATY6XLQ8
	 3+p0B9aiXn0MrAHFAniOIead1A55Vbb2pU/04hqbtOdg3WYiIDdOY9C6UOri1LpUS+
	 +Eq5RPK3ubkc5BRzcJ2BRS3j2OZ5oqbHnGlhdV+A=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 411I1Dq6004634
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 1 Feb 2024 12:01:13 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 1
 Feb 2024 12:01:12 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 1 Feb 2024 12:01:12 -0600
Received: from lelvsmtp6.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 411I12Gt117221;
	Thu, 1 Feb 2024 12:01:12 -0600
From: Andrew Davis <afd@ti.com>
To: Sebastian Reichel <sre@kernel.org>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        Cristian Ciocaltea
	<cristian.ciocaltea@gmail.com>,
        Florian Fainelli
	<florian.fainelli@broadcom.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden
	<sbranden@broadcom.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad
 Dybcio <konrad.dybcio@linaro.org>,
        Sean Wang <sean.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-actions@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, Andrew Davis <afd@ti.com>
Subject: [PATCH 15/18] power: reset: gemini-poweroff: Use devm_register_sys_off_handler(POWER_OFF)
Date: Thu, 1 Feb 2024 12:00:59 -0600
Message-ID: <20240201180102.70395-16-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240201180102.70395-1-afd@ti.com>
References: <20240201180102.70395-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_100126_315818_35E57A92 
X-CRM114-Status: GOOD (  11.52  )
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

Use device life-cycle managed register function to simplify probe.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/power/reset/gemini-poweroff.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/power/reset/gemini-poweroff.c b/drivers/power/reset/gemini-poweroff.c
index d309b610142ce..06d6992dec892 100644
--- a/drivers/power/reset/gemini-poweroff.c
+++ b/drivers/power/reset/gemini-poweroff.c
@@ -70,12 +70,9 @@ static irqreturn_t gemini_powerbutton_interrupt(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-/* This callback needs this static local as it has void as argument */
-static struct gemini_powercon *gpw_poweroff;
-
-static void gemini_poweroff(void)
+static int gemini_poweroff(struct sys_off_data *data)
 {
-	struct gemini_powercon *gpw = gpw_poweroff;
+	struct gemini_powercon *gpw = data->cb_data;
 	u32 val;
 
 	dev_crit(gpw->dev, "Gemini power off\n");
@@ -86,6 +83,8 @@ static void gemini_poweroff(void)
 	val &= ~GEMINI_CTRL_ENABLE;
 	val |= GEMINI_CTRL_SHUTDOWN;
 	writel(val, gpw->base + GEMINI_PWC_CTRLREG);
+
+	return NOTIFY_DONE;
 }
 
 static int gemini_poweroff_probe(struct platform_device *pdev)
@@ -148,8 +147,11 @@ static int gemini_poweroff_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	pm_power_off = gemini_poweroff;
-	gpw_poweroff = gpw;
+	ret = devm_register_sys_off_handler(dev, SYS_OFF_MODE_POWER_OFF,
+					    SYS_OFF_PRIO_DEFAULT,
+					    gemini_poweroff, gpw);
+	if (ret)
+		return ret;
 
 	dev_info(dev, "Gemini poweroff driver registered\n");
 
-- 
2.39.2


