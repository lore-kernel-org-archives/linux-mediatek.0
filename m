Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51EE5C4345F
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Apr 2024 09:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nqJp2FKztvextHEoyJ26Y458/nl9T1Sgpe6quNevA6w=; b=cGRvP1Znwdsvic+1SlNzrGplTw
	gA8kHPYwA1KE1qA72rLUHxxd1RDLC1PNA5+ASSvFhvapADCOVHqxi/Q8fwi7bnyk0uXlVavIu26Gn
	Y887VqX2kurZgxIZfmvPv6TwSinaxh5FUs0/UtSzMDWK/EFJ7UFjY6Zoa6j4HwftnhO0rxGttOeTm
	HsSysAshNUwquDwd+m+itF/x5+N3NWAMURVBAAGaRz/SKh2aNWM7PTwT1jMmOSYD7jZo4IFlFm3Ya
	O895S/LkQ52tV6HMy7+UxdGhABBmxTzL2iJFcGwXSatlcm1PJ6OlaGK8E8fl0zz/ilDcU1yk27Njf
	eQtAuk8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0HXC-0000000BpCY-3uNY;
	Fri, 26 Apr 2024 09:06:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0HWg-0000000Bosp-1p1o;
	Fri, 26 Apr 2024 09:05:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D3B2E61FF5;
	Fri, 26 Apr 2024 09:05:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 470ABC113CD;
	Fri, 26 Apr 2024 09:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714122349;
	bh=OmWsR1whBin0FkWyWjikvJi4ntg0jTMwYm6UxGalLwQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Hdu7msckPY9+UmLMRoJM9T7ZsGeKXiX/bjBsUMJhD2iffwU5uae8550h9gvdi9xOZ
	 jUY6iGKUP5Mj6XBCRv453Uv1+cR783janwVB3LmT5kIzNx4wxpmhlW1ToEOExWFv6J
	 3UvUV+f/cQsAfWAteU/QWhjiLiav9L2xnnGNYvQJWAqmbNyZI0Owtj0Esa7OPEl6Lv
	 dNNNxhxOyuIO/YaZZQ5foCMJ+F6S9Z1+6NfOCB+3i5YjK2fq3MJCyW+oOjYADx5Pkm
	 KW2t4/YD5OWQ7n/Rg7K/VhKrpiKBYMKL36+a6XWqRYT7WkcMY+3gDHeAcdqUjKTkzb
	 3wSibzYE9U30Q==
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 26 Apr 2024 11:03:54 +0200
Subject: [PATCH v2 07/14] ASoC: SOF: amd: acp: Constify snd_sof_dsp_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240426-n-const-ops-var-v2-7-e553fe67ae82@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1504; i=krzk@kernel.org;
 h=from:subject:message-id; bh=OmWsR1whBin0FkWyWjikvJi4ntg0jTMwYm6UxGalLwQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmK24lZVO6ZDd9Ma+CskZK59Rr5+n1NdIFKL+9W
 9OWn+/QE/6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZituJQAKCRDBN2bmhouD
 13pLD/9RMyi2vNH+DIJ48G2LLs8RefNjWl15z8IwxEgJEnU1DjsRWBCUM6g4j4cB8PBIvJiAGcS
 VCo+wy7RI9ljNeYY3gBGlkCKA3iAdHiYoq3EXj/1OY6U1N8Qc2yqKASwflh5SMEndWwDkfh64BN
 4GHSgLPQHgqdC6QmBb2dVui3HWpxP/Ew/2Qr4NgUOHU98MPkBah3ID1P9SGGAQi0hckG9aabhFK
 Kj4EnjZoARWzfVrlAQD2VsJHc1JAE/e0eWEdm6LB3YGAHED768fwI4BmYh80+yDKzaVhxkTry39
 NA56Uxi0tEgzbhgaKzDyS4j/xRDf7lht/xFxo6Yrux7lHFNCNP/2BDShKXQchFtPRZ0ELL21ile
 5imnZbX2SJo0ui4xbhL/wG7NnanT6yebPvxDEMiVeezTTb1+/OBww+J/K8AIovLfJv4iTIiNfCs
 qnjzA/rUrgDRBPffwpsBWVJb8Wg1ZtSaZhb6BmF6Dfm63G0Z6zJ5OGlQsFdfUfIFGKtfSuPn4zW
 EQsQ0OQpSMoeRifpHhWxYzq6BcFfFG27s9FF0KKOwdMo22/W9If5Mgw9LXkjqZ5F6wjv8ZS/kuD
 yBGXZkQE14OyTXGXTg6h5HBpXSjUrVv+1GqncTBdM9ybGLsq9VA2eWacR0ChKGsUrrn8Efy5gz9
 51HxKKCm188Pp6Q==
X-Developer-Key: i=krzk@kernel.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_020550_640324_27E4520C 
X-CRM114-Status: GOOD (  11.57  )
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
 sound/soc/sof/amd/acp-common.c | 2 +-
 sound/soc/sof/amd/acp.h        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/amd/acp-common.c b/sound/soc/sof/amd/acp-common.c
index 0fc4e20ec673..b26fa471b431 100644
--- a/sound/soc/sof/amd/acp-common.c
+++ b/sound/soc/sof/amd/acp-common.c
@@ -193,7 +193,7 @@ struct snd_soc_acpi_mach *amd_sof_machine_select(struct snd_sof_dev *sdev)
 }
 
 /* AMD Common DSP ops */
-struct snd_sof_dsp_ops sof_acp_common_ops = {
+const struct snd_sof_dsp_ops sof_acp_common_ops = {
 	/* probe and remove */
 	.probe			= amd_sof_acp_probe,
 	.remove			= amd_sof_acp_remove,
diff --git a/sound/soc/sof/amd/acp.h b/sound/soc/sof/amd/acp.h
index e229bb6b849d..87e79d500865 100644
--- a/sound/soc/sof/amd/acp.h
+++ b/sound/soc/sof/amd/acp.h
@@ -310,7 +310,7 @@ int acp_pcm_hw_params(struct snd_sof_dev *sdev, struct snd_pcm_substream *substr
 snd_pcm_uframes_t acp_pcm_pointer(struct snd_sof_dev *sdev,
 				  struct snd_pcm_substream *substream);
 
-extern struct snd_sof_dsp_ops sof_acp_common_ops;
+extern const struct snd_sof_dsp_ops sof_acp_common_ops;
 
 extern struct snd_sof_dsp_ops sof_renoir_ops;
 int sof_renoir_ops_init(struct snd_sof_dev *sdev);

-- 
2.43.0


