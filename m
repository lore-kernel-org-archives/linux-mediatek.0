Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD0EBC4345F
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Apr 2024 09:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jqOnOVcQ1VQv2uN0g2XWIg4pk7Bl59XG/VYIpaiU/Yo=; b=1FmWJcafRdq+G3ZWxI41L/pqFt
	XSVpSXVW5Y0sb3TvCbCvbgwXlBkmgYwOu9I6lERBQpR8Wy5wPPbRAf1TzPAO7b0NQbtabt9/AWVPW
	kovgt77vGYA43FStAYKLckSZ3chxGf+FM+Dbi8uW2AgsmIAfSmR6/oWctaEWIVhWP/o5jWgSQMWed
	Fzo2T/RXmpoqXXYafoYne70/gOA3DDg9Z5UYzGuaex6cuCRxzZ6ZtdOwE10ZpzuguhteSHliGV2A/
	a3uDjb5coDgJauzVt7GLJ/+CaPUZ0lFFL2Asir0/kX+N3ssoDbzqmY9oTu1rTAJWU+jkMKe62nlxa
	X/2E8Hzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0HWH-0000000Boeg-1R59;
	Fri, 26 Apr 2024 09:05:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0HW3-0000000BoVS-2VBV;
	Fri, 26 Apr 2024 09:05:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 01AED6200B;
	Fri, 26 Apr 2024 09:05:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 697AFC2BD11;
	Fri, 26 Apr 2024 09:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714122310;
	bh=kMKFC78mUGsx7b4RHA9dgG2P9NgMyAE/GAkkgSE6250=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oIPZ6uWA+7TAMJi5kEuM/QMn5Xj7GZcVcS4jfZUyrybC3B5RUkm0r41Y94kj2UlKe
	 NCauoMyJ99LhvzuqUSRvbw3EjpSleAl9VtS2G1/4TrpQ96F2hopqotiX/Ekrc8jvmR
	 bFJ9VmS275AJqTTCF6MhieA5S+J32U0Wm5MDDSq5UEP81eikF7gudnaK86bj3rt3+b
	 kCupQ7GYzmDzFMQO8X4XqE+k0Fs+XDLwE1qiD1Qe6jXbfoMtdcqMHZtxj51+5BtBYm
	 q7sV5zYA4RpFkxuFNCQBMvenhIoxEOF/ClIMeZn2PMMx7AICAmTKkEhl/dsvoKrkfu
	 /ohdvwW3vwARg==
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 26 Apr 2024 11:03:49 +0200
Subject: [PATCH v2 02/14] ASoC: SOF: ipc3: Constify local snd_sof_dsp_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240426-n-const-ops-var-v2-2-e553fe67ae82@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1682; i=krzk@kernel.org;
 h=from:subject:message-id; bh=kMKFC78mUGsx7b4RHA9dgG2P9NgMyAE/GAkkgSE6250=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmK24gEkNhUhWWsVLmkCo5awt/BmsQBJfrhkCY9
 PLPy73pbimJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZituIAAKCRDBN2bmhouD
 17EzD/9EYcZQxibgKh8DZYlhMIakLJyrdMkfUJ1Xh20O3OImR+/jABppKN4idGJ9tC+Eg2KLf/5
 gZHfQ6chMJMrkoHDuJgTvUfA0MSrNRYAml3SRrR9NZ/d/k2fJzUihUBSE6gzNuk1W/O/b1CVUIF
 56tPqCL5GfMnSmAiML88KaUn8w25LrBR+0FhrhtaWkVp3IbJai/BrbGoqn/x2+oaUyEFUyFPW12
 H4d8iLSwnY4BD5TF1bjz9m89O0DU4fnmd4ZXGPUUwZKqi7+8ndp0McjvFdkQWHtk1HlWFGn/NJK
 zwwq3sdDoz1PUmH2QDwd2og6WNyPlhgteWMwzuJSM/E7PZENLIJmPWiEsgS/76f9twTZ1FXikyf
 CG3wIS7oDgkqPqKtnoREkS26u2d4c9jr6lumZ/YlxxyP4HWt47Tw/3zNkDeja/NkZfbx99fLsNg
 l1pjvn337YhGH/qv60QcyMdeox5bJIvdL5tQXCnrVp3YT9tUddClpvy/Hv9K7MS0jfwx7QeDi5s
 NdamksfVQEgvNeCMYJGuNxfPQnwstIqthv9gl/sF119u9txU1oe+15HiurhvXLwlmuo8riAG+hp
 I11Av7Usd134ko2qIJuNgYGLt0kgV1zShCkTEmm4nT/jJVhLlRYGBZ8TEvTg21g3djM7cicmu2a
 5X/3Z3y/SJRqFyA==
X-Developer-Key: i=krzk@kernel.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_020511_877842_6C826B87 
X-CRM114-Status: GOOD (  10.48  )
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

Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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
2.43.0


