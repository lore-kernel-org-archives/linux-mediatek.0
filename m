Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FDCAC4167B
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Dec 2023 07:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nt4anNac6QQuI8NitQFKu/GxPNAvA4YY8I74D5v5vBE=; b=ZBz0CLpkIy4eRMdZuV7n3CORG7
	gp53ncSdQ9E42+v63KyYmsSVmMsFFLjWKweJArmMSOH8Vw40UEyzBH9Rf0TQNDJQ4PJ4fw6isHZYT
	3JPEiaQKpCdu/3woz9+TI/eULNriiD/hlJM98HEEDzIXVnevOGMNRKI7YaKlCGRFGGMwKd+K/HuGS
	GTsenK96+abqdcS7licbjly2vhDoSX0F3o+xGWAkiF2s0FmSj0FrCMrIkw/w80VgnP612SPI7gD66
	payd3tfg/8Bq6S4LtG0Q+lEo3F4MKInZclwy4rwmmVnC4/EEp7KbKZTeGubG1CWxBZuBZTwQDfcex
	hHhuBUrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBUzm-00Evi8-1C;
	Fri, 08 Dec 2023 07:09:58 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBUzk-00Evg9-1x
	for linux-mediatek@lists.infradead.org;
	Fri, 08 Dec 2023 07:09:57 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6ce7c1b07e1so1304035b3a.2
        for <linux-mediatek@lists.infradead.org>; Thu, 07 Dec 2023 23:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1702019393; x=1702624193; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nt4anNac6QQuI8NitQFKu/GxPNAvA4YY8I74D5v5vBE=;
        b=nIXwH/dtSTJ6ttd4X7p+rOeczKi36Uk4883/HDZcyihbqMAlnHgVe1n+opJGDQfS6V
         rsZXKnjqf0gQHriCGQJSTn+1dj+TZHC3JX0dr8ZC0K9mVus+neYPqW5C7vCoTxIPWQlO
         F2173PZJpUUz3iCWmKm7+Q83YwavUC/q5BuxtnCvzhUfGI46l9CdBZlgtc8/wUt5Q5jW
         lGJ5sMhikBM4CGs0UxQhzQKefaDgMO5R59lkGQxPByIn7k4hnKb7SeFoRpmmHnHkYQMb
         6sJvC4vSktLHP/xXFkagUM21tB2ivxj/wmJwm5jRHhUbBdJmT7x6u/T1TTdHpi93R0R3
         p7vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702019393; x=1702624193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nt4anNac6QQuI8NitQFKu/GxPNAvA4YY8I74D5v5vBE=;
        b=Fu49Ddul99vo71d/BO5pReIlSgWqHmTqUMTfLQLEiIqYYJxtZhAz4YDxVZwVaZrMvl
         gKyeLNGVtJidh9FtnOsF0tVV8XW/GCrn42Gf80BzyF6rw55MUujBlBl3Qnr6WUEobCmo
         q19/Nqs5KUCxVpA3njcWhBnI9M1+YVOlEfBd5stOvPLVgnZ+3BXWRY0xDAofC2EKD4C0
         8e8QpgDNMfpbW2ORZTzfb+rQLM2eBYG300onqzaHBFfFq/LeS7+u3NbG5nnD7nowLKib
         gOnW+f8uzFyZ/PQ3WCrS6OKwCSHSwX7UFulHN/kS+q7uzRWX0/0jT92E71jc8wt/yJd8
         VjrA==
X-Gm-Message-State: AOJu0YzG1wWzaL9UsETgjF5bCUJHH3dNFbUh00Qyrl/SPTrOGTwFxTuT
	3HUhKUV+hF7Tt0Dx+J0nnyNrBQ==
X-Google-Smtp-Source: AGHT+IHQjk5QlDFs0sFDS7yFpnRvxG3uEvorIsqqjx/R1zte7tBdywucB9vgYb8DBKT2N5sZNCaa/Q==
X-Received: by 2002:a05:6a00:368a:b0:6ce:46dc:e4ab with SMTP id dw10-20020a056a00368a00b006ce46dce4abmr4756816pfb.2.1702019393702;
        Thu, 07 Dec 2023 23:09:53 -0800 (PST)
Received: from localhost.localdomain ([101.78.151.194])
        by smtp.gmail.com with ESMTPSA id b17-20020a056a000cd100b006ce4b40e7desm918061pfv.90.2023.12.07.23.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 23:09:53 -0800 (PST)
From: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	angelogioacchino.delregno@collabora.com,
	perex@perex.cz,
	trevor.wu@mediatek.com,
	allen-kh.cheng@mediatek.com,
	kuninori.morimoto.gx@renesas.com
Cc: linux-mediatek@lists.infradead.org,
	Rui Zhou <zhourui@huaqin.corp-partner.google.com>
Subject: [v8 4/4] ASoC: mediatek: mt8188-mt6359: Enable dual amp for mt8188-rt5682s
Date: Fri,  8 Dec 2023 15:09:33 +0800
Message-Id: <20231208070933.720324-5-zhourui@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231208070933.720324-1-zhourui@huaqin.corp-partner.google.com>
References: <20231208070933.720324-1-zhourui@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_230956_668878_4F5105C5 
X-CRM114-Status: GOOD (  10.59  )
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
index ddbdf9265640..54ddf13d3f34 100644
--- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
+++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
@@ -1443,7 +1443,7 @@ static struct mt8188_card_data mt8188_nau8825_card = {
 
 static struct mt8188_card_data mt8188_rt5682s_card = {
 	.name = "mt8188_rt5682s",
-	.quirk = RT5682S_HS_PRESENT,
+	.quirk = RT5682S_HS_PRESENT | MAX98390_TWO_AMP,
 };
 
 static struct mt8188_card_data mt8188_es8326_card = {
-- 
2.25.1


