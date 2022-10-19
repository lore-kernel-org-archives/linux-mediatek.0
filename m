Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D7C6C43217
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Oct 2022 09:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Kog1vDR6cA7Cv/+p3jG4ipnaDZd4MDhSuD+VBldspaE=; b=zvoOkmQyGmr9FwM1+cYoyQwpZc
	LvHE4qaec+63mSzxTeTE0UKThy5RStSpWny0OdsL1wuxs87Q7Nb8fJATInYVXv0RQm6Ixm7EdR9Vs
	AlEqQ9FUxP8+31ZYEz/vJYcs6QOj6PKX/j5BHBHWedZ33oneJm1F9BCvb2LheweOO8vWPm7Kn5xG0
	06GCmhVATjqRduC2SKLhFx0A4P89Jk3zj8MgjRGNElS76/5sB+0xrNgsscxO2d4sGf+JHmnQ6OTtQ
	h7TfjegOH29I/8/l+OdLFeIOVaYL3LYBFNw95P9zvzBTCk650HlZ94/5kxzImskkMZxSip5rFeIS7
	Sm4wfC+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol5bQ-00HSDr-8Z; Wed, 19 Oct 2022 09:43:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol5bN-00HSAw-1b; Wed, 19 Oct 2022 09:43:06 +0000
X-UUID: 9423bc94b9194e75b038095ee88b8d6f-20221019
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Kog1vDR6cA7Cv/+p3jG4ipnaDZd4MDhSuD+VBldspaE=;
	b=su5nwCGt5Oz+fYz3hMY5xHpH9xtgIqKo0O+NuSgYA2AI9ryoH8ZrwvITVLajtSJt/MpvitTiMTHu9jEakhF74wEV78m8gLDaShdMqkZ7SrXVdlMWxIL5qwm9YKKNsgauPOSnJN7fToz3r1JwwpKl0kwnm5E5QCBwIRRmA5Kyii4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:5aa85ccc-be41-41f4-b6d5-f551c693b48b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:62cd327,CLOUDID:1d274ba4-ebb2-41a8-a87c-97702aaf2e20,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 9423bc94b9194e75b038095ee88b8d6f-20221019
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <xinlei.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 67136272; Wed, 19 Oct 2022 02:42:53 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 19 Oct 2022 17:42:20 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 19 Oct 2022 17:42:19 +0800
From: <xinlei.lee@mediatek.com>
To: <thierry.reding@gmail.com>, <u.kleine-koenig@pengutronix.de>,
	<matthias.bgg@gmail.com>, <jitao.shi@mediatek.com>
CC: <linux-pwm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, xinlei lee
	<xinlei.lee@mediatek.com>
Subject: [PATCH v4] pwm: mtk-disp: Fix the parameters calculated by the enabled flag of disp_pwm
Date: Wed, 19 Oct 2022 17:42:18 +0800
Message-ID: <1666172538-11652-1-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_024305_147217_AC69A680 
X-CRM114-Status: GOOD (  13.37  )
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

From: xinlei lee <xinlei.lee@mediatek.com>

In the original mtk_disp_pwm_get_state() function wrongly uses bit 0 of
CON0 to judge if the PWM is enabled.
However that is indicated by a bit (at a machine dependent position) in
the DISP_PWM_EN register. Fix this accordingly.

Fixes: 3f2b16734914 ("pwm: mtk-disp: Implement atomic API .get_state()")
Signed-off-by: xinlei lee <xinlei.lee@mediatek.com>
---
Rebase on linus/master v6.1-rc1.

change since v3:
1. Remove the empty line between Fixes: and S-o-b.

change since v2:
1. Modify the code for readability.

change since v1:
1. Modify the way to set disp_pwm enbale.
---
---
 drivers/pwm/pwm-mtk-disp.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/pwm/pwm-mtk-disp.c b/drivers/pwm/pwm-mtk-disp.c
index c605013e4114..3fbb4bae93a4 100644
--- a/drivers/pwm/pwm-mtk-disp.c
+++ b/drivers/pwm/pwm-mtk-disp.c
@@ -178,7 +178,7 @@ static void mtk_disp_pwm_get_state(struct pwm_chip *chip,
 {
 	struct mtk_disp_pwm *mdp = to_mtk_disp_pwm(chip);
 	u64 rate, period, high_width;
-	u32 clk_div, con0, con1;
+	u32 clk_div, pwm_en, con0, con1;
 	int err;
 
 	err = clk_prepare_enable(mdp->clk_main);
@@ -197,7 +197,8 @@ static void mtk_disp_pwm_get_state(struct pwm_chip *chip,
 	rate = clk_get_rate(mdp->clk_main);
 	con0 = readl(mdp->base + mdp->data->con0);
 	con1 = readl(mdp->base + mdp->data->con1);
-	state->enabled = !!(con0 & BIT(0));
+	pwm_en = readl(mdp->base + DISP_PWM_EN);
+	state->enabled = !!(pwm_en & mdp->data->enable_mask);
 	clk_div = FIELD_GET(PWM_CLKDIV_MASK, con0);
 	period = FIELD_GET(PWM_PERIOD_MASK, con1);
 	/*
-- 
2.18.0


