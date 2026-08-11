Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E69ECC5AC67
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Aug 2026 04:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DjeSCh8LZRB+SCMaYU6AxHwq7ze7+snnwffs3yjAKx0=; b=gfDNEI46R7cf/pG1BM0O4MyFIp
	Cfr51RsHGGlXGW/2tNeJ+hYcOp8Eq7lOqsaI0aXAC4UNxmPydCmY3MyVI2s/beczfvh095EWO079I
	TYtAkPVtP+VK9FzD2gPO8Sz/wC+4u6zyhHrgbBVGOKzfU1aPM4rz8OBt2DrpjJQYKd8p2ovzxxoYx
	Mx6j8ioFi9GVQjMZuRPWYR/UAD0+6TrTcg2yqrgUjjgoo8MVbvkE4BmWxhxGauZZKBMRmrZAn4Xq3
	hMXDir84gA43mFVuWDOVInTyt7ZWF9aPDbeKUxmvig+pOh312A/+gi/xx/PU5ep70Epnov6VdBHZk
	JkghfaLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wte2S-0000000DHFD-35YK;
	Tue, 11 Aug 2026 04:24:32 +0000
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wte2P-0000000DHEA-1r56
	for linux-mediatek@lists.infradead.org;
	Tue, 11 Aug 2026 04:24:31 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-6b03e59a9b4so906501eaf.3
        for <linux-mediatek@lists.infradead.org>; Mon, 10 Aug 2026 21:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786422268; x=1787027068; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DjeSCh8LZRB+SCMaYU6AxHwq7ze7+snnwffs3yjAKx0=;
        b=p4kIve4LOO+3NOKfsH+7AaTOnscHM4pF/o7sTXB/RNDf5hQOPUS1oaMYPub35zxkBi
         vINrJY2LQLCv+cJbAu8j3inGhLuwItf0CWeRsS+Njbp6NJM/H0ce9u/bke7APn6aPkUp
         FU4+0oEqBKEOLIZujp/1qrz5fzFnTFj4b9PY1b4D/wFVL6XsfakcoU+pqz8r2Thg/WJq
         /MyUEO7J1qzc9lfARh2IdkaCDZ+9xbNB/2c69uNQYJ8F1f509RlmEUMmnhaNoDJlSfAu
         J95QHolpX013ertyilNUIJBhaHu62uByNqQz7dhG5QxUhNJHbH5SkR01vx+26/qkmmuY
         11+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786422268; x=1787027068;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DjeSCh8LZRB+SCMaYU6AxHwq7ze7+snnwffs3yjAKx0=;
        b=iupgxzl+YUKDRbibj4UilKjFXZji2d4HXD+R3OUTKEyEQfrmYmsmbpvluGjFv5kssz
         f3LbDJLjrSpb+NGfPPhuX+l+OMnhicL2oUjGAP1Movfem6n5Qy9ib/hx/uLjYL5jfcyk
         4FrdLa7sBAy/VO/z8gM9c1H9yINc0wXobVo3MumyPic4yWhge48729jh37e4r+c188SV
         1go1tpGqDS+3a9mL5nyEHG37iA9k4QTk64qkcoYGjuI3R9jtraju/FjPfC+srTB6Bm9q
         TVxrL8ZQLPC3RA2j9n8f6fDiX4kR5swxfM5PWD2cvHYswRI/nlAbyuBPxoCaFb3JJjnz
         OUHA==
X-Forwarded-Encrypted: i=1; AHgh+RofTiYipHoBlPEp9qY1x8isVqHxrGFewa233K/rniXRYG8zGyGy2ZggbmRlOA4YL25SHJaoT40yF63LrrNmSg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwjDSxjnvdb+wef8dxo21J+oH1cb5VnJJ10Atu30rXL0/gX5Zcs
	ZC3pWxsCkMpLfNuLsws79WcoURvColoStuud3tiC4EzSkzmZI+FmWEFW
X-Gm-Gg: AR+sD119noPoZ1/uIaz6+T3ZmAzxmrD6Jtdp4ShEDDvUrLHRrTMmtdxhc9mXYwg9HAU
	J1jyxoPq9hzbO/V3dIp8JMwGtSFSRp1ycqFSUeD+HhNhiKJpkmIlY6hyKDiLjUWTo2CbOnh8YUp
	vHLTcHp3b1eEdCbXwVA5uXQB4qlW5j7FKbLJQNtN7SSnoxjQqkN9x9DFrmhqsDkpYM+w7xVmo37
	kQ0VZTD18W/knrwyXO8YR6Mr+LUCNqaSl6Htr62eherRo4IYHCqUHdaiaXZoy0W03G5Iv6+ORaA
	OB2bTksMjj50U+D7g79gPF4BnYK5pZnUSoq2RVqw9cTLdU+KE2GKYjFv29ddq/uHyVbEHFD4dmG
	ZjMa9vBma6ABrAn3PA7jBpl3U/C1GRpTfArkG939GQeptyqCgGb1Dh3a6eEAovJuUI6/W3wKyCt
	rVNiuOZLRBV5O5EkfTnBVAE9uEZzwW7t3PUl5jRCayBx8Djl6S9QShS2vAszGueZV/L50Vo00sf
	qDNiG5dgxn87PTKecPWzZVzQOmfc+pYvs6tt0eLwFIamNjG+HCUMC4BCprPUyKop726dUfI1384
	t2w/YvML0+hgBptDGJVB6bF5U7mzKvi+E+3l/g==
X-Received: by 2002:a05:6820:618:b0:6ae:55f6:2cdb with SMTP id 006d021491bc7-6b0a2ff0e72mr140724eaf.1.1786422267869;
        Mon, 10 Aug 2026 21:24:27 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-45e1d99a4efsm371286fac.13.2026.08.10.21.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 21:24:27 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH] ASoC: mediatek: mt8365: use devm_platform_ioremap_resource helpers
Date: Mon, 10 Aug 2026 21:24:24 -0700
Message-ID: <20260811042424.66882-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_212429_477619_28412AA3 
X-CRM114-Status: GOOD (  11.09  )
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

Simplify the probe function by using devm_platform_ioremap_resource()
for the base address and devm_platform_get_and_ioremap_resource() for
the SRAM, dropping the manual platform_get_resource() calls.

Assisted-by: opencode:deepseek-v4-flash-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 sound/soc/mediatek/mt8365/mt8365-afe-pcm.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
index dcbc5a345382..fc3a457683b8 100644
--- a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
+++ b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
@@ -2121,19 +2121,15 @@ static int mt8365_afe_pcm_dev_probe(struct platform_device *pdev)
 	spin_lock_init(&afe_priv->afe_ctrl_lock);
 	mutex_init(&afe_priv->afe_clk_mutex);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	afe->base_addr = devm_ioremap_resource(&pdev->dev, res);
+	afe->base_addr = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(afe->base_addr))
 		return PTR_ERR(afe->base_addr);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	if (res) {
-		afe_priv->afe_sram_vir_addr =
-			devm_ioremap_resource(&pdev->dev, res);
-		if (!IS_ERR(afe_priv->afe_sram_vir_addr)) {
-			afe_priv->afe_sram_phy_addr = res->start;
-			afe_priv->afe_sram_size = resource_size(res);
-		}
+	afe_priv->afe_sram_vir_addr =
+		devm_platform_get_and_ioremap_resource(pdev, 1, &res);
+	if (!IS_ERR(afe_priv->afe_sram_vir_addr)) {
+		afe_priv->afe_sram_phy_addr = res->start;
+		afe_priv->afe_sram_size = resource_size(res);
 	}
 
 	/* initial audio related clock */
-- 
2.55.0


