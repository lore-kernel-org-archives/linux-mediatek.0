Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 057BEC4345F
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Apr 2024 18:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OWfoVKuVEE3te6ZMf+kyUypcqs2E2grmu5N6ZdDsr0g=; b=lhZVVeUcni9OiXnNMhVLiBrauI
	fSb4Ya/em2/bepF9aDKOyLsIO5u1hj1fytNi9GrcIOcEHSp22qKnQifGfUxNAuQ0tgtqoeqs9Vcq6
	a+68HFZMXbKU2C91r4uzSOCfk5jdfReiulf71ZEudlTVMszzDUFm3fIC4CFe4m3ZRpixTQDxw0TRF
	/RM35RQpBxhPNnJtOHlU3grJBNnv6vUcjV78+Xd2atrBfDjxlrjgTjHpJIgI2oBKEIrkkUy9nL+wf
	BcIJuhyROpmboFgWdT+t6A88MzNkh4r+RsTPr3GHBNi4fRuX0snYcyVy/fzBJpwQfEC0p0M5BMyN8
	vDjz+GaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rw4vv-000000069Ng-1FgX;
	Sun, 14 Apr 2024 18:50:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rw4v0-000000068kj-0KN0;
	Sun, 14 Apr 2024 18:49:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8626660B8E;
	Sun, 14 Apr 2024 18:49:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 357F6C32781;
	Sun, 14 Apr 2024 18:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713120573;
	bh=uQ+S648l3NSz9IkZmbPzGnp5Cl0axGVfcA86WU5fpOg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eiAtfsJiikEqdcr+79VZ0KLx7AOXG08ERkM3TDQN5wCxSAFVD8YpOGqVpW4tS9Rw3
	 Wn26J/SZaTauJoaHGH6+uaUG492rkuKKOm4xiMPC4JK84sLpEgv/othNzDupLaRR3o
	 mhWLm8S7vkz5iAKftgIs1WK4SREUhefAzCDsjOgOMpYbh7PX8z6FIFtN00soXrXQlq
	 HbnzTOj8SLt/62K8FSqU1c/+d56SE5jCwmSJ5nEIEVa56bD6Uc2bhjBa4z93hqnC1u
	 Tnr+J12+YFvwpGUl5fM1nK5AraIHuJcVzHBrcpZqj6TEfLI4Z+rOtJ2MfyZ2JIqAYM
	 gq1pPwN1HzuCA==
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Sun, 14 Apr 2024 20:47:39 +0200
Subject: [PATCH 14/14] ASoC: SOF: mediatek: mt8195: Constify
 snd_sof_dsp_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240414-n-const-ops-var-v1-14-8f53ee5d981c@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=805; i=krzk@kernel.org;
 h=from:subject:message-id; bh=uQ+S648l3NSz9IkZmbPzGnp5Cl0axGVfcA86WU5fpOg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmHCTQ0H8PMFuGVM51N5GfYEFfknVy7Wcjmiiwt
 43bIx4ypMSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZhwk0AAKCRDBN2bmhouD
 1xqKD/9NDtfWOgNmQGNrhyx8gyrXKfwSIDBIaqa5HHvwGUzbkT2Y3ROKNtSGB+/7UYL7KhtXR4H
 gKNGsnKTAGyeDXtAGyQd1hLupkbTd6+p9UFkgV4cuGMTfBUZC5Y8ny5pMSmgWqMGUOb2vMnZwgm
 RCF1iSsFygSvRC+ikIES5ZWQTGSt5WIMWmIV2+yRiYOopUPsG4NePPkrV11fHrBcjeVtcbCvKHj
 +hpnW3WeyLnGLMQbwlITgtFa+OUOQ2dgTKUGQNSK8zVcUoaASoeOQUnupH5rkuCzCSePm8gtoyf
 /CCh4QW+swNq9fhLyRAcuafehxbsbLU8Va2Mr7PX1Im/MmKifR/eIqTY/HwK6ac43Sn3ezA3a+a
 Wi5g9D6oVQO+iVcvWnDr5NbMVGdrYG3hOvqQkJNeuMec90Jrr6xcrRMNtUdBGN1jVAjF7t9lJgy
 /7tRkDgQyPaSt6F77UfToAceeC0Dfx8s9VmIUjHZgavbgXiVnOeYvFL3gqhPxKMCCDdbG51YjYO
 pczurvBtz9+Nh5DUZOkKleoSMQvNs4DhpDRzS0NYJhmfYcTWboSdDHReANirzMp+a7D/cQE3C82
 DBYswsZXuklU0MnOccqVU5n0CqOj6Sjv174g+w1qEE+5CCSA4lSALtZacDRT9Vkb1iMBNWXOxAG
 71E1iAysInF4j4w==
X-Developer-Key: i=krzk@kernel.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240414_114934_412428_A67DF602 
X-CRM114-Status: GOOD (  11.26  )
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
 sound/soc/sof/mediatek/mt8195/mt8195.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.c b/sound/soc/sof/mediatek/mt8195/mt8195.c
index 8ee7ee246344..fc1c016104ae 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
@@ -505,7 +505,7 @@ static struct snd_soc_dai_driver mt8195_dai[] = {
 };
 
 /* mt8195 ops */
-static struct snd_sof_dsp_ops sof_mt8195_ops = {
+static const struct snd_sof_dsp_ops sof_mt8195_ops = {
 	/* probe and remove */
 	.probe		= mt8195_dsp_probe,
 	.remove		= mt8195_dsp_remove,

-- 
2.34.1


