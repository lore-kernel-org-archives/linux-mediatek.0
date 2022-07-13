Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 074DDCCA479
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jul 2022 11:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3RMzsF5N/lzfi6ERfS7Qwvrz694jHMUn2cSr77/YNAk=; b=S3LaFnvy2dawGGaTlb2NV5JdjV
	FeHUsY3ud/pxrblEw60yvScxrM10l9HWa2sAWRpxAbHlGrWfEmSVgh2ZOOlQhlGHqBAuYDaOHVTbY
	uDAIvZ1n2n0dImlE+e6qd+UlN/W0x4WXw05qz4SbZ2mFK92eoCllMklPFxTZBM6S0zMgUGE9sB3UF
	TogYXV1XRIMxHWicWFyDesKjS9ji0+AqaClEqnXEsVpURUtUJDaptdAAYg+eoaQACO86y4Fneg5kQ
	vLdAKRAewg8Idjg7bgx3Jq+0aEWgNLsERxO90aCn1qbJo9ZC3TSZkJC+vcDgM+quuSg14V/anfku4
	VFvYSNVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBaNv-0032EA-HZ; Wed, 13 Jul 2022 11:18:27 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBaLM-0030cI-0F; Wed, 13 Jul 2022 11:15:49 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 85C0C66015AE;
	Wed, 13 Jul 2022 12:15:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1657710944;
	bh=he62TNO8XhfyzG98GzZOCha5TyM78B31K/Jr/Qt68kI=;
	h=From:To:Cc:Subject:Date:From;
	b=HyVpqpitt+9SP9MGnE9dBIeE1RmtbmliD1qYbJ8mpfhAhmubKxRw7b0LkxBwdcRYU
	 aqs/grOUGGtnLCjBIEZVYSB40GrtfCFOu2u6K+GsNsdVN+ERco8WLbHCHIXVHn3NFo
	 VeYI35zsVDzkPudMYLNTTOq/EHG25AGJR8GvkWpxj4ZNizpO2+VXNTAg9P79gB8X8p
	 fc6qJDEkjDCvT7KxKCW5GYPIxSDL/i5oRM5ymltOlVlIxTn8M4Dq9kSB8lCEGgQrDO
	 w2yy1QOKl38cXNRRimqK2CkhRz1F9gE1xfDZm3bMfbgcF3RtMOcPIYZ7wbBcu5uSIf
	 rjoJHB3qAq5Pw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: rafael@kernel.org
Cc: viresh.kumar@linaro.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	rex-bc.chen@mediatek.com,
	jia-wei.chang@mediatek.com,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] cpufreq: mediatek: Handle sram regulator probe deferral
Date: Wed, 13 Jul 2022 13:15:36 +0200
Message-Id: <20220713111536.115097-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_041548_205108_DF1C8B57 
X-CRM114-Status: GOOD (  10.92  )
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

If the regulator_get_optional() call for the SRAM regulator returns
a probe deferral, we must bail out and retry probing later: failing
to do this will produce unstabilities on platforms requiring the
handling for this regulator.

Fixes: ffa7bdf7f344 ("cpufreq: mediatek: Make sram regulator optional")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/cpufreq/mediatek-cpufreq.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index 3a2be4552020..7f2680bc9a0f 100644
--- a/drivers/cpufreq/mediatek-cpufreq.c
+++ b/drivers/cpufreq/mediatek-cpufreq.c
@@ -439,9 +439,13 @@ static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
 
 	/* Both presence and absence of sram regulator are valid cases. */
 	info->sram_reg = regulator_get_optional(cpu_dev, "sram");
-	if (IS_ERR(info->sram_reg))
+	if (IS_ERR(info->sram_reg)) {
+		ret = PTR_ERR(info->sram_reg);
+		if (ret == -EPROBE_DEFER)
+			goto out_free_resources;
+
 		info->sram_reg = NULL;
-	else {
+	} else {
 		ret = regulator_enable(info->sram_reg);
 		if (ret) {
 			dev_warn(cpu_dev, "cpu%d: failed to enable vsram\n", cpu);
-- 
2.35.1


