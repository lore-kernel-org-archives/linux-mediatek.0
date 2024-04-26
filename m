Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDEFCC4345F
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Apr 2024 09:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jwSH9duyCw3I6txLh40zyi5K1tzIoI14S+RcsVbAReI=; b=ThQcmE0TEMbf7RdBTEkIZ1S1rx
	gMntVinYgbL3YoXIt2Xt1AagVQNIFXvzfzkD4J4Xk/rwTk/XBpA1BVsi/N/c6ScxipMhIzGAcI07F
	HNK2/9tRzx19eb7Xa+5AGXescC/vyzZe6gNTFLMHYSU35RnEzyEeAm9ZldgH4zQP6O362P4QMoiCS
	E9tqtsme0EkZInb/47v631ZyvtUS5wR77kadJbqpcGECN2PeoRXqK6cAxS0BS/nhmTiEhRLqGbYMK
	M1SHq2v9ORWRutNVHQF8JBCxdCWBTQFtG8F/16KJn2COT8fdeV2dFEk4NZdt26hkx3saONdSMzLj4
	YKMOhXqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0HWm-0000000Boxo-1Pym;
	Fri, 26 Apr 2024 09:05:56 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0HWU-0000000BokX-2F1B;
	Fri, 26 Apr 2024 09:05:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 689B5CE19D3;
	Fri, 26 Apr 2024 09:05:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28C4AC32782;
	Fri, 26 Apr 2024 09:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714122335;
	bh=vC0dygQsKcoCwXU125Mo6e+qkHR3/M16HFNlEdMw+P4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XBD7tMPyyNheLa+gN8swvqjZ2Jamzylsq3bPnkP8QWH4sEa2ZluU5OEYNIgTn7TX9
	 1wZghFudVMbjYC2M+1hQO3kAOFUWSbZmv5QdBLvWVamtJH8zxylLKwfBmf0uh6Igyu
	 qJ8ceweXIcc+grjG/Asy7J1FfRaiECG+8MMTc9gTF1TG19hEW8uNMoPBOYx26WWJNY
	 y9xYg9+KNsWknviiPYU8V08+QtZTraEJSJvNFUU+pYakh1aoyJLIQowhNgKE6cYBXf
	 u4aygH1nTXekpDsnQhrSoR+8tJZhRd0xc8QqsDXIyr86rZj7iYTAromCL+P2QTk4DK
	 bv73PmIjclptg==
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 26 Apr 2024 11:03:52 +0200
Subject: [PATCH v2 05/14] ASoC: SOF: intel: pci-tng: Constify
 snd_sof_dsp_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240426-n-const-ops-var-v2-5-e553fe67ae82@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1290; i=krzk@kernel.org;
 h=from:subject:message-id; bh=vC0dygQsKcoCwXU125Mo6e+qkHR3/M16HFNlEdMw+P4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmK24jccjXN7HDS7Umt5KJRsyE/HRoZADSrvXMD
 GTqaTI+0zCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZituIwAKCRDBN2bmhouD
 1/C2D/9/426s0WEhntopd8uoye52oKJ7JLw+XRKKjdBKQ6Q+gAlvGbx0CNaB6D+G/aFFOnYhlXW
 IOuxOZpAjB/JotGGK7cSOmkm1x7OVuUBERjIIX3X71w+MC0p445sFNqQQPPFxwCwc8JjTnFqsej
 MUfu7oh0kvbLlQV9tNz29JmQtmGebta8rxPYZstqtC8uOjlRc4ShuDTrLfFyuowyaecRDVxx4+t
 KBRCYnkOukaWH0XcEkhn5wfJm2b46+c9N9cOjkF+iHYJh2iId1ylUhffh78Jj1Kc8DMMLKbrzcQ
 GVZXWObaba9GYu5T9Xju5bvOFzCMZj+zj1KNTHbz8fkaAVZkjdiUTdsZJFQOgJZatKmprwdPz1P
 Nq/BSi+UKcNMLxOfnbpHzZBk2S+CvCdDnHbugd6+UeM8kbjtC1iXK+0ZWtWJtshzLiP4dooOgtV
 M8QOi1E+tCQbOYWUqkt1M5Qo11o4fFVA4w40qPUoYgVd+2nsQMLWeuz4RPxkJG96P3qJRAWiXk0
 BJY1suCg//gX/q32GBbe+HxSzDKhNmGWYGY5cqcxOHLKVe4Bhf18Kzlv/sr2X2IiYb6rLBZaU4I
 k45xHMPQVIgFwqZ4WKs+wf6gxs7PwHUGsJpjYjJNpfZ2bpbPrphAX5kmNC/hDQLIbFvIo6vHksA
 Gay0iMeShk99ryg==
X-Developer-Key: i=krzk@kernel.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_020539_118617_85E18ADA 
X-CRM114-Status: GOOD (  12.49  )
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
 sound/soc/sof/intel/pci-tng.c | 2 +-
 sound/soc/sof/intel/shim.h    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/pci-tng.c b/sound/soc/sof/intel/pci-tng.c
index c90173003c2b..d8a36d5a29f7 100644
--- a/sound/soc/sof/intel/pci-tng.c
+++ b/sound/soc/sof/intel/pci-tng.c
@@ -132,7 +132,7 @@ static int tangier_pci_probe(struct snd_sof_dev *sdev)
 	return ret;
 }
 
-struct snd_sof_dsp_ops sof_tng_ops = {
+const struct snd_sof_dsp_ops sof_tng_ops = {
 	/* device init */
 	.probe		= tangier_pci_probe,
 
diff --git a/sound/soc/sof/intel/shim.h b/sound/soc/sof/intel/shim.h
index 9515d753c816..18ce3d33fa80 100644
--- a/sound/soc/sof/intel/shim.h
+++ b/sound/soc/sof/intel/shim.h
@@ -196,7 +196,7 @@ struct sof_intel_dsp_desc {
 	int (*cl_init)(struct snd_sof_dev *sdev, int stream_tag, bool imr_boot);
 };
 
-extern struct snd_sof_dsp_ops sof_tng_ops;
+extern const struct snd_sof_dsp_ops sof_tng_ops;
 
 extern const struct sof_intel_dsp_desc tng_chip_info;
 

-- 
2.43.0


