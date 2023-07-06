Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B8D0EB64D9
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jul 2023 10:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TS+0nfycyMyZboLtN8mtKKdv0Ar+eMXmyw7XCZMA2LM=; b=HlbH2C2kAyZJK+YWGpkOMPAGAz
	jjs+7GeyjKOhlhd9Gv4zCPSw6KTHDPr6tyXnBkUJCVcGM5nRkPeVETer+uAyPiGeKoYA+a/unuPog
	+2iVuL10Wt9Svnp2NfU2ZQ2dvRanP7flj53hDGWBb60TYWYCril3cIC/oQHuAM+sh0LUQieiwufgD
	y/S1I7fjartv/vAmJVRGCpV2ub2WZJaxDCWvN5x7g65EVT4GqPJZLECzuLM/Mds0PnnGrKA+SlSI5
	giirI/nAJc0o1M7/O2Rz+YymdQRrM4g5EJMxiI0brkqAy8qIt0xikNCXAH+DZnlYYTQb0RcUtyDNz
	kLGS8Neg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHLqy-0019sB-1I;
	Thu, 06 Jul 2023 10:04:48 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHLqw-0019rD-1i;
	Thu, 06 Jul 2023 10:04:47 +0000
X-UUID: 85062c6c1be411ee912e1518a6540028-20230706
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=TS+0nfycyMyZboLtN8mtKKdv0Ar+eMXmyw7XCZMA2LM=;
	b=fJiHurZXnnY+Lx6TfYtKU5N9yAVtg4kPU60MYMbHE+FqvFav2JzXuC7wRap1ytOAmVhpZigstnjRiFDC3Cer7+mgJ559SiDzZ0nVlIrMax4is+kLdeUeW2zgmjBxVRHIQM/mGQOTUeyGIAcD+XbpzQARdMJ44N1/w67IVy8cVJ0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.27,REQID:83ff46d5-f2ff-46fe-a6da-4e58079c5b6c,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:01c9525,CLOUDID:33eec482-5a99-42ae-a2dd-e4afb731b474,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 85062c6c1be411ee912e1518a6540028-20230706
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <shuijing.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1489335439; Thu, 06 Jul 2023 03:04:39 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 6 Jul 2023 18:04:36 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 6 Jul 2023 18:04:36 +0800
From: Shuijing Li <shuijing.li@mediatek.com>
To: <thierry.reding@gmail.com>, <u.kleine-koenig@pengutronix.de>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>
CC: <devicetree@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<jitao.shi@mediatek.com>, Shuijing Li <shuijing.li@mediatek.com>
Subject: [PATCH] pwm: mtk_disp: fix disp_pwm coverity issue
Date: Thu, 6 Jul 2023 18:04:54 +0800
Message-ID: <20230706100454.28998-1-shuijing.li@mediatek.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_030446_595555_DB929CD0 
X-CRM114-Status: UNSURE (   9.52  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

There is a coverity issue in the original mtk_disp_pwm_get_state()
function. In function call DIV64_U64_ROUND_UP, division by expression
Which may be zero has undefined behavior.
Fix this accordingly.

Signed-off-by: Shuijing Li <shuijing.li@mediatek.com>
---
 drivers/pwm/pwm-mtk-disp.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/pwm/pwm-mtk-disp.c b/drivers/pwm/pwm-mtk-disp.c
index 79e321e96f56..ca00058a6ef4 100644
--- a/drivers/pwm/pwm-mtk-disp.c
+++ b/drivers/pwm/pwm-mtk-disp.c
@@ -196,6 +196,14 @@ static int mtk_disp_pwm_get_state(struct pwm_chip *chip,
 		return err;
 	}
 
+	rate = clk_get_rate(mdp->clk_main);
+	if (rate <= 0) {
+		dev_err(chip->dev, "Can't get rate: %pe\n", ERR_PTR(rate));
+		clk_disable_unprepare(mdp->clk_mm);
+		clk_disable_unprepare(mdp->clk_main);
+		return err;
+	}
+
 	/*
 	 * Apply DISP_PWM_DEBUG settings to choose whether to enable or disable
 	 * registers double buffer and manual commit to working register before
@@ -206,7 +214,6 @@ static int mtk_disp_pwm_get_state(struct pwm_chip *chip,
 					 mdp->data->bls_debug_mask,
 					 mdp->data->bls_debug_mask);
 
-	rate = clk_get_rate(mdp->clk_main);
 	con0 = readl(mdp->base + mdp->data->con0);
 	con1 = readl(mdp->base + mdp->data->con1);
 	pwm_en = readl(mdp->base + DISP_PWM_EN);
-- 
2.40.1


