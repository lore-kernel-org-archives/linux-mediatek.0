Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE09C7EE30
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Mar 2023 20:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ujEZ6ExOsdh6hl+KaXU2L5kIkg0VilRWgkdQvPvZgAA=; b=KLvd0tBNUfY7CpJfQrXDwA880Q
	YAjPJu6xtNrjZeOzshklCZ6yjA4JIx4EGtSvJYYH872E4WucbObZ34Gfc/AgG6JqCdSQInO0aDAP2
	Gro3sr2+bQARtgxzcqWPWxFg8nC+zY2kVfqXPK7KmltPgJ3O2BePKJ8lJHadd01zIo53ZAjctMmqh
	kmCf/mpCyospQZgR+RXbV9XVUJCdfehYKtEY2Y/L9A1T+ITrl70cApKMHOpH16VGOtl3x/uP7oC6r
	ozkRLSdJFLVV67ZRRog4zPssY9i480R84xXwh9xrSnYea2l1j7bhF1DJ5p9vgBJFJJHbuH0f4qDj1
	XeTGBLAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYCUL-007QPd-NW; Fri, 03 Mar 2023 20:58:49 +0000
Received: from s2.dolansoft.org ([212.51.146.245] helo=mx.dolansoft.org)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYCUB-007QOB-8g; Fri, 03 Mar 2023 20:58:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=brun.one;
	s=s1; h=MIME-Version:Message-Id:Date:Subject:Cc:To:From:In-Reply-To:
	References:From:To:Subject:Date:Message-ID:Reply-To;
	bh=ujEZ6ExOsdh6hl+KaXU2L5kIkg0VilRWgkdQvPvZgAA=; b=HfaLr0SW+VLWr8EL7YPdwlHKkD
	DY5UNw4wKhVRHP1TgIfGKhoJkMgOd/Ocs85vFb6eqqzpDDlj5E9RTV9totxL8CwaFOpysU3yfN1Xe
	wYKX4/2sRorPuN6F7WeN64YG18ZJYhKvoJZ+qtgYf9hDN6ShtS+ojHdBtidyF8+Ogdv8h2uXgNWih
	pRmqVOnj+RzNnLWv4zPVvJzf88Dd2Xq0Bw1bHZvEM1u0Dsezylhlp2h4FRywBypiZGlaoeng6MJF4
	8qdD45DeZ95kis7Qy02L/LPntKQEa1/HNk9Wlm/781Q+LVkn/ZzBNwtg4wC3X/f9o5MYHXcVbWpgq
	DDrrDUCg==;
Received: from [212.51.153.89] (helo=blacklava.cluster.local)
	by mx.dolansoft.org with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <lorenz@dolansoft.org>)
	id 1pYCU2-0015v2-1I;
	Fri, 03 Mar 2023 20:58:30 +0000
From: Lorenz Brun <lorenz@brun.one>
To: Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pwm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] pwm: mediatek: support inverted polarity
Date: Fri,  3 Mar 2023 21:58:21 +0100
Message-Id: <20230303205821.2285418-1-lorenz@brun.one>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_125839_347247_66C34DAC 
X-CRM114-Status: GOOD (  11.75  )
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

According to the MT7986 Reference Manual the Mediatek  PWM controller
doesn't appear to have support for inverted polarity.

This implements the same solution as in pwm-meson and just inverts the
duty cycle instead, which results in the same outcome.

Signed-off-by: Lorenz Brun <lorenz@brun.one>
---
 drivers/pwm/pwm-mediatek.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
index 5b5eeaff35da..6f4a54c8299f 100644
--- a/drivers/pwm/pwm-mediatek.c
+++ b/drivers/pwm/pwm-mediatek.c
@@ -202,9 +202,7 @@ static int pwm_mediatek_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 			      const struct pwm_state *state)
 {
 	int err;
-
-	if (state->polarity != PWM_POLARITY_NORMAL)
-		return -EINVAL;
+	u64 duty_cycle;
 
 	if (!state->enabled) {
 		if (pwm->state.enabled)
@@ -213,7 +211,14 @@ static int pwm_mediatek_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 		return 0;
 	}
 
-	err = pwm_mediatek_config(pwm->chip, pwm, state->duty_cycle, state->period);
+	// According to the MT7986 Reference Manual the peripheral does not
+	// appear to have the capability to invert the output. Instead just
+	// invert the duty cycle.
+	duty_cycle = state->duty_cycle;
+	if (state->polarity == PWM_POLARITY_INVERSED)
+		duty_cycle = state->period - state->duty_cycle;
+
+	err = pwm_mediatek_config(pwm->chip, pwm, duty_cycle, state->period);
 	if (err)
 		return err;
 
-- 
2.39.1


