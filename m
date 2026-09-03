Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07CD0C624DB
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Sep 2026 05:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=teLAShLua5VCgT/jcx7hzSu9pxqI7I/30dsuHzraqHI=; b=iCr+7LRb8dP56Tc7gatV/bJwOM
	iYl4wbpiUkdo9xDS8gMOj1sitxCoNTScf8vrvHwK2kfU6qX65iSDqRkP9LXwZ53Xf8DaAn/MXV2JS
	P9efJlHM1fO7OhwH/NaBKwwU9KBCHYkCGhiZc58flilfBrhwySPUSngnQW5JL7W6wI/jclzksssNc
	NbIcmUNr6JmMomBQe7V0IcEDYiKbT1X1mot9OmEbHblVKieAClaH8h9bPkgledC5bXqeTi4m/ZZeW
	/c9Xgi2gAFXuPG7kSN0/NG2fYuJLDQCHI3oJvwzSqXtNWBM1ms2vCptZ9tb5LoHl9ZVEK+QAzV6Bh
	1bmZ2P5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1zkV-0000000GN0p-0CcQ;
	Thu, 03 Sep 2026 05:12:31 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1zkS-0000000GMxM-1ReF
	for linux-mediatek@lists.infradead.org;
	Thu, 03 Sep 2026 05:12:29 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-3964dfb5b9aso2543331a91.1
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 22:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788412347; x=1789017147; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=teLAShLua5VCgT/jcx7hzSu9pxqI7I/30dsuHzraqHI=;
        b=rDwvpwr8taGfO6Lag7FxOw/mHkU+g5WYlHJlkE4PafYB16lh3u3ah5HcjYN+BuqZFL
         FpHhZUnFQ/wLQy90he00Mb7yk6aExeZvHMDyMsmGcktr0S+WQ2xQd9yBixOoHZWPimn8
         g1WkgfVmN7ULy0bL2iBqb3lors7YvNCq4ClGJkiGXTzjdYUUYLjcgsfVRlTWUAZjAL83
         Ej3HtiTyH6u00UkLxjPclN3rNhpMOuWvc2LlXXENVPROlzPgLjkAUer24S5cL6/WxPjv
         e6WXN2r8pr514wjD+d54Y0R0gE6LoeIIY6ojLdPZUaznOpiJtoEvV1kcDu5KSikrLxUa
         tsXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788412347; x=1789017147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=teLAShLua5VCgT/jcx7hzSu9pxqI7I/30dsuHzraqHI=;
        b=FgmfXiicFldMTVUmt5gRxRb5ZtZNExkwyo2PI9VICPcUK3vdbxGCRJub61qSpvW3/l
         gLOiBVO5bzRln2msgyVLz2uWZLQ7gOOdRgL6Cpg7YA68OjE9yO6K8siSZL4uI4ZGRlmP
         mqaqI/99hNIcz/b1mVfAoh/0rOstS1jKb7rnAKpl17u/zmn9b76aCCsY8F7iNCzyn5vV
         tEPxAXqMDNetdYGgr0J5+VDGxu8lpHxoRl7Gnn4Imp0CjwhwWhpWrrErsoAFx/RopMZj
         ful1TkIXXBE3FsId+6SeLGaMdFHJG8iJx0TaWzsRDouH2waQdb/GisU+3aPCgkVJvqYQ
         AnBw==
X-Forwarded-Encrypted: i=1; AKwUvBw91FAJLGhtg2tyXnMZ9zUEx+fBQ0ZvEwdJ0SP1KWd/VSP/Mf7B0ZNzwRfmZn6MTCx4VolbTU1h+N5EupI3gg==@lists.infradead.org
X-Gm-Message-State: AFuF++khBLQ1FkC7+Hj9OBm+sTc0n5b23SnQr++UKq9RXK8cSAudzd8q
	A70qBFfxAM77MYFsl9p8O3ICG6gl3RIeM9eIP9MawisUG9AlEJPwNdcq
X-Gm-Gg: AYBFou3FtEztlNg0C/UUtkZJOecx8pQkFiIMLBwEgIWKe2TAMXdo3onemGABQf0Ddan
	8gmpOP3TjB99r1mDjaqkhZytl7lhBZrWx+O+p8L9CT7TcjvBKXiSQpXjHJsM7eU04bX1RirQ/uI
	9bms0Us1pLJQu+TZtgLUOO5hzqO4tZ00z3tC8sVWk339YIKD1JydXxDQdmbpgp7oZ7TFC0lxDAR
	XtuwWqvGF06qk2KmWUlUpCzzH73jv+Q8LcEgCHNDJE9kIl0EVutz4sm/8gp4UUGB0JcDIrOp0wh
	BDBhpbW6VeHCahis0p11XotTIxCS8GDt9MxXoV2ZPxAxAAt0aW/bI19+YrnmvCjse1PhBEqWUYK
	tSCHGFLoTQyp5gLPzFKZMwyvhHTDtz0agJDV/AYNT7VgRx3WWlB8it3+7mL+kaz8v3mu3SRQQYx
	Kb5QLUfRisEvAquWL5OfLiyLPuzy6FBEtV5TC+RFcS8OtbRLhqw//6hFxnbW16kLi+YFJUrkHn0
	PcjE2Ht9Xe5hZCiEhGYfsHgqRiCetNBZMtKfw8FG0E9eJYrOkwOrwcWc45Y5qjhSVH12m8LIIvG
	nFmCOC5+tynkqSw=
X-Received: by 2002:a17:90b:520f:b0:398:9c00:29e9 with SMTP id 98e67ed59e1d1-39aee1b72e5mr16164501a91.17.1788412347415;
        Wed, 02 Sep 2026 22:12:27 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b0875ce14sm3218092a91.13.2026.09.02.22.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 22:12:27 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 4/8] ASoC: mediatek: mt8186: Fix APLL enable error handling
Date: Thu,  3 Sep 2026 12:11:46 +0700
Message-ID: <20260903051150.178057-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903051150.178057-1-phucduc.bui@gmail.com>
References: <20260903051150.178057-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_221228_378040_ADBB12CD 
X-CRM114-Status: GOOD (  11.95  )
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

Currently, the mt8186_apll*_enable() functions call mux_setting(afe, true)
but do not check its return value to handle failures.

In addition, the cleanup paths of mt8186_apll*_enable() do not call
mux_setting(afe, false) when the enable operation fails, while the
mt8186_apll*_disable() functions do.

Add error handling for apll*_mux_setting() and call mux_setting(afe, false)
in the cleanup paths when mt8186_apll*_enable() fails.

Fixes: 55b423d5623c ("ASoC: mediatek: mt8186: support audio clock control in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v3:
 - Return directly from apllx_mux_setting() instead of using a goto label

 sound/soc/mediatek/mt8186/mt8186-afe-clk.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
index 685dc27c7780..77a0cbc8ee24 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
@@ -353,7 +353,9 @@ int mt8186_apll1_enable(struct mtk_base_afe *afe)
 	int ret;
 
 	/* setting for APLL */
-	apll1_mux_setting(afe, true);
+	ret = apll1_mux_setting(afe, true);
+	if (ret)
+		return ret;
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL22M]);
 	if (ret) {
@@ -378,9 +380,9 @@ int mt8186_apll1_enable(struct mtk_base_afe *afe)
 	return 0;
 
 err_clk_apll1_tuner:
-	clk_disable_unprepare(afe_priv->clk[CLK_APLL1_TUNER]);
+	clk_disable_unprepare(afe_priv->clk[CLK_APLL22M]);
 err_clk_apll22m:
-	clk_disable_unprepare(afe_priv->clk[CLK_APLL22M]);
+	apll1_mux_setting(afe, false);
 
 	return ret;
 }
@@ -406,7 +408,9 @@ int mt8186_apll2_enable(struct mtk_base_afe *afe)
 	int ret;
 
 	/* setting for APLL */
-	apll2_mux_setting(afe, true);
+	ret = apll2_mux_setting(afe, true);
+	if (ret)
+		return ret;
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL24M]);
 	if (ret) {
@@ -431,9 +435,9 @@ int mt8186_apll2_enable(struct mtk_base_afe *afe)
 	return 0;
 
 err_clk_apll2_tuner:
-	clk_disable_unprepare(afe_priv->clk[CLK_APLL2_TUNER]);
+	clk_disable_unprepare(afe_priv->clk[CLK_APLL24M]);
 err_clk_apll24m:
-	clk_disable_unprepare(afe_priv->clk[CLK_APLL24M]);
+	apll2_mux_setting(afe, false);
 
 	return ret;
 }
-- 
2.43.0


