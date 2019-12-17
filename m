Return-Path: <SRS0=Z+8g=2H=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA15BC43603
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Dec 2019 04:13:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99629206E6
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Dec 2019 04:13:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N4Lt94CG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="FSgOH8Zd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99629206E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mDV6zMik38hfvopS52Sioprauy0SshW+rnTiqpEr1Jo=; b=N4Lt94CGJl/yLq
	iKFVPJxIhJlmhjBcwWtF5/ud7I6LE3phMq9fnPbZ96/IaoJnpx/n3c4/Y3XKQk2Qts1CKf/jWu7jy
	90RK4NvLYA+aH+YItCpFVmGw0hl9HlU6b5QYYJKY+Y/ik3IpsLmKNmvGbR6T9Lc0qSnCtoIFhIcdF
	NlvbjAxo+Hsvknrr5Iha0oyBsKJNolWTZl8EfA47Fa8KvdS6+9vQSvixHEqYitv5tbdD99ho2aNR0
	EtysGeIxlK5qfqm3dVH/C5URxHXBzJPeT0LCo0D1ZEq48PLN+5FIY7Ca8ASivucct9Vp9otM3F90E
	ae3zyv4ZaLF0JGJiiQAg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ih4EQ-0002dV-5A; Tue, 17 Dec 2019 04:13:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ih4Dy-0002C6-7W; Tue, 17 Dec 2019 04:12:43 +0000
X-UUID: 2df27680f1844217be60020583f553aa-20191216
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=NXAXywe6bG/ogKzjc7bR2k8BXtOTUM9mI6/1bMTQUeg=; 
 b=FSgOH8Zdv8Gh5UoXzMLCPz6QTEOUr9uJk8BOevVhavH99x7Z5OP24DtFLAXpbv3/XLyFy7TShpJOO8sLht7OhR/uLdV+w+bHGhQU++r2h39S18EV/bCM3JVCSty0wQk8eUWhdusGdTytYIjKtLw9yN+ig5TXdKXz6Agy+SoqD04=;
X-UUID: 2df27680f1844217be60020583f553aa-20191216
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1048344974; Mon, 16 Dec 2019 20:12:37 -0800
Received: from MTKMBS33DR.mediatek.inc (172.27.6.106) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 16 Dec 2019 20:02:53 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33DR.mediatek.inc
 (172.27.6.106) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Tue, 17 Dec 2019 11:59:58 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Tue, 17 Dec 2019 12:02:11 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Thierry Reding <thierry.reding@gmail.com>, Uwe Kleine-Koenig
 <u.kleine-koenig@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-pwm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, CK Hu <ck.hu@mediatek.com>
Subject: [PATCH v4 1/2] pwm: mtk_disp: fix pwm clocks not poweroff when
 disable pwm
Date: Tue, 17 Dec 2019 12:02:36 +0800
Message-ID: <20191217040237.28238-2-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191217040237.28238-1-jitao.shi@mediatek.com>
References: <20191217040237.28238-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: C64F1CCDD6C51B102A0764C8E6E30B3F9EB8E77F9E408CAA7B83AB79D34817F42000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191216_201242_290221_9B9116F9 
X-CRM114-Status: GOOD (  11.51  )
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, sj.huang@mediatek.com,
 linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The clocks of pwm are still in prepare state when disable pwm.

Because the clocks is prepared in mtk_disp_pwm_probe() and unprepared
in mtk_disp_pwm_remove().

clk_prepare and clk_unprepare aren't called by mtk_disp_pwm_enable()
and mtk_disp_pwm_disable().

Modified:
So clk_enable() is instread with clk_prepare_enable().
clk_disable() is instread with clk_disable_unprepare().

And remove the clk_prepare() from mtk_disp_pwm_probe(),
remove the clk_unprepare from mtk_disp_pwm_remove().

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 drivers/pwm/pwm-mtk-disp.c | 43 +++++++++++---------------------------
 1 file changed, 12 insertions(+), 31 deletions(-)

diff --git a/drivers/pwm/pwm-mtk-disp.c b/drivers/pwm/pwm-mtk-disp.c
index 83b8be0209b7..c7b14acc9316 100644
--- a/drivers/pwm/pwm-mtk-disp.c
+++ b/drivers/pwm/pwm-mtk-disp.c
@@ -98,13 +98,13 @@ static int mtk_disp_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
 	high_width = div64_u64(rate * duty_ns, div);
 	value = period | (high_width << PWM_HIGH_WIDTH_SHIFT);
 
-	err = clk_enable(mdp->clk_main);
+	err = clk_prepare_enable(mdp->clk_main);
 	if (err < 0)
 		return err;
 
-	err = clk_enable(mdp->clk_mm);
+	err = clk_prepare_enable(mdp->clk_mm);
 	if (err < 0) {
-		clk_disable(mdp->clk_main);
+		clk_disable_unprepare(mdp->clk_main);
 		return err;
 	}
 
@@ -124,8 +124,8 @@ static int mtk_disp_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
 					 0x0);
 	}
 
-	clk_disable(mdp->clk_mm);
-	clk_disable(mdp->clk_main);
+	clk_disable_unprepare(mdp->clk_mm);
+	clk_disable_unprepare(mdp->clk_main);
 
 	return 0;
 }
@@ -135,13 +135,13 @@ static int mtk_disp_pwm_enable(struct pwm_chip *chip, struct pwm_device *pwm)
 	struct mtk_disp_pwm *mdp = to_mtk_disp_pwm(chip);
 	int err;
 
-	err = clk_enable(mdp->clk_main);
+	err = clk_prepare_enable(mdp->clk_main);
 	if (err < 0)
 		return err;
 
-	err = clk_enable(mdp->clk_mm);
+	err = clk_prepare_enable(mdp->clk_mm);
 	if (err < 0) {
-		clk_disable(mdp->clk_main);
+		clk_disable_unprepare(mdp->clk_main);
 		return err;
 	}
 
@@ -158,8 +158,8 @@ static void mtk_disp_pwm_disable(struct pwm_chip *chip, struct pwm_device *pwm)
 	mtk_disp_pwm_update_bits(mdp, DISP_PWM_EN, mdp->data->enable_mask,
 				 0x0);
 
-	clk_disable(mdp->clk_mm);
-	clk_disable(mdp->clk_main);
+	clk_disable_unprepare(mdp->clk_mm);
+	clk_disable_unprepare(mdp->clk_main);
 }
 
 static const struct pwm_ops mtk_disp_pwm_ops = {
@@ -194,14 +194,6 @@ static int mtk_disp_pwm_probe(struct platform_device *pdev)
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
@@ -210,7 +202,7 @@ static int mtk_disp_pwm_probe(struct platform_device *pdev)
 	ret = pwmchip_add(&mdp->chip);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "pwmchip_add() failed: %d\n", ret);
-		goto disable_clk_mm;
+		return ret;
 	}
 
 	platform_set_drvdata(pdev, mdp);
@@ -229,24 +221,13 @@ static int mtk_disp_pwm_probe(struct platform_device *pdev)
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
2.21.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
