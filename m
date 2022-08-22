Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0DF7C28D13
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Aug 2022 15:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=28oTaBj3QQ5qfaOFdNPJMDdWbmEaZFUPrH2tNyFmGNs=; b=R9AFmHVPeBAZMT6+8tBU2K/s6H
	Y0GE0QEVAxcGY5AB3FWy/xXK5oz9uJMGZggUZWFQaFrA9oOYbyNBwxEghQXWAwM6QgxkvafcvLq7K
	H11UgjF2Wgudpbq6+tDj+3cmkE1/edxOi7dI58tdlX8exx8CP4tHBrULmm1o0nO+1co6cmhPOGu44
	OlHN77PQzymaHW4qxXz5D8QgoFwixDbExir8qMp3nt2gm5hAYno/0VwCeHnX9YEdo/Js0LijBZfzQ
	Lw7+yHNXCIe+W7XHjY+SdNqJwCSMbVtRyzP9GyWyFNcM9YbLEEWPXVEVvLm/Kvya+sM9g77r4AgaP
	lIuE9WRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ9Ky-00CBG6-6L; Mon, 22 Aug 2022 15:27:36 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ9Kt-00CB8w-Uf
	for linux-mediatek@lists.infradead.org; Mon, 22 Aug 2022 15:27:33 +0000
Received: by mail-wr1-x434.google.com with SMTP id bs25so13683747wrb.2
        for <linux-mediatek@lists.infradead.org>; Mon, 22 Aug 2022 08:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=28oTaBj3QQ5qfaOFdNPJMDdWbmEaZFUPrH2tNyFmGNs=;
        b=Mz37NWkaYb8tMZzMmpyuq6NH9EzKNwvmWsb3pTvm4FhWcQbDGD11j6E62eklimeBJY
         3p9KSEGRD+4Fy+N918v25mr32pNsi3krgMHS4wTrb3BK+xetSFwNVbMS7Cb23Bp80yhL
         yAcgkqmXLCeB4oudoaBtSXH/QLAv8qCTE33weqW3pJ3VszCOnzEpZHy7IvvL45PLN58k
         4SqzJnOs9xSWK282JiFioTkTntzb2mEbq1Q0ysUWJYCgFiCrjht1OXBUByxGq270M3bB
         mQG8vG6s3rZAmCDJ0xm/c0Cy9C374UIWueZy882vN51ffj+1HCVc0lx1FlNB6atJDOno
         a7Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=28oTaBj3QQ5qfaOFdNPJMDdWbmEaZFUPrH2tNyFmGNs=;
        b=u3nIiJb7k4A3oEhcEHNcWZubsWOJOj1zRqDvllF/73d0vIwj5HAzYDf3XukNZ1mHC5
         mech0TZO72dfsnHcg14prGDUVQIIS+E5sybwKOvQY7iEmBeTlqNKnzSiMPzrYznzZhXK
         GoSg5uCjwNnyITFLcM1QCkvbpJmJDenWiD5WLAxLT/zebD26rjMctspE9usnQ93B1esw
         gN67PxJ4LFmVtqMVQTpd885yO1mikajvOBcFQLcYAdQiMuSJGUD15gPW7BHquq2xxvOz
         aFXwdcoBgObXRMFyrWnc36RKUKIIEZcCzBAR6mp+2WW1SEffVjxgTcK5W+IJ0ULFrbVk
         Vbmg==
X-Gm-Message-State: ACgBeo3UDnIZlYElqJQzwRvce5Y4jX98OAzmu05jVU/iqQIDng+Qgu76
	uh2bfaUhVXboIgp9o4r8+AyYFg==
X-Google-Smtp-Source: AA6agR4u3+bPVRQ4wO7LjAXuGWcbUhm/5HfeLP71djMpFnwiWgUWX9PeYY1veq2kxJ45kdfxXbP2rA==
X-Received: by 2002:a05:6000:1867:b0:21f:f2cf:74a8 with SMTP id d7-20020a056000186700b0021ff2cf74a8mr11191849wri.344.1661182050812;
        Mon, 22 Aug 2022 08:27:30 -0700 (PDT)
Received: from blmsp.fritz.box ([2001:4090:a245:8020:2658:1f7c:362:3e99])
        by smtp.gmail.com with ESMTPSA id u18-20020adfdb92000000b0021eaf4138aesm14492011wri.108.2022.08.22.08.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 08:27:30 -0700 (PDT)
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
Subject: [PATCH v4 2/4] clk: mediatek: Provide mtk_devm_alloc_clk_data
Date: Mon, 22 Aug 2022 17:26:50 +0200
Message-Id: <20220822152652.3499972-3-msp@baylibre.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220822152652.3499972-1-msp@baylibre.com>
References: <20220822152652.3499972-1-msp@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220822_082732_115689_88A87AA7 
X-CRM114-Status: GOOD (  13.51  )
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
index 05a188c62119..ef4c29422bbb 100644
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
index 1b95c484d5aa..190fe66ae79f 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -184,6 +184,8 @@ void mtk_clk_unregister_dividers(const struct mtk_clk_divider *mcds, int num,
 				 struct clk_hw_onecell_data *clk_data);
 
 struct clk_hw_onecell_data *mtk_alloc_clk_data(unsigned int clk_num);
+struct clk_hw_onecell_data *mtk_devm_alloc_clk_data(struct device *dev,
+						    unsigned int clk_num);
 void mtk_free_clk_data(struct clk_hw_onecell_data *clk_data);
 
 struct clk_hw *mtk_clk_register_ref2usb_tx(const char *name,
-- 
2.37.2


