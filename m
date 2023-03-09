Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C38C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 14:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d+yQgUupWPpIlOiQqba9JZgbizsM+tf3A5vNzGQQ6cI=; b=QqL61tALPPQL60420omygvZmtT
	DxA7O1JdzWdOu3N8toHwDxgrf6J7rbXbHzwR6Ev6sJuysBv8IRfNxGack7Z1bmw1u3FiyvUiXZIDG
	IoxeS9kXd459/ocnGreZYhQgkCCHmFk/S9bRxLt8E8fusNNRHVYrLdqz1TB4q2axJghbpzPK1qgN5
	HJIjhn9x9gkUPkUVuFRUflcWWOQGvypqTNsWz/gYEypmT0+9E6Lfl2bzKiKf0XEJ6+ysXP38+hPgh
	HGgHw6/w2IDODHJCM9Q2CMhuz1AR+tshXfE7ev3LB18G2sy9JqiNPjOe7RopINbWNNQBlpS2rjaCM
	TXVnwWzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paHb9-00Afy4-5O; Thu, 09 Mar 2023 14:50:27 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paHWn-00Ae57-Bq
	for linux-mediatek@bombadil.infradead.org; Thu, 09 Mar 2023 14:45:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=d+yQgUupWPpIlOiQqba9JZgbizsM+tf3A5vNzGQQ6cI=; b=RhT84oO9rSdDTBtJm4p2mPZ03n
	DBAeBGHbQoHidEgEqGSYKQ/dphOjQ4PQYNX1Ogi7dDaTZMb4Z49//aN9/+E3748aHyHbzf7gGKbyV
	bJ4YiUTDsZJ8EwWs+iRMJm9V3CMYe/1xNrePm2VKtLdCsoUZRpkM9Gsm0Ywcw9FyaAPzyTCgc7MLl
	Aeapo/W//NEMA/5Y+bt0uDFxtyQxUH36SUNEy4fO3wskQ3y9G3thwJbqrhPAivTSXWPKAqjJ5rSGJ
	vS16kTK4I8S3TAQJUTZop67TUUChkjb+rd1JwNbAoyOIWBL5QMcfYHpZs/9WjjaV7QqKJKQZLRzwf
	oSfCH6OQ==;
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1paHAh-0008UH-2x
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Mar 2023 14:23:13 +0000
Received: by mail-wm1-x32e.google.com with SMTP id c18so1264299wmr.3
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Mar 2023 06:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678371783;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d+yQgUupWPpIlOiQqba9JZgbizsM+tf3A5vNzGQQ6cI=;
        b=mzfJRi3rr3ADiB0HkiogBnHWfujR6PEq0KFeLVkc+Ap41u72IOxKgs/bJddmQG6WsF
         xzSjpYUmWdr5l3Eg3yVDCMvfQjYWgvfrIYAM0s4z7iqr2jBr2qPODb81q8CF8bkwWnSv
         3ris5wjDrmLrcDtBTIY7VkTwbNV+rL4RnlHMgPL/Xc1eXRg0Vq/eKd4Uth4i7tk2AOeK
         f+Pa70sCkDyq2+9+Oppxwhi6jUQt/UqbJRnEAI5ImRvzSmr+ejhcw9luOI7sK4VUpMbp
         /ItQOGkcw4Jiv/3XOwZDcB1hZG9g/0lexQk/mB7GbnxvpA2pbRBd7aDkSNRj/JCBdRxK
         Dccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678371783;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d+yQgUupWPpIlOiQqba9JZgbizsM+tf3A5vNzGQQ6cI=;
        b=LZQJEnEfBCj2L5v8FE2CFL1k2fCY8tF+dQcDhEnyxCRI4sfi07G/yucH5FBkPu5kL/
         kr2Qju37tlxcamYjJuJoZNjSuTsNpdVpqpr9hbxuYR+ryaJvldaEgRkCjWaqhkQdf+ig
         gtYUgq1UTX5fWvk6XDpsuHvS23aXSlhrf9Zeeh3B7JSZnPU3ZdWZi803OkrwN4y8Ga+I
         ad3+CDZYf9pbV9Yyw17Xk+gslyS6m/JNBN8e0xaemU4VgBeaZcnz7UgpI/XV2R33OGu2
         coHxmVvNqCK03p9YD4w56erTzOAp7Ow8nW8UP6YrX0LYBBhFKZcd46WuAtWFO1b21zDr
         9LGQ==
X-Gm-Message-State: AO0yUKUfmIl7vug4wKZq4BjFBqvvaVFNwRZeZS+mXEXPXLWuGT5fU2Kc
	UVWb9zSvxFI5S9jwNRXjxEoq5w==
X-Google-Smtp-Source: AK7set9MEaiRkz2A2iRRrRwUb0ZOdN3nxNICaLPL49D8FlcJGe9+rcOV87KkfjUqCDMibzNpj5DFEA==
X-Received: by 2002:a05:600c:3b9b:b0:3eb:3998:36f1 with SMTP id n27-20020a05600c3b9b00b003eb399836f1mr20191268wms.41.1678371783396;
        Thu, 09 Mar 2023 06:23:03 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id x22-20020a1c7c16000000b003e8dc7a03basm2772434wmc.41.2023.03.09.06.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 06:23:03 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 09 Mar 2023 15:22:55 +0100
Subject: [PATCH 06/21] dt-bindings: display: mediatek: dpi: add power-domains
 property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230220-display-v1-6-45cbc68e188b@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1612; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=8XdhUHkypetWJdIFuKJdeu4W8TGTvxJ+Za8X1maEAM4=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkCeu+DRa9AL2CpzRP2lVUsmPaWmgwYqlEIq/98IQS
 KxW0QIOJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAnrvgAKCRArRkmdfjHURRLFEA
 CVeyHA49RQBUUtLf5rt68aPlBSTSNZkV/4dybTnvo5XD3DTtL6SxXVb8PIRFZ8Z0BMtQ14vow360rZ
 yg2n67jDC8IU4XUGYs6VJJMVmjqPKzJ8bo050n678ZXKt8yoyLCdDUUAt45ejLZ4edK2uZ75PvUMo9
 PxpxL+K9W6sXhoUfiSGCB4MA1afJ8nPpE/aQK0S2SoXwWV2Vi/wU0Om1KZOFh7twso6EWjEn3PYv1b
 Csr4Lpz2u/aZYStBN7UDDB+/TTzRqG2G1eShU28auw16uz3TtHeEMOXaIDUldiaWdXEv7qIqgIUfKQ
 u5gsnp5+vPI5tmOJZAzbFRfy7kOONpq+5GVAb3szqGNZ1zrAuHMXy4REe0HT50itJRpppIIfac6UgE
 mCkqQFHnfZKTev3r4/l0L9NOVzblrsf3yn3b6wG+JpTwNLRe/sm7yUABonPMq4b/4m8kE7EwJRVqlh
 1FKA9j4X6ncZNs+i3Z/OSYaOgZ7zriJXwg4ofFAeE5DG3wTsUXShUE/ZddrlMa6ufbWVrJqaocmQ2F
 6XttS3JG9mRxq5WanmPs9304xVzo09LYXBMhZZu4bfOtm2w8yNex7LRbJ0UCMMYA09xrvhkLjLs2PW
 MhQz21g5o+7F2PdHm2ISbY5tpDhbSWtIEHSOfAji7vKN4VQFTjvDKur01vKQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_142308_591064_29D89839 
X-CRM114-Status: UNSURE (   9.66  )
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

From: Fabien Parent <fparent@baylibre.com>

DPI is part of the display / multimedia block in MediaTek SoCs, and
always have a power-domain (at least in the upstream device-trees).
Add the power-domains property to the binding documentation.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index d976380801e3..56511c4d4b9b 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -59,6 +59,9 @@ properties:
       Output port node. This port should be connected to the input port of an
       attached HDMI, LVDS or DisplayPort encoder chip.
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -73,11 +76,13 @@ examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/power/mt8173-power.h>
 
     dpi0: dpi@1401d000 {
         compatible = "mediatek,mt8173-dpi";
         reg = <0x1401d000 0x1000>;
         interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_LOW>;
+        power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
         clocks = <&mmsys CLK_MM_DPI_PIXEL>,
              <&mmsys CLK_MM_DPI_ENGINE>,
              <&apmixedsys CLK_APMIXED_TVDPLL>;

-- 
b4 0.10.1

