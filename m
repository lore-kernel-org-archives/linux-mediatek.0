Return-Path: <SRS0=EsFa=HB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8ED6C433DB
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 Jan 2021 14:13:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A00264DDF
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 Jan 2021 14:13:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A00264DDF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DYvV+JZKbDtbm9SlIjmdgPexWfx6IUO0XJNvqPnZbCU=; b=wEUVXRkreQybJvkonT/cUYsMF
	Erud17gu425MGmvRRr4yCnpbNYS6cVSnvYi2QN/k/54Xq7AVY8/HSs6cQhRsurvYvildLnlaZ2X1+
	O+QksD6+rxktCDw2l5hSLpSAXAfwBl5IraHIp9yoM9j+ykuU7daiV5w/3w4+Pk0qwAgZqko6BkTZJ
	YbsnJvxp+mLH5/iXY3atZRihrjIGwDwr1k+/e25BdjRh/ufvgGeIxed5sUEvLIzqLRlVaJhwIZCLf
	VR7mg0mKtp8s0VBcEAJOGAVXjKpfxpDqUyAWkBSvbfAdsD7wnjoAEy+IBQFe7OxfPYJ/3fnJYHJg7
	fo6qaJNHA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5qzm-0002ic-OG; Sat, 30 Jan 2021 14:13:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5qzi-0002hJ-VO; Sat, 30 Jan 2021 14:13:00 +0000
X-UUID: 6a448be43b504ee99ed6ff9832cc8c30-20210130
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=kakw+ExY4w3INOL6Gi+WiqHiFNwjMa2eKTFUAGbCIJY=; 
 b=BjrCyn6PEQyixv3QYJxV7kLEoR2au4DqYHTNPTLGuMQnlQ7i1VyeuxatEjr8t/baZS35bYApsGFnHd25CTmxb5C49QXdaEedfnQV5PQyyXjW6l89rylBA/LHq00HnICbYr8tG3Ngo6QxtM7VcNa5nBQU/xDvVhRvg4OFk8pL0Cs=;
X-UUID: 6a448be43b504ee99ed6ff9832cc8c30-20210130
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 660010108; Sat, 30 Jan 2021 06:12:56 -0800
Received: from MTKMBS33N2.mediatek.inc (172.27.4.76) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 30 Jan 2021 06:12:54 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 30 Jan 2021 22:12:30 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Sat, 30 Jan 2021 22:12:30 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Thierry Reding <thierry.reding@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>
Subject: [PATCH v2 1/3] pwm: mtk_disp: clear the clock operations
Date: Sat, 30 Jan 2021 22:12:24 +0800
Message-ID: <20210130141226.25357-2-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.12.5
In-Reply-To: <20210130141226.25357-1-jitao.shi@mediatek.com>
References: <20210130141226.25357-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: F34A494F3A7982D95875365C4E294044EF602491AE2604A69FF106C2BD7392CD2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210130_091259_152597_30CB6BF6 
X-CRM114-Status: GOOD (  13.06  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-pwm@vger.kernel.org, Jitao Shi <jitao.shi@mediatek.com>,
 srv_heupstream@mediatek.com, huijuan.xie@mediatek.com, stonea168@163.com,
 linux-kernel@vger.kernel.org, cawa.cheng@mediatek.com,
 linux-mediatek@lists.infradead.org, bibby.hsieh@mediatek.com,
 ck.hu@mediatek.com, yingjoe.chen@mediatek.com, eddie.huang@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Remove the clk_prepare from mtk_disp_pwm_probe.
Remove the clk_unprepare from mtk_disp_pwm_remove.

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 drivers/pwm/pwm-mtk-disp.c | 23 ++---------------------
 1 file changed, 2 insertions(+), 21 deletions(-)

diff --git a/drivers/pwm/pwm-mtk-disp.c b/drivers/pwm/pwm-mtk-disp.c
index 87c6b4bc5d43..21416a8b6b47 100644
--- a/drivers/pwm/pwm-mtk-disp.c
+++ b/drivers/pwm/pwm-mtk-disp.c
@@ -192,14 +192,6 @@ static int mtk_disp_pwm_probe(struct platform_device *pdev)
 	if (IS_ERR(mdp->clk_mm))
 		return PTR_ERR(mdp->clk_mm);
 
-	ret = clk_prepare(mdp->clk_main);
-	if (ret < 0)
-		return ret;
-
-	ret = clk_prepare(mdp->clk_mm);
-	if (ret < 0)
-		goto disable_clk_main;
-
 	mdp->chip.dev = &pdev->dev;
 	mdp->chip.ops = &mtk_disp_pwm_ops;
 	mdp->chip.base = -1;
@@ -208,7 +200,7 @@ static int mtk_disp_pwm_probe(struct platform_device *pdev)
 	ret = pwmchip_add(&mdp->chip);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "pwmchip_add() failed: %d\n", ret);
-		goto disable_clk_mm;
+		return ret;
 	}
 
 	platform_set_drvdata(pdev, mdp);
@@ -227,24 +219,13 @@ static int mtk_disp_pwm_probe(struct platform_device *pdev)
 	}
 
 	return 0;
-
-disable_clk_mm:
-	clk_unprepare(mdp->clk_mm);
-disable_clk_main:
-	clk_unprepare(mdp->clk_main);
-	return ret;
 }
 
 static int mtk_disp_pwm_remove(struct platform_device *pdev)
 {
 	struct mtk_disp_pwm *mdp = platform_get_drvdata(pdev);
-	int ret;
-
-	ret = pwmchip_remove(&mdp->chip);
-	clk_unprepare(mdp->clk_mm);
-	clk_unprepare(mdp->clk_main);
 
-	return ret;
+	return pwmchip_remove(&mdp->chip);
 }
 
 static const struct mtk_pwm_data mt2701_pwm_data = {
-- 
2.12.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
