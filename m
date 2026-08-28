Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EDA6C61DB9
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2026 09:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jrW30Al+vmkO4YXsfGyVaS6XNDTUobyD5Gl2CjSaQLg=; b=4rHFRh6x1JQKsdh8GWWeTq6eCZ
	dbsq1FGhir+o2+kY9r9xlXH/Hg0EDEwDRB0eZByoxmG/p5B00wmyxb5aQIWuyMNKNmDuQvbJOrfcT
	9pp/5Y609N2jeH9k4+Idh7Wq31us84LcWsuu6XFxTAGW7n2CNhoYANfTsUDGhj/E5oi4bfrB/NnIf
	S+j7emE+EcMofm0GEWk8DF5xBwMhwVu/CVQ93WGTZRGsU9fLcbyFDKRtFxcQ3xZ+g+0M2N8yVWbyY
	7ukN0qU578aOf+xV9m0iCB0pWjHY7Efz6NIC+kg2hgnMvTKPRKawaTdWj+jQX4ZuPORHiZ6xtQsHK
	Ajfcn09Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzshe-00000005QtX-1AEq;
	Fri, 28 Aug 2026 09:16:50 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzshJ-00000005Qd6-07bj
	for linux-mediatek@lists.infradead.org;
	Fri, 28 Aug 2026 09:16:30 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-84864086bfeso661052b3a.1
        for <linux-mediatek@lists.infradead.org>; Fri, 28 Aug 2026 02:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787908588; x=1788513388; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jrW30Al+vmkO4YXsfGyVaS6XNDTUobyD5Gl2CjSaQLg=;
        b=T0uizyD096MoUTECHI+78tLGlq83/0tw4gWPcpB6waQYtce9Q2tUqGPh+IXu8hw37j
         IGq+sF3FuKVnVKZ2BFxeGcN1RuGzAatKBE/egVlD38ELORg3+5VS/jrqGi2pPmpKEg53
         Us0E2IrRcljrP6E0hlSo7QXYPfMnrEnCQ0JNbvtLm1alOJOdqKh8Il3aiWHpqUhFzPFC
         IHy0SqpwDKGOqerssk2zHPPykLnFR0PV7wWjyAv/lTbEzBzGGQZ39u3AU85SKm1Iv2fZ
         wTtCJWR3MAKBdVEwOPWi8gXKDAkXM2PR7Ql2D5inbg6iJBMaJuTSCOpCO5P1uPeT0yUd
         lXxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787908588; x=1788513388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jrW30Al+vmkO4YXsfGyVaS6XNDTUobyD5Gl2CjSaQLg=;
        b=HR4y+OOOuR1tRjeSm+8nryElZkJe2vXLscMMukc15jan8mAhJcRzidsBfuL6nobeE8
         6G9CDuM+5w5GVXfg6OC7p5eRTS+t3C30KQkFJ0OXWV4QWNzThdfL7t8pSu3nuEA6ZRPw
         NmK7xfLq30mDaTzXDVit0bbQ6sOLG5eOOH9vq1pS3Tb1zZ5MFMq7itl2SR1/KUKyYeQB
         UXxiXRDcNSNwe2YxsDh0V6wrNChRJJdjF44+builamai0A4mIn+2oEk5Oc8IXtSQBQ/U
         r/UxXMbrZ4apKaTmFyxPiE0rOv1RyGqFvcmMzgNyjYorX0DE35/hv4L8ErCXT3LHq3q2
         hmoA==
X-Forwarded-Encrypted: i=1; AHgh+RoeqYkgpbfi5hEV03IHM4Vm1WJmNDbjc5Ftxrpzwwvd1UVB2TY5Np/HdAMM18EchyXOVj+GhXsLBsrHLEUDww==@lists.infradead.org
X-Gm-Message-State: AFuF++mk+MC/qZGj/f/36Z4AeYonaF4RY/8Wu8WX9UDuOUL0KWDriopo
	F9iwqvBPYMx4bnEKzvW0P2Xe4TVaAWNIomP9/nwKzvUa6x9VMCRx6Mmj
X-Gm-Gg: AR+sD11zJHGZvUQV0HbqMEjN72KDF0gMs7IqfeSJbwPU+3ySBK1X8S+2p4GehwgRphq
	7OnpVcmuUvzTdkeLddL4cM/R12m5WPrFqBKLZuogUoXfQ+gaZ+S1SCSGrQSEtnbhP318aozJ07W
	3grehjkJ1EXnJbWvYP0ISBVLfCU4VhP9hDDipAcmLYHHjykB4YK2WDe4OUzL0NYq82bVJl8VfJ9
	aS8giUfxaoVQWTqYPUXR57SFPAasZJTaNQWU4Z1dOIxDQHT1Ah5zkxKmTT7QuQ1sHr5SOBueloF
	bkKnwO59LZ5sPrflxq7VojQycadf7xT5RsyPmt3h2aPUNEWIh6Am09HVhBh4okgq6cilOsSMX2q
	zMPJ+XLT6FN67v/qOTKuDm3OL+BDjNVoGibmtSr3fkpsCr/F7rL2PejKFoYCapY4EJCOZ3e3S1+
	qqJZXJn4HdOrufKoqp8i18eLq5fONJ3G+jSfRQAqGB7C7WGo6E+tryV4KU/PLsXLJ7evfs/QVfP
	tDAxWgEmNZ1bRuhoT/OhuNgiiun4e+a3MAWWljfDgjMO8iw4dFHtUY2qHSWKjNDf21+ZNyVVcDu
	r4aW
X-Received: by 2002:a05:6a00:4c0f:b0:84e:d5e6:a085 with SMTP id d2e1a72fcca58-856252523ebmr12427267b3a.0.1787908588234;
        Fri, 28 Aug 2026 02:16:28 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8569fe78fc3sm381248b3a.24.2026.08.28.02.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 02:16:27 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 7/8] ASoC: mediatek: mt8186: Handle regcache sync failure
Date: Fri, 28 Aug 2026 16:15:31 +0700
Message-ID: <20260828091532.600047-8-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828091532.600047-1-phucduc.bui@gmail.com>
References: <20260828091532.600047-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_021629_084046_28541005 
X-CRM114-Status: GOOD (  10.57  )
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


