Return-Path: <SRS0=P9v4=KV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37EAAC4707F
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 May 2021 02:49:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFCD261090
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 May 2021 02:49:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFCD261090
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vXYC8ALf4F1ACnXPqk86/cs42hO5xaYtG60CA+7t2fw=; b=0am0QtRpIJFPiA
	XC9n4EebbhzVD/HYQi6NFqyc0VV8P66/7ynvG19xCMW0YcH54ht1qk8t1eH5rEshIDilciGTU6fZu
	ei4T+/p4WucwJ8FC8DDNFMtH9v54KL/Aix44+q4Eb+1XX8w2ARDvfMdPPysAAx86d0xlkC69wtiMy
	GG59vFXNMPX7nWamAZxk9u97XUhYfR00guU5UOOm22Qex5opfVzl9qR7nCo2OyY634cRH5qo421ND
	k9UDb+F6rLpGwmfbHZiGrJ9kyXQrR4U5hr3RGX/fQsqW4GMiQGLMNvHwWPiZdWd7htf5X0iw5YVQP
	sbZ8K54xeskQLjIl+sqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lljc5-00AFC1-Nf; Wed, 26 May 2021 02:49:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lljbU-00AEmN-DG; Wed, 26 May 2021 02:49:06 +0000
X-UUID: 6680e478896f4ce29738bf0206f2828e-20210525
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=S458bFdCrt2QE1SUK006+v380LaC2a7otA4+r/WIpms=; 
 b=Sp2Vl/xqFSVW4YdZCS9KyYxm9XqLfL65RATvekjNNOFysJOa3XhTnSsi7F+4WOWgAUJXTMS+DyT6SSlUNTHA+3D1oS0DQKSdFG6rO+Uck4j83SHZdN/rbi6NfwQFlQzC3q1IX/ejEVWgO2BAPomzrenAORuBSfWqMk/LrZPE+MY=;
X-UUID: 6680e478896f4ce29738bf0206f2828e-20210525
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 211836626; Tue, 25 May 2021 19:48:58 -0700
Received: from MTKMBS33N1.mediatek.inc (172.27.4.75) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 May 2021 19:48:56 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 26 May 2021 10:48:49 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Wed, 26 May 2021 10:48:48 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Thierry Reding <thierry.reding@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>
CC: <linux-pwm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <srv_heupstream@mediatek.com>, <yingjoe.chen@mediatek.com>,
 <eddie.huang@mediatek.com>, <cawa.cheng@mediatek.com>,
 <bibby.hsieh@mediatek.com>, <ck.hu@mediatek.com>, <stonea168@163.com>,
 <huijuan.xie@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>
Subject: [PATCH v3 1/3] pwm: mtk_disp: remove the clock operations for atomic
 APIs.
Date: Wed, 26 May 2021 10:48:44 +0800
Message-ID: <20210526024846.120838-2-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210526024846.120838-1-jitao.shi@mediatek.com>
References: <20210526024846.120838-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 27C78D67539E231FD6068E16D8933DE078811C7E6B199FD3E9E2BEFF4A92E1C42000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_194904_509522_5C7C5A79 
X-CRM114-Status: GOOD (  14.12  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

We have a issue that clocks aren't disabled when system is standby.
The driver uses the legacy APIs, and we want to covert them to
atomically APIs. And solve the issue at the sametime.

Change-Id: Iffcf74a488e4e6c0865fec17d8805cc8b2e58b54
Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 drivers/pwm/pwm-mtk-disp.c | 23 ++---------------------
 1 file changed, 2 insertions(+), 21 deletions(-)

diff --git a/drivers/pwm/pwm-mtk-disp.c b/drivers/pwm/pwm-mtk-disp.c
index 9b3ba401a3db..bc2fdbe853ba 100644
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
 	mdp->chip.npwm = 1;
@@ -207,7 +199,7 @@ static int mtk_disp_pwm_probe(struct platform_device *pdev)
 	ret = pwmchip_add(&mdp->chip);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "pwmchip_add() failed: %d\n", ret);
-		goto disable_clk_mm;
+		return ret;
 	}
 
 	platform_set_drvdata(pdev, mdp);
@@ -226,24 +218,13 @@ static int mtk_disp_pwm_probe(struct platform_device *pdev)
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
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
