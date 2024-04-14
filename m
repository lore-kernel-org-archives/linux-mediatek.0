Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5065DC4345F
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Apr 2024 18:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qpi5Xmvj4ksY/LJGHDMK8rj5d/MpTwz//ARw/EeBCSk=; b=VJiPQtiCWN0oOs27ANBcDP3CcV
	02VO8kFwAwBTccds4BWfYVVN1LVA4EQYGnCjVDEClRTz1fmKO7YB0udVSrWwQYsjf93vty5NSbovw
	B5UODWyqaoDpfS0oXx+Uc/ltHtugs/oAuUMf3XPKqwiMYHA6ic6Cc6rQ0CpifVkfFnF+zupM94b8U
	3mWWMkfS9O4kiuHOfHbVt6PzwxEo20HndE8RX5OxupuXi0WlV1osribH+u3hPQi2E4FBCCXHdMfbK
	7B/72iK9GhoBFcJ130+eOgwcLxmiQXHlG5+DW5KuW+M+P1BFiqkCx2bHZ7rnpEbP0NfaNBpHl4hsq
	AjRroNJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rw4vJ-000000068xk-3XeL;
	Sun, 14 Apr 2024 18:49:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rw4uY-000000068Qq-2sKG;
	Sun, 14 Apr 2024 18:49:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E880B60B8A;
	Sun, 14 Apr 2024 18:49:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0964C3277B;
	Sun, 14 Apr 2024 18:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713120545;
	bh=jtqJAvdCzVf0KHLlWMGtcqe5mcAFkufBUSxCwKo/4SI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ReQCdqbbnH0DOQNUXYk+seYVigCJ6US4GhxHsxbg3kGdn9Bc7qDo9uJyYrvcRuwLA
	 H6jjvpo6rj5ZpGdJ4K9eq3a3VbAvyDFp9oSCv62ZBjm+df7cVSJOHTXBiM5sq6E+Ms
	 oS+lZ8H51876UmIiL2YXy1PnFcOiARZ7dbRENiVb6rqBiH+CS2+vOzJ2mlXX7Po7GJ
	 cjlMvRfWWsNDMfzv3X+o5oUx9TzCkBGe7czfzt84JpZ6mvgeyMc/lQ7AlXTC9CYHiy
	 oq3cfQ+uoWazQM/gxEl6wqX2TReFJUAUERy6yxzH0Et7+VcTM1b2jlEOugW/hgNT9V
	 sroNSXiqnC6JQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Sun, 14 Apr 2024 20:47:35 +0200
Subject: [PATCH 10/14] ASoC: SOF: imx8ulp: Constify snd_sof_dsp_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240414-n-const-ops-var-v1-10-8f53ee5d981c@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=759; i=krzk@kernel.org;
 h=from:subject:message-id; bh=jtqJAvdCzVf0KHLlWMGtcqe5mcAFkufBUSxCwKo/4SI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmHCTMZvIPE90QIjHh4JDJGIIE6imTFU4GmmswP
 yyXSkheG0yJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZhwkzAAKCRDBN2bmhouD
 1y2NEACXCTRj2D3a4ADYFmh0jZtAPLpxvUIiVRHBk53PjOv4nRt3dZgoFazC/j/O9Z6jPXNgBTw
 cIJ7hOguwi0gL4UijZ1ydMf4AfVdMMg3F6icDvFXe4iLt5RASdBTdQKw/7qXXo0Emse0B1xHJqw
 ncIPWBAslfh+FRlGVBjE+HL3/CfKdnUjvf2prGZVCejhAEZKiV/AtWbZ8QLkjkn0XE2vcmHz9KU
 YcdLpLdR3HHHXJXsBu2s+QL6KCnLI5pvzblSY6bmro+ah0ycU792HYJps7IvFA/ONgR/gFemL4r
 3nNTtrNVejmifOi7VR/SBNgoKR7CzUOiLQ+rel8ByH5Xzj36ZryfCyNeWPx67ZmNKFvFB4IVSN0
 RGQpGuGdqYm004sTagDasOceIBUsznRdNfmZkXbl0n/6N548l6vE9/VuIOPFXDkrTpZfLOhimZo
 mdqNF5HHbr7EMqaWAnAMVL+olJM/gdSWWDrutkZQQkNUJxYXEYoNMJwIOPJtdbsbdK1vqEtIzZa
 YgghG20mcoK1w0aoAK6nhp1MA/sAcwAN6+328yW8QFZ39W3LF/gMLOEp7DoqrxhUnAv9OZ5WH66
 CGfBWS2ZPpUTbU6Z6n87+Q+e/v+sz9gf4XsChST06WomtmYTTaFBk2NhmkFTo29FyKCOxrdhsiH
 66madR3UGdgLN9g==
X-Developer-Key: i=krzk@kernel.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240414_114907_137572_02EF1CD0 
X-CRM114-Status: GOOD (  11.13  )
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
 sound/soc/sof/imx/imx8ulp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/imx/imx8ulp.c b/sound/soc/sof/imx/imx8ulp.c
index 296fbf11f6d0..8adfdd00413a 100644
--- a/sound/soc/sof/imx/imx8ulp.c
+++ b/sound/soc/sof/imx/imx8ulp.c
@@ -408,7 +408,7 @@ static int imx8ulp_dsp_set_power_state(struct snd_sof_dev *sdev,
 }
 
 /* i.MX8 ops */
-static struct snd_sof_dsp_ops sof_imx8ulp_ops = {
+static const struct snd_sof_dsp_ops sof_imx8ulp_ops = {
 	/* probe and remove */
 	.probe		= imx8ulp_probe,
 	.remove		= imx8ulp_remove,

-- 
2.34.1


