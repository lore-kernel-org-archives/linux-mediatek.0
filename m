Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5025C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 May 2022 10:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HBK4ZNZCAZcwPGABAX1gbJjuk13LxOkHFTrM2QWGzA8=; b=MPvYaBhQMuAh9p
	5Fu3lHextugdZwOq5+jwjjhSQLZm9ijkCY89K+MSfB1+W0xTukayh08q7wGXC/3s7MV/3u0Z7lMKA
	vIFmGKTTO2HbhQfnJ4H8HjH0mYxzYBXlvHdZgNAdVJKgZFtEE0lgJbBiCVMk4ip2GJHIVXUN0wKeF
	MMbLBnpRgBcJSwdDJv9Xfp+MDUoyOfC/X7pZCVlkhhnXQVA3gCvHprvDs5jwfhJOzTeLwFuJGHG7Z
	PJ0QWauNdXuOA5TWLQXRSlht+f1wgyf7qMe0WxZffXj6AJ6czYTv0lO1Ur5qWN1o+Mkhw/IahPklq
	IaeTSVcva2OllVPLxCug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noNQH-001JAc-Ij; Tue, 10 May 2022 10:48:57 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noNPh-001Its-Vn
 for linux-mediatek@lists.infradead.org; Tue, 10 May 2022 10:48:23 +0000
Received: by mail-pj1-x102d.google.com with SMTP id
 iq2-20020a17090afb4200b001d93cf33ae9so1686073pjb.5
 for <linux-mediatek@lists.infradead.org>; Tue, 10 May 2022 03:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9ya570kQIAxuwgnTHVGLX3kmecG/HttO9ZeMkT+/ygQ=;
 b=gKnovVtABKGaXs0ew7Ew46WRae5W9XUyMaRi+BXWBsgdcPRWPTZkv81F1UTsdFhA+R
 0bK5gYQejDadKl/CyZtRvtrZy0cO4xfwB11HHMczv8yuTjR0iz2hZMtWCOon4KnRr8U4
 wCGMJJ16wP+oNIyhUjai4h+GSF0TZ5Cq0FvDA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9ya570kQIAxuwgnTHVGLX3kmecG/HttO9ZeMkT+/ygQ=;
 b=Va0nNo3y17b8eAlC+YfRH48SR2adxKLBEpFTW4o3jzzPencUjw9fLqTJ03ohgRpuvp
 MTQ73OlVXGQdTeCua0d89hklEvrOJ7XvUF36R5n6tE8UpU3oDbKX7O+BHk+jR1ZRpe38
 ztiWB04pSkKiixfDIaG5tZEA/eY0s8QETT0Abv6d/COPW0ZQ9Ndki8MleR7w2ofrReE5
 uH9c/lmBxlpfwEA12oWwsETaIPTtEK2tur/71dJ8lBc22ZuWA0a+2A7JmKYto1q4OBGd
 Mul7wRQgPgsunoRvVmpok4H/FwbbKklmxhn4xOzhO3CJEILmiLnIAJHDu+g0LY7FD0N9
 otTg==
X-Gm-Message-State: AOAM530sGdw5F068lkFyak6KeU3bQf56KMK1051ZCvsoH6YlYKH9Cbmm
 OZ6+KpG6Dp260W3yUgJyxK9n4Q==
X-Google-Smtp-Source: ABdhPJyuC3cLw47lStzO6uMYKTb6L73kwMJTqdTohd+gCWo6N9AUW5HTchd+pVnS5MwifVwvcusnJw==
X-Received: by 2002:a17:90a:1d1:b0:1dd:220a:c433 with SMTP id
 17-20020a17090a01d100b001dd220ac433mr8066368pjd.196.1652179696544; 
 Tue, 10 May 2022 03:48:16 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:6dcd:8578:55cf:2b12])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a170902e30900b0015e8d4eb21esm1659691plc.104.2022.05.10.03.48.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 03:48:16 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/11] clk: mediatek: apmixed: Drop error message from
 clk_register() failure
Date: Tue, 10 May 2022 18:47:55 +0800
Message-Id: <20220510104804.544597-3-wenst@chromium.org>
X-Mailer: git-send-email 2.36.0.512.ge40c2bad7a-goog
In-Reply-To: <20220510104804.544597-1-wenst@chromium.org>
References: <20220510104804.544597-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_034822_042226_6046D9FB 
X-CRM114-Status: GOOD (  13.70  )
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

mtk_clk_register_ref2usb_tx() prints an error message if clk_register()
fails. It doesn't if kzalloc() fails though. The caller would then tack
on its own error message to handle this.

Also, All other clk registration functions in the MediaTek clk library
leave the error message printing to the bulk registration functions,
while the helpers that register individual clks just return error codes.

Drop the error message that is printed when clk_register() fails in
mtk_clk_register_ref2usb_tx() to make its behavior consistent both
across its failure modes, and with the rest of the driver library.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-apmixed.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/mediatek/clk-apmixed.c b/drivers/clk/mediatek/clk-apmixed.c
index a29339cc26c4..06400c043fe7 100644
--- a/drivers/clk/mediatek/clk-apmixed.c
+++ b/drivers/clk/mediatek/clk-apmixed.c
@@ -91,10 +91,8 @@ struct clk * __init mtk_clk_register_ref2usb_tx(const char *name,
 
 	clk = clk_register(NULL, &tx->hw);
 
-	if (IS_ERR(clk)) {
-		pr_err("Failed to register clk %s: %pe\n", name, clk);
+	if (IS_ERR(clk))
 		kfree(tx);
-	}
 
 	return clk;
 }
-- 
2.36.0.512.ge40c2bad7a-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
