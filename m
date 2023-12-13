Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17F45C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Dec 2023 11:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pkeEHXB3/T/jnmWhl5vUXIuVy5c3DWow9x1MikiYeZc=; b=gCQvu2c8jD4KWGnywdiUdXPmaY
	MYst+zuG4zgz+rsfX+xH00msrX6jAmOQFuHKkdXd1KaN25zRZtF2B6we7rqAW4E4zT8+rl0qE2sez
	qxHEg+bMGpgzO+6AVxnp4+Xup4asYRSF0c8at74be5hdf5jlXtxoSDCkU+msTwUS/OXTa9Cd4AeSk
	CjkIKWu1fM7NRWvgELrovdBKz6inhPH0Rvx1Wx8hW2iVOpdqkZ8/CgGCZBUTexGR/5rCvgSX0rnmc
	yNZ8IZzHA6eVEuEZW4xRkVPm0QDimYsIsKa9YeHZDbZdmsFQNYATXeLpYUZdbKhbI/ncik1DCX6WV
	+p9rJaFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDNbF-00EVCK-06;
	Wed, 13 Dec 2023 11:40:25 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDNbB-00EV9B-2S
	for linux-mediatek@lists.infradead.org;
	Wed, 13 Dec 2023 11:40:23 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1d3470496e2so11210665ad.1
        for <linux-mediatek@lists.infradead.org>; Wed, 13 Dec 2023 03:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1702467619; x=1703072419; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pkeEHXB3/T/jnmWhl5vUXIuVy5c3DWow9x1MikiYeZc=;
        b=GwjGheU6cJ5OOxiq7gIl66sXgrFCSya1euf++rQcwF5APIcN/qjJOKWYCzPJOj1vFL
         gEo4lRWGpCiTkt9lIc0K1r1xziQspX40eYnn7DRoT3y6m8xN2Lirrk1DECKkQmOemlxZ
         WYfqIGh2+JXtFQnzgvQ6sYNYSRD0EkQdqdQirsc9XXzWf+aIPrlYXM/H/8k2eX7X7U8F
         eeXcvbuhk516RLpHCwsglRI2W2RBZF5wTi9KM8wvpdy9JhPqXQw2GSw1yppXRwMmYjE0
         tc/t53Jgi+VNPGpquRuY3RqE2uKFn+uKIXS2qSG8qT6/u03zgaD4a27rD5vbWFo/OlJZ
         gvHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702467619; x=1703072419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pkeEHXB3/T/jnmWhl5vUXIuVy5c3DWow9x1MikiYeZc=;
        b=ny5umc8WDzPKcVWuOof/i6AuVFm3Vj8tbxBd0AGUXmJdF7TIUnOtEu2DlnADJKOivN
         KNaqjC6RtsELo83wy5dPeSE2e6yMyZWd0A7PYFkHy8W3EIm19wkoFq09XVZFhY3J5m6X
         bKTmVf1KEfZg9T9JD1RiYalhWufXQE8aug58bZkRw7SeFyXJ+VnnMBriowa/5wIx928v
         XgjHX2dQawOlDCCkVIzPpCeNCrXeWj9IFI/h1O4NIgyFGBKee0ZD6qxERrScF0i2tO2K
         dbKpm5Ta/nLaGPHECnIUdRKPSv8NNp0iioPhnfFXKidlwkAwNzSAv5OOdRE2KIrS/qLG
         cu9g==
X-Gm-Message-State: AOJu0YztNAS0gM+gyOmTfYaXVcwEOSxstvQ3W4GZoey0Fn5hU8+dASGo
	NfuacG56kQWWrmE4f6gtN4Tyog==
X-Google-Smtp-Source: AGHT+IEtRpE9piN/TcHjX3rZFm4N555Til6W/9RSMkR3uib8RAC7Oaqpe1Y4KsVWjCzLTxENloKduA==
X-Received: by 2002:a17:902:8696:b0:1d0:6ffe:9f0 with SMTP id g22-20020a170902869600b001d06ffe09f0mr7464532plo.78.1702467618911;
        Wed, 13 Dec 2023 03:40:18 -0800 (PST)
Received: from localhost.localdomain ([101.78.151.194])
        by smtp.gmail.com with ESMTPSA id t1-20020a170902b20100b001bb9d6b1baasm10331066plr.198.2023.12.13.03.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 03:40:18 -0800 (PST)
From: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	perex@perex.cz,
	tiwai@suse.com,
	trevor.wu@mediatek.com,
	allen-kh.cheng@mediatek.com,
	kuninori.morimoto.gx@renesas.com
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Rui Zhou <zhourui@huaqin.corp-partner.google.com>
Subject: [RESEND PATCH v9 4/4] ASoC: mediatek: mt8188-mt6359: Enable dual amp for mt8188-rt5682s
Date: Wed, 13 Dec 2023 19:39:55 +0800
Message-Id: <20231213113955.47668-5-zhourui@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231213113955.47668-1-zhourui@huaqin.corp-partner.google.com>
References: <20231213113955.47668-1-zhourui@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_034021_810856_5DE0130B 
X-CRM114-Status: GOOD (  11.13  )
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

Enable support for dual MAX98390 amplifiers on the mt8188-rt5682s board.

Reviewed-by: Trevor Wu <trevor.wu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
---
 sound/soc/mediatek/mt8188/mt8188-mt6359.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
index d1884f23a1a7..a391066ab204 100644
--- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
+++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
@@ -1448,7 +1448,7 @@ static struct mt8188_card_data mt8188_nau8825_card = {
 
 static struct mt8188_card_data mt8188_rt5682s_card = {
 	.name = "mt8188_rt5682s",
-	.quirk = RT5682S_HS_PRESENT,
+	.quirk = RT5682S_HS_PRESENT | MAX98390_TWO_AMP,
 };
 
 static struct mt8188_card_data mt8188_es8326_card = {
-- 
2.25.1


