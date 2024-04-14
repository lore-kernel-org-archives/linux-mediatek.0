Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76329C4345F
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Apr 2024 18:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GZiWSmjI1JlLrEIipCtL7Pk/V+lmlTYlK0HbAD35HKI=; b=JX/Zjgs3aycxwQrSZZgzgniiAe
	9VOVtgTGHe0Gb4VIiJ+1Y3lv9xFkgu538CPj7XXh5HxZynRanVE5VhkmgUAG2ULPovzvdExGeZvjv
	G3ZhNtbmb+IlJ92zENV/RmSglbbusjDwPxRYg8VBHCKctYZyqXBrmzHkNOOATw5/F0yOUu6f/RnZJ
	Q5m8t+V6f1+hMdXhi8t1hStR96SVKoI4JwW7e9aiVqpxXSroKkW5WLrcnin95+m+1Z+riI/pURtIn
	JykGwLQiU7Okmmc2fnUnzJpNZ54hOpRD/nKIPt17bQQLfLHFgu15O8UlVq1nm7EswDc3ejXyURzyG
	neVbed5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rw4ud-000000068Um-26lZ;
	Sun, 14 Apr 2024 18:49:11 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rw4u5-0000000687Y-1oV1;
	Sun, 14 Apr 2024 18:48:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7AEFDCE01C8;
	Sun, 14 Apr 2024 18:48:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ADCEC3277B;
	Sun, 14 Apr 2024 18:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713120514;
	bh=ODYRn2RdENpaKnJgZLjiwAca8icK8fqKMWlq39yx68A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Tz9d0Fxdi92/WqzdH6POx08Z2+ZuVV0P/a4thX8q0xcpqwmwUy9JSc9OJ1pIU3Wfn
	 L7VrBEsRlrtK6TogPf0I/svnoS0PWVk+kTTQDgHpYTbeS0VhG8DJbx70DGcgzg8/Ki
	 CdYIHAne6z11iw6DQfGZxppZj9KUtowPIDLzq/it5ItXpe5lCACO5kgMa15ZNre6YF
	 Q30Mzi+ewHlEo/18uC+QdZqlvw//8+8thbyeb7x2QYuctLvo3pjZSzRx2d3pVhVD4L
	 gOzki8UrzMXTytlW9XePTuWP/9gYa0ZWHJU3sS23eRL70Lxg35CG1v9hEOiiOVkOgN
	 mm/8rlEOvBJUQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Sun, 14 Apr 2024 20:47:31 +0200
Subject: [PATCH 06/14] ASoC: SOF: intel: hda: Constify snd_sof_dsp_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240414-n-const-ops-var-v1-6-8f53ee5d981c@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1327; i=krzk@kernel.org;
 h=from:subject:message-id; bh=ODYRn2RdENpaKnJgZLjiwAca8icK8fqKMWlq39yx68A=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmHCTJea+7a6S6/0ABA+BT4aNIYMDEgQLCwYl0y
 NVOjuIpHQ6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZhwkyQAKCRDBN2bmhouD
 1w0/D/4kT2T/U2kjeb533yzTZJrtn1IQZrnfh2AARz5j1/KEXUbKhX3g23zIiE7v2uMAApP0XbG
 oMf4MZfc7/qxfxOTNF5eRJl164ezv/XfeOt+o+oh/CMEUg45jLOvgQZVgCwGEWg69WdPhq1Wllw
 9mg+myz1Dhdw8SHJdmcuyWktFnliFSaLuoJm/gNoYJQ5ZBLwVDJN6KR5Daph/qb5p9BN071uE0n
 UNU5jfiPip/X9yMcmvbZRI/rxnKWlmvqSDq3GWkqT9eAdXFBZXwkYv73fkfaB63z1iOwIaIXSoI
 OZ/ekB+e9EG09ga9KKimHX/jEhzQk4kR7ypK8F0vLr2YrEaGQ95hpmBzsYSu70Px3ggKj14nFFv
 Dwf54mgvRiChYGnzxVa6WuYnVrvN6s/WmTEjmiMRm78dqD1JtSH3/O644bol12PTP39YNzZwzzR
 RbzWz8sy/n1WTeRCJJBK7K6RXbnbrvLYTg2sRTe+amJEhLjpL798Io6O69aZhO8GI2YF3leuVsl
 P2VTiXGQw4q14WhUuUkHitxtN2PKgC0QA1cYreDg6F/bWC/byVhFjNox1ziPoyoHoF8TqbIrmJe
 9Fd/PjxONIj5GvJXa6GyeunyqfvJRaUCHlYQq8LnP3kHTrkHIQ+wLuwRCzNQ0J8PMhac1oe4iZ7
 xj4+dUU5YGoX8Ug==
X-Developer-Key: i=krzk@kernel.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240414_114838_001611_37B33D21 
X-CRM114-Status: GOOD (  11.61  )
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
2.34.1


