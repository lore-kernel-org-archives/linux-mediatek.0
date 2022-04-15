Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 774CDC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Apr 2022 15:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AZP8QEhXCm6NlI5KYEsAYbke4E9MQMXm7oUCcu3dMrQ=; b=19yeTDocjV5kin
	aSIXPtM8kBimWFB8DOjb/b3R+RE75gInSuApirWL/CUddUKhZnbVL6pQN6+KXUzRxBefBrjAT5Y+R
	o8UdVC4jgcjLIpTulnUMi6wel/IVezLGvFo2I99JxM5+ieamWpzpCqL49yG9VoHfgQK63VylJMWgB
	y2MK3aDgfmkx1gStk3v/KQ7r+HOx+1VNF73F72YK+lVHxUq4O9hviJ/MZdwqXr1Q38PpMcGap0rJc
	QCu9tn+0XJuKt0xSAohP94VyoT1/avl02TzbVP/RYP1YAHLrW4tNmXq6heUgE8x0uQbMMhqcoq7Mj
	JHnN6T8uXDiZ+GAw9tuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfNRK-00AQsf-5y; Fri, 15 Apr 2022 15:00:50 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfNR6-00AQnP-2B
 for linux-mediatek@lists.infradead.org; Fri, 15 Apr 2022 15:00:37 +0000
Received: by mail-wm1-x330.google.com with SMTP id r64so5066771wmr.4
 for <linux-mediatek@lists.infradead.org>; Fri, 15 Apr 2022 08:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pOFJlUG0A7QE7n1DqwtNq6lGe7UbdV1x9FZG4NLdjq0=;
 b=C3Rd6fa+TyiCPz2nh952O06n04xSU85OcT8gdCDnJl3vrQtyobdCztxYFW/ki5CrUz
 OPnO01Xm5LnfP+xIwxnZKXDCmfBQbxE1vgVvvQjqLnLgeCg+tCHgHe4ujvygpH8kN18y
 tbghWMAdRlWWMwbX45jLKzDkdQc32hIVagPbvN2H3JhElX7Ojkn1o0GwIhr6A17HTXiX
 5pIsV7KCoIKYBWWE7Tw2cPIbRcaeHoVadIScJoweOTYsprFq8AjD3AUfMzYtYcCFXhV2
 l8Rw/ti9oLq6wiAv7eUIs6042BmH8E5ToM3d3ZvJNcgAieYiaq66ziFxzqMJAHU+NYZS
 rI4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pOFJlUG0A7QE7n1DqwtNq6lGe7UbdV1x9FZG4NLdjq0=;
 b=4Nm+WoJDbmOPwkEYBxwAM5kwopkRvJWxQhW7YLxmZyvZzFV57GU5KOsfxTUbnpC1K+
 eiFEG1t1d7xnQ9j5dRlmeaR7bWJDQx2MGhizZB1ix9aSYo4WDknqa5Z59whwdw1Z/Mh2
 ON9iotAkRLFSF7lAFIGA8TVH1kA0VJJV6BMhzfYP8KemISRn6BEH2ggzR9fSJigDY5QZ
 6Q4z53lJjlBcfMdO0C3DCgyYNKXfQO2au7Y/yDIvtW2BD9/pbV65ZpHDqDYZRRe5pXZP
 WUadrWwcJNJk52FYRrttSbf6bZtd78QvYoa3kYjiKtk6kN5E8miwRBT3c7BHASB3vHKh
 N4cw==
X-Gm-Message-State: AOAM5330UzAtNj+U0V6ipMsctP+hdXZsWvLUXfZAGdcVGQKFoO4Fmp7t
 jo6kEybOG4N6ZLUyuy1V5l+IDg==
X-Google-Smtp-Source: ABdhPJyKsCTiFSBRJqjvHjzUp5YXFv3nqiDeVyn0nKnk7EurInzgFuGGF0dlnJQuQwacVAgmXT0Aag==
X-Received: by 2002:a7b:ce02:0:b0:381:2007:f75c with SMTP id
 m2-20020a7bce02000000b003812007f75cmr3741111wmc.6.1650034833905; 
 Fri, 15 Apr 2022 08:00:33 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id
 n2-20020a5d6b82000000b0020a7e34ef20sm1579664wrx.47.2022.04.15.08.00.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 08:00:33 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>
Cc: Fabien Parent <fparent@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v3 1/4] dt-bindings: arm64: dts: mediatek: Add mt8195-demo
 board
Date: Fri, 15 Apr 2022 17:00:00 +0200
Message-Id: <20220415150003.1793063-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.35.2
In-Reply-To: <20220415150003.1793063-1-fparent@baylibre.com>
References: <20220415150003.1793063-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220415_080036_149184_EA1DE15A 
X-CRM114-Status: UNSURE (   9.70  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add bindings for the MediaTek mt8195-demo board.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
v3: no changes
v2:
 * move compatible next to the MT8195-EVB compatible

 Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index ab0593c77321..024a45300da5 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -133,6 +133,7 @@ properties:
           - const: mediatek,mt8183
       - items:
           - enum:
+              - mediatek,mt8195-demo
               - mediatek,mt8195-evb
           - const: mediatek,mt8195
       - description: Google Burnet (HP Chromebook x360 11MK G3 EE)
-- 
2.35.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
