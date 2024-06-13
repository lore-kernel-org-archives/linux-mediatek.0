Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97EA1C27C4F
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 13:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wd6mMNX2S1BvaXmQq6C+uLeNiInNteHl0yr+fj9gdKI=; b=gx/3Wi5RU1rVQODqWJqHfi+l8v
	qHxOTXC1CtAnU/TVDjTT9HM9CsjSD/+vv1saG4jWu9uu55BbqZ65tudXYf3YQX9m7bInV7B+65TeO
	4XmaEWFzJIJvBA8sntisdEfrDKeify5SMRp0rANMaU8I3bNZKtuLjLe2ROBRDKWv8Bu4qFQnRVSnf
	q/CGa1HEQJkgg29T/YUPRF7OBI2xqXs5+94nloekr6jc7SQ4S73RPT3BzIX1yEUDlFy10j1q6lSxf
	YG/yH+is/Q8gEm7Z/abKiq0JYPynq92fQhmMIq/HbSt/4rMe0MkreJdzlAnxqbvlGdN6d775Ca1WI
	mBQTU8xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHkfC-0000000GlaW-1bCE;
	Thu, 13 Jun 2024 13:38:50 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHkf8-0000000GlYQ-2HJ2
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jun 2024 13:38:47 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-42165f6645fso9229355e9.2
        for <linux-mediatek@lists.infradead.org>; Thu, 13 Jun 2024 06:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718285924; x=1718890724; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wd6mMNX2S1BvaXmQq6C+uLeNiInNteHl0yr+fj9gdKI=;
        b=JbNbOOhS7/rIj/W00AqHVmGfQTPMnyan8TlLQr0TUH59g6ZRxLnacFF5V8QW6GcvTO
         RX4ABBoEsEZpd82Egc+jU9Q93Ck356yVr2KiFOMPbn432WhTSHixwV5NpDYXkFCvupOJ
         E3PjEqPXF5s4oiRMYx/nivUT7LEeaA7scyfDDwivxh9rGoDAp910nJWBam7V4tGwMkGA
         qk6onJe2IqYQTsGA9KYPQOU4pdeKpnBvWKX/l1nRrk9xhcmEbiYkcUWBXUkQ6J/eeajg
         MP3rT89EbF41ChK3HAjiNMnDNHgYcRio4Qfgen2lHC2alpZoO9Bu9UQhdSUJDx7ZAUtF
         nHjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718285924; x=1718890724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wd6mMNX2S1BvaXmQq6C+uLeNiInNteHl0yr+fj9gdKI=;
        b=NK2a6UR7JfexJRyNj4G/yukrrtxwJ1QmY56mctCd/6fg0M8dnT2R3VmFuJqpWhoEDx
         AKA7ht7jiA2ip04WFDGHCVTjhHyHHoPgaRc11Vh+UCPHDHIbXVZVbIYt8LoPegaNVje9
         f7dQYgj8SeD2Z9DmAHgtBsyAbKMtXKUZSXIeFKvFRQ1lDoS0LlOE+5T5m+hsogYK60Yb
         yefsM2aU/Ecxui2DH15lKdqly0y/ql2yjj839vTe3f8sQMH8uJd6Fxh+Xhw9eDMxM6eO
         y0nn53gi54dvWGVsuThdrBtT9GMHSPspxrpjcs92vPZNOUi5SW+HEf8fFsx1VZydxJ7w
         h6mg==
X-Forwarded-Encrypted: i=1; AJvYcCWjTO0kdmGoe4up12/MfcrHrXt5WPDKKI8vjD8nmTwPl9xGKxsCCjoeG/aZ+SocSVWDLRVXBF+E8WSMulMpWlmBh2nyNRklRgdezIO7SC7FPwdf
X-Gm-Message-State: AOJu0YzaCZynK8EPWXl4QN/fMsOwn1mgxnFrW73j2p9umRArxidc+1yl
	HTncuMDTMesIOfz78QLNWr9pwy4Q/KLXWb2LRbQJgPer2U0WbTf5InEgIKlJJkU=
X-Google-Smtp-Source: AGHT+IFUqr5sGQRcNAQ13+nGKzOjcicanr5LrzrR9lynEZ7s4rDVAOtSSSoEI8XHdMfKIq2OgA/eDA==
X-Received: by 2002:a05:600c:190a:b0:422:fa63:33f0 with SMTP id 5b1f17b1804b1-422fa63360amr11707035e9.38.1718285924382;
        Thu, 13 Jun 2024 06:38:44 -0700 (PDT)
Received: from krzk-bin.monzoon.net (46-253-189-43.dynamic.monzoon.net. [46.253.189.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42286eef9eesm63435725e9.9.2024.06.13.06.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 06:38:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] MAINTAINERS: ARM: airoha: add entry to cover Airoha SoC
Date: Thu, 13 Jun 2024 15:38:23 +0200
Message-ID: <20240613133840.6949-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_063846_609958_6AFD359D 
X-CRM114-Status: UNSURE (   9.04  )
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

Airoha SoC is not covered by any maintainer entry so relevant patches
can be missed.  It seems Mediatek SoC maintainers were covering some
parts of Airoha and Airoha itself is subsidiary of Mediatek, so assign
the Airoha maintenance to Matthias and AngeloGioacchino.

Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fb32a2fe3a79..e7fd595b8f5e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1924,6 +1924,15 @@ F:	include/dt-bindings/reset/actions,*
 F:	include/linux/soc/actions/
 N:	owl
 
+ARM/AIROHA SOC SUPPORT
+M:	Matthias Brugger <matthias.bgg@gmail.com>
+M:	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
+S:	Odd Fixes
+F:	arch/arm/boot/dts/airoha/
+F:	arch/arm64/boot/dts/airoha/
+
 ARM/Allwinner SoC Clock Support
 M:	Emilio López <emilio@elopez.com.ar>
 S:	Maintained
-- 
2.43.0


