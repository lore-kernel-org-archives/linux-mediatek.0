Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF89BC00A8F
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 14:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zXrQ0v5fD2lZpUHoVr89BN0KsiA1JdGijnakOGhbvJo=; b=OnnXSrGrNbnTZUN21uSPPJt3FU
	0tWyq0cTQqP1obXjbOy3/ZJscjEf6CtBExNYlZM4g8O20a6qM+6sr81Cly1zFfSKqqTftqI4MLZ7G
	EyQQ2bDHx/rRNUX6yJ8OaPeR0/F674FQxjBA42/XIZykGiPU/Gq4MrcR1FaHl8o94BJL2Xt2HDY/X
	bF/HyD2dPjQWK6b+qbqceO5qGdpYpmjZ0U4xRi7ED7Of2cp8UIAk4bFESYxjQQRs9XuxaMMMCv1q9
	LpoYD0a/D8ugqOoCzO9F56n3x8GFxnB8T0aae//3mm3xFgP4ogx7IRzfPqpYRGX+PkNMxYSmmYcdg
	5Ky7+9+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quw7R-007a76-1L;
	Mon, 23 Oct 2023 14:41:25 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quw6p-007Zbf-1O
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Oct 2023 14:40:48 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-779d603af2aso75738385a.2
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Oct 2023 07:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698072046; x=1698676846; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zXrQ0v5fD2lZpUHoVr89BN0KsiA1JdGijnakOGhbvJo=;
        b=RJQU3uRJT4qm9jYmsqIz91caHyyq6YsUiiWHV8Zy74ZdwfC4U8kD2G9XHLo0/yjOh3
         Ne+BlorBk4ZktpXRUApxhJkUD0O+TC0vGbg+MSomONMZNjTJ8Voa9Z1RBcrZgGe+68aq
         LB5C5dpwitcKBsq8fctdDVDu0kGADIgds8851G5LOFUp4tOUGgr3qFl94/bumbqw3R+6
         wte7CIl4oUl4VAJeH0Bh11ei6Q1iP3eZcYPWVsvSHhhPDEYvZRO8Fa/gp+3Z9aQJap8M
         pBIR1et/No2SEaRGWEugd4QfzmSOG/lYExYvg6t95M90PfgeqJmTYbo7A6l7EFi4IfuG
         6qeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698072046; x=1698676846;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zXrQ0v5fD2lZpUHoVr89BN0KsiA1JdGijnakOGhbvJo=;
        b=nMl64HP3h+A3z0NykuNZGbiBf+2bqDMam07/cDkHG5b/qJJPq0EW1v2U+mjAwJe8Jf
         cWkmluqqwMtF7xHwxqzFSlpujgV2IFvDViFj5+xGsD8tDZ0Hxz+C5w0oH0+d6pr0N67m
         3FYIJ+nFYvI8D58pwEdnPBlftMFthLebfm7aRr3E06Zz38HiwkR3bBcDdk5qFzcKZ36n
         EO3CcZF7nbnFAjYx8XSW3xpxM9dOXDmxzInaoQ3P27y+tIsoW9pbHcCceG8s8DdfaRYC
         PF0TL7Ma31AY1c26HYBWdJtD86hIRebNd8RJ3QasadrM4MPWvWq5zx3oi26Z2OOPvhEU
         CG/g==
X-Gm-Message-State: AOJu0Ywm9GbPL1c4gZ4EHDYHUx1HZ16oLin7tR74i77JxRPlQ6qYauOF
	vY8HAmigltY5lF1Qbr7TIOwfrQ==
X-Google-Smtp-Source: AGHT+IEkEU6nuvyYg1bDt8UbuCs4r9wvONRIxcXy7le7F3scWSafhsyS4RhIdhies0FoEz8LuDnOPg==
X-Received: by 2002:a05:620a:27cc:b0:778:5736:6573 with SMTP id i12-20020a05620a27cc00b0077857366573mr10157809qkp.31.1698072046662;
        Mon, 23 Oct 2023 07:40:46 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id f1-20020a05620a408100b007789a3499casm2725020qko.115.2023.10.23.07.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 07:40:46 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 23 Oct 2023 16:40:08 +0200
Subject: [PATCH 08/18] dt-bindings: display: mediatek: gamma: add binding
 for MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v1-8-5c860ed5c33b@baylibre.com>
References: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com>
In-Reply-To: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, Xinlei Lee <xinlei.lee@mediatek.com>, 
 CK Hu <ck.hu@mediatek.com>, Thierry Reding <thierry.reding@gmail.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=927; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=hW7CMZcG0C+Hg+3PvnUAIZENabLnRa3N/UE7I5J44y0=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBlNoXPEQMUcJaJNgJr3/lL5DFQPL4QTvWap+9SYsL7
 GBQJdOeJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZTaFzwAKCRArRkmdfjHURZZmD/
 9N3k86URyJUUC2IPzR/C/E06OuIfEdO/WWkaFc6N2660KaCRzYBuOxzm+5WTjHcQH12qnokpsIan4i
 UbvSoS49lwSoAdA2lOMAHUQG2iVnSiLZkIk4DQVuCWR3KKKaiT4axb+gIwNgwudahNgnGjlRGJBSb4
 idDjG/7kpcFUaMobATpLY1cJpvjquWo/J1ItJLvO/I+FX0lbJlysMwJrjWFh5UoEa/JoTrX8jqpAsR
 PVFdrFMFsVckUZ9k40MwwZ6el2829PmGPymCSz9qXhT/9p1LexRpMD6oAO0KlS/wC7kDG3QMYfZIQN
 36jlHWwE4lMDOvMt8LE5Z8Epo2fASlTYIHFnxyaupk4DEl0upHREnx0nHOiO1ap6gH1QIfqRtvIeZ5
 /FO9tZXHFCRFHMvP0I0yBvszwaQFhOdxmzYyJyiDeQYo2j7L8mHDKWse2DLb/DnOgiBAK9BW4g/9Al
 1tRFHGgS5gnGldzq34E/8Fs2IT9IAarAAKISEteu1g8y583FKR6RYttn7ci7aELb3rENNaGqqXtqO6
 3XO7jIXtZ92IzbpuH0Dqyl73qBqBIrwSXDRpsA1RNJnM9XRWYA438HTXoWRULyjPksmURYnOplrAz8
 N1RKi8Sr7TAccueYnMTnO66rtxOgPGthiJUujC/+V1TToV7cGvIyKKZ7c8lw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_074047_480684_F4D072F3 
X-CRM114-Status: UNSURE (   9.18  )
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

Display GAMMA for MT8365 is compatible with another SoC.
Then, add MT8365 binding along with MT8183 SoC.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
index c6641acd75d6..f447f4320e8b 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
@@ -34,6 +34,7 @@ properties:
               - mediatek,mt8188-disp-gamma
               - mediatek,mt8192-disp-gamma
               - mediatek,mt8195-disp-gamma
+              - mediatek,mt8365-disp-gamma
           - const: mediatek,mt8183-disp-gamma
 
   reg:

-- 
2.25.1


