Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B45A5C32771
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Sep 2022 15:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NtR2bahg+63mvUWwmYn5LV6cAxG/LMtfpBylZisfFSM=; b=chZoGOqvR+RiPXC5y5wnQlTWHm
	2Rl3JL1YJhsynkJq9he/hufEdavejS5WDQUKwyL9oE8M7Z8gkKDk+38mJxAEy60gT5RPFK15yGFvH
	OAXSmlgfubc0+einRw9ncZmZ1BI5EN9hoQ8IbB7urviA3P++isVx2WvzvsMUOB7c5oOaOO64IIyIa
	xR8UYbJBsqOwzZLQIAJFpOTy3f8MeHNtwdBzhEBRTmwDWCWIlF0FHfLFj3k52UDB+JIYnj5EvsLV8
	V+ZLlh075Seb5YibNjsp71axvxkLKEyuYxJEp4GAv6377G3hHLNFIHSN7WBx26qoDHfDyq5bivvBx
	pLnGf3wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odZRw-00H0km-1u; Wed, 28 Sep 2022 15:58:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odZPW-00GzM1-8T; Wed, 28 Sep 2022 15:55:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CBCF961F0C;
	Wed, 28 Sep 2022 15:55:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DCAAC433D6;
	Wed, 28 Sep 2022 15:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664380545;
	bh=rTxVsRSoNtBqk4DuZJ+tmhjE78RLJzMfTSqldv1r6/Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ox+7ChwI3mXjsFhmBD4fmyZMHwVY2fWySreTHkOuzsPQrdskuITrhR1xioh0qD7a2
	 BpwKinWMeUQh2AoaNcRUySSMp2p3qUd6aigcV+ss6ECJ4k4iCGq3z0nkBnzV5B//KG
	 6SU9d6SwxAuPo5bZDQFlvohqMCBL/qNDa4TMSGKUnwfnSInwdtOmhENDuBFqHqscIl
	 QbeS6uLxFEIN9wVnBfr0CcP8RwzW56wB1+nY928+YImUYpGG8WouAtjyTErEdSgBTK
	 VfRetoKpTP0RssLig6b2zuHTxbL180tHKJ9YgYj8cAcBl5uGhmJE7pqHxWIKD3K1K3
	 Y6OQZTEYgog1w==
From: matthias.bgg@kernel.org
To: roger.lu@mediatek.com,
	jia-wei.chang@mediatek.com
Cc: nfraprado@collabora.com,
	khilman@baylibre.com,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	angelogioacchino.delregno@collabora.com,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 7/8] soc: mtk-svs: mt8183: refactor o_slope calculation
Date: Wed, 28 Sep 2022 17:55:18 +0200
Message-Id: <20220928155519.31977-8-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928155519.31977-1-matthias.bgg@kernel.org>
References: <20220928155519.31977-1-matthias.bgg@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_085546_441358_F64FAD89 
X-CRM114-Status: GOOD (  13.07  )
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

From: Matthias Brugger <matthias.bgg@gmail.com>

The o_slope value is dependent of the o_slope_sign, refactor code to get
rid of unnecessary if constructs.

Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
---

 drivers/soc/mediatek/mtk-svs-mt8183.c | 54 ++++++++++++---------------
 1 file changed, 24 insertions(+), 30 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-svs-mt8183.c b/drivers/soc/mediatek/mtk-svs-mt8183.c
index 4b538cdefc86..7f7d5cd6be35 100644
--- a/drivers/soc/mediatek/mtk-svs-mt8183.c
+++ b/drivers/soc/mediatek/mtk-svs-mt8183.c
@@ -25,26 +25,28 @@ static int svs_mt8183_efuse_thermal_parsing(struct svs_platform *svsp)
 	o_slope_sign = (svsp->tefuse[0] >> 7) & BIT(0);
 
 	ts_id = (svsp->tefuse[1] >> 9) & BIT(0);
-	o_slope = (svsp->tefuse[0] >> 26) & GENMASK(5, 0);
-
-	if (adc_cali_en_t == 1) {
-		if (!ts_id)
-			o_slope = 0;
-
-		if (adc_ge_t < 265 || adc_ge_t > 758 ||
-		    adc_oe_t < 265 || adc_oe_t > 758 ||
-		    o_vtsmcu[0] < -8 || o_vtsmcu[0] > 484 ||
-		    o_vtsmcu[1] < -8 || o_vtsmcu[1] > 484 ||
-		    o_vtsmcu[2] < -8 || o_vtsmcu[2] > 484 ||
-		    o_vtsmcu[3] < -8 || o_vtsmcu[3] > 484 ||
-		    o_vtsmcu[4] < -8 || o_vtsmcu[4] > 484 ||
-		    o_vtsabb < -8 || o_vtsabb > 484 ||
-		    degc_cali < 1 || degc_cali > 63) {
-			dev_err(svsp->dev, "bad thermal efuse, no mon mode\n");
-			return -1;
-		}
-	} else {
-		dev_err(svsp->dev, "no thermal efuse, no mon mode\n");
+
+	if (!ts_id)
+		o_slope = 1534;
+	else {
+		o_slope = (svsp->tefuse[0] >> 26) & GENMASK(5, 0);
+		if (!o_slope_sign)
+			o_slope = 1534 + o_slope * 10;
+		else
+			o_slope = 1534 - o_slope * 10;
+	}
+
+	if (adc_cali_en_t == 0 ||
+	    adc_ge_t < 265 || adc_ge_t > 758 ||
+	    adc_oe_t < 265 || adc_oe_t > 758 ||
+	    o_vtsmcu[0] < -8 || o_vtsmcu[0] > 484 ||
+	    o_vtsmcu[1] < -8 || o_vtsmcu[1] > 484 ||
+	    o_vtsmcu[2] < -8 || o_vtsmcu[2] > 484 ||
+	    o_vtsmcu[3] < -8 || o_vtsmcu[3] > 484 ||
+	    o_vtsmcu[4] < -8 || o_vtsmcu[4] > 484 ||
+	    o_vtsabb < -8 || o_vtsabb > 484 ||
+	    degc_cali < 1 || degc_cali > 63) {
+		dev_err(svsp->dev, "bad thermal efuse, no mon mode\n");
 		return -1;
 	}
 
@@ -63,11 +65,7 @@ static int svs_mt8183_efuse_thermal_parsing(struct svs_platform *svsp)
 		x_roomt[i] = (((format[i] * 10000) / 4096) * 10000) / gain;
 
 	temp0 = (10000 * 100000 / gain) * 15 / 18;
-
-	if (!o_slope_sign)
-		mts = (temp0 * 10) / (1534 + o_slope * 10);
-	else
-		mts = (temp0 * 10) / (1534 - o_slope * 10);
+	mts = (temp0 * 10) / o_slope;
 
 	for (idx = 0; idx < svsp->bank_max; idx++) {
 		svsb = &svsp->banks[idx];
@@ -94,11 +92,7 @@ static int svs_mt8183_efuse_thermal_parsing(struct svs_platform *svsp)
 		temp0 = (degc_cali * 10 / 2);
 		temp1 = ((10000 * 100000 / 4096 / gain) *
 			 oe + tb_roomt * 10) * 15 / 18;
-
-		if (!o_slope_sign)
-			temp2 = temp1 * 100 / (1534 + o_slope * 10);
-		else
-			temp2 = temp1 * 100 / (1534 - o_slope * 10);
+		temp2 = temp1 * 100 / o_slope;
 
 		svsb->bts = (temp0 + temp2 - 250) * 4 / 10;
 	}
-- 
2.37.3


