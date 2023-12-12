Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F1BC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Dec 2023 12:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pkeEHXB3/T/jnmWhl5vUXIuVy5c3DWow9x1MikiYeZc=; b=JQEFFug/znyd48uwpM7FSwd/qt
	Q3wQ3a8aOINP1xACa4AAuvpkpImYgNEVSk/gvYrUFP8H+jUCxiNMKGUwLxnaI7LN+1ovFoZfxBy/A
	uqr/Ch6GjgpdIXAmB7vOw069PnSfNAI8CabbZKT8LE8Tb3onBsEM5sH14OaBad74n8rFp3xv1IjgS
	sk5/jXU1R+URUSS5pQuSd0LvImrrijw31f+5vi/6rLk7z42P3AZKOXkcMpVC4BQZ5Bbqlbi+OZa66
	LOcX2DEy3T13Di017FJPj7p3EDJXIkdlrp6Bko9v0Bv5SZVyACkEFVPsDRTr6mzHBKf22fPrkmVbG
	NhQPPcjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rD1vE-00Bfjt-10;
	Tue, 12 Dec 2023 12:31:36 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rD1v7-00Bfbl-0c
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Dec 2023 12:31:30 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2888c80994bso3304871a91.0
        for <linux-mediatek@lists.infradead.org>; Tue, 12 Dec 2023 04:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1702384275; x=1702989075; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pkeEHXB3/T/jnmWhl5vUXIuVy5c3DWow9x1MikiYeZc=;
        b=fokYesYWEsyh/JJrZ4xJh4nOUI7CeVuWqJRBwU8EoIM0vMwYFICyobdid684PmeTGi
         QeOJAy8aehtWDagLEQU/S4Ggkb3oy+9QfMP3LWGE25zCsmjXbvDSncuOT248y3R8Ciu7
         sv4R0FB7SxcBw8IsleIWyki+2MXOVag+sQidwEXAOn963AP6iRBrBpKXk3Qlqc1ggcHq
         wbAHZuZmKjpGOSaJgGc6Zk7rl3R+r2q3fmq87b5f1sI9/ZPpNTJ2PtDo7Xs3jW1p0kxF
         3YSxvgE+Axy9WZFROQl6Rh+edbB9leUXt1jHVPrwXuWNW6SNRr7A6+qB58+CCK6Q1U2g
         I2Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702384275; x=1702989075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pkeEHXB3/T/jnmWhl5vUXIuVy5c3DWow9x1MikiYeZc=;
        b=leQZI2r3lLUpfZoyS4mmrkLBye6zAI0UqM70MONK5HvGqDjvEwN/I1kM9wEz2iQioA
         XjwOmXQE24xXBfaeaT1Mj4KOpw29Qz1OUHO2ovC7skxSivjT4bXiIq0Qf47InRM4p/KN
         bqLLskfwyz9VTBIGbFZhC0JgIzr0ZSDkEgrTqui9tbSi1f8q2EDcsnKnHdyMbUl4Kk0C
         kreAMKijWh4QYW6IueXQk1wcp441h/TRWjgdW4/G4bvYpqgAESFEqlbMTM24A7deSM31
         2L5+jHq/g89zF7uoN6+PfXJH70FmOiy3p6xp4BEdJZ8RQ/15xfXlaI0Rxn0EeEt8nTbu
         DKmg==
X-Gm-Message-State: AOJu0YzDHS1OI1TJFPOWwzgxMlQHk1FPovw5BKLEe2VpHI3U2cgfs7wm
	dh9NxhjTgAVmsGNFRGkOhq+9Bg==
X-Google-Smtp-Source: AGHT+IE5sCF4shEEIJbHK+h3p3TmCKRBlnwVW/n53llShsrKb4WCrNbGIGBKDw0YVDdNQclsPnMbOA==
X-Received: by 2002:a17:90a:898d:b0:28a:d0c1:3015 with SMTP id v13-20020a17090a898d00b0028ad0c13015mr89056pjn.75.1702384275122;
        Tue, 12 Dec 2023 04:31:15 -0800 (PST)
Received: from localhost.localdomain ([101.78.151.194])
        by smtp.gmail.com with ESMTPSA id z5-20020a170903018500b001cf65844874sm8517471plg.45.2023.12.12.04.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 04:31:14 -0800 (PST)
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
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Rui Zhou <zhourui@huaqin.corp-partner.google.com>
Subject: [v9 4/4] ASoC: mediatek: mt8188-mt6359: Enable dual amp for mt8188-rt5682s
Date: Tue, 12 Dec 2023 20:30:50 +0800
Message-Id: <20231212123050.4080083-5-zhourui@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231212123050.4080083-1-zhourui@huaqin.corp-partner.google.com>
References: <20231212123050.4080083-1-zhourui@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_043129_250089_4F5C3539 
X-CRM114-Status: GOOD (  11.38  )
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


