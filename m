Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE1AC88E64
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2026 07:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B5j422sp7IgKzOpG0gt3MXA3l3kQYxqi7If+zAVtiI8=; b=f+lgw/LSptLCTM3sYTn8u3OJh2
	zB7gUmtXpS9VcagNx/IAxlZK7xzeUo4qBW7hXXwB2ameng+KLsSHVfUfmugQ27KlGp3uHWqx6d59U
	CzXUpsqs0AG32YpEzabNyWz17rMrrbBgzX/Lor1YEiqISjVsdm4ZyMZoOvjMuOOUkRsKT+LtS67Sc
	+ifAKQeI9BD0CLf0VVxS0A37a5vgG41VVFsHufYq99X5JbjEJZG054jRW4qWRAnzEOb/udY4g5Qzs
	hNk7RUDdx2+hQ6/RrBd6UVJ7yH7vbZqrPj7hxzouFarVJftW8eu6ZeJwg0HrABKL9ihfCvK5HePVv
	OkG+iAgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6182-00000002YPz-1WBY;
	Mon, 14 Sep 2026 07:29:26 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x617w-00000002YKW-2sN4
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Sep 2026 07:29:23 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso4493215a91.2
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Sep 2026 00:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789370960; x=1789975760; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B5j422sp7IgKzOpG0gt3MXA3l3kQYxqi7If+zAVtiI8=;
        b=ADcm1kuYFPdR0BYlDcmrZHm7j9poCGUY8K+7gTt8zSHM02YnIqYj9KCjCDuusnsU2l
         ee9NKF5D8nSEDn6zlXvdwtrkZ4aWWWDg27ZUse4s8+gEwIKXXykVSpImz1DnJGTIKCr6
         Uu7+GoGibqMu8iQ3WZdZ8qVwTs24jgmf6o0wI8oRx7bIa99vkwWaeiIAC3XIZm2bcyfI
         Ff2lRxu3u6hwc0bg357tl8xzoDVFWxpgVBFNLfrYzGd7U5f8NELEKI4tiLuzqjHRsJDP
         eU4iWES3U8PD8elWhi2YUU+xWTQk/8JTiAFFGLbdm9j4JyGmmEZJORbXZa+f8LAleWZw
         Hh3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789370960; x=1789975760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B5j422sp7IgKzOpG0gt3MXA3l3kQYxqi7If+zAVtiI8=;
        b=Hj293ubhG/wGwZ9NcddzkK8MwvydQdQqxjEukn0wDAuWhyAgm7/RHDfLmI+WBk6aK6
         oR8p7kWu+VCBZCJbY5NZwcstzrKBMz0o6c5CiyHxLNoaArYI282BQaiqo46w95voRQfo
         eFR7jVjqsTr1ixv239JW81GMFmXdopAjiqIn6NQHGrrbXPFHjZL3hIj3TYevR4yFz1Tf
         8r/Rq+G9qtcu5P64PpYraP41UHMu+16X2f3AeESpzaodC2oZzfs2hC+IUWsMH/LBBGC2
         mXGkyjBqW1ut2/W5ZrJuq9rSz+iqDmJUijVcdsrvlHeAAX9oOAedWdU+u7cZsby5wBR7
         fCJg==
X-Forwarded-Encrypted: i=1; AKwUvBzgKzhDZvCpYs8AM2/dNvdiISdaHPpM+9rY5aW0j8K/J1atKOT6CiakrV6jYjty1SOfiV0lZLzjAS7DVq6jmA==@lists.infradead.org
X-Gm-Message-State: AFuF++neynXLsLvb9uCdLruWtdlt8bqe5HhXEGXth66pnjualLpVNS8d
	qO/SUEfuqT8nbSvwr1bEUUoi4kafVy/T/h4rnCzmyCtq0YWOMAE1dhOx
X-Gm-Gg: AYBFou3v0fQbNhw4YfpaC00hT6/DszAei3x4Swmn4dH7ZpSeCXXRkytnAuAv9JYC/pj
	BeCtY9XcgbwE2EplHRWNqxWUzCGLyG+muHIl5/1vpfKdAhdkVqDLwntGGZQvsP1JfsYxGQxw0vP
	/jPvlS6YgKyNazpma1I3J8G6CemtS2tFrQHz5SFc2fec9I807oXwlpRUjT7povZh6ThwvPqrkFS
	fCxbCPDNTxtJdwSUsvmbje8DXr0gLZOSD7u82oCkZieLVAPZUdtwawTWrObTQ7wpBc/qnXsyQiq
	1On2xMrOfib8U3m3uhb0VjLSa57XpSB7o0UjXzygOTRKdM8jiWB1KSY4D+MbOipv311oLVlb9UP
	pO7izdxyYaPwMLJcBpNF4CKEf8Qt7ixqSRKTdEcgm79f2k2QDKA5W+qDgIttkjzIsmCj8Lb7q+E
	hFomqHvpZBIld/oMtgk5PAYW4oqjAHNie9uzg0Ww2WXIGE1wW1kh7Do/FK0hXCQ9OnZckkSmZdb
	slZXNEF23JIijLtbcU1UE8S5SxNXRISVbErNlamdw3NHd1xw4tazmK1tPonJB0PAfq7NByOsw5n
	KPM9qhv1kNdDZUU=
X-Received: by 2002:a17:90b:4984:b0:39d:f61d:7ca6 with SMTP id 98e67ed59e1d1-39df61d7d1bmr9021a91.15.1789370959820;
        Mon, 14 Sep 2026 00:29:19 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d957131f9sm19598245a91.12.2026.09.14.00.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:29:19 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Dan Carpenter <error27@gmail.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 05/13] ASoC: mediatek: mt8189: Propagate reg_rw clock errors
Date: Mon, 14 Sep 2026 14:28:34 +0700
Message-ID: <20260914072842.24420-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914072842.24420-1-phucduc.bui@gmail.com>
References: <20260914072842.24420-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_002922_304210_AFAF7583 
X-CRM114-Status: GOOD (  11.56  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

mt8189_afe_enable_reg_rw_clk() currently ignores errors from clock
enable and parent operations.

Propagate these errors and clean up the clocks before returning the
error.

Fixes: dc637ffeed6c ("ASoC: mediatek: mt8189: support audio clock control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Update the names of the goto labels.

 sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 31 +++++++++++++++++-----
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
index 69aa3715c19e..173ee0709b16 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
@@ -700,17 +700,36 @@ int mt8189_mck_disable(struct mtk_base_afe *afe, int mck_id)
 int mt8189_afe_enable_reg_rw_clk(struct mtk_base_afe *afe)
 {
 	struct mt8189_afe_private *afe_priv = afe->platform_priv;
+	int ret;
 
 	/* bus clock for AFE internal access, like AFE SRAM */
-	mt8189_afe_enable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIOINTBUS]);
-	mt8189_afe_set_clk_parent(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIOINTBUS],
-				  afe_priv->clk[MT8189_CLK_TOP_CLK26M]);
+	ret = mt8189_afe_enable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIOINTBUS]);
+	if (ret)
+		return ret;
+
+	ret = mt8189_afe_set_clk_parent(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIOINTBUS],
+					afe_priv->clk[MT8189_CLK_TOP_CLK26M]);
+	if (ret)
+		goto err_disable_audiointbus_clk;
+
 	/* enable audio clock source */
-	mt8189_afe_enable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIO_H]);
-	mt8189_afe_set_clk_parent(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIO_H],
-				  afe_priv->clk[MT8189_CLK_TOP_CLK26M]);
+	ret = mt8189_afe_enable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIO_H]);
+	if (ret)
+		goto err_disable_audiointbus_clk;
+
+	ret = mt8189_afe_set_clk_parent(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIO_H],
+					afe_priv->clk[MT8189_CLK_TOP_CLK26M]);
+	if (ret)
+		goto err_disable_audio_h_clk;
 
 	return 0;
+
+err_disable_audio_h_clk:
+	mt8189_afe_disable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIO_H]);
+err_disable_audiointbus_clk:
+	mt8189_afe_disable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIOINTBUS]);
+
+	return ret;
 }
 
 int mt8189_afe_disable_reg_rw_clk(struct mtk_base_afe *afe)
-- 
2.43.0


