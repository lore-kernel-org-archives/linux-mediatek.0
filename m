Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13FE2C5321E
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Aug 2024 10:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yaF6QgfmysOfNqqYP+GDxy50eaU5ex1zhyz/GA1ShuE=; b=2bqrffEP6lvbHDAtTFQxXmZ/NL
	CbYd0OxMKkBfknauuianUYRoQIpWcCL7V0y3nukiuDME5e6DIo2A4YEWy7Fs+dnRw76DjgEABASg6
	cnVnfzuZ8eZ5gwJqGmjTazG332MT4gpRP+qTWA3HKnyYfBHz/nUcYx7+cghmeABOVZ7ZYmdaN1mZU
	zmPRhE1hianeFlUj7lMGPE/B34bPRENPRjNa07vG45Glbfvpiet74ytl2OsM/dhL/XEH8d8AXq7TW
	LUB4gF4QS5TLPXPkkoFPsSNncVn+g563KFT7ZciXsgYxNevzAIakyC+YzPD7NFbYU+/JwF2mBbqYz
	LHO2O9WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siWlZ-00000006suN-1fbG;
	Mon, 26 Aug 2024 10:16:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siWdd-00000006qlB-3yqF
	for linux-mediatek@bombadil.infradead.org;
	Mon, 26 Aug 2024 10:07:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=yaF6QgfmysOfNqqYP+GDxy50eaU5ex1zhyz/GA1ShuE=; b=HTKScFL4A9uGmhvG2Oc/+Kp1d6
	fbUmC8cvSZyrRFIQofoacwVC5U57h7Xxs9Bae1Y7aYMMq64AQTjooDY3wJzdOG4nec6ssolfaGQ5r
	I06PQ6MNH5OHRF3KwD2c0U8Wq00uUeVhJJOjqBSA3pFGtjOqrNzonGCN1wzMnqLcRSJ+PuZzVWaDG
	zdB6Imm47O9+PQI0rgQrYmKMhvvGXscqV+oYIiex/vK1Z9gnzI9hdM/S8nWNOI0mD9aQaPfFgEm7T
	iO1Qimk+d+vpVNm7W816s2Hc5Q8Lqb6wtyxNNlBzbFPNFjbtaPqkUYKxKmYVeyeUgSjylwbL/EKQ8
	swywNfDg==;
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siWdZ-0000000AdBu-3HY5
	for linux-mediatek@lists.infradead.org;
	Mon, 26 Aug 2024 10:07:52 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-42802ddfaa6so4597135e9.1
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Aug 2024 03:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724666867; x=1725271667; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yaF6QgfmysOfNqqYP+GDxy50eaU5ex1zhyz/GA1ShuE=;
        b=AA7GOgAx4ZOTMbZbQ/HqHr4N2RvSJt4A68+rDCnQjaaNvyAIvVQiEQs5e6Akib8UOp
         KFtNEr7IBpoaUV2gZmMVoMGnGaNDCYcoFoSMGGczsMvlfNxT3yQxFnS7aJg23GPJyYwI
         2H4b+obMi6z9vp6GVdWtZFE9BVY79VqzHA+LVfBaPVXAEivDbCVnRGhipdZl/J/n8ol5
         r+uvUJj/X/A5q8Q36qfTPiYuIy1cT3ydAP6JQDKBU+sdFZrRlFcnNfd//NL0rCjdWQT/
         4Ul3BhvOWMbZFsVZmuQcuUk140VAYRunUkzThWCVHSPCss1M+KspLHAdS1FCRJeRnpy1
         zg2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724666867; x=1725271667;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yaF6QgfmysOfNqqYP+GDxy50eaU5ex1zhyz/GA1ShuE=;
        b=oH2ZzQe8GnM+P0NNkkX/Q+ACks0xsRc5hL4Wt/vGP8GQwmC21X8CBWryNFhzmcPhUt
         52Ci+39DOQlmhyXJxbGW31oVhOn1QXfZdnKkVlNZaNxfRQdpu7VvpfCd7LiSUfvBmzaS
         Th9oBD32xq3m1zsAd/3ZuoFSQqbpQCKlIOlOjpeHIvB3JCfOVejREI2suEM99AWq3qS/
         Ps6Gq+h6wF/E+Sw+/kthEu1PNZsdh5O8KCxJG9eUUJRq/QZjqyVLqXYtWlga4hlW0gdc
         ilcfDoIZ2CmW3cYWN9EGzUwW14jmf7pR1iwI2k/Htn6HqwksULk7B6U58+ElVnwgrRnF
         YlfA==
X-Forwarded-Encrypted: i=1; AJvYcCVE2iklCTCzGx0/SHKKyt49Z5/FrgdNhqWZfAk2mTAf3B7d3NXS27C26yhlEsEQ1kEPiyu+FiR2loQrpvsaIA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxo8KfaW1Z8unNgyzYE0WyjS7t8Acs7AhDHB5qnM7z9iJ3RHR1X
	S1ZoZ3GhMffq2qdK9OO6YuIF42eQG16GUwzc+4/RL4vkvCN/hEdYHFu5Rtb359o=
X-Google-Smtp-Source: AGHT+IGDefyzo8TsCXur56zPbKTgs1i3KNs13szZdv7eh34y9pnC9KoDGsSP7j4E6LCU4dV5ibI1VQ==
X-Received: by 2002:a5d:5f8b:0:b0:36d:1d66:554f with SMTP id ffacd0b85a97d-3731185d6camr3670405f8f.3.1724666867264;
        Mon, 26 Aug 2024 03:07:47 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37308110009sm10324821f8f.18.2024.08.26.03.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 03:07:46 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 26 Aug 2024 12:07:26 +0200
Subject: [PATCH 10/11] phy: ti: j721e-wiz: Drop OF node reference earlier
 for simpler code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240826-phy-of-node-scope-v1-10-5b4d82582644@linaro.org>
References: <20240826-phy-of-node-scope-v1-0-5b4d82582644@linaro.org>
In-Reply-To: <20240826-phy-of-node-scope-v1-0-5b4d82582644@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1418;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=CGi3eChPu6bG3w6Fr69D9qqrpc9tkyPX1aqBhqlWnMU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmzFPhm3oloo7An+9It60VuGZ15r9nzj27gw1sL
 o+oziWrijOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZsxT4QAKCRDBN2bmhouD
 118PEACOxoXjL+n59/jWzY3jIoc47J0kYcJAz7/l0WpzV8SwV//9ZGWaY3j9nMj4+KlF8m83BYR
 /d0i3XgYzbe4JM5lTAyPt+JpgZOHFe1xBngHAbYEmqxkzIxdbbt0HTUf3yoQO3Gl83y3hJReJus
 1Zf4et4qDhqK1TALW+ssqeI7HQ1NmEz+kXDHs5vg5Zh6Ckap3OgX0pBBIcmOd/Vk4UJZtW8V07P
 eAMZRFjmHfZMERh+ZLLdSuC+zmhMRSjPkgmYYLKUqeBlJxrPXnBXmuc6NmogmtSB3FBEo6tKYre
 9MnI03e22jWdETGojV2nKsIza98/EJY46aJO6bw7tLLdpoYbf1Plnau+Q/gKqu0r+hUFoJZCNPG
 vjHlwymMO+fGbK3/eb6MZdYm83S+4LJWrw4Q7HUJ3vUpCqXaJorZ90sezTGLBjj27xDN3ZTCYIv
 nXPxjRph97i0JkBpObEXsprCqFtyzJ08U+aivTVc+yLbCRHYaJDn7ADj02vRe0IDLPhz4hOs3A8
 007ysTXKxr6urRswGzhWU/Rvrqil0rbl1Ncc6MxpSKVj35tgMfXfAZScXYcJTHeieRxgTSoRT38
 lckyAklBZe8SbXTt5GKDUC3KrYjlik33r9bTXo7ft514cU5IUKBz1dnKj+daq2MbTTasQ4cR692
 Tkb6i7/a0aURvFA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_110750_134009_A4CDC800 
X-CRM114-Status: GOOD (  10.76  )
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

Drop OF node reference immediately after using it in
syscon_node_to_regmap(), which is both simpler and typical/expected
code pattern.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/phy/ti/phy-j721e-wiz.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/ti/phy-j721e-wiz.c b/drivers/phy/ti/phy-j721e-wiz.c
index bb16fdfe63df..d0f3ead3fc80 100644
--- a/drivers/phy/ti/phy-j721e-wiz.c
+++ b/drivers/phy/ti/phy-j721e-wiz.c
@@ -1179,14 +1179,13 @@ static int wiz_clock_probe(struct wiz *wiz, struct device_node *node)
 
 		ret = wiz_mux_of_clk_register(wiz, clk_node, wiz->mux_sel_field[i],
 					      clk_mux_sel[i].table);
+		of_node_put(clk_node);
 		if (ret) {
 			dev_err_probe(dev, ret, "Failed to register %s clock\n",
 				      node_name);
-			of_node_put(clk_node);
 			goto err;
 		}
 
-		of_node_put(clk_node);
 	}
 
 	for (i = 0; i < wiz->clk_div_sel_num; i++) {
@@ -1199,14 +1198,12 @@ static int wiz_clock_probe(struct wiz *wiz, struct device_node *node)
 
 		ret = wiz_div_clk_register(wiz, clk_node, wiz->div_sel_field[i],
 					   clk_div_sel[i].table);
+		of_node_put(clk_node);
 		if (ret) {
 			dev_err_probe(dev, ret, "Failed to register %s clock\n",
 				      node_name);
-			of_node_put(clk_node);
 			goto err;
 		}
-
-		of_node_put(clk_node);
 	}
 
 	return 0;

-- 
2.43.0


