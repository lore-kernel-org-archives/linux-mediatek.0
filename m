Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0887C001CC
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Apr 2024 18:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6B+VdJoJqm9pW06J62GS2yHMr7XNQrsXHGgn02xRQ0Y=; b=OgrLwkKfqRAYFrPpgN8hzdizB6
	V1jAqp9+ZSagBho3lU1mIpHOVutK8W62V3TMYW7ZvLkKsoWPxMy0xGrB7MnN/QA/DrWLS73tPU+Vw
	9WzuIjM3I3v/avywPuPvCyWdf/BugX1AEUTxvbw/V8y8omt5VBbd0RqLubB68FNoyCbIPPFC0+Jt0
	ZB/MH/2aNAY8YTNSc1R/zKp3vxNhtC7F42XpzWwka+f1H/KVO4HRbwhOUc7qJI5yGVra/yQWCRrq6
	aaEFvI0UC2uD8jj6+sxY2uzyaR0CE/7ibITjHM7Iq2q73jYbGDgrcJXPKymwGgludVY3F9pb1jazQ
	wwXNiz7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rw4ut-000000068gp-3IFT;
	Sun, 14 Apr 2024 18:49:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rw4uI-000000068F7-1pUP;
	Sun, 14 Apr 2024 18:48:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EAB1260B2C;
	Sun, 14 Apr 2024 18:48:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BE0CC32781;
	Sun, 14 Apr 2024 18:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713120529;
	bh=qgb4PnCVl0dqQSpagyMoidmTAcUFqQ7boy1JaeGL+xw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SHEGDY+xloKWsvdr1QregSOPFE5gZDmG8xvNFgBuIGon3puktflzKUrL9aUk2OXTb
	 FojfSY5yP54bq24DZv1HJfC7IwwGCfwUmM51x01JKqhIh3O3/4tErqQGQg6nR7pVfG
	 4o2KfoWO2BOwWpyPu+PbilVoX2DWm55eKMxx5A5YVvkUtl1iY2QxyJ7yKpde+JT7SH
	 ZBOtub+8OjKoeeUBONcyECzbylOZOWW7v8rIChX+qL3p7VYxq0Yf45dPTmVdIMcyGF
	 e7qbWEaqg/mTrAllusKO0DYnT1fGjrNwFuaQXvvj83tq0eKHDK3fzDtD0zIvgoZggY
	 o4U4QL/UTKSxQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Sun, 14 Apr 2024 20:47:33 +0200
Subject: [PATCH 08/14] ASoC: SOF: imx8: Constify snd_sof_dsp_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240414-n-const-ops-var-v1-8-8f53ee5d981c@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1012; i=krzk@kernel.org;
 h=from:subject:message-id; bh=qgb4PnCVl0dqQSpagyMoidmTAcUFqQ7boy1JaeGL+xw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmHCTLxCrRFj2CbxXNcJMF1mYYqYrCPBlpVKzLk
 ZK0FIwRfi6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZhwkywAKCRDBN2bmhouD
 18WqD/4t4JUa14a9ctzBg8GUlqATymsKIponwobiAd+pdWdo4nZULjKytV1nfQdgj2wsuviDLfW
 6se3BJx7VHjcOfGcJXXXbrPVEDgXRwmP2j3bWYfwsfi+8nG6l338p160sOivSVoZ1vdcALpKe4k
 SYo/2t2Ugo/MnYOC4d7hI6ABT15UNpNOsmT4i5ELyAU3qswUbxVtffxB1H3KXCi4xl2cpS8NZeZ
 Z/KOrRuG31ZWmPrdr2wtHpQKMFHh1vBJMvriMVrvKpd+zOntTsYdS/fznqBCyjIVmJcWJwR2zof
 BKgS/O5gNEcW72mbpeUHeNj53kUg2j9I6KtUewi9asBJdudH5tcmLFHsfWGjo+F6c4f6vJtYd7R
 wFD941HoSLeuESMiqK4oO3kmf2FC1yDl50jhD2OxeehTbUN5KFV2tY9fJdYwCuy99Ie+hBmiVNr
 gtd8NV8+IhPNRRkWggI3/4RUmILVdYwqy2+K1Bf9BP7irQd4w9R5oZqP02TclMLArojpr16DKz7
 d5+S6usRxjE6Sb89p9jwuWCBiGZ2gn9b2ZgWOmk5EZZeW5s2YKu7O+iYlWMwZwP5Xf6lKarIdor
 uybySSbglauDc4Iv7VBLAOAog5l2faNB5Vq7k2eX3YJLbjeiHyyt/TvfeEQmAWbT/xYlrsXSb4Y
 1iemPv7EFYgM9Vg==
X-Developer-Key: i=krzk@kernel.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240414_114850_670141_6BA22D60 
X-CRM114-Status: GOOD (  11.44  )
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
2.34.1


