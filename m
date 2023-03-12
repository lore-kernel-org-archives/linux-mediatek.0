Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD37C6FA99
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Mar 2023 13:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m+WYHU/SqewTwrfZuCdGJulxf+5ECuJ2svWptTLYXIE=; b=OdcsIRBFU393m0+owdDQj+RK7H
	IfPgPnxKOzB3oS51Rih8x7uCYq3Fya/qPbC+QeBYkaw+2f8clYv26VNirQzd+rc+Pc3JqWTUsXO8V
	71HZkW3n/nr1Mwo9ypsPD/Itgt1RLeBFywNKO1bQlcEZ4d93jCtQd6utudqmBPv9JVcAMP1CO0JQT
	oC2Tmn9zV3gbLna32S/BiH8NQ4LqjqCelNUbPWmup4skX8sSSSpXoYOaPK6zNYFixkQxYFhh86gjf
	SE45RVNxqVaS+5mzPOMzoYHwpzuqpDAVtKiCXk8jPv8TAGT4twM87mmfdiSkxcdLuJ4nIfcroFVLv
	msdgjLuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbM7t-002Zu9-0K; Sun, 12 Mar 2023 13:52:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbM1g-002Wdx-MX
	for linux-mediatek@bombadil.infradead.org; Sun, 12 Mar 2023 13:46:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=m+WYHU/SqewTwrfZuCdGJulxf+5ECuJ2svWptTLYXIE=; b=KmTl65d2qH496JrvlIt2b7Iz4i
	HmydYh7mB2vQZXkZD+BiPr5AyVr4oRGimdG/Mf+bbn+VvRmt6JH/1beb6BYtMHoF+V7QGYtyzTUNt
	l1wCU+TDSXb23V/exKodRFeCydcQy4S6VkeuWnRgE0Crdz+6/xtombHIvYc1rKyS/t7rx7OaGBm0v
	hKkEm7eA5iPX9aM4gcbEo8pZ+EXWqgestMBgMszWRqZNwyRp5DIS5paxJMufui1TY38AgDRMr8wCt
	VeqCl+tJQFMm6U8fn2wq/iWXc4kD04JU5q4j+UbAxHn31wML0aV095+7YoFR9+5owhaRGLq5bX+uC
	RoOEZpfQ==;
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pbLWf-0011C3-0a
	for linux-mediatek@lists.infradead.org;
	Sun, 12 Mar 2023 13:14:19 +0000
Received: by mail-ed1-x536.google.com with SMTP id ek18so7377775edb.6
        for <linux-mediatek@lists.infradead.org>; Sun, 12 Mar 2023 06:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678626853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m+WYHU/SqewTwrfZuCdGJulxf+5ECuJ2svWptTLYXIE=;
        b=qa63Qo9fSC+Ap6jq8NDE2/EKVxm+oVWK3PFoPnwE4yBlATkz7TLk5YW9j1Aus6jlO4
         6yc4oApxJj/EDKros+pMJB38lQNWN1egudsvqOCBUzYW64WGkXUr4UF5uvMAhzPeK5rn
         MFPFUDZQfSOayCcp9U5gDPkJDFkGju6UWmsy9KCRljegOCC7go6mgN7GfCuyf/VdVbFD
         RI2fxqf3sl093J1Dwc5Jpz0d+PVkRtuxgBckuhSs48nPfSE/o9nrnsQU4Mp4x4rkVe1u
         GMHKWSQnkdmVR/BpH9WvboP+5QMDYLm5XUHxVqEXRB/RgiCPMXI3gOvVA9FVBVyWZXAk
         RPlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678626853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m+WYHU/SqewTwrfZuCdGJulxf+5ECuJ2svWptTLYXIE=;
        b=nk6JG0RHFBaG3cxGg7AaEkvHFryKgRU04TBzKyxjzGm359qulF8ypdULCsfbl1YCNh
         K9p+VK53XM7qlqv0Polf5jTVVEsJKnQY3YiciLLIKGuxxw6z8ZhtrHQUbgpOf0BopDjm
         1VvPt9yqt6DCwO84S+6FSlHyh/0xgedJABsgaP0AH8JYpg/OUK9eTyFtOt6+0RLHWaa3
         jzqYHa3se09BUnTJLTf9KpZZHchrFIi9/P1OMW+o4M56oerHYD2WX/xKdGDYaU/QIgi5
         XB09pXVEgtu9Fe1dgx9PAI/VUAs9oxdyOlSGMc97tKm0zlyElJQJM7SVu7xoFohgEqj0
         JKGw==
X-Gm-Message-State: AO0yUKUk5fLkQORk2rConi5HG8oYUpct4CjoTNl0BS6XU4Ux/rqpW/9q
	ysJLucEm1MblITSVFSg72hmz6Q==
X-Google-Smtp-Source: AK7set+ykF8LuOJPvpEW6vSvb+7ovcB0VmDW/wPOL+5hsoHHErX+DX/e38bZbR9JDZSOpCTKdXlvqQ==
X-Received: by 2002:a17:907:72c7:b0:889:d156:616d with SMTP id du7-20020a17090772c700b00889d156616dmr37155221ejc.27.1678626852856;
        Sun, 12 Mar 2023 06:14:12 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id r19-20020a1709067fd300b008eddbd46d7esm2213279ejs.31.2023.03.12.06.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:14:12 -0700 (PDT)
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
Subject: [PATCH 25/28] media: i2c: ov7740: drop of_match_ptr for ID table
Date: Sun, 12 Mar 2023 14:13:15 +0100
Message-Id: <20230312131318.351173-25-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
References: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_131413_539400_A54A0832 
X-CRM114-Status: GOOD (  13.05  )
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

  drivers/media/i2c/ov7740.c:1203:34: error: ‘ov7740_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/i2c/ov7740.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov7740.c b/drivers/media/i2c/ov7740.c
index c9fd9b0bc54a..42121916d25f 100644
--- a/drivers/media/i2c/ov7740.c
+++ b/drivers/media/i2c/ov7740.c
@@ -1210,7 +1210,7 @@ static struct i2c_driver ov7740_i2c_driver = {
 	.driver = {
 		.name = "ov7740",
 		.pm = &ov7740_pm_ops,
-		.of_match_table = of_match_ptr(ov7740_of_match),
+		.of_match_table = ov7740_of_match,
 	},
 	.probe_new = ov7740_probe,
 	.remove   = ov7740_remove,
-- 
2.34.1


