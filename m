Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D26DC4345F
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Apr 2024 18:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=atJ+3VL1kp8sgJA7cn1shwK3+nJGtzCsJ+9PcaLx04I=; b=B++UripN8uFLpUxop4VEvCzS6+
	LJRF5I88/IQcFi5vDcbiIGStMCkZ0Ob3qO2vfqDnAAFTXufuAc7DsysAfrPDmc9JT3O61Lrzbwloo
	TyxOB0PPfCCXuWzXDN7QT2EjPvqfw3ioaghaAexL2Bqd8xzQEjyA/qi2/Dm/FnFNvvYgISAadxi1i
	t0hielZpdXTsT/qg9nReDucAOCPw4WyFeGm/Kah4BIttm61cCk+7p0/j9rOpgvW567Ji/UaJoFqbz
	mTGhghBJ5RL0whESg8/AV6Z+8KAzjy2Il8laRqDdwMbXZG9VfHlxshUhrRGnZdUMlfvCL5XDh8nni
	ysvf7aOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rw4vj-000000069GJ-2Ars;
	Sun, 14 Apr 2024 18:50:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rw4ut-000000068gM-2u3o;
	Sun, 14 Apr 2024 18:49:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1643560B8E;
	Sun, 14 Apr 2024 18:49:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1463C32781;
	Sun, 14 Apr 2024 18:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713120566;
	bh=PTqTHg6RfiqGrMd0uUIo4Ojcwe5ZdipOblCxCj/1tgs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IwATu6cRmszBY4gR2PIa7SDexM9molkMbo+DqxHpgMHUlb7fjP4I67pfkyikAvx+B
	 8AUIgr8XobjSReXhJrt1DSZTDiMkg47rDLyrrH2JEgeCFU7D+x9Hs5eu7t2gipbk1R
	 XrlvZPZLHf85cZ4ATNly05hbHOG+d46hywerfCOCPPS/rTzOwVBMdFNJCyESfhi4/d
	 U0vid3hw78JLcntpuEAhpRiFp+9UiQy0MjdFVRHZet6M+Fcb1mAmrjjXg2OG/CKjpN
	 AL7C4C4DFwdg9cmMQm6LyML3hPjmMJtVd2hzv4P4KDfUSipX4A9Z03nQzBSN6Qoo5C
	 1Fflvm3LQo+mQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Sun, 14 Apr 2024 20:47:38 +0200
Subject: [PATCH 13/14] ASoC: SOF: mediatek: mt8186: Constify
 snd_sof_dsp_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240414-n-const-ops-var-v1-13-8f53ee5d981c@kernel.org>
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
 h=from:subject:message-id; bh=PTqTHg6RfiqGrMd0uUIo4Ojcwe5ZdipOblCxCj/1tgs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmHCTPy0Vuz1BCpQH16OSjw800/AKgJdci1kr7g
 iuRvvsvesiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZhwkzwAKCRDBN2bmhouD
 16l5D/9XYqMivdns13ObQag4GyuRKauiWiecnojrhow88jGtYdXBY7+jBn365wZvR9WRWZCMvwK
 51RrmDEO/WWeBCXADRmQPj2BhveNuH7fXlhKVhdL5Db/XhC6JqCD8nv5xvsUuuF6YQ70L/Tr24c
 hH2iKB0UidxHYxdkHmNzv/EXNA64W6+dsAIUsMbaM78sCDD7Lam9eUd59UkYzWvGx3h/KbI9W/H
 ZaPfqISgobcvuoetAEyzbLuDdLy+SYe2XvP0rLpg9byDRvPdHgNzFDKcMVcmBg73MlxfWGjGqjF
 xryOFNwxg2BBHHGEaiXfDFmUoU897EoeGsHDSQaSywILHigt32lhCbrQUp36CsRR04sbxNDp0gQ
 WdDNYHTTXFlPK7g+ainTKqvFZXwJc8TP2Krxn3ygqxHNQFNBFbCKOPLz/SyjpzaFQV+9PwC+nN1
 8uYEyHSpiaOqaOchTXMGIEQIQfxYx8sLe2JCZ1f3ylfQltQQzNihuVU7vPHEZBck3g9HRwxG32v
 xkJsLHxGt39rwFmq6+Hjv6sbzStih9HZwiLRmLVzWsD8Q5W0NeeD4/6yd6wLfVj6cQK54UVhrjw
 X41Xya6xAI4CLx0szmdhh7SbwLwQJ2c9OdmK8D24keawTloMzF7VkfUYKUSpXahdJddTEaIvNd2
 SnHjFx7gm/+DvmA==
X-Developer-Key: i=krzk@kernel.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240414_114928_396309_8F76D377 
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

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 sound/soc/sof/mediatek/mt8186/mt8186.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.c b/sound/soc/sof/mediatek/mt8186/mt8186.c
index 0d2d7d697de0..c63e0d2f4b96 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186.c
+++ b/sound/soc/sof/mediatek/mt8186/mt8186.c
@@ -481,7 +481,7 @@ static struct snd_soc_dai_driver mt8186_dai[] = {
 };
 
 /* mt8186 ops */
-static struct snd_sof_dsp_ops sof_mt8186_ops = {
+static const struct snd_sof_dsp_ops sof_mt8186_ops = {
 	/* probe and remove */
 	.probe		= mt8186_dsp_probe,
 	.remove		= mt8186_dsp_remove,

-- 
2.34.1


