Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5C68C6FA86
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Sep 2022 16:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RiN5Qovx5bX7stjavX+/jQMS0B0arMM5sqC6dbseEik=; b=GBZ/b5PrW6WqwSBQWgPBTx9cKq
	tw3fl8dsU3MQfs9r4Dl49SFensocB72umtfTdV9icr+FhcPfeQD7ZmhJc2ARP+XBfn3zSc82jHXkH
	DM58nxoU5YXMuJvPbKGXbT1/sN10W43Np53DkUDzNehtPDVWtbmLsI8o+OhTkITR1lDuDDSbHLx4U
	TYAl63n0dGXrVbby+IVMwB8ANhgQKIgA/K2AkJ00z6mOckRaRIq+3ROQ7A/pZXmkiftYZjAcK9z9h
	B/VichtK0cQ0LHeifT7jSNko9veASbfS5WhA3U+Rk0FcPkJoXa4MwnOgnkcLsvRK9yn1UrHBmygS6
	VEaUmqIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWK8l-005bKX-I6; Thu, 08 Sep 2022 16:12:31 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWK8N-005b2k-SC; Thu, 08 Sep 2022 16:12:09 +0000
Received: from notapiano.myfiosgateway.com (unknown [70.107.189.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DF1B46601FAB;
	Thu,  8 Sep 2022 17:12:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1662653522;
	bh=1WqDXB6TtMeZzZFF3fs3733gWICaFEYhBDZ7cjhR2OA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ud2KDDIOyNnhmTMC9QXzaAgg+/iyYCs8GWhqGH7L139TirmExcqzaQPID3SD88/pq
	 JbOZbqjrA9uDtl99WJpvwrP8Oztap+Z1qt5e3YO85H9/iCAtsJU+kiKpBUiZuEQnwZ
	 wMbZK0oAAYiopT6Dxo6FiSj2Kou3dLPhv9owaoaySS5P6SPTDOf918+6WxOe8PPW5J
	 29YYUqM9+RzCosGHrbJMeSvPC3ugl5x37rIKUhCGx3AFJTgemtE2jHY4DKqZWmjEDL
	 E0sdWpcyAQ3x2UiMF7xBBUZtjw6QiYysOe3qUql4mPiEwf0eeT/UC3uu4ASl2RAh12
	 kUK0UlJdhVIdA==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 01/10] ASoC: mediatek: mt8192: Allow setting shared clocks from machine driver
Date: Thu,  8 Sep 2022 12:11:45 -0400
Message-Id: <20220908161154.648557-2-nfraprado@collabora.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220908161154.648557-1-nfraprado@collabora.com>
References: <20220908161154.648557-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_091208_092529_B9B523FC 
X-CRM114-Status: GOOD (  14.68  )
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

Add a new function to configure the shared clock between two i2s ports,
and export it. This will allow the clock sharing to be set from the
machine driver instead of the devicetree.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

 sound/soc/mediatek/mt8192/mt8192-afe-common.h |  3 +++
 sound/soc/mediatek/mt8192/mt8192-dai-i2s.c    | 26 +++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-common.h b/sound/soc/mediatek/mt8192/mt8192-afe-common.h
index d55eff46cc7f..ad461dcb6ee1 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-common.h
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-common.h
@@ -159,6 +159,9 @@ int mt8192_dai_src_register(struct mtk_base_afe *afe);
 int mt8192_dai_pcm_register(struct mtk_base_afe *afe);
 int mt8192_dai_tdm_register(struct mtk_base_afe *afe);
 
+int mt8192_dai_i2s_set_share(struct mtk_base_afe *afe, const char *main_i2s_name,
+			     const char *secondary_i2s_name);
+
 unsigned int mt8192_general_rate_transform(struct device *dev,
 					   unsigned int rate);
 unsigned int mt8192_rate_transform(struct device *dev,
diff --git a/sound/soc/mediatek/mt8192/mt8192-dai-i2s.c b/sound/soc/mediatek/mt8192/mt8192-dai-i2s.c
index 5b29340f9516..630ed7261fc3 100644
--- a/sound/soc/mediatek/mt8192/mt8192-dai-i2s.c
+++ b/sound/soc/mediatek/mt8192/mt8192-dai-i2s.c
@@ -2057,6 +2057,32 @@ static int mt8192_dai_i2s_get_share(struct mtk_base_afe *afe)
 	return 0;
 }
 
+/**
+ * mt8192_dai_i2s_set_share() - Set up I2S ports to share a single clock.
+ * @afe: Pointer to &struct mtk_base_afe
+ * @main_i2s_name: The name of the I2S port that will provide the clock
+ * @secondary_i2s_name: The name of the I2S port that will use this clock
+ */
+int mt8192_dai_i2s_set_share(struct mtk_base_afe *afe, const char *main_i2s_name,
+			     const char *secondary_i2s_name)
+{
+	struct mtk_afe_i2s_priv *secondary_i2s_priv;
+	int main_i2s_id;
+
+	secondary_i2s_priv = get_i2s_priv_by_name(afe, secondary_i2s_name);
+	if (!secondary_i2s_priv)
+		return -EINVAL;
+
+	main_i2s_id = get_i2s_id_by_name(afe, main_i2s_name);
+	if (main_i2s_id < 0)
+		return main_i2s_id;
+
+	secondary_i2s_priv->share_i2s_id = main_i2s_id;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mt8192_dai_i2s_set_share);
+
 static int mt8192_dai_i2s_set_priv(struct mtk_base_afe *afe)
 {
 	int i;
-- 
2.37.3


