Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BB80C4828D
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Feb 2024 19:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iOS81LCWivcsA7Ov+uMTe+f7Pr/kqVip8XQZGb4u/UM=; b=WzI82H6UxXB2oi7CZLw+Mpgw0a
	vto778cj/5M+5YoqKstgh+TUdxEf54DMzUX27o3qDvTEPF9stZd4BHHHxvkieWtyjxsmA3sIT3vom
	grU2fEU81fs3H+w1E+W1YSjQrojKqc1NLHVJpNsWxthXtkvexUG45GtB9Z1YYIqLQtQ8hqcanlvBv
	AXpTaeqKhsmCe9y7ED9URaHHn7fVdbvgMDdl40rC9bOXmsDYhU8WIsz/IynGFHezVryYINE6eoxNc
	fEfADd/xt1BOzjE/9lS20WTss02oc3UXTvLsjY4qNm+z3NOirgQBVipDBnUmgTRi15u0ASoRsq/Kg
	G4hWY44Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX4vK-00000004rVa-1ZEi;
	Mon, 05 Feb 2024 19:46:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX4tt-00000004qHM-1gPR;
	Mon, 05 Feb 2024 19:45:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=iOS81LCWivcsA7Ov+uMTe+f7Pr/kqVip8XQZGb4u/UM=; b=mFB1QczIBxV6Pj8F7K7XvKZ1bs
	eS/QvDFp313xPxfEXOlDoLm1DLGTR9UekR6RxO4hbYLJUil8+ilC8S5euFM6brmODceDUoIeH9r1C
	1GdF2k2KQP58wZCJsDG/FGye4NLAHJ0CZpM+klQCOAwp6hSQ3vYc/lmLXmbjnw+KWUx+1rPmnmpDG
	o1bgVHlNrlKDr7gRUB2UXVBOVKbCxIJJzE6RgQ/JtXawwhGlP/9c+MMoWRnrd+E0TZGJ8v80dCI0z
	m1+9GlhjuaVE4mLNuw6t/3d+p2gSguWx09ZNbE7+dzw9EblaCjtRQXSfWYMp4u4LpiP/PGyClWndL
	GG29up5g==;
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX4to-0000000C7XI-3Whg;
	Mon, 05 Feb 2024 19:45:04 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 415Jihlm010943;
	Mon, 5 Feb 2024 13:44:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707162283;
	bh=iOS81LCWivcsA7Ov+uMTe+f7Pr/kqVip8XQZGb4u/UM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=sTliSK7mrwvqgEzQR9fDWcHHW1JpaRAuFnBoxmmM2B49apTADPxOEVOqs6Lwq++px
	 5IMSiUr+9NP7vKk6jR1MrZaqIhq0/wrecr07Nv2EotEwPGb1qFsaflKw+QuNQYad9d
	 3L+/n8yDsSeIYUYDXXDPhv8x8L+yNjmqnE4KCYv0=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 415JiheV071026
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 5 Feb 2024 13:44:43 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 5
 Feb 2024 13:44:43 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 5 Feb 2024 13:44:43 -0600
Received: from lelvsmtp5.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 415JicQU028467;
	Mon, 5 Feb 2024 13:44:43 -0600
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
Subject: [PATCH v2 07/19] power: reset: brcm-kona-reset: Use devm_register_sys_off_handler(RESTART)
Date: Mon, 5 Feb 2024 13:44:25 -0600
Message-ID: <20240205194437.180802-8-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240205194437.180802-1-afd@ti.com>
References: <20240205194437.180802-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_194501_473090_8E5E2235 
X-CRM114-Status: GOOD (  11.22  )
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
 drivers/power/reset/brcm-kona-reset.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/power/reset/brcm-kona-reset.c b/drivers/power/reset/brcm-kona-reset.c
index d05728b1db097..ee3f1bb976530 100644
--- a/drivers/power/reset/brcm-kona-reset.c
+++ b/drivers/power/reset/brcm-kona-reset.c
@@ -15,8 +15,7 @@
 
 static void __iomem *kona_reset_base;
 
-static int kona_reset_handler(struct notifier_block *this,
-				unsigned long mode, void *cmd)
+static int kona_reset_handler(struct sys_off_data *data)
 {
 	/*
 	 * A soft reset is triggered by writing a 0 to bit 0 of the soft reset
@@ -31,18 +30,14 @@ static int kona_reset_handler(struct notifier_block *this,
 	return NOTIFY_DONE;
 }
 
-static struct notifier_block kona_reset_nb = {
-	.notifier_call = kona_reset_handler,
-	.priority = 128,
-};
-
 static int kona_reset_probe(struct platform_device *pdev)
 {
 	kona_reset_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(kona_reset_base))
 		return PTR_ERR(kona_reset_base);
 
-	return register_restart_handler(&kona_reset_nb);
+	return devm_register_sys_off_handler(&pdev->dev, SYS_OFF_MODE_RESTART,
+					     128, kona_reset_handler, NULL);
 }
 
 static const struct of_device_id of_match[] = {
-- 
2.39.2


