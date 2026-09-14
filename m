Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94020C88E50
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2026 07:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DfKwZ+JcEx0QM0xlpom9cfu2SH2Yy+DujTq77/t9jZI=; b=KKdeG+jyxWJL1KUR7Mv84YJArP
	DZOTlliCAEDbfQnTPuIy1OQLvxrtH/dA5T/ciycDrqsUzExysuxsMTEJoDwrQVpC9GPjH+EEraHaq
	U/7enpWE4M0fUTNQNkiNHlzPmZ+RPWU3G0HkpZlYIl2zURt04P0L0OqhtcajRJEDQIfK4LZUo0rB7
	PdosswQQ08aMZm4aA0NVAJhPzvoRabiev1VzDQ8+9yrrUlLYlFd+8+IyDuqGkfQjTSdT35uCByS0v
	HX3OUfU2UBl5FfjQEpyHo4FuKybX7iWOWxVytKhnLUwgsIjoBqIyWhE9qjecKd65IMZhS3Lz1RyBl
	g0T2wT4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x617s-00000002YGH-2Irl;
	Mon, 14 Sep 2026 07:29:16 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x617o-00000002YCx-1vIi
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Sep 2026 07:29:13 +0000
Received: by mail-pj2-x11.google.com with SMTP id 98e67ed59e1d1-396ccc02279so1558300a91.1
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Sep 2026 00:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789370951; x=1789975751; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DfKwZ+JcEx0QM0xlpom9cfu2SH2Yy+DujTq77/t9jZI=;
        b=HN1APuJ1t2G3vgTADd7RLRI+zSNkGt4rjD4VtQI8CN7rfki3Xr8uVrwKW+nZlsTE19
         Q4u4grGmUTRS7WNAr9h5YY9sR/XNonevLSMWm1ngeh9ANJ2ffXXnBuLKExjQ+JSdz8TH
         ggGk4S6xJ4sVXjzDBO1ApSxqRwZaTRk87Pw7qeBQS+Uwa525Uz0aEFqsbTiCGpaqji8e
         B9nrNvjtrtN2Rx6iK1EyHNocvjmgDzJY4YwKM6qg9aTLNAAXp4besY975y6jIP6+Ojqy
         sG5ZdlAYAEcmqi22tUw670QcyHpZx1ktCv5W1oIgkZ0V0BNP9opxcIhfthXgcgvwX3mX
         K+Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789370951; x=1789975751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DfKwZ+JcEx0QM0xlpom9cfu2SH2Yy+DujTq77/t9jZI=;
        b=SdYshUgII9FfS42MuukHB9RCd9tm1QDwXyVSGtmcRu0il9VXbxcy5L3nMb/diD3gEr
         yvzx0rVPV5c874hNHw05122aJbseHhst/pnMUOsvANcB4K0l+W8Lhk9Jdxzdjau/4cP+
         nrr6+qsI7YRv3f6jrOmhTLt+A4HL5fxLKESNy9eftxM59OIlUwKhf7ZInBAb7KS0fFzE
         JtMa/TYwSTj0sxJ+3tuN578hCZJpJU3/dGSqDlGSxtBy5v1KG+uWcwYHwD3p2qx8CpzU
         NW33h40/AAoHepELFvPeQ/HVZph1AoE8p1gMXHlssLJbS0D6Pxg3qE7Af7ThCljj5jmd
         XkfA==
X-Forwarded-Encrypted: i=1; AKwUvByzQP7CPtZMmptuFRH7dtoobX+nrvYg1TpvaCiYUIorE9j9C2z+4pGsN/US+pumpU6k0JsMNWQak6xkC9CBbg==@lists.infradead.org
X-Gm-Message-State: AFuF++kVnGXUTqrIaqrpdUUhW/+MU5sGQS4nn93TLp4RMXbYaHsUqP0s
	R9dr9ZQR4gve8I1DunuqtDolTrPAST1VDSjzJo9dgWekAHXPglZPPxFxXi900Q==
X-Gm-Gg: AYBFou3vbTKCoB5CifkrSPpX+GkJsnhq39/7da3QLFDHR01cqiqw7HxOTdh22J0waVj
	bq8mhKnve46qQ3NggHcvqMT6CHwU9iz34JFyX+XEXH8rDMFmISXn33HqU+CVC46P2APw2JGrV8A
	85F4PjrtdaOOW7fM1pUAJEEqenN0BtphGQJgjn1acFCbeVaSJG2za/c+MwGIFM6BF+iyYUo8tFa
	NieGNC6mgoduLfXXqPeji10cxoBQmeM8oh2tt/AJYtOChO9tXG7uTXezJdqs28FqksPSNA7Ai0l
	7d2FXuQSoEI3Mj6s45SZdKxI+Vj2r4auH0OewuXI7U++TPHCGi4eI3aJGCklbU5EX4/Y/KgbPa5
	KR0GRxqpjCjw3xbxXfga8zp5IozERnvkqRwrL3m8mbV7q3BvRYm5n2ZNc0Bv+LrpDpqX0mOqc3R
	syp/h5j/nvuGndy8lQKDlVe8QA9aJLvLHb7B7cHs5zj+aHTs0iX5hCHJYUBxlIr6dyNwLSystu3
	z5BOU/LVSR9A9ByJBVihK0JZSdUSIbrWGUUfa4cTIndd1b1ImObJNAFZRVeklh15KzURedk59Q+
	Di6TsJTwWD/nw/w=
X-Received: by 2002:a17:90a:e188:b0:398:b71e:60c1 with SMTP id 98e67ed59e1d1-39dec05885emr3025082a91.12.1789370951458;
        Mon, 14 Sep 2026 00:29:11 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d957131f9sm19598245a91.12.2026.09.14.00.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:29:11 -0700 (PDT)
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
Subject: [PATCH v2 03/13] ASoC: mediatek: mt8189: Propagate MCK enable errors
Date: Mon, 14 Sep 2026 14:28:32 +0700
Message-ID: <20260914072842.24420-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914072842.24420-1-phucduc.bui@gmail.com>
References: <20260914072842.24420-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_002912_524395_EFA8CB22 
X-CRM114-Status: GOOD (  11.14  )
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

mt8189_mck_enable() currently returns without restoring the clock
state when setting the clock parent, enabling the divider, or setting
the divider rate fails.

Propagate the error and disable clocks enabled by the function.

Fixes: dc637ffeed6c ("ASoC: mediatek: mt8189: support audio clock control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Update the names of the goto labels.

 sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
index aaf4f7921363..8f6241d47a65 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
@@ -639,7 +639,7 @@ int mt8189_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 		ret = mt8189_afe_set_clk_parent(afe, afe_priv->clk[m_sel_id],
 						afe_priv->clk[apll_clk_id]);
 		if (ret)
-			return ret;
+			goto err_disable_m_sel_clk;
 	}
 
 	/* enable div, set rate */
@@ -650,13 +650,21 @@ int mt8189_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 
 	ret = mt8189_afe_enable_clk(afe, afe_priv->clk[div_clk_id]);
 	if (ret)
-		return ret;
+		goto err_disable_m_sel_clk;
 
 	ret = mt8189_afe_set_clk_rate(afe, afe_priv->clk[div_clk_id], rate);
 	if (ret)
-		return ret;
+		goto err_disable_div_clk;
 
 	return 0;
+
+err_disable_div_clk:
+	mt8189_afe_disable_clk(afe, afe_priv->clk[div_clk_id]);
+err_disable_m_sel_clk:
+	if (m_sel_id >= 0)
+		mt8189_afe_disable_clk(afe, afe_priv->clk[m_sel_id]);
+
+	return ret;
 }
 
 int mt8189_mck_disable(struct mtk_base_afe *afe, int mck_id)
-- 
2.43.0


