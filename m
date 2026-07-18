Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F442C4450A
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Jul 2026 17:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6YMhhx6SFZqCgPSuG3unYR85mgfQTMBVDiqwJF5pJ7w=; b=F/5gwL6BT77foXjdsEyzr43X+w
	8PFC1mA2dAhFSmU/ClZy+Vvn2mjMK6OklQaAk3YS8FRHcjHnD6qoN9tbHXzM8lCJvBQck35e7VA5k
	l1mIV8lLvqVxQVazIkNSYOE1tvkshuTd4Reb+PRevqFOfnomBD8/mJHdi5jJOidb9P/xhGFtmPMrb
	FFdSWUnIuEqwsJXDjDhu8BMn4FdY+3Bnyrv3u6Lo0fV5IiRoZBDZWMTyzP4gTsgFKlghFesLVzq0R
	zwoWRpEpjsQlKyIpum8N9ZHne35+teZ614IgDgoo5yJAWixOfIC4g+DCrgMDAPxSG6p8ozdyDLX2m
	fmRfLnNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl8wA-00000004Prl-1mUN;
	Sat, 18 Jul 2026 17:34:54 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl8w7-00000004PrF-3tsQ;
	Sat, 18 Jul 2026 17:34:53 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wl8w2-0000000083K-0eK0;
	Sat, 18 Jul 2026 17:34:46 +0000
Date: Sat, 18 Jul 2026 18:34:42 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] ASoC: topology: Guard against out-of-range mixer control
 shift
Message-ID: <fb5d83513eda68578f0275b7fa274f172c08a0b1.1784395999.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260718_103452_256671_E4F3AECA 
X-CRM114-Status: GOOD (  11.41  )
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

soc_tplg_control_dmixer_create() copies the per-channel "shift" field from
the topology file verbatim into struct soc_mixer_control. That value is
later used as a shift amount in soc_get_volsw() / soc_put_volsw() (e.g.
"reg_val >> shift" and "mask << shift"). Topology data is loaded from an
untrusted firmware file, and a shift >= 32 (the width of the register
value) is undefined behaviour when applied.

This is not hypothetical: mediatek/sof-tplg/sof-mt8186.tplg from
linux-firmware contains a control whose channel shift is 0x01000000, so
every read of that control (e.g. from alsamixer) emits:

  UBSAN: shift-out-of-bounds in sound/soc/soc-ops.c:117:21
  shift exponent 16777216 is too large for 32-bit type 'unsigned int'

tplg_chan_get_shift() can also return -EINVAL when no matching channel is
found, which becomes a large value once stored in the unsigned shift
field; the same guard covers that case.

Clamp an out-of-range shift to 0 and warn, so the rest of the card stays
usable instead of failing the whole topology load.

Fixes: 8a9782346dcc ("ASoC: topology: Add topology core")
Cc: stable@vger.kernel.org
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 sound/soc/soc-topology.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 35cbe29d2275..dd94eb9460d3 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -672,6 +672,16 @@ static int soc_tplg_control_dmixer_create(struct soc_tplg *tplg, struct snd_kcon
 	sm->shift = tplg_chan_get_shift(tplg, mc->channel, SNDRV_CHMAP_FL);
 	sm->rshift = tplg_chan_get_shift(tplg, mc->channel, SNDRV_CHMAP_FR);
 
+	if (sm->shift >= 32 || sm->rshift >= 32) {
+		dev_warn(tplg->dev,
+			 "ASoC: out-of-range shift for control %s, clamping to 0\n",
+			 mc->hdr.name);
+		if (sm->shift >= 32)
+			sm->shift = 0;
+		if (sm->rshift >= 32)
+			sm->rshift = 0;
+	}
+
 	sm->max = le32_to_cpu(mc->max);
 	sm->min = le32_to_cpu(mc->min);
 	sm->invert = le32_to_cpu(mc->invert);

base-commit: 0718283ab28bc3907e10b61a6b4be6fefa1cbb2f
-- 
2.55.0

