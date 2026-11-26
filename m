Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1E0606A332
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 00:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Hli9VQZI;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j2T4kKvs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=3jjnoKoxZ/Ah8KqelO/HgAy4pxxgPAmKrGHB8qCbecE=; b=Hli9VQZI0EuXHGspHrbhevruDV
	IDwPUBDpPNMdB3FMLHPqHswyWFtESGxAucE/OEHoxoYPCSH9AUvuu05P7yKVpaNENbTjqZ9hJy+hL
	+jhlT4hOwHg08S1C0IDS3aHMAs/dMLBBFHimLe6WjXGZJX3BSNOFgfLofjV+DEq1cF7CV4siCpD6a
	f9uEruthpwjF5x8huhWMNVaaLrqgtBqhNkwLIqEFUc/Nag7uoVxV3PncnP3iHXVXKQT+zG9TZGW2Y
	LMUqYK4hEjqrjjeO0p+Q7Naw8S8mcOcn5IbY45LNVyShWub7mTRABwv27wct1fuGwcsASlx0u4GBn
	0XTtjiKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWN1R-0000000Bclu-2j6i;
	Thu, 26 Nov 2026 00:07:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWN1D-0000000BcfZ-0Z5s;
	Thu, 26 Nov 2026 00:07:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DE1C045EA0;
	Thu, 26 Nov 2026 00:07:18 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795651638;
	b=ZiCSoChWDqO0CbpD65dyAhuaSI6mnDfXEVY/tukQmdUPRgs4Hv7TYQne9c18rB32v57q
	 hqodVsYstDDQ+nO8MIFHqiUAp0YiVRc3nWmJEPFTNxTkXfw0IVfgNmhewrQmn/f7r3HX3
	 SZbX5nL13pErpTMz6EcKRiM9EsyYhrFIMWgxpbvNLtAqFRGtB7hlWstW5vRPZ+aF9xkGT
	 oubR4NWfhGBxJSlAQMcKFrhZsdYc7kCsjGkEZWwZd70NuSbndxwVfKNwZr2c6ZErZZ23x
	 UqjwbKqaMxrS6T99l/nlg5CV9eTDh9L29tkMJMcjiBaW1V3Uz6NOalZFpxOFGFsmY9Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795651638;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=3jjnoKoxZ/Ah8KqelO/HgAy4pxxgPAmKrGHB8qCbecE=;
	b=uXTqCbGFIRmRw82SsQebQV54c9xLNum1vPXfeBKKHRoompPHmsTlV1A8WVEIdDd2/Y83
	 YGiz+a42bxBMWjkbcj6d1F1ZpghkF22SCpiZyaI0uuh2shUll6K3TVICphu7bOjHHNC8u
	 FNqRVOMgEYtrUhd+Xyo21qhvqYa5z/v8tdRqm/LZFi5Vyj91RNa/KvBBPQk2bfDGMhQUS
	 de9ca7kPfJyQSAaZTtfmD8mK+lMwnmzRoycLLEs3Dts/I5Z/3o48z8fTbSA/u+Cug83SZ
	 pQOfIlXi/ROuRMcLcOBT0dUJHb8MuCsvC6crNjhFECipXMChTFljQR0q2CLYdt/elTg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DF3001F000C4;
	Thu, 26 Nov 2026 00:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795651638;
	bh=3jjnoKoxZ/Ah8KqelO/HgAy4pxxgPAmKrGHB8qCbecE=;
	h=From:To:Cc:Subject:Date:Reply-To;
	b=j2T4kKvsKGJuKHa0Z8E3lbkjPxSzsxE6YgtrJmnlb00zWk6DL9RKEmHQ/Zq55Rrwv
	 q1LDKlbrdGm1fYnNc0NK/AM9XU7kg+VS9vCdyCT36MQtkyHaZ07GrsN7ga9tPu3XS/
	 GVjXOc3Qy/UqB+eXeahAQohPTME4Np4qL4L7qkOsp64u0wJlQ5s+kxwkAEr2oW7pTO
	 o0kTB6LHBhJFT+eyYHhO/qS9P5X0PBPq0TaGb5CLQ8vBLcCslh1Zdf6YH437khadgh
	 fJApLvoif6Bo782ylxox9QmBXn0jZFGQoLtcVGQTTAR7orDLR5DR21xY/c5CXR2hoY
	 8xtjWI3U0zOsA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6B3EB4D0C8;
	Thu, 26 Nov 2026 00:07:09 +0000 (UTC)
From: Ilia Snezhkov via B4 Relay <devnull+iasnezhkov.gmail.com@kernel.org>
To: broonie@kernel.org, lgirdwood@gmail.com
Cc: perex@perex.cz, tiwai@suse.com, matthias.bgg@gmail.com, 
 angelogioacchino.delregno@collabora.com, linux-sound@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: mediatek: common: bound the memif lookup in
 mtk_afe_pcm_pointer()
Date: Thu, 26 Nov 2026 00:07:08 +0000
Message-Id: <20261126000708.15974-1-iasnezhkov@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795651628; l=2919;
 i=iasnezhkov@gmail.com; s=mindone2026; h=from:subject:message-id;
 bh=/MSilR+p9QlLbiiOAiffhnckpIPuLQJEn5v5/pYSrPg=;
 b=ZpWJEpubgE9tN5k9iITzX5MCuJ0E8v4Hefkrg+/4X+/g7f7N+BQsyxRJOAWDl8QQ8QvDAsL0R
 6lf0kbRmTs7DSyCS/14KARp2KBgP5HfWACViFMm0kVvWvKw7lPJQVgf
X-Developer-Key: i=iasnezhkov@gmail.com; a=ed25519;
 pk=hQgXfiWi4ukk2jh4BHu1vRVhg9BUivo//AFp50AKMag=
X-Endpoint-Received: by B4 Relay for iasnezhkov@gmail.com/mindone2026 with
 auth_id=1643
X-Original-From: Ilia Snezhkov <iasnezhkov@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Reply-To: iasnezhkov@gmail.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ilia Snezhkov <iasnezhkov@gmail.com>

mtk_afe_pcm_pointer() indexes afe->memif[] with the id of the front-end
CPU DAI. The hostless front ends registered by mt6797, mt8183 and mt8186
(e.g. MT8186_DAI_HOSTLESS_LPBK, MT8183_DAI_HOSTLESS_SPEECH) have ids at
or above the memif count, so their PCMs read past the end of the
afe->memif array and then dereference whatever memif->data that yields.

The pointer callback is reached whenever the PCM core updates the
hardware pointer of such a running stream, for instance through
SNDRV_PCM_IOCTL_HWSYNC, a status query or a read. On an MT6789 phone
with the same common code, capturing from the Hostless_Speech PCM
after starting it oopsed in mtk_afe_pcm_pointer() on a NULL memif->data.

A hostless front end has no memory interface and no position to report:
return 0 for a CPU DAI id outside the memif table.

Found on hardware and drafted with an AI coding assistant.

Fixes: 283b612429a2 ("ASoC: mediatek: implement mediatek common structure")
Signed-off-by: Ilia Snezhkov <iasnezhkov@gmail.com>
---

Notes:
    Observed with the downstream (MediaTek BSP-derived) copy of this file on an
    MT6789 phone running android17-6.18 (6.18.32): tinycap on the hostless
    speech PCM after start -> mtk_afe_pcm_pointer+0x60, NULL + 0x10. Our
    downstream fix also returns 0 for a memif without data; upstream every
    memif in range has data, so only the range check is needed here.
    Not reproduced on mt8183/mt8186 hardware; not compile-tested in this form.

 sound/soc/mediatek/common/mtk-afe-platform-driver.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-afe-platform-driver.c b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
index 7dd93d4..7877d80 100644
--- a/sound/soc/mediatek/common/mtk-afe-platform-driver.c
+++ b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
@@ -82,8 +82,8 @@ snd_pcm_uframes_t mtk_afe_pcm_pointer(struct snd_soc_component *component,
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
-	struct mtk_base_afe_memif *memif = &afe->memif[snd_soc_rtd_to_cpu(rtd, 0)->id];
-	const struct mtk_base_memif_data *memif_data = memif->data;
+	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
+	const struct mtk_base_memif_data *memif_data;
 	struct regmap *regmap = afe->regmap;
 	struct device *dev = afe->dev;
 	unsigned int hw_ptr_lower32 = 0, hw_ptr_upper32 = 0;
@@ -92,6 +92,11 @@ snd_pcm_uframes_t mtk_afe_pcm_pointer(struct snd_soc_component *component,
 	int ret;
 	unsigned long long pcm_ptr_bytes = 0;
 
+	if (id < 0 || id >= afe->memif_size)
+		return 0;
+
+	memif_data = afe->memif[id].data;
+
 	ret = regmap_read(regmap, memif_data->reg_ofs_cur, &hw_ptr_lower32);
 	if (ret) {
 		dev_err(dev, "%s hw_ptr_lower32 err\n", __func__);
-- 
2.54.0 (Apple Git-157)




