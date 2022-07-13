Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B20FDC43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jul 2022 11:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4mGpmY4MkkVjHm+bWt3gaXUm0x8BB83BcoKT8UY9fBM=; b=V+kL0R2AsOm+kOedkQrpDisCMw
	jwrLUcJ3ABlepJJQfK6F1woQnun/iqCtsiVWjV+ciW39Mzg2QPUiTjKVfR70C/sL59Y2p6LaXu5HY
	n/GPBOE7C398ttCuB1/6/4839+D3wW+lBAD36jdsFeprhKiR25ZjFKeLWNKlKaj9q0v0GOi3MqG/e
	IPUwLnqqsx7L21dxQnmrLCpy6nP//7/KohNGyLLIaZrL9m4Dz20+VJVPMhvDMFUQo6Lf7h86Qc1h2
	gDX9M2Dcm8u3Ea/+mWeTkihwKNQ4hTOzsMSKvJAnb/jJahxaNOaaMkJnkU7L9ojc/gZpwFb/EyazT
	HsYTR/Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBaNj-00328F-Sn; Wed, 13 Jul 2022 11:18:15 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBaL2-0030KZ-MK; Wed, 13 Jul 2022 11:15:30 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DDE1D66019C5;
	Wed, 13 Jul 2022 12:15:16 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1657710917;
	bh=B3pFqcpJL4uwSDHR2Pb8ZpJXQWecgKAmffWdGwqPWmw=;
	h=From:To:Cc:Subject:Date:From;
	b=i+41z0e13diW6eFHtsCimC6PSbECS2XIIbU2wvuzy/1wbayHdEOfKVgNWd2oNg0qj
	 qv2v4xUtxiienjybifjfLlGfLhdWHJOrvSk8vgNeMUiQhbEBWxpyCXxu3H5KtSha9T
	 fPZp4YHYxxME11uwfIcrzdYRPmoutuQ/wZk3lhmUOynLZyQMhxMVJiJa2srXcbD0Jv
	 LglwMPdn195bx+c3Mzae9vS7RsNSrddsBlQJXJs+F+yATDaQFpkFB9Av393nSQ89GS
	 eTQMZvUZGbyN/zqFHhxoTca0FDqgBesefKUifU3hKJtAvU+gAbLchho3UAcqA64S/N
	 z+DU3NNXVLobA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: myungjoo.ham@samsung.com
Cc: kyungmin.park@samsung.com,
	cw00.choi@samsung.com,
	matthias.bgg@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	jia-wei.chang@mediatek.com,
	johnson.wang@mediatek.com,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] PM / devfreq: mtk-cci: Handle sram regulator probe deferral
Date: Wed, 13 Jul 2022 13:15:11 +0200
Message-Id: <20220713111511.115007-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_041529_003657_86436F5D 
X-CRM114-Status: GOOD (  11.37  )
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

If the regulator_get_optional()	call for the SRAM regulator returns
a probe deferral, we must bail out and retry probing later: failing
to do this will	produce	unstabilities on platforms requiring the
handling for this regulator.

Fixes: b615b00c42da ("PM / devfreq: mediatek: Introduce MediaTek CCI devfreq driver")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/devfreq/mtk-cci-devfreq.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/devfreq/mtk-cci-devfreq.c b/drivers/devfreq/mtk-cci-devfreq.c
index 71abb3fbd042..e5458ada5197 100644
--- a/drivers/devfreq/mtk-cci-devfreq.c
+++ b/drivers/devfreq/mtk-cci-devfreq.c
@@ -291,9 +291,13 @@ static int mtk_ccifreq_probe(struct platform_device *pdev)
 	}
 
 	drv->sram_reg = devm_regulator_get_optional(dev, "sram");
-	if (IS_ERR(drv->sram_reg))
+	if (IS_ERR(drv->sram_reg)) {
+		ret = PTR_ERR(drv->sram_reg);
+		if (ret == -EPROBE_DEFER)
+			goto out_free_resources;
+
 		drv->sram_reg = NULL;
-	else {
+	} else {
 		ret = regulator_enable(drv->sram_reg);
 		if (ret) {
 			dev_err(dev, "failed to enable sram regulator\n");
-- 
2.35.1


