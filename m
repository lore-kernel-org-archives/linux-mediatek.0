Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A60ECA5FF0
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Oct 2026 11:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9TPAdVO6cx1GivG1fZmlwZJr0XNJ9YraoDL81c+GXj4=; b=vfMzy8AtO3pF7YIngkFwZS1Oe/
	65zpV54WAwLOzECiwM4ncfM4Xb8JREg2svcvTBTjvcxNljEZypiI9kgWDBNtXg4GJPH5Oe0GCLUrQ
	cUZPNaxfkSIax6xakBlclr1YWn9El34Ytx+DWePsyMUXAUDJ7Gfg1P9BlA/90FKuVqy5RhJXHYohp
	eujCGMS0Xfa5V84xIPnS26RXNOhxj+17tXCRY6I5nlwIBTeOqzA11n7x3tuPp0atgL4A36PTm67Eu
	gL7A3k2YX/HkTwmzfx8hs/seG9Rg0WWij7DUSCDeIol9sPxztZZmFENHfbPc4rE6vfXtEwPXqHHjy
	Tj9Oe4cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgTk-0000000GGv4-1pha;
	Mon, 05 Oct 2026 11:03:32 +0000
Received: from mail-pz2-x29.google.com ([2607:f8b0:4864:3b::29])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgTc-0000000GGpX-3xIi
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Oct 2026 11:03:30 +0000
Received: by mail-pz2-x29.google.com with SMTP id d2e1a72fcca58-887ba76d5afso611398b3a.2
        for <linux-mediatek@lists.infradead.org>; Mon, 05 Oct 2026 04:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791198204; x=1791803004; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9TPAdVO6cx1GivG1fZmlwZJr0XNJ9YraoDL81c+GXj4=;
        b=Vz3Nkg8eHX+w1FtXwVak5CmoqOs15bO4iv6GZtEZG++hLlufsvLM5/cFW/pvUEAP4h
         As+Q1D66OuhSxBBkrZ3KOLqIQxsFxDpD+ijFuGe+Ue8hLZyAyG9S60dOtxVgcWQAtxeE
         IfbX/IIhJzq5xCK2ZysKH/y+pDAUJeYP99uMzZo1FO9l2iN+mDMsDqaujJV+wJ8/2waI
         8h0dVVYMA44oPw8jyzOxSyX19ia/q/0yGj4tublXtHS9okf7/UVdqwy1ggSWgRa4PB+t
         SkHGrDwuCPo8UeR2wHIC/nbq5YkisYHvofJVs9LGYRRqLiZCeD0RVJ7Ic6HGCGFnvOdE
         vjrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198204; x=1791803004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9TPAdVO6cx1GivG1fZmlwZJr0XNJ9YraoDL81c+GXj4=;
        b=M8F0qjTw59/kv4NWdm94+QrEi4t4fw2qFDhM2/wNcHDXLC5bdKrZgEVLtCs4lHFJBA
         SCfL08Abi3qF4M0l0mEgRnIVmlTr0b4pUBZSjvD4UV1pSS13iphAYr/kUkJ0GSi+xqJH
         Gk09zOdgkaqJSzORUF/xq7NZr16NpbpmWTKgKKj8r4bPPk2rZ/Zt5WnP4t0lXppnVM+n
         lXggqILo0nQ+hxEvzLAGxlX4KUMchuJ+sGMLJe/BoFR3i8GGJmOKUIQiwf4YWmIlB/Mx
         ySV3a2+6zBdFble1u8eV2Z/I78FrXhAKzI3+g0Aw+JuUcB+gxFnbbRBdZBFqY53GOBAi
         zeug==
X-Forwarded-Encrypted: i=1; AKwUvByvSAfqdXFAFzNXHDcXXBe/XcxB757j9KKNzwZiFZbDOo/9F8+gmeh4YZJemqYTHLf8pySCRuZV/IPqhDlirQ==@lists.infradead.org
X-Gm-Message-State: AFuF++m510q3OHVKX5wJkKQPi8gRWBv7x70lhfQ/zzT7KrEC6cXP39c0
	niZOnz2RxCuv1f01VZMe5wlfBbA0QvO5JuMPszkYXci+Q3n1rKG4DZ3s
X-Gm-Gg: AYBFou0sdcPtc3xdCdaB0toqJObOfVXArz7IfrDuSVZHANBljq8XivrVuP2D2MlC6Z8
	wwQj4QyVMWOZoRqL5Q/viKEjqBIEzbWYiobZGB0NFpk26qZGtqWYtUUGB5RdgvMuUgaUu8oYgNd
	c3NyZpH/9BsKD05fmWmeqlEKb/Q/kyeF46IAAk4BMjgySbFivH4E0nCCnEzZp+IC6IbSIrka1Vq
	/lEC61/gjP51ZUT8ExV3WW8a0RoEePALL0zs0o3RMOoMbOVQKVlvx1n2lxVQ2kVz7mgsHPj0odt
	7frIYhhzc2w1CP5wmwrC4BaOLlzCdSwUqnhUuNmyH2An4rF4SzYQD5fPuyN5LahL8RR5O9au3ZM
	eI5s5VIm7AtqO0umL4+PkyFg1ZvEdFzmFFF3ZIWx9J9CV1kxwC90ZCvg3sKzp34RgA2dyx2iMB8
	X/lIqUm0KEJZYUSSeLNdjlyxPUnMlTjfqeLmIySuxLYIyL72C+ZE3CCa0W92VmIpxbmCnFeHKqB
	EXbeDpnOgt5YDmXWBxRhbNQO+Q+TD68i2tTKfNeh2BvEx49RePlcKevFXGBQ6PM3fgpRHfumcN7
	aSxZWw/QQ1sKjg==
X-Received: by 2002:a05:6a20:9c95:b0:3e0:da23:8746 with SMTP id adf61e73a8af0-3e0da2392f7mr6761110637.18.1791198204336;
        Mon, 05 Oct 2026 04:03:24 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d334de5sm626498a12.11.2026.10.05.04.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:03:23 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 02/14] ASoC: mediatek: mt8195: Use dev_err_probe() in mt8195_afe_init_clock()
Date: Mon,  5 Oct 2026 18:02:45 +0700
Message-ID: <20261005110257.50145-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005110257.50145-1-phucduc.bui@gmail.com>
References: <20261005110257.50145-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_040324_993465_E5712B31 
X-CRM114-Status: GOOD (  10.46  )
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

Use dev_err_probe() when obtaining clocks to avoid redundant error
messages, particularly for probe deferral.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
index ec1ea5b988ff..12d8159338be 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
@@ -397,12 +397,9 @@ int mt8195_afe_init_clock(struct mtk_base_afe *afe)
 
 	for (i = 0; i < MT8195_CLK_NUM; i++) {
 		afe_priv->clk[i] = devm_clk_get(afe->dev, aud_clks[i]);
-		if (IS_ERR(afe_priv->clk[i])) {
-			dev_dbg(afe->dev, "%s(), devm_clk_get %s fail, ret %ld\n",
-				__func__, aud_clks[i],
-				PTR_ERR(afe_priv->clk[i]));
-			return PTR_ERR(afe_priv->clk[i]);
-		}
+		if (IS_ERR(afe_priv->clk[i]))
+			return dev_err_probe(afe->dev, PTR_ERR(afe_priv->clk[i]),
+					     "failed to get clock %s\n", aud_clks[i]);
 	}
 
 	/* initial tuner */
-- 
2.43.0


