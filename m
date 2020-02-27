Return-Path: <SRS0=4wrq=4P=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 382D4C4BA06
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Feb 2020 07:48:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A87524656
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Feb 2020 07:48:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K4DWmJxv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="pxSou091"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A87524656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m+CmTdQhlmGKpiNHVEl0OQNJ5ll09QDVikifIXJBqs0=; b=K4DWmJxvBxDK2X
	Z/XqCkN7APrWpPhgyof6i2R6e2RhjcOlRjsvqIAF3Q/hJGZjVCszKPJN/+zLRg6/Y9f0+C4RjCPV6
	ADlb3A/v+MliLfMrkr0b4BhHdbY/4KI548+NzjecvwwkUzE9vXbs2BtIfqqn4quxa1egMDqRRFRgH
	6CmT2PoxwESpJUnkibWkoI402t7V0ktvTlyLhE6+JqMVYUU6T32mqTNaQUqoe5iOnRM6ib1LvESYW
	tgIaAKeqkENPTpdeaI1JAxpFAlzb4uU0hCmPbNNXcwnex36YAZbeRtN8e0TA+G7AiPVpCabzdpbrs
	baKCdFPC9jEIzkkJr0jw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7Dth-0007T5-JT; Thu, 27 Feb 2020 07:47:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7Dtd-0007SC-Gd; Thu, 27 Feb 2020 07:47:52 +0000
X-UUID: 44760950f0674a23888b4b0b83c4c890-20200226
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=63YRAaFL+lbXvbtjs/mfmNkzxs9oDsAdzcTK8UHwzWA=; 
 b=pxSou091h368wkBQ+0ZcyTn/etaoOycO7YaDYlfRpqAXa9X9FTmPeetTc8/Q13kqkk2brDwgorfEEW11G67VM5tTaDnZQgTbgh97Bm8sxjgz/8k3jW6FRWNfgPsoVxMj1/BkmLHEu8IEIZqqriANNicrz4f4PB05dQG/lZLjglY=;
X-UUID: 44760950f0674a23888b4b0b83c4c890-20200226
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sam.shih@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1189056678; Wed, 26 Feb 2020 23:47:41 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 26 Feb 2020 23:48:20 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 27 Feb 2020 15:46:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Thu, 27 Feb 2020 15:47:42 +0800
From: Sam Shih <sam.shih@mediatek.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 1/1] pwm: mediatek: add longer period support
Date: Thu, 27 Feb 2020 15:46:50 +0800
Message-ID: <1582789610-23133-2-git-send-email-sam.shih@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1582789610-23133-1-git-send-email-sam.shih@mediatek.com>
References: <1582789610-23133-1-git-send-email-sam.shih@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200226_234749_588042_E70A6F6E 
X-CRM114-Status: GOOD (  11.53  )
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
Cc: linux-pwm@vger.kernel.org, Sam Shih <sam.shih@mediatek.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 John Crispin <john@phrozen.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The pwm clock source could be divided by 1625 with PWM_CON
BIT(3) setting in mediatek hardware.

This patch add support for longer pwm period configuration,
which allowing blinking LEDs via pwm interface.

Signed-off-by: Sam Shih <sam.shih@mediatek.com>
---
 drivers/pwm/pwm-mediatek.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
index b94e0d09c300..9af309bea01a 100644
--- a/drivers/pwm/pwm-mediatek.c
+++ b/drivers/pwm/pwm-mediatek.c
@@ -121,8 +121,8 @@ static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
 			       int duty_ns, int period_ns)
 {
 	struct pwm_mediatek_chip *pc = to_pwm_mediatek_chip(chip);
-	u32 clkdiv = 0, cnt_period, cnt_duty, reg_width = PWMDWIDTH,
-	    reg_thres = PWMTHRES;
+	u32 clkdiv = 0, clksel = 0, cnt_period, cnt_duty,
+	    reg_width = PWMDWIDTH, reg_thres = PWMTHRES;
 	u64 resolution;
 	int ret;
 
@@ -141,9 +141,18 @@ static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
 		clkdiv++;
 		cnt_period = DIV_ROUND_CLOSEST_ULL((u64)period_ns * 1000,
 						   resolution);
+		if (clkdiv > PWM_CLK_DIV_MAX && !clksel) {
+			clksel = 1;
+			clkdiv = 0;
+			resolution = (u64)NSEC_PER_SEC * 1000 * 1625;
+			do_div(resolution,
+				clk_get_rate(pc->clk_pwms[pwm->hwpwm]));
+			cnt_period = DIV_ROUND_CLOSEST_ULL(
+					(u64)period_ns * 1000, resolution);
+		}
 	}
 
-	if (clkdiv > PWM_CLK_DIV_MAX) {
+	if (clkdiv > PWM_CLK_DIV_MAX && clksel) {
 		pwm_mediatek_clk_disable(chip, pwm);
 		dev_err(chip->dev, "period %d not supported\n", period_ns);
 		return -EINVAL;
@@ -159,7 +168,11 @@ static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
 	}
 
 	cnt_duty = DIV_ROUND_CLOSEST_ULL((u64)duty_ns * 1000, resolution);
-	pwm_mediatek_writel(pc, pwm->hwpwm, PWMCON, BIT(15) | clkdiv);
+	if (clksel)
+		pwm_mediatek_writel(pc, pwm->hwpwm, PWMCON, BIT(15) | BIT(3) |
+				    clkdiv);
+	else
+		pwm_mediatek_writel(pc, pwm->hwpwm, PWMCON, BIT(15) | clkdiv);
 	pwm_mediatek_writel(pc, pwm->hwpwm, reg_width, cnt_period);
 	pwm_mediatek_writel(pc, pwm->hwpwm, reg_thres, cnt_duty);
 
-- 
2.17.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
