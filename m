Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC9DC77B7A
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 May 2023 12:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AswqjqlgL9AGh9p9nkxsoOkIsJN0FnFVHRTAlCMqEfI=; b=yJVTmQLjl/FKuAGcR72XZR4liC
	0d0TuO9n5SlFHFaRG15sygCLlDnMqw+fWTtyzCSS9FyVNi0fsscTOG8WwQkFV1e+Et9+Zpu9jfJcB
	RJ27F/12ucHi03qUjvErYUdGHQbfkBHUcUuikbRhI+wGpR4dQZ8CapJgSkH9Fg/4stLn0S1mQnYy0
	2CW9mq3ZZS5WMNJGlOZqjTCbP/jYhbIq0C9lY5Aknj4pPzoaWyvw+dssVV4hgFZHTNR4QvG2zngPt
	202/V3V6RmGnbZBgPPmbN+fs6AGnCWj7p0tD/4NnuKJHTV4Z3NXeLnFZPK3uawCBj5vN0Tqvcgl5j
	CK8UXLoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzcLU-00CunQ-2x;
	Thu, 18 May 2023 12:03:00 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzcLS-00Cumx-0x;
	Thu, 18 May 2023 12:02:59 +0000
X-UUID: e80e49c6f57311ed912e1518a6540028-20230518
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=AswqjqlgL9AGh9p9nkxsoOkIsJN0FnFVHRTAlCMqEfI=;
	b=nxxy1D0eQMPaaOL6Ke3UNqTSmKbMdVUv7Fx9d7oxdZMzKjorb6RCbf+lFIJbv44fx03yqFfY9Yfz26+UiiKLJvCHPdpPSRYRQJBTsAbLbtQFc90SqfkDLzLF0RZn3BzJzbpLkkga8TkEbulqr9VF9apOqilfeJjy3ZDutxit/C0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:32300b5f-7ade-4e22-aad2-012bf3539b36,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d5b0ae3,CLOUDID:a5f045c1-e32c-4c97-918d-fbb3fc224d4e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: e80e49c6f57311ed912e1518a6540028-20230518
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <shuijing.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 273900750; Thu, 18 May 2023 05:02:48 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.194) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 18 May 2023 19:52:36 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 18 May 2023 19:52:35 +0800
From: Shuijing Li <shuijing.li@mediatek.com>
To: <thierry.reding@gmail.com>, <u.kleine-koenig@pengutronix.de>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>
CC: <devicetree@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<jitao.shi@mediatek.com>, Shuijing Li <shuijing.li@mediatek.com>
Subject: [PATCH v2] pwm: mtk_disp: Fix the disable flow of disp_pwm
Date: Thu, 18 May 2023 19:52:58 +0800
Message-ID: <20230518115258.14320-1-shuijing.li@mediatek.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_050258_346283_AD89F7DB 
X-CRM114-Status: GOOD (  12.87  )
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

There is a flow error in the original mtk_disp_pwm_apply() function.
If this function is called when the clock is disabled, there will be a
chance to operate the disp_pwm register, resulting in disp_pwm exception.
Fix this accordingly.

Signed-off-by: Shuijing Li <shuijing.li@mediatek.com>
---
Changes in v2:
Use
if (A && B) {
	something();
}
instead of
if (A) {
	if (B) {
		something();
	}
}
per suggestion from the previous thread:
https://lore.kernel.org/lkml/20230515140346.bxeu6xewi6a446nd@pengutronix.de/
---
 drivers/pwm/pwm-mtk-disp.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/pwm/pwm-mtk-disp.c b/drivers/pwm/pwm-mtk-disp.c
index 79e321e96f56..2401b6733241 100644
--- a/drivers/pwm/pwm-mtk-disp.c
+++ b/drivers/pwm/pwm-mtk-disp.c
@@ -79,14 +79,11 @@ static int mtk_disp_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	if (state->polarity != PWM_POLARITY_NORMAL)
 		return -EINVAL;
 
-	if (!state->enabled) {
-		mtk_disp_pwm_update_bits(mdp, DISP_PWM_EN, mdp->data->enable_mask,
-					 0x0);
-
-		if (mdp->enabled) {
-			clk_disable_unprepare(mdp->clk_mm);
-			clk_disable_unprepare(mdp->clk_main);
-		}
+	if (!state->enabled && mdp->enabled) {
+		mtk_disp_pwm_update_bits(mdp, DISP_PWM_EN,
+					 mdp->data->enable_mask, 0x0);
+		clk_disable_unprepare(mdp->clk_mm);
+		clk_disable_unprepare(mdp->clk_main);
 
 		mdp->enabled = false;
 		return 0;
-- 
2.40.1


