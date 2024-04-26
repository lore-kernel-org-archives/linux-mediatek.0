Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EADFC4345F
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Apr 2024 09:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hIzWefLiX2ZwdGF1WwhrNHAAaLHWq256cV5LDwIlRGI=; b=sZxJXawNQWVZTmvjS0Mg9yNoIK
	df3C3TC33Bgp15gx3lEXa/3UXxGCc+R+bypY3BTmroYhxln3p/O9o/bwMARzsI+YKMsWPCsPCrFY+
	qU+7CQJ+s8zjRcUDjWLXuQ21ICeN1P1a06IJv2eoPpLYwp3wFHczdHSvz3wtM2Ry50fokHJBTwaWp
	NQLVtcpV1EhssmksO7vwLebP/Hzf4Q/2C1SbE6ZUDOdO5CaQlaN165FKwKCXUd0Ct39dvhRuXV42Y
	CRhgvfjUM3aaq0mbdUhwJpKhhea41PuNdsrmqfD/i0xXOzGdrYhSdaEfJ5bork4/ph+fEJEOrKTrk
	4sjgbMBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0HXy-0000000Bpeh-0WSw;
	Fri, 26 Apr 2024 09:07:10 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0HX9-0000000Bp9x-3ZVb;
	Fri, 26 Apr 2024 09:06:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 453D1CE1BF7;
	Fri, 26 Apr 2024 09:06:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 026FDC113CE;
	Fri, 26 Apr 2024 09:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714122376;
	bh=eJDuVWi+jYCBaLC3ORH57MWQfQKGUmZnVJ/O4TqSGNA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Z8CuFujtfOSPE3PZwFJJJ0wGgk/jW/SeyyhWXkZL5uIG+UqDKBTIN1LgQMmbvtzhW
	 AU45KNvTx3PhKBk2CPUs+qx/Wn3ftMNf5K2Ng6HIgI7UT8dVutBYL0Wows5bkpR8JO
	 sJxGP9nXkUruP5FCvjF1KYvzNN9L5VFaSoIurw8AqYZUlAlkLqkrqFE4OFdlIHBHNS
	 3CL7RY5G8huMxIgHIk/ZsCuWEyCHB8jZXv04wNJybGi8ed6+6R4ctapyFL1PrnY8CE
	 YXgY+u/Ke8JUAIUC7VG/1beiu9Ve1udYG09eiuhprYY1Pm+rbJV5cGwMg+Q6cGkdU3
	 InsIhnlgFuZrg==
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 26 Apr 2024 11:03:58 +0200
Subject: [PATCH v2 11/14] ASoC: SOF: intel: bdw: Constify snd_sof_dsp_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240426-n-const-ops-var-v2-11-e553fe67ae82@kernel.org>
References: <20240426-n-const-ops-var-v2-0-e553fe67ae82@kernel.org>
In-Reply-To: <20240426-n-const-ops-var-v2-0-e553fe67ae82@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=771; i=krzk@kernel.org;
 h=from:subject:message-id; bh=eJDuVWi+jYCBaLC3ORH57MWQfQKGUmZnVJ/O4TqSGNA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmK24o9lkdl0D+KPxdSHnWLzWtJkJA6J7OqHrZX
 IiU4DplLEiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZituKAAKCRDBN2bmhouD
 16etD/9M9dSqAhJ0GkZ0uhTTUqcf5H/6EGraubd4ECuT/gVSj0r7R/Ft96l7+a1zxvQq7FZ9BN2
 2glALHBkYT5fH054mSanWWlGdixZOna/K2z5lCx58Ue+1rQD6c4m3xYgpCe0liS25NkcjqXwREL
 i2Kjc2ZiPz+qNFcaVW2h4Ahr/qS9A+1oYW9hghXhtZ8tsMdtZtaI3oByrTXnbz+s3CC5UA4HG/u
 dz/X5kVe0SSURufYHWoVULxYK3IJUL/AAqc84+0DN/TZZwkkoAdCVf8vQ13EQBaBz0jM+B04Tbt
 JAMuOGog1TztG4Gp06HgfLC2aB5kWieq9joJ3nBaMBikabLtkwk/xHH5GwTwrkTqJLJT2b9QMVR
 gqsGxx9+q/veY6LxeNdIqzdvk8ocpWsIpXWSehvOeMdH5z4Vq/bdLSxay4ah8cpaZSwWCyFKkFF
 3r398OngrAxgGEeEHEcyNqLGKROXdmlC4lu/y+emFEeir9P6iKzd8zKiB2CjNmAkJrovQjuT/sC
 8leguLCUQjehZ4G62cCYUPrGvHhGduVYp5TkEe1nwpX9LD+QLbzQz+4VNhjJYbibuedvq2Hr2X0
 Mem+jmArK7uyvmQPFariCvmraet9tCpyv6cSSEtfsntbnkwypEpvru9sv2HOgKBbJjrKKlSxhE8
 IZnyFt1IlRL3Lgw==
X-Developer-Key: i=krzk@kernel.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_020620_373822_D4D6137C 
X-CRM114-Status: GOOD (  11.56  )
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

Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 sound/soc/sof/intel/bdw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/bdw.c b/sound/soc/sof/intel/bdw.c
index e30ca086f3f8..2e8926cd00f6 100644
--- a/sound/soc/sof/intel/bdw.c
+++ b/sound/soc/sof/intel/bdw.c
@@ -567,7 +567,7 @@ static struct snd_soc_dai_driver bdw_dai[] = {
 };
 
 /* broadwell ops */
-static struct snd_sof_dsp_ops sof_bdw_ops = {
+static const struct snd_sof_dsp_ops sof_bdw_ops = {
 	/*Device init */
 	.probe          = bdw_probe,
 

-- 
2.43.0


