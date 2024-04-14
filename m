Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09956C4345F
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Apr 2024 18:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hpxzCpTVHzOUUyydX04PKEVYFO1qqvlYWk+TsgS5PLI=; b=ekU0DZ2snwb+oTsRIDeD7hdgGr
	bWkorgBdf5BhwxolYu152XCgxFYLMSwUCT2W3ClPpgkZTTFyB7+ybQ9/ZnJc6z4JnzPsgY5WfDdgO
	Lu/JIH8SqqJDI2GREp/jx+Jl01zQMj1Frlc/jzbbiFBCnkpjEiTPDIbpePUZYaquuDh3IYNb7kw3T
	E8d2YNUZybcIY4zuI20hWg6wpAO+IbK7McszRCDQtCk3Fm74vtGI4c/XC+kt2ABkseoQmV2cYoEHb
	P3VCTGY1G7LMLeKj0Dgru2PsEnhA/lQIysuVQgb672TMm15odwJytOZZ0I7aD7QpkFzQf8pOv2UWl
	E4QN/ViA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rw4uB-000000068BC-1rGp;
	Sun, 14 Apr 2024 18:48:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rw4ti-000000067ty-2hwp;
	Sun, 14 Apr 2024 18:48:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0320D60B94;
	Sun, 14 Apr 2024 18:48:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58BBAC072AA;
	Sun, 14 Apr 2024 18:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713120493;
	bh=qX/0RDSf7YaTrXlR3yi+NM6JRFpDm9GRxz4kt0d2t/o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dxhOPQc4X+cr4iX+wwKbi3v6HQJxq2imjwbnx1ozYjmW4ODcufGIAMXn2ZqPkfSn+
	 vV/7Imh+C+AdaMyty0blhQwDdL1WxP0rphby1DOml+fBXn1CWoWPBC+wRc1l+ZEJ+R
	 7C6UsF4zaZRo6RaXzu/8Xn3bCj6obaIEMsU94aVcVbcpFs7ngWNvd94B84VHHhEJBj
	 k9PqJH1Z7Kg5kesFv0hFLq1JprWLdncLNeAa0lT+Uar1Of5DTK3QyHUQnkPyjNvkCQ
	 KCXmr2pnpSRy4RceS4JkBQd/i9zk31k2Uk0dIt5idCF4Cf1sqza8nJzF5JWbJQClIu
	 oibqORGAcOafw==
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Sun, 14 Apr 2024 20:47:28 +0200
Subject: [PATCH 03/14] ASoC: SOF: pcm: Constify local snd_sof_dsp_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240414-n-const-ops-var-v1-3-8f53ee5d981c@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=884; i=krzk@kernel.org;
 h=from:subject:message-id; bh=qX/0RDSf7YaTrXlR3yi+NM6JRFpDm9GRxz4kt0d2t/o=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmHCTGuPhjtUfqWw7zvnjQ9BTn1c7afI+sEeIPY
 zXYln1O9qiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZhwkxgAKCRDBN2bmhouD
 17DREACMNQ0UTBMAHCLTz3wUYbBgS5RulwxroGsHqbC9N7LT98ZmJZPFh8uZ8zwatkOLU+8Qbf2
 v3SKTqcaeT5pc4OrcMf63/GtyIoj76HXMJaOYHKnLZmadFKvtcyk0TqNim69aJNYQXbpNYWEgm9
 df97UPfmfOTjEGmbbysu08KnLNNdPfMYDcOPxatTcNUav98K5pqFV3hGciN6PnyZG5YuLnFxzQw
 EIH0G1IEPzYxCv/zp2B0ZzVqvWQbS2+lrYtJliZxTe8JbiQXrZPVJBhyujV098/hswnMHz88ExN
 880eytk6TYY/Hb2H4yVZuQqFlJhvNj5sWVZYYTK/BpB7BYxn3JibO+16v8uQXxnJugjqqO+z/sl
 YYKMe5KuBSet9/Hj+zv3JuVpdo9PNKpmQsLRildT0s8vQwjYVIMnCyZBrCZezBMLviL7o+AP1E5
 r/26k5foQyya/Asx0T4bOIuxAkK0jL+uwS4+IJTthgS+PzanmoAJcQy1ubtnNkUFp5HPJPuht3B
 kwfLFYywB9B8TeHl79biKDY+ldbQIqlLvO+ooNBMQX3ubXsevEdK02qRhozY68jxych65Dr5WVC
 K0MFbw0Yxx0d/Xjmjgf0Q40SwPHY0c6jhfGkpWsLXlpxaf25Bp0m6loJK3xuwXXIfBvvTQovbZP
 NJfISERE7NMVYhA==
X-Developer-Key: i=krzk@kernel.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240414_114815_112364_9D92CA3D 
X-CRM114-Status: GOOD (  10.42  )
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

Constify the pointer to 'struct snd_sof_dsp_ops' to annotate that
functioon does not modify pointed data.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 sound/soc/sof/pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 8fca4b0d63de..cb774e011e31 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -423,7 +423,7 @@ static int sof_pcm_open(struct snd_soc_component *component,
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
-	struct snd_sof_dsp_ops *ops = sof_ops(sdev);
+	const struct snd_sof_dsp_ops *ops = sof_ops(sdev);
 	struct snd_sof_pcm *spcm;
 	struct snd_soc_tplg_stream_caps *caps;
 	int ret;

-- 
2.34.1


