Return-Path: <SRS0=BtH1=MQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC5D4C4338F
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Jul 2021 08:29:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7937860E97
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Jul 2021 08:29:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7937860E97
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RDVg6urEVaSqlmgN0Qal4Hu2W10yZdh2dS7jZExHGKI=; b=0FgnGjT3ZOqOFY
	MrxS6T/ERZ1ef3aynk0Urcvxb9OZfF0utJv5Zw8fYMxEc7v1KXVHqDpDMbdozD7+22fnpYWZ8/8M6
	vxuiMLF+aevbWgnM41deTWoQwQbAQK4OM1rZ/BiQcVpoAuKtWb/gAuLnh4XBEkh2X8euLH7nPfrPx
	PEc3ihoi14PA7mBcBgrF/6IY5MR/yI/OnZzdnPKX8abD2yk8shQ0XZFUdWTyJTR9PO9DQx/PEhBBu
	kvYcaRjPve/8cpHiGrQc4fHxEcl+olBOKdGJj2tXWMpn0tvTOGlx+HI6PMwWy8w6bYUxF56JfYrd4
	AYaBUTKJVXDnIJ2jNm8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7D25-006vlR-15; Sat, 24 Jul 2021 08:29:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7D21-006vkz-KW; Sat, 24 Jul 2021 08:29:15 +0000
X-UUID: b086ca54331d47349b82b30499189d70-20210724
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=oz8R6JzK/dsLcXIYjmpTj+oBt2JJQ5u816nXyN6D10Q=; 
 b=IInVGTfxFKK/kwhZh6NBWauSj7SH+RAMxhrDQxjLoAuFOr/MIWapDZ5uNQTlIcnXjWh0sFMVDmRch/hwFAcB0GrKGxc+hLdnfdVfLs0Hf9w9JnBbdd94v3yDspoGykawCOOw1B8M2uEegY7Ka3BLcRrQTECOAlt/r65ohM5nn0w=;
X-UUID: b086ca54331d47349b82b30499189d70-20210724
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1086093771; Sat, 24 Jul 2021 01:29:06 -0700
Received: from MTKMBS33N1.mediatek.inc (172.27.4.75) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 24 Jul 2021 01:19:04 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 24 Jul 2021 16:18:55 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Sat, 24 Jul 2021 16:18:54 +0800
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
Subject: [PATCH v6 4/5] pwm: mtk_disp: fix overflow in period and duty
 calcalation
Date: Sat, 24 Jul 2021 16:18:48 +0800
Message-ID: <20210724081849.182108-5-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210724081849.182108-1-jitao.shi@mediatek.com>
References: <20210724081849.182108-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 00542DEEE62E7D67BBB1D34FA5DE6387FF294617A841F8A5F6153D1AF11FE15A2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210724_012913_726412_EB622F15 
X-CRM114-Status: GOOD (  10.44  )
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
