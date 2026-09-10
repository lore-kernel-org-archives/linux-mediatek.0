Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CBC1C79FB9
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2026 12:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DhFmxksn93jaqEPBP5cg3W4kPZXQ3iAg4tUPjfm3otE=; b=M9cUwM63Np2hq7EAkqey9BAafx
	LJsgVC15SWuUhNuOhFmuH/t3MHfk0GwW9iDqP42mKJ831zM4/DKvllgyZm2vM6Ta56c0l/T0I/ESe
	M3NEEP46jtw0O8phFH2ZDMEKldeZkXZ4R4IeHQCgC9o0h8yvPvY3Bstfza8+YfW3+JYS/6CLwhBA4
	QHjBaAEJ46UKJsxSMsYkkUUR9tDFjTrSJinzhZj4brxILMVJWCehIpqx9Zh9ZGLbatsNkBqWLmGy5
	GaI8tktDpd4iT54CJd3saaWE1OBO7FxM5cXQuyu0xSkp19F11gOFWPmUGmZ7BL2vHkHD7RzxwWOFJ
	rzRcjcqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eMI-0000000EOc3-1YEj;
	Thu, 10 Sep 2026 12:58:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eMG-0000000EOa8-3CRN
	for linux-mediatek@bombadil.infradead.org;
	Thu, 10 Sep 2026 12:58:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=DhFmxksn93jaqEPBP5cg3W4kPZXQ3iAg4tUPjfm3otE=; b=STOdbUbMnrCqWIewGVUywoV7Y9
	niuiQ7JT8LYo8wV2j49IedEd1FxfS6zM5sEzzywPfikm26lAbIgEBuHqaaNGXzomhaasVen12vbJ7
	lOMeNTvBYiJTpl5ow/H2HaU2sHuB2KT4QACCPhnbNwPZUvkJ1Hd4QG2KIeKRDDDLiBO9QmCmXyhDi
	2ldNXItBANcuXni0P6/kQjm1jYsGojawWQ3y6a1Fsh5gWrV6Y1iQ0ZrBuFXrTG1LrWKVZidPy4YA7
	aPs+FLNWekY9JsLyiWdDTuTj85upBPhmtx+rJ4+cRHep7AAhwAXYE3tEBh9wvFCi0Tk1kfc3xEsSm
	HAGCI/+A==;
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4eME-00000002UzC-01qD
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Sep 2026 12:58:27 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-381b831d535so11006948a91.0
        for <linux-mediatek@lists.infradead.org>; Thu, 10 Sep 2026 05:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789045104; x=1789649904; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DhFmxksn93jaqEPBP5cg3W4kPZXQ3iAg4tUPjfm3otE=;
        b=FI9eV6AzO7EeRv9fVR/Bd2SsD22yyr2C/fpzPRt+feqPawbPPM9rEas50c1jU12gW4
         wzrvCRPLXl+thlfrivvDEQ/Yb8PT2gVkkhOpft2in3UurMccBtOlTx7K6y8G9dHT7zIh
         9KfCvEvMqx4tNiHquJXBXLlX1H/ATlkMd8CgsTwpCvzkvrJNIgXX1ZJgVPMUS4VRqx/a
         gyoAGVDtcoRSwH8U+T5HxkSoO2jdPOJ8DwPCzxW43I4hjhCYoGWw0RODku0HNgvEwPD8
         wnMkszSXT4eOMCRdeoji6jOR4/+DrqkMN2OVKogbF67lGm1BvQ9RTp7IH9yu5EuR6WR3
         tviA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045104; x=1789649904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DhFmxksn93jaqEPBP5cg3W4kPZXQ3iAg4tUPjfm3otE=;
        b=MyTvNwEiB5J9+xz7CMUJyAgWL5+7yb8uv1fhdF6/bLaypzVZM606OC331jyjFmXyL1
         Emp2QeDtWky9WxWVYzLljTeiAH48/+lStAsVfdieg1LgnSADazuqZrGXDTrJyqGDoNJ6
         MKxNDiPSKs4mP9a85b2apoJ2c/BGTkUby+RO0cL1mnbIheW7fWQN9tFN9zwQ19ZjJejw
         H7pm7y5atKk6qhzuG+ParNZxnSapMJUO+Ijon75FCBrGy8hfaLxV9nMvoErSjkMVqwvq
         5cjKUd5M8ztBWNiODLjExnwlCosPgD5FU2rwPBU5J+BUmve2HQR1NGaZaYqCUeUu5Q2J
         0M+Q==
X-Forwarded-Encrypted: i=1; AKwUvBw2SRFehhQ+DpsArDcXxHhzRFF2mIwfRNWzxpmmTDkEIJSPoEftc6F6J4TY4lzTe5atuTse2v6N+LoF6Opi5g==@lists.infradead.org
X-Gm-Message-State: AFuF++mWCgM458GaL9qNA56KnVdGCTkPA+jJ45VGOnlSOKK5x5ZdzyX0
	v8cyp7rHJtPiHvwUUZDjd+ukN/IF4py+0tR8vuv0ZwL7z3FQL9OQJE7J
X-Gm-Gg: AYBFou1o2Gb6lroNhx+/tEaJczpmwQKKIrIHVUhUNyTFiVXkORgXplSlpji0fvUGKsl
	fYV3w7BAhHkhQDPtFgdS7KHONVX60pqqG7bGY0u8Hu8z8pgSPU+nyIw0cF3wwCJaaNye6YWH2XY
	hl4oILJedwlisfVfAGPvDw0OuJK/pGzHpb4CU1+8eRbaYSUrvrm6kNYnU8vGs+S/GJF5LoGC/9D
	rnnyLb2OU/Qd4wrZB2w1VxtQfJSY4C6/6rdT2rZ4RuH2Zj9QBKT0s02TA/2EbC96Yr+TTf3LxLl
	mH3VmzkObo67Qr+1QnxXliA8Gx5Xz+xqmc5VD35Qhy2v6SMY85u29IwsbYkN3xJMOI41S8tdso1
	a0XUq1ZLjF5MYHvUmfmAM38L3SMNdMAbcU632wCfWpwZcF2q196wdCgK0V5MLdbKyILGM0WiMgw
	YQVecJo10pcLQ4Hz6HKoN4gN/Cd/zQh0msV/ldy7FTdeVBOkztB2H3vuQWtaJpWWtiXvGgsmt66
	8AQQ2U7ypw12jqArVrLDBzkp5q9snQfYCuMj3jD9UCZyitdETZ9CsbXM95wDEjNXyfakUoqfxiN
	gzOjA6skDObPycc=
X-Received: by 2002:a17:90b:2e0e:b0:398:9be5:b419 with SMTP id 98e67ed59e1d1-39b2622bfecmr60688528a91.20.1789045103695;
        Thu, 10 Sep 2026 05:58:23 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e77b1afsm4891592a91.5.2026.09.10.05.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:58:23 -0700 (PDT)
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
Subject: [PATCH 05/13] ASoC: mediatek: mt8189: Propagate reg_rw clock errors
Date: Thu, 10 Sep 2026 19:57:34 +0700
Message-ID: <20260910125742.150902-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910125742.150902-1-phucduc.bui@gmail.com>
References: <20260910125742.150902-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_135826_247598_C1CD3AAD 
X-CRM114-Status: GOOD (  10.98  )
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
 sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 31 +++++++++++++++++-----
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
index 88f15a9c2513..435914aafb44 100644
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
+		goto err_audiointbus;
+
 	/* enable audio clock source */
-	mt8189_afe_enable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIO_H]);
-	mt8189_afe_set_clk_parent(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIO_H],
-				  afe_priv->clk[MT8189_CLK_TOP_CLK26M]);
+	ret = mt8189_afe_enable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIO_H]);
+	if (ret)
+		goto err_audiointbus;
+
+	ret = mt8189_afe_set_clk_parent(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIO_H],
+					afe_priv->clk[MT8189_CLK_TOP_CLK26M]);
+	if (ret)
+		goto err_audio_h;
 
 	return 0;
+
+err_audio_h:
+	mt8189_afe_disable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIO_H]);
+err_audiointbus:
+	mt8189_afe_disable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIOINTBUS]);
+
+	return ret;
 }
 
 int mt8189_afe_disable_reg_rw_clk(struct mtk_base_afe *afe)
-- 
2.43.0


