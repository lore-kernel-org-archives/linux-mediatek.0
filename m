Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE6DBC61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 14:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bQBBpVaIgUK0Rl4J+27gzzqfLCx1MN+pd5yYkTAPDPo=; b=4hY5YPCW+jAJWby7NTeg/XzSAA
	Sg7umKYcHYnCoJDuNctpFpSaCmN0CQZAL45C3Qi72Woeqk/m82Fm+Nta6j44mhIvt75DYr8sfng2/
	0lVcYLpzkll93rDuMMOLQ6NozIt/IwPKAmHltGRGIYgh9PyNTz9fU+zJohHuOmPn07cpKfKjF/PG9
	ZW5ato662HGGib6Nujgj8rYf0p76AreN35nlsFulyPZeKZwUAiJ762Qf6SS9ENaUquHBa7lSq7p1b
	srsw2LrFy6B3JOUktBsUvo4H2x+Yrtr7+XM9TIrU/NImnby4aVTJbqdjp7rpiGeYiVqk7tpLBaUnr
	BDo+gPwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paHHH-00AX8O-PV; Thu, 09 Mar 2023 14:29:55 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paHAh-00ATmV-3Y
	for linux-mediatek@lists.infradead.org; Thu, 09 Mar 2023 14:23:09 +0000
Received: by mail-wm1-x335.google.com with SMTP id c18so1264393wmr.3
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Mar 2023 06:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678371786;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bQBBpVaIgUK0Rl4J+27gzzqfLCx1MN+pd5yYkTAPDPo=;
        b=tirdIG97NJ0q5V9ezLWBKrLIKboiWYAsMS+T2HNJptRoI15qhbvpI3/QBO8xlfgnhM
         M1SiL8X88XxFgmAjmarPZZdBx+hWesIKhRM9l5eHtalvvsNi1NaDVL0QSWMc/sz9ITxN
         fGl8OLsBXG1xEhTYzafczph/2f866nUXbX+IM9NWfGdjagS2UeNguwE96wvfp/Va1MMr
         9BrGln7ScLojmHb9iaWxSKxxI0gFYp2V1vxF32wQQ1OiTIAVpk9VgmpG7qqCfwny4ek5
         Y8biNMhkpP735SiSIl+8G1O76CKDogLEMMxPBpyh5G65aToywz3ZuuwK2+oY/EYBnHe5
         R0Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678371786;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bQBBpVaIgUK0Rl4J+27gzzqfLCx1MN+pd5yYkTAPDPo=;
        b=4Qv+LeshRURdxExKZ63z/J8I1N+ulG96NSeoqoVADGf/PaLBw15lhNPmUJZjUrfd4o
         nk33rTmGnUzmpNKqvPKwCPpOzjBSL+9BJoKkCNk5w3EEquEe43Uc4YWU2SrECzK+m2/Z
         GJGAluEXwDXFXnBuaO0GTlJnxvzkdhfjOsnoUChxZ+5iw9001zvz8iqSTdLvNVZNwaPp
         PhiZLs/zHL3fma6dSNjIwLhpiJkqEjN5OsBUX89gdPppHTut82ZOVRNZid0YpZxPV5l4
         TUsvuHqh+H/OjLqZ4Wu0T3g8pe2QuRzDRzR/9VYiJ5WqJ3SdVLL768nldn9alif0v7+a
         /LSw==
X-Gm-Message-State: AO0yUKWd15uzeMs1YxsZ1oTP8GXLW19dR/KXB9F+yUg5Z0/p1ArPqeRM
	xFWncBUpRrlQy75lNgNfsLSqUg==
X-Google-Smtp-Source: AK7set/Zn5fKLXmXdaKz4vQTYomyjS35f5C+OYc/Sfrm9FP4uqi4MCSseAditkhKpIAn90H5J/vqGg==
X-Received: by 2002:a05:600c:1c9e:b0:3ea:f883:180 with SMTP id k30-20020a05600c1c9e00b003eaf8830180mr19624210wms.7.1678371785809;
        Thu, 09 Mar 2023 06:23:05 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id x22-20020a1c7c16000000b003e8dc7a03basm2772434wmc.41.2023.03.09.06.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 06:23:05 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 09 Mar 2023 15:22:57 +0100
Subject: [PATCH 08/21] dt-bindings: display: mediatek: gamma: add binding for MT8365
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230220-display-v1-8-45cbc68e188b@baylibre.com>
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
In-Reply-To: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
To: Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>,
 Thierry Reding <thierry.reding@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, Uwe Kleine-König <u.kleine-koenig@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Xinlei Lee <xinlei.lee@mediatek.com>
Cc: Guillaume La Roque <glaroque@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Alexandre Mergnat <amergnat@baylibre.com>, dri-devel@lists.freedesktop.org, Fabien Parent <fparent@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=930; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=5HYYOhtuGUlOpyHwZ7LVltjoUezJ19v4l/4h/6CSVGo=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkCeu+VhKJ9LQzHj9VxhsKxYsiydf/VF/RzLpd9doS
 p/S1TfeJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAnrvgAKCRArRkmdfjHURV68EA
 CrpSeTubBhwYkMws/m8sMKVEppmg0ezRxgHhFia1QKuf/Qb/X6+dGncxyjlZNfGS0ar826v6ItsCP7
 F942GR0ouavp2NDUZ4ZBvTzuC9v/RYUivU6ijr54JQSDNpIZt3Z/1RIf2TnwC7cHCuU3rhdIP5+/Uh
 G5UitSz+osQKq5KHqb+uaYDmqAfhJtaE5KSDuS5IzTZXdk8HDyXMEhcHnLQTZqSkFgXsfAb6P63wD/
 a+7e69DuUGhyFTlEwcLzeTGxsRs5e3atv9hIj2IkjZI742Gs7iC+OkCXNVMzMhnxaJHDTfCU+OVb5s
 yjY0Zj+zfs//wU4uHKb7aZTpeazWvPdKFNt1SXoVaOexx8St+YVfnhn5btj1PuBKhqwzyHFYctXuau
 IG7/AD7kq7EpmLnNZ8PTW+xGoFKWt9cV33JNTLBr92E6EBpiKE5ZCouTYJMRi3QL0+mBNJMZlvHA8f
 6l86QRox+1zuXWohcQYFt8NFfXIql5tV4AEGlCC0FUndzCtn+QkSShypWYRHCWePclo2R14EoBCajf
 7q6J/xdUo+1xqqMBxOQGV7y8OBSRpHeRxvVcd2emG0x6cb43LKA8snoWHvXhJSVpemAWojP+twvzzs
 qEmb9BQUClARJ4ftqmFUB0T9vgoDIxmyvrsxFZnjE+/4FvWifJndDTgwq47Q==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_062307_279882_5F26364B 
X-CRM114-Status: UNSURE (   8.80  )
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
index a89ea0ea7542..f54859cfc97b 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
@@ -30,6 +30,7 @@ properties:
               - mediatek,mt8186-disp-gamma
               - mediatek,mt8192-disp-gamma
               - mediatek,mt8195-disp-gamma
+              - mediatek,mt8365-disp-gamma
           - const: mediatek,mt8183-disp-gamma
 
   reg:

-- 
b4 0.10.1

