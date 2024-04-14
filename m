Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAC4BC4345F
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Apr 2024 18:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=npq1jl/AVKseRY0C2bNNrXDsO9CF0NyEW/U8M7Dna8k=; b=y1Ua5XLq7wft/Fnwo4LTRKrXZ3
	J94zCbSgQXZvinpJ41Ruwi+w4kpqzug4pIYWU1t4TNI8HLGaS37vd3TBlSWsUYkF//5lNxW8iqy/2
	QFYUEklN3k+SkullAuWDWQjkEdozD5bLfJ3tjaSeLoNnPaQjNKvJN1dKVeCJ3v14a273ZvejDsMK7
	17Z01FAiUhSfKH6iuN2T2pap1wZ1AUCeDGerN28Y9AYyQedEvaTW7V6hn0Y9uHg47ZrV4YeNsbC4u
	PEiXb9vSLk8YW4caeERWtXSfeKyfL1a3gm/7UQhvw7QvYDWigCKuK8hRFxwTDpsmG4ORFXzs5NN2M
	yyN0wyeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rw4vd-000000069CY-0TqZ;
	Sun, 14 Apr 2024 18:50:13 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rw4uo-000000068cA-355X;
	Sun, 14 Apr 2024 18:49:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C4A82CE069F;
	Sun, 14 Apr 2024 18:49:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ACB5C072AA;
	Sun, 14 Apr 2024 18:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713120560;
	bh=HDCjdUZ9nbqoLbalVPVe/UT1SONcMJH2I6HWQBc1Bwg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=D4UezHTK7gkYSB8U6BP8dGprcFYlx6MXcQcpiIzrnlGi6/cU5fo+9FSsCxX+8YQT1
	 ICz+VHyKvRbQedDXb+hZ/BiPZjYWtb61XAUQ1RcwwDkWcuViR2PFotNitqgUkVxg5E
	 UZaguPyyN6f3pfg5gNXoabh7xY3uKe1OA/dtJtjEu5M2NQJjC0jEehJ8foJeBV1L6A
	 aj3ZlJmhtbccpoKMwjDJ7/6P16FaJcuS0ECCJCyQk+TI3TzM2/oNsMdXu7w3QEGETd
	 zsxayGMGN8DxkdU59fDgtoGl7dPLOTMCNymOIcl8O4bu91QV7TRsy62q3n8b8nHbuR
	 y4PsfImOyuRow==
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Sun, 14 Apr 2024 20:47:37 +0200
Subject: [PATCH 12/14] ASoC: SOF: intel: byt: Constify snd_sof_dsp_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240414-n-const-ops-var-v1-12-8f53ee5d981c@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1028; i=krzk@kernel.org;
 h=from:subject:message-id; bh=HDCjdUZ9nbqoLbalVPVe/UT1SONcMJH2I6HWQBc1Bwg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmHCTOgSv/AebgOX4MZvM+Uh75zPZ0Rvctqm5Kz
 AmlxIeXz5yJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZhwkzgAKCRDBN2bmhouD
 1y/6D/4z/POCI8W7rkjUkLA0M+QsTfEAS2ki1DPELX7wk/YqHgSOolz78b1M7laKFW2+QCZW4fV
 rKZ3oGlTY8sxvrDOkjRcE2/L9LGcQyaZvtafXCvBF7OobozCO2KLn1P9Tz82SoU7L51UGPfUzbv
 DBwEL+8qzHNL2vKBy2ELBepSeb44RvlsQ8bY33CnW8oZUqcnNoYI6SU0ks81RpX7YVO8e3NDIQT
 aOQRvs/RJ7GsxZhWBlR0BCsStYo0f3bo0i0JrzuBgnim3bsr4+/FikmTT5J8aAPctCo4a7ar5rk
 ftqk8nL+M1zF4gmFEFBpqmeeuHEvypXA59P60SGLzqV3ju904VAGx3769t43JH5Z/MEmZvfm73B
 U/AG+h+2d3l0bGCEev6eD6hdC6/cu1KBpoQqhnmb6owYg9sXOno1dfaPHr5fWL38gT74USUCZzu
 j6xyrbRvMVKIvIoLr6StR35+Ah2VFi081knqkJNWghEd2wEOjYPCmtAd50O0RYIBZTVKijDU0S7
 7mJxwJKCBfhAOELf1Ll+r9VL85TXwThvz6r1tP60Ix0IVilM7I4r/+BoLtCJNe/bhbxwyG4ps3D
 wNSoXzLjeFdVFZ8fYdBpZDFtwkS3HDtDKgaqTFdGsr4N0wgpdm04zgh57ciWanELUhIIkDku441
 NFAEvaNp4sgXogA==
X-Developer-Key: i=krzk@kernel.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240414_114923_629541_7DAC5286 
X-CRM114-Status: GOOD (  11.38  )
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
2.34.1


