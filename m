Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57AAFC7619A
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Apr 2023 09:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9gvRZGzZ81MG5/Kz7opKkMvHNkqBqpdFUorIdo7o5i0=; b=snDpkmhelMWqi5HwWlUtkFcSfX
	Th9PjgvRh40WzSzFz46dRlLGn03vSLNc6Ogew3zoahYK9CFLhXxvGIBGi8y3087LaiFTYmyLUH/Ba
	J0PurTkem+QpjBvfPmwgZHiYL9B/ggMruZqAjGLF9mR7zCrgGnWVywjeIEyy4LvgUU/qY+UsI2rIg
	8WRhAL8DT6Ieg8y2aGuVLoWd4qk3I+O7qpXNuUznMetsNzy3KN94fYrcWqls/JlNeKE5tRIiZuHJN
	Ov1ZEX3OnWMkHmDPcoioqz1WF1NHi7A77Kr//oxTG5ADx2qz7hRUwXJQ7Z/OqBdaVeMs08VV+NWxK
	R9eWUlmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjzGj-003v79-1b;
	Wed, 05 Apr 2023 09:17:29 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjyBY-003iuw-37
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Apr 2023 08:08:06 +0000
Received: by mail-wm1-x334.google.com with SMTP id n19so20385952wms.0
        for <linux-mediatek@lists.infradead.org>; Wed, 05 Apr 2023 01:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680682070;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9gvRZGzZ81MG5/Kz7opKkMvHNkqBqpdFUorIdo7o5i0=;
        b=Vh+ARxw+XBpCn6Cdbuf7qMigVJ30ZylLNEkKMlcjxc6FxUOMmsEMaBdynDPOffQ6H2
         jkob6hKQ3Beho32h+Qj+YX87SSFxsQSD+Rz1GIb4XqRjYVmf1R/7wQJgIsSVvkLMeC9i
         Rj+QMdbRNLqF41ls64vx4k7996jtfeiNQ+QfCYBG5vXZB0UlThEA/McqoHCu4+nMQAoe
         b6EFIPolerBdQiY3GuG4r4qOpfcpSGyUDTeku16QouVkaP9yLUFahTXiBi2HGU0OszAK
         Ja8tAZhgG2ewKmnDMsHlBKiB+Buwl5Wl14tiXp3tzjo/3pfGZjtc4P6UFwz9jADbIpF3
         3Cbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680682070;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9gvRZGzZ81MG5/Kz7opKkMvHNkqBqpdFUorIdo7o5i0=;
        b=Q/Pb1sz2rFRg+rWy3bf46gdFpJkSF+JNiJzKrUTczPM6EAHCDw+/GZmL6QKLNKT1UE
         1B/U5wBFNo4DjCWHeH0+hbJrjRS44JzB1C/xjuyiLvZk9kndntnreN864JFlPbP+jEKD
         V6pBlqqmDc9BKJJYyhZGYSUCW6y/YfIkuRZi3Gf2T07Y8iLHMkC1EJlUH7L41Csj+gk1
         K8c2SlDkmW3+gFuafLIA5oDiIHuqKOLI2rxTtxAdlxKBtWJ9zG3A/e/3W5iyqB0fq3oN
         WyJhiK7mxcQvoJG1QQwch8xtp603P0GNjMEW8M3x37GfkW8PkKRfPN0IhOarrpTFL3kU
         edsQ==
X-Gm-Message-State: AAQBX9cRqUOTO6ZZMJFL4R/HYhILnlphS7SrFY8AQYxBFGasMDI9bgaP
	VecWxdOudNjjNlrIITxJjal8iA==
X-Google-Smtp-Source: AKy350YeXZxkfcHB5kV2nmFPc7FFrQ/RMUACXkLotNVpPgsteGsIlBZRNxyyl9ufeEdxfpQblczIEQ==
X-Received: by 2002:a05:600c:211a:b0:3ea:f73e:9d8a with SMTP id u26-20020a05600c211a00b003eaf73e9d8amr4072220wml.30.1680682070617;
        Wed, 05 Apr 2023 01:07:50 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id d4-20020a05600c3ac400b003ee8a1bc220sm1378395wms.1.2023.04.05.01.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 01:07:50 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 05 Apr 2023 10:06:44 +0200
Subject: [PATCH v2 02/10] dt-bindings: memory-controllers:
 mediatek,smi-larb: add mt8365
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230207-iommu-support-v2-2-60d5fa00e4e5@baylibre.com>
References: <20230207-iommu-support-v2-0-60d5fa00e4e5@baylibre.com>
In-Reply-To: <20230207-iommu-support-v2-0-60d5fa00e4e5@baylibre.com>
To: Yong Wu <yong.wu@mediatek.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=951; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=dRVBiL9RiPJX/FXqDzKoQWbHskXPf7KJD11X+Bn//b4=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkLSxSiN5AhJ8apXlByy8QrL9ZYngsCHSFSQdKonHj
 FeE4gqSJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZC0sUgAKCRArRkmdfjHURapED/
 429XxnIG2B1brCMTzSLIYyy9lNu+qP8yntLV62vo0uKlgMHDQuO7aWoJQxrew2nnCF68iwsalpu0E2
 zx3AoMJ7WZrFG4h8ixWoaISEJBw+ixclLyTHUDFur7JWSiBw2xkJrs5pkd7tGGSykvXrGacGFb0KQE
 BuFoO3i29xFLxDMZ6zFEKQn7BfLBuwRf5SG815XrmoICAJiOMoB/in7gaQWJZBYHlc6m2Iq5s0pfjS
 HKy2vCeQCy1VRVE5jA2F0Gu3pRwN9LP9DVyqTS6GwNllKUqN6gnR0bf/2P186ND5o6yH00fAgx+TTD
 dDRoTwIuRZES84gUaQwpDpiVH1I7SouNjzMenB+bsLdjAmTSGKTy+T8iHyt68jwbVzXBZOQCBPvugu
 /xw5bt8aTc4efrlapRnf7DNya6GtL2Xne7OKikS15uiYVfrLRP1OwIaRuO3xlO5BnlIcBpz1DNalmC
 CJ/mzM6gz8U9fGIWkeAqjsJfzw7tblLsx18/y5eZZ/0B1dl6d93ThmTE1vQGewShU0Gi2zbZA6xRrB
 38tfFystDk4TgJ3SgvIz229dNMe9H3cY8M8+EboWvaUlhK7w0K/gfQoyfJ0DZ+3ZP4bvFvYiLowVI2
 opx19618vF3shsEn3If/opFEwIXbtvp9rbJfBHy87pzgDYMkqQG3RDKKAuxA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_010805_010233_C34A324E 
X-CRM114-Status: UNSURE (   8.25  )
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

Add binding description for mediatek,mt8365-smi-larb

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 .../devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml     | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
index 5f4ac3609887..aee7f6cf1300 100644
--- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
@@ -34,6 +34,10 @@ properties:
           - const: mediatek,mt7623-smi-larb
           - const: mediatek,mt2701-smi-larb
 
+      - items:
+          - const: mediatek,mt8365-smi-larb
+          - const: mediatek,mt8186-smi-larb
+
   reg:
     maxItems: 1
 

-- 
2.25.1


