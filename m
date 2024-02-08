Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F7F2C4828F
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Feb 2024 17:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+iboSw0kHr/XQ2F6mUqPjCZdFfbDSD+ql6zjttiLFSU=; b=BAb9nxe397lp5k5cvBvHBIvWF5
	yi93K8adFLMJ7uUiXTKBbbo4w33Sow6zFgMP9IO0jH+FEtKH86kdZvM/8j25W1ErDoECrKfYfGNpE
	73Tc102T4HCrTmvmKh2ez5QT2uNrFijI0hl7k8MMBzzlWkPcayvZDrpu7DZd1/HEbAYQpAEXlIr+A
	6ZAK6B2lD+hcLU6uLeVBMAxP82tVN8u5H0XOYIulxYhw5uOyJa32mSW2ftEZTVqe3sriqN/asv/yD
	JV9tMJIn6cyxTWborJtgZcqCtF+EQr5Dy8DB/lYp2cgePTX66xWG63y2YOi8kj1YtdP1sF2SRYRwv
	LGYuxMZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY7tE-0000000EQIL-0sjy;
	Thu, 08 Feb 2024 17:08:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY7pE-0000000EOkL-1tY1;
	Thu, 08 Feb 2024 17:04:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=+iboSw0kHr/XQ2F6mUqPjCZdFfbDSD+ql6zjttiLFSU=; b=F6zbPiUq1jXrlAgYm7DQSTcSFZ
	HPycQKkBKjNN/J5K4hrYz1NpKWLr0qsQ7/JKntnVb1IXbMikf78Etz5juHkyo97S9HLki3NWIK4ER
	ipQoGYb11kfcNjQQZjoZ0gBtVgxeZkZy1dYbpt5pvIHpNhVWhvyDCE3dBAl2rbT1CWg24lKNNjBcK
	/18sT0VFghjcZxxTGVzyTbMZvU+zGbDBB2PXQLoO+D18cEyVN+eGGgoXt0/aTY5GIoUA6Pj+OcWg/
	7mUozz1/JgCZjZUu2o1+q1NCb53NoFJ3De5a+NU4jrwvD04P1w+3EwHJhhbE1Z/ybOoHoXHa7sftq
	1KxNAG/Q==;
Received: from lelv0143.ext.ti.com ([198.47.23.248])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY7p8-0000000DWpW-1TBY;
	Thu, 08 Feb 2024 17:04:35 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 418H4KtK018166;
	Thu, 8 Feb 2024 11:04:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707411860;
	bh=+iboSw0kHr/XQ2F6mUqPjCZdFfbDSD+ql6zjttiLFSU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=qFBzFgPWIfVCJ8td3HE0ND29xlvtSztIedeQtMbPqqnEICeRYcXaTDB5n343gjgoR
	 FO11sZucI54YGwpQaPVN1q3UyqL/4Hti5PLDWgLPt8Z9rrrYixAWQkj+RGqHzAXICK
	 rkas9W7QeLxV+qMyMpb3zGYTJ81oco9iTMgQZQjE=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 418H4Keg042444
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 Feb 2024 11:04:20 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 Feb 2024 11:04:20 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 Feb 2024 11:04:20 -0600
Received: from lelvsmtp5.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 418H4B6E091006;
	Thu, 8 Feb 2024 11:04:19 -0600
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
Subject: [PATCH v3 12/19] power: reset: msm-poweroff: Use devm_register_sys_off_handler(POWER_OFF)
Date: Thu, 8 Feb 2024 11:04:03 -0600
Message-ID: <20240208170410.67975-13-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240208170410.67975-1-afd@ti.com>
References: <20240208170410.67975-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240208_170431_273661_D3DB3746 
X-CRM114-Status: GOOD (  11.18  )
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


