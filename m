Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E89BC4345F
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Apr 2024 09:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xq9xFFOqzOX6ytYAaGztyP+4Q6UPxDYZagVPFV+7qXc=; b=Lsymq8WOb+iDPC/ekq+3UMitZ7
	15+BElFqV30vD7c26RSidEou1f8SC1Qn8hg/0Mu+vKacF3L1+om4zlOVDOUHxuEqn+YbA7T3sD4Mt
	8tdpSQZSWfWEWHPvs6b3qieMEiSU9E+1qZy/PIJO9NFAdY/PiERW4ZZt4uZ+RgA2RIHT+dYx/82wj
	e11xO/AFkwm+UFAGExSmVpx+NSTh8gv4eEWGFbgrYATcK+SAyq8wfG/jjmETtAgYLqGIZrOM3n7GH
	/gS4ZKGYuIuyc3jEQIwEaItT5rxen9SqlE7x2IS2+mmMNI7sKiaIrS545IIZxR1RH1EHNy7R3remG
	v1juA1ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0HXO-0000000BpIZ-2yYj;
	Fri, 26 Apr 2024 09:06:34 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0HWo-0000000Boyi-3jD8;
	Fri, 26 Apr 2024 09:06:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C3BDFCE1BD9;
	Fri, 26 Apr 2024 09:05:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 247A2C113CD;
	Fri, 26 Apr 2024 09:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714122355;
	bh=dwWOV4SZweJ8ytLb+w8zBZXa3dPFIs1yZjd4j/v8Io4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ja5OV4SZvYXWq0hVVyR2HGgLXllJRbCAzbNUhiI7aRKRIQ5mmnxniMI0MbzEk+a/1
	 SzaSti8MrMWG7tvrvdKqlUNP04pMsOapue8eKQD48aqVnsvidim4VIFMUrJTZg7V7I
	 oAbkDXMpl35GgzcmIBMXvzD8iiF90yDCih9wEozr8Cy7C4oqE5WuvadIAt78oP6NI0
	 q6ksE68h7w4JPuWkP1PIp5FoD7cQheiglgOrt6uQ9KXEBc7jdhTfLN6J8lqEak3t70
	 +5O/RYBgxj0y3zLYPXWduAzwXKpMxo3Qz903t4EKijg/ydbsuVwGYxWPlkEdzoTsdh
	 Ygzru04ZDYoHg==
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 26 Apr 2024 11:03:55 +0200
Subject: [PATCH v2 08/14] ASoC: SOF: imx8: Constify snd_sof_dsp_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240426-n-const-ops-var-v2-8-e553fe67ae82@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1084; i=krzk@kernel.org;
 h=from:subject:message-id; bh=dwWOV4SZweJ8ytLb+w8zBZXa3dPFIs1yZjd4j/v8Io4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmK24mHSbrjv60BeG3lTvTBn2FMZ6o7H6vVAw6/
 YLLpWRLHgiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZituJgAKCRDBN2bmhouD
 11qsD/9pumSWYNhS8XZXAHrJFMGx/Fm4mJI2ptbjfWaYBmnMu/gTxjYVkbt374o8VNmEq9Z/xZv
 N9gC01eQD+WDWkAV8c5/84gHaEk57UWhazF2UV5LlpIYSnL/9YO+jfmgw7YkRolCWqArPRIDXkF
 Q7hE4OKj5KJNx8vvJ9JOY+mc9cqRd6i+1qE/Am2h9EUL30v+WCz6/Sd/I/p8HwepPH6fB99Tfiz
 X7o+isE6+SFBDczOjgDRn7lmlFzZXPBssCri2pHxeamUXWHD0zb30o8t9tatSp4rBcnEkRfxnn4
 YjpWjqNLi+lpTw3+zGz5kFIUIv9Mn2l7eGNvRk9umW02LH+yavfgDkBFu1MEcY2FlBtXcP4LIBT
 IqNco2HBZLF9yA73rP6V92S6O2qLjoQ3Bc4gVRVPNE+eL1j1Ww+6cR8KWz6lMstE7rIZskHCQB8
 u/LAguK7dZlAbEYxggGHCO1jFoeKnClyOZ3rwpsZpGVjSCiARJ8d/J4/c4n0yJQ/sSL69tbtvzq
 qgWtlNZP9ETI//QXueq/o/vePJOqstM8SYnn+UwKzYO7rEOgzhKy18sHQxDAyovvhDMx+/vshH5
 pKplkGAt7RkeLv3ET9jBkwmkirNSGWjnq5eTYlEmEeP22eTP0UuIV9RiuO/+3QSUbeKOwkSAgNA
 h1H32jNGeafVSAw==
X-Developer-Key: i=krzk@kernel.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_020559_485735_B25DEB35 
X-CRM114-Status: GOOD (  12.00  )
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
 sound/soc/sof/imx/imx8.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index d65e09a927f6..3021dc87ab5a 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -478,7 +478,7 @@ static int imx8_dsp_set_power_state(struct snd_sof_dev *sdev,
 }
 
 /* i.MX8 ops */
-static struct snd_sof_dsp_ops sof_imx8_ops = {
+static const struct snd_sof_dsp_ops sof_imx8_ops = {
 	/* probe and remove */
 	.probe		= imx8_probe,
 	.remove		= imx8_remove,
@@ -539,7 +539,7 @@ static struct snd_sof_dsp_ops sof_imx8_ops = {
 };
 
 /* i.MX8X ops */
-static struct snd_sof_dsp_ops sof_imx8x_ops = {
+static const struct snd_sof_dsp_ops sof_imx8x_ops = {
 	/* probe and remove */
 	.probe		= imx8_probe,
 	.remove		= imx8_remove,

-- 
2.43.0


