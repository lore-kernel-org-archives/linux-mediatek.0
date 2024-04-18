Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D837C04FF8
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Apr 2024 15:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dyegayfB1y9965dzTGr/j6svW4ieRpTfgrhf50HfpFk=; b=Kwj8bmht5+TcefGoLtI5r6h0QJ
	/ZmpvaZG9LR+oZpVYi7sitqqgfClJybtEiOAxgsxCsu0k+WnGqlONyCYIkQQL91SF/jsMxp6EWrmi
	LIbRbHROsqMFCnvrM5tlQ66QsxzQTT3O1Jv5IvZHdYRk4IKjN0NqEV/1Wi+19AKDFrD1itVkKwCZf
	/8slAgi+X07+iQ+/Qiei3tldP5chIxAjrnntAnBgGMvK6qNnTD05xfjYAzgs3vO+8KEF/XNMKltS5
	7lAs45NiKRajOKQwJ8G0h5BdYVnnFOTjJIjN1zvY9PZpPDiMXt6PRlC+/sFRfGjtY/AI+TejqpurH
	u0M/kQBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxTjP-00000002nbJ-05Rj;
	Thu, 18 Apr 2024 15:31:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxSZr-00000002Ye5-2kiR
	for linux-mediatek@bombadil.infradead.org;
	Thu, 18 Apr 2024 14:17:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=dyegayfB1y9965dzTGr/j6svW4ieRpTfgrhf50HfpFk=; b=EZyAWZuMzcQu6/UxqQA6JKFxW7
	HSeWpUzkHIQROI6xrgTfnhavwvuQu0GXfQg8SltW0PHm9mX0iyk8G/HfwxA4OAbaJ9BcyFGokESfZ
	ai2PJjQ3pe8ZQT4UCN+mNFvmSB/8DVJF67fFpmgBLzEbHZU46I7ch5ywZMiGns6QszWABDDtNDySF
	YG+htx/ZZAeJWWW/tKgol/x5Cm23prkpiBRZbyALlo1+1FZMo84BE0UXoj+SvmlRutosTp4b6MSrC
	if6F2xKO182Uz0kq8QsXU+jyeXFRIEWqeKLs8o7+6FtlgP5LvxWRhyPwowFnrpDM0dYG7MaBGetGO
	RJd2o9Hw==;
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxSZj-0000000C24k-1CQx
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Apr 2024 14:17:26 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4155819f710so7797805e9.2
        for <linux-mediatek@lists.infradead.org>; Thu, 18 Apr 2024 07:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713449834; x=1714054634; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dyegayfB1y9965dzTGr/j6svW4ieRpTfgrhf50HfpFk=;
        b=mqvWxErpLQd2QX8I5V5rn2g28cWkhCxq9wrNT3SBN4Icihr0vbD8XvUZtwC280oWIt
         27eIcA/5hl+5n8dnOyM2q2RYrn8I6ETybeA4feH0Tbw2ORUFV7IydDKUCUXLbyasTVpC
         f4AmUuSNAta6VVaxFULRqir+8Q5qP2fK/YpfXimzd3wJqXIEuMg7DDchzYMFMaPVqLky
         yDw8NqiLR99XaQpEZnFZ2xL0GY+Mdnx+WyDwJ5qOV3xpvyWPBUMLmxaBCTfLcEi3mMW4
         KKlKAUkzsC+pdiHRh84VGbRhG1nzdlq6vzwJsI5+PqURhNN9fHEcZlGbGSdLDzdzadGN
         fOJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713449834; x=1714054634;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dyegayfB1y9965dzTGr/j6svW4ieRpTfgrhf50HfpFk=;
        b=Nmw2eIYSqudUYYdCMumoJVvbW37vmtfq2KI8lcDMhYLxroJ8XiCCO5Nzm9iTWeM8Kz
         rIJqkxKFrStPybIRwkV02l5DZwAWRPKBuXLingG2fK4/AACHf1Bt9tacRHunUGHh2jOk
         Hav3CETzfETkOeZoMVCC2lUiq2XLYLT+eGZTwmAFvvgRIg4tj77eimyUCNUntPmDjaMG
         OEsmX3lFMdWSp06PgbWHAr6AqeKcueCGNPiHOHBAbFjJjS13NHR7Esbd76hwWYhVn7LH
         lh1Q3HpS02p3QGY4dZnKZdUqTunH4oAwwZbn7t0a0Xq5pfYjjzyqHIKn8AWudanCcV3G
         ULLw==
X-Forwarded-Encrypted: i=1; AJvYcCU3ZlkImlfV/0y4+XpxnUl7Ivi8gk8ra/rfk15AvL5qXzE4J0UqyhZEUqO82KuVzLqADOboCJuFduIKIR67CU7QCH0ZGAge7mXYKoQ8NAfVTH03
X-Gm-Message-State: AOJu0Yxkzmx5fYtd7hWNVWJSv7rlrXQ2bh81p85f3K9a0f5tiMoJIb6T
	SLz4QpOXs4ZDL4/8a+Gfdtkzi6fH/S/tReplfsbRGHNi6sc0z2VtRZ1M5LqpkGQ=
X-Google-Smtp-Source: AGHT+IEsM9iGSZG6iMHAcf9KGu692TY/H0uIe2sVr5xtzSaWVovohbIcJe5VQO0JAYzGjB4DDgOfag==
X-Received: by 2002:a05:600c:a12:b0:415:46be:622f with SMTP id z18-20020a05600c0a1200b0041546be622fmr2167234wmp.14.1713449833987;
        Thu, 18 Apr 2024 07:17:13 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id i9-20020a05600c354900b004180c6a26b4sm6267510wmq.1.2024.04.18.07.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 07:17:13 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 18 Apr 2024 16:16:51 +0200
Subject: [PATCH v3 03/17] dt-bindings: display: mediatek: color: add
 compatible for MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v3-3-53388f3ed34b@baylibre.com>
References: <20231023-display-support-v3-0-53388f3ed34b@baylibre.com>
In-Reply-To: <20231023-display-support-v3-0-53388f3ed34b@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Fabien Parent <fparent@baylibre.com>, 
 Markus Schneider-Pargmann <msp@baylibre.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
 linux-clk@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1050; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=YXHTuzshsIEn0rNsq24IlHvsgB1HSvJsHYliNaoUyEM=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmIStiBs53eAY3DeO13tdL6QI+Znbz5FwIwD/YoB8q
 OCNZARyJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZiErYgAKCRArRkmdfjHURTRxD/
 4gQQKtDeVST7qS57VlXtgagtFc35imlFj4VzD0seKTLL22adDD+Ip+d+eb0gMs01I7sN8dXFEh5bvg
 YHauScLtPi02KVPxokKXYmQlf2Hnia3Ac4U2CIqQn9qx7ESmnekahSlsMSi/ZDGNJe2E3jC0Nouumr
 2GoLrM+cEvvITmIQGxQ0qBYTBFfozVIOnREKwm6q5u1hFe4qm93B8LmboqwV7vnhREXHIpV6jbrNM7
 fBILeMgLC9B2iVowiB85EkDYAFkSVRDwLIlPrxWyV4vzmBJiMqKrUxxiZBucBBnDwuEMCCEk45jicD
 gpt8ZNl2Su+SQ0eZ0II7t2SQAwq/QU3gqqk9bQ0QgIGTZhXXHPd77oOQN79mBqp+Bv1g9kmE0njfQ2
 PnxBPb54W6L3g8wPEKq2rpY5FXHfmX8jG6aegE+zbORBnFCapLwB//4rRsRwgT2mOsuIQHZPmYjdfT
 9PIwunu5UQr3olFVkGjxPcUpa39bUs5PQzRDsAK3Q0eqixnGSaPsfYJUPUiCx2JjN+TLjVdhT7nIHh
 6z83C+zeIX6GFmoqhiGvaA9OtHzgux+kntZFd+kage5z3q2BASkPXoQlxIJpeuNJoMVsgU4k6FmBRY
 j9+0Orj4mpUdqNvzLk5YXv6L+BccO9fYqL9Hc979dnUF2953s1vxf74BTmKw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_151719_829146_97F57711 
X-CRM114-Status: UNSURE (   9.28  )
X-CRM114-Notice: Please train this message.
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

Document the display Color on MT8365, which is compatible
with that of the MT8173.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
index b886ca0d89ea..7df786bbad20 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
@@ -40,6 +40,7 @@ properties:
               - mediatek,mt8188-disp-color
               - mediatek,mt8192-disp-color
               - mediatek,mt8195-disp-color
+              - mediatek,mt8365-disp-color
           - const: mediatek,mt8173-disp-color
   reg:
     maxItems: 1

-- 
2.25.1


