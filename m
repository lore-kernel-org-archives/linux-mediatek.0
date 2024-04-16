Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F083DC04FF6
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Apr 2024 15:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z1M4kIN59+mv6eajaYWoD0lNhNtoPHTneP5/AIVwZoQ=; b=x5NlMbWNk7I+sc/UCnRtCAffEP
	7RJDv0EEn5gnWlLHR19AhYGf5f8hHXk1ZIKWUkC1u94kq8Fe6lwnP0ClMCD+wWjeneSwGFJK/0Y+X
	aAhgaV71yomzLwrdQP7JI7qwN/94oA+KxcmAgGDotMuwwgTIfxDhQUqHqKiWVXSUm45yzz3Dv+7/J
	JyAtwO5y9LjxYooGj03DbMypo+2p2vG2Ns3c7B5OP6yrV/PNuq5jp6+B0WwEtzQ1essGhyFLWCU6I
	Qs1BFJk8F7W32ftsGdQhNpujYEmCKMgaooKADnSAopKHvL3r3S6iZpaWjjKkorvfkL75w6fnqIWAz
	zhRhAjSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwl7d-0000000CqbQ-2nRA;
	Tue, 16 Apr 2024 15:53:25 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwl7a-0000000CqXb-0V7a
	for linux-mediatek@lists.infradead.org;
	Tue, 16 Apr 2024 15:53:23 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5176f217b7bso7978566e87.0
        for <linux-mediatek@lists.infradead.org>; Tue, 16 Apr 2024 08:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713282799; x=1713887599; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z1M4kIN59+mv6eajaYWoD0lNhNtoPHTneP5/AIVwZoQ=;
        b=fkd/90nIibYa1/L+ms5NNmn+v2M6PnaU9TNO9fzwpOioNes2tvL+5UkgBkKlheoiAI
         K6F2RGEicmQFvF6EFpFkGbVJrAxzlMfnh+v4pAsRwkLdVw4SG/cRr7CUMn53/Db09cPN
         IaGRpD64MWPyfr6SstnPDfIULiOwWYt3nGgPvuDBleltKQCXdoHA/+oflhDM8rkofcRh
         Ff91tJhc7/wQ2aKmIVNGPYONYKgmLXhxt1lVxrZYXQRXXilqZczcx5T+q0XBrLe+IqCP
         du577u9/rD9sKyftDuY0+0gPIdXm7cFJb720sgpVKpPDywpV6jf1GXLkxyF9RvWVWh9k
         sMvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713282799; x=1713887599;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z1M4kIN59+mv6eajaYWoD0lNhNtoPHTneP5/AIVwZoQ=;
        b=ZJqauRldD32XLTOrrfTN1xKwnKHcu+zrAFLcs/AT3lTyEOnwLjXl8EDivb7r2QcgEd
         5SS+ujt2OVhxZnr9M8+SkuYBbHyDu+0jPJulM9+RAaVxR1+ACzx9DJn1nnn1wjaBBMHc
         Oh3rooc/1tkF6ZdUZsYBmsTlzhhRCHq21X6vgzKrU2tIA/ItMbomkigQ0Rvlt9oGZE4c
         UPK5rpiYifmuzMuBdMd46Nw+19WhDdfvGo1a0t9/+nI5HnYtvuJRvF4/c2S6EIen8RNj
         +6CMWRLW9r1AZJrWnu1gGwUfBpmmqq9O2JvquROE6V0t2mQ/ZcipYZsGguS/b8TuOGtN
         Q6pg==
X-Forwarded-Encrypted: i=1; AJvYcCUscxVs5VUJSydvQ9nqcpxwG6wXBS+BacoGJswEmP+xjUezDpJQWcca67cFwxBoiNFWvcuGcMhD43focfn1HcQ5AJ/+SRw5lCNpiaesr4Y94bee
X-Gm-Message-State: AOJu0Yy1P0/jeE4Jqh0DJTs8aJBz+WkUYZmNIdKFwANtzL9iJOwwVJjh
	jHexLoTRktCyDxM2HUXvgysxs4NVPkGEhE7Mvg8G2JMFAlgC+0ZDDXa0pJoTPS0=
X-Google-Smtp-Source: AGHT+IEzE10D/BYr+CmDyfD/2wEwbBBxOcU32cwBPDByi2asllDiUOZfZorsQvYY5XvezHb+mXUDjw==
X-Received: by 2002:a19:5f1e:0:b0:516:a686:8ae1 with SMTP id t30-20020a195f1e000000b00516a6868ae1mr10388006lfb.62.1713282798061;
        Tue, 16 Apr 2024 08:53:18 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id d12-20020a170906174c00b00a52567ca1b6sm4156691eje.94.2024.04.16.08.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 08:53:17 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 16 Apr 2024 17:53:02 +0200
Subject: [PATCH v2 01/18] dt-bindings: display: mediatek: aal: add
 compatible for MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v2-1-33ce8864b227@baylibre.com>
References: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
In-Reply-To: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
 linux-clk@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=902; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=PuIX6SX0I8G+01pSZbmJjjMl6oTG4sglyLhxdm04E/c=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmHp7qYdCXc47+31Eb161yRXhf/4KHnmy4zquR874W
 bGQC8baJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZh6e6gAKCRArRkmdfjHURQsmD/
 0TNKGiTbZAKcXTfwf3hcjZyhz53rpg/4fi9GFBkTMl57KNLyZr6bqX4G9akwSxjwjqvOroVC6VCRmH
 JSGIko1GO6YtuYAJPFDiNToZtHyQTS5kXqrJrC9W0jWhzdWi7+0wsXA4q5VF2IplgT7jXAfBQ1hGRQ
 Rt4H+t2IN8GzjCdc24+a5jyvNWvEfw5Y1I56YQTzFOL4NTfynogckD8b9zoiZp2MI/zGe5dw5kQ5IU
 DUWhIBih94kmZqT4VAzCpmuodlowsuB4qcpL3zVRlXoYXBB9nS9JlS1puTFNUH0CAt7IixG7Y/PEuu
 d9KOF0QMgxPxPYsaes23yVEFuH8ggm1mktrdNBrkPQA80hy2QPeFKQ4gwXRxfnzcTWpvy5VTbcHesL
 9sV8idwkt4CfpY6BvsXZqNA3q4VmUNcW7yHKBh6kK26BaYzX4rstzIO1yWUySp01pDKNjNzXkOv3eV
 aewltgJACeoK7i5BtIoemCRhfFBmDJ66Hx1Ay2DdsMzL4Rtq2/SIfhfI+fOc0WoSDPXuUP+LZUyn8u
 tsY2DVXRVlNzK0519BXDe6Oyvtxlu6lkyYDyJIWkV+6mPOKqp5w+sIkv20xxX/elKMJ2vmk5DAkJYu
 tQnyqcfJkOgfO1DzokYQssFB0xZ2Ynbbso+WGwNjGd1At+H38IrYL2RYlVDQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_085322_331203_363D3697 
X-CRM114-Status: UNSURE (   9.58  )
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

Document the display Adaptive Ambient Light on MT8365, which is compatible
with that of the MT8183.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
index b4c28e96dd55..cf24434854ff 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
@@ -36,6 +36,7 @@ properties:
               - mediatek,mt8188-disp-aal
               - mediatek,mt8192-disp-aal
               - mediatek,mt8195-disp-aal
+              - mediatek,mt8365-disp-aal
           - const: mediatek,mt8183-disp-aal
 
   reg:

-- 
2.25.1


