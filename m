Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA3BC88E64
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2026 07:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UiWyf1Dh9nthmX1SJ2zMjXD0YayBfWTFNKR/lg5M5tg=; b=z4Mi2q2Zp1n7m7jy199OPjXWwZ
	WyEdjf6bCfvT16R0fU488zCS4zaxpVDw8nGd21IRrhXUKwaLzkjS0LzKoGIMIVIZmNIUYNAUphyNI
	1FddPv1yhMDHlcihmYyC1SncGNDHFWqdazOO3Z8xvivnr1kUSSR79Jhq8xywigTaFt8QGMmXrBoht
	22ILmm/BUtAZ4r/Azkw7M0MwfUAStoHa+9dKD0gPoAyNMgMh7NDcM+AIzvtxoPJ43QL8qzNqbAtQK
	zPqkdkEd34aQl/EmyTbnmyTRwqj6u/C7zhxBKGL5DMagi4YvBJFD9Capd/aLcQGCmy2WHD/inahIV
	JKeVtd2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x617i-00000002Y85-0OwE;
	Mon, 14 Sep 2026 07:29:06 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x617e-00000002Y5r-4BaY
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Sep 2026 07:29:04 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso2855315a91.1
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Sep 2026 00:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789370942; x=1789975742; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UiWyf1Dh9nthmX1SJ2zMjXD0YayBfWTFNKR/lg5M5tg=;
        b=ptEsveh3/MKdB/i09J+oYfEwMs9Q/vRLybYZ41xRGKkCzH2LPOLHkbVHimE0CuNAy9
         Df0FFJwAK9m1ePxSfsIbzXs7a5pWpJlXFBYHIa64DOd6Nv9CzHKzK+Db7YkqTco9xEHE
         ilnF8TbjzV6vMihXs+lxpan7XxH2kgO3pau0bwv1IktQvT+8MC2UUmtgxis8lJl4DVNh
         W4aXYnA3IdAP4wYIhgGvHxX6XXrKTakW+Ewd9zA+joPyzgf2LlCRwemO20IpgVujIt2H
         vl7Nj6eFUmUgkm/tymvDv/fLtr4a9q6A4tbixDkHSVHy2LqhuhOHtV68ujuTDdZJCCMD
         p62A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789370942; x=1789975742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UiWyf1Dh9nthmX1SJ2zMjXD0YayBfWTFNKR/lg5M5tg=;
        b=muFBpV2idP0+sXbKXiUTWWiMOwNKhiLEIOPK0WFlwz4Fjp2Db8aS8fa3w3mi9eQ6sM
         7NpzPjyj3dEAyngDTIGnvB1LpxKIcXTsNaB+absWzD1EeHKB2A0FsiTuTqUt+ebcTFdu
         +3KHMjY5XpPc5i+MymNQMBa/B/TNd90cqsIsQoSkLn37vagNJkyC+cD1QeD4P1O/PjKN
         wYTyuiK/rsqVQ6EYY0FMM43LXKZr6t7dmp2K8d80wgVhw9+djSsouk0x3T9XKpJJ71+E
         Ft824zBlYOMNlGXgGl7U69V+F9l7xUQg8R12HjkWUPZ7Rrr3/V8GMIeUGaE0UPgay7GZ
         fM6Q==
X-Forwarded-Encrypted: i=1; AKwUvBwYCh/CYNwCUm3Sbzib2RK9dmfYUsi5ZBBkLJF0Oug0weJ4uHubwrpijncm8o49lpYm8cy2y14Do0QN3r/4rw==@lists.infradead.org
X-Gm-Message-State: AFuF++ku/E5ojcEYzYnDABAgJ8e9dPos5iXYgmrRSezuTwe5904g+IM9
	NeKTQBxGEPybyy2zO7bqQ9OBsKTr80Yf3peKXnL3LNlw0U+QXzkU9wRc
X-Gm-Gg: AYBFou2XQ1b2mX5Brl0fcHzWDoU1Ps3VpLC2wi8HV8ZVwNwwKq9JreEZjQrKYpbQ9yQ
	/l3VVJyueJV9B7ZY7WlSQbU49v6YxBl1soYIBeX3aixgStpMhX4/g3jN2GsU0J2ghCSWAXGVeqZ
	RtFjxYwAx4d5D3A4fLeIFSejQC8rlGO1K+FsDj8nX1J3hu6jFZzaXL6Vq5BmLxGeSu5dkda+szz
	ktIEPULVNGNZmqr/DlVNNgz3Y7mkaC72zYiZcgFlbCZH8C0OK4a3Ijeh92YB/rCvgmTWHrClbci
	oS2hKXE7gh2WPovfI9A02i4nTSlbgnXZ/AmwrpeZcyEUA9g/cp1/ISOMTlpD0NwvqQM9aNW2DS6
	G/p1gdiCgdVZvpVhgcmllKRabGgYCkotfhkL6wyV0J0dNxe7FX9n7VU1IzbO0624s8fiM9hWbKC
	53FeApQURBcsjRDfOA1qE2SX32YpMpwgPtgBrxnXkdBHWY49HNaLgXfqsyPCmNElbeiSQzJcodI
	IfFvnctvMiKYgJ0sTqP+9pNlI2Ec7fYx+vQTz5/xlzEV5k0WuyrC4zMeKCUnph/I+mQh90IFPBu
	SNXi64Vfh8PfXWVMQ0VqLPIFBg==
X-Received: by 2002:a17:90b:582e:b0:38e:9ef9:eb97 with SMTP id 98e67ed59e1d1-39dec08daf1mr3030942a91.16.1789370941989;
        Mon, 14 Sep 2026 00:29:01 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d957131f9sm19598245a91.12.2026.09.14.00.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:29:01 -0700 (PDT)
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
Subject: [PATCH v2 01/13] ASoC: mediatek: mt8189: Return error for missing regmap
Date: Mon, 14 Sep 2026 14:28:30 +0700
Message-ID: <20260914072842.24420-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914072842.24420-1-phucduc.bui@gmail.com>
References: <20260914072842.24420-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_002903_047487_871FE9AB 
X-CRM114-Status: GOOD (  11.45  )
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

mt8189_afe_enable_top_cg() currently returns success when the AFE
regmap is unavailable.

Return -EINVAL so callers can handle the error.

Fixes: dc637ffeed6c ("ASoC: mediatek: mt8189: support audio clock control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
index fc7a7a73b0cf..63e03a40dbbe 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
@@ -236,7 +236,7 @@ static int mt8189_afe_enable_top_cg(struct mtk_base_afe *afe, unsigned int cg_ty
 
 	if (!afe->regmap) {
 		dev_err(afe->dev, "afe regmap is null !!!\n");
-		return 0;
+		return -EINVAL;
 	}
 
 	dev_dbg(afe->dev, "reg: 0x%x, mask: 0x%x, val: 0x%x\n", reg, mask, val);
-- 
2.43.0


