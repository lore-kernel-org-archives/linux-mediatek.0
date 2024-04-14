Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C517EC4345F
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Apr 2024 18:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P3dvtLW51URBbZWQDxNB17M0FfT+KM2ziuYqVfP/epo=; b=mQGanxnBBh1OY+evN/VfYUCowq
	0yhva/AL1RBnsaY2qWRcv/TFmMGov9J4shIoZdecsgAXy18N/KuLdrSSdIIKStggyAxBK2lCRVX0s
	gV/lICKU6QJyJask+E300qzj6XGA8bWWFdN3KhUsEf8CChtj/g29wf435VUstrGfc9N9w+PuMRRu3
	udz6d/zN41JqBHSgn0LCuaIRGs1AsvF2fmpVZ8ixDMxQWnj2Je+j5CnjqG9k85cbzNb0oxkzcq+Os
	mO2D9kkAotWlv8Ml9mZshZSwau8QfhoZoOsOrnk0fgnIIs7yi9ilkTxSYXnoOfxv4VaA+CyythSCd
	ginPU1tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rw4ul-000000068aL-0zDa;
	Sun, 14 Apr 2024 18:49:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rw4uB-000000068B9-2R5T;
	Sun, 14 Apr 2024 18:48:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E7E3560B90;
	Sun, 14 Apr 2024 18:48:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53E70C32781;
	Sun, 14 Apr 2024 18:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713120522;
	bh=HDagpE0K3tDAxGmedsHe5hM24jccnUYiXri16WPhSmY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QM4J4hJcAilQAenpmHougpgF45SkCpQowwdmEC7mjLwQxn3SErRt2cEfgz9FBjnQ2
	 lj36HPeWGJapW3+0NrMuHaqo885htr9soZR90k0kPDZVN613ufj29Z+KNRHhAxzobH
	 NYodIYhcfQ5lMraOKONLWXeUp7Tod1LsDbm6AG9RCKIbSs4Z+FkLjc6a+hcwkb/wH3
	 Lcf+dEy4K4is9jGTNtLoNV4ULSIsH1dhsQ9cEeYv+P9dPvVqCInQKhyZCAJUxQHh6w
	 tLzG81Vanl1yrcPjeNU4pxATHi9Kvf30wFt2QqT1QhTMUXrcmA3n4gP4WBPF/DgEb4
	 Oki/+R1eVZP+w==
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Sun, 14 Apr 2024 20:47:32 +0200
Subject: [PATCH 07/14] ASoC: SOF: amd: acp: Constify snd_sof_dsp_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240414-n-const-ops-var-v1-7-8f53ee5d981c@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1432; i=krzk@kernel.org;
 h=from:subject:message-id; bh=HDagpE0K3tDAxGmedsHe5hM24jccnUYiXri16WPhSmY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmHCTKjG1DimqE5FL7elEaDZsWbw26M3dARt30V
 vkAJmMPkTKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZhwkygAKCRDBN2bmhouD
 12exD/9/I3LdS3pGpcogHE3mZN74qV9LHLLx8BAjFOWstYyp/MhmwFBpr05YOGXTNUwwzU3wfbt
 +Ebrbl6hLU+8umJX67uayipYOqDyG8/svaV8m6iVVhRlItAv4Tbh9bRA0fuHmNUKOr0Yy/5Yvzx
 e47sslCY5FpG98SE65qYwkT8ogKEE3K1PDQSMVs5xZDVuwKA/HEFUKKkaP7/8/up9UPlSM1v5Hc
 WJiK+CxwwiCx/Ji1iL76ea4qG3CDVvLfu6TAANxv3Ek6kpjO5HxssxZpXIxymw7O39N+pfeJCKx
 8rpujOUpFaEZKjVXSPkkAgV9JBtasCMoDt5GosGxzi+FLRzYlsyjFhF6feAdnjc+dqi2G4I0jME
 ++VZx5hbBtfMPeWyE7x0TRIcunZTk9Gf9wkZGRyf27vxRX/9DoSnmtaFl3E5Xm9ZRnucXe0s+ij
 g2wHAOkUoPYvxZngSjFFSPnqL561OSmtaTcYW9zUrAEsoVWlmVuqNr19CkWevigZk+da4K1Py43
 Gpv2FZWyUDYu0B64wCreFStdkBVk8WG0PBvK7CMd+vsSH9hRPHuf8YdBZMvEpY/As5R4Qza7kIZ
 3SQbwhmi86SF8Pu2zEPJ7I2QjU4bEBO2HZgc/O59lY0Yp5SkZHZ9F3SJQLPp+qd+wAC5H1xemhJ
 zcYjEQI0qnGGyUA==
X-Developer-Key: i=krzk@kernel.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240414_114843_896226_7F6AD21D 
X-CRM114-Status: GOOD (  11.21  )
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
2.34.1


