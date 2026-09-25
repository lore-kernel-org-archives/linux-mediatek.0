Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7107FC98326
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2026 04:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dtvWIRp9yO8uIIIbpOsaLthb3JvQZmMy0vJI9vWrQ+o=; b=Ux/XtcF5+f743/c7BER2gvTyA8
	dYSTNYDnHr46fg1Q/zRi9h/h4OPdsMdHAlqKl1xckAXYm2x7Kv5lFmBfiCX6Dy2MXw1+1jmiUv3tz
	Md4bd80z4gzAGeQeoUuNAdW8sUi+Pe/xaiC36RCFDaUKVy+cKVaGSIwL2f8mB1Uq1gEfWqno9xTyN
	3+6g3UheDkfv7T4KZxzFsEqSL+BtaErj5/sJFe6a9LYWsts3WUdo4o1g/46M6wbNn4yqU4fV4+Ga7
	oM7X47cz8gJ7gBXAVwtqZoHhEsM2vu4VMql2xq/L65C0c4qvqIbbIr4dyfF0ajspowXVrRac9dvM1
	+LdE41Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9xsP-0000000Cd70-1jy3;
	Fri, 25 Sep 2026 04:49:37 +0000
Received: from mail-pj2-x0d.google.com ([2607:f8b0:4864:39::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9xsK-0000000Cd5K-0qdL
	for linux-mediatek@lists.infradead.org;
	Fri, 25 Sep 2026 04:49:34 +0000
Received: by mail-pj2-x0d.google.com with SMTP id 98e67ed59e1d1-3a0b18f811cso396608a91.0
        for <linux-mediatek@lists.infradead.org>; Thu, 24 Sep 2026 21:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790311771; x=1790916571; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dtvWIRp9yO8uIIIbpOsaLthb3JvQZmMy0vJI9vWrQ+o=;
        b=Zt8fYkebU8FOl+//Cd0j7MYOqTFdXa91no1dtuK18z5S0cZ96+6srgbF72Wg26687s
         fLhSHBKgoS61TuVaVhvVw42GwmL0jLdvY0RRBzZcM0Hw+l31FoLgHsH6a2HwPkZM2N2b
         gXk1r7/38P2/+e7SQffAAduDYApWgSD5OnQYJWTq1aZ4QKDxGVc+EwUFsDp0loRiaCD2
         XgdROMOEPFp6ZJ4od98GDezVMlkkduUQ6RAMuTpRPifeUGe+1rrqW1izaeKegRZlG/Ds
         Epxw8/ZaLOQfDg7cBxLgGFT0dqZoyJmELVDp1Afss73k/eGzl/AD2+kBxWbgWI5pxC42
         +3jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790311771; x=1790916571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dtvWIRp9yO8uIIIbpOsaLthb3JvQZmMy0vJI9vWrQ+o=;
        b=XerFm5G1edgupqrMYDg7DdJmMRxpA5B3eFxnKAMKr9tyqTmv6Q0qvkjOTpGr0PMFqL
         iFjsdAZuOeIPD2sKRF0SFHm+GKdUyjbCXD63edPT6r3h+y/bxCjHsAgsfSWi/JKkSITM
         NOxuszSVpSUWPyO3KjoX0cBNt2fzHlSVepO3c1ddYKx78zHEL/LfP+cx1xxfx8rwm0G3
         N1SzlunWpGHn41ZmOGFiI089xo+EER+v28geyCBaGyVz/pd6A4X7f7Tvh491voXZqMua
         0rR6mACRZxb0m7w8cidnoLBKPwld9CiHCJPqZYtaumlYEAmbypISn5tc1Lm/yIfkXPgn
         i9jA==
X-Forwarded-Encrypted: i=1; AKwUvBzLvFWtysZ+W0k/Y6OUNCwl0LDkvtfuUowOxjtqMb3657vTaXlBO3LPVQewWJ61vEo+updNKHZZG02eY3vrmQ==@lists.infradead.org
X-Gm-Message-State: AFuF++mbIPAG4SfBoRRdjqEV6oZAuWfVkiXj0mCz4ShNrqhcXdsx7HDe
	otxAu+eezKyWvOGA/9wxk2PGWl6/7/Gsgf7iqI6dYe+9i0ceK4Q+lI+v
X-Gm-Gg: AYBFou0KFeDGj+U53u6jmBEa4g1M9jEdi7x1N+HWZGmctf0mEnOOENbdNRvizDj1yN6
	PzsKpKddfjgQAmxq7/wiZuwGMZxJBZWIFHXLS5f1DYEE7Rq0wNqRQNB62aYMBMGe95ijesvA9eN
	TXUrp/0t7vot67kqt4D61x6Fv+D1/W8NBdMCL8V/du/Yt9AselTHu16yt5wXohbfFG+zr6B0DMS
	uS/XSpj/15yBhREB7NKctcJQIFTuALjnRqUovM2XU9+EX/IOWDZ93dHtsKfQfS+KM05pk+xRpRb
	vUwQDkq7krIvsisMcwpvebcYZv/Jyr0m2UNb019+XtUzEBzXe1KGxNr3z4faDVJOwFlKtTlnYtN
	c2ETr8RO9nU5GDpFzC1S3D53lFjsMj9n3DInYnH20+WHZye8vRUCzlf9c2T26WxMgeJSN/+gatU
	0rZ1oeN1Ad7erfeXlwz6+jHH1Z4cdZUm6pgo4AxUcuRzr4LyDzbTlh1UGsc2kFeVLxHos7xPQf0
	O042SFhXdSuy+u252fOUi69QJuoZioj7b3pQ/+0nMGM8wCCNNs/PWYcXC/QGcrA+6Dmh1AqtTuT
	ZUN7q+pXGiatog==
X-Received: by 2002:a17:90b:17c8:b0:39e:433:23b5 with SMTP id 98e67ed59e1d1-3a098b973c5mr4047368a91.5.1790311771625;
        Thu, 24 Sep 2026 21:49:31 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976cacbesm8151528a91.13.2026.09.24.21.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 21:49:31 -0700 (PDT)
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
Subject: [PATCH 01/14] ASoC: mediatek: mt8195: Fix tuner clock error handling
Date: Fri, 25 Sep 2026 11:48:55 +0700
Message-ID: <20260925044908.450775-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925044908.450775-1-phucduc.bui@gmail.com>
References: <20260925044908.450775-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_214932_252794_AA111FBB 
X-CRM114-Status: GOOD (  11.16  )
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

Check and propagate errors from mt8195_afe_enable_clk(). If enabling
the tuner clock fails, disable the previously enabled APLL clock.

Fixes: ff5a90173d98 ("ASoC: mediatek: mt8195: enable apll tuner")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c | 24 +++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
index 618d8400913a..ec1ea5b988ff 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
@@ -241,21 +241,35 @@ static int mt8195_afe_enable_tuner_clk(struct mtk_base_afe *afe,
 				       unsigned int id)
 {
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
+	int ret;
 
 	switch (id) {
 	case MT8195_AUD_PLL1:
-		mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL]);
-		mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL1_TUNER]);
+		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL]);
+		if (ret)
+			return ret;
+		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL1_TUNER]);
+		if (ret) {
+			mt8195_afe_disable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL]);
+			return ret;
+		}
 		break;
 	case MT8195_AUD_PLL2:
-		mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL2]);
-		mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL2_TUNER]);
+		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL2]);
+		if (ret)
+			return ret;
+		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL2_TUNER]);
+		if (ret) {
+			mt8195_afe_disable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_APLL2]);
+			return ret;
+		}
 		break;
 	default:
+		ret = 0;
 		break;
 	}
 
-	return 0;
+	return ret;
 }
 
 static int mt8195_afe_disable_tuner_clk(struct mtk_base_afe *afe,
-- 
2.43.0


