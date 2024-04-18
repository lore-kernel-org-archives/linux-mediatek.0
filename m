Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90C37C4345F
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Apr 2024 14:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ILqnL0OktQ/LIYsgUIgYWy5kPsb7wTxeiRyz6t2wdXc=; b=lbmz5wOO9MNrSuARjj07jv1d6s
	Cu6nZvFGUNFln+rO4vPnI5hnPLwKhBfuaKZvpzOXALMBA+lndG1c3cucP7sFpaRBLBL7Vjncmta8R
	DKC0vG4po83VUxS5cgoauLHN53ik+/4CB5by4idV0af5WkJwr8WfvnOrrbGUjjkrgQEa6mZrHdMu1
	hx1K+z5RrU+kyPsiEno1Wqo6FVkSwN0DBnSsN7/Q69FgFIBiYubgE8vlB407ka2VwL8A6QBnd6UVe
	pE7XwkqmbO23a5JZKCW6nMd++CiLoIcSbKrVinGNCwZMPxZ8O8jEaBtTHXrL2YY1z0+t6mI2UMaMw
	T5L0F/CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxSaX-00000002Z5U-0RMz;
	Thu, 18 Apr 2024 14:18:09 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxSa1-00000002Ym1-3nxd
	for linux-mediatek@bombadil.infradead.org;
	Thu, 18 Apr 2024 14:17:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=ILqnL0OktQ/LIYsgUIgYWy5kPsb7wTxeiRyz6t2wdXc=; b=tnsBgrC5CRxmj9H9VgNU4VYIJP
	zBSlOyO0jYi+ceW2ISVxI8AQXqQBNSpi6egQBbvTiP1H9dYE0COw40EqI8jy2tK38UEGJjhh7mLya
	9tPIZDj4TFAsABpahZFdsMBgFWio5RBKX0gUYvjD6b3mGfHIfSMW9bs1FIBiyf3PwSwDzFUn2LflE
	SzhBuYv07PuNOyY0bcKXDpAPYNk8mswC4Po6CtE+ZDcgnqmJiHfJOXbxCSOuu8RCg/JBgkA3Tpw7f
	bRnqKNpTV1vsRpxnZn7rugbHWsU8DD6RsfZXabQHwgTgPaEecf9sYf4n2HhW1lxtl/V4cg+mbNMD+
	K8EMuByQ==;
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxSZv-00000005Utq-0toB
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Apr 2024 14:17:36 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-418c0d83e61so9981065e9.3
        for <linux-mediatek@lists.infradead.org>; Thu, 18 Apr 2024 07:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713449843; x=1714054643; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ILqnL0OktQ/LIYsgUIgYWy5kPsb7wTxeiRyz6t2wdXc=;
        b=oRCz9fYJfwQu5CezsYSJA/HSLzKR5USTY1sbA4C1v6/gHAYAEmbCfPJchcLBFJlSbp
         e9w5I1avYtBkOOKE9zvZqyOYsax8IEbq7bgNqa0nL+jE9mTkZQ5FFXB60gJCIsJjcoCd
         Encz96+Ix0gU8LBH/hbyQgw8R2gCSB+ks2FkY2np6PGudT7ZymD+rH/oyf/iDnJkWNEo
         L1wFtgTDFLlv1TUG/l9MUY9QfemY5f9Qicn6DDg6OYJc0/m1ZllKKqv2b9y8HHBgd757
         qembKDWc3WnS1tzKIozidWFLeEqYBK1ITUwxE7McuF8Yfkp0ElbDuLna48Aly30Pimwm
         id1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713449843; x=1714054643;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ILqnL0OktQ/LIYsgUIgYWy5kPsb7wTxeiRyz6t2wdXc=;
        b=i+9gVuc5V92OpaNjMjB4yY5RYwmVcrJTdpavBxy53JYN0y9+RV8zVy+wmMCQrnQAAA
         CJp4gAs9GRRQb4s5OYxG4sj1majXHJXTr+Gu4kHdqRpLfmyY5/amN66YBnUikYOeJ+bf
         8fTKBv1CaaKwxhh8wOmjARIS+Q5jWPmSxu/dBa75ayPc8SyAa8VYPUwlSStJhi6AQ6QL
         X9QdoXo1QtxgwPQNsMIAKgI/LtlHGm7EJweIKzksrsUlYz3CisuA9AziBW1spwcsEwD6
         NWzw93aFTNMZOCOGM+CXAHuhnE5/eI0r+l+tJbEOkbILzpvgKE5z02byeU1GhgXQa1vw
         pikA==
X-Forwarded-Encrypted: i=1; AJvYcCXNFD9rgZMCQQCNOEgZyuK/vjI3+TwCM9uh8E8VjZeedjarePq4YcNqTbs0Cswyi3/okTa7uI+hpmHWCqdfQVV5CAveGN3mNNdicWf2WyIBunf/
X-Gm-Message-State: AOJu0Yw35We1IVsnokCLaelRyqc2mm7qkwmHP7ahTCjGRSJ1m2NrBiZi
	TlRGvuiUwRiM9mxD+0ZriYJdkYXxhCJxh4K/kxZ873uhoowRKmN1o/Gp8v+Cw0g=
X-Google-Smtp-Source: AGHT+IHyKsYwGwO7ULrRiYYwF8ZW2m1ZUJ2Z3L1zSIq/n7fTc7G0u2ITdvLEMVBKLfBuIWSClRaN8w==
X-Received: by 2002:a05:600c:3587:b0:418:f8d3:ba12 with SMTP id p7-20020a05600c358700b00418f8d3ba12mr520839wmq.15.1713449842833;
        Thu, 18 Apr 2024 07:17:22 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id i9-20020a05600c354900b004180c6a26b4sm6267510wmq.1.2024.04.18.07.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 07:17:22 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 18 Apr 2024 16:16:56 +0200
Subject: [PATCH v3 08/17] dt-bindings: display: mediatek: gamma: add
 compatible for MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v3-8-53388f3ed34b@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1035; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=BKhifuqO0sy71Nu4A1KSbxN+I1Z+YvJLs6VRSUaEjAA=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmIStiATNoA7GzsswL1g6KqC0AIwEpZuwbB80csMVY
 gEaBTUWJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZiErYgAKCRArRkmdfjHURRBkEA
 CzoHzDB7d/jXZ68yDDI7WwNkPP1vmd/ZGPXUEBmqiWP8vu6+XmRUK4YlwIjiYpcA3XxgUMLfaT8ZJp
 ag3s8rhIZU/DVNJJMMwGjqdwUyrNrVI+Gv6mZCS71CIaFfDd4qeL+jxOURPhZzEeK+z9ltzMSJbSHJ
 YeKfqPR5ezXo3g0UeVztuVZryzFfIAgc8d6zEKDaCraxvokkqOAmtAFGqDDmmHNGxEkZ4b7OkiICVg
 UpAkyoMi+8uWBDe28vgRid4Aq78DGXXTN1zQfMSrzNbmN++duumQ8WjAU1SvO7YLtWT7h18YP+h6gT
 pdQoYT8KVT9q5sxc8cS6SBTl74cYwbaDc108PlBb5ijKyQMLraCp9Q9vKOY49C4/oYdSATieUfzwMj
 ocgWt1F2nM9d5S+SdOd5PPomDk1NLP2eEHvbnbvpl0zzE1P4oHHgUcOigHc8+Ur38jrON38ebeVALo
 h3HC44zC0tzmrMCGlAvT0ue5k22adRXynT5aaBbO2+Dv1FodPuoKaNyhA1m7b0GEZGlJMGPOtp+nvz
 zhxoctdBZmiH9+jkulsDpepNJRiH6PpixE1y9uGxi1ZmcMKD3k6uQY7HIIfKCsWxFG4KGmeJKiSAuG
 uDuDZgG73dCYhnwzYhSyatIpQ/BZzkXGVm2oC4EV86ZgXoZIz661a7QOCrmw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_151731_320984_16313A78 
X-CRM114-Status: GOOD (  10.00  )
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

Document the display Gamma on MT8365, which is compatible
with that of the MT8183.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
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


