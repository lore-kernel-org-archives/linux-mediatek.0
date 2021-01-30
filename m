Return-Path: <SRS0=EsFa=HB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A83FC433E0
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 Jan 2021 14:13:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0443264DDF
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 Jan 2021 14:13:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0443264DDF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kTc6JDUCGts9cNaxqxMoXcC/BBf5+uHG6TS715jThcE=; b=PRe93GB4PA/sAj2S+QsSAFgc2
	zt12G89y3mSakddHuOGg1Zk7z130wyBdhxprhMnuYzIaOtDxESWLJO5cwxcs7UDvpuYUhiW0UGd8K
	aoWatZGi0egtVgjsjhG84LAly2Vf3U/b/5ETX5AjCqN+1UnObOYIRkRuM8z5f7J/Mthw/jSeSSeBJ
	nhe9btUktYGjCtJAeT5UfVHWMVS/dc/OptrkD/vECGgy7Pok559Sqb0Plnfi+5LFTYs8mGayKZNqm
	Q2EUnHlSq7fZeLVwnMg1kBH2thbeMwjgzDurovtVZm4cPCKVZxzFoKgFncsEidJDhdhdSyYVfI1Pm
	5GGxAytgw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5qzY-0002fy-CT; Sat, 30 Jan 2021 14:12:48 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5qzU-0002eX-T6; Sat, 30 Jan 2021 14:12:45 +0000
X-UUID: d9ef97674b734c4da630a2f4f757ae98-20210130
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=DyzlMt+ZRsFBAamZ/P7DPnw9Tzbiso9sA1OiSGy7Xek=; 
 b=aQMk6qXDKIs6a9p3jtmaMOjMed+bTH1nJqB5brc5CQHQOuZct5GNvMlBay5qtgLmiOJgMhT24DurCbFGMGRo3RiBccstrePAp2IZEcw7u9NEsUNFuS7Y9iFaQKW/Ko/iUevzEJ8Nhrjr9ou0SdtXe5NzyXqk9QSXXrrMATKNNVg=;
X-UUID: d9ef97674b734c4da630a2f4f757ae98-20210130
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1368492662; Sat, 30 Jan 2021 06:12:37 -0800
Received: from MTKMBS33N1.mediatek.inc (172.27.4.75) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 30 Jan 2021 06:12:36 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 30 Jan 2021 22:12:33 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Sat, 30 Jan 2021 22:12:32 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Thierry Reding <thierry.reding@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>
Subject: [PATCH v2 3/3] pwm: mtk_disp: implement .get_state()
Date: Sat, 30 Jan 2021 22:12:26 +0800
Message-ID: <20210130141226.25357-4-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.12.5
In-Reply-To: <20210130141226.25357-1-jitao.shi@mediatek.com>
References: <20210130141226.25357-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 05FF14DABF24935074C7B5A197E4A8FAE17711D2C7A914C6F6F525F957A904C82000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210130_091245_085449_9470D4CB 
X-CRM114-Status: GOOD (  11.89  )
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

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 drivers/pwm/pwm-mtk-disp.c | 46 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/pwm/pwm-mtk-disp.c b/drivers/pwm/pwm-mtk-disp.c
index 502228adf718..166e0a8ca703 100644
--- a/drivers/pwm/pwm-mtk-disp.c
+++ b/drivers/pwm/pwm-mtk-disp.c
@@ -179,8 +179,54 @@ static int mtk_disp_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
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
+	if (!state->enabled) {
+		clk_disable_unprepare(mdp->clk_mm);
+		clk_disable_unprepare(mdp->clk_main);
+	}
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
2.12.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
