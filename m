Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A2BC47258
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jan 2024 13:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A6p+Ikb+FWnsbZl/wQ+N3du9Q0O1Jo/a4LBjUHzLi8o=; b=qZztE7z3qhsO7osqzMYd8DzBVQ
	FsgSxCqAawrYeZM2NCHqG916CgkbFot+uVB8vp6JnsxgT10lxSIA2JeCtLuLXHdEmDBVjOX3m3l8N
	7yeIocOffufJyHOXyqBhXz4wSBAP4+qonmVBEuMkpio9RbPA/huDbnkOetGAg/RZo40ubJyQCRdKU
	rgrc39hwBtTySDJ66ooS/B4YkYjtxcbPjEAJqy42B0ioL9acnfQrnShLLiyTOsO0fitjqdxdeRzIx
	5H3hJay/SSNZaZs4m6BhAhDmKD0GI1XGVxxOj2Jtgub5/iqxAMc0csrvxr7eh9V3UwCNRKVDE/hRJ
	r6hLVx0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT07a-0000000088E-2Vkk;
	Thu, 25 Jan 2024 13:50:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT07S-0000000084q-3eIA
	for linux-mediatek@bombadil.infradead.org;
	Thu, 25 Jan 2024 13:50:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=A6p+Ikb+FWnsbZl/wQ+N3du9Q0O1Jo/a4LBjUHzLi8o=; b=jtyLVxGo7LNpRMPaO8PEsTe2lW
	0FAH59EfYCUNd5r70Fs+92bqoYpFZgfeo7AV/VCoFuHuy0X1lJ+MJj8dqVTX9dCdWX1ERNDs9fF/F
	LmSO6DZ9gZ+AqBar7egHfHa/ByPazi8XZWv7+cu1GyKW5TjR3A7ACDuGDGKvYbEdaNW7PeuxLiF+o
	zp3URCfnRBiTFPqON+srvmuzbGExLkPbnGc5iOW1b7qNQdLncuh/MUKafl4YLabOZTmWaqUOW4Fha
	WjCd1aX7setwiWpmahBwM2dL5czjpQu/mCZjyJ/FVtMcvn6wqaiiAoUxgttlD2l00yIadvGVJL421
	ImmFhkRA==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rSybQ-00000005HgX-1tqr
	for linux-mediatek@lists.infradead.org;
	Thu, 25 Jan 2024 12:13:07 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rSyZA-0003jN-7m; Thu, 25 Jan 2024 13:10:44 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rSyZ9-002HPy-R6; Thu, 25 Jan 2024 13:10:43 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rSyZ9-007mzR-2N;
	Thu, 25 Jan 2024 13:10:43 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pwm@vger.kernel.org
Cc: kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v5 020/111] pwm: mtk-disp: Make use of pwmchip_parent() macro
Date: Thu, 25 Jan 2024 13:08:42 +0100
Message-ID: <0ebb99812e0d563437d2cdb8d980e89461e28a6d.1706182805.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1706182805.git.u.kleine-koenig@pengutronix.de>
References: <cover.1706182805.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1778; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=2my+KTISTjKr4blFD22AL+yDfNEk1kSQLWB/RlEBkzo=; b=owEBbAGT/pANAwAKAY+A+1h9Ev5OAcsmYgBlsk9RzviGTen8OjNSCvRF2x6ld2MV3ea52eNvR wOwyTtOPAeJATIEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZbJPUQAKCRCPgPtYfRL+ TommB/jA5Z6pZ/uA1Ye/QbFGhQsZEg4kXPITCIu9yH6QU3WHNF+nB93lX9TnTRKgv2PL8CHAxvw Fes6xRHy3yEqA+QBzVQP1rv/cBLA3hLxQeOvzyDxgQBBPSPEGw/KRG8ngkorYRQ0q6n3yk6bzbO vM14u1uKpaTXB0u/qkmY1X3+K9iQbPKcQeQ2NR+4Y7k6vQx8LuTQwfn+gjiPde9G5rRkTEH2dzN p/zMD/bW/DPn9TkUE9ZAKWQvSK59b5iulGBSob1qsb/IbxnaHutm9Nq84pRjts+gEBKgaR74Ajs VgxaS1rKwiBjBLXbkIFmHydOquk/GAZvEAZLSiOzik0hHr4=
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_121304_594312_C467D8B2 
X-CRM114-Status: GOOD (  11.85  )
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

struct pwm_chip::dev is about to change. To not have to touch this
driver in the same commit as struct pwm_chip::dev, use the macro
provided for exactly this purpose.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/pwm/pwm-mtk-disp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pwm/pwm-mtk-disp.c b/drivers/pwm/pwm-mtk-disp.c
index a72f7be36996..186aa5c04435 100644
--- a/drivers/pwm/pwm-mtk-disp.c
+++ b/drivers/pwm/pwm-mtk-disp.c
@@ -91,14 +91,14 @@ static int mtk_disp_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	if (!mdp->enabled) {
 		err = clk_prepare_enable(mdp->clk_main);
 		if (err < 0) {
-			dev_err(chip->dev, "Can't enable mdp->clk_main: %pe\n",
+			dev_err(pwmchip_parent(chip), "Can't enable mdp->clk_main: %pe\n",
 				ERR_PTR(err));
 			return err;
 		}
 
 		err = clk_prepare_enable(mdp->clk_mm);
 		if (err < 0) {
-			dev_err(chip->dev, "Can't enable mdp->clk_mm: %pe\n",
+			dev_err(pwmchip_parent(chip), "Can't enable mdp->clk_mm: %pe\n",
 				ERR_PTR(err));
 			clk_disable_unprepare(mdp->clk_main);
 			return err;
@@ -181,13 +181,13 @@ static int mtk_disp_pwm_get_state(struct pwm_chip *chip,
 
 	err = clk_prepare_enable(mdp->clk_main);
 	if (err < 0) {
-		dev_err(chip->dev, "Can't enable mdp->clk_main: %pe\n", ERR_PTR(err));
+		dev_err(pwmchip_parent(chip), "Can't enable mdp->clk_main: %pe\n", ERR_PTR(err));
 		return err;
 	}
 
 	err = clk_prepare_enable(mdp->clk_mm);
 	if (err < 0) {
-		dev_err(chip->dev, "Can't enable mdp->clk_mm: %pe\n", ERR_PTR(err));
+		dev_err(pwmchip_parent(chip), "Can't enable mdp->clk_mm: %pe\n", ERR_PTR(err));
 		clk_disable_unprepare(mdp->clk_main);
 		return err;
 	}
-- 
2.43.0


