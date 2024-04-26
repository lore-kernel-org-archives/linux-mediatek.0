Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 569E1C4345F
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Apr 2024 09:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zJfvt2wqhYIL9b/Yrexqg9WHNS0MNGaW7+8TbDBw6A4=; b=4o+7u/HiWkq0CkZQkyRtiGT/Ol
	gwAlUImqkI9H09sHcg5he11gazW7sKsP1bLrDz8hc9VX5EyBrEeN4tm+QzVkDgnUdYZL9rSv340Mx
	ONH0p8KPD8HYBwrBVMcmTIQdAlGIP3nVstMMPpgJrE5Lad/461yEOBq22IjFwXB2map5ZpsPKU2wK
	DQ0dEm4zXK85BewsaC5haoK7LV/Ku4KghVb0t7KiQlIt+NamVEYbJe0XyTHRFQRx4Ih9YptVKieQB
	f+mwQbhOc+blrLtFRBYW4WFKCK0a5d04sJSyvQzwiRPcIpP7r4IHqD0PaE8+9weMLc97EpHOcf0l0
	asw9d76Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0HYV-0000000Bq3f-2Xbt;
	Fri, 26 Apr 2024 09:07:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0HXQ-0000000BpJL-2POe;
	Fri, 26 Apr 2024 09:06:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E808F6200B;
	Fri, 26 Apr 2024 09:06:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F039AC2BD10;
	Fri, 26 Apr 2024 09:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714122395;
	bh=1j45APt84Z2XIlLb4CgSXht8+Dv+bV1Rc+4llmd3nOU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YQehXKrr/O/mDKcnEZ/VzzQIguHqfHe3LKofGVlscwcbsgubsTX5zxKFuh6luz/uZ
	 x5QOEM64z9voC8y7xCFEfsScljgkOzCOORs5FaB2kBMLjXa328uZOUQ4Cc0vf/ftt7
	 pCQRpP0M4CoeX20h+PraWWEdYcWtwHB9uLP+cRvTwa1LcT2sZm28NmT2tCRdSbpk+o
	 Kt2ixUBwlffHVhUkMnuvdCaPu+4qcjJ4xbPnPzOqVSvNJcB+u6/KRm0gXnT43X6Mfs
	 ET1okh6qQUwzrUjqbwwmQeMKpR5+FXRSp5va0PlCO42WRDjS7e1eoTIODOXevTJI0s
	 uyl0UUt2rOfYw==
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 26 Apr 2024 11:04:01 +0200
Subject: [PATCH v2 14/14] ASoC: SOF: mediatek: mt8195: Constify
 snd_sof_dsp_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240426-n-const-ops-var-v2-14-e553fe67ae82@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=960; i=krzk@kernel.org;
 h=from:subject:message-id; bh=1j45APt84Z2XIlLb4CgSXht8+Dv+bV1Rc+4llmd3nOU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmK24ri5hbvvP8DkjdiR3gDZ/o/lD3rZTZSVmyL
 9OhKlqW3dWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZituKwAKCRDBN2bmhouD
 1wyvD/979AcclNlfz3AHCAc7yWzJwuKG99G5B/V3GZmbbF/Q10mefin+IcW+1AAGJx2Ay8WQH06
 /gJnJMTc3D4r/w/4atnDj/NHGDbxk3muVAtK2hnvsR0839UYh5KzKhXGo1/6mOyClf6pbRaFPb1
 8jViXGzLcqMaBMKNWSCn7JwanyBjPd6O/O1J1Y5+cQvx5G94upsOAULNXWUOewj0xXSuTWXx4th
 gSgRLwfnoz+P1gVvurneJUtyWMOFYLINjNVclWPllOnNff328w3UN9Oi5rlxpJttkKV3EvOevXA
 D6M2gp7LsDUCyBHBVDe8ENUm9reCFKuFACkUnU6Gb3vF4AdUbVglglpD9+UHNr/MQMGNgc4n2g3
 ARGqfKiz9ibJC5AzsUnsErKtnJvNl9riPrMHpTxo9kyk5HDPSIg10LMOmzGp6ONl+8KBfGIuqgF
 6byJO3lHB14IYBAL77WuIUDDjUT9gIW5NzklFSiTcJys/0UWJ/zg1CnxJlTbq/1mzugQw+bOTeZ
 rpDZWvYtaNvQVTNIvr5WcZUUR2Pv4bPIf4D15CgtHKvTtbhBoFQqdkyqdvk/GIKXdjLqM2ShDRh
 OINLugwKjkJTmgFR6c+03NS9CXETbG+wymA6nbTIrHLhl9JrwVOoAxysfBELBVJLlzdCuokBjqv
 +kpjVSBdxdC1Z4Q==
X-Developer-Key: i=krzk@kernel.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_020636_729181_41005454 
X-CRM114-Status: GOOD (  11.92  )
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

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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
2.43.0


