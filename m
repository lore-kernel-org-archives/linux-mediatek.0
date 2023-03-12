Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE30C74A5B
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Mar 2023 13:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bNTv3xaa9umrxHIJgX0gdbiFrLg5kepDivQRRUUNj8Y=; b=lnGdAN+xGQrQxI+V3XGPFQ268A
	Y7V4xJF3YGGG1nq9dl5y8CJNaG5b5OkFUAJezmhVT+sLYWX28B8YNo16w6g04YwN+9ZecM29x7YW2
	KKTbV3IAohhntsbxW+wL5ALjI7m4Td46OHHdp+Y2y3rIiJdK8ufwHxSDIyEs3xOqDcQd0eCaeOGRS
	DDPf3n+/e9r2MzCExwAl+htCGdFeSpX06ihGYmmgGWdaDVua411jW4Uu+Oai1ZZXWPbdFYEZ79Oof
	hI/sfKY6aNZ54FlgJ4YN7PvPydcFWE9GAV07h8sfvZNEThTwwo3NQJjVHnNOZ477BOSMSyg7zAGI1
	Y6ogTjbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbLXN-002JFn-1v; Sun, 12 Mar 2023 13:14:57 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbLVz-002IOT-TU
	for linux-mediatek@lists.infradead.org; Sun, 12 Mar 2023 13:13:34 +0000
Received: by mail-ed1-x531.google.com with SMTP id g10so9626575eda.1
        for <linux-mediatek@lists.infradead.org>; Sun, 12 Mar 2023 06:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678626810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bNTv3xaa9umrxHIJgX0gdbiFrLg5kepDivQRRUUNj8Y=;
        b=mG8+ne6l7Du079iLYFKAm363rTLrrVtTa9ONV2FnnfYLx9z+0BUd74yGDBf9AzPZxX
         QrZ1KXjPmZf0WaAdFO37yPbgZoFxApLLMBsvJhu0hu5AW8aFuRFAdxj0wXjl1Z2FwCdu
         A4uVkL//3t8ItL3/TvFvjOEN6RlwsHBJdOhPwcGGiW6TDk18/oOJ7BImmuG6/EVxPy3s
         89BwwXEdnsV28E71nkiplp+F7zUpWYoW1St11csIMZGdqp/Iz2ukoaZ+bo2P2g/WaIIZ
         jSkYNJB5oJPV1nTr/X5JQWcZ9oaHyq9x+77xqkR56N7qw6d3Vd9krj0g1cqQ9OIP4G3V
         xZ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678626810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bNTv3xaa9umrxHIJgX0gdbiFrLg5kepDivQRRUUNj8Y=;
        b=cxL9cRIw3nNGSms5x+xRygTNZ6/CAHBN8U3+m+vHJFqsq4f2FJG9PDN+as2afaiaFf
         XFTDMlTNix+LX+sNslAUzdog5dVTHYIOJHoaiG969Gs5vVNH3BBW7jzuAwuui9L76QSm
         IsbT2ZLRw65QqhisprrneZen8zrVMQ8ZoeO4Wc1LoI2Ie4XHtpvqYLRErVf3Kpjt68Ap
         iD1ZI/ZZNjw+DevECurpscx0PjYgZhvMYP1hC7tzBEwQyco0pNVu96JuZiirIgCN8rgs
         GukKFJ/BrlAULaYlz/HkIrGkFQIWR0CBAufBazyfsjPLfo9F90f9LVQYWcdp++KkxeFN
         oeFA==
X-Gm-Message-State: AO0yUKX/W59r9TAbvwSNBvg4Ky8rYzY/A3l6MjoUdwkqk77ZxylKFHBL
	V5b4T5lql6bpgRLMcpSLHR4f9g==
X-Google-Smtp-Source: AK7set9hIVqb2QRhYpBrnz8OxTvSZYTsM/7cq1IWZ524Geu7mNPCnFJjF+tKxEOcIui41/2nlHg9Mw==
X-Received: by 2002:a17:907:869f:b0:8a6:5720:9101 with SMTP id qa31-20020a170907869f00b008a657209101mr37675191ejc.4.1678626809819;
        Sun, 12 Mar 2023 06:13:29 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id r19-20020a1709067fd300b008eddbd46d7esm2213279ejs.31.2023.03.12.06.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:13:29 -0700 (PDT)
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
Subject: [PATCH 03/28] media: cec: tegra: drop of_match_ptr for ID table
Date: Sun, 12 Mar 2023 14:12:53 +0100
Message-Id: <20230312131318.351173-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
References: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_061332_046328_4A3E221E 
X-CRM114-Status: GOOD (  15.76  )
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

  drivers/media/cec/platform/tegra/tegra_cec.c:457:34: error: ‘tegra_cec_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/cec/platform/tegra/tegra_cec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/cec/platform/tegra/tegra_cec.c b/drivers/media/cec/platform/tegra/tegra_cec.c
index 5e907395ca2e..7115636ca748 100644
--- a/drivers/media/cec/platform/tegra/tegra_cec.c
+++ b/drivers/media/cec/platform/tegra/tegra_cec.c
@@ -464,7 +464,7 @@ static const struct of_device_id tegra_cec_of_match[] = {
 static struct platform_driver tegra_cec_driver = {
 	.driver = {
 		.name = TEGRA_CEC_NAME,
-		.of_match_table = of_match_ptr(tegra_cec_of_match),
+		.of_match_table = tegra_cec_of_match,
 	},
 	.probe = tegra_cec_probe,
 	.remove = tegra_cec_remove,
-- 
2.34.1


