Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E411BECAAD4
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Aug 2022 05:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sVk2Undvd2lu/+jxUtCCeLvk7O4M0gaM2/6KiQi3Bqg=; b=rL6Sfmb90CNtAAqLB4EutJPKMj
	zjCK9+5orYE37Gb/FSPU4UVRkGyWoh5q0GH86tGpi2e/wk+wmxyL+eXlh0kwGmXHMlZhmyCStr0Sd
	RB/KR1vtaPukSZtNlE6nnzouIRR7ooWPiYD+fulmQn40nIEtZoobEn1HcON+iOk3EgLeC6BOQnFHn
	rYR2VL+m6p0OC8cd7Wj0dLuET8ZaWFbZfrBCDa2CRDKSyqM7ljszDXd91VK5gcQORXqS9E/OVW2zY
	AJ9pLCtX1JrvI97Oe1hlAUwM3ZRJG3Cy0v7fTtLfsOEULH1i6TLD710xR0RnnaJuOtBroPyVQH7+m
	pKVmbShQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSWxJ-004ik7-UF; Mon, 29 Aug 2022 05:05:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSWxF-004ig5-99; Mon, 29 Aug 2022 05:05:00 +0000
X-UUID: a3e4c92333ce46dea66119393f49fd90-20220828
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=sVk2Undvd2lu/+jxUtCCeLvk7O4M0gaM2/6KiQi3Bqg=;
	b=HuWcM4URPm3QFXETfvV4/2IwAf/12uj5DY+LUwW6yr6QSSUrDxUkwnI3RZzkOJKsXXRZdSHO4Wjp9Wgb1CI/VejYkOAZQ26e73dzCve2PsKalyNlkY5XaWvaPuArTE5iqZy+AuhuUdKxqsRekS3gp9WTBekkP82yBAGr9Gy2lwA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:3f5cc6a3-0610-4642-97bf-7066d0223d80,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:7a57d955-e800-47dc-8adf-0c936acf4f1b,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: a3e4c92333ce46dea66119393f49fd90-20220828
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <xinlei.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1914191680; Sun, 28 Aug 2022 22:04:51 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 29 Aug 2022 12:04:15 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 29 Aug 2022 12:04:14 +0800
From: <xinlei.lee@mediatek.com>
To: <thierry.reding@gmail.com>, <u.kleine-koenig@pengutronix.de>,
	<matthias.bgg@gmail.com>, <jitao.shi@mediatek.com>
CC: <linux-pwm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, xinlei lee
	<xinlei.lee@mediatek.com>
Subject: [PATCH] pwm: mtk-disp: Fix the parameters calculated  by the enabled flag of disp_pwm.
Date: Mon, 29 Aug 2022 12:04:12 +0800
Message-ID: <1661745852-27323-1-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220828_220457_659484_02F9DA3A 
X-CRM114-Status: GOOD (  12.00  )
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

In the original mtk_disp_pwm_get_state() function, the result of reading
con0 & BIT(0) is enabled as disp_pwm. 
In order to conform to the register table, we should use the disp_pwm 
base address as the enabled judgment.

Fixes: 3f2b16734914 ("pwm: mtk-disp: Implement atomic API .get_state()")

Signed-off-by: xinlei lee <xinlei.lee@mediatek.com>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
---
Base on the branch of Linux-next/master.
Split from series [1].
[1] https://patchwork.kernel.org/project/linux-mediatek/cover/1661239875-19841-1-git-send-email-xinlei.lee@mediatek.com/
---
---
 drivers/pwm/pwm-mtk-disp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pwm/pwm-mtk-disp.c b/drivers/pwm/pwm-mtk-disp.c
index c605013..50425cd 100644
--- a/drivers/pwm/pwm-mtk-disp.c
+++ b/drivers/pwm/pwm-mtk-disp.c
@@ -197,7 +197,7 @@ static void mtk_disp_pwm_get_state(struct pwm_chip *chip,
 	rate = clk_get_rate(mdp->clk_main);
 	con0 = readl(mdp->base + mdp->data->con0);
 	con1 = readl(mdp->base + mdp->data->con1);
-	state->enabled = !!(con0 & BIT(0));
+	state->enabled = !!(readl(mdp->base) & BIT(0));
 	clk_div = FIELD_GET(PWM_CLKDIV_MASK, con0);
 	period = FIELD_GET(PWM_PERIOD_MASK, con1);
 	/*
-- 
2.6.4


