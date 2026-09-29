Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0559DCA5FA1
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Sep 2026 06:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=urUaTaRaVpO22Fs+yHiC7cI69fVJEcpMdS3nF5oFxHs=; b=TGIE5nbMpDdlUWLQ3EFNN2sV3U
	1gCuUwaPv1k+vrD2b76xBTc8ht4kKZxoBS/6WIR4wcc52sVecqn3ptBojMxQC6t89gWenyqcRs3gq
	Lcmo9rbe9xnuNXvbj9n7Qkbb+MVyqOUujPQPjoCnC0RuIXkfkWHiBr7BQIXdsKef+1qk4OkZ0xGTW
	4LcmolMcNA9CKn3gOLDkPQsXaFCk4TENw+uN/lxdoHhHhY91KGxochZYjcgR1kFz4je1yFnqwct01
	HvLc+aOSbaNIKutnsyb0+Mqem2+18+AL32AxRuBae5KHnUev97l/Os9vq1gF/mZVaEJxdcNMZtzAs
	Pd5QQWjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBR4g-00000002PrW-47Mk;
	Tue, 29 Sep 2026 06:12:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBR4f-00000002Pot-1Y9D
	for linux-mediatek@bombadil.infradead.org;
	Tue, 29 Sep 2026 06:12:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=urUaTaRaVpO22Fs+yHiC7cI69fVJEcpMdS3nF5oFxHs=; b=n5pGlHh1m8xq3X8dPgBB3/zshA
	iCKPTq5zoZzUcKpCAPzqPGNEEYv8Z++LJ5wuONQiFOsSckNIxC0a5fwXgQSt3I0jkh04fAu8gxun0
	FiCZVp/rZSQwa0kPc+84PEUyXwUWW/D7Z9KooWXHq+oDVAhi9FV1QVkqj4q2vEM75E0exkeyH8eQz
	sIIF+rqlyr6ClQ7/PvTgeoRt38lwo5L9GmyHwWS1i8DyZN2Oq3OeYLddRucX0Z2nB5DLM/ijrRySB
	qgcM9kkd0tGoZoW3chO9NbM2zMoK4cWswJSmbtegHxMdTRs4nLCdYMr0Ir9udrgpRZkj85uOMl0jS
	8JregTJg==;
Received: from mail-pz2-x2b.google.com ([2607:f8b0:4864:3b::2b])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBR4b-00000002EXE-33jC
	for linux-mediatek@lists.infradead.org;
	Tue, 29 Sep 2026 06:12:20 +0000
Received: by mail-pz2-x2b.google.com with SMTP id 41be03b00d2f7-cc7901f7971so1192870a12.0
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Sep 2026 23:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790662335; x=1791267135; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=urUaTaRaVpO22Fs+yHiC7cI69fVJEcpMdS3nF5oFxHs=;
        b=rutwRuZiYjniS5PJUaMBzyuK5xKbzm5MFR32f3lnQhmOusO4qqqe/IhRa/RqSFBbH6
         qXDu1DLYmv3FxLJo/uU4N6aw6CLF1uWbH0D6w5aAf9LQfmecJHh+3VhNKihJ3YXRzwBY
         Wq7PhPocUGmUqQSVvfJnRwB9mbAJ8jluAW614i16PtyvTM4og7sp9Ly8axxKeEkXEVnP
         fvxnalV+im/xDLCPgV6YisaaO81aDUb9D247wcs2LuaJ5TABNije8UfxR7QBm1PCezIb
         qEQ992zmhOf5CB06s01s0Lr4oYELAN+lP7rD/GjaGEJBqvjNQ4dyaqrqh4GUOhJvoUFj
         WV6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790662335; x=1791267135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=urUaTaRaVpO22Fs+yHiC7cI69fVJEcpMdS3nF5oFxHs=;
        b=OVabSv/8WcF2I8Oi8x7r/3V7vRiApzyMEAHDlt0aVb7J0P6rz8gMGsbGeM27WjwEwj
         udcOEGsBvxOfPIJs5e95V5CYKxCk2bZSaEpbdS1W7MwbSJiAKdgkRWETpQSCZWQXyU76
         CFxgflgFF9v0uD4xKub35a8d3xHEDFpthZkoGmG/QOBivEaQ2fzyU5JkzC7EydKBsviT
         7X1nJ8aGSt7v+49xMRzhO5Pfghx8yJbxSNhTWt1vj/x4OtR2+E+koF+Op01bA9oud3dY
         uF/6cHJd3elz33Sd6jSh0UL8Au90Cj/vZWcpiuPOTQm+3i9zp168c9sVdbXIDXghMjRy
         4IIA==
X-Forwarded-Encrypted: i=1; AKwUvBzCSsTX3DqTiKahJQrUT5M0xZHNiMCTiDYH8vc3F4nB+t+8vIzZGgp3Q5Z0WV8+opmPo7SyNVfV3MQmmIGjtw==@lists.infradead.org
X-Gm-Message-State: AFq9FYKtnNsA2lqQa8t+jwixXZgpkhgS0mv8d1vlWMgNbKPb23EIyRn4
	ncCPfXvq1Ca7DSagRz10DbrHt1mJsIiAfQiM6ajZp6SS7cnxk+gi5IRe
X-Gm-Gg: AYBFou2/E6n3N+bea5IwgGx8DnBI3VhFFY25HGxD68rcXeFe8FnIbgVnPJ4wfqokzHX
	8QqbVv6WSStIi/fK5X9hO0xFRmKV8udo7hAVVqqtlbL4q13MUlfet/WAHgAS61DkA2GJWxAp3aS
	1vznaed2IHWlPHLNbrYVNlaymJ11f5ZRNZwMJu7peeB2Y5irzYhDqrODGtILyeonCA9Plh41ciB
	YG1xW3M9NDRppc1nmSEd2lXxHjj6mcVf9F9p+uaYuUG2zdIFPIju/mt2BDQ2qGarDgle7O1/I56
	d51hNMya3Rw+SuhvzUgN3QYKrllva/Vef6BazUUihWjrET1kZdkmGtItrfwvUKmYPZa5CbqXDzR
	InLO1+VFp+qGclIk88KBt079NrtEyDqtRmPk9cT+cJh5HOppeK0vff1o6FQXLyb4rVHNQIQC2hl
	gS808RUbMZqSFfdFV4Rs5kv4wPTRu1j++3RLFT/QTq21AaMh7Sls0eCSHxV6ok++NjvW/GOreb2
	8KtjRaRvjWrH913dC3Ed8Zoz3QbWkmZ51ysnEqvkuR6AZE3QX/6J8gHk/fBXUShtwq2R1cyg6s1
	SlewMD4q3+CXaw==
X-Received: by 2002:a17:90b:4e86:b0:39e:4c7f:7306 with SMTP id 98e67ed59e1d1-3a098b8addcmr11959877a91.29.1790662335533;
        Mon, 28 Sep 2026 23:12:15 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498726d63sm3280965a91.17.2026.09.28.23.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 23:12:15 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Darren Ye <darren.ye@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 04/10] ASoC: mediatek: mt8196: fix register access clock error handling
Date: Tue, 29 Sep 2026 13:11:15 +0700
Message-ID: <20260929061121.124001-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929061121.124001-1-phucduc.bui@gmail.com>
References: <20260929061121.124001-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_071218_606417_2FAE5F62 
X-CRM114-Status: GOOD (  12.93  )
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

Propagate errors from clock operations and disable previously enabled
clocks when a later operation fails.

This ensures that the register access clocks are properly cleaned up on
the error path.

Fixes: 7384ecab34eb ("ASoC: mediatek: mt8196: support audio clock control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8196/mt8196-afe-clk.c | 25 +++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-clk.c b/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
index 1d107b85d03c..6198711e01b5 100644
--- a/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
@@ -546,26 +546,41 @@ int mt8196_afe_enable_reg_rw_clk(struct mtk_base_afe *afe)
 	int ret;
 
 	/* bus clock for AFE external access, like DRAM */
-	mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_TOP_ADSP_SEL]);
+	ret = mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_TOP_ADSP_SEL]);
+	if (ret)
+		return ret;
 
 	/* bus clock for AFE internal access, like AFE SRAM */
-	mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIOINTBUS]);
+	ret = mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIOINTBUS]);
+	if (ret)
+		goto err_disable_adsp_sel;
 	ret = mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIOINTBUS],
 				      MT8196_AFE_26M);
 	if (ret)
-		return ret;
+		goto err_disable_audiointbus;
 
 	/* enable audio h clock */
-	mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H]);
+	ret = mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H]);
+	if (ret)
+		goto err_disable_audiointbus;
 	ret = mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H],
 				      MT8196_AFE_26M);
 	if (ret)
-		return ret;
+		goto err_disable_audio_h;
 
 	/* AFE hw clock */
 	/* IPM2.0: USE HOPPING & 26M */
 	/* set in the regmap_register_patch */
 	return 0;
+
+err_disable_audio_h:
+	mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H]);
+err_disable_audiointbus:
+	mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIOINTBUS]);
+err_disable_adsp_sel:
+	mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_TOP_ADSP_SEL]);
+
+	return ret;
 }
 
 int mt8196_afe_disable_reg_rw_clk(struct mtk_base_afe *afe)
-- 
2.43.0


