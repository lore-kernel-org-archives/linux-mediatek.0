Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4213CA5FF0
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Oct 2026 11:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dtvWIRp9yO8uIIIbpOsaLthb3JvQZmMy0vJI9vWrQ+o=; b=VKnZeG+lI82LA6UEAFoOYxhWpd
	0/Mnyf6g9L40t46MyA2OTyiP2vnwArCjk3gU0Qmrq25ZItREL26Zbco7408HITobaa0Ir5WHLPiZT
	ScXZoycWnMCSfGAr5U/QsQTnCP6MlwFThHODH/KXqnxL4lmEkZN1/5ds0LgRNjViwOX51asX8HJkP
	/wIfPPnnCPp+V2noLyINymG4KT8wSwah9t4Ur9eV+eZ5quVbucARkRvH+NduUi0nx05CDHuzPbdU3
	VHa63p49VvOyjlp23/s35Snvk4AKURPmvxpUZ30l7WXP3gwgp+wXZIZwNJ+VnhBzgjeR7WfKTICM/
	TqHq+3KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgTa-0000000GGng-3fXA;
	Mon, 05 Oct 2026 11:03:22 +0000
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgTY-0000000GGlz-2Lfh
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Oct 2026 11:03:22 +0000
Received: by mail-pj2-x0f.google.com with SMTP id 98e67ed59e1d1-396ccc02279so903406a91.1
        for <linux-mediatek@lists.infradead.org>; Mon, 05 Oct 2026 04:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791198200; x=1791803000; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dtvWIRp9yO8uIIIbpOsaLthb3JvQZmMy0vJI9vWrQ+o=;
        b=THcZO1i0M66y9NJ9DJif5PdiJqkytEeGFhhV78M5BluAo+0oq4h+ZE2tc9vAA8kp1z
         yyi0rAssBQp6GrFwYUkaLRM+jKVzNOMa0Zxux6b1WCP84BIyyHgROtWOO8lKLVkabftA
         yDUswItHgq+6KO0HCCfq6FoR5BXBfkefmLH9nD4cxd3Ar+9AMzzmT3+CFhbGFhyvBbtw
         JQHVwqDya+D3tKGvMwdE+E3jcc1UQc7B/iT9C4wxtx1ZJOGv7o5DG5EArQ+a40I2O3D8
         +WL95X3Nv5dn2aAkwja70EbJbHbWZmGf8/4IjsJ/FpQ9QYzKRHK6u4uHnyh0MKUachmx
         eB2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198200; x=1791803000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dtvWIRp9yO8uIIIbpOsaLthb3JvQZmMy0vJI9vWrQ+o=;
        b=JG2FGaY4mRKu8bEUTaoM4u80Jl4g1XStfcfkGkIOiTxrL9R7/Vp1m52MFhgqOndzhm
         Mzcn1QqImcfa7u0sArm6N0XYk1TqH5XvJXNGD58FkCssGTfhdrobTEZCZaaIFGXQGcyv
         PO6D3KGxv2AOinWCebguPRt6UTdkdOFEg10OaaPZrtyJVvPxTjbcg1GHiw0UWn1CF54l
         hiTysDeltv8ANFq9prh+UHd4cj9pItVAV5A/2rWsVFb1iC7aa7uIB75VwnghMIkkFoun
         0gW+wRLeEvHortY0R2dHILRFSr24pzOawdzUBrgoeSvxWJtCI5C4rkD5ZBBeeSO1vvpg
         mlQA==
X-Forwarded-Encrypted: i=1; AKwUvByReMQj61jI3y8BQPcbMshE/bLuD/8Ky8LyFl0qqqITo4Jla/Q7/vvNxYNov8nFqhJc45abdIwdA5xbbY85Ug==@lists.infradead.org
X-Gm-Message-State: AFq9FYLuB0aH/yDx0K0mNhggQC0iaHh4hju9stct8Ci8C8TD8cpaZazf
	Ke6bn/B+bhvF0L/cQKPeZbLLFkJu2D04r0K2zPgFtP/tqTYOHNaJa+q/
X-Gm-Gg: AYBFou0Xg7xojWDyK4XvPLV1QvZgjCWcj0zuJNXrjz7luvX7m5KoZ50EYKd2heSiBEZ
	QSVTvdxHzkgjutbkXLiFHBKX/AS6YibwKXGQX51I+15hyuiiJEWIqTSDkdjxHSy5NlDlyEIzGZ3
	GpB1ZjARcgG80yEU/ZUcmhKaoOU/Qm7ugm4Nt1/aQKfh175JNoNmNhzCzmrmADzZQ7QWkNo6QWe
	lO31BV7LNUAj+TEHFsXbSOnse+bUHt3Lmo90XrOKv87NCo54um1VroEJ/0d9Qq1YJ5WuBpgqkgx
	B7BXjQBSQyvUa3+1nRxNaEErTQDsaKCi7BzHdSh6urHD2kqSTK5UUGNwgRUj8qU+zzV/UIyP4uf
	BNMqdTnFzQ9GeVlbiEykBO+kHgOtaTUoVi9pDXquGx54bIH3zvG+SybdnaHNFQfDOdipKyEvpj4
	nAFuWeRcL8n6HuGYYAur9KMc+e2VKrF3P5+I30G/vxdbZSOUl6v4dYX6AkjIxA3Kysp7cbYy8UJ
	h2kVRCLLRHwF/+KQYWqKPmOF5rJcWFHQBsrZhYoX3BB0dT5/NtFJQdNs9L0ZaQUaGs0XbvG2zFy
	b4cTXrc61GpIPw==
X-Received: by 2002:a17:90b:586e:b0:3a0:f5fe:74d9 with SMTP id 98e67ed59e1d1-3a6ce3a97e0mr9329608a91.4.1791198199561;
        Mon, 05 Oct 2026 04:03:19 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d334de5sm626498a12.11.2026.10.05.04.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:03:19 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>
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
Subject: [PATCH v2 01/14] ASoC: mediatek: mt8195: Fix tuner clock error handling
Date: Mon,  5 Oct 2026 18:02:44 +0700
Message-ID: <20261005110257.50145-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005110257.50145-1-phucduc.bui@gmail.com>
References: <20261005110257.50145-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_040320_940641_586E969F 
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


