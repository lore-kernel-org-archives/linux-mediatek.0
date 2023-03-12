Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4408C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Mar 2023 13:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mi2x5KmVHY8aFVS8WFaKRIl7phB/m6sMx8X9ScJ0O1Y=; b=SLnXlChbl4COxU20vqeACOStXS
	tkQRcsMXtoj3y24ydLryxhmKrFGEV25nIE+tWyNQP4BpzLKcedqO4iuD/ZpXSIfDpwJxx2t62OBbV
	tNyyhGZ8pKr7S3llsuI5ZhpwuKQYeKmYma7O5/OJUiZdfaNgrJ/yrMF7bXDSv1CbTe0xkHWBFRndA
	kE3gsuOA/DcWFAoj3jrWzKfrviIwPc5eXa4dOuVpgcWZ9cIlNbldYFvKxylL5VkmIHL8K4I5dX7A0
	D9IhQqOf3ylvuHx0G45pvs1SytrVYkAN9TdoK+MctEF/mByurC0SXwiaxdZX8tI26/ZfkHuy7OwAN
	wvH9EfWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbLcX-002Lvk-Bd; Sun, 12 Mar 2023 13:20:17 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbLWM-002Igi-7H
	for linux-mediatek@bombadil.infradead.org; Sun, 12 Mar 2023 13:13:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=Mi2x5KmVHY8aFVS8WFaKRIl7phB/m6sMx8X9ScJ0O1Y=; b=Iljn4Qu8XJqujSk1dRZfLXYm7c
	EWdYr1QckfbH33RbeLjyPfiAM6tffqRIRxyri3t8QSpIfan3JXJKHkY9qwJr3GRNusKrVSXAil9od
	ZUnt4bld43EjUZJjp/DkqlvLPD+SVlda4zgkDEaS8vDPeSMCmocHPfiNo8C9lhuqpNVqXDfYzLrgk
	xwP+qxBC3CazrtottqjZUhCFX9AvFkRfF5LbHBoSsqKZxXoc0znnXxZqD+Rd9c8T6/E4bt1z4H8oe
	l9Gpbpd8sbnCoDgtqr3HLF1t/clU/DiUW7cvUjXjVicQLF4gRYgFmDp/q723e+Zl3y2QkO0GCbgTi
	z5M8ckzQ==;
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbLWF-00B3ed-A2
	for linux-mediatek@lists.infradead.org; Sun, 12 Mar 2023 13:13:51 +0000
Received: by mail-ed1-x529.google.com with SMTP id da10so38596890edb.3
        for <linux-mediatek@lists.infradead.org>; Sun, 12 Mar 2023 06:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678626825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mi2x5KmVHY8aFVS8WFaKRIl7phB/m6sMx8X9ScJ0O1Y=;
        b=GG1FZzu4R08U7ZrQJTDqnm9yyObLtqMDWCx3B/cxyKmqz+Inu/lGru3GBlSAmoNZ2d
         WS9SlIFw7l28qxUjUEIBnfHvBpm5c6g1F4pUDGTJklw6dfbWjyAvPQGUtVzR7OyvFiyQ
         dyuSUmpAGQUkWb8ymF+2KyhC2+95GCs3P8qBCovptLLx92YGuEIvrF2/nQKp3RKdKB2q
         4WRWxJI+thxZatMOq8kxvNE8yRXL8FB+dRcXQH7oOSuC9AcNWcYgasCTPck/INBz0sk4
         D5bd8nEqJArLbuAbevCLQSORbLT9ASQ4UO6q9+5gCJHqKdXkvauSNJboZF8dLbTMmvXn
         eDAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678626825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mi2x5KmVHY8aFVS8WFaKRIl7phB/m6sMx8X9ScJ0O1Y=;
        b=Kvb9cXBkC+vSeoE5TFwm7YebzL27NgOsLc2bTCAMIps2QCuYqX78Sjbn/sr6c3JBfh
         H+3J0GGQF+OLZP1DtTmfOV90jmWNa96afJgBJ4IwWSRgacqO2aZjAhcaED5zJMaSgvmb
         wFYIjyyNMwDgQvvNlmrJLQrkB8Q334XcTX8Rma5gJF0Tkmy2CFKnIK90q8+v/gexj6SJ
         f2GHBbgbVKmgqETIJ1djPBZfKTWhNFRMoI8Wnm5VBp1b/hwNNUitdUZS4vam8JjoeqYV
         JRDYKDKzAFVDNAQ0ooCQA4l63WWM2PqHWjEuCI+bWO0uDa/xNc5QRZVU0BA7pI6QmZrs
         N6yw==
X-Gm-Message-State: AO0yUKWvRCF0Kn4zCKiGsvFSEmTQRgI/bIgSe5lLiCoiFabnPD+zIBno
	zevSEUayn5LEiALYIocfwf4F7A==
X-Google-Smtp-Source: AK7set+7qUF+bcLWEkAr4Cox0v1rHikG9c/U926xfMgDAeF0Y5GVKCnNz9afn9B0OfITyqkEgAYQeQ==
X-Received: by 2002:a05:6402:1005:b0:4f9:f45e:c8b3 with SMTP id c5-20020a056402100500b004f9f45ec8b3mr5025265edu.27.1678626825396;
        Sun, 12 Mar 2023 06:13:45 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id r19-20020a1709067fd300b008eddbd46d7esm2213279ejs.31.2023.03.12.06.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:13:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Joe Tessler <jrt@google.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Wenyou Yang <wenyou.yang@microchip.com>,
	Bin Liu <bin.liu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Yong Deng <yong.deng@magewell.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sean Young <sean@mess.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-rockchip@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 11/28] media: platform: ti: am437x: drop of_match_ptr for ID table
Date: Sun, 12 Mar 2023 14:13:01 +0100
Message-Id: <20230312131318.351173-11-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
References: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_131347_837817_78B13380 
X-CRM114-Status: GOOD (  13.90  )
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

The driver can match only via the DT table so the table should be always
used and the of_match_ptr does not have any sense (this also allows ACPI
matching via PRP0001, even though it might not be relevant here).  This
also fixes !CONFIG_OF error:

  drivers/media/platform/ti/am437x/am437x-vpfe.c:2620:34: error: ‘vpfe_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/platform/ti/am437x/am437x-vpfe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti/am437x/am437x-vpfe.c b/drivers/media/platform/ti/am437x/am437x-vpfe.c
index 2dfae9bc0bba..fe89b8e250e7 100644
--- a/drivers/media/platform/ti/am437x/am437x-vpfe.c
+++ b/drivers/media/platform/ti/am437x/am437x-vpfe.c
@@ -2629,7 +2629,7 @@ static struct platform_driver vpfe_driver = {
 	.driver = {
 		.name	= VPFE_MODULE_NAME,
 		.pm	= &vpfe_pm_ops,
-		.of_match_table = of_match_ptr(vpfe_of_match),
+		.of_match_table = vpfe_of_match,
 	},
 };
 
-- 
2.34.1


