Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A59BC77B73
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 May 2023 03:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=i+8nMDyCUgtl3WLgCsYivUYfh194g8U9gITbrqABQrw=; b=Tt5NfWqJlZTPXV6XEq7e/RjX/C
	N2GrWliwVMkzpxrp5P6Y1S5gW47AiU5KqmHA4xOdX2CPhimhBiPmao9B3YJd5P9REAH0s08VQvjg+
	6wU7JipzaH2s6oTUygaOTEWki9PAOk8oZ3nQ6BJogNL9uiIwvtn6+x44XyDw8yjDxBCxYZtgR3S/p
	4RKpSfIhmfCK/u/mbrcVXRX11+C2ZBj0G7suVHK5Fs8SQrJMENHtxQwyaYUTe6GF+WGa1as4Vge8M
	0FLfj4u3fk+FeCfBpwF0OQyF7BU4HEIYwRHUN5Bvdm6jv1s6M9h3JwnHvUuXyBiV1Ky69rxk93prY
	DRpzO8mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4CE2-00FsOV-0l;
	Wed, 31 May 2023 03:10:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4CDz-00FsLK-1o;
	Wed, 31 May 2023 03:10:13 +0000
X-UUID: a2c5eb84ff6011ed912e1518a6540028-20230530
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=i+8nMDyCUgtl3WLgCsYivUYfh194g8U9gITbrqABQrw=;
	b=CBUHuG6vgK2XOuk4r0+BVMmcmrW2FviYTw++N7TLu+KifPuyIFEen7kC535V1eL35EWecL/U8RWPC+GNNuOPKJkyT5Lkf7iNVMCU7J9uUy1WeEwzfd874sYUrlu3CdXDhzX/gOj8BPS+EW+sqZ21rnxoWCx41LTF5cvLrPfCV3I=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:582a1dcf-8f85-41a6-abad-a95e35299635,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d5b0ae3,CLOUDID:7916123d-7aa7-41f3-a6bd-0433bee822f3,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: a2c5eb84ff6011ed912e1518a6540028-20230530
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <shuijing.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 403199328; Tue, 30 May 2023 20:10:03 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 31 May 2023 11:09:36 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 31 May 2023 11:09:35 +0800
From: Shuijing Li <shuijing.li@mediatek.com>
To: <thierry.reding@gmail.com>, <u.kleine-koenig@pengutronix.de>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v3] pwm: mtk_disp: Fix the disable flow of disp_pwm
Date: Wed, 31 May 2023 11:10:01 +0800
Message-ID: <20230531031001.7440-1-shuijing.li@mediatek.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_201011_601247_C6ACD578 
X-CRM114-Status: GOOD (  13.45  )
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
Cc: devicetree@vger.kernel.org, jitao.shi@mediatek.com, linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com, Shuijing Li <shuijing.li@mediatek.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

There is a flow error in the original mtk_disp_pwm_apply() function.
If this function is called when the clock is disabled, there will be a
chance to operate the disp_pwm register, resulting in disp_pwm exception.
Fix this accordingly.

Fixes: 888a623db5d0 ("pwm: mtk-disp: Implement atomic API .apply()")
Signed-off-by: Shuijing Li <shuijing.li@mediatek.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Tested-by: Fei Shao <fshao@chromium.org>
---
Changes in v3:
Add Fixes per suggestion from the previous thread:
https://lore.kernel.org/lkml/CAC=S1nhVrbaAh2u7rG-=-RubsxTZvMBRZO-t0NA8jG7M8187EA@mail.gmail.com/
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


