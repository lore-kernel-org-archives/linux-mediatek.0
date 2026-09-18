Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D220C982E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2026 13:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ppJ5fgau4uw0MPuW4ZdZtY3EQ3eIT2OOYRbyNQHq6DQ=; b=v/IG4RuOFMbUai5bgylERRfvZb
	qgzOiBypabJ44fC67MklGuuQWHkNqOoiLYR8xaji8rfEzg1HH4I6/FnUGvVxqnH1CaGt4lyuXK9ph
	RZwcK8W0XzNgieTk7cIqLUPOpZlgOkFiBCppZNiOD1QyKaWLuNSx2WaVCJKGJj8sBOMnnV7fUm6xp
	KI+mqKxztA0TxXsCDrR+vWfLFj+ga6WGROI2W3TxhII/hArSHbXedErBJ7avbyVbkIKSSa0OQxJc4
	4FX42KB0pORKqXdY4pdNcHcwgPOzCyAtekpCdQwuzwVO6DuubelYxUpxwmL0y4W6gSPGlfaz4oZGa
	MzMTJ/WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Yp1-0000000Eafd-2S6X;
	Fri, 18 Sep 2026 13:40:11 +0000
Received: from mail-pz2-x0e.google.com ([2607:f8b0:4864:3b::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Yox-0000000EabV-0E6R
	for linux-mediatek@lists.infradead.org;
	Fri, 18 Sep 2026 13:40:08 +0000
Received: by mail-pz2-x0e.google.com with SMTP id 41be03b00d2f7-cc4c08393b0so569003a12.0
        for <linux-mediatek@lists.infradead.org>; Fri, 18 Sep 2026 06:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789738806; x=1790343606; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ppJ5fgau4uw0MPuW4ZdZtY3EQ3eIT2OOYRbyNQHq6DQ=;
        b=In+jtLuDkyBaEzkW5NrZlE+0rczPoBFNeyFE4A1CJ/Gi3/01Jct6w/Otc11r9X5O5V
         aAhalfHIDMaoq8BaHZQ7+Kl9j0LgfKsUjt9WwbgRMOddJ0QfEHTvgtl3C2D+Yx65C2jk
         7VOrZXiBTjNSPmrm/oVI+r95C+y1wNYJn58EKlzydufdtTshmAYIo1Ib59Scv21qXWiA
         vA39El3Pet7TrAF/gfrZdXUW1/cv50DYrEJPcQn61mBLkID2oPqxq4i6n/qeRb6oBvAH
         4HWSiu3bCk+nsCy9g8zvM1oXMCFGywebxdNJ2RTgBkTC+VzxfmmjQOzOfGFF1RHLCL1/
         hZ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789738806; x=1790343606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ppJ5fgau4uw0MPuW4ZdZtY3EQ3eIT2OOYRbyNQHq6DQ=;
        b=PL/lHhAc0W/VVERMr5v/SjX74ya7Idi/+8CxqchqhBQSPAgn3UPsTnXZOzicclw5dC
         k9WFkn4WTSn5pDW8RbUv8K9g5M10MHWTG2rFxDYBnYWWeyMgv5ZM7o9tyaufc3pB/3ap
         P97q8nQAJpxOb90D4RnOcQWGOvjNxjAkfPMEtmKhq/NwmYmME1XTXgII1V5htHzy5076
         WeDgkIF4l+PToYX+cTrQdMk7TWLa/PgwkCzXv2aEx9RCUlhk9bEvrmqBgBhL+1kx6ZI/
         +4jzQXFMviaS7YlG4Y9ztV9uD+/0/Jd0/AMWlfK7/LloDSvh1GNMX00nIXp0vSqwYeAe
         Cpig==
X-Forwarded-Encrypted: i=1; AKwUvBxWUDPOUtXt8wogIbri33U9yQozyU1Fw+pUDDMaj1QakXg0njhhDrVVEL61stDoNt7ZE1SABCiHeICOmNpdIg==@lists.infradead.org
X-Gm-Message-State: AFuF++mEzNjlsdVwDwAmBAtMcztC6DIZv2A4CX7tQ3Z1n5EP+Z7mV33Q
	NlmZ9QBu0oKraF3kaEXGa8MsJMZt9RfgXODsgSoRX9rEqN/X/Qb8uOQ3
X-Gm-Gg: AYBFou3XqbJYn5LN1HNmFZR4FiyKfuWt3oZLbYc46k69B74zf2f+AoEK7wJcmbEEWxz
	s74gIcMcu3PpCTrrg/kH2L+llBlSgsJTMch2a0R6Q4k2H+xqc5+XCEmvvWgkkwdwZJsWQ8k+97X
	OYWtWBWsir+0x1pMpQXTpJFVovJdXVozFElblikkT28sCrfRb1bUFk5V9d0tZ/lUVzaGeqd4rQb
	KumF7Q1cy2jq2RanYzbqz3/DmxbFL4WVFPw7YD/QtndTWFqgg8KqKs1Daa/KMzxns4DTbQ8fRdP
	cSQvZZWWsPBf77r2ZKpJyQRkE5R228rrtBtveBq8YOht4PJOe3D1S6n9wpSF3oHa6H5Q9R3PK9Y
	EfxxL+YS1DqlM7/pcdhC7OFgH4lyIPNazIn4BsxSX4POgfeVJnzrpMvnHoRpl1nItdu+seYKou7
	hUDNK+ywI3ho5ZHMY2rAqyakK71FBZkfTuYMuTAkIK8/mDZHQlrLDYcPFUcAx/4PP4rE+oxSFLK
	94+PG4qDSUddDlOscHOtuAMdJDYhy4jNeHyKxANZyFvqv80AU1ga8iuEtcG+5Ccf+OYF0fkz6gC
	kmGGXdGlYxcIYA==
X-Received: by 2002:a17:90b:5281:b0:39e:4c7f:8b17 with SMTP id 98e67ed59e1d1-39e54cf8bc1mr6408347a91.28.1789738806339;
        Fri, 18 Sep 2026 06:40:06 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3617443asm13253792a91.9.2026.09.18.06.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:40:05 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 05/15] ASoC: mediatek: mt8192: switch to devm_clk_get_optional()
Date: Fri, 18 Sep 2026 20:39:01 +0700
Message-ID: <20260918133912.133799-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918133912.133799-1-phucduc.bui@gmail.com>
References: <20260918133912.133799-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_064007_113652_B066B943 
X-CRM114-Status: GOOD (  10.69  )
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

Switch from devm_clk_get() to devm_clk_get_optional() when requesting
clocks, as optional clocks automatically return NULL when not present
instead of requiring manual check and NULL assignment.

Additionally, handle clock errors properly using dev_err_probe() to
propagate error codes (such as -EPROBE_DEFER) on failure instead of
just printing a warning and continuing with NULL pointers.

Fixes: 125ab5d588b0 ("ASoC: mediatek: mt8192: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8192/mt8192-afe-clk.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-clk.c b/sound/soc/mediatek/mt8192/mt8192-afe-clk.c
index 77f596cab92d..9b9a3465ddb5 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-clk.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-clk.c
@@ -672,13 +672,10 @@ int mt8192_init_clock(struct mtk_base_afe *afe)
 		return -ENOMEM;
 
 	for (i = 0; i < CLK_NUM; i++) {
-		afe_priv->clk[i] = devm_clk_get(afe->dev, aud_clks[i]);
-		if (IS_ERR(afe_priv->clk[i])) {
-			dev_warn(afe->dev, "%s devm_clk_get %s fail, ret %ld\n",
-				 __func__,
-				 aud_clks[i], PTR_ERR(afe_priv->clk[i]));
-			afe_priv->clk[i] = NULL;
-		}
+		afe_priv->clk[i] = devm_clk_get_optional(afe->dev, aud_clks[i]);
+		if (IS_ERR(afe_priv->clk[i]))
+			return dev_err_probe(afe->dev, PTR_ERR(afe_priv->clk[i]),
+					     "failed to get clock %s\n", aud_clks[i]);
 	}
 
 	afe_priv->apmixedsys = syscon_regmap_lookup_by_phandle(of_node,
-- 
2.43.0


