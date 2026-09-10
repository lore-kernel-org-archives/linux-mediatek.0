Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C56DC79F9F
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2026 12:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X0f+3hmpde177tradfD9iqffBrSGUNX0UYvHhWMmKXM=; b=AYDDH1wP2urcWwB5yWCQZuM3as
	MEtQWKZW76YXVh4tKi/aO/s5+5FQlIDI4BUIS5C0YOg9SKG41pN5bdvBcsTB9/pUOvkg6PeDv6o27
	a33/PiGrXpH18cl/zV4lTyh4zAGjewTtWxOjZo161t3vnm7z9kYcOIf8BYOZ6HhCFKopc0+xYOa3G
	ow/FW6ByLe3oX6lsWbd8vhAU0bCSUr2rPsVgc/z+Qh8wisinBln2xRsVsbAqESc0JTPyRHra/Rlh5
	jDkCOuFa87Bw4bTwI2z0GZt4yPUtO2C9f0u0XgGyM88eNdVOPVm7xJcUcsTslEgc6Ervg8lpLUU+R
	ttHZG5Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eMQ-0000000EOj6-0nyp;
	Thu, 10 Sep 2026 12:58:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eMP-0000000EOhM-1puP
	for linux-mediatek@bombadil.infradead.org;
	Thu, 10 Sep 2026 12:58:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=X0f+3hmpde177tradfD9iqffBrSGUNX0UYvHhWMmKXM=; b=C4IC/k4QwxLOodU0cZA2Brua3u
	JTaMFQnChKt35xFuBciE9LrPRDUJ6bng3+hV5m47DWTjBE9P2IBQhk71h52YqNHmDw76yJBBmRJXO
	wm7pOPrJlvO65cXrhSNfUzgPkJZLbLX4FCvOF2aBXwJUJMXd34jk8CrvDN3BgTv70yWevX2yWS3XH
	0qQRv7oAAF9tD4d7thunjD7kgbwPl87etRY0a34QTWhrm6t1YaqQkaTZdyfg9NXq4ozWNepHbhPRa
	TiLc74qye2c//A4d7PXAIMEVYQHqDDKq2tiFSE1/UdxGxApDVKmPWOPUV41x5hJk9G7zhdlUHunvk
	f0t5xsJA==;
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4eMM-00000002V17-2pqP
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Sep 2026 12:58:36 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc4bdf8acd6so342001a12.1
        for <linux-mediatek@lists.infradead.org>; Thu, 10 Sep 2026 05:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789045113; x=1789649913; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X0f+3hmpde177tradfD9iqffBrSGUNX0UYvHhWMmKXM=;
        b=b5WXbnjSJUicXCbSV4TVyTzJLsnQmVllVTd05jMArO6DBI5gXr1t6qUtDlsnpHu59u
         APVNaZk9zlVb8VMdFM45bqGsW4RSUvnkTTwPAAozD8yt9sKVBLwcgnxr2jv6HA+tweRm
         R906Mjr0GQt/kvdBv08gU1ICapYZKnztm0ZQmMTKHdn8gXauCQUIJeG+X+yn7371Gu0p
         nB5uY3ZI26hxfMmcXzOh7OXVRLqj43PwckzNAnZuBcfXERiWAtB8tEMpCdaCPCxr9D5u
         fidUNc3tVm1vbWQtXYATXgUo87qdVqKTZhpxn3yXRqbMtHIbw2m46JTABc8qwk2eocRl
         FhdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045113; x=1789649913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X0f+3hmpde177tradfD9iqffBrSGUNX0UYvHhWMmKXM=;
        b=W5BPf9e1CZyb8E76Zv9yDjryicIs4yYlTOvi8svARL5JUYM98hqGSiPAyGEEM91fFw
         RLyDbZVkGwWMWFKIeZAZR0DPOif49ZoQ+B5IORrwubMfStZ31aS6voxKdAbldhPqnD2Y
         2afpKKVnMNufVgB8DmlqgW+QK1EIzt1gAr/9P+5oVJOrt8zhdn2wjljlVSsMjJ7XP6bm
         t86af1/4Ug+ZKdEw7b9WUCAoDgPddkReymZypJ5x8XHX+SowyX3sbYv1ueNgmaVWOApS
         LDyUD56rNjUjPFz+ywfPkTP0wPALC93y0GjmkEbtZznJGPatv3WTEmDvzGYmrf9Nfy2L
         dgSA==
X-Forwarded-Encrypted: i=1; AKwUvByZHbboSdAPJRuyHv6vjUIYimG99wshH2jF3Dcg1r8oSmI4UBVPekUNeia3adetj2cL+NMy6QD4fmXU5J2ORQ==@lists.infradead.org
X-Gm-Message-State: AFuF++neYZ4wusLouyjwWoGVMOK7TQ4syDkK+wERfcyLS8JOW5bFajy6
	9LKbnd76IBYYDcGfmnZgfsZO9RP2m2yGfeyO0MLj62e+2HpbwJrw05Of
X-Gm-Gg: AYBFou2CMpzsPuvkA68zBKb3Mxu/jA7ITjrLnvj7ZpueU73+0cCcPAnntkPag8WXKSR
	at0U4AH0ry6hlHrIdfMlkE+xBEoMnGXEQia8mgmpFr1MoYsIoVz0FeTFcXco52+C+ovXA6/OpVX
	iWcF5dgaJ5v7CXRpD9eQOaipUcs54n4ONmAP8ddMqURHwCw4ETQdfFVs93lR8e12LeKnKnLK2mC
	yJMFC9DAfvMxE9Z85yotX257BVH2UrNvzYmtijhNA2FtYGa74tJjVD1cLZgHaMp5iCWGq4aoafg
	uwLGDuS0pb/4rVdX/L3li+wPWHTPS4OBghkv7EXQZMQuW9Y//Z8IeryQun3yx6JiE6V/m6LblMN
	PV3v0Uq3rMnB+fUXmkAAk9pdtCt5rR8XbcW2shedGruZ3TrWk1yUMVnv5goQmtTNDO4W4TNiYcf
	esNMt6JE+IJZimbdp6syOb5hGVwxbTn1dnyqFwWMppPhpChmse26omqbjrsxuC76aJm51t6j4+o
	MUs12kNLOdUVyxwD8+QZZpM811dGpeR+oEHw2ovG+VrSEG4HU1+fXzrDCVHorD04j38uo9CnlNg
	j2ZcDJIyq/fMTDI=
X-Received: by 2002:a17:90b:3c4a:b0:39d:6f12:fd47 with SMTP id 98e67ed59e1d1-39d70bb2226mr11925208a91.20.1789045112679;
        Thu, 10 Sep 2026 05:58:32 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e77b1afsm4891592a91.5.2026.09.10.05.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:58:32 -0700 (PDT)
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
Subject: [PATCH 07/13] ASoC: mediatek: mt8189: Propagate runtime resume errors
Date: Thu, 10 Sep 2026 19:57:36 +0700
Message-ID: <20260910125742.150902-8-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910125742.150902-1-phucduc.bui@gmail.com>
References: <20260910125742.150902-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_135834_825022_FB8A80DD 
X-CRM114-Status: GOOD (  10.47  )
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

mt8189_afe_runtime_resume() currently ignores errors from regmap
operations and mt8189_afe_enable_main_clock().

Propagate these errors and clean up the state before returning the
error.

Fixes: 7eb153585598 ("ASoC: mediatek: mt8189: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c | 36 +++++++++++++++++-----
 1 file changed, 29 insertions(+), 7 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
index 77cf2b604f6c..431320719b63 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
@@ -2328,24 +2328,46 @@ static int mt8189_afe_runtime_resume(struct device *dev)
 
 	if (!afe->regmap) {
 		dev_warn(afe->dev, "skip regmap\n");
-		return 0;
+		ret = -EINVAL;
+		goto err_reg_rw_clk;
 	}
 
 	regcache_cache_only(afe->regmap, false);
-	regcache_sync(afe->regmap);
+	ret = regcache_sync(afe->regmap);
+	if (ret)
+		goto err_regcache_sync;
 
 	/* set audio 26M request */
-	regmap_update_bits(afe->regmap, AFE_SPM_CONTROL_REQ, 0x1, 0x1);
-	regmap_update_bits(afe->regmap, AFE_CBIP_CFG0, 0x1, 0x1);
+	ret = regmap_update_bits(afe->regmap, AFE_SPM_CONTROL_REQ, 0x1, 0x1);
+	if (ret)
+		goto err_regcache_sync;
+
+	ret = regmap_update_bits(afe->regmap, AFE_CBIP_CFG0, 0x1, 0x1);
+	if (ret)
+		goto err_26m_req;
 
 	/* force cpu use 8_24 format when writing 32bit data */
-	regmap_update_bits(afe->regmap, AFE_MEMIF_CON0,
-			   CPU_HD_ALIGN_MASK_SFT, 0 << CPU_HD_ALIGN_SFT);
+	ret = regmap_update_bits(afe->regmap, AFE_MEMIF_CON0,
+				 CPU_HD_ALIGN_MASK_SFT, 0 << CPU_HD_ALIGN_SFT);
+	if (ret)
+		goto err_26m_req;
 
 	/* enable AFE */
-	mt8189_afe_enable_main_clock(afe);
+	ret = mt8189_afe_enable_main_clock(afe);
+	if (ret)
+		goto err_26m_req;
 
 	return 0;
+
+err_26m_req:
+	regmap_update_bits(afe->regmap,
+			   AFE_SPM_CONTROL_REQ, 0x1, 0x0);
+err_regcache_sync:
+	regcache_cache_only(afe->regmap, true);
+err_reg_rw_clk:
+	mt8189_afe_disable_reg_rw_clk(afe);
+
+	return ret;
 }
 
 static int mt8189_afe_component_probe(struct snd_soc_component *component)
-- 
2.43.0


