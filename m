Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 340CEC79F9F
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2026 11:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jEjcaLeodosmHYaYiyTfEDLf32OqTBL16rI4GMqtRw0=; b=LjBehVclb3l+PoNsjEixZsFya7
	of2UnmIf0jv1OGYmD72m1GJCu5qTDQSOulXcJBjmme3ieL7Zv4h7URIud6dswa33tGJcH1MbBODnP
	lUgVme5+gQkeVWP/GO9j72sfReKpcc/O7HX9LrtmjvfvMcUIdYgh0050S73oh53XST9iK+eZpXr68
	eIVnqImgneP2cAZ5u0dxmYAdykUouF/aE8C83tHdtQtqLMQRhMoXczMWyX4CT5gJKoSTmn3nKwd3S
	5O2kfTFgpWhlVTi7YjIz8dcvg9ZuXgrJgoA6q6NOdF4LQvk/8IsB5YATnLt3cAt9F+0ku9QpixCwU
	HAbEZPfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4dCH-0000000EFO4-19UV;
	Thu, 10 Sep 2026 11:44:05 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4dCF-0000000EFMd-2Adp
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Sep 2026 11:44:04 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d747eefadfso7145115ad.1
        for <linux-mediatek@lists.infradead.org>; Thu, 10 Sep 2026 04:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789040642; x=1789645442; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jEjcaLeodosmHYaYiyTfEDLf32OqTBL16rI4GMqtRw0=;
        b=kNGLPYTswQTN15PGzYVM4OHANtttSKXKdtamEJi6ihy2R6BFk7V08d3vTS11RY3IQI
         NKRTovAqFX3JCmrrafxINKcacDEOwV3LEOckTx7GtGdJt+4sx1+NLOVhnab2HBgXkdB0
         LDFnUfiUD0XecaPbIwa3MLeL1WYeQG40INjEg5ffK3dmm5YJaNj8bjkzc46d7s5laqq6
         YWYhlAEhDpSlysYszuFLLuIJWpJjC0INyotm3ucXtMBLHCSxVFmuqAju+06fwYb8CPV3
         brAbFYyoOtv0fq10wf0uFezs+oTrnPo4d8/B6cuBPCd5J/1XP/vjhYDgxW1O/vOjZTh8
         fEww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789040642; x=1789645442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jEjcaLeodosmHYaYiyTfEDLf32OqTBL16rI4GMqtRw0=;
        b=SC9cNxzvVdZuyAV44QD6sO3N26hD+D8M0tpr3pn72nydKwMHlkE3Fga4PaJk1Xby/c
         F6gIAI0DXYyvoZzTG4W58bIATFwdWMWL90U1NUktq841bM1bOL6nZqa934j0TFMcBqJF
         B+JgYlGmpu16hUrQebtLRH9VKRYupjY23H/dXmycaXiyPJB1zmuNmg53txf2KTS2TKkJ
         cTq45YMKBt2PLZ6fmopK2S7jkexI/c4KaWC5b2Ha9Nt3R2xG9hLoBn1Lizn4XWyC+Nbw
         vFdShjBMCf+fnr80dhLy9zl4rk3WjwRiWuYYGh7cU4BkDNyzdIrY4CCR1MokxqaPayjS
         ym/w==
X-Forwarded-Encrypted: i=1; AKwUvBx/FtZJmqT/47Aa3FODZIWr3crOvZwlOI5um+Q8suI3lMn7kc26Pf7qAQwTNrkBY/BcXg8QRItTzY3gXzzbuQ==@lists.infradead.org
X-Gm-Message-State: AFuF++n2ehlEPLp+JYn+GeogXUzqZ0nwFCahTuimfucchPQNut6HHkQ6
	M9PC+bH42zAErmoatLYCKoLPY5ZiDGJ+DodfJBh/4R+G2KlO0Sw8A8mL
X-Gm-Gg: AYBFou26k3lx8Cs8wbn3e75EEShALJ/osrwRKYe60aNXRQM3xFgdTiyMBKlnb9pEUM3
	3cQG0YYDBMYoS6cH+v9aNyiW2zlxO3nIq3vLe5BOFI38kx78ZTfCcKgJLWbIFUqWhxObL9Hfaml
	Pd5vzZxp3vJ6Uz6iW/sGYs8vleEnmWQ5X+BRgmqU3klF4P/cxKhEkkMBAbGtS97lGpxXkpCESFp
	sUQVQ7sspB1Op7vCqSxxDOqXC7GT7+K44DaxJ6Gq12379ofIzXGnDquwyDFDTLwggfJ3FFsEyY6
	6lONIO0+2+2l2WUeNkuCLL8bm5NQ6a8MZn4eRn9tmS1QW5/A+0JXZlGw9nOMAKZcIqnK+9mDhA5
	Ci1ZMkYG+cMkJbfOBiUTtKrRHc+vXaTnc5Zm8HogDweDlnlXdyeq5xCd1kXjyWHvcdH5omW56oB
	PuKaKjHv3hLiQa3JVaXappB10Rj49rC5WzERp0IB0PHOoJk2mRgRJSHcmf249KWM82eaVz/kwll
	pHwp6a6I8lDMC1I6GycZiHPl2034mfroD69tktbvpnlqUdj9lNLoMrrFfKGXTd9CEvVKug8Ht9r
	8R6DyYURwZtcQnbq2EcsU0BL/w==
X-Received: by 2002:a17:903:1b6c:b0:2ca:12aa:a390 with SMTP id d9443c01a7336-2dd0dca9c9dmr43423175ad.0.1789040642448;
        Thu, 10 Sep 2026 04:44:02 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14959fd2sm87427155ad.23.2026.09.10.04.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 04:44:02 -0700 (PDT)
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
	Darren Ye <darren.ye@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/2] ASoC: mediatek: common: Propagate PCM buffer errors
Date: Thu, 10 Sep 2026 18:43:38 +0700
Message-ID: <20260910114338.142682-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910114338.142682-1-phucduc.bui@gmail.com>
References: <20260910114338.142682-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_044403_566180_9858B851 
X-CRM114-Status: UNSURE (   9.31  )
X-CRM114-Notice: Please train this message.
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

mtk_afe_pcm_new() currently ignores the return value of
snd_pcm_set_managed_buffer_all().

Return the error to the ASoC core.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/common/mtk-afe-platform-driver.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-afe-platform-driver.c b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
index c1869b38c9e7..84218d137143 100644
--- a/sound/soc/mediatek/common/mtk-afe-platform-driver.c
+++ b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
@@ -151,11 +151,10 @@ int mtk_afe_pcm_new(struct snd_soc_component *component,
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
 
 	size = afe->mtk_afe_hardware->buffer_bytes_max;
-	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, afe->dev,
-				       afe->preallocate_buffers ? size : 0,
-				       size);
 
-	return 0;
+	return snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, afe->dev,
+					      afe->preallocate_buffers ? size : 0,
+					      size);
 }
 EXPORT_SYMBOL_GPL(mtk_afe_pcm_new);
 
-- 
2.43.0


