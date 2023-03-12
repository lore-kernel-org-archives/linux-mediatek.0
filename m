Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB226C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Mar 2023 13:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z7zCiKznvtISJjaLkQGP6+7WjJ33gWstbauf9XZGz6U=; b=uTG0iHUhVjJ5mDHqFd/kGPoZtm
	ALkc4LRPSKf+7xQvHRxWjuwwVndXVBV4WHs67bVG4wfd6LM1w5OteZwRzxjTKCWYTEohXE7hI2+fM
	9G55XIaJ6SjB69+n9y3ijnpYhV6MfouBMrtW9YP+UEE6aISjHn6auD2IEhFCf7Ll2ZoVSwDVciDsh
	XFsVwLcqspvy5raUlcHiqTVAA1EHEgIC+WbR9Q7Y2PIs/Nw6KyJ2r+Dq+CnvcfGO2PXV/Sk84z50S
	TBxTQxXzPVHMI56AlllI0Uv+OACyLLB6dNzs8aSV+srgLV6zD99pSb/tS8C+5wl1LNpLx8fPxmFdG
	NBHqr/gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbLgU-002NuL-3w; Sun, 12 Mar 2023 13:24:22 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbLWV-002IS0-Nb
	for linux-mediatek@lists.infradead.org; Sun, 12 Mar 2023 13:14:06 +0000
Received: by mail-ed1-x52d.google.com with SMTP id da10so38598967edb.3
        for <linux-mediatek@lists.infradead.org>; Sun, 12 Mar 2023 06:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678626843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z7zCiKznvtISJjaLkQGP6+7WjJ33gWstbauf9XZGz6U=;
        b=hkgeQTl7kiZH/3Q54ASwYRPqBYEKm9l2FvNF4N6ujUzpjYBOHSlr9uaGtfsFgk5dUy
         Lf7kyZH3h1JJOZsT/VqnMhAwIr9habC6FILxMvlJg+5lDE8Gm8v9LoOiSX0AgLvzYOXV
         D1eMF/v8xIRnSfqePFrzRlbuWXhKfLcsc5BxUvRxpTQsE40ns4iU8iLxwlkwixvZdt1i
         plgBO2DlKmx7mC/7hZlCbT6NpXJAd3vc/duYJ32+zVYAhmGzyshA+m/npMOTDXiqIciY
         cqtNGAb85Dl+16dZ0hHPIPDKjL/nPIK6PpZ9XRG6VOw8dR+hyXC1DPyCGKqcyAUvnNbP
         D7MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678626843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z7zCiKznvtISJjaLkQGP6+7WjJ33gWstbauf9XZGz6U=;
        b=XvWqqcqjWsx8B7PeM6fZDFN/0s03HByqXBu9zmXeL/sVZ90F/8Eee8JHvDNQ+NIQ+p
         CMsMMi7phEKzjU2zPOLxtoQkk+HH/rU/uWpmh/LwajCfC5BlyyDi1cqb2Yvz+JKGg+Vu
         xXvIm0wS9kwTcEBQ3UV2bbX0JmDLybIOHYnsMOs/jHYTtvfql2wlua5/XDBV2pujQbM/
         Ud8Xt+JmiHjOLJN5GL6hlU2S/NPgZZW5T/x6PgHQB7FJJrlZHGqsg3/N/FtEvYxDP/B6
         k2jGKphrh9patPGVvMclGh50b5y3fOoQygdnOAVTpOdhsP5nCiXpdmVhragvt9pmqmA8
         a4Ig==
X-Gm-Message-State: AO0yUKWb/NMoXOY5NbuG7zep/mLz9bGlKUJ7dfl3PyPnTPwAbIzqzEPC
	n1xZrq0/80Eas4pEQwDdUPpkXQ==
X-Google-Smtp-Source: AK7set9rwzHv7NjHz3Ld8t1U7IlpFCFMC7/C2h9WMvqIP99asEQnOhRylPIAm1sXrRZyif38WBVBkg==
X-Received: by 2002:a17:906:855:b0:921:c122:52a7 with SMTP id f21-20020a170906085500b00921c12252a7mr4317759ejd.22.1678626843141;
        Sun, 12 Mar 2023 06:14:03 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id r19-20020a1709067fd300b008eddbd46d7esm2213279ejs.31.2023.03.12.06.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:14:02 -0700 (PDT)
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
Subject: [PATCH 20/28] media: platform: jpeg: always reference OF data
Date: Sun, 12 Mar 2023 14:13:10 +0100
Message-Id: <20230312131318.351173-20-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
References: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_061404_001933_74F2A595 
X-CRM114-Status: GOOD (  14.44  )
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

  drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c:1890:38: error: ‘mtk8195_jpegdec_drvdata’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 969516a940ba..bd12e73492e5 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1898,7 +1898,6 @@ static const struct mtk_jpeg_variant mtk8195_jpegdec_drvdata = {
 	.cap_q_default_fourcc = V4L2_PIX_FMT_YUV420M,
 };
 
-#if defined(CONFIG_OF)
 static const struct of_device_id mtk_jpeg_match[] = {
 	{
 		.compatible = "mediatek,mt8173-jpgdec",
@@ -1924,14 +1923,13 @@ static const struct of_device_id mtk_jpeg_match[] = {
 };
 
 MODULE_DEVICE_TABLE(of, mtk_jpeg_match);
-#endif
 
 static struct platform_driver mtk_jpeg_driver = {
 	.probe = mtk_jpeg_probe,
 	.remove = mtk_jpeg_remove,
 	.driver = {
 		.name           = MTK_JPEG_NAME,
-		.of_match_table = of_match_ptr(mtk_jpeg_match),
+		.of_match_table = mtk_jpeg_match,
 		.pm             = &mtk_jpeg_pm_ops,
 	},
 };
-- 
2.34.1


