Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E99A1C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Jan 2022 09:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wbBYfdY/8gbTVfi6Y86tYazoDw0AAgr+h7WkB6SWr1I=; b=kUZZ5/94N3sslC
	FW9yxUfKALzoq0MQI+7HZPe1Xu9ShETy3ZCX/DpqepsbXzMZds9GbRAgdU/H7BQG22m9LNS76wQFr
	DvcplC1y7UMV8raYNVIZ42PoYhvT+cp8e7FZWA4rjbA2MzDKje111Al8571s4erdW0jVHLUFly+tP
	LFTIIdiv3rFe9ioFVw2M1OHKTlDOCE3Y1SgkZw1GumMqJlaX46LVDSegLfKWqv5t4ZentwejIqu8L
	w5b2h02Cka/f1uTdgCMP88Bbhq4AgneOmgQqHyW793cNigsITHGn9bHCVWlZmZNGQEJ9eTBdHBsjr
	jLbN1yHD3ir/XRhe1F9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBCqe-00H020-6R; Sat, 22 Jan 2022 09:38:16 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBCXo-00Grv0-ST
 for linux-mediatek@lists.infradead.org; Sat, 22 Jan 2022 09:18:52 +0000
Received: by mail-pl1-x632.google.com with SMTP id j16so328188plx.4
 for <linux-mediatek@lists.infradead.org>; Sat, 22 Jan 2022 01:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BRdPqU8/wgjW8dVj35l2dqDHIgNyG8RkF40G3LrYL04=;
 b=Fuyv3VjSgzBkc769Lo/2CI7DZ5+GfuLLZoIVtSUhg6V37yvZZjs0K7eQ4eSZslBFGK
 usShwZDBaY7bdt+XegEK2ZJyP6x7yd5qMvqXo5OydapiA3sNPpx6xr2Zkzu9wSA5RsDS
 FcKihT3u/k8jED2Ow+v5mvkMHtTDBpLzLnIA8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BRdPqU8/wgjW8dVj35l2dqDHIgNyG8RkF40G3LrYL04=;
 b=l9JdLaaHy6QZLNZKTKkfAv0rUyZPsnya1R2hOzt826N1NLmdB9DiBVpV9zD9YtSWW/
 qNCTpwzvF3oOsxFqq1BUIgY/z6RMpPQeAgBSYcoIWLqHWshkme0+9wiwkl0LaYK2cVlP
 PYpXaei/xoZ6j+XpCkrq78HqZtICbSqRnebPwXrB/fPI7g8OjF8/91iV7jcaC/qU/p41
 EeYnfCcrihvdIKXBVpXXHsFB7UA7FOP1v3unmL63YUDUpmYrGFBvCqZYg+JKzCxjh6xl
 mVSyEg9oTtCCpB138T2+Edm5uhBVzN9g3OiRdggyYrVahE8h7W7iB97XdW/9AurbXp+c
 waCA==
X-Gm-Message-State: AOAM531Q8QOQlEhNcNI1a/Pd+whGVTPv1zPBgZEjVynnhvMThnLace6a
 mk/oyB+2aFYgKni1XIMfzA6M1A==
X-Google-Smtp-Source: ABdhPJxTbBDUz1ZVF3T1/WMxItjtS2Jk9+TiJqGSG9ZvAellDQvwJc4yjnRGhEOmpZtTsU1/xc9bqw==
X-Received: by 2002:a17:903:110c:b0:149:9004:4e7c with SMTP id
 n12-20020a170903110c00b0014990044e7cmr6904060plh.167.1642843124559; 
 Sat, 22 Jan 2022 01:18:44 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:349f:9373:45d9:eb26])
 by smtp.gmail.com with ESMTPSA id s1sm1608100pjn.42.2022.01.22.01.18.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jan 2022 01:18:44 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 27/31] clk: mediatek: Unregister clks in
 mtk_clk_simple_probe() error path
Date: Sat, 22 Jan 2022 17:17:27 +0800
Message-Id: <20220122091731.283592-28-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
In-Reply-To: <20220122091731.283592-1-wenst@chromium.org>
References: <20220122091731.283592-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220122_011848_990177_F10F7E6A 
X-CRM114-Status: GOOD (  10.73  )
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

Until now the mediatek clk driver library did not have any way to
unregister clks, and so all drivers did not do proper cleanup in
their error paths.

Now that the library does have APIs to unregister clks, use them
in the error path of mtk_clk_simple_probe() to do proper cleanup.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-mtk.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index e1977c8e130a..6d0b8842971b 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -434,12 +434,14 @@ int mtk_clk_simple_probe(struct platform_device *pdev)
 
 	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
 	if (r)
-		goto free_data;
+		goto unregister_clks;
 
 	platform_set_drvdata(pdev, clk_data);
 
 	return r;
 
+unregister_clks:
+	mtk_clk_unregister_gates(mcd->clks, mcd->num_clks, clk_data);
 free_data:
 	mtk_free_clk_data(clk_data);
 	return r;
-- 
2.35.0.rc0.227.g00780c9af4-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
