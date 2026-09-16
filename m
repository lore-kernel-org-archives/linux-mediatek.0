Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87007C88E7D
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2026 05:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cdugvJNqgU6E7j1wDJGENADgIVNNhusm8dqwAWIMj0U=; b=hpSTXX/pNr+XL9xYVAtsj1qhl6
	y2hsby6MZqSoLJyrRNArjepibqF8H9d0lvMdjDTv9RUU6XtozVZB0lAg8UDuXLhxd6opJ0VdkyfFU
	PDXlZKQKQAr7DnWLdjG3K9sLPEY4xNmNPiEdALRBRdmSq7X83WEkyeRk7gKZmj4xnrAkr0C5zhtTq
	wSWQpfDd8/DjviTCEyC8zMsNRNj2Qjt8l0Eg6qcoF46qz9uQg2ecqTGB3jhHAIVJLr4iL5CH8KeZ8
	78t0JzmX7AaRm73k6gJBOF+pw4Jy8Y+ye8Bn53U7xHU78WmdxLAaNWjmCiYwJPFkr2CoQTV4qR1fK
	x2/SaE9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6hlj-00000008LKx-1R13;
	Wed, 16 Sep 2026 05:01:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6hlf-00000008LH9-02mh
	for linux-mediatek@bombadil.infradead.org;
	Wed, 16 Sep 2026 05:01:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=cdugvJNqgU6E7j1wDJGENADgIVNNhusm8dqwAWIMj0U=; b=pVCM9NcZysT+/LtUXh+VNpfiZs
	qPnd1uttvF2cG+VnCgWbinaaUSlmZOTaSQ89U1w7jzAKtpceYqQW02bp+fxFKmmLCGWKIEqywpJi/
	pAd5WQ9BH+sDQgWUzsZZTO3N1BAaaPnyr3iZmnG1KqC3pRMNpzBFdI9ags3e0W8XZc3xHJEUejwpF
	lmRSdXDoRnZ5JVAeSycH0rXGLLK/bKoKXwba7PeGXP1wcUJ/nd5hcrZXeYF/Jrg/SYTOKgaibVyfq
	9gv79cwzav1daj06gYySzE0dBugp7VzPiK+b4Rlh0GZ7CqAu8Bphc95eQwK142HfuZrfLtdt1FR4I
	9aay1yWQ==;
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6hlb-00000007UKW-24Yv
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Sep 2026 05:01:09 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc1cea50dc3so406841a12.3
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Sep 2026 22:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789534866; x=1790139666; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cdugvJNqgU6E7j1wDJGENADgIVNNhusm8dqwAWIMj0U=;
        b=MeMY0YYui4ug7DclwkcJElQs7pKEyjOM6CoCzU0zEuk2pb2GVsBkGsbAgP3Y1FAy7e
         GfBkaUmRhcJe6CooI4s7/3zLFq5EMl13YgHOI2ydsp0el00dbzXS6uN8rEt5u0VeHS0h
         KxafgOeDpVRj+JKNstYZjiI2LxHCXF4yWQMmrSFPeIlOXybHIl+eaPhE30uhqE55xNn8
         e/5CNQ3ZWfcwU4IpEQ++scfgovE0H0LmBSuRctWpnXkp+JLr4Ie/+gbOnktJ0BFOf0mP
         Q25lBVxINNIUC7ojeJG7JG4qQzxenfnI+i7+HwTZtxpu9jetspOUUXEenBIUQnHALDNc
         3UTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789534866; x=1790139666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cdugvJNqgU6E7j1wDJGENADgIVNNhusm8dqwAWIMj0U=;
        b=C+KQHh391wQbJ8FIWMI0o3ozgIK5Pw96J5jIiPABD9hyiM7nTGHW8pLfBLdp8+V8VC
         0D8nVx4YzuM3S05LO9J3vLi8760u93tEms1iA001Q92LOWWDNI5xj90hr2gmphd6gfQw
         LQwVRUZZDHpNC1Y3SHQWPg8vSfPpAW5JrW0D4OASk+aW3oJOMSwpYtUddovrdiJ+tEms
         ApraHPJyX+KVNpFkeaFDfdZ529PNVCdpw0KNutcl7Ds8qeicAj6PKcZ/A8niYEO+J8um
         4JpteM/ErlFTpsoWqSQfQDHYaSHzv9QP3Zc9nqRC1ZinB7wB4/CMKQz5n7f3d633ZGZp
         G0jg==
X-Forwarded-Encrypted: i=1; AKwUvBzXSoEQRjDKagXwCuJrg4jjzgWkW48totHGoj931C5VA1Zdt6iI7Le2lI26IbyFwH2rh9fMwNk2WAdVu2jBKQ==@lists.infradead.org
X-Gm-Message-State: AFuF++lXD9ICSKOfKg/mbT0PHDaaloIr07GEHS9JjEhgR75MglcQBTZt
	LDQjz5I7TNV0TmrgUosE9bQV9DfTp+ROBoK0Qr56Ujs9+nsUP/P6W0W2
X-Gm-Gg: AYBFou0QwJExr66ApmocdTsbgXf08CrCysYqNsOR2vzv/UmduaYT+MKWwiX+wOH0bdq
	LYNr6D1ht7yWk4vzA1NKFYkl3hvKAyLb5J0O5c1CTQAA7ANKJCTqqYbVCZLd4+sW1cJkMm0FQ0k
	O4JMXJGEpXcO3WZLCjreNjV32V4XbrFcRp7qtCHsZSVvwCrtuEx94ciKKsxM40xLiWzVcD+xWzn
	hF4AWfH3FVd8N6UAsTcWAEC8rTBSDtJnMnFVtfC446/EUq0pBPXySU/cnRetG/r3wa20UTO78nQ
	AcKLaFRdcAW5RzyhLdskq6Ud5XmYN++ceC3agFuVc9ACzt6O9t4mT0OoS3MXjjIHs5L/PXJH3M3
	FXdv9Uh4wyoJRmZa7MG1SD/+LfpaxRwxTFfErcGA9IXcW8xl5fiE888RqYoeHgYxCDe5YVuvkAx
	glmA94AzxMlg90pF+TvlGNlmExPAYm9MkCXd9PX7H5gVFnInECshm5ws0W+p1QnTxsixv951GgE
	qdQvc7m93qyY3U8nfEGhn1eSuFsS6U743/4ntpo5kvqkB0G/oR/HzOBtZQ5GGmbiCtaFFV6S9IY
	f4NCqqOvhVt7Rkc=
X-Received: by 2002:a05:6a20:918e:b0:3d3:b00a:7082 with SMTP id adf61e73a8af0-3dd5f7b25d9mr2952258637.28.1789534865531;
        Tue, 15 Sep 2026 22:01:05 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50abb1776sm850589a12.27.2026.09.15.22.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 22:01:04 -0700 (PDT)
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
Subject: [PATCH v3 05/12] ASoC: mediatek: mt8189: Use dev_err_probe() for clock errors
Date: Wed, 16 Sep 2026 12:00:12 +0700
Message-ID: <20260916050020.14575-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916050020.14575-1-phucduc.bui@gmail.com>
References: <20260916050020.14575-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_060108_242132_CD190054 
X-CRM114-Status: GOOD (  10.73  )
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

Use dev_err_probe() when obtaining clocks to avoid redundant error
messages, particularly for probe deferral.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v3:
 - Add Angelo's Reviewed-by tag.

 sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
index 1132c924158d..594c214fa697 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
@@ -793,10 +793,9 @@ int mt8189_init_clock(struct mtk_base_afe *afe)
 
 	for (i = 0; i < MT8189_CLK_NUM; i++) {
 		afe_priv->clk[i] = devm_clk_get(afe->dev, aud_clks[i]);
-		if (IS_ERR(afe_priv->clk[i])) {
-			dev_err(afe->dev, "devm_clk_get %s fail\n", aud_clks[i]);
-			return PTR_ERR(afe_priv->clk[i]);
-		}
+		if (IS_ERR(afe_priv->clk[i]))
+			return dev_err_probe(afe->dev, PTR_ERR(afe_priv->clk[i]),
+					     "failed to get clock %s\n", aud_clks[i]);
 	}
 
 	ret = mt8189_afe_disable_apll(afe);
-- 
2.43.0


