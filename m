Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BFE0C4345F
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Apr 2024 18:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PgcnHe1w2hYLC1hQS9sjHFpi4MtTtTupLK8cpmZTYEQ=; b=lGViyImgR8lNuSAbitNgof8v8I
	wkwsCc9J9CXy/GlpOUc4BXphfSNtgtxii4419HJfOXWKXltAZDD5vDVv9ZpHMQ1XpK+9hGVyiN4Wh
	X6TXOI2YJIFqIzmsxobo2Yj8XaDO68xKA0JDh0zWoSrJ+iSH3hL5kEaQ1UnB+J7J4dmDr10NRelVq
	rotsO7cGbs8pdWQnVc/uCJz/4ft8Em2V45alEP/7w3vqn5B9OJbTFBlohzXzVgOEjTYjQBOeGu5aL
	uGEVp/e8S1u8iwXBtj8SR8bF8LYTIpn8EEFXBaOrsKBvXswqZYAlO7Esd47djwa8A5URhFzrlAigx
	mGnqqYlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rw4v4-000000068oB-37pn;
	Sun, 14 Apr 2024 18:49:38 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rw4uS-000000068LI-3HV7;
	Sun, 14 Apr 2024 18:49:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A7803CE09CF;
	Sun, 14 Apr 2024 18:48:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C43DC072AA;
	Sun, 14 Apr 2024 18:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713120537;
	bh=qGfyTvGICPhMHxBZDbcLXXOoOsd+zSSiD1gfuAYE4MY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=niYESIi6e8GXhnX852cWMpeysLlS/4DIaVyqjzXERRtKYeECb5Jr7QwK6QUkQEQDT
	 wWfQunAovcDWR9dPN47cygQXdTSOZDd/XEygWnA/gdVJuyItiJKlTAekWnGASf9bRP
	 w5TpFqQDfgzHZYocMMcSaUi7Rw5DCOg2lYNzUSuvMsx19ZhoaOMJyQoqx+kEd+icqE
	 VjmR4JVp3OvBvtpPSB9XzwM4ZFtKblGCLSAbLTJPoWayQEeBPhs6PPzSUm4Js3xoaD
	 YuYmamA+vBEz0KfK36nN8sq4ITlp4Gmf2c+W6ihX/r9H8f37fIPpMmrH7bSwikhAWF
	 EwNZxVZ0F+ZuQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Sun, 14 Apr 2024 20:47:34 +0200
Subject: [PATCH 09/14] ASoC: SOF: imx8m: Constify snd_sof_dsp_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240414-n-const-ops-var-v1-9-8f53ee5d981c@kernel.org>
References: <20240414-n-const-ops-var-v1-0-8f53ee5d981c@kernel.org>
In-Reply-To: <20240414-n-const-ops-var-v1-0-8f53ee5d981c@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=757; i=krzk@kernel.org;
 h=from:subject:message-id; bh=qGfyTvGICPhMHxBZDbcLXXOoOsd+zSSiD1gfuAYE4MY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmHCTMy020XGfYFIH5zZasAx/0Yq+7kXrHiZidJ
 bs+CZTSp4CJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZhwkzAAKCRDBN2bmhouD
 12/CD/4udUivIHc2GoSjjDdUwGppx+SlrIvBVJeW68W/cXwaOCyKth5jrChyQjpnz6AEj1GAzux
 E+3yBwwZ/tFyTqlcdC/21mYVXHynylQi2YuTXpvuW917Kjqife+XqkWYFWQzqfVq+qAA7n6VYDw
 ypPDRVorC84imXoLpKXK98BDfETTD0w9MuQqSoeQXAydIKI93iZbGmvnT0n5LM7v4ZRja5xG4Wg
 K9F4C4cl+FMVyXUeWpcOK7z7HDKKvZitNkJMPTKGCpSG9toJPBeYhbLde79BwlUU9Atc1CTE63s
 P4h15Vg6BpleEwTxVcn0q66n/f9bylIxMUHb4DA4swKcIFkWEJef0/cGrG2EOlyElSwJEELU68e
 kBsPFg343+A2YgffVnGac5++GYyYqFWtCEdl12nBA4PdhJ7HYdI+6gE7xnZzU51tvxZRbZ1mfSs
 yJcbNWEMOuE0EnA8WOD9pFx0kMshvQ/mcYA6rK5QefP/exy4110uWJxmAs08ySg73umrzc644Ux
 oDeFNOvWXhQaW7NGT/bUeU+hT9/NBglZX1WX8q6PwA0E8DsCCNToy4xtzqqkDei59Vd0Vy8DoMR
 TIS5IoNtOwDMt6OjzIfuJsewT8KRjl3TPKPSw126k5ODK9XvY7DEsUv4eKhjbq85M5qjqFOhyaD
 OnGoBk2dIFXz9yA==
X-Developer-Key: i=krzk@kernel.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240414_114901_407948_64419FCB 
X-CRM114-Status: GOOD (  11.72  )
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

'struct snd_sof_dsp_ops' is not modified by core code, so it can be made
const for increased code safety.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 sound/soc/sof/imx/imx8m.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/imx/imx8m.c b/sound/soc/sof/imx/imx8m.c
index 3e0b88002b4f..4ed415f04345 100644
--- a/sound/soc/sof/imx/imx8m.c
+++ b/sound/soc/sof/imx/imx8m.c
@@ -411,7 +411,7 @@ static int imx8m_dsp_suspend(struct snd_sof_dev *sdev, unsigned int target_state
 }
 
 /* i.MX8 ops */
-static struct snd_sof_dsp_ops sof_imx8m_ops = {
+static const struct snd_sof_dsp_ops sof_imx8m_ops = {
 	/* probe and remove */
 	.probe		= imx8m_probe,
 	.remove		= imx8m_remove,

-- 
2.34.1


