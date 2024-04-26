Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97EC9C4345F
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Apr 2024 09:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HeTxQKITb1izd2YuB1rEZ4rwo0cCNVFPuLTe7wus1UM=; b=ewz18QI20vw4AB
	vlbzxyToZLsUzJArUhW78wml1+CwCTojBfcwsCbMt22gmf/tlpB1kc0B4obdiF54YmvQReCe/Om+W
	QkfvJnSXplJmQz+B7THEqHQO3wbymOIUwUhVZzujdX12Hyk3iQmKxXNevagUezjoBEf8p04GsfPWv
	8GxTmG5jbce4jfKKHKRMJX/0NTF4fRE70ftHpS+7iR/VzqPxVSFvqIWEdkF3kLexDRYCl0vH0UAUK
	Ea0B/LO7sYkeHgqPOwtzc9V8G8H5Jh9heUqsgjpDdoqpUycbW8+HwT/mZpNBm2T14SnrqW1oXO0ao
	Lg3By318uxNXyNOS70nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0HVp-0000000BoN4-3DgZ;
	Fri, 26 Apr 2024 09:04:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0HVl-0000000BoLj-3lKj;
	Fri, 26 Apr 2024 09:04:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4F4BA61FED;
	Fri, 26 Apr 2024 09:04:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 131A1C113CE;
	Fri, 26 Apr 2024 09:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714122293;
	bh=pm2j1dM2p+8pNOKXWZzVY9FMSNrPURtydALmuvx+siw=;
	h=From:Subject:Date:To:Cc:From;
	b=E7nCAB0DtLEbFbdOGaX777N0X0XV4k2CNMRL9+fnvIsvomps1P64c/ooLwmWfY+X3
	 m4okEsxFdK473An+EhcsCqQAFa6HntfG69GzO2Y+yieZYm2DDILswmkgoVloKspdtP
	 VvsfdKJZQOW0EMHg3mrm5kEAx5VQsQiSbvYkQfT6KClxI1nur6Bn602Kmvhbdg80HO
	 ulbvVAeDYoUibKbFj7C93WkmLF8czZ4wrBp2DGQljnOy3nS0+JLHVuHrx42omnDqaO
	 v5gh+OR+aeq+vhAzPL9PdcGUEsLKGaYo+ix57EVrPYF2e8h1i9xO3+f01vnE3kdFcL
	 aEnMW4yULsazQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2 00/14] ASoC: Constify local snd_sof_dsp_ops
Date: Fri, 26 Apr 2024 11:03:47 +0200
Message-Id: <20240426-n-const-ops-var-v2-0-e553fe67ae82@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPRtK2YC/3WNyw6CMBBFf4XM2jH0gYIr/8Ow4DHARNOSKWk0p
 P9uZe/ynOSeu0MgYQpwK3YQihzYuwz6VMCwdG4m5DEz6FLb0iqLDgfvwoZ+DRg7QWUuk2mq3lx
 tD3m1Ck38PoqPNvPCYfPyOQ6i+tn/raiwxHqqDFE1NrUa7k8SR6+zlxnalNIX5tzHxa8AAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2676; i=krzk@kernel.org;
 h=from:subject:message-id; bh=pm2j1dM2p+8pNOKXWZzVY9FMSNrPURtydALmuvx+siw=;
 b=kA0DAAoBwTdm5oaLg9cByyZiAGYrbhyhrRkynmvFIgcWvJC4JAsf1b71Ti8wIkX9f1Kfu/klC
 4kCMwQAAQoAHRYhBN3SYig9ERsjO264qME3ZuaGi4PXBQJmK24cAAoJEME3ZuaGi4PXuo0QAIbH
 d7a92vy0rqiQwWXMMVzg532JOBlhopM0Y5zBK9mU7tQoLdIeMgru6dkEdTZaaWFF97v6z6No6Il
 FFf1Rb6Q0XfLaD0ZuqMOYPYJ8fFvHxnRxifpZ5xoV5wNFvCz8kiCRKpVOEIm9dN8pGcT1tsFbXK
 Aw18iCCpB4B8xnH5f8iUfFYLy5JDsRMXlk23fSDyA6s6zNsh3mwz9dzCUpRREJvB/izLBbtTRs/
 VRr7CJUS0vECgwnjfSC51P0fVt38YKmFIn4U3g+z8fSLu0OzkFwp62t9K7t0jBw9uEqKuWlPEzK
 /sweW2NQCOVyQ8J1WhP26MIDP7Sv4RlGd0cMIg8QVvOpgcKDF3LlR2HbDaqB/s/918jtWdTiNTo
 sfC9R7VtDBuHe7e4NppSo/mxHFOb1pwJga5ZAOCe8bc0aT0pAKEpqi5Ng80tYckqkUeG/Oc2C1+
 JkaJ6E7np1NlsjfbZ/RKDNpoXKox6DqDFrzun0hpeihWUOnB9o3KSla6L+4cjywErQYkaRiaQOu
 VlFFjkcgNa9nz6SismodUx5myDutbGPKUNTtBXa68P9U+KvwNp/zSIN78Ez+NEUlw6CPT0E3WCL
 F/23amcVe9o6pDR9ERhoW/A+wg83tnFlGnEJN8gfzCDngQIowdzdEQdYyT4kRsUj5X7Ohu3Uvrn
 6O74m
X-Developer-Key: i=krzk@kernel.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_020454_062458_8B1A3DA5 
X-CRM114-Status: GOOD (  10.40  )
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

Hi,

Changes in v2
=============
- Only rebase on for-next of broonie/sound.git
- Add tags.
- Link to v1: https://lore.kernel.org/r/20240414-n-const-ops-var-v1-0-8f53ee5d981c@kernel.org

Description
===========
The core code does not modify the 'struct snd_sof_dsp_ops' passed via
pointer in various places, so this can be made pointer to const in few
places.  This in turn allows few drivers to have the local (usually
static) 'struct snd_sof_dsp_ops' as const which increased code safety,
as it is now part of rodata.

Not all drivers can be made safer that way. Intel and AMD rely on
customizing that 'struct snd_sof_dsp_ops' before passing to SOF, so they
won't benefit.  They don't lose anything., either.

All further patches depend on the first four patches.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (14):
      ASoC: SOF: debug: Constify local snd_sof_dsp_ops
      ASoC: SOF: ipc3: Constify local snd_sof_dsp_ops
      ASoC: SOF: pcm: Constify local snd_sof_dsp_ops
      ASoC: SOF: Constify stored pointer to snd_sof_dsp_ops
      ASoC: SOF: intel: pci-tng: Constify snd_sof_dsp_ops
      ASoC: SOF: intel: hda: Constify snd_sof_dsp_ops
      ASoC: SOF: amd: acp: Constify snd_sof_dsp_ops
      ASoC: SOF: imx8: Constify snd_sof_dsp_ops
      ASoC: SOF: imx8m: Constify snd_sof_dsp_ops
      ASoC: SOF: imx8ulp: Constify snd_sof_dsp_ops
      ASoC: SOF: intel: bdw: Constify snd_sof_dsp_ops
      ASoC: SOF: intel: byt: Constify snd_sof_dsp_ops
      ASoC: SOF: mediatek: mt8186: Constify snd_sof_dsp_ops
      ASoC: SOF: mediatek: mt8195: Constify snd_sof_dsp_ops

 include/sound/sof.h                    | 2 +-
 sound/soc/sof/amd/acp-common.c         | 2 +-
 sound/soc/sof/amd/acp.h                | 2 +-
 sound/soc/sof/debug.c                  | 2 +-
 sound/soc/sof/imx/imx8.c               | 4 ++--
 sound/soc/sof/imx/imx8m.c              | 2 +-
 sound/soc/sof/imx/imx8ulp.c            | 2 +-
 sound/soc/sof/intel/bdw.c              | 2 +-
 sound/soc/sof/intel/byt.c              | 4 ++--
 sound/soc/sof/intel/hda-common-ops.c   | 2 +-
 sound/soc/sof/intel/hda.h              | 2 +-
 sound/soc/sof/intel/pci-tng.c          | 2 +-
 sound/soc/sof/intel/shim.h             | 2 +-
 sound/soc/sof/ipc3-priv.h              | 6 +++---
 sound/soc/sof/mediatek/mt8186/mt8186.c | 2 +-
 sound/soc/sof/mediatek/mt8195/mt8195.c | 2 +-
 sound/soc/sof/pcm.c                    | 2 +-
 17 files changed, 21 insertions(+), 21 deletions(-)
---
base-commit: efdfbbc4dcc8f98754056971f88af0f7ff906144
change-id: 20240414-n-const-ops-var-136f395b374b

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


