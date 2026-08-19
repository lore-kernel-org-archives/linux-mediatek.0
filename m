Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A2A0C5DF6D
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2026 10:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/xNynUBdZ1hKic7P/IiQFiODLJooKh+/AvfbqzXkgn4=; b=N/BGT7wM0y9siJGVxHkbra4GMJ
	by5tQM+j97FVQjaCs18Od6c0fagaIHnqYogJ186bb7/3U4eYHUPO1FrZtsz/+6gYDBDwtiMcm5VrM
	fzovksUwtIX6NVTB4GPQohP4cefeTO5Dxq8dM8V48t6p6fDqo9hlWV5yCwqTDuZztuzRiUC5Dwsps
	HqXqPVV+047ajZTB06uYhGprL9xh1WfxBpziQ6njIieOFsS/lnQibVLFT8X9maFyVvZFoIZyo2LYL
	7Ds3O+8It7I4CAM0+DGFlrfOCC/rC4xdqphxFc09zHaU2smiZM9XFkBt5W0QJug/85EVJPe5qLFWx
	dpHb4NCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdMt-00000009VNQ-2x8y;
	Wed, 19 Aug 2026 10:17:59 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdMq-00000009VMV-1119
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Aug 2026 10:17:57 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-3811f512167so1270530a91.3
        for <linux-mediatek@lists.infradead.org>; Wed, 19 Aug 2026 03:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787134675; x=1787739475; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/xNynUBdZ1hKic7P/IiQFiODLJooKh+/AvfbqzXkgn4=;
        b=kg0zrFavVL5ou0DQsOxcAZOjlMb3GGxpm40QuQtXB4RjELryIPToZoxCdnUi/2urCP
         jq1UkPu7sMDB1GZ4yl1rpowde98AcHA7ZCeF4InkMOPu51q+epZA1GFc8F7QzP4lQacm
         kenNKcd5qeupTwCOaIsgT5qL+yd00HRePWmeGL2OkRah7Al6qRF6QRDTnIwpoQEzdlE4
         mHLjtSTu62AJ+1WI+4aX2YLAZkjOBk2ixk4QDwOfpSY2oxSAM6WO3QfTC0rUlVUpYH3c
         SQzJKmoxpv8voLpqePvICI+Tz3D15UT3bPXKyJ7ZyQyDfSfBN66AZjwXeVHAUqYAlOnB
         LDIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787134675; x=1787739475;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/xNynUBdZ1hKic7P/IiQFiODLJooKh+/AvfbqzXkgn4=;
        b=IuZmGGYCGbJsyvP5Joajluh1e7KWeoy7aX8ZUR3KVN4P/FUCFRfZrt8U6tPqV9k6lv
         l6iTC3KFBfmN2tr1TJv2VCN1IUVCc/4cxhDdHQYkFn+YfI6JBCpxNw/8j091ILRI2tI2
         pD5mMXZtwEmGZhEdQlPIXNwBEOaR0+2poCIP2oNFWIsMoP9LSa1kcqAO2cd2D4zoiD6i
         M0vrz+74YvLiawZ1LZ2/eXIbR028NRc2F8mHPV2IcHZ14+yVa44OEJaP6NEzKaP5OKFp
         0F3agXZ76LuFWQ/wKpRju7WO+2T6Dl+olCt/ydce93zdeyk3oHyIXD92P4otsEOXN1IR
         IcDA==
X-Forwarded-Encrypted: i=1; AHgh+RpD3ceVpWW9QKSl/ed8lSScHqQRklhtjN6YPKTPrziof1g+uiQP1n0y7K33ioDhPd3AzXo/+bwAJvMx6CX+yw==@lists.infradead.org
X-Gm-Message-State: AFuF++nbFApJBPJzJD1DMwV8YGrUGBTUx2D2dozc/B81uj7P+peZgjgj
	ZhkIzX07zp57ruI7yBvzSNNyO0BRVH2deTAkFrtKwZ8J0vGuYWVnXjuv
X-Gm-Gg: AR+sD11Cf50CKJuFCHBSRA2vWza3LRpYccO2fyvgJPvYJgPDEohh7QLfpZ882BI/58x
	zVEoDtSape4dnSF46S5jYwiu9A7GRXggOk/VG3W1Hv6qKtkCiOy26EFT9h9if75HqWKUDrxB17A
	AFfLSByHWSBt77mFtGWTtBOS3CDivhiF48aNiQKMdaKptvet+Gm23vmCE3/gbqYMFLwOkxLfacf
	b9HoZcmrZC6g4jRduVnr23VgkaXGqycUkkzMj3ENMN4KoM/85E1NFrM2Y0fNDotQdlS4VysMuXc
	pNI/tlHuZd3eQfI8ZwMp973Z5VszeuCbOf96HL4A1l+jMciZv01yzyW47DKHfpBzh25rYgF0vfS
	bxHegeAgSSRtj7okj7BXf0R4FWWB8bpUtQCKG7LmSHoqBYs7T5CmlE7TnSCwkPfaQGKqvd7WCK1
	AXdJT/6heY01M4BtEsHj8cBAc9jwy3C8O1WbrnvanHkCGRY0kBWBLfglxih+olM5NRtxi7+5Wl6
	cztupHd65iJwToK1FADCbt6iBH1PZyEBuRPy3B+hvq1NvyZv8VrkcFZEVeCNg4K5W1Sqv/ZnXvS
	D9/p
X-Received: by 2002:a17:90b:4ac9:b0:37f:ed7e:7e42 with SMTP id 98e67ed59e1d1-395810cad6amr6268601a91.14.1787134675189;
        Wed, 19 Aug 2026 03:17:55 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fb60a2bsm2222374a91.17.2026.08.19.03.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 03:17:54 -0700 (PDT)
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
Subject: [PATCH v2 1/3] ASoC: mediatek: mt6797: fix wrong unwind order and error code in enable_clock
Date: Wed, 19 Aug 2026 17:17:34 +0700
Message-ID: <20260819101736.67632-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_031756_446793_5753770B 
X-CRM114-Status: GOOD (  11.18  )
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

The error paths in mt6797_afe_enable_clock() use incorrect goto labels,
causing clocks that failed to enable to be disabled during cleanup.

Fix the goto labels to only unwind clocks that were successfully
enabled, and return the actual error code.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt6797/mt6797-afe-clk.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/sound/soc/mediatek/mt6797/mt6797-afe-clk.c b/sound/soc/mediatek/mt6797/mt6797-afe-clk.c
index 6f3e6acfcfab..0ac04d73b777 100644
--- a/sound/soc/mediatek/mt6797/mt6797-afe-clk.c
+++ b/sound/soc/mediatek/mt6797/mt6797-afe-clk.c
@@ -63,21 +63,21 @@ int mt6797_afe_enable_clock(struct mtk_base_afe *afe)
 	if (ret) {
 		dev_err(afe->dev, "%s(), clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[CLK_INFRA_SYS_AUD], ret);
-		goto CLK_INFRA_SYS_AUDIO_ERR;
+		return ret;
 	}
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_INFRA_SYS_AUD_26M]);
 	if (ret) {
 		dev_err(afe->dev, "%s(), clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[CLK_INFRA_SYS_AUD_26M], ret);
-		goto CLK_INFRA_SYS_AUD_26M_ERR;
+		goto CLK_INFRA_SYS_AUDIO_ERR;
 	}
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_TOP_MUX_AUD]);
 	if (ret) {
 		dev_err(afe->dev, "%s(), clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[CLK_TOP_MUX_AUD], ret);
-		goto CLK_MUX_AUDIO_ERR;
+		goto CLK_INFRA_SYS_AUD_26M_ERR;
 	}
 
 	ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD],
@@ -93,13 +93,11 @@ int mt6797_afe_enable_clock(struct mtk_base_afe *afe)
 	if (ret) {
 		dev_err(afe->dev, "%s(), clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[CLK_TOP_MUX_AUD_BUS], ret);
-		goto CLK_MUX_AUDIO_INTBUS_ERR;
+		goto CLK_MUX_AUDIO_ERR;
 	}
 
-	return ret;
+	return 0;
 
-CLK_MUX_AUDIO_INTBUS_ERR:
-	clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_BUS]);
 CLK_MUX_AUDIO_ERR:
 	clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD]);
 CLK_INFRA_SYS_AUD_26M_ERR:
@@ -107,7 +105,7 @@ int mt6797_afe_enable_clock(struct mtk_base_afe *afe)
 CLK_INFRA_SYS_AUDIO_ERR:
 	clk_disable_unprepare(afe_priv->clk[CLK_INFRA_SYS_AUD]);
 
-	return 0;
+	return ret;
 }
 
 int mt6797_afe_disable_clock(struct mtk_base_afe *afe)
-- 
2.43.0


