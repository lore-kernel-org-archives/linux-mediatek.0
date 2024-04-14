Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5DCCC4345F
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Apr 2024 18:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rvHz0kxPgjV4uYrpxPGWt5Cmr41dkk+KbbozEhObFFQ=; b=NCIKM9PaRKFyxVjXSLlCSn3Soy
	82+Yu1zumE0n3qiPFsPSD74mn2xYDav854mYEO2b3Lii34NeTL3oYWMSN5JvutqfpzpgFvwVvtJ8M
	pVjgR23M6P2LsHAD1DLNjDiY5upi0wi0yRROHVdgjuEEOsT0po0BmfDJuHrbQGC6FG3PU6DWt+6jR
	VIAQ+r8p8Ec3eJ0GyntvlBrCkVmCKtaakVE9oRxB1yMG6/aiuR5PbTiTAarNdB9NLxkcZJzFBkaeJ
	T1V9S+aPkXQGzY1rvyvF9yGJGzw2XI/tek22ND11lN7h4tv7L4lGnV7GeaA1s5bw11+syVFEqs2cE
	7SX7SEqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rw4u0-0000000684T-0lgm;
	Sun, 14 Apr 2024 18:48:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rw4tb-000000067oa-3AWE;
	Sun, 14 Apr 2024 18:48:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 099B060BA6;
	Sun, 14 Apr 2024 18:48:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BE34C3277B;
	Sun, 14 Apr 2024 18:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713120486;
	bh=hNJ2G+P/dWd7vsgx62FCkrSeDakr9/PbBt3Vb3M9/xA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FVpf9xir32ka5d/mEH6VXlT5ee8iCgICnJbmAdUgBWcLm7X3LdvWgx5Xfdrrns/2t
	 kRWY5cKyrF8ixMQK9czEHrGlEAVs4PpuYhpu+wjPeR2s76Q+EQzfNa4qnIxy+GHSPR
	 EP0F/u6/RrDQ95Hi3+tX4LYTkRv0MguJFrwM9r+VzSXLfzwpgnRIBEpc6zDpAAvjk4
	 ogwDqro+ZLWdXwkWsRTSzL9O1Ccj4iDdpyuA7mpgQGcACax/gkhFoilwgBlyYQ8ZcN
	 r00TNtFjyRJs0B5z7+w432oYrgytmy1/zSTMwk/pHvzVMb+xX62U549xedRuLvmqJt
	 oTHh4uda5Hnxw==
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Sun, 14 Apr 2024 20:47:27 +0200
Subject: [PATCH 02/14] ASoC: SOF: ipc3: Constify local snd_sof_dsp_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240414-n-const-ops-var-v1-2-8f53ee5d981c@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1610; i=krzk@kernel.org;
 h=from:subject:message-id; bh=hNJ2G+P/dWd7vsgx62FCkrSeDakr9/PbBt3Vb3M9/xA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmHCTF3uQbFUD8ajbnGaZCZUG17venUqLmUXEMU
 OHBDYeeKIeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZhwkxQAKCRDBN2bmhouD
 18vwD/9tB/adriOXoYJFXctL1cBnqxA6W/ObflSsngdezLjeiWl9WbN9N6wL6KU3uueyVcx9udc
 3IZ+dc1eh3Gpi/MIF/7tpR0djzZiyevMKsi+op7jsPNhJmmsHM/akaO6y/ygyGcQ+F6Gh5VdnOL
 Ls/2Q4b6yK4DQCINa0+LbL7aDKrCjeWAv9Cc5zyr7nAMoYPiFPdcGOeNvaQBpT+CNA6piHSfguQ
 yuf2svGbeCjGpQjcwi2LupfFV3LYyGoSEc2Y9vUD7ajTht9jdyl9hiTwQugzLRXatsaboI91qXF
 SAcl4tFOSS2L0eaYNQsOJSXvtUnGkWE6u+INoBpRg3HWrWswypcg/XY9thJx0vgNN3Wkde2AR3h
 rEEhsRo/HnFAFULU/pfwNv566/aX2mGEKgdNGY32ylmU7ZfMwfd8Wk9eZyBBs50q8LxRO4+tgci
 pOy2A5uzBijBjPJuiO2mUrkKhEsaL6WoSa3U1WOh6HSOae0L52f9TpYdKWycC57O3GQfC75Mn0Z
 egfNPWqvOtL/ahx5+qssvVfYr/5OWyemSsoE4EHagKJqS/9BNMTXjpLIDT2hI09YBaDIw/7wZJS
 UMH/xzb0GL6UQwPbUOz0A8zdQ1RZnhgVx++SCORD6cIiUGSOoXnoJNolYW4KreKMa7nM+ZXzPUR
 hIRB0ABv4uAv3Kw==
X-Developer-Key: i=krzk@kernel.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240414_114808_159290_3CC63A63 
X-CRM114-Status: UNSURE (   9.84  )
X-CRM114-Notice: Please train this message.
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
 sound/soc/sof/ipc3-priv.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/ipc3-priv.h b/sound/soc/sof/ipc3-priv.h
index 0bbca418e67e..9cd7794f3cb6 100644
--- a/sound/soc/sof/ipc3-priv.h
+++ b/sound/soc/sof/ipc3-priv.h
@@ -36,7 +36,7 @@ static inline int sof_dtrace_host_init(struct snd_sof_dev *sdev,
 				       struct snd_dma_buffer *dmatb,
 				       struct sof_ipc_dma_trace_params_ext *dtrace_params)
 {
-	struct snd_sof_dsp_ops *dsp_ops = sdev->pdata->desc->ops;
+	const struct snd_sof_dsp_ops *dsp_ops = sdev->pdata->desc->ops;
 
 	if (dsp_ops->trace_init)
 		return dsp_ops->trace_init(sdev, dmatb, dtrace_params);
@@ -46,7 +46,7 @@ static inline int sof_dtrace_host_init(struct snd_sof_dev *sdev,
 
 static inline int sof_dtrace_host_release(struct snd_sof_dev *sdev)
 {
-	struct snd_sof_dsp_ops *dsp_ops = sdev->pdata->desc->ops;
+	const struct snd_sof_dsp_ops *dsp_ops = sdev->pdata->desc->ops;
 
 	if (dsp_ops->trace_release)
 		return dsp_ops->trace_release(sdev);
@@ -56,7 +56,7 @@ static inline int sof_dtrace_host_release(struct snd_sof_dev *sdev)
 
 static inline int sof_dtrace_host_trigger(struct snd_sof_dev *sdev, int cmd)
 {
-	struct snd_sof_dsp_ops *dsp_ops = sdev->pdata->desc->ops;
+	const struct snd_sof_dsp_ops *dsp_ops = sdev->pdata->desc->ops;
 
 	if (dsp_ops->trace_trigger)
 		return dsp_ops->trace_trigger(sdev, cmd);

-- 
2.34.1


