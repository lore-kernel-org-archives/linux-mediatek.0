Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A1CAC4345F
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Apr 2024 09:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kXVgaOquyUNKxyG8BCH4P2Fek4LPf9BbUfk72cErACI=; b=d9aSvuk3NiaSF9KNEQxSsmQ+7f
	kfXTuZg9axjzIICMB/h1Xd5DQMafWWi7sWbOJ737jfvRmfLkLvkaDolDatD1WKc1BxHzxQhJg4GeW
	D3Sr44sgnIeqB9NTCSXGxSwBMIV80XjozejdqOKuF81neToXUJCHAcb9VHKyfQmAfB3aolyOEmPg+
	K28K6SgP1O8OWo8XFZWM2L5dqYPXY3l9Sq4Wg0RRl3xnYdPZC8kLwaFDe11SNZPI8OG7OKTAGtyIe
	UxySVVeAU+mdVMqDoOrF9NiP+oU+Xn7wIzfz9b+O8HeojVw1yKd8c6askZxJq3E7z8RYlf0Asj54o
	bTn7DFpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0HYL-0000000BpvZ-33U2;
	Fri, 26 Apr 2024 09:07:33 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0HXM-0000000BpFy-0FKC;
	Fri, 26 Apr 2024 09:06:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2CC44CE1BFB;
	Fri, 26 Apr 2024 09:06:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68D6DC2BD11;
	Fri, 26 Apr 2024 09:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714122389;
	bh=CxPAgNjTAhKSrnJ9nXn8uxxa5Gyc46BCpw5S/shz4vw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mGG9w0EiFE359M4Z0kyegLPJAuOetfwlvp9QRl5QeoRqVdYpZtPj0vI8av/F9Alcx
	 vIbZ/OIlL0O48oW10NYCdK7FQwLHW2ttIsD9A76ippIY4cTI228dJpHnrFJFSR82dh
	 ajrbjJFT7UEh9YfSjpIY8H8CHX7+n19qSm8m7vqnXfSLM4Ja8vATtyGXf3l1c3YAwz
	 UcMW2ocWMcp8W1ZaRd7TnQLgdGtewx/25xd+rIyVhFBGaYZydgg5/mqzUNSO6JQ4cq
	 sDdm3SVjmlwRUkCdg4HWzL5ZYJlrgipbJqE7FPetpZQmuvGC7oq4HyUmXKBnIzpM9G
	 pIuwptjfd+0Sw==
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 26 Apr 2024 11:04:00 +0200
Subject: [PATCH v2 13/14] ASoC: SOF: mediatek: mt8186: Constify
 snd_sof_dsp_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240426-n-const-ops-var-v2-13-e553fe67ae82@kernel.org>
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
 h=from:subject:message-id; bh=CxPAgNjTAhKSrnJ9nXn8uxxa5Gyc46BCpw5S/shz4vw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmK24qWF6cO+604OtziJ/NJKVjNH2vRdMlOvKW2
 ZVeAFYdmmOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZituKgAKCRDBN2bmhouD
 19rmD/wJu4RJJ1iOkGW6XNvX7fpPFzE4tZjBrpuoS3aDYr+2SZnWCK8uN7kvowcs3ZzHaa07zym
 wIXdJ7M08Y+Za281aWLjxHXI6wPqXkaHGSj6kn5rW8ni5iRo/tHYZjoso8PINUSg3ShVlrbCp7M
 mswEjchbBIYjGArF8MBdepFCzThLrd6LrQGhysK8P7F/VlrkcQMip820lmk8TuxBVMEg1CalacB
 PqnIHGc2WFlhcSW9okNqYX3ZKby0a6o6iBNukbx4KoeXbQJiNyZ0UG2bdT2l/Z7Dwai+a8YJnT9
 zp6NGMVAa7ak5V6RcD+OUc8RjoVn+/Dd+gW7HDucLBAmFiALB1G+q+hDp5WOSpVgQPPnTo53D6g
 ze6s697K+wgmY7eeEp3jxrByXLzJelThlzthE9aParvGZXOcKtGyi4j+a96wRWBMuYBEzQCDQvp
 NCZBXC+VxYZ+v+jNuIByVwSjH3BZV57alL6v0k6SksyarACcCnWLBN7jNcULL4L+JzZ5OFpfeUC
 yzn75lDUrGRVU0l/YsQC/CsXz8mrzEfy1uzc5SQKU2hBWHtGp/uJbF2cW/x4vh2OyUvE2VB6icz
 aLvdXQvbaawFW2zCL4hBre7yFlBs9r1C3TmjQ0G/cLcum2nuKj3qWy1pt5tTLiVG8YSNheWyq9q
 XLK9ow2hSolnP8w==
X-Developer-Key: i=krzk@kernel.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_020632_511740_230D3E74 
X-CRM114-Status: GOOD (  11.82  )
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
2.43.0


