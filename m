Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA44C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 12:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wDThVYzcPgPyQsEC4oxxY9A94Atw+NrCt93HxVm/qdA=; b=Vb8kAJytMCl19b
	e+zUnWzGxaFOyVXENXUmWtCgwAu2dp6mZ3fWS51OpbAc02u16KZpYtZbp14VcSk73e0r20H+ALhNh
	YhKwFxLXE+jQLIVcf91Ga4ZqdFnT4MAcKu2E5VvGCESuRhgmAz0mgs0wyjuEPlSIBJd4tdAJyTCe5
	lyL76hT7Mra8ZepiDw6BBT4nCww5OM3JHk0eSdkKoxEj2JN8wDmIcpT1T6d6oD/UgpbLySJby3o3k
	SgFAgFmPZrwv7tNy1VGL/US2GsxJBev7ZSGeYZ3X7ILmKeS0EO79ar0/ZumaiIUARSLbjr/E/JuoL
	eQVXTbFBLamBdMsDi+IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmEEd-00AlEj-7A; Wed, 04 May 2022 12:36:03 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmEBm-00AjXj-5r; Wed, 04 May 2022 12:33:08 +0000
Received: by mail-ej1-x62c.google.com with SMTP id g6so2619993ejw.1;
 Wed, 04 May 2022 05:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c4IPakMiBG8qMu0eZo70xqgp2PUHni7/ktt8LMUY1Go=;
 b=m2F3pyQcK4IPVHZeQQykxgWkJZ1MtrhVtyc+P5bf0ZH9Jgjrd9slbkr6T10zzXsT+O
 SKHQFHHdY5qa4+N6+extiji2ToJUpU1QA7nhtiokTSthTdyYP9uF5yhEBM0crd8gZ+dm
 rT/ivTV8NWMtSG8uX/h7nhs7t5a3n3Ocz+G+nyiJl350Oxj7dTJgCkCqKmvRnn3E2fR8
 tzepYb9AVE4tY1GqMS9N3OXMIeHUJkUVJRwihnqxrpyP9eI4Vw2JoS6zCxZik3rzoOtG
 8X7VyjxXcZxIDjOIiqt69uuL8B3dcep7tExY6hoe+MUvVqvC1Dniu2r8BN23G9TUleMQ
 0mUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c4IPakMiBG8qMu0eZo70xqgp2PUHni7/ktt8LMUY1Go=;
 b=tdjrR/JtexmSikLDFDWx3O3U334cU/ccv+QBtij9ftdkVHxeY0pxH8mBUK4nbxQm6E
 Fk6QZfWypLmzCETpTJg4aRNRSvA9Ykjd40lnBdP/y2k+0KABj1cxrNOrTAJrXPm3inM3
 pgCLQnOiaW6yoBaCiao3aGX80NYlfEV74yzuk7cAPordjTRF/tn0ZKlX0YnRhRnT82VY
 B8XJxHmOUa1KO8sMl4qlAurECrza22zcQnjpzP+gUP5FCpW5Jhxf0otCnHrczoOXNVwL
 pn/lPZ2FACArELcQWceEorCZjlALrJE7ioyBejWRBPNF+8kxTwBVKC1juzuk4fJ6/xhk
 d+Dg==
X-Gm-Message-State: AOAM532S4n0VOuzxYtiL13Xur9266W8Z8UO214X6NZELYdWOoP9dzC/S
 B2OV28Or/cmO+IR1YW59/cw=
X-Google-Smtp-Source: ABdhPJzjBn9KrdvJXPPoHERPbtQfki+JAaYMq/RQlJZ15Om95MsCxhMPcv/ncYAS2F1IyQC4vW+3dQ==
X-Received: by 2002:a17:906:a2c2:b0:6e7:efc2:17f2 with SMTP id
 by2-20020a170906a2c200b006e7efc217f2mr19194685ejb.542.1651667583997; 
 Wed, 04 May 2022 05:33:03 -0700 (PDT)
Received: from localhost.localdomain
 (185-177-124-12.hosted-by-worldstream.net. [185.177.124.12])
 by smtp.gmail.com with ESMTPSA id
 ig1-20020a1709072e0100b006f3ef214e7asm5688693ejc.224.2022.05.04.05.32.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 05:33:03 -0700 (PDT)
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
Subject: [PATCH 10/13] clk: mediatek: reset: Return mtk_reset pointer on
 register
Date: Wed,  4 May 2022 16:25:59 +0400
Message-Id: <20220504122601.335495-11-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220504122601.335495-1-y.oudjana@protonmail.com>
References: <20220504122601.335495-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_053306_284198_7F7A4821 
X-CRM114-Status: GOOD (  15.61  )
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

Return a struct mtk_reset* when registering a reset controller
in preparation for adding an unregister helper that will take
it as an argument.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 drivers/clk/mediatek/clk-mtk.h |  6 +++---
 drivers/clk/mediatek/reset.c   | 22 ++++++++++++----------
 2 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index bf6565aa7319..317905ec4a36 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -190,10 +190,10 @@ void mtk_free_clk_data(struct clk_onecell_data *clk_data);
 struct clk *mtk_clk_register_ref2usb_tx(const char *name,
 			const char *parent_name, void __iomem *reg);
 
-void mtk_register_reset_controller(struct device_node *np,
-			unsigned int num_regs, int regofs);
+struct mtk_reset *mtk_register_reset_controller(struct device_node *np,
+	unsigned int num_regs, int regofs);
 
-void mtk_register_reset_controller_set_clr(struct device_node *np,
+struct mtk_reset *mtk_register_reset_controller_set_clr(struct device_node *np,
 	unsigned int num_regs, int regofs);
 
 struct mtk_clk_desc {
diff --git a/drivers/clk/mediatek/reset.c b/drivers/clk/mediatek/reset.c
index 6c2effe6afef..f853bc8a7092 100644
--- a/drivers/clk/mediatek/reset.c
+++ b/drivers/clk/mediatek/reset.c
@@ -90,9 +90,9 @@ static const struct reset_control_ops mtk_reset_ops_set_clr = {
 	.reset = mtk_reset_set_clr,
 };
 
-static void mtk_register_reset_controller_common(struct device_node *np,
-			unsigned int num_regs, int regofs,
-			const struct reset_control_ops *reset_ops)
+static struct mtk_reset *mtk_register_reset_controller_common(
+	struct device_node *np,	unsigned int num_regs, int regofs,
+	const struct reset_control_ops *reset_ops)
 {
 	struct mtk_reset *data;
 	int ret;
@@ -101,12 +101,12 @@ static void mtk_register_reset_controller_common(struct device_node *np,
 	regmap = device_node_to_regmap(np);
 	if (IS_ERR(regmap)) {
 		pr_err("Cannot find regmap for %pOF: %pe\n", np, regmap);
-		return;
+		return (struct mtk_reset *)regmap;
 	}
 
 	data = kzalloc(sizeof(*data), GFP_KERNEL);
 	if (!data)
-		return;
+		return ERR_PTR(-ENOMEM);
 
 	data->regmap = regmap;
 	data->regofs = regofs;
@@ -119,22 +119,24 @@ static void mtk_register_reset_controller_common(struct device_node *np,
 	if (ret) {
 		pr_err("could not register reset controller: %d\n", ret);
 		kfree(data);
-		return;
+		return ERR_PTR(ret);
 	}
+
+	return data;
 }
 
-void mtk_register_reset_controller(struct device_node *np,
+struct mtk_reset *mtk_register_reset_controller(struct device_node *np,
 	unsigned int num_regs, int regofs)
 {
-	mtk_register_reset_controller_common(np, num_regs, regofs,
+	return mtk_register_reset_controller_common(np, num_regs, regofs,
 		&mtk_reset_ops);
 }
 EXPORT_SYMBOL_GPL(mtk_register_reset_controller);
 
-void mtk_register_reset_controller_set_clr(struct device_node *np,
+struct mtk_reset *mtk_register_reset_controller_set_clr(struct device_node *np,
 	unsigned int num_regs, int regofs)
 {
-	mtk_register_reset_controller_common(np, num_regs, regofs,
+	return mtk_register_reset_controller_common(np, num_regs, regofs,
 		&mtk_reset_ops_set_clr);
 }
 EXPORT_SYMBOL_GPL(mtk_register_reset_controller_set_clr);
-- 
2.36.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
