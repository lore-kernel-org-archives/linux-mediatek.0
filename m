Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F52C5DF8E
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2026 12:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4LEpADh7BRFyWhypphnGElkUejLABiWZIaIIaxvhaYU=; b=bZZgoTp1rzUOPCmhGkLetx0OjR
	WxWJw966Tl1tFjsoz8vpsEWlD6qncLMm00WNceCTGazlC6ry3U/gD+xDdDgsjbxTU2ESe868z5OaV
	vY0y02Py3a52FZqsyniuuZ9xcbyytmqjPXvuEBC6jmUEpUg4I38S/16Yd5jnRGtNUcyyNmMBcCzz9
	JsM9orAKYSdOfQUwJJuKjUw407nZpmpLIxAQLd9q7aiUC5fYcHQ7joDrfSoP3EfqJhgctN8/ysQdl
	mJelxz3k+JaB62gPtoAJn7udlDB3quOQA4MewyFem3sRBr5+4/rGZSBuqoBYLzIKemtN7DeEUzh+B
	dO/VIz8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxONl-0000000DJY1-2VYi;
	Fri, 21 Aug 2026 12:30:01 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxONh-0000000DJTn-3XlZ
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Aug 2026 12:29:59 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-84867f07d63so850124b3a.2
        for <linux-mediatek@lists.infradead.org>; Fri, 21 Aug 2026 05:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787315397; x=1787920197; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4LEpADh7BRFyWhypphnGElkUejLABiWZIaIIaxvhaYU=;
        b=UgGmJfI5Gg2o/9Q0CllTwE+LTkSZLv+kvd89aWqB/86unk529eIf5MVjv36hri3T0E
         G7+3QzXYNQluTCneLhJjL4Ng5bWe4TAjuFcFHttZfdedaSHojX42M8txeXKwf8f1dWkz
         5c7oSgUUyd2nDaKaOsAsTUpNix44fHxPCU1SRagyP5m5K93X+MWL3dItXWQZF8aOhsas
         aF1nzWwOxrhaJVbBHyZh3tBDnF/RaVlZ6KhWvcN54ng0yrlNNyb4ML+EESNv+Qr+PM5x
         fsUEyxDuxanlY8Vk0zKeeys5nUliVCLssfwoTzqisu7+66VDjQ5HgZuVwwxBmx2LdWGA
         mx/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787315397; x=1787920197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4LEpADh7BRFyWhypphnGElkUejLABiWZIaIIaxvhaYU=;
        b=FHodPX7tXnu1KjrhVgd9qFXhgQKLexgMYEMq7B8lWhqOqVINjf3cq7KxflIpZ8b0ze
         CgOlSmOIW9iGu7BPhThgRIhYQ4cJWGMGqrAHsHt0uYSaXl9Gck1VITLU3wJYfsdfl2pE
         b4C3RjvIg1gsXzXEZrGDE/QARaHiTvdPQ+pVAKoIbRPNusTau9m5byzw5c15yx/3lsHY
         bBE1DlGgtph5o5xMQDh/+7D6v3xG7NkDS84p3OJ8HioV+n/bgKGJ5ndPLBjmjp9mqZEM
         izdZXrPUn2NvISUiSaZsIcKT/AwN6hNvWcc7OZTMjPYQkb43PYhrltOrZjPMrrA/DXDT
         E46A==
X-Forwarded-Encrypted: i=1; AHgh+Rr/qbSzH8b49s0RcJkJ8bsUwQJUZJ/EvcmjA57PdPOXkzRpW5Sg1/gpPPcDBSl80YYskkj0Vm1XnZc72+VBVw==@lists.infradead.org
X-Gm-Message-State: AFuF++nE5f48yPwtySMGVYUA4278o2BhWQJiuiASyhbjhHP41O/LBGqd
	Kznf8xSfhSY1+S8vl0CWxdga1i85qsMRT2qmsxVGio/ziRwUMh+Osdeg
X-Gm-Gg: AR+sD11z++o2nSRYnJoArbZ1li/iQuOvgrsuvfeAPW/ACySwBP8yspXVDTxQJD8GfiN
	WPA6JFmKhTxhJQsHLmNs9AvsE6QpKJSHHoPlmhpZliMr0ge722a6zQhPlF3A9fbALIyqTKsQWAk
	OrU7JjB+QaQ5EJnf2apcfyEm0QI1/wP48OLGnFk0FvhuBXy/7rCtGWsKGldAbudSOqJoMfZJlpv
	kzHzokw8IaMmS5WwQHbRf9sefC5A/aOZeSd8AuS2X7Mt87H/X8aRzjam8bP9nbXulHtP6/d7APZ
	kyE20YB8HAZUvZeD21H9Wr9mDL1i5XbZ9o/N8pKVKBIZfLLBuIekCodDsIAewHtCsQkJDmD1LD/
	F+iA/s/K4rmWuaO56drKaOs2xl6y70Y1vBpLbVQwh/qgTGvFG/tYo0hj618TV5Cec+igzwU7RGZ
	yaWfWQQdP6KIAKDMZXdMUe3vZcWbE6+jidGACkUjHVZpzrt3NJsKkSpC5ZnKswSzrJV4RyWArEN
	YKk9hGNTXwsvN82ftSG1ggq+NxK1mkrOGgaD133lgSzeVYJrPMW5KRTmyCXF460yssEc5HMPjza
	Ykt+
X-Received: by 2002:a05:6a00:ba8e:b0:848:34ad:3d6c with SMTP id d2e1a72fcca58-851f9f4a715mr9133903b3a.15.1787315397244;
        Fri, 21 Aug 2026 05:29:57 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d3389fc4sm2848582b3a.14.2026.08.21.05.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:29:56 -0700 (PDT)
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
Subject: [PATCH v2 3/4] ASoC: mediatek: mt8183: Use dev_err_probe() for error handling
Date: Fri, 21 Aug 2026 19:29:27 +0700
Message-ID: <20260821122928.41343-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821122928.41343-1-phucduc.bui@gmail.com>
References: <20260821122928.41343-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_052957_931813_407E991D 
X-CRM114-Status: GOOD (  10.18  )
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

Replace dev_err() with dev_err_probe() to prevent log spam when probe
returns -EPROBE_DEFER.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8183/mt8183-afe-clk.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
index 0790d8123179..46cab62220d9 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
@@ -101,12 +101,9 @@ int mt8183_init_clock(struct mtk_base_afe *afe)
 
 	for (i = 0; i < CLK_NUM; i++) {
 		afe_priv->clk[i] = devm_clk_get(afe->dev, aud_clks[i]);
-		if (IS_ERR(afe_priv->clk[i])) {
-			dev_err(afe->dev, "%s(), devm_clk_get %s fail, ret %ld\n",
-				__func__, aud_clks[i],
-				PTR_ERR(afe_priv->clk[i]));
-			return PTR_ERR(afe_priv->clk[i]);
-		}
+		if (IS_ERR(afe_priv->clk[i]))
+			return dev_err_probe(afe->dev, PTR_ERR(afe_priv->clk[i]),
+					     "failed to get clock %s\n", aud_clks[i]);
 	}
 
 	return 0;
-- 
2.43.0


