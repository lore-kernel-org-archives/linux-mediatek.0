Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CD90C76196
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Apr 2023 13:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CU2rECyEMJthSMbBkPmB4ARhBI3HTIqLuygygc/BZ9A=; b=pB9+3P2VKjKkzl+h4RtnmnzB1s
	JA+jB/6YBfaCAsgm9L4ihPv0x/L357V9TcyVe/MFGAXbXPMFZNaMqXx5bC/u1BqYsK6pdeYwu+pWe
	FLMqi8bhEukmIl+sHnspgnQeiTVMY7pv/i/ZPz8+Ra1QBskVm9g3T5Y6a1ElBxtPmabTPKMqxOjAx
	c+MFap7L4cqsQoN8xU1Uf3t9eM/qV8J2BbJlaAQ+hK6iYS38uHWNFb6WSKYqP1HeaMP1jLN668TTO
	ZgiyT9cf6mNvSganWEjoKpp5jNgx1mt+uBa8zP8/BIKYXofxDp50xnLqpHFN9IOzkGr4fFMsFfWmH
	+cKgUFbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjKH8-00FSsW-0l;
	Mon, 03 Apr 2023 13:31:10 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjKH1-00FSq9-2W;
	Mon, 03 Apr 2023 13:31:05 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 872C766003B1;
	Mon,  3 Apr 2023 14:31:01 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1680528662;
	bh=++loIoPqiqnGGTd1ang00wuiYVquczoRpePLER4RqUU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gjxT+m2Ah+kCTuvUOY9tjJuw9qCUKk2oRh+J1/+uKe6XFO5z/queg1h3gngEPzyOY
	 wxqfUN2/A39W6wzBb5SWgvsaLoeRPKMxWJ7nDKvOK1oFqb+E4nV53dRkMZkwzfoNid
	 dFFpNnfY66PAQL5yyXSHyZ5H0lE0+TDSJf3/jKj9hWRyxdsvWWyGmInb4aBnupRUKB
	 ZzQ8NPMOsx4exJNAZvtU4Btl6/OXW/S3DzSwbwaSMyKFjZSKvcbw2jdqe9wh4sriz2
	 eoM0krYhN2xgvyCbuFe0nnWSYMksXC0RQr9jPjbIHv6EV4nfiODYpBSBWDKGhF1/7u
	 5t3xEiguxRNPA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: thierry.reding@gmail.com
Cc: u.kleine-koenig@pengutronix.de,
	matthias.bgg@gmail.com,
	weiqing.kong@mediatek.com,
	jitao.shi@mediatek.com,
	linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com,
	wenst@chromium.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>
Subject: [PATCH RESEND 1/2] pwm: mtk-disp: Disable shadow registers before setting backlight values
Date: Mon,  3 Apr 2023 15:30:53 +0200
Message-Id: <20230403133054.319070-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230403133054.319070-1-angelogioacchino.delregno@collabora.com>
References: <20230403133054.319070-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_063103_990850_1CDC2775 
X-CRM114-Status: GOOD (  10.87  )
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

If shadow registers usage is not desired, disable that before performing
any write to CON0/1 registers in the .apply() callback, otherwise we may
lose clkdiv or period/width updates.

Fixes: cd4b45ac449a ("pwm: Add MediaTek MT2701 display PWM driver support")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/pwm/pwm-mtk-disp.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/pwm/pwm-mtk-disp.c b/drivers/pwm/pwm-mtk-disp.c
index 692a06121b28..82b430d881a2 100644
--- a/drivers/pwm/pwm-mtk-disp.c
+++ b/drivers/pwm/pwm-mtk-disp.c
@@ -138,6 +138,19 @@ static int mtk_disp_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	high_width = mul_u64_u64_div_u64(state->duty_cycle, rate, div);
 	value = period | (high_width << PWM_HIGH_WIDTH_SHIFT);
 
+	if (mdp->data->bls_debug && !mdp->data->has_commit) {
+		/*
+		 * For MT2701, disable double buffer before writing register
+		 * and select manual mode and use PWM_PERIOD/PWM_HIGH_WIDTH.
+		 */
+		mtk_disp_pwm_update_bits(mdp, mdp->data->bls_debug,
+					 mdp->data->bls_debug_mask,
+					 mdp->data->bls_debug_mask);
+		mtk_disp_pwm_update_bits(mdp, mdp->data->con0,
+					 mdp->data->con0_sel,
+					 mdp->data->con0_sel);
+	}
+
 	mtk_disp_pwm_update_bits(mdp, mdp->data->con0,
 				 PWM_CLKDIV_MASK,
 				 clk_div << PWM_CLKDIV_SHIFT);
@@ -152,17 +165,6 @@ static int mtk_disp_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 		mtk_disp_pwm_update_bits(mdp, mdp->data->commit,
 					 mdp->data->commit_mask,
 					 0x0);
-	} else {
-		/*
-		 * For MT2701, disable double buffer before writing register
-		 * and select manual mode and use PWM_PERIOD/PWM_HIGH_WIDTH.
-		 */
-		mtk_disp_pwm_update_bits(mdp, mdp->data->bls_debug,
-					 mdp->data->bls_debug_mask,
-					 mdp->data->bls_debug_mask);
-		mtk_disp_pwm_update_bits(mdp, mdp->data->con0,
-					 mdp->data->con0_sel,
-					 mdp->data->con0_sel);
 	}
 
 	mtk_disp_pwm_update_bits(mdp, DISP_PWM_EN, mdp->data->enable_mask,
-- 
2.39.0


