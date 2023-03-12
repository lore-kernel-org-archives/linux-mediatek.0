Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C16EC74A5B
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Mar 2023 13:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0wZbL2YE4DT8U/n7QjqQ5NPuVVOedoWmVW8GR5DkOxE=; b=H43081aCu1yleQgbf6aGuWyBDq
	dzcMG/CRvXhPi+DmmTd4gy08fm3DMC1mRkU78e/0uPcoTAUPXYzZMvnUdkaXJ4u/pq/NCfVKuqkKy
	C/IBxBqP6eCi5JKTRR31+6uwyU/Ci4zFlo+CBoiG0e20TiW1rcGKxm6I2cxqsTcUUJK/qgDBP7QYr
	YWuhbFmxxhf8F13KEQKl8Fip4T+MJFCf8yraRLxwtRATUlTgKs64BT0GXcuOVLXasw0qr0PejCg2z
	Vqz6X56Tg4Y5IFh6XaZYmkXmJ0OATSgl/3yfK+IF8GOlOUdjje1Bv9nBA+JgoYMyPxPl/rqhuuEJB
	efrDuccQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbM6f-002ZIt-Ks; Sun, 12 Mar 2023 13:51:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbM1V-002WYK-6c
	for linux-mediatek@bombadil.infradead.org; Sun, 12 Mar 2023 13:46:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=0wZbL2YE4DT8U/n7QjqQ5NPuVVOedoWmVW8GR5DkOxE=; b=MSYfovfvYv44RNsJA2ldDMNdol
	yVP4uHmEinGG4iMlR2gl/wsnldrSAzeCoyn8L+SY9l8ZJbeTH8uIhQr0YwYyEq8w0guUHA9HSS8Xv
	59mzaBolQU4yvhCsrwJxa65dqJp4z+WNKvY6jb5uiLof/+oU88TnnRs1fBfPvCNTB9/EsyQ+Fs43k
	mWakGk/Jg0XtGClRIuKllbPKjN9TmmrDpZ1CHNYul/tTiTaHE69AGe2O1cdKNCzc002ihwCD+lvwB
	dn433NOX1LlDGd5hn/GrrYEmKMBY2XokW3Ss5Xsthbgodp0sjU+puO2ry4N98V3cidKHRLiXg6h16
	WFImKOBA==;
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pbLWZ-0011Ef-1B
	for linux-mediatek@lists.infradead.org;
	Sun, 12 Mar 2023 13:14:14 +0000
Received: by mail-ed1-x534.google.com with SMTP id cn21so8316305edb.0
        for <linux-mediatek@lists.infradead.org>; Sun, 12 Mar 2023 06:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678626847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0wZbL2YE4DT8U/n7QjqQ5NPuVVOedoWmVW8GR5DkOxE=;
        b=KhyYeWigZGhPF510CvX5h9jE+fAqEKL2Rqs6qyLcdHXMTpfyTrH/yYmW5MTvJeK8nU
         9Y29KFzVe5cxs4J/rOcqaKWnpIbAymZchxZ/wGXUYskLlKXCUtjl0OgM6d1MpMYDwe2B
         5JML0Xz4YjWR3BX2c/3QL3NfzaX094la29OY3e5oakPa2FxDE0KgDp7gO70LZ03aGu6/
         hWXBFSgOOKx8rWZ3Aubf1UN1YZWNDAQIP5CIknOtco2JAOy74u8Thdocrurl29RGgT5l
         qLqTSjhtjfsb+ut1Estkk2Nyx1WDu0Ny1wu+fQDaiUFcO5y10EPZSGOTf7jHfa86mqiH
         i6Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678626847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0wZbL2YE4DT8U/n7QjqQ5NPuVVOedoWmVW8GR5DkOxE=;
        b=Ji9GYJdpmBr58I0yAJM02fEE+EyRp2PJUAdWVWcjKS44kAHMD4cRnOcxcRb3B3REzI
         gnm02RB44umjljHKrJXcVg5Z0htPPA7ijiV6XUAGzT6Jx3KDgju0mQfswXjv1PRm3ReR
         cy2js3oArLSdPBY2OSR2drYVBUeqHoLvgJV18ZfP4EbPeG9trtDwvkNWo0xztBTh4tEb
         pkGczg97MO9UJLttIzvsUB7m3ghB06DsZ8co+VdaIcwJ33cFFH3LOEw7A4fkZtNhRpTy
         a59eXTNYrPrc1xIeJ3s6L8VV9jayeBdsXFkMyOYBTS/CIxo47oU+s54AbjUPkH4kIYKN
         TVXA==
X-Gm-Message-State: AO0yUKVM8HJEJnK/zEbOp0AMlUOgZYD3bTfT1Wl5CyGCvZZaEvTG9DY/
	ck4NNEVY/r2cXNWfwI+A1XEQaQ==
X-Google-Smtp-Source: AK7set/LSFpK4yaynBThKlKSPfP1bsBiZFb33g2FppGxi4UYvcynFTqjlnDykMn5irNp8KK0K+3W1Q==
X-Received: by 2002:a05:6402:1105:b0:4b6:821e:1859 with SMTP id u5-20020a056402110500b004b6821e1859mr8115383edv.7.1678626847028;
        Sun, 12 Mar 2023 06:14:07 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id r19-20020a1709067fd300b008eddbd46d7esm2213279ejs.31.2023.03.12.06.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:14:06 -0700 (PDT)
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
Subject: [PATCH 22/28] media: i2c: mt9m111: drop of_match_ptr for ID table
Date: Sun, 12 Mar 2023 14:13:12 +0100
Message-Id: <20230312131318.351173-22-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
References: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_131407_899619_0BF679A1 
X-CRM114-Status: GOOD (  12.87  )
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

The driver will match mostly by DT table (even thought there is regular
ID table) so there is little benefit in of_match_ptr (this also allows
ACPI matching via PRP0001, even though it might not be relevant here).
This also fixes !CONFIG_OF error:

  drivers/media/i2c/mt9m111.c:1370:34: error: ‘mt9m111_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/i2c/mt9m111.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/mt9m111.c b/drivers/media/i2c/mt9m111.c
index f5fe272d1205..20ed87d872c8 100644
--- a/drivers/media/i2c/mt9m111.c
+++ b/drivers/media/i2c/mt9m111.c
@@ -1382,7 +1382,7 @@ MODULE_DEVICE_TABLE(i2c, mt9m111_id);
 static struct i2c_driver mt9m111_i2c_driver = {
 	.driver = {
 		.name = "mt9m111",
-		.of_match_table = of_match_ptr(mt9m111_of_match),
+		.of_match_table = mt9m111_of_match,
 	},
 	.probe_new	= mt9m111_probe,
 	.remove		= mt9m111_remove,
-- 
2.34.1


