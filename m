Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C972C6FA99
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Mar 2023 13:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k/JwivpSWSUp7SGgg579h7vvWa7gXoSaXDjfT9QxQC0=; b=B4KMkgCDbO1mq24kK/OSYJ8RN8
	m5tVUT0Q9WoJkZBYKfcL44DundDl5B2aoPMtA9SCfa5U9KDvpkBn3u1e+niiFmfBL6D7brF/bM5Q6
	cxWOsOdsdLLhexfH6XNqyvEASMVDet4MKANZchDH1dAA3uShia0Z4DffQddumB1NcDJty/qCPdkX4
	V7iBnJwUaz1usJVM914zi8vspGLRIRzQpH9QguGgdiBxPCaiiu6XXcTm8pyvMdHrBP2gPD2zdEbKF
	+L5Nwq6wg/NqrrHVaQkZSyiCY/2JpEGg0PZIP+NNJpah9tAY0t3qwYRyDlDCmcDkp9bhyZNooGwX9
	rvfZJNag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbLks-002Pme-6B; Sun, 12 Mar 2023 13:28:54 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbLWh-002IMj-6p
	for linux-mediatek@lists.infradead.org; Sun, 12 Mar 2023 13:14:40 +0000
Received: by mail-ed1-x52b.google.com with SMTP id g10so9631161eda.1
        for <linux-mediatek@lists.infradead.org>; Sun, 12 Mar 2023 06:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678626854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k/JwivpSWSUp7SGgg579h7vvWa7gXoSaXDjfT9QxQC0=;
        b=CXU5Sft4Qo94NqQz3mPSkb9P2d9WUUzBRab27MBYfCDp4zAJtkVa4U2gt8ruuAK2fx
         bYmi5lZFbKvFh7jAiwga20LHYuPZuLJ6WwFDw37JcecknQr1EZ6tbXpKsSHrRFM6dH42
         G9jmlFKCdF2j0PJTIZv91TvmWvYmxJetJ5eGnZpcumSgmaLtlgm4+ONduSKLc+F6aFmS
         2wbtsxeM7XjreClsKD102rjyRJhh1sgoZRixqozGJ4sff/5C87OVnI8gkQkfEaJBXzHN
         PLG7p5dhHufbK/Jk1Kg16Rh8G+p1NrvtMOVierX90bJ5vpXVZA5+RMdYqOUEGm66DbRf
         t+sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678626854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k/JwivpSWSUp7SGgg579h7vvWa7gXoSaXDjfT9QxQC0=;
        b=SmGANku2KmwL0ham1Glqt7dW4v2qGrczlkRZeBe2PGZf2+TVpWgMA0Z3/zaYwZTPHV
         ZYmXnN1NyGbmGrHkHnEpn443+3H5JZdMyVOuItMwHhfIhV8LglIgp6gBi4PdAtAJPpam
         qpahKF7fp62Jenq6r8KnwZp2EvfAvFWAO4bt93L0x215GdyoDo2WacyHBbtv2zEUBHnZ
         KSlpsFxjfZSbraIZdRWFeUuoUxkzSJpduW7qauj9LHG/KvGWbvWwzlFR89N0qFku0SF6
         jWl4Hr16F6SRIcjBGLIXF/enKzXXGAAHeh7ZQ0vIgS9+1yUuHkPbuZ/Iy/DiNwYSUzvS
         ugsA==
X-Gm-Message-State: AO0yUKUy6eAA6WzGzUOHz46inXfCs0RJlZ6xqiWJyAQ1LTzYKbRM2KhS
	XYfzm7/FyFM3kuPdTRmpTGZ+aA==
X-Google-Smtp-Source: AK7set9d5tKP82Jz7WZKOjVJ2kxKgLrUjVcq5llmdVffKX9VOgz87qa4igqTtbGBsn15XQe1Xo+erA==
X-Received: by 2002:a17:906:5ca:b0:8f6:ad32:cd51 with SMTP id t10-20020a17090605ca00b008f6ad32cd51mr35131755ejt.62.1678626854759;
        Sun, 12 Mar 2023 06:14:14 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id r19-20020a1709067fd300b008eddbd46d7esm2213279ejs.31.2023.03.12.06.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:14:14 -0700 (PDT)
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
Subject: [PATCH 26/28] media: i2c: imx290: drop of_match_ptr for ID table
Date: Sun, 12 Mar 2023 14:13:16 +0100
Message-Id: <20230312131318.351173-26-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
References: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_061435_607975_C0E9EEC5 
X-CRM114-Status: GOOD (  14.71  )
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

  drivers/media/i2c/imx290.c:1354:34: error: ‘imx290_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/i2c/imx290.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 49d6c8bdec41..3c9470fbfd53 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -1363,7 +1363,7 @@ static struct i2c_driver imx290_i2c_driver = {
 	.driver = {
 		.name  = "imx290",
 		.pm = &imx290_pm_ops,
-		.of_match_table = of_match_ptr(imx290_of_match),
+		.of_match_table = imx290_of_match,
 	},
 };
 
-- 
2.34.1


