Return-Path: <SRS0=P9v4=KV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 087C3C4707F
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 May 2021 02:49:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEAE661090
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 May 2021 02:49:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AEAE661090
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pSfMCJahrWVL4vKHpBr+/zafjKIB22mFkeZRk3/JNDs=; b=aG7+JsfLMlrGNP
	6V7ZomMdS/3l8f/7iYQP62R3P02NZv3MaIZnGTgIXe/BR8U5JlZS28IM/Eq63VDLB9dcNmLdVbb6L
	VwCnvzuq8HVbEyNEmHLFZEh3kiHuEoF5Re0aa3KhfzL71w6zkDyPXO4VksFen8tCtgDpVQXup+w1H
	YIf5kuh87IdKmDze8SquYsMzNA/1vShgdKr9xE3NirCDaUMFuP/JUvXV851vKnnyN300c74Lj90eq
	h+sAyrxEmKmFTdRxtaPRsMBB6F5+AK9mzGyY5B4fhufPDhYlgkd4PoRHOQO19IpJTxNQYs6/cXiIw
	yPsRrkQT5ho18TCOhElQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lljbR-00AEly-QV; Wed, 26 May 2021 02:49:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lljbO-00AEhX-Fu; Wed, 26 May 2021 02:49:00 +0000
X-UUID: 60ec783d45f7402db03cd41dccdd2b92-20210525
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=1U46B7Bl7bjwl0Eqjg0kYMe2AujHOPWtzQx1mw4esww=; 
 b=JJ/GiDbjmIh2aVThmSl95Dq6s/4d5g+OWxwCJf0ePJ4yNdc3b/PejNSvAklyZOy1+k49moxTyxaljFMkVfYCdrAFKVEmqTdw5YJnra9VWpaUJa9P2OzC/nQZDbuovEeJ9sSTZksu3MDY5Wz9jF/8vzE8o7j29bcYOwqQzK+8AHI=;
X-UUID: 60ec783d45f7402db03cd41dccdd2b92-20210525
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 935445999; Tue, 25 May 2021 19:48:56 -0700
Received: from MTKMBS33N2.mediatek.inc (172.27.4.76) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 May 2021 19:48:54 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 26 May 2021 10:48:51 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Wed, 26 May 2021 10:48:50 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Thierry Reding <thierry.reding@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>
CC: <linux-pwm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <srv_heupstream@mediatek.com>, <yingjoe.chen@mediatek.com>,
 <eddie.huang@mediatek.com>, <cawa.cheng@mediatek.com>,
 <bibby.hsieh@mediatek.com>, <ck.hu@mediatek.com>, <stonea168@163.com>,
 <huijuan.xie@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>
Subject: [PATCH v3 3/3] pwm: mtk_disp: implement atomic API .get_state()
Date: Wed, 26 May 2021 10:48:46 +0800
Message-ID: <20210526024846.120838-4-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210526024846.120838-1-jitao.shi@mediatek.com>
References: <20210526024846.120838-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 4FDB6116F4B55DB7826D226E8689B2C78A0F2CC440C7A178632882E9BB30287C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_194858_578545_B0ACB6D9 
X-CRM114-Status: GOOD (  10.71  )
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

Change-Id: Ie1618b90e77989ae558f59554d55d0d18754b091
Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 drivers/pwm/pwm-mtk-disp.c | 44 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/pwm/pwm-mtk-disp.c b/drivers/pwm/pwm-mtk-disp.c
index 9c95b9af417f..d7535f24364a 100644
--- a/drivers/pwm/pwm-mtk-disp.c
+++ b/drivers/pwm/pwm-mtk-disp.c
@@ -179,8 +179,52 @@ static int mtk_disp_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	return mtk_disp_pwm_enable(chip, state);
 }
 
+static void mtk_disp_pwm_get_state(struct pwm_chip *chip,
+				   struct pwm_device *pwm,
+				   struct pwm_state *state)
+{
+	struct mtk_disp_pwm *mdp = to_mtk_disp_pwm(chip);
+	u32 clk_div, period, high_width, con0, con1;
+	u64 rate;
+	int err;
+
+	err = clk_prepare_enable(mdp->clk_main);
+	if (err < 0) {
+		dev_err(chip->dev, "Can't enable mdp->clk_main: %d\n", err);
+		return;
+	}
+	err = clk_prepare_enable(mdp->clk_mm);
+	if (err < 0) {
+		dev_err(chip->dev, "Can't enable mdp->clk_mm: %d\n", err);
+		clk_disable_unprepare(mdp->clk_main);
+		return;
+	}
+
+	rate = clk_get_rate(mdp->clk_main);
+
+	con0 = readl(mdp->base + mdp->data->con0);
+	con1 = readl(mdp->base + mdp->data->con1);
+
+	state->polarity = con0 & PWM_POLARITY ?
+			  PWM_POLARITY_INVERSED : PWM_POLARITY_NORMAL;
+	state->enabled = !!(con0 & BIT(0));
+
+	clk_div = (con0 & PWM_CLKDIV_MASK) >> PWM_CLKDIV_SHIFT;
+	period = con1 & PWM_PERIOD_MASK;
+	state->period = div_u64(period * (clk_div + 1) * NSEC_PER_SEC, rate);
+	high_width = (con1 & PWM_HIGH_WIDTH_MASK) >> PWM_HIGH_WIDTH_SHIFT;
+	state->duty_cycle = div_u64(high_width * (clk_div + 1) * NSEC_PER_SEC,
+				    rate);
+
+	clk_disable_unprepare(mdp->clk_mm);
+	clk_disable_unprepare(mdp->clk_main);
+
+	mdp->enabled = state->enabled;
+}
+
 static const struct pwm_ops mtk_disp_pwm_ops = {
 	.apply = mtk_disp_pwm_apply,
+	.get_state = mtk_disp_pwm_get_state,
 	.owner = THIS_MODULE,
 };
 
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
