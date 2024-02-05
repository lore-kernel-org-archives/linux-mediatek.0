Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53267C48292
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Feb 2024 19:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+iboSw0kHr/XQ2F6mUqPjCZdFfbDSD+ql6zjttiLFSU=; b=gfNEozv07Ge1Q/T2YYk91yU21s
	8HzncHIQAnkbufkKXx/nqpRHubqW2yhpzq+rSplIcSmAoyRt2nInofpDr6vyz8HFFCRW6KSE29Nsm
	trkToRHFh5IyyUiPXzwjKJ4CDOc76JAuWxpdY9iaNCdDdrAVKFg18gtW42I9eEpnxVRrVb8I4Zw9s
	iyliHDGaPEnYMxGlidJ3+NSx+jrpSD9NMazdQsy9UbvLlzpWvt7DlUPwuwFb2GV1uLH65q1MklokI
	5dVy/kt7Ieko4fYi6Qkaiy/1FQJFBcPq8Q46ossxgEoBI3BlU53TjbwmqMOrXxd1Y9mMbWOD8hiZ5
	HLgXcJLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX4uA-00000004qYH-32cZ;
	Mon, 05 Feb 2024 19:45:22 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX4th-00000004q5o-0rZg;
	Mon, 05 Feb 2024 19:44:56 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 415JilQq019205;
	Mon, 5 Feb 2024 13:44:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707162287;
	bh=+iboSw0kHr/XQ2F6mUqPjCZdFfbDSD+ql6zjttiLFSU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=pxWjPzPlQJYhH1Zc4qnwsLtnX/Y5OfFu9DpbD9A0sa5WfVySkdz8nt+W+Q9IaRp/W
	 pcUr+Gw+WRmmWS9H3ERHsYSIsevbSsmXWXA4PkUwwM6Xer7ppREWG1Jwo7NUlhm5DM
	 1Ss6DaJg8qAyAb1DtMKQTyMSrmkDC4muqJtULvp0=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 415Jil1l073190
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 5 Feb 2024 13:44:47 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 5
 Feb 2024 13:44:46 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 5 Feb 2024 13:44:46 -0600
Received: from lelvsmtp5.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 415JicQZ028467;
	Mon, 5 Feb 2024 13:44:46 -0600
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
Subject: [PATCH v2 12/19] power: reset: msm-poweroff: Use devm_register_sys_off_handler(POWER_OFF)
Date: Mon, 5 Feb 2024 13:44:30 -0600
Message-ID: <20240205194437.180802-13-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240205194437.180802-1-afd@ti.com>
References: <20240205194437.180802-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_114453_338453_E272DDE5 
X-CRM114-Status: GOOD (  10.95  )
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

Use this helper to register sys_off handler. Drivers should move away from
setting pm_power_off directly as it only allows for one handler. The new
way allows for trying multiple if the first one doesn't work.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/power/reset/msm-poweroff.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/power/reset/msm-poweroff.c b/drivers/power/reset/msm-poweroff.c
index d96d248a6e25b..bcf04491e7022 100644
--- a/drivers/power/reset/msm-poweroff.c
+++ b/drivers/power/reset/msm-poweroff.c
@@ -28,9 +28,11 @@ static struct notifier_block restart_nb = {
 	.priority = 128,
 };
 
-static void do_msm_poweroff(void)
+static int do_msm_poweroff(struct sys_off_data *data)
 {
 	deassert_pshold(&restart_nb, 0, NULL);
+
+	return NOTIFY_DONE;
 }
 
 static int msm_restart_probe(struct platform_device *pdev)
@@ -41,7 +43,9 @@ static int msm_restart_probe(struct platform_device *pdev)
 
 	register_restart_handler(&restart_nb);
 
-	pm_power_off = do_msm_poweroff;
+	devm_register_sys_off_handler(&pdev->dev, SYS_OFF_MODE_POWER_OFF,
+				      SYS_OFF_PRIO_DEFAULT, do_msm_poweroff,
+				      msm_ps_hold);
 
 	return 0;
 }
-- 
2.39.2


