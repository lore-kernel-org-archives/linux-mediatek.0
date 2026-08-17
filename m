Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0541CC5DF66
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2026 11:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/xNynUBdZ1hKic7P/IiQFiODLJooKh+/AvfbqzXkgn4=; b=BnuXKyptmvhnFc5+2sMnQ0ES01
	d5Igk1S/dYwNE02neD2jvz3w8AyZ3hFwB3dc7E5CQe65UcSHQAMip1zhtuODrUlzebYZsnP1zGJtP
	6slcB3KOegYEthqauiz9/GS0PlmLoRxA8ZF1BLsiTFth+Ko04hR/BAOcmPT+VcPrYq8Jy4IjYcorB
	TvhFcgGylp1jiwYuWbeTCS92LWZh3qPiauqHKYkV4mZ71xQcNcKc/uSUBfjpl2Pmlps9hZkNjxYtN
	Uw+f5Mv4UtmEAL53IwTYjNQzi5PyYSqs9fkFXfaHbus6MSUguY0TaisTIHtUZKM/uvuF9EPqZ7eot
	sWjtnDQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvvaY-000000061km-0EGq;
	Mon, 17 Aug 2026 11:33:10 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvvaU-000000061jr-3qTb
	for linux-mediatek@lists.infradead.org;
	Mon, 17 Aug 2026 11:33:08 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-381c51fde6bso3927051a91.2
        for <linux-mediatek@lists.infradead.org>; Mon, 17 Aug 2026 04:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786966386; x=1787571186; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/xNynUBdZ1hKic7P/IiQFiODLJooKh+/AvfbqzXkgn4=;
        b=IiOiyXL7LMhHyMMDSC6sj+nviO0iHs4DVezIDOY5MuAEgD9GL2ZQP1fGOrNvp+jDPM
         lbz+A0pmjveSDL6aqxeI5vkfUaD8+BQHTFPPWFsd8ZIcgENQJBWMz0gle7Wsc9B/hSdn
         DnN0UMbyyf6oSvTEM7E3D61m9e8pNB1gWkgstRpYmwltsOSVM700QshrdJgtLl9LiVN1
         SRkGF4M6izp1RkBvVVzLNMQ1dkxvfGPXCd3vn32eGTmorIAYJTUrbc20cMyGLkH8oKtK
         1rt/n/AOeR2pJFZDmAeKeRHjebqUPIdtz5+uFLXgLz5AhT4E/h9ISXRiIe8/FmY+7J8O
         jmMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786966386; x=1787571186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/xNynUBdZ1hKic7P/IiQFiODLJooKh+/AvfbqzXkgn4=;
        b=Utmvbm7WoyygJLomCRNtJxHYOpcvDnkIc4KdX7+T9nXM+bFmlqxJHOWry/YaZE0O1f
         p2zijlx/rsp2aTp8x9+MQCk+gu2lGGOoKgezqrFAwPTgurZprH2tHOR/bC1AqTPbrYpe
         LzG3eB4urvRGhz0RWdDXllbTIqrs8kiQegInvGsR8XP6JjGgi5p71TbxZpDSmOaWUrnc
         0qR8oeo+y+6WLq70wKGyjPnOYX/H21SRxyYsoDJgDNJjwoyTvhs8NticTJ5Bg8sCA7Sn
         muq2vdBLdMxGt2ovT4Wye73RwYFdraOtZbMenSx7zlz4VgRC+hYy8HsY1m2MJ+IZ8QBJ
         EJvQ==
X-Forwarded-Encrypted: i=1; AHgh+RrSiWc2cLQfq924s9LhP5LhbbfVJu0Y/j6qPRS+jnXqOaoqNxrMnGXWvRJzmKdeh+bo/mG7CKZKP9N91T+9Gg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxiwsAMXnVO9jppc6g1xUtM1wpBD8DhIwSUhcrK/rg0m8dyKopX
	Q0ksKdZtf4IEv2bSsJIFwJwvmJ0Mo0g24VDQVCJgksxEBOjvWdgg5UEw
X-Gm-Gg: AR+sD13cDW8+3rXiN4D0ErxeuLLOIf77WdbNJyj54cFRLRDaUF0uczNVyDm9yd56plp
	oi5yQFAwjmT4g7pXJA3Md09YCZ8FodaIGuC0/1wpDnh1aa/DtVTmuekSrQmGrUrW3HxyhfXlwMX
	i5UYsX6jYQx+k+rdoYfxFh6d/Rl+VFOUs+uJYVVYLutlNQ6CCJQ3/TP8oLPpeIK6uZsv8fWChvb
	CcjwwAXzuGxiquOsLwLIDcTYX7pG2Oh1XOrIggXzurprPYH0eOcoiSHtc5MjsOx4hzd/gWUJMW2
	JQYIqIcWk7LDSqIZBoKGsUkDujWlunSRwSCEX8ns9H6G/tNhkFZeaZ0vS7E6r8fDkZ3eyiIRZcG
	9+yuOKJQkT/8H1tt9jSvvjJ1OQpVfbK/Y1bYloIWA8rshzdeu6XlLAXcOf56T6Ysi1xxA9bcGgI
	JQYfeJ8OwQbug4bUQP/wPSCtxBhU3ubzPH54YGjqO2B7+NMToSZl7+Qg+QRCdNY9kN46iqWHKhg
	a1yqRgn7LQRjgzrj6Mu/46Oya2to1IbmPKKZbC5DeCIcecbuQAEu1GDh5iKdMFayVo1gdhnfhe1
	9xkU3aVRJnLfj3w=
X-Received: by 2002:a17:90b:17c5:b0:36b:bec8:94c5 with SMTP id 98e67ed59e1d1-3933b874ad6mr23181975a91.10.1786966385953;
        Mon, 17 Aug 2026 04:33:05 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3954d3b3b91sm2071705a91.13.2026.08.17.04.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 04:33:05 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/3] ASoC: mt6797: fix wrong unwind order and error code in enable_clock
Date: Mon, 17 Aug 2026 18:32:47 +0700
Message-ID: <20260817113249.69252-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_043306_950002_AA936923 
X-CRM114-Status: GOOD (  10.39  )
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


