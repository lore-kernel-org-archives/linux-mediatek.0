Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3BCDC4345F
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Apr 2024 09:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8kMNvFAmt4eBoiTx2UA73GjEHtcM2vNP5WhvC1Bs/+w=; b=rNyLYE6MFTdYbgWeWShGj/zXKd
	3d9V6xhnqLgFHh3SHT24dTBqDGoGRB9CEqwlnkhuJ+DhhhWzL7SMPqB7RHKb0J7bW2/mBUCFjVeDm
	lJjeTA3AFtnh5W//EtX37DpDQ075Ikg8Xz4XGcUfCYHf3UvzNpj2LboCPmnEcxaPXaqCAAk3ZFOcm
	8k7d6EtbptBxxXngblU8P9O7eu7vjYTCBfRiCltCESuNFYJnkB5PR+XCS+5e9FrekThtj6bWntcNh
	b3EejYLbvrquIrJ5xzgnpwzBbDBPxxl9qi2lhPhAvNJV+UelnIVgyAKua5vtiUa67NN+rdae/qT4G
	rvkCkR7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0HYB-0000000Bpp4-2DhU;
	Fri, 26 Apr 2024 09:07:23 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0HXF-0000000BpDD-1vtj;
	Fri, 26 Apr 2024 09:06:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9C566CE1BA9;
	Fri, 26 Apr 2024 09:06:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE265C32782;
	Fri, 26 Apr 2024 09:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714122382;
	bh=isNUL/vRKVlQ1eZTCoLyvgGCM7+AWqSNXzyNZ1JAgVQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KUvDf75BZd3tzuPpW5Tnxnbr44RIL2v/DmbrRLu3PdZ8Dxh6zJk82m0r8J07rcV1w
	 XMckxQdjRKz9sJD/+4xEfnU3qNTlYgRzSckVD8RADQlRU1NuLKzsMvP945fkqmpDDI
	 WKb1Wxo18VLKdY/FJpKxDS8oPA8xD19tiewfpodTVY7yIFlQ4VOfMrfaeuKZ/LuZsU
	 oRpvp2ijuWAXAErToNXR+dw5c2Q8nDReEAYQzYw/zPO0EnYw3iQXThMSOVH7OPCfCT
	 xjFwo8GfkPAGLbSGRIS8PU0HAQOslH8CZiOKLYwSNypHdu0pUyZvZ/xe50XXgBnFT0
	 XtWyGQllwQryQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 26 Apr 2024 11:03:59 +0200
Subject: [PATCH v2 12/14] ASoC: SOF: intel: byt: Constify snd_sof_dsp_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240426-n-const-ops-var-v2-12-e553fe67ae82@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1100; i=krzk@kernel.org;
 h=from:subject:message-id; bh=isNUL/vRKVlQ1eZTCoLyvgGCM7+AWqSNXzyNZ1JAgVQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmK24p3G6kz61lcHobtIaDgPNnSnNLElP6yNqv4
 d5mde+9U/iJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZituKQAKCRDBN2bmhouD
 1xilD/9WzCd04U01VkyAG2Gv0122YqqRyfAcH+BtznzcxDG149CZ+DBfGS6C5ura8681PUqlSXq
 8WsrnaqcLskSYo/T52AAffi6x0T/2TFeVNMDz0FDYx2urhKEijhtVwJ8zwYwevs1/vsAUr3iwiu
 GTWXKSfU9FyLIR5SJtNAp2AiIgj+fJK8auNJPwfy/4Kc4ReLwDQqTQO0TUhTUIX875xl+sGGoIN
 tLq/xMrwdR1JzW7UN/LHl+P5SR2Snvvj9PuVNgNSTx9UG3povBp4fXEQfoWXaRhuCG7c5n5Cqso
 GA0dX3MKXIRXiPe+KPyxPVYcz6ramwBw15pF7q2vIsECMxTm2zi34I6VIh4PEf0px8vIUlcJqn+
 p7mPCR/+vrNZ0tXmzs3q2mveWAggxdgRK2khR4Asw+GGU8GJHvluDgdZLoHYm957PQsZIQu1/4a
 sSLrrMWW5yTytspZIKLdQsqV/A8I8dO9y+t5u+N/xwq89PDoxCzYeAzNt4t/szZDcFkFNQSFRAs
 Z20/8CDn4m+HCxTgMplFXdrdoytzDih3WVjIeV7ptAFvAZ/Oe6c/E0op3eFNFhEE+0rGouOcXbh
 G2AtqjqudqvPwwKBrdVesyTsNlEbEnBGazJUwhdatF1AGNt+XOsq3vq7UC2WREwKIRqvKeGcNBc
 j9TIfpJRzBRs1eQ==
X-Developer-Key: i=krzk@kernel.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_020625_982463_58D29742 
X-CRM114-Status: GOOD (  11.94  )
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
 sound/soc/sof/intel/byt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/byt.c b/sound/soc/sof/intel/byt.c
index 373527b206d7..14a065999a89 100644
--- a/sound/soc/sof/intel/byt.c
+++ b/sound/soc/sof/intel/byt.c
@@ -214,7 +214,7 @@ static int byt_acpi_probe(struct snd_sof_dev *sdev)
 }
 
 /* baytrail ops */
-static struct snd_sof_dsp_ops sof_byt_ops = {
+static const struct snd_sof_dsp_ops sof_byt_ops = {
 	/* device init */
 	.probe		= byt_acpi_probe,
 	.remove		= byt_remove,
@@ -289,7 +289,7 @@ static const struct sof_intel_dsp_desc byt_chip_info = {
 };
 
 /* cherrytrail and braswell ops */
-static struct snd_sof_dsp_ops sof_cht_ops = {
+static const struct snd_sof_dsp_ops sof_cht_ops = {
 	/* device init */
 	.probe		= byt_acpi_probe,
 	.remove		= byt_remove,

-- 
2.43.0


