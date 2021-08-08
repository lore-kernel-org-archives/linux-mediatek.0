Return-Path: <SRS0=9HTA=M7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7FA1C4338F
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Aug 2021 13:25:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EC3160EE7
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Aug 2021 13:25:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9EC3160EE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RDVg6urEVaSqlmgN0Qal4Hu2W10yZdh2dS7jZExHGKI=; b=tiZ65xhzAQTnJx
	qNLXErzCebLsI2SiOtByjG8UruaUCg8tF5F0JvLtqBhSvJ5xkeCmgTPDiYspALFzjL4MLHutO5vGg
	DQMwRKvP3vZXtL5SHnHFjha2yxT2LllNmliecz7lJYMFjzclUf2pcmjap5h5fVlGXmANhdoy9u3NP
	UokYIWC9sQPbS8C82BrNhU0OOAc5U37NomtY95d8xP+uJpDTg3J6fCgFkQ9cFWA01wJw8xys5/3P1
	Clo3Azq/uw/Za/lDjFiBS0xjoWwuSwF/rX7rM8KzDHYOfVGmYyVbSwxkkaVQOd61rp6noID09p5ty
	kJTjAt1dZpSRLecRhOyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCio3-00Ft7O-VM; Sun, 08 Aug 2021 13:25:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mCinJ-00FsrE-VI; Sun, 08 Aug 2021 13:24:51 +0000
X-UUID: ef661208605943d49f46749aedb4d052-20210808
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=oz8R6JzK/dsLcXIYjmpTj+oBt2JJQ5u816nXyN6D10Q=; 
 b=cmKVPqG9tVHZ43FXo2tVYxLOjv0Z1tg0Hx1OQBLFpc7MMW9oHgjvlWhFr4dNMZINuPDTTnJREoULOm35JSNkdzLxr0F6ZGGKC6RZJ6+4z9kKF4g2xL32dVHrKkRjJkAfd5dXlT60kDn8DVgG2y2eqy1WH1cglJhQYWly/Sp3jN4=;
X-UUID: ef661208605943d49f46749aedb4d052-20210808
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 771842644; Sun, 08 Aug 2021 06:24:44 -0700
Received: from MTKMBS33N1.mediatek.inc (172.27.4.75) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 8 Aug 2021 06:24:44 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sun, 8 Aug 2021 21:24:39 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Sun, 8 Aug 2021 21:24:39 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Thierry Reding <thierry.reding@gmail.com>, Lee Jones
 <lee.jones@linaro.org>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
 <u.kleine-koenig@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <linux-pwm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <srv_heupstream@mediatek.com>, <yingjoe.chen@mediatek.com>,
 <eddie.huang@mediatek.com>, <ck.hu@mediatek.com>, <stonea168@163.com>,
 <huijuan.xie@mediatek.com>, <shuijing.li@mediatek.com>, Jitao Shi
 <jitao.shi@mediatek.com>
Subject: [PATCH v7 4/5] pwm: mtk_disp: fix overflow in period and duty
 calcalation
Date: Sun, 8 Aug 2021 21:24:32 +0800
Message-ID: <20210808132433.66037-5-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210808132433.66037-1-jitao.shi@mediatek.com>
References: <20210808132433.66037-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 24BCD395290324602A77D53D0D5D36E2C725DAB8C0F7FBC885E183E134A55C802000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210808_062450_099055_B2CA839D 
X-CRM114-Status: GOOD (  10.49  )
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

Current calculation for period and high_width may have
64-bit overflow. state->period and rate are u64.
rate * state->period will overflow.

clk_div = div_u64(rate * state->period, NSEC_PER_SEC)
period = div64_u64(rate * state->period, div);
high_width = div64_u64(rate * state->duty_cycle, div);

This patch is to resolve it by using mul_u64_u64_div_u64().

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 drivers/pwm/pwm-mtk-disp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm-mtk-disp.c b/drivers/pwm/pwm-mtk-disp.c
index 599d7dd8ecab..4f6de6f24484 100644
--- a/drivers/pwm/pwm-mtk-disp.c
+++ b/drivers/pwm/pwm-mtk-disp.c
@@ -116,7 +116,7 @@ static int mtk_disp_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	 * high_width = (PWM_CLK_RATE * duty_ns) / (10^9 * (clk_div + 1))
 	 */
 	rate = clk_get_rate(mdp->clk_main);
-	clk_div = div_u64(rate * state->period, NSEC_PER_SEC) >>
+	clk_div = mul_u64_u64_div_u64(state->period, rate, NSEC_PER_SEC) >>
 			  PWM_PERIOD_BIT_WIDTH;
 	if (clk_div > PWM_CLKDIV_MAX) {
 		if (!mdp->enabled) {
@@ -127,11 +127,11 @@ static int mtk_disp_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	}
 
 	div = NSEC_PER_SEC * (clk_div + 1);
-	period = div64_u64(rate * state->period, div);
+	period = mul_u64_u64_div_u64(state->period, rate, div);
 	if (period > 0)
 		period--;
 
-	high_width = div64_u64(rate * state->duty_cycle, div);
+	high_width = mul_u64_u64_div_u64(state->duty_cycle, rate, div);
 	value = period | (high_width << PWM_HIGH_WIDTH_SHIFT);
 
 	mtk_disp_pwm_update_bits(mdp, mdp->data->con0,
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
