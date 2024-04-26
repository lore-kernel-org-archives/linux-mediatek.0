Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 299E6C4345F
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Apr 2024 09:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y8+wwGEzivAG5cCa6MPrmm9hM1tZ8MyShr6Qgsl/mdw=; b=e6v9A8KhGuObyRJnHf1pfcmNk3
	PbI0WjYg9unkx/dssGfoPvviVDhaRVnIup+zIMcaBcE4SKseSgDKSFiUTn2/TIKITm7am+qNCT5JC
	s+qGZyr/2tjxQV1JsDmMkJVMAvDkOKv5RuC2YvBa7HBmwwiCksuU9IiVv7w09K8sg3CrUIWMWOUvB
	flkbWsMWrg+3xi+WRiNnbanOOCXZeGXPSuiqh65RIsDGTHmf+ZIelX3U9hb5EMd01qnB1Zz1pM0Y4
	EVlRQx6Lp2+h3QK9IDkwhNfTPFZTmyMs9dkOgK7hS8mhvWdA6eYLmLVoZafvfoTfqfbCpk7Gs4DbQ
	KqE8FCSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0HWw-0000000Bp3s-2duP;
	Fri, 26 Apr 2024 09:06:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0HWZ-0000000BopF-2YK2;
	Fri, 26 Apr 2024 09:05:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F388561FF5;
	Fri, 26 Apr 2024 09:05:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2480EC2BD10;
	Fri, 26 Apr 2024 09:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714122342;
	bh=uSl9lHVhMhzqO5BXxIg9ZVHN/ovpA4vPraemkZEX5Es=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XJuPY7xnJUG2dzuMuGAdf4kyeZY7M7fYQjmDTKiPN/ajF3y3nszsFvN+tkNNZ8iAC
	 0GoYRlbA8WaRguZ79eeYw/qOj1e2Pl2gaSaGVT2oX8GBHsj5veYRklqp3amBhwQMkt
	 AJwGXp1PlCBqLWBcWdu697dfCaGRG7EZfUcnwibVpB12LOxrCuUWAyRAGLFurnxLZq
	 fOO7s2vOFVb9qmM8P23pCIv6q7BNFDbdvf2xaZqP4/QsDZCxroqJ6o5iTorKYUtgn8
	 IAz8DW1EyjNTvdisltC+7e42xsMixFB4PSkhsUwNZGR74D4kOCJQWEJEdqsJMph0jT
	 zaUpu9rMxE/ng==
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 26 Apr 2024 11:03:53 +0200
Subject: [PATCH v2 06/14] ASoC: SOF: intel: hda: Constify snd_sof_dsp_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240426-n-const-ops-var-v2-6-e553fe67ae82@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1399; i=krzk@kernel.org;
 h=from:subject:message-id; bh=uSl9lHVhMhzqO5BXxIg9ZVHN/ovpA4vPraemkZEX5Es=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmK24kIwXwjcILq4oTHU0GmodP7uXY1EGskkxrG
 kPPOLG9cu6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZituJAAKCRDBN2bmhouD
 1/vID/94le4u7Mr/ZXMzNfG1RttG6ySshfgZ+i+gW5oeYZMWtcjv4vBVFDDh6e6C7bgwNPGxnJi
 en52qMwbnDb1d3xMNM0PAX/enkLznKz7jioV5V9QrmyOq0gZghU0lHvIPj7n38wFBnLH+T0YIbu
 PhSFiHHUSwmh1rK3+FRyxH2jNRrlK21TRKLDrsDQg2TmQHUHm92kZWZ4kKSscJW1vKRok4+8QBN
 oymMJyFTaLdgJ7QrMnaorTkJSd30SaTKw/Wb2g8Vh7+1bLxtpL2KT/ZsC8MkMBH1C0Ur0J72Hxy
 cqAkWq39UMY1DzcEKBkZEro6DtTlIGu/NTq4LPwVny+uIyic+1s8pXijWTDv+Gkt3IqduNJtgN2
 sgO9DfXUNig+e2OgtmiBR9Rkc1zZKJzuxrbKpHW446h2Ju6TqoqQpdqEfs5D0Mn+CU74qdbXyQQ
 yO9zWhU89QHztLVbD8I3BvzqHccHdNNxztyWFBScd2xJCMsDtOyIdWj2ZJ7OYgHXiLjcsYyQejs
 x9CBWz4fk3R7cCWYV0Fjz+IFhXXmbSSSTjBqVIEEu/0Cjy5UZhWfTabJvG50EyrwUoynQqVyuU9
 it2S3jqr84dVJ/of1XXbvrzdfPDxmWeYojacs3pRoidiPS9D+EPFAycuRPmWKmrbqj/DNf2zW8X
 vxnu7veStIRiIJg==
X-Developer-Key: i=krzk@kernel.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_020543_848967_E92038A2 
X-CRM114-Status: GOOD (  12.17  )
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
 sound/soc/sof/intel/hda-common-ops.c | 2 +-
 sound/soc/sof/intel/hda.h            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/hda-common-ops.c b/sound/soc/sof/intel/hda-common-ops.c
index d71bb66b9991..466769c68da5 100644
--- a/sound/soc/sof/intel/hda-common-ops.c
+++ b/sound/soc/sof/intel/hda-common-ops.c
@@ -14,7 +14,7 @@
 #include "hda.h"
 #include "../sof-audio.h"
 
-struct snd_sof_dsp_ops sof_hda_common_ops = {
+const struct snd_sof_dsp_ops sof_hda_common_ops = {
 	/* probe/remove/shutdown */
 	.probe_early	= hda_dsp_probe_early,
 	.probe		= hda_dsp_probe,
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index b59d1a572bce..7804c5b50c26 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -874,7 +874,7 @@ int hda_dsp_dais_suspend(struct snd_sof_dev *sdev);
 /*
  * Platform Specific HW abstraction Ops.
  */
-extern struct snd_sof_dsp_ops sof_hda_common_ops;
+extern const struct snd_sof_dsp_ops sof_hda_common_ops;
 
 extern struct snd_sof_dsp_ops sof_skl_ops;
 int sof_skl_ops_init(struct snd_sof_dev *sdev);

-- 
2.43.0


