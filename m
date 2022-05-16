Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E17BEC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 May 2022 09:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zs23Mxvg81GOchN336D6T13V0z2DZX+Ah/e7IJEZmfs=; b=dMW7drblFwcppF
	BYYm8nZQAcedaNZ34OwZ0EKxOWTvEhMT7fB80Hz/nFqcoKFUtFGVsGMFpneSy837orZQ9vq011aAp
	KuWoN8u01Af+BhBIzZL6vOXvYeE0JAoYUzYv+ykySeLp2hEOMQjMR6vDURdj80ec/QN+bHiHyQ4uK
	PiCqYI3rRd6F2Lu4Ffey+21bZIX0GUcv0RIgreIZ0Fo6xlYfWubF5ByYPa9yY245iUidUo17kLn/I
	IEhBDPENdIUdQi3Ey8dfYD/Mfx4suPO8kwWuAODocYm1T/T2T+qUH4i+H0Yuwz0Vo4Dnk+YKtcUig
	IN5ZGKUOUz6XgYy5O/vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqXFc-006vir-Bw; Mon, 16 May 2022 09:42:52 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqXFH-006vcV-NV; Mon, 16 May 2022 09:42:33 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 0DD0B1F427D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652694149;
 bh=4mIF+ychqwYJm8NY5gdtpfE5cKMCOU+a1wS2818V+qo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eYgTkNrcd4N5IVPGgb1LKWPB9xap3fAhms20vvS9IXta7ijFxGyBuMOD5Sn7uD2i8
 kK9eOJtgRQDs7rKaFCTHR2jCoazmuyKhUC1/TFvnw9JOCQWwISlh6islxLaKyEE5nL
 ns6tqtXyTQKHTurEL7Ad70sRt44a0PV2SdNTfvc7h3jXC0hI1GOABzSoDgS5y7il9e
 z0pMd5fOvX15fyGr5WB3m/BO9+NuJwwzZmZfL+ytmm09ORGtU/Z+st3YcZaSiYq3zS
 Zq6TSRlEBoPAFntG3f6EcvE7hLJSp7LfKTsS3xg9IMCMrwfyTltjIxtRLAIsMWyDfz
 SuBJeBY05BYlg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: sean.wang@mediatek.com
Cc: pavel@ucw.cz, matthias.bgg@gmail.com, linux-leds@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 2/3] leds: leds-mt6323: Open code and drop MT6323_CAL_HW_DUTY
 macro
Date: Mon, 16 May 2022 11:42:21 +0200
Message-Id: <20220516094222.30414-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220516094222.30414-1-angelogioacchino.delregno@collabora.com>
References: <20220516094222.30414-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_024232_017825_83BF62D2 
X-CRM114-Status: GOOD (  10.34  )
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

There is only one instance of using this macro and it's anyway not
simplifying the flow, or increasing the readability of this driver.

Drop this macro by open coding it in mt6323_led_set_blink().

No functional changes.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/leds/leds-mt6323.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/leds/leds-mt6323.c b/drivers/leds/leds-mt6323.c
index a7d1ed370969..fa9d251e9efa 100644
--- a/drivers/leds/leds-mt6323.c
+++ b/drivers/leds/leds-mt6323.c
@@ -62,8 +62,6 @@
 #define MT6323_ISINK_CH_EN(i)		BIT(i)
 
 #define MAX_SUPPORTED_LEDS		8
-#define MT6323_CAL_HW_DUTY(o, p, u)	DIV_ROUND_CLOSEST((o) * 100000ul,\
-					(p) * (u))
 
 struct mt6323_leds;
 
@@ -321,7 +319,7 @@ static int mt6323_led_set_blink(struct led_classdev *cdev,
 	 * Calculate duty_hw based on the percentage of period during
 	 * which the led is ON.
 	 */
-	duty_hw = MT6323_CAL_HW_DUTY(*delay_on, period, spec->unit_duty);
+	duty_hw = DIV_ROUND_CLOSEST(*delay_on * 100000ul, period * spec->unit_duty);
 
 	/* hardware doesn't support zero duty cycle. */
 	if (!duty_hw)
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
