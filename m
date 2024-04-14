Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 242B1C04FF8
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Apr 2024 18:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rhFUYQnd2UoHJ97keORYIcY4VVwoEJX2EE/tGJ7HBSk=; b=Dyeqg/3w51W1dmsW/kmo+/0Ibj
	xHGlaqwU0jTpX+9KoDOf7vfvjT30kYLWzSxgIMS7Iu7rjxJdsuFdn7s7z8hIu1dveSyX9LG/9iAPl
	58XnhyCBG/vzYWbFQHPZxlNUPsZxX+iQzawGNwLCS6+ob5WPf7j5MTldcf7hMYHgC86Uo/4Q0TiCj
	xTMlbURT5+XrT7nD6owtWHvt61vsYdEl5eYjzrKHd+0BuYkIabFkt/JqGj4i3OQSf785MJTxO2ywZ
	bJ+vXNEFUpQmpVOVJmhPiFSr8BEBcAjBEI9r+B7E7EKnt20H7IUvDhpFOpOAuiOg6N1CU7NvkBn24
	WHxXSBLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rw4vS-0000000694k-1EwK;
	Sun, 14 Apr 2024 18:50:02 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rw4ui-000000068Wp-0Bgx;
	Sun, 14 Apr 2024 18:49:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 21F9DCE069F;
	Sun, 14 Apr 2024 18:49:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29AD2C3277B;
	Sun, 14 Apr 2024 18:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713120553;
	bh=Db4WsSNM2FgoOQSGgEU4G93ggGnc3OdLIs1I7eFzzWE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VmS/9jlyQ4dccHlLXUaQHIkl1zQz5LAXsDlXSjtbsDu4aLEk3nOGz1aktC644SWOS
	 y33TIrNdE+g3Ze0eFdtUM/xU93SvPXSC991p2erQSZomhATgtVC4YuWHbC+Ut1ZbTb
	 4Igc1DZr6P3JstvjAzDKjq22aIztDWtO42G1C7Z7nSD00A/Xm6slmqbyK6ncrx+iae
	 BZ/FHCwhwenCUKQtxH5afBzPONqmCw6dLhJAKjjYVxDPoY/x0RvKafavlZ9r+SR11E
	 gMbk7h8YF9CSDtqe/f8SUxO8xvAg4v5pr9/bBfUBaJpoGppoUEBCcka+IN5lJZFB/d
	 PADRZ8PgFd8lA==
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Sun, 14 Apr 2024 20:47:36 +0200
Subject: [PATCH 11/14] ASoC: SOF: intel: bdw: Constify snd_sof_dsp_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240414-n-const-ops-var-v1-11-8f53ee5d981c@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=699; i=krzk@kernel.org;
 h=from:subject:message-id; bh=Db4WsSNM2FgoOQSGgEU4G93ggGnc3OdLIs1I7eFzzWE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmHCTNXyPnD1k9PhT0IGglQogIL0hIpkrjzGLbn
 fTJ1GhAAz+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZhwkzQAKCRDBN2bmhouD
 11o/D/4o/aVI6rNfgMctgSxzfRhCLSZE8MUPowQU6qt8JnDQXZCNgUGqXls89ap+m+sgna8TkUn
 C+Rw8fYNENZXviIemO9yqJirzRTqmIsID0whZ4Gj/++XWPshkF8Ruqb502ps0qg6hHfm44A1UL8
 vZ55c82xWdaO2sfoTUJruIs9+HO+X1eXlSDOi83q2nLekxwPxmvbctKx/OkgR5fitGIYmnukz6v
 0I1jr2l++iphrte5SJr9KXqALBYj/bZEdCiymT+2v/yxYbNDQ5G4EKYbNJHUw+k+K4Nro6VRZs6
 2CLUBqvGb5QvEzzT7xZg4AkI/eli0fCkJ/5OGPwkVpEiakyknR7RfYXPVp2mXsuF+nGMKsFVwM2
 198rpkov9I+yg9+PwJUAuA0z7V1bKY46I62kaeaOOdQPg7tkLYmfAsOdc/kiZKr6yYtc7ztPJkW
 8V08A2oZNAGz/Giqhu3RTPgU8uKrc5Tu9dVIVVgZyFMPoP+afiqAv/bnnaLE543O3d6hdizzANI
 ztTZ5zExCDDYnNywGeP7jxHBNzevpZRYuylv/AtIniOuTLHl+J+4A61CrV012dY30ssG0YN8Lb0
 vQDMuO9ApmJZP/mkzyynvkkzbFAircRrSG9Rlnzvq5fz6iPJ+8Wmkyex08xOZkPSxBHbVUaQ9SR
 fjgVeEn/HCCplxg==
X-Developer-Key: i=krzk@kernel.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240414_114916_593306_A7A5871F 
X-CRM114-Status: GOOD (  11.00  )
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
 sound/soc/sof/intel/bdw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/bdw.c b/sound/soc/sof/intel/bdw.c
index e30ca086f3f8..2e8926cd00f6 100644
--- a/sound/soc/sof/intel/bdw.c
+++ b/sound/soc/sof/intel/bdw.c
@@ -567,7 +567,7 @@ static struct snd_soc_dai_driver bdw_dai[] = {
 };
 
 /* broadwell ops */
-static struct snd_sof_dsp_ops sof_bdw_ops = {
+static const struct snd_sof_dsp_ops sof_bdw_ops = {
 	/*Device init */
 	.probe          = bdw_probe,
 

-- 
2.34.1


