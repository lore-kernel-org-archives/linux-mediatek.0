Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0CAAC83F17
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Jul 2025 01:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wvXX3+98b9csWyA6dkKmj1aJ7aZiKSOMpW9t77vrV88=; b=a5FAQ9dJz0cHPybDUF9O5TtWll
	MTiCyaA6JQWSfbUgPR6wBaZrZ3il34mMdUwKS408NBacffsQXDFpxyaapOUZaXOJY4zBTXWIs5xqb
	C8IqFjl8L/EKhDpc4tU/v7rmBvLGD4OViKA4PF16Nmny6c0ZXbxylwBuySkQaMmBbWeWSXYJ6aPuT
	JziGEJ1RBKpeQNDioWsgf/MVzFR3EuEPmD1slKbXougMxn9KEVVxZ5DO9zeC9NydUHz8wg6S75PwW
	Q3jXFaXNZQV7SYL78q+CSvUwVXopooIa5kkHBAHVEbMwIEK3T/ytUgkKoTHs9giTAUVevJ9KojzHn
	neXkdbfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZfvX-0000000APX5-48qi;
	Thu, 10 Jul 2025 01:18:19 +0000
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZfvV-0000000APWg-2rPl
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Jul 2025 01:18:19 +0000
Received: from laptop.lan (unknown [123.123.45.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 299183F6D4;
	Thu, 10 Jul 2025 01:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1752110295;
	bh=wvXX3+98b9csWyA6dkKmj1aJ7aZiKSOMpW9t77vrV88=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=Ri8SbPqWN+8sNA2eSG1ZrBs8nnTbhVJj4L/h1Ei8ODqA7rl5uMPibgt/t2ApkOVZs
	 1thpTWO7rPzv3GviGAubZHFsrDQv3UHwvBWskn43uyITe/1Yk+e29OI+GFpgmOCEhy
	 +GligoP3K6XD99BV8G6DluC9bgxkivdvTDk2gN5Ev5qrcneCTeJHbmE99C+fYV9AxI
	 AoWGuMfKQbJ+r61jxDMnvtSaqIzPrhH4MCDB5lMrj2adlej0CAX49k4VVITKAGGaBf
	 DhBYgVW2VLSq870ENxViVrSoZ0nI+024t2Za8NtyhrsZ5JJHSCM4CkX/c/aGhL8WKA
	 Wwwet6O9hW1iw==
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
Subject: [PATCH V2] ASoC: mediatek: mt8365-dai-i2s: pass correct size to mt8365_dai_set_priv
Date: Thu, 10 Jul 2025 09:18:06 +0800
Message-Id: <20250710011806.134507-1-guoqing.jiang@canonical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_181818_038333_9EFCAE45 
X-CRM114-Status: GOOD (  10.88  )
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
means we should pass mt8365_i2s_priv[i] or "struct mtk_afe_i2s_priv"
instead of afe_priv which has the size of "struct mt8365_afe_private".

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
V2:
1. fix issue reported by lkp, thanks.

 sound/soc/mediatek/mt8365/mt8365-dai-i2s.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c b/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c
index cae51756cead..cb9beb172ed5 100644
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
+					  sizeof(mt8365_i2s_priv[i]),
 					  &mt8365_i2s_priv[i]);
 		if (ret)
 			return ret;
-- 
2.34.1


