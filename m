Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A31D8CD1290
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 Mar 2024 20:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s2SriLcn9TJO3LgQJx20T2AIgEEtOSgbbLiOwdTXH8A=; b=NWvI2nyLlerfbr2jcvwRjxOlWs
	kJP4eLZmBvcxHOOTpUvzn8xK+opSlpAq7hlp8yhbonRHoDNYsblVrnM7EnRsupOwRYKh4uLHaOAuu
	SCBNoP8f5UDReQzs0dygTEFFL3222BFdpNa2pjjFW7Dzij2tYbVYhaAuhYz30JeL1gzhmEVwZMtQg
	erTx4J/CYaO2Maop+jVbM3x7f3AVMt8amhkBIe58qDPDBXDidewW3trBUfCCVkIf1YGNUkZ/BkRwc
	Uz8L4508oATuU9RqcdVGh6RMtEIvCrEDJgjJMethMLUIntFOguSc5qvhImZWs1CpkoaV0+wEnMrX6
	uTtSgczg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqfYS-00000004C6C-0kYh;
	Sat, 30 Mar 2024 20:43:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqfYC-00000004BsG-2t4R
	for linux-mediatek@bombadil.infradead.org;
	Sat, 30 Mar 2024 20:43:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=s2SriLcn9TJO3LgQJx20T2AIgEEtOSgbbLiOwdTXH8A=; b=OKc0L8t2AB/6lc0EG1LSZZgjTS
	f1Fk6TbApZTlJojMuXE62csTzwf9g9nac8FeAPhStFI33XvwgOCcEMGahhj/QJRQ84S1Y6mBPQYWs
	oZN5VI0jEBI+5b/ykfD5RZvFMzujaoUdyGmIZ8KBv/Bcspml8kW1CW1qA0VDoBS3KyQUra6C+kC87
	mtHJy5w0miFgQJnEkWTqSyUrJ72qsHgZ92wLqJYhnhVNQ/jJ24MG/xUh4Y7Sey+ppv8AERYHZzUIF
	i/TNI+/ca7A3TsMVFp9ZoX48MzVceK6cznbirl84k46nFoChlmusYz6shXxbIpz7p1QMoOHLsfmPd
	eKANOU1g==;
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqfY7-00000002EHD-2RLh
	for linux-mediatek@lists.infradead.org;
	Sat, 30 Mar 2024 20:43:39 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-33ecb04e018so2223656f8f.1
        for <linux-mediatek@lists.infradead.org>; Sat, 30 Mar 2024 13:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711831414; x=1712436214; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s2SriLcn9TJO3LgQJx20T2AIgEEtOSgbbLiOwdTXH8A=;
        b=UNNZov7tjxxLpPO7IroakvskgJt1LvtETNBSNP5fX+l/f4i2yqp7FFE+575/ydgeZA
         AiI5lWZMAldK3eZ9X/dAVBe2MwSXRs8ygLCN4CXOtvS/ugN/8CSl6YFssWzXweinV9W1
         IUvqAjtRtiqwi/ngwcQUXQG7gbLReReLzO/SWy8nFg+zMCtPJ9+vzTtzIcATZGqXFOVD
         5Qgn9F0bBLe4KZiVjHx+lFJ2aRypW2AJlc3XswJCeE1y/y+bjXN9yuSF2WGo2FeU+8U0
         OWZLFuq+wOgEMTnCcK3OaPIxob45/G4b3qpmH+vzZgqbPOguL5B8KUcPxuM5AAH/1aHq
         poIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711831414; x=1712436214;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s2SriLcn9TJO3LgQJx20T2AIgEEtOSgbbLiOwdTXH8A=;
        b=IPabEr8Zr3CwVmPDDbPM/KwXDYLO7ktLe2a1EUkJF4vept8jku71Sl1PjtH8xy9y+7
         6YmU1cbBPnE5vMYRBwoS/FHuqovWm7IOjEiVc7AE1JD6/R7BmfCTrbcTNx/7B6vaomh4
         CgnqhH8OXULgs6LdwnsQs6eDTMmdLMkmcO8cxTSWDpQbFOwV3z6XsJ/xW7VS6lGIUEe0
         doelBhXZQG3rmxbzpcQgK5NsRO5JYyrMqtiieVytBxQyNTMGMd/endh0vQpKHI9eRJLU
         A3Zmov+aaN5GjKOdIkPjbvxer+VE27NPAoSFD5efcAXPBqvU48LX3ugiSbU+VJIvYtAY
         ktAw==
X-Forwarded-Encrypted: i=1; AJvYcCWEPwoZc5Pfo7DEaBb2KECmvSvT41W4+LxrjdhPN2Y35MjZMiT9csrKB30TJCAuZ8H7uHTBTEqt0PZrbSyYSiEtm1ZVmaQxad1clM00V3BlEIeD
X-Gm-Message-State: AOJu0YyC09p2SAiie4RKiwwNsqrmvm/vfvfT4Zqz7pK7JIBR2M0gGfay
	Br9qrqHYG3FmKmQLHaxh7IYQS+1mm90Qh94OrHA9jq/NgBxnJ+bYPrNyTn0SRe0=
X-Google-Smtp-Source: AGHT+IFvLt93H7dQNeEDZguMmmS4FNRGep53208CGmKxPVfo+bNUGLha89NjiS6FAQW3YrbqOBbHaw==
X-Received: by 2002:a5d:6188:0:b0:341:9a78:c008 with SMTP id j8-20020a5d6188000000b003419a78c008mr4014410wru.49.1711831413830;
        Sat, 30 Mar 2024 13:43:33 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id o12-20020a5d4a8c000000b0033e7b05edf3sm7231299wrq.44.2024.03.30.13.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Mar 2024 13:43:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 30 Mar 2024 21:43:15 +0100
Subject: [PATCH 04/11] drm/mediatek: gamma: drop driver owner
 initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240330-b4-module-owner-drm-mediatek-v1-4-fd5c4b8d633e@linaro.org>
References: <20240330-b4-module-owner-drm-mediatek-v1-0-fd5c4b8d633e@linaro.org>
In-Reply-To: <20240330-b4-module-owner-drm-mediatek-v1-0-fd5c4b8d633e@linaro.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=857;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=fEKPyt5MKP0ErlDj1eUkq/Xkd/ayVcNlQIh45H48Y8g=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCHlngBYZ9rPEtMEx31DNrPcnol9e/jXK/FMCZ
 lDKDZ5jf7mJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgh5ZwAKCRDBN2bmhouD
 17gKD/9p5cCATU5vVXAAZCgUsG7dmcij8oCywqqHS3x1Qq0cqPf7gr0Zd/kpFMF1DdMssMO0dYX
 XK7W92I8IUSdDg22IuZWSH8ktqIHU1QzMdorcsI3oiZjH+6qojx5ap/zSkLg10eMaPFhuoCmQBP
 ds8yx6F1mVZKXmONhr5F1u+1P085CKvcOP02uc66hD0CFKL6yXENg87oZBt/dOVdcCBH0fKv7Hz
 InfN+dHnfxDrJYpHtgdeMgmJWcwcACXLkwTGy7TlO9mk5B+kuXdRWKOV9S37FnmU59Lp1Cro/bB
 mb/P6G+cwMdrwhTWf/lZ49Xpz36va0+Ddsc9/g4c1pwgmJtxg6jPyYTR9Oo4uf8MJ5QB1NEBZiX
 Rk2wDpM/nOzZ07aA+EF12Ij3jc+gcE4XWeq2kKkaDWIRZSAxB3hy9lVhSvMlQtAAcXa0KIX7GY7
 n0GxR5pdUlG9W59F7jKWb6epcbyTJFJ0eIORf2OC+UTxQtHmKBFcotReUBCMrKthgTkoymYiJIQ
 hG2DXYW9URO39vmMcIq/VK+wXSLn2i+5qYKEu3KCzSGG6vxU516hb3SLLe7JIQA2/4oAuKCSxmN
 0yIc8n+hOk313lvKKpKcYIVRR7aWzFLKid9WLShyO785eU/AlKBTQE9ptt2jQlK8vKJ+2kmpolU
 HQb4rLJV/rv9dIg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240330_204336_428090_74285C9A 
X-CRM114-Status: GOOD (  10.64  )
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

Core in platform_driver_register() already sets the .owner, so driver
does not need to.  Whatever is set here will be anyway overwritten by
main driver calling platform_driver_register().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index c1bc8b00d938..572f0716a0f1 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -334,7 +334,6 @@ struct platform_driver mtk_disp_gamma_driver = {
 	.remove_new	= mtk_disp_gamma_remove,
 	.driver		= {
 		.name	= "mediatek-disp-gamma",
-		.owner	= THIS_MODULE,
 		.of_match_table = mtk_disp_gamma_driver_dt_match,
 	},
 };

-- 
2.34.1


