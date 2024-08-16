Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67394C531DC
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Aug 2024 16:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LbHR44bLM4FZ52+TjzVnIlbfMCn5qE1DnTHfiWLJ7c8=; b=fS6QnfhTfX+gN1TlmHbMlsIeaL
	D3wnUbN0BiZx5Lv0OXdwkfdwtDzM0yrktMTjcQXQl/Z7vCEgw+ulIeuezCZpsAWM3S2SHqFVsGKW5
	frwg+y/uO7MGiNVjKyyRbRrhLctN1IbXN9W2JxEo/z/UL9GjTzxKvBWZkJvFT6qglknwqyzYMxoez
	g0EpW7TvLsx6mhXgBiazDwBV8yam4z4KCi9tMtIqZU8hLqJx1hE46HK6F5fC/ZxJmI8WrD5tlvpos
	bfiVe6sU/gR+yP/PUxbl7MX0e8S/67W9bFzxDqgnAImc9phRQqqk6epjHor6uoFbOc4xyT0nPOJK6
	ySXoyOAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sf05h-0000000DccY-2g8W;
	Fri, 16 Aug 2024 16:46:17 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seyvr-0000000DOZO-3cnr
	for linux-mediatek@lists.infradead.org;
	Fri, 16 Aug 2024 15:32:05 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5320d8155b4so2859451e87.3
        for <linux-mediatek@lists.infradead.org>; Fri, 16 Aug 2024 08:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723822322; x=1724427122; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LbHR44bLM4FZ52+TjzVnIlbfMCn5qE1DnTHfiWLJ7c8=;
        b=ofzi6kDHShCKll/hsNHqm+NNc18cgEzl9bjGmBG++flv+GRldSsADrSgtzjU2VNqTo
         opTPr2U+Ky7v67JgyuawGFO/hbAw6c9C5+ITHmYZ+v2jy5/hijv0gtHQUZ+IwUTWtBjn
         NrtPO3mWTcfzwiIdZHmgGu6EOuT4DmJH5ACTIkfZQcIhd7OC43hgzTVKfokHwp4PCSyH
         NNp3ywRsFizbZyjnoSeaB3Nc9zEUa2W6uh5Via3AZmn8/zcJ1nC7qTSdWGzuKqepzs7H
         gWOzD08Nsc34/cHGGJB/0EAHuWoqn3BTkcIodjqy6LZ10CBwP5OfJM3if6Y0kab57mme
         la2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723822322; x=1724427122;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LbHR44bLM4FZ52+TjzVnIlbfMCn5qE1DnTHfiWLJ7c8=;
        b=nZo0lYYVDoSRvCBw4WnrmGI3nSvXOLr0APqZedL3OUehl9hzR1PGDPpkOeN3fW5pnU
         7zYOxBU1pKW3VIE9QJDs2KGCB1crCkxt32/BDs5adPxtJF5Zy1mDxQ8SVcaoLmxCuu0g
         sQvxmU3bZHVXrCpMDogU5z5DwaCnam7Ui/73hNNcMdgfLcmzB9us4uJayVhMcep9GcYV
         ho6U/KAsqKUVxxaF8bHsxmJomb9WQ7/gljE0EjUHTZrPiMwtFwCZbHwkW5Y/p5+qjvh7
         wFxTL7st7rx8wY4jSoDrMz8dV4jNH+kLWRo5DJ/pTp5fU2W2cYOddKdxmu3ve8E8NxGj
         eWRA==
X-Forwarded-Encrypted: i=1; AJvYcCX4dtVbozreLvMPQaIB2UAuN2VqXau9QT4cVLSiUzr+gaUlWHdf/4Obq7IGxIjux3macc9K8F80i1hcUsll2A6HK28K4fukDjx7ngQQfoWZYiLt
X-Gm-Message-State: AOJu0YyEImfni70kglvDd6ztmwElMluig6TicNXVk3dIefut/3OiTVV1
	iwQh6SY3TmTWl3A9pq8CvxujKPWqetKRGICruC4/D8tur3tFbI7A+WSptHk9cPI=
X-Google-Smtp-Source: AGHT+IHxActLiG1YjVcFGYIn8S8tpL7GYn5YjKZvtEnowQwIDKLJw+P78NbSRNVlVr9yhYxdj5YjcA==
X-Received: by 2002:a05:6512:3a8d:b0:533:966:72cb with SMTP id 2adb3069b0e04-5331c6e324bmr2378225e87.48.1723822321846;
        Fri, 16 Aug 2024 08:32:01 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371898497f0sm3853661f8f.39.2024.08.16.08.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 08:32:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 16 Aug 2024 17:31:37 +0200
Subject: [PATCH 05/17] leds: 88pm860x: Simplify with scoped for each OF
 child loop
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240816-cleanup-h-of-node-put-var-v1-5-1d0292802470@linaro.org>
References: <20240816-cleanup-h-of-node-put-var-v1-0-1d0292802470@linaro.org>
In-Reply-To: <20240816-cleanup-h-of-node-put-var-v1-0-1d0292802470@linaro.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Riku Voipio <riku.voipio@iki.fi>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1266;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=OVXsaLaHpAF5uH0owWFBXjKO4nS2BM2WznX7TKsIhSw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmv3DdGtKK9vF/Igsn3otgQXRhwFYgtdI8zMghG
 N6WWewQV0WJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr9w3QAKCRDBN2bmhouD
 19gEEACXTE/Bt5Piq+7QmHZKIKxE1e5XsrbSqm+4ImFiwaVig9kbXgGQLSXRH5UEENiLqiPpXwb
 cGBK827MslxTx5lvc0eqR0xGw5V0SUzmr24svS0ymsfjoLQvv0gpM5IIT8/j9xELhWXIvzDq9Eq
 NxoLtGrjXoWOkh2UU6ivt+4pSlksA3XINGNsi/nJBBe+x05EcF0F/Xhkrp8eaz0B3eYuQ7y/xIM
 ijNujYDLau798JvaH9MxCHeJykRB6NgKBBae8AzwIQamvrRPgKQM+KwzMVvEGCOohOrgibC49Mh
 231FWX5ZK/ciy22x3L13xDzYEAfAtuZLNAPGLovVhPGnAkeTBnJLHrPLa26Ab1+t1O8oYSL5SoB
 +Cu4/Hegu3x+oE4M/EugmWJlSuSXJCIYcPDXv37kaN6dNfUfCI2r6WR6yyOgpb3yGtIMdNrCZiv
 kNFB7MweAhEoln+tKaWZtathfLXF2PMhC6ikSGMWp17TLFwxy3nO5PARn/xkUj2OgHgjGy24ZVb
 OBobeUnbLjcKLj6LZcBbcKRadYhL5H1xYV9W3aGmCX/LIwvQGNrKQ2dNpaVgX+bPie592yDYuJP
 n2mb05+YBpkWuLztzlqcQAWqhRVggciLTuzTJZXz9fe1mGRy3B5l8npgdzp5ZHx7IvTCqjYKS7t
 QMf28Mjz4M4dbnA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_083204_016152_9A796290 
X-CRM114-Status: GOOD (  11.13  )
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

Use scoped for_each_available_child_of_node_scoped() when iterating over
device nodes to make code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/leds/leds-88pm860x.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-88pm860x.c b/drivers/leds/leds-88pm860x.c
index 033ab5fed38a..81238376484b 100644
--- a/drivers/leds/leds-88pm860x.c
+++ b/drivers/leds/leds-88pm860x.c
@@ -115,7 +115,7 @@ static int pm860x_led_set(struct led_classdev *cdev,
 static int pm860x_led_dt_init(struct platform_device *pdev,
 			      struct pm860x_led *data)
 {
-	struct device_node *nproot, *np;
+	struct device_node *nproot;
 	int iset = 0;
 
 	if (!dev_of_node(pdev->dev.parent))
@@ -125,12 +125,11 @@ static int pm860x_led_dt_init(struct platform_device *pdev,
 		dev_err(&pdev->dev, "failed to find leds node\n");
 		return -ENODEV;
 	}
-	for_each_available_child_of_node(nproot, np) {
+	for_each_available_child_of_node_scoped(nproot, np) {
 		if (of_node_name_eq(np, data->name)) {
 			of_property_read_u32(np, "marvell,88pm860x-iset",
 					     &iset);
 			data->iset = PM8606_LED_CURRENT(iset);
-			of_node_put(np);
 			break;
 		}
 	}

-- 
2.43.0


