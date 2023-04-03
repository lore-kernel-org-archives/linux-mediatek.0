Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 565CCC761A6
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Apr 2023 13:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fC2SQukrdlRH4bXEEK9Gukshi7+NUmqYTaSoVo70VIo=; b=qXd1LOkeTMdkEMBr+QOpv8CAcH
	f/tAwRIhCgKoV2BSMDfvwZp3MWygiuRmlB0wC+tEV+wTe+OuAcLknpWOohI4e2egpHVNLdi6nRktt
	6xtOYQi0eU3fd/Uu/iF8xNSJmQTk4Aj5T1f9Il0uYmeED0kcyMtMRdVC3be1HI7Qpf8AU07LNBLjC
	l4VbkqxSI+qcPHyJwxfrTsyeXZJjFpoHpr50DsrBIM2PrfkH62k1jhvtWyx/eWH1i20YjcHZiSwgJ
	6lUfl0IEewZ0Z4Ux3Yl6pbS8NM1wqdZJvgrPsT1ogyq3ff7mAMJimiUcXKdekbjlm3/yPnnT5WOgS
	jE2B229Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjKHA-00FSuH-1I;
	Mon, 03 Apr 2023 13:31:12 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjKH2-00FSqF-0X;
	Mon, 03 Apr 2023 13:31:06 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5A7C366015A6;
	Mon,  3 Apr 2023 14:31:02 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1680528663;
	bh=M00de/+bvoV9U86ljAmvP+igaGDFeCArUsyDx0C6F+Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k7yAan3K0CvLHCCUoEPCyRmus7Fc9pRo4GyMmVBdbpeb3L4kuTYptEnkefa8tgIYA
	 P18G/pJctn9O5hRkf1aH2hIID0wvQ3md6HcHxbOdWv9JsYhUH4FDG1LNaYUQO00uuP
	 UbU+PdeDCMA/2tVaW2V3/LdDKX3hEIE7p+5udl7gESo3osN7b6YhlOYnWAlyOwjYqK
	 9ubgtWCluN/hKI33Jls+JC3MqgAxbYEd05VwmCS8xP9PtfT6cq0Vvz98hwwXcl2riB
	 I90uGqGdosWbxeKVg2V+MoAn9v3EsQ29ENkBMKY1ZL5uFKnInnBIz1JtB0gdNkrwGj
	 eqiBI3C+bpvEw==
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
Subject: [PATCH RESEND 2/2] pwm: mtk-disp: Configure double buffering before reading in .get_state()
Date: Mon,  3 Apr 2023 15:30:54 +0200
Message-Id: <20230403133054.319070-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230403133054.319070-1-angelogioacchino.delregno@collabora.com>
References: <20230403133054.319070-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_063104_335258_DA4779A9 
X-CRM114-Status: GOOD (  16.23  )
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

The DISP_PWM controller's default behavior is to always use register
double buffering: all reads/writes are then performed on shadow
registers instead of working registers and this becomes an issue
in case our chosen configuration in Linux is different from the
default (or from the one that was pre-applied by the bootloader).

An example of broken behavior is when the controller is configured
to use shadow registers, but this driver wants to configure it
otherwise: what happens is that the .get_state() callback is called
right after registering the pwmchip and checks whether the PWM is
enabled by reading the DISP_PWM_EN register;
At this point, if shadow registers are enabled but their content
was not committed before booting Linux, we are *not* reading the
current PWM enablement status, leading to the kernel knowing that
the hardware is actually enabled when, in reality, it's not.

The aforementioned issue emerged since this driver was fixed with
commit 0b5ef3429d8f ("pwm: mtk-disp: Fix the parameters calculated
by the enabled flag of disp_pwm") making it to read the enablement
status from the right register.

Configure the controller in the .get_state() callback to avoid
this desync issue and get the backlight properly working again.

Fixes: 3f2b16734914 ("pwm: mtk-disp: Implement atomic API .get_state()")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/pwm/pwm-mtk-disp.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/pwm/pwm-mtk-disp.c b/drivers/pwm/pwm-mtk-disp.c
index 82b430d881a2..fe9593f968ee 100644
--- a/drivers/pwm/pwm-mtk-disp.c
+++ b/drivers/pwm/pwm-mtk-disp.c
@@ -196,6 +196,16 @@ static int mtk_disp_pwm_get_state(struct pwm_chip *chip,
 		return err;
 	}
 
+	/*
+	 * Apply DISP_PWM_DEBUG settings to choose whether to enable or disable
+	 * registers double buffer and manual commit to working register before
+	 * performing any read/write operation
+	 */
+	if (mdp->data->bls_debug)
+		mtk_disp_pwm_update_bits(mdp, mdp->data->bls_debug,
+					 mdp->data->bls_debug_mask,
+					 mdp->data->bls_debug_mask);
+
 	rate = clk_get_rate(mdp->clk_main);
 	con0 = readl(mdp->base + mdp->data->con0);
 	con1 = readl(mdp->base + mdp->data->con1);
-- 
2.39.0


