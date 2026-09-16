Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE932C88E7D
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2026 05:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B/w0mflA4CW2wen443DfpVvqyUW44q6NA3gxSFkvPnM=; b=B/QLPclelFqrlnswLd5avPLlrY
	zsjKLzoUDXcFKHLtZqaj3MdBAQGMhvqTyh3T3O/pFoUoTNQoQj491TL959ya5XnKQ1+9eVagPLnm6
	x9J2s0Iw0svG9gHkO7EkaDcpoiEBnVCvZ/WVHxNiOzYerpGDwXmSaeBnJk1TkYX8uYw7HeuSTRo9a
	hSFqVU1aZ17+69JtYQ0LBMbvDDg2wwyzQy4n3mF3k3jjrPnywq/V6A2EYqpUzLxzMgxa3nNyDev7i
	jED67difK3AB6U41LMr/eEwQlwqB+ZS4mY1bKAjIk5RvjuHY5rME8lXuW2f78XIwWG78t2q4jdHkn
	rOBEE3jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6hlU-00000008LDn-2npX;
	Wed, 16 Sep 2026 05:01:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6hlN-00000008LBl-33Ep
	for linux-mediatek@bombadil.infradead.org;
	Wed, 16 Sep 2026 05:00:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=B/w0mflA4CW2wen443DfpVvqyUW44q6NA3gxSFkvPnM=; b=l4YLLUn0bXHFQtzhFvu7KP951B
	wyV52Mhm7ikkm440Hbg9To5b3Ptpem4qdLCAf0qnthqXcIrKVYqfbaSifRliEmtY639E0YRh3rnNz
	BvVVFnFbJHVWF7xyM/OB1MzGLxdr4rt3qUw4Ou9ClffAtV9VZoI5uqgUcse7GY3525PyZjVTCOZUI
	j/Bm54lMbM0iotUbcu/ecHtvf4b9Hkdcm2qyD3eaaBNYPw/eAuK120tN1RpOBFl31rjyyFdvqQDJS
	X78jm8oSFY4vVyRHdPEXJRb6IuF8EcQxcKhfXX57iFf1/sezv3ElSGGj18b9iOfX+tOX2QgctmA+e
	u5T5u+7Q==;
Received: from mail-pz2-x0f.google.com ([2607:f8b0:4864:3b::f])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6hlK-00000007UHy-1YRl
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Sep 2026 05:00:52 +0000
Received: by mail-pz2-x0f.google.com with SMTP id d2e1a72fcca58-85469e25400so373762b3a.0
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Sep 2026 22:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789534848; x=1790139648; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B/w0mflA4CW2wen443DfpVvqyUW44q6NA3gxSFkvPnM=;
        b=eJeLO3yRMuGmLyCtQsN4VVdMcZWs3rupbkAk2zKtqO6AEUsjAiT6P/m9HNYY2fvhUz
         ID7eahrA9XkQs0viKt3lDwNLShUdiNxLm8YMsZDc5/Ov8gF//iZ9jeNGoOt+5Kw+bRQp
         OhMVjHNqFaTy2XckyiaCbs0N7V5qYpcx32Nf0aQ4a6SeyLHftSLkNT/xcRbjOmHLN8hd
         6RKA5TBk/3aytU186HrL1I7wDkVnyyXhS1V83k5C6imtfgNavRYBpL1mYokJpPxha2ag
         IFJr+t31URUJkFZxtfFGDbIWLqB184l3waotXlVyE0sJ0PqYSFnrCVKbfYIA4tCvSi2t
         rEvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789534848; x=1790139648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B/w0mflA4CW2wen443DfpVvqyUW44q6NA3gxSFkvPnM=;
        b=szv8Tp0ynRwfvTdnoaeixpNelr+pVbdTK5avN+0BkWox3g1RTpuVw3CwY2OnjUbPyk
         Uxm8kWq95wqnl4xtNlH3r7M4ddOv2XPCQLWAXmwGfmMV/wLFy7Ov27yPLQo+mdGfAed/
         ciChT90O6gF7OwrmcK+be6WGWWioQ+TFMtJuWunsDSykSu45ia7BbwOsQFpviv2DpAQ8
         WRXTqgnzwprqwEVIm9n5dNc+O9/DNKqm93QElPQalWvnOc3QmppGUMMOH+6K30JrUBfZ
         dIPEiKPybSf+oJxm5jqT48/37QhJrxNzF3CdWJ5NzaZ+Tj7gH6xlPR9rCOfBahsJUcdu
         YghQ==
X-Forwarded-Encrypted: i=1; AKwUvByvfoxF2jvy7jQw3aISv0/fTpM4hxAklWacZTI/rfQ9e9OhhHQd/CftyJhKp9IxaLQnz0xJslrINQyjLXG85Q==@lists.infradead.org
X-Gm-Message-State: AFuF++n/gk5akAS87negM2qlatGQuXbXu26f/pxReGIiVFDt6d0aBJ0t
	5/UZy0U/y6O5YONHXh4hF8HixV+NkrKA6npOGHCIzOUR2KVg7UHeT+CM
X-Gm-Gg: AYBFou2FtPkWf1CYg0NH4+uuP8j1ILXVXnHv4TrG5apSoKsGgOgVQB6U4U/FDORq66j
	xrOFRKLv81foPnPjG8/kVvisjWH2i841lK29MGVfIOmrKoIdDYOsi0Atfnp81xWwNZ1ZQ7+FR49
	h/BOLPnz9aNfmTOQiQT6SNkwiEmm9fxvp95jfKq4XUva88d62xkZ1vGUQsQi/K6btwCtRVbUWFn
	47HLvn50G/Lcvn+o3WAPbK7qHxDi9q01xFgK0wF+DutpeDAjJ0vWSoNI44aU3siOs88kg/RNxNm
	BzUBGgmZqvJ4iL3Z0witErpRruDuzf0KN6+iGcnRI5WKQ7+xOpeGNBIdraKsK68rhMg0i0lK4aL
	KeFixUhXFJ1+OgpDS+yGYQQhlgkcyyjEi5Ok7lTdFNVk06GGtKKhWs2psNOh5eMhSvDrRKtJBhZ
	wagIrSsobpoPzDH29VTtDyTtj8Toxdi3ZA6Neosfg+JJcIJ11leihoA1RFLqliyxfjBUD4NSqzg
	kTBq08/vFYKbZPhLDUYmGMpoGTydyubbuBJ/7bYH+VYtHy2Spi5gn413fKC4DvQhupOdKgVey8f
	5XzpjJlbr9w4kpQ=
X-Received: by 2002:a05:6a00:4185:b0:845:3033:6cb7 with SMTP id d2e1a72fcca58-87236ce44a9mr2291018b3a.9.1789534848308;
        Tue, 15 Sep 2026 22:00:48 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50abb1776sm850589a12.27.2026.09.15.22.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 22:00:47 -0700 (PDT)
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
Subject: [PATCH v3 02/12] ASoC: mediatek: mt8189: Propagate MCK enable errors
Date: Wed, 16 Sep 2026 12:00:09 +0700
Message-ID: <20260916050020.14575-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916050020.14575-1-phucduc.bui@gmail.com>
References: <20260916050020.14575-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_060051_160838_9B59D4BC 
X-CRM114-Status: GOOD (  11.28  )
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

mt8189_mck_enable() currently returns without restoring the clock
state when setting the clock parent, enabling the divider, or setting
the divider rate fails.

Propagate the error and disable clocks enabled by the function.

Fixes: dc637ffeed6c ("ASoC: mediatek: mt8189: support audio clock control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Update the names of the goto labels.

 sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
index f088ccf80448..56362c4756c9 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
@@ -639,7 +639,7 @@ int mt8189_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 		ret = mt8189_afe_set_clk_parent(afe, afe_priv->clk[m_sel_id],
 						afe_priv->clk[apll_clk_id]);
 		if (ret)
-			return ret;
+			goto err_disable_m_sel_clk;
 	}
 
 	/* enable div, set rate */
@@ -650,13 +650,21 @@ int mt8189_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 
 	ret = mt8189_afe_enable_clk(afe, afe_priv->clk[div_clk_id]);
 	if (ret)
-		return ret;
+		goto err_disable_m_sel_clk;
 
 	ret = mt8189_afe_set_clk_rate(afe, afe_priv->clk[div_clk_id], rate);
 	if (ret)
-		return ret;
+		goto err_disable_div_clk;
 
 	return 0;
+
+err_disable_div_clk:
+	mt8189_afe_disable_clk(afe, afe_priv->clk[div_clk_id]);
+err_disable_m_sel_clk:
+	if (m_sel_id >= 0)
+		mt8189_afe_disable_clk(afe, afe_priv->clk[m_sel_id]);
+
+	return ret;
 }
 
 int mt8189_mck_disable(struct mtk_base_afe *afe, int mck_id)
-- 
2.43.0


