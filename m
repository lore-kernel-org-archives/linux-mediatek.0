Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB143C64EC4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 01:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=q7r5ddN92A+gb/JSXPLt/QT21LW9kefr3aC+Q48S/lc=; b=UfnSSu2sX2n+7lYhCToxXb/1HM
	UC6/7Qkp5KVHQcbCrVmYcyUd7yGLh7X+UMojNAWSH7o6kSg1mwgHr6epnGW7slWbuYRlWiYAd47zb
	ikpY1S4cfJV2qAsg++LtBVDHtJBCHGmfW3OMqCt6tQKkZSwhD2LdqcdYQqaZPBNd4axmPTzOh2kMe
	KwQCeA00AFR/LjfS1N0uiMRO7S2JF/rzPE7DJjKvoaSPn7GvX3ke/4xkKOlaN48bK+X4yTKv+2Xvs
	RRgLXVwAxgMJ2Qsd+c7J3IRsmB9OGTkRJt8Nl7GhWgzbpWhCSDxbzQdtePUh14N0foXeh4hPI/Va8
	ahp7vkMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pa4i7-007M2e-Pq; Thu, 09 Mar 2023 01:04:47 +0000
Received: from s2.dolansoft.org ([212.51.146.245] helo=mx.dolansoft.org)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pa4hy-007M0d-Ej; Thu, 09 Mar 2023 01:04:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=brun.one;
	s=s1; h=MIME-Version:Message-Id:Date:Subject:Cc:To:From:In-Reply-To:
	References:From:To:Subject:Date:Message-ID:Reply-To;
	bh=q7r5ddN92A+gb/JSXPLt/QT21LW9kefr3aC+Q48S/lc=; b=pkDYxYF9MAOcCpo6lZKnuimK2r
	kmS6NSQX1tzVZ/kGYQ2UDoAKPMn5lbx4DpcbG3r/Y8QS3VMcGlSu61mTTmyvu9d2uBv2ySzSnQaiS
	Ck0bCPiqZ+6G/Ml8i0FgIuPRrzeeLRwNNe6qqiLyxJZ2CDgutqqEOzYR5P/06uwPDBn4fLjBGPZip
	3OYMTF6Ve+sDIBevMZj+3QMyBpO6yGsOCoWYR5j+z+Zy0WJUrxgOtBFneGSpaFffmsMtx4lVzg+E6
	E5/ZufKv1A+LTK0hvL3PK7FOnptK9WM9K3OjSUmd3xaWEWDvKOVJqhGb4ot72mkLWISpZ3PAe7qbA
	nmtlSdNA==;
Received: from [212.51.153.89] (helo=blacklava.cluster.local)
	by mx.dolansoft.org with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <lorenz@dolansoft.org>)
	id 1pa4hn-001JTb-1d;
	Thu, 09 Mar 2023 01:04:27 +0000
From: Lorenz Brun <lorenz@brun.one>
To: Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pwm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2] pwm: mediatek: support inverted polarity
Date: Thu,  9 Mar 2023 02:04:10 +0100
Message-Id: <20230309010410.2106525-1-lorenz@brun.one>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_170438_516441_FB4E002A 
X-CRM114-Status: GOOD (  15.32  )
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

According to the MT7986 Reference Manual the Mediatek PWM controller
doesn't appear to have support for inverted polarity.

To still support inverted PWM for common use cases, this relaxes the
check for inverted polarity within the driver to allow it to work in
case usage_power is set to true, i.e. the exact waveform does not
matter. If usage_power is true and the polarity is inverted the duty
cycle is mathematically inverted before being applied to the hardware.

Signed-off-by: Lorenz Brun <lorenz@brun.one>
---
V2: Only allow mathematically inverted PWM if usage_power is true
---
 drivers/pwm/pwm-mediatek.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
index 5b5eeaff35da..18791304d1ca 100644
--- a/drivers/pwm/pwm-mediatek.c
+++ b/drivers/pwm/pwm-mediatek.c
@@ -202,8 +202,16 @@ static int pwm_mediatek_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 			      const struct pwm_state *state)
 {
 	int err;
-
-	if (state->polarity != PWM_POLARITY_NORMAL)
+	u64 duty_cycle;
+
+	/* According to the MT7986 Reference Manual the peripheral does not
+	 * appear to have the capability to invert the output.
+	 * This means that inverted mode can not be fully supported as the
+	 * waveform will always start with the low period and end with the high
+	 * period. Thus reject non-normal polarity if the shape of the waveform
+	 * matters, i.e. usage_power is not set.
+	 */
+	if (state->polarity != PWM_POLARITY_NORMAL && !state->usage_power)
 		return -EINVAL;
 
 	if (!state->enabled) {
@@ -213,7 +221,11 @@ static int pwm_mediatek_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 		return 0;
 	}
 
-	err = pwm_mediatek_config(pwm->chip, pwm, state->duty_cycle, state->period);
+	duty_cycle = state->duty_cycle;
+	if (state->polarity == PWM_POLARITY_INVERSED)
+		duty_cycle = state->period - state->duty_cycle;
+
+	err = pwm_mediatek_config(pwm->chip, pwm, duty_cycle, state->period);
 	if (err)
 		return err;
 
-- 
2.39.2


