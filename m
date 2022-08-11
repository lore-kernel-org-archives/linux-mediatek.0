Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B0FC25B0E
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Aug 2022 08:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5tIyJd7B0eaGhd67Ybtop510tDngvww4odk8IMMRG6s=; b=4CJDElUes9Hh/rnrjXkeD1CuwL
	pnoh9TqEQPM0i2GJpf8TQU1hqsK1Nl4B3JvySiIQXghPhYcAKeisB3fjKsPvGke6lRNVmF1/tDyd/
	qOYk5q5I8t76AhI3PGD8K4je+wmHbTujgxy9AaF+nhDWHoMrQDRuZ9I9or6mznRXd9dVcyFC8vtXT
	mvdeQrP79FtMf97Vcm5jRCETqk2zMCP4ZuY0B8hqprXUZ5mceELJVLoLJc9bvQ7q70qL5zdhGGSfg
	xm8V6dOpUYdfxbUeWyC7cDfNNfZ8PyeDaKqvm/SpEQoV54XLPVUZ+Oq0lBzpVyAW+wexLNqR0kd/9
	821To/Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM3oZ-00AQDL-PC; Thu, 11 Aug 2022 08:45:15 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM3o5-00AQ0n-9r
	for linux-mediatek@lists.infradead.org; Thu, 11 Aug 2022 08:44:49 +0000
Received: by mail-ed1-x52e.google.com with SMTP id b96so22152323edf.0
        for <linux-mediatek@lists.infradead.org>; Thu, 11 Aug 2022 01:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=5tIyJd7B0eaGhd67Ybtop510tDngvww4odk8IMMRG6s=;
        b=59PQQYMw0Zm5ulpJrfvpl5YbbZlB3E3YXKz3F0lHJa6V9iyaHOXFllzSGUA/WttF5q
         cu8gTEqEoMGsfp58/p3FdS3pDNMN5JgoWaO+ZPACoomPjbxXxxY99qb15ry/coipDDlL
         ysRZoptSSvNz0FpRKYueVI75Be3rKGACAhrouLBKsiAGEH5aCd6t5npSHGot1XHmPZHZ
         d2ZnbiE8aJodxHkc7bzA6LlFcohOuu5FyCG8nqxXzUPWxvB+FQDzBwM70Kqd/KMH6ywj
         KPRPEkmjiF513VWcx3dkX3fg0U+V2vtqrNS5uwzka+VdOiDUe2pooDH6oLyJkoFgrROR
         jdqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=5tIyJd7B0eaGhd67Ybtop510tDngvww4odk8IMMRG6s=;
        b=7CVZ0XaQPokh3WZrEGA42UhD7MGWJ34EHBwiuUGZHLTCbb0Mt+zttTV4tpRQIkEWws
         7Td5Fs/iNMZy3DOc3u7vrIO6ilhmTI9uL8c6JAFJB/iBWpvyfwQyYYXoPTEoe56482+T
         6ysxK73WMb6iw7CS+H8CxPQs6174PCc1Fa59FgBts1VyTCOFmUIv+92ovBPsnZQ8fn0O
         /IXgAlx9BcvrCe5D+JUdKDtXExKR+wJ2i9pVHTQUWWiRM+UnmEZgdgZnmk4SwWer+BdL
         TYzljnHlTfokdgbEGSzp696Z6y1BdfaoGJQB7uOyJTKFfrdiBc4ErTqVBB9sdXYE7pRG
         rhmA==
X-Gm-Message-State: ACgBeo15q99ZZVB6qoYlNp7bnr8zGHBHWQvuEQf+N/WFd4Nlpop6WEMF
	xYqXUZ71pzlkHPafwdOHUy4ihw==
X-Google-Smtp-Source: AA6agR6jeK54Uy/TCm3EvDq24pgOJe+pznfoFX6xcVV9Pdh3UyU3/O14iqVLE5vRIMnGnrlKJY5YqQ==
X-Received: by 2002:a05:6402:2398:b0:43d:fd2c:b0a2 with SMTP id j24-20020a056402239800b0043dfd2cb0a2mr30114294eda.172.1660207482897;
        Thu, 11 Aug 2022 01:44:42 -0700 (PDT)
Received: from blmsp.fritz.box ([2001:4090:a243:8036:200c:a862:4253:884])
        by smtp.gmail.com with ESMTPSA id d15-20020aa7d5cf000000b0043d6ece495asm8799314eds.55.2022.08.11.01.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 01:44:42 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Fabien Parent <parent.f@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v3 2/4] clk: mediatek: Provide mtk_devm_alloc_clk_data
Date: Thu, 11 Aug 2022 10:44:31 +0200
Message-Id: <20220811084433.2598575-3-msp@baylibre.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220811084433.2598575-1-msp@baylibre.com>
References: <20220811084433.2598575-1-msp@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_014445_357306_DB24C8BB 
X-CRM114-Status: GOOD (  13.52  )
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

Provide a helper that replaces the kzalloc with devm_kzalloc so error
handling gets easier.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---

Notes:
    Changes in v3:
    - New patch

 drivers/clk/mediatek/clk-mtk.c | 33 ++++++++++++++++++++++++++++-----
 drivers/clk/mediatek/clk-mtk.h |  2 ++
 2 files changed, 30 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index b9188000ab3c..a317e69cf298 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -18,19 +18,42 @@
 #include "clk-mtk.h"
 #include "clk-gate.h"
 
-struct clk_hw_onecell_data *mtk_alloc_clk_data(unsigned int clk_num)
+static void mtk_init_clk_data(struct clk_hw_onecell_data *clk_data,
+			      unsigned int clk_num)
 {
 	int i;
+
+	clk_data->num = clk_num;
+
+	for (i = 0; i < clk_num; i++)
+		clk_data->hws[i] = ERR_PTR(-ENOENT);
+}
+
+struct clk_hw_onecell_data *mtk_devm_alloc_clk_data(struct device *dev,
+						    unsigned int clk_num)
+{
 	struct clk_hw_onecell_data *clk_data;
 
-	clk_data = kzalloc(struct_size(clk_data, hws, clk_num), GFP_KERNEL);
+	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, clk_num),
+				GFP_KERNEL);
 	if (!clk_data)
 		return NULL;
 
-	clk_data->num = clk_num;
+	mtk_init_clk_data(clk_data, clk_num);
 
-	for (i = 0; i < clk_num; i++)
-		clk_data->hws[i] = ERR_PTR(-ENOENT);
+	return clk_data;
+}
+EXPORT_SYMBOL_GPL(mtk_devm_alloc_clk_data);
+
+struct clk_hw_onecell_data *mtk_alloc_clk_data(unsigned int clk_num)
+{
+	struct clk_hw_onecell_data *clk_data;
+
+	clk_data = kzalloc(struct_size(clk_data, hws, clk_num), GFP_KERNEL);
+	if (!clk_data)
+		return NULL;
+
+	mtk_init_clk_data(clk_data, clk_num);
 
 	return clk_data;
 }
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index adb1304d35d4..4390058d172c 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -182,6 +182,8 @@ void mtk_clk_unregister_dividers(const struct mtk_clk_divider *mcds, int num,
 				 struct clk_hw_onecell_data *clk_data);
 
 struct clk_hw_onecell_data *mtk_alloc_clk_data(unsigned int clk_num);
+struct clk_hw_onecell_data *mtk_devm_alloc_clk_data(struct device *dev,
+						    unsigned int clk_num);
 void mtk_free_clk_data(struct clk_hw_onecell_data *clk_data);
 
 struct clk_hw *mtk_clk_register_ref2usb_tx(const char *name,
-- 
2.36.1


