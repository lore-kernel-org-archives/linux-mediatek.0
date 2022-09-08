Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE6CC38145
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Sep 2022 16:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gcCmYRukeps81wONOJofoJ8UzBg9xc6hHTeG3Tf3FgE=; b=Yal9ABSE3+npkKaDwxFYxFBvNs
	TSO7tZonXEk8aw/o+z+1znE6DTckyoXRPG8Hqw+EJyJW5cD7xhuxw2nHbASksXlz48EyUZSWHJ6eX
	rWK+kOWyCpTZWG1NQ2WwR8CGAex/d7R7DDvVNvxf7qXRb9jno5T71KrdoeTuTjOK85rwmyUSpCGA+
	th4EzfBBJC1e/CeiDbMV6FBU014u0gCnmDQu6hq8UIDnyD/oVnFMjO1hPOL3/Qq9t3hsKAtbg+K5k
	RAsUNVp7g+YnccRUvMm2PrzwUtmevH+Wl9kkw82ioC50fUiQTbP1DNf4YTgF5lM/XFEiug5XklEf1
	TSIcrNKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWKBD-005d3k-1t; Thu, 08 Sep 2022 16:15:03 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWK8U-005b9I-P0; Thu, 08 Sep 2022 16:12:16 +0000
Received: from notapiano.myfiosgateway.com (unknown [70.107.189.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1E3326601FAE;
	Thu,  8 Sep 2022 17:12:12 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1662653533;
	bh=oZmUg/3CYzDxISO0EVaOSkEiswwr+ZAd5SKGH9COfyY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c4YQgJBp8ARBFpRiZ/h1dvKhW93tKBPpiVYMWdmQa+Bn0zpuL3amXqTNvYUAU8ahD
	 yWGB2EeiXrt1MddjzbhAZZzDyH2E+FWt/cGtFIVq/grOJVtAF+BIY50XRiYICeAUxr
	 +R91qLSKisjIxhReL2EyYqPmZ//flVLwRIFA8R5q3YYTeqTQfDPuedZqxDju3lagcn
	 n8o9PywTdTf6bG20tUm46RAIVKs40aZs9dV+ILl5jwC0WUd1wpqA1dvqLKdwPEg3ox
	 /TG+aNmdCgo0qucwar2wNVhgdNpuWXEmwMkeqTL+ZoUInUdch7mst8hQHsrB/PgPLX
	 y2jLsioMSUetQ==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Chunxu Li <chunxu.li@mediatek.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 08/10] ASoC: mediatek: mt8186: Allow setting shared clocks from machine driver
Date: Thu,  8 Sep 2022 12:11:52 -0400
Message-Id: <20220908161154.648557-9-nfraprado@collabora.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220908161154.648557-1-nfraprado@collabora.com>
References: <20220908161154.648557-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_091214_969138_A3EBB4DE 
X-CRM114-Status: GOOD (  14.87  )
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

 sound/soc/mediatek/mt8186/mt8186-afe-common.h |  3 +++
 sound/soc/mediatek/mt8186/mt8186-dai-i2s.c    | 26 +++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-common.h b/sound/soc/mediatek/mt8186/mt8186-afe-common.h
index b8f03e1b7e49..d59258520995 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-common.h
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-common.h
@@ -189,6 +189,9 @@ unsigned int mt8186_rate_transform(struct device *dev,
 unsigned int mt8186_tdm_relatch_rate_transform(struct device *dev,
 					       unsigned int rate);
 
+int mt8186_dai_i2s_set_share(struct mtk_base_afe *afe, const char *main_i2s_name,
+			     const char *secondary_i2s_name);
+
 int mt8186_dai_set_priv(struct mtk_base_afe *afe, int id,
 			int priv_size, const void *priv_data);
 
diff --git a/sound/soc/mediatek/mt8186/mt8186-dai-i2s.c b/sound/soc/mediatek/mt8186/mt8186-dai-i2s.c
index e553a555d168..7e8cad682c83 100644
--- a/sound/soc/mediatek/mt8186/mt8186-dai-i2s.c
+++ b/sound/soc/mediatek/mt8186/mt8186-dai-i2s.c
@@ -1184,6 +1184,32 @@ static int mt8186_dai_i2s_get_share(struct mtk_base_afe *afe)
 	return 0;
 }
 
+/**
+ * mt8186_dai_i2s_set_share() - Set up I2S ports to share a single clock.
+ * @afe: Pointer to &struct mtk_base_afe
+ * @main_i2s_name: The name of the I2S port that will provide the clock
+ * @secondary_i2s_name: The name of the I2S port that will use this clock
+ */
+int mt8186_dai_i2s_set_share(struct mtk_base_afe *afe, const char *main_i2s_name,
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
+EXPORT_SYMBOL_GPL(mt8186_dai_i2s_set_share);
+
 static int mt8186_dai_i2s_set_priv(struct mtk_base_afe *afe)
 {
 	int i;
-- 
2.37.3


