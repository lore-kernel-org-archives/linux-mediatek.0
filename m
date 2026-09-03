Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A32DC624D6
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Sep 2026 05:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jrW30Al+vmkO4YXsfGyVaS6XNDTUobyD5Gl2CjSaQLg=; b=x+VXTycGFLBxN8nHlW4yCt4pzd
	GFTDKovdyAP87CskUUpFhVcmv9yu1CLzlhCAM2neCFjkF4FU3ZG24K0QoAxtKRqN+ktm2Mt8YVcZA
	uy/HfoiCimyPsOg5az27eKHjKiRpBCQBu4YXdRbMOqRx4PL+mNkMP041PJtxVcCizNOzaZb9+joKt
	V/VScHE1uz4D//depZMb72JXIWmQ4M08wGZMBy2MlFjcOwgDdD2d8IMhwA3OsnGESbGWyD+4u3JD9
	xBdoNJ/z5RRgnAkR0qVDVMyB1vZJikGRJ9aqqRxtFhmGO+A7+N0eMoP060EZmRRk3KYg3uBL71+gN
	wxob01aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1zkh-0000000GNFk-1THC;
	Thu, 03 Sep 2026 05:12:43 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1zkd-0000000GNAg-3ELe
	for linux-mediatek@lists.infradead.org;
	Thu, 03 Sep 2026 05:12:42 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-398b3d66515so2488810a91.0
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 22:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788412359; x=1789017159; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jrW30Al+vmkO4YXsfGyVaS6XNDTUobyD5Gl2CjSaQLg=;
        b=Q3tatcWHwCVBpcStlIEPbM035hCZ5qKUnhtes1xygXf4OSDTKVsO9Z5VWL80nV4tuf
         xwImAUuGmJizNPI8F0VL8MviU4pWVuxz572az2k4Pdcg/pcxfMt0Wl5c/QUcyVks/kYS
         TQii71Vu3Y01VgqNM6MYgqa3j22jBUyahi4EegTKSg7l5zCmYa43oL3FA2InbO2nZ9ix
         uHhg7nSy3kEEJNeNT6w3l+GILSv0dJyR9ZAoDKc10654JSUVi+exyBfb5jyx0tAr97JF
         kWDVMcITHTMhyAaUfL0SDGhxYx5pf1+dOxwAcfGDusWCPP/Aw4rO8Vwu+2vSPScO7ej5
         McyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788412359; x=1789017159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jrW30Al+vmkO4YXsfGyVaS6XNDTUobyD5Gl2CjSaQLg=;
        b=XFmpY+HcBOJxAt/FYymAZL2ogpyk54yWS8lo5knE4Af5aitwP2AIaLzXBsKmBoa7Mb
         LBQzIQBEwoVwvqw+JkStnPZfHfxNoj90BuFBuMYnxNPMiXwzNidBCYtEupjiby4lIcDG
         bu75AD02zFp9QyFluY3rrfh9tI2+VX4Lq9IIzXh9VjP87ghkjUsMezNwl0Jt8+hJuWfU
         Cq/6iTVjG+Fbaeze+KOqCB9h5ub6agdUrtCTZrQefcK/yOxO4c6MhM1laA957unMmKfc
         YFqiYp8t/GCH4XzeS7j6wKj/OYKwqvWTKwK0bvKJsZo2CWy8yfNvXJb+9t4eaxAaC2bQ
         kReA==
X-Forwarded-Encrypted: i=1; AKwUvBySbGIy1HurXBPFsgkciZtpoERsMETNauHSeGeoib3i+//H2LIdnEVleZys80+Uhbio1nUyA/TZ1JKfSlV0pg==@lists.infradead.org
X-Gm-Message-State: AFuF++n0fGXAY5G+1yss436CMiMBZTAu0/plakoC0fNrnpCMg0JKBBCf
	DdaL5bY4M/EE4Xkt7RBVHFWBjFbOSReKw9kMtWF3flki7XDEGdlEJoPo
X-Gm-Gg: AYBFou1TdM/w8rGqwg77Laz0+wPAKpsn1tk5hV8LHC917I4rEfWNGEN8g9crARQYQIs
	ckWqIxS+4gyvRZcANzx6sxy5zzoAltZ+uyQgmTLZKbr3k7v/4u7Qr9ZnKr0n9NagFpKWQNlfP82
	ev4G8B9RuKgqt4HKNmNn/E6n94OifAS0ZEo+5mUHepVforKLh/hYZnOODZi96H3zaCuEj21z9Jw
	54iCTpWk/qtrp79e/K7ReDEi7AvE28A+M1xvei0J3TxZUZRNKMvpyo95SLb4enyW3ElU+QUJzZA
	xstXRRTzSu9qjRCp0W8kA7EpdoIoQmLBjpOjZiQ/xOL5NYeuq1GjoJ3b6OL4cnqh9YsCTD8LBHo
	a5c2v0HCKLjfqRUo6aBDL/U66m3BYiNi3DN78W9o+U3GMGrRNBWHOHqXTbmTadYJrFvFH43tS3I
	4iO4TMd2qFSIJfjCjKUDMrVo/eKL89m99IFsVooLso+OjXtCYsa2YM0uJtFUjxU+b/RsEHrnTXx
	iIaDpPvROkKdhauLMFfJgSeYS5dRpacumWL0vUsXM2Rk4QXi3zyTT5NkCbz0CxyqalIvtYkIUUa
	pO4X
X-Received: by 2002:a17:90b:3842:b0:398:e46e:ade3 with SMTP id 98e67ed59e1d1-39aee22248fmr14029377a91.23.1788412358993;
        Wed, 02 Sep 2026 22:12:38 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b0875ce14sm3218092a91.13.2026.09.02.22.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 22:12:38 -0700 (PDT)
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
Subject: [PATCH v4 7/8] ASoC: mediatek: mt8186: Handle regcache sync failure
Date: Thu,  3 Sep 2026 12:11:49 +0700
Message-ID: <20260903051150.178057-8-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903051150.178057-1-phucduc.bui@gmail.com>
References: <20260903051150.178057-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_221239_830294_09213FFA 
X-CRM114-Status: GOOD (  10.84  )
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

Check the return value of regcache_sync() and restore cache-only mode
if synchronization fails.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
index 44a521c3a610..143386c54dd7 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
@@ -2743,7 +2743,11 @@ static int mt8186_afe_runtime_resume(struct device *dev)
 		goto skip_regmap;
 
 	regcache_cache_only(afe->regmap, false);
-	regcache_sync(afe->regmap);
+	ret = regcache_sync(afe->regmap);
+	if (ret) {
+		regcache_cache_only(afe->regmap, true);
+		return ret;
+	}
 
 	/* enable audio sys DCM for power saving */
 	regmap_update_bits(afe_priv->infracfg, PERI_BUS_DCM_CTRL, BIT(29), BIT(29));
-- 
2.43.0


