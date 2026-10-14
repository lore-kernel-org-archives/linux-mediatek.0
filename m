Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 332EDCC6B1A
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2026 11:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SMj5RS0n6pbkUqFdhGQRRbzMFnFW3w2l71as0HdhRY8=; b=mtYXU7ocR7tvmZz74ul8vJ1S0b
	g2LKUWLJ4e36EQVZsiWg0HZf5Fk3TmVLg6pCjybFgsXeZwBlkZfc8ImmE5MW9dj4EnLJzhYGnh52t
	gWoxfRFk4sudWkhWmUcrT2zj6Xl8HWiK1GXTSUyISO/BEaGZBijGquxecv/VsmDE73C1Pd+nWQXMT
	06kJ5/LWok44Fqr1sUIZH/An7WLTDTHZqkIjir7GWiqTFdOHDxv29glpSGxOCEVpMfUAT892laAL2
	nbRnY6b0g5Mz1+3m/F8Joaf83KF0P5Af63JDSpIfVWYtoI1fMm8Mlnx3mAdBSyhlYnp2Oswy7heHl
	bdCiUaMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxA9-0000000FJpm-1QM0;
	Wed, 14 Oct 2026 11:28:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxA6-0000000FJmV-1VBV
	for linux-mediatek@bombadil.infradead.org;
	Wed, 14 Oct 2026 11:28:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=SMj5RS0n6pbkUqFdhGQRRbzMFnFW3w2l71as0HdhRY8=; b=YG2Ql7gVsCBEj9q1livLvaCpNE
	OrkZVgDIHtOaukWLqyEyyiLd/bONol8RB/LrLJ35VBVuK6tgHurhaxjpE0WXZyFCANEVAGVBHn/Gz
	gEl/+RWgIxv4txh5gChfJPzdty3RWe47EPlbOgN/gj51pR6TG0NUndNVdS8oeFBqHMDgySZrk2k8R
	xPlRj2ktDGM/SWcFKFd+g/KTICj2fJHNltlJe3PTEVUtrfGBAXYgGZgHx6iGcTIS9AGVc/kopRO/+
	UsA8L1fpj7sJ1h/YLUTB9+MYheyS8wUUc6LeSdO+XLzkE2WiseYo19m2kI/7fmEwoFJHGxaghnIl7
	VSt82kbQ==;
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGxA3-0000000Ggc7-2OLm
	for linux-mediatek@lists.infradead.org;
	Wed, 14 Oct 2026 11:28:45 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-398a4dcf289so2094610a91.2
        for <linux-mediatek@lists.infradead.org>; Wed, 14 Oct 2026 04:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977322; x=1792582122; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SMj5RS0n6pbkUqFdhGQRRbzMFnFW3w2l71as0HdhRY8=;
        b=VxWol8coAhVMrD6LHHo4PuBfStLSh90f4BBCLOadUAyIvokLjfDwI+5ZOg5DLO0250
         p3xQxd/6qUhHMihpkguly11/lbWl3HXHas531Z8YaJLu9DXXQcx6z0QJwjyxGPyUwGVZ
         yOPsUONoM8o3uWvSmfNjfm7f0HH3f2Y3TAjOY4avKWqn/OY1TP348fgxpjOyrpHQcXp+
         dS/7ICGzxq5Tr1xD56X+Tmjf5NXwsyIAF2t8+bNp8BuJ3BkpwLeU1bBudiH62PeQSW2b
         S0M1c/ll5L2KDfqp34lSrFXTiMMEoV3emvCtX/lO7EXKi6qR7OzUyeX2TTrZPHtOQ3+W
         1j+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977322; x=1792582122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SMj5RS0n6pbkUqFdhGQRRbzMFnFW3w2l71as0HdhRY8=;
        b=ajERgnfNyxGiJ3P7mp207Mt729+vh2Lw3wOUOteBYishN2dy5ygksJC2DkQWgBhgl/
         V0I5/h4AvjHf9oCQYrl7K91OPUtYBv4rdTm8HvK3X3OFWcJ+GXPffRmo7rIcZOJ0yC/x
         YETpLq5nCuTAAf3zwd4TVSXtYnijXKOVS6hzd1DTukevQcyu91ehnaSrBtC+nCWmOf9W
         b9WNlt/+qSVphFinu1J3fSy/1jGYxcla43XLAEGvtKg1gKiYzYmD/GoerEtm0A2MISKG
         GEW4YO69wtEjWSKGWsvQ67b1qF4yduGYVa+7VOeZG65yIlpZ9meAvWoY3OxsDDpZTDaG
         NR/A==
X-Forwarded-Encrypted: i=1; AKwUvBxy4HIuRpiFG4ZmUPII8vqEwVkgmMVX4RF8kxGiQEPV5NEXVCJs5v7zB2KSSmlOUykPhnCV8Zm4JYrAWPdi1A==@lists.infradead.org
X-Gm-Message-State: AFq9FYJMX/NWLaZYlHnvjZ1VhqM7r/HJlxN2o6NCrlLZ/LMLku/TnNAI
	6yKNQhcfJVSMrkfNKTUENhtd3RGa4KZns9cUrbe/IJ3jhK4IoIpfv+hu
X-Gm-Gg: AYBFou2FfNL2QgfhElGQwov6WsyHYaNM5HyE3m7Jn8pyTmlv7Au4pwb/XzmPwAr49K7
	FMom/oi8+0N7MbGZuDSKoL1qOSaX0+TMxZEeelxMROzJ2PCyMagBw1AX7GffYQlShc2pys79ef3
	z1QidibS5O3nMXOgx4cUYeB3RJxJE846b7ENJe5uBXGoSqksPV9xr/5MlTkedU+hKtLsfJusBiQ
	AsrHrMPNl+TFbiUdyqqHKGU0SKY51lLhnxT62WZ4ASyQT4OdS9q0AjU01jZWIR5FuTLW5898VzS
	3jEAovvS7wHvu1mEiYipqqENlJntMY7S3Mc09EFHmNghMPVK9LNSDb/EDPnkxA0TeE9GgXXK9tK
	wibc2dUaqJtpfxIV7mx40Rm1m+nmDNz7on1qhmFvANJUn8bXyDA6W6kCAZ6BM8G1hpxSV6hy2IO
	CPUnY6zpHP1EB3P1Z3vcx/P2Lx6prhcYz5+xj32AWOBQa9Zwi1jmK81iAxefD36HsR/WmB1BPQ/
	3/W+AkRO0O7XtgAfj0fWnRvKG6WBqvzGDPjKB9SvfifGl0fQOvj6y5OsnfXFQnqIAPABWHvGKxA
	BNMxAfNLGs9AOA==
X-Received: by 2002:a17:90b:4d88:b0:3aa:6b5d:9fe4 with SMTP id 98e67ed59e1d1-3ab3a952849mr13118979a91.12.1791977321825;
        Wed, 14 Oct 2026 04:28:41 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac61171feesm4077076a91.17.2026.10.14.04.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:28:41 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
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
Subject: [PATCH v3 05/16] ASoC: mediatek: mt8195: Fix main clock error handling
Date: Wed, 14 Oct 2026 18:27:40 +0700
Message-ID: <20261014112752.683032-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014112752.683032-1-phucduc.bui@gmail.com>
References: <20261014112752.683032-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_122843_840684_20BFF273 
X-CRM114-Status: GOOD (  11.72  )
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

Check the return values of clock enable functions and propagate
errors to the caller.

Disable previously enabled clocks on failure to match the
main clock disable sequence.

Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c | 23 +++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
index 03d2c4fd1f85..44cddc2b1564 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
@@ -716,14 +716,31 @@ static int mt8195_afe_disable_timing_sys(struct mtk_base_afe *afe)
 
 int mt8195_afe_enable_main_clock(struct mtk_base_afe *afe)
 {
-	mt8195_afe_enable_timing_sys(afe);
+	int ret;
+
+	ret = mt8195_afe_enable_timing_sys(afe);
+	if (ret)
+		return ret;
 
 	mt8195_afe_enable_afe_on(afe);
 
-	mt8195_afe_enable_apll_tuner(afe, MT8195_AUD_PLL1);
-	mt8195_afe_enable_apll_tuner(afe, MT8195_AUD_PLL2);
+	ret = mt8195_afe_enable_apll_tuner(afe, MT8195_AUD_PLL1);
+	if (ret)
+		goto err_disable_afe_on;
+
+	ret = mt8195_afe_enable_apll_tuner(afe, MT8195_AUD_PLL2);
+	if (ret)
+		goto err_disable_apll1_tuner;
 
 	return 0;
+
+err_disable_apll1_tuner:
+	mt8195_afe_disable_apll_tuner(afe, MT8195_AUD_PLL1);
+err_disable_afe_on:
+	mt8195_afe_disable_afe_on(afe);
+	mt8195_afe_disable_timing_sys(afe);
+
+	return ret;
 }
 
 int mt8195_afe_disable_main_clock(struct mtk_base_afe *afe)
-- 
2.43.0


