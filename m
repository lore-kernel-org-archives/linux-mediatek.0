Return-Path: <SRS0=Bv85=4U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90BA6C3F2C6
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Mar 2020 10:19:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65A6921556
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Mar 2020 10:19:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BX8XyueM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="fStkvVGf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65A6921556
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FT+2LN07iTT0U5eSgTgKaD/JhG3tdATPUJD+WOCig60=; b=BX8XyueMS2gUGs
	MKncmuFsI9uUOyxN6n3CYjStY4OXDJmzBbJdCEz8o0J30330626GLWmj5+wpGGuqn9Qb0mrtCtQBG
	qKYJmINqDZ/ZU5VvxYuCWEOEPwCr9bngnO//WlDoZ5eHUMxb5MnB5tE5GfRuq2hIp+1Q5Uxs886Ti
	NQ3F4Xn26DAfLL95KqZbEQQcpv0o53O5s3juyZcdRqF/gz1WHliNRvgxNuLoIWamnED4G0zgxqexw
	3ElF3mz0Rh1ZN4/03rOXM7MvatgeViERWnY1DXNTT284dOGf219+nhynxMviTLJmqtu/U42A78ip+
	KwfJNTXaVUjCy8r/ifNQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j94eD-0003j0-II; Tue, 03 Mar 2020 10:19:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j94eA-0003hn-5k; Tue, 03 Mar 2020 10:19:31 +0000
X-UUID: 32216669192f44229ce3ff9c2e44121a-20200303
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=kNo7DFj3b9HktV/9EBruUcLqKxjTBFu6uKwuH9eM2VA=; 
 b=fStkvVGfdODZUFXguzcaSao361mDB+EW3bBusAbnaUlGGE/VqKZLS5KuAaEyBY9TUxIXZXS5weqU0adXCsNkx6rOzkyQYQmMquvB2VF3631lmuQE71qIba/YVbK+YKby1XTp4ukN2F+CcXHcwjVWne3RcKqaERgSJw5JrlcgMCQ=;
X-UUID: 32216669192f44229ce3ff9c2e44121a-20200303
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <sam.shih@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1481984747; Tue, 03 Mar 2020 02:19:21 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 3 Mar 2020 02:20:11 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 3 Mar 2020 18:18:18 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Tue, 3 Mar 2020 18:19:16 +0800
From: Sam Shih <sam.shih@mediatek.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2 1/1] pwm: mediatek: add longer period support
Date: Tue, 3 Mar 2020 18:19:15 +0800
Message-ID: <1583230755-25986-2-git-send-email-sam.shih@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1583230755-25986-1-git-send-email-sam.shih@mediatek.com>
References: <1583230755-25986-1-git-send-email-sam.shih@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200303_021930_224400_23657B83 
X-CRM114-Status: GOOD (  13.95  )
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
 drivers/pwm/pwm-mediatek.c | 34 ++++++++++++++++++++++++++++++----
 1 file changed, 30 insertions(+), 4 deletions(-)

diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
index b94e0d09c300..c64ecff6c550 100644
--- a/drivers/pwm/pwm-mediatek.c
+++ b/drivers/pwm/pwm-mediatek.c
@@ -121,8 +121,11 @@ static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
 			       int duty_ns, int period_ns)
 {
 	struct pwm_mediatek_chip *pc = to_pwm_mediatek_chip(chip);
-	u32 clkdiv = 0, cnt_period, cnt_duty, reg_width = PWMDWIDTH,
-	    reg_thres = PWMTHRES;
+	/* The source clock is divided by 2^clkdiv or iff the clksel bit
+	 * is set by (2^clkdiv*1625)
+	 */
+	u32 clkdiv = 0, clksel = 0, cnt_period, cnt_duty,
+	    reg_width = PWMDWIDTH, reg_thres = PWMTHRES;
 	u64 resolution;
 	int ret;
 
@@ -133,12 +136,30 @@ static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
 
 	/* Using resolution in picosecond gets accuracy higher */
 	resolution = (u64)NSEC_PER_SEC * 1000;
+	/* Calculate resolution based on current clock frequency */
 	do_div(resolution, clk_get_rate(pc->clk_pwms[pwm->hwpwm]));
-
+	/* Using resolution to calculate cnt_period which represents
+	 * the effective range of the PWM period counter
+	 */
 	cnt_period = DIV_ROUND_CLOSEST_ULL((u64)period_ns * 1000, resolution);
 	while (cnt_period > 8191) {
+		/* Using clkdiv to reduce clock frequency and calculate
+		 * new resolution based on new clock speed
+		 */
 		resolution *= 2;
 		clkdiv++;
+		if (clkdiv > PWM_CLK_DIV_MAX && !clksel) {
+			/* Using clksel to divide the pwm source clock by
+			 * an additional 1625, and recalculate new clkdiv
+			 * and resolution
+			 */
+			clksel = 1;
+			clkdiv = 0;
+			resolution = (u64)NSEC_PER_SEC * 1000 * 1625;
+			do_div(resolution,
+				clk_get_rate(pc->clk_pwms[pwm->hwpwm]));
+		}
+		/* Calculate cnt_period based on resolution */
 		cnt_period = DIV_ROUND_CLOSEST_ULL((u64)period_ns * 1000,
 						   resolution);
 	}
@@ -158,8 +179,13 @@ static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
 		reg_thres = PWM45THRES_FIXUP;
 	}
 
+	/* Calculate cnt_duty based on resolution */
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
