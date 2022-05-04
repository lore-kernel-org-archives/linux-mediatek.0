Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A45FC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 12:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T122RgRGLSZgUB12TJoCpzRuUF1ZCK08xICv1sgjEJY=; b=IngCr7n0QTfKLh
	jYO+XKLZngRBT40PCJC2rOiq+RsFrD/j7rzBFwLCT+Gm47dgC0o+hDwdGAsF/Yga3pYJBDhLP2asH
	31oDRovv1ZyxPIou8OqMDb5nJCnpTrJ/+bFENmX27L3HtlKD1eLzIx+3jgpRoiNg2lZ61wIWBtoXz
	LavGD7TvKC9/pbb4OLWSKUts0fhHjwVezc+hX27464OyEJQZgR+vMrxllVNNGVyuPCe/Nf98Z+qQg
	1o52xEqjYteToFvr+qOU5yBfUVVt3Me+g5d/kHcIfRHTssDDJS7GuLI/hpLpM6c8FN5P5ilR3ELgw
	seP+LWOVHUxpPmRNoIwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmEBO-00AjHR-Kq; Wed, 04 May 2022 12:32:42 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmEBI-00AjCZ-Ce; Wed, 04 May 2022 12:32:37 +0000
Received: by mail-ej1-x634.google.com with SMTP id bv19so2586731ejb.6;
 Wed, 04 May 2022 05:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CNKzAxju2H5F78AxmBtE86NJhowOrzcymru33IBzxRo=;
 b=fhgI+VpoueobRqvh9tlA+tLmknI0/GBMBlZVChuFNtle9pQIpmqvLOhKfM6Dmjr1xw
 R3/4j2ipVTMcLVfcdiFVhPLlaPqRNY5t3H+rxBSFArOYE5xwpZxH3Jq/6mwZQVR5g5nH
 DS3m+OPLGiWRLFkR1OgFSMe8XxRKuEH9W86Sit7CTWaS36IS1BcjrV89ZJ+WtFIIoN5V
 SMHkwP1Nl0jDUWaKx2biMH+3mBhtuY+mAxeY2i82RlP9W3AZmkdHxsVek7a/DNULJQMK
 QeOxtBznr+PojfyE1rhzKOyrX/n2xr6Tt/U/VTGSbiKJy7ewUjeVFX4fuW8b/wFLsQHw
 dYPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CNKzAxju2H5F78AxmBtE86NJhowOrzcymru33IBzxRo=;
 b=mHekafLLu27iiTijTvKVvris6dR3vg/SQ/wRNiBp6YGHVKP2LP9tNT2wSLgEWgU7uU
 ExMNCyWEBlez397dOmPGTo73fm9NstPA7NdWd1EEjMI1E22rzX6VMBhlnmT5K6YU6AE+
 2SbHzHupKAvzQp1Bw5u853s/SDYeTH4esdxYVAv4ItpW3pIhXSEFDQQ9tdtPQ4zs0YON
 ae40523Tu8rLcnvIWRUVLxHbnMR9uaycJALZ2b79+fEBwM4jd1vHiuEZMAIqtnWWAoUX
 mMo81gSVjBQDueZ6AtiNB4zMByyKrssegieK2WgzVYidwZ6MZMfNFUTWihSNlZNGYqEk
 DWJA==
X-Gm-Message-State: AOAM533Sj+TPenBnLCMOMiGODcJpXTrhFInUQYERPd087bHPcRkP3Xlj
 7hDKMEyDKEwnWtktW3kInHbwoF1xL28=
X-Google-Smtp-Source: ABdhPJz1LfNQyXPrgPpEVU72LKcwzEzy3aEBePRzfJCjCXhN8ogrNFGeDXHVMFOxKgDBPTqeQGtifQ==
X-Received: by 2002:a17:907:980d:b0:6d6:f910:513a with SMTP id
 ji13-20020a170907980d00b006d6f910513amr18770753ejc.643.1651667555088; 
 Wed, 04 May 2022 05:32:35 -0700 (PDT)
Received: from localhost.localdomain
 (185-177-124-12.hosted-by-worldstream.net. [185.177.124.12])
 by smtp.gmail.com with ESMTPSA id
 ig1-20020a1709072e0100b006f3ef214e7asm5688693ejc.224.2022.05.04.05.32.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 05:32:34 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
 Yassine Oudjana <yassine.oudjana@gmail.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Chen-Yu Tsai <wenst@chromium.org>,
 Tinghan Shen <tinghan.shen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Weiyi Lu <weiyi.lu@mediatek.com>, Ikjoon Jang <ikjn@chromium.org>,
 Miles Chen <miles.chen@mediatek.com>, Sam Shih <sam.shih@mediatek.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH 05/13] clk: mediatek: Export mtk_free_clk_data
Date: Wed,  4 May 2022 16:25:54 +0400
Message-Id: <20220504122601.335495-6-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220504122601.335495-1-y.oudjana@protonmail.com>
References: <20220504122601.335495-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_053236_490640_4CEB98FD 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Yassine Oudjana <y.oudjana@protonmail.com>

Export mtk_free_clk_data to allow using it in clock drivers
built as modules.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 drivers/clk/mediatek/clk-mtk.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index b4063261cf56..0746b0f5beda 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -52,6 +52,7 @@ void mtk_free_clk_data(struct clk_onecell_data *clk_data)
 	kfree(clk_data->clks);
 	kfree(clk_data);
 }
+EXPORT_SYMBOL_GPL(mtk_free_clk_data);
 
 int mtk_clk_register_fixed_clks(const struct mtk_fixed_clk *clks, int num,
 				struct clk_onecell_data *clk_data)
-- 
2.36.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
