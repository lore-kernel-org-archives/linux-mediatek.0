Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22AD9C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Nov 2023 06:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kIhheentrWUZUr9qMmdfImOeTcJiydkSSMmzKl0Spxo=; b=ZWR4QsYZJSWkiWc7Juq1GMuKmX
	ksc8uvj+bUjbtifmwXJi3fCV4wsx0Hg1QNNjZDvF9pEjtf9hfqDVn+KodIAHm1HcR95rBrWC6ixY4
	u6gK3QDo9hleF2UP+RPwlK1WhfDRis6EHUkGyA0dzQWJuRovlfefV3UUE9ltPCtwFmZgD/fJi5rMN
	THmIxAExZgnQR38Xpm8lOf92SMGipEo72WPyNWBiNgfZ76MhHUCM7cC7BOgQVTy4o4kJStc7WCU4K
	REBKXgqQY6g5tj0KTxYGyqvyji8s0N301KgH98YHIxYLUPt1CJ1g8/coXT9LvwoDRnIjwvrcWAjpE
	JOmWdzyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0cCs-00369I-08;
	Wed, 08 Nov 2023 06:38:30 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0cCp-00367d-0h
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Nov 2023 06:38:28 +0000
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-3b2e72fe47fso4070285b6e.1
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Nov 2023 22:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1699425505; x=1700030305; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kIhheentrWUZUr9qMmdfImOeTcJiydkSSMmzKl0Spxo=;
        b=I/9L28DAky1DcBpfMKH5CbH4kLO0X82p1ewClDNlKHeqVR4PN1i9CQ5nIgsWY5yM7h
         rzezhruoD9q/rK57Kuh5IrKg7oUOBsIsCafIV2zwpyTywCr3q1NXR2JnLa1GR2cf/axz
         MtRgy/8jqaN+FLVfUhQUdHuMF5uR2H/G1zHNW2Si/PP40m8Fjjh0rKhG9P6rXrT2DD6W
         +LU79d7RmkfmAN9fA7h9HmGSb1ul7RW+uF8a8n24iTKM8xYHH0KxgshHkCC6IZOJt64X
         eWNLG1RIvXIGFRexgGzrA5FKd4rXSsrPGItCDGNxIAT+Nccx5aFovBkGa3B9kRIejjsl
         uDZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699425505; x=1700030305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kIhheentrWUZUr9qMmdfImOeTcJiydkSSMmzKl0Spxo=;
        b=lAaH6otMTNCuXnYcohYq3I9r7e5zeqTwzQf1SrDjEFU2nHzLhxlb6287S9Er6k4Mpa
         bfaUtXAGQIpbwzNIAKLB+m54ypAv+3XpA36v7Bk7cbOvi2wsP3/ffWQxBg7ZPWCTutgO
         N8xgWMgljRmgatuTKrELCvhmmWd/CpKE280eYAw9rfIBas/1wpEh+6UtGgl2VkrmSTJK
         LI98OeFLouGqKQMzw2T4TLBXQikOewVMB5f4qVt26u81vTTnO0nzaWjbE2DuPGM3nCXr
         jzPPLIhxGBxml5Xx1cG/U6a5SMAlt6JXhJAazj5PyHnHdCl7Qam80YBwYG4x0PqXRL2Z
         qPSA==
X-Gm-Message-State: AOJu0YxAkC6frC8GViN4YZuNqRBN/dAbiajJp/dCY7T03u84zZHdXACr
	VqMoslZBMajllPpKhT5eWymYLQ==
X-Google-Smtp-Source: AGHT+IELqFwltznkymfD9hsryurCKid8oT9U0HpnclDEFjK+yWpOHhX6keI06fetTDKCg+G0bE6CWQ==
X-Received: by 2002:a05:6808:1312:b0:3b5:8742:c091 with SMTP id y18-20020a056808131200b003b58742c091mr1375035oiv.49.1699425504846;
        Tue, 07 Nov 2023 22:38:24 -0800 (PST)
Received: from localhost.localdomain ([101.78.151.194])
        by smtp.gmail.com with ESMTPSA id u8-20020a627908000000b006baa1cf561dsm8588660pfc.0.2023.11.07.22.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 22:38:24 -0800 (PST)
From: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	angelogioacchino.delregno@collabora.com,
	perex@perex.cz,
	allen-kh.cheng@mediatek.com,
	kuninori.morimoto.gx@renesas.com
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Rui Zhou <zhourui@huaqin.corp-partner.google.com>
Subject: [PATCH v3 3/3] ASoC: mediatek: mt8188-mt6359: Enable dual amp for mt8188-rt5682s
Date: Wed,  8 Nov 2023 14:38:04 +0800
Message-Id: <20231108063804.592982-4-zhourui@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231108063804.592982-1-zhourui@huaqin.corp-partner.google.com>
References: <20231108063804.592982-1-zhourui@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_223827_254981_F986F202 
X-CRM114-Status: GOOD (  11.70  )
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

codec rt5682s uses dual amp max98390.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
---
 sound/soc/mediatek/mt8188/mt8188-mt6359.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
index e994faa3556b..917640939621 100644
--- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
+++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
@@ -1549,7 +1549,7 @@ static struct mt8188_card_data mt8188_nau8825_card = {
 
 static struct mt8188_card_data mt8188_rt5682s_card = {
 	.name = "mt8188_rt5682s",
-	.quirk = RT5682S_HS_PRESENT,
+	.quirk = RT5682S_HS_PRESENT | MAX98390_TWO_AMP,
 };
 
 static struct mt8188_card_data mt8188_es8326_card = {
-- 
2.25.1


