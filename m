Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0FCDCC6B2A
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2026 11:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dtvWIRp9yO8uIIIbpOsaLthb3JvQZmMy0vJI9vWrQ+o=; b=JDEJuRdoCVkldX/AZqtofnr7yC
	G+CKnZdM5tMap8WXrVJJHxa7BEaTnJYPVEF6l/CP79Rv6d2S4n+DX1g/qpGInqSQP+yZ5pgTAGrTQ
	FvRjeeZE5vBGWQtmX3eikBSd91q1JcPCCKUpIrYQN62rR4IvEcCW+RNjwIYt2BVP93rjMjaQx18ir
	bY/JlQnpL61y0KyslYAauNAJFyiWbk/BvOBRCM+y148985e2QWL/gD956UesZOgZiZCZaKioOHnXr
	Six+hUdzz2/X58pW5/U1zppd5n3LN02FtM+vMa8z3uFQQjp6pEIrQEOy8j9ofoLk4ch/GWXvetdg+
	xdVxg0EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGx9k-0000000FJZN-3rTQ;
	Wed, 14 Oct 2026 11:28:24 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGx9f-0000000FJXP-2CGn
	for linux-mediatek@lists.infradead.org;
	Wed, 14 Oct 2026 11:28:23 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-ccc6b11a19aso1741984a12.0
        for <linux-mediatek@lists.infradead.org>; Wed, 14 Oct 2026 04:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977298; x=1792582098; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dtvWIRp9yO8uIIIbpOsaLthb3JvQZmMy0vJI9vWrQ+o=;
        b=L9vZxGSaqJTvwnVFTFs2nMYukUiNnWTYZHwkekOyx7rX4pV6RadNP1NHBJh2TVBKZE
         4zaG5+tcQikxbPZ1kQGafxQEHJF1vaQtlKss7taa3GAVi2Ws0G83TxTI9tiGbsYtdgid
         51OjfNx4bKnPk9cKeFI+6SJMeojBBKzE1FECI084JnUEmByqTs0KNnMdDtaOyNjCSGq/
         81HXoYY12WON92uQxM2EXQgTtlQSPM5UDwOYM5jpILjS7rbF55c6Ea9NhMM5Rg+wQpVw
         xeOS6dpDx1C0lMIcqfIuKzPROlOowIbIsfv3L6wha/HqwAlH0N/24j7aysreojBg/7bN
         Fwtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977298; x=1792582098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dtvWIRp9yO8uIIIbpOsaLthb3JvQZmMy0vJI9vWrQ+o=;
        b=Hbl0eE8qeev1d8II9XqEQbEZkE0oMrRLqUwzaPA2Q3nrFPCaMR/1Sj55WTV9c/q4tA
         LGSpVyi7X1bA4aVvTWSZ9JKA+PBDaLbTjfU+J8bzLkjzWF1Z+nLuOD2lFd7furHEa/SF
         UVPd4lEkZ+4tu9guKjdke2vNn632ArUfhkvNODE3sQ8HHZa0WO77UYOwVUnXkVqkgbKs
         +4R4mC0wUV/scaVTtdeQ9Y3F4UtQYB0+Pyo+r2zYAQhvKUyGfu5zfy6F38i/ZSBaWyEn
         Cf4LO/14jmxRbO3Zv0GPHA9V3Vaq8ap28HogJQHSyFxq12wmbJjQEUMWcVrG2sRQtcuB
         DSkQ==
X-Forwarded-Encrypted: i=1; AKwUvBzAE6ysddQXxEsV6iCnGOVwDebRhZZvqJfgaRQkqexfJd3Iz1P52wNtSej3TRmQI3wVx0i4exn2aV6fjT2GJA==@lists.infradead.org
X-Gm-Message-State: AFq9FYLlt5UrFIam9PDqb9lDU0KczcBCG/EODJJ8Ar0MxLwuwD4DpDu8
	pW23fHAxum9XCpzTIgrAnQZts8OHM2ylDzJsBv96JL4NJWNPUNC/qbVt
X-Gm-Gg: AYBFou2yCsLOTaFi+appN4/xTUt22dvNSuNhb5eoUORCPgiK0AtypHCYUBEeWOyicNX
	PgdI/qYa5L6ZDP5HoEd1HUu7JupGjft3gt5X0kI5VVEkL4LOL3eewYoXy7Wt2TAmBbIkI2NDvqz
	BuwtEZYzYXDTSFHezfFQ6YlKMR4ke6ALYToJNtBtaKAIA9UpltX0NFOMnvjtPybw5x/nvnQVufK
	T222uqAvTjqyh56m+Z6IGIqHF+JYxdnC+kciI+r8XbbCC7+h4b5MH0PvVho1FxFsEhQBADbCUnB
	m/JNYNGqV3Gc2KV52+XFuC2k/bzZVPXSPufuEyISNQ03SmnbID9ysN/mQjFXwttj7dliIaZjivJ
	JWU88gon81yEifITuf6pB3VLFQkXvYWFW8YUrdpoIpnt9FeQgticu6OAbAh/r77uFB/+vo8LP7L
	5T6GpwZWE4pf3/2IjhwI9HrKtgO6HWF/lmlnorzP77Gqbi584dN0HJZC7UQM2LDd6IKpQsKkwJh
	/snE4eBFIdgEf3EIezEy7+GxkQdqEBr+CNchSu4VqPSf0NRe0ueUR4AFLnvZbVfRzqc8QBsWyRx
	y62KNlmU8KiTHw==
X-Received: by 2002:a17:90b:4c52:b0:3ac:6c15:1173 with SMTP id 98e67ed59e1d1-3ac6c151496mr1396142a91.31.1791977298568;
        Wed, 14 Oct 2026 04:28:18 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac61171feesm4077076a91.17.2026.10.14.04.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:28:18 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 01/16] ASoC: mediatek: mt8195: Fix tuner clock error handling
Date: Wed, 14 Oct 2026 18:27:36 +0700
Message-ID: <20261014112752.683032-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014112752.683032-1-phucduc.bui@gmail.com>
References: <20261014112752.683032-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_042820_265249_BF7A31FB 
X-CRM114-Status: GOOD (  11.03  )
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

Check and propagate errors from mt8195_afe_enable_clk(). If enabling
the tuner clock fails, disable the previously enabled APLL clock.

Fixes: ff5a90173d98 ("ASoC: mediatek: mt8195: enable apll tuner")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c | 24 +++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
index 618d8400913a..ec1ea5b988ff 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
@@ -241,21 +241,35 @@ static int mt8195_afe_enable_tuner_clk(struct mtk_base_afe *afe,
 				       unsigned int id)
 {
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
+	int ret;
 
 	switch (id) {
 	case MT8195_AUD_PLL1:
-		mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL]);
-		mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL1_TUNER]);
+		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL]);
+		if (ret)
+			return ret;
+		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL1_TUNER]);
+		if (ret) {
+			mt8195_afe_disable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL]);
+			return ret;
+		}
 		break;
 	case MT8195_AUD_PLL2:
-		mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL2]);
-		mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL2_TUNER]);
+		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL2]);
+		if (ret)
+			return ret;
+		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL2_TUNER]);
+		if (ret) {
+			mt8195_afe_disable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL2]);
+			return ret;
+		}
 		break;
 	default:
+		ret = 0;
 		break;
 	}
 
-	return 0;
+	return ret;
 }
 
 static int mt8195_afe_disable_tuner_clk(struct mtk_base_afe *afe,
-- 
2.43.0


