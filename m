Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94AEAC07548
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Nov 2023 09:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4L85s7UtI9/rwjFAICPTAzeK+cD+vURn1l7JYvAOpMU=; b=n48SZ05OcXdFEd6ijBsJA/73Pi
	UqkFcX4MxdBrRVkr4qbtIUJR8QPgpoxupGbZH38CB/Ur5wg3P9s2Wy32gknbRHBAgJ7MiwQ6BSUU5
	pDoc0fPtRTS8nbJxaZltnFssQQEzpTyrrVIgeFnr/Tt9e1AMqr7V7Kh03dkCP/q4tUIZfXz+FFyk4
	PnWH1hPvSpxAb4pqlRqtmGvMy23fJdJaVu4ISlGr5oLPupi0E7wrJdI7CM6Rk+wzJ/aqMOsC02a7j
	eq0avJuAPTKJcdVMxJyFwGvUJ8/VQvHZd9kZ5CrMLHd40FO+9VP1bt8wPWK+P5+eF5clid1ItyUaP
	+8+k50kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3Btl-000IuN-1i;
	Wed, 15 Nov 2023 09:09:25 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3Btj-000ItC-0E
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Nov 2023 09:09:24 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1cc30bf9e22so5069875ad.1
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Nov 2023 01:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1700039362; x=1700644162; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4L85s7UtI9/rwjFAICPTAzeK+cD+vURn1l7JYvAOpMU=;
        b=L7OTiQWPT13pgu69X3/vlZmjEf7EsCsgmG+Lq7QgrgKU9VpQ+8uF1EahEC5jOVld1q
         CttbonCKKpVdmp/ryNuGnNTjeV0u7hjGK5S0hbQ4oIfRyTDs388Hc12/SqZ5hM+8RDfZ
         p1TyRUVJl5sGxxxHPAHYZ+jmg/w7O62xGCbfMGXwtSNI5kC6mXKttfMgtO0ZA9gDVsPa
         PoG3D5s9sjdeqwwIS6i/RW1nOXo/HDNtqnhkcMbFA8m88KjJtNJ6Z/X6n+2rAUyACdoR
         HREPOIuRPVz/hPOo8hwtfdq5pc/YBulC0sFSIhyc7B0IylaX1Wo1uUz8GHqjUz/SAqxP
         CwnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700039362; x=1700644162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4L85s7UtI9/rwjFAICPTAzeK+cD+vURn1l7JYvAOpMU=;
        b=W2y8+0Rz4Cn+m1m0eS3Oj4PeYzDMyAnm5dx+6rEKsFVGJSsY74alitDzj8iwxlSG0Z
         eskyymBUb7b9XErPGRACPR7e4pweILS/xg2ZPzNQjJEuQRqtDWGOw6FtIbfO99WB9dCo
         bKXwEpEqTvbXmJ70bGwiyAtdcnWVKZxL5QgzuHnzb3r4QyJC1894+CD1ZoQP+ZHOdQP0
         HsEMASfS5ZWaxYQiY4pKOY2lCua+Vh0GgAMdEpcriWtyB9z7UxctVI+1UIa5n3TNdUj1
         9OsgRtBynAJitoy8gbkas4zQu+WZxCyBp1bicPzBMKLIYRKzqX9nnC0jAI4CSRlpdEi8
         mKJA==
X-Gm-Message-State: AOJu0YwF2miKoruK3cUIzzaib0lWFpLZNmr2D9DQ7GBPPTa5j3lA/t9g
	U/vc9xta8ZZivNFfdwbR8Nz7Jw==
X-Google-Smtp-Source: AGHT+IFFjkEZiu2MV7icTcaPiuZU6HRVm+eOmOnwwuwhN6hUyY5N6oU4SdeAXfp0HWTUon5oDRt5AQ==
X-Received: by 2002:a17:902:8216:b0:1ce:1b7b:8396 with SMTP id x22-20020a170902821600b001ce1b7b8396mr5562990pln.29.1700039362526;
        Wed, 15 Nov 2023 01:09:22 -0800 (PST)
Received: from localhost.localdomain ([101.78.151.194])
        by smtp.gmail.com with ESMTPSA id l18-20020a170903245200b001b9be3b94d3sm6977377pls.140.2023.11.15.01.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 01:09:22 -0800 (PST)
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
Subject: [PATCH v5 3/3] ASoC: mediatek: mt8188-mt6359: Enable dual amp for mt8188-rt5682s
Date: Wed, 15 Nov 2023 17:09:03 +0800
Message-Id: <20231115090903.578438-4-zhourui@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231115090903.578438-1-zhourui@huaqin.corp-partner.google.com>
References: <20231115090903.578438-1-zhourui@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231115_010923_110415_C7EA4968 
X-CRM114-Status: GOOD (  11.51  )
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

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
---
 sound/soc/mediatek/mt8188/mt8188-mt6359.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
index 0421debe3ce4..bd07ea5cd48f 100644
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


