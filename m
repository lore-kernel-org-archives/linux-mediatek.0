Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3751AC83F03
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jul 2025 05:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qWoV/sNg/1IGTHeuvIWHPMclHob51Mndzoq4x5qcYnQ=; b=JRdUlDEPKcenGXePIzTkyNcCjU
	Y3+6xcBrDJyon5gEVJgb4hZSuhmSTRQx6f0NjqTKrLg+xETCENWZ+vrDD0ju5z5vCJYN+82kuu0XT
	McBgeB38t3hP1GQ83kzW7rquH26h/IEXpc2hr8vikGvQjnnH3efMJqQivyC31Ax4H/Cwc/7X+AhV0
	CJ4lkkGwAxz+rxo8x9pSF9HlbUZl+0G8ysDiqYs/H3/WkoyezPSY9KROLWMHKrAKp7KDCj128Y0KR
	o4p57gViYh53JEh+oL4DNSH0ucUs1N9afpx4Te2zGe6JA5WNdQMVCOroTUIs+b8Eb/7Nxzg5CArjp
	hbNyl4mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZNWk-00000007bZr-1dwP;
	Wed, 09 Jul 2025 05:39:30 +0000
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZNWh-00000007bXx-3j1U
	for linux-mediatek@lists.infradead.org;
	Wed, 09 Jul 2025 05:39:29 +0000
Received: from laptop.lan (unknown [125.33.216.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 027CF3F29C;
	Wed,  9 Jul 2025 05:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1752039561;
	bh=qWoV/sNg/1IGTHeuvIWHPMclHob51Mndzoq4x5qcYnQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=rMI/XRbPc0VOIsZrTz58/XuTSIszDFOwuA0j/3NvpstoZvTmSq72nx1oH+Re7+D3J
	 uCKSogZNFrNWwfctxjBYTFw5kHW7/giP8Q6SO1PpMmlQ/ZoNqfzahwFLGLFYi9FDDV
	 nwb4mukpCyioIEHJPsP1cLdAWXUCcrgbYAMOdjG72PRjoKITKagE3NKxQ0xnPtdJV4
	 UsIEa+5Os26MMovVPiTO1L0jNq+ilFDOnMA11DIeKTFFWDUcGYOFvBe9nNYDKYHsuE
	 0oZ0Kjb9NvQZClu2WSpSbpgECanihQp0er950DV7QYMmVlxcfNJ4w6ADxevDYYZHJE
	 lD/xZth+nFk1A==
From: Guoqing Jiang <guoqing.jiang@canonical.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	angelogioacchino.delregno@collabora.com,
	amergnat@baylibre.com
Cc: zoran.zhan@mediatek.com,
	guoqing.jiang@canonical.com,
	linux-sound@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: mediatek: mt8365-dai-i2s: pass correct size to mt8365_dai_set_priv
Date: Wed,  9 Jul 2025 13:39:00 +0800
Message-Id: <20250709053900.55171-1-guoqing.jiang@canonical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_223928_250059_358754E3 
X-CRM114-Status: GOOD (  10.36  )
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

Given mt8365_dai_set_priv allocate priv_size space to copy priv_data which
means we should pass mt8365_i2s_priv[i] or "struct mtk_afe_i2s_priv" instead
of afe_priv which has the size of "struct mt8365_afe_private".

Otherwise the KASAN complains about.

[   59.389765] BUG: KASAN: global-out-of-bounds in mt8365_dai_set_priv+0xc8/0x168 [snd_soc_mt8365_pcm]
...
[   59.394789] Call trace:
[   59.395167]  dump_backtrace+0xa0/0x128
[   59.395733]  show_stack+0x20/0x38
[   59.396238]  dump_stack_lvl+0xe8/0x148
[   59.396806]  print_report+0x37c/0x5e0
[   59.397358]  kasan_report+0xac/0xf8
[   59.397885]  kasan_check_range+0xe8/0x190
[   59.398485]  asan_memcpy+0x3c/0x98
[   59.399022]  mt8365_dai_set_priv+0xc8/0x168 [snd_soc_mt8365_pcm]
[   59.399928]  mt8365_dai_i2s_register+0x1e8/0x2b0 [snd_soc_mt8365_pcm]
[   59.400893]  mt8365_afe_pcm_dev_probe+0x4d0/0xdf0 [snd_soc_mt8365_pcm]
[   59.401873]  platform_probe+0xcc/0x228
[   59.402442]  really_probe+0x340/0x9e8
[   59.402992]  driver_probe_device+0x16c/0x3f8
[   59.403638]  driver_probe_device+0x64/0x1d8
[   59.404256]  driver_attach+0x1dc/0x4c8
[   59.404840]  bus_for_each_dev+0x100/0x190
[   59.405442]  driver_attach+0x44/0x68
[   59.405980]  bus_add_driver+0x23c/0x500
[   59.406550]  driver_register+0xf8/0x3d0
[   59.407122]  platform_driver_register+0x68/0x98
[   59.407810]  mt8365_afe_pcm_driver_init+0x2c/0xff8 [snd_soc_mt8365_pcm]

Fixes: 402bbb13a195 ("ASoC: mediatek: mt8365: Add I2S DAI support")
Signed-off-by: Guoqing Jiang <guoqing.jiang@canonical.com>
---
 sound/soc/mediatek/mt8365/mt8365-dai-i2s.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c b/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c
index cae51756cead..fbdc01e954c2 100644
--- a/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c
+++ b/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c
@@ -812,11 +812,10 @@ static const struct snd_soc_dapm_route mtk_dai_i2s_routes[] = {
 static int mt8365_dai_i2s_set_priv(struct mtk_base_afe *afe)
 {
 	int i, ret;
-	struct mt8365_afe_private *afe_priv = afe->platform_priv;
 
 	for (i = 0; i < DAI_I2S_NUM; i++) {
 		ret = mt8365_dai_set_priv(afe, mt8365_i2s_priv[i].id,
-					  sizeof(*afe_priv),
+					  sizeof(mt8365_i2s_priv[i])
 					  &mt8365_i2s_priv[i]);
 		if (ret)
 			return ret;
-- 
2.35.3


