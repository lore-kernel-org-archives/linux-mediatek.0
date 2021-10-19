Return-Path: <SRS0=SpBb=PH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 630A0C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Oct 2021 09:37:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F3BA608FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Oct 2021 09:37:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2F3BA608FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+wuxk7HnkqbeLKOHtSUhl3LKrLrZhlmZlshFFk69aDU=; b=ITJSpx1Brx152l
	q4IwyCYTFzq+NDjPdmRMTk4yniAXBlHWm/K53zGvhDtp3MLnv1pvOuroVOgSwW+onOY9u59uk0lQ1
	SRiOmC0T6MrOKdWa2i/ndMWqThXXkzJAZKwX6xf0XOn1kv2F5ZbO7qyzfYqfaCEEFxEQWLlNNwVF6
	AhZ/Ui9gdOvHZiAXZ9JP9BOyKO0WZ1IkXcr48qruOIu2Yqmlfqi1klGLZFG80mtf6puPdWu0BVDZY
	WQPFlkVWuz4Zg0OtyQSroUYopNvroEJZJUBZkSwl1kWxYdVt7q/iHG8ZZRoLUZGyss01pokxUN+2D
	eidxd0FT9IzSG/Pvgo3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mclYF-000gJl-P9; Tue, 19 Oct 2021 09:36:55 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mclXp-000gAa-B5
 for linux-mediatek@lists.infradead.org; Tue, 19 Oct 2021 09:36:32 +0000
Received: by mail-wm1-x330.google.com with SMTP id
 a140-20020a1c7f92000000b0030d8315b593so1980964wmd.5
 for <linux-mediatek@lists.infradead.org>; Tue, 19 Oct 2021 02:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CJsCWcU0YdDyrwMeRQ7adfzbBn9rJ1IRoawBpqp6LUY=;
 b=a4CDa4TY8RYsyf7Ov/rhPNU9JCjBEheWYFGjZ6M0fICmzqhK5+vkmDMKU/YI/iPSAe
 dhQdYbJ5sngCM+Yg0WcU+C1SnMh7BBiM7XI8Y4zFepF/ek5KXIV2uFha4YAd+n89I4fd
 hAkiABx3Q3nVhuCHGuvvTldrFhel/udGiW5h33GXk4Vh/NmEIOUMeZoSOcRPSnEzHhpr
 e9nRg3t/1KKxaflSVB4zdNl6a8RS7Tbp6DaHUriiI7T1AZQyW5+F/y4xjmzQzqE1yjxP
 0zfmI8Wwr3FkiwXL37JohYx0k0eXxdkKvxEHEnvohFXM52RGPKtwcu5WjB0TK3fouwbs
 5wUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CJsCWcU0YdDyrwMeRQ7adfzbBn9rJ1IRoawBpqp6LUY=;
 b=H26UOjsa7Q7AAr4lTcVAjJHWXF7eLvdzw0cQtAP6MG/Cn/aUP2VTgCUB26C3aIHtCB
 CksdxxCXAvNyFpxKdwhnv21+eL5j7fiIR43RI0RDQcQBQXjZ16iHzcLT9TeycTmLL7cv
 EnbTbC0+ul6S7ZH5ahzBTzdUj9naOyFw5OTgICsMUulFwuecZ+/JL/CGN0lnt7mRSgII
 LTCOUcEwDSzAGElWZIkn7RtqXF5UUJm0Q3Ly26uNwARsKqhpPT0sE6q/bw7+XFnu2Hxk
 vPmKTOqEhabdPqW2M2sWWNvhBrt27VE3ud5ohoYkIV1opzriO0N1hueXGJBPefZMM/zm
 OtxA==
X-Gm-Message-State: AOAM5327XfXMpruYVn5qiwP3u4YN2F6PN/1oGHO/+f4GxjMoq6ZHLX05
 X2V13EkE6irJxbdcAOFEbOQa5A==
X-Google-Smtp-Source: ABdhPJzhrEXmzMbsOs77lioFuMQGNrVk6F0Mecc/zs/NbpM2tEsMZAwoONXUBlPSFvrPfNoD8x+fiA==
X-Received: by 2002:a1c:cc0f:: with SMTP id h15mr4821476wmb.37.1634636187595; 
 Tue, 19 Oct 2021 02:36:27 -0700 (PDT)
Received: from blmsp.lan ([2a02:2454:3e6:c900:5142:5fbb:5821:5dc3])
 by smtp.gmail.com with ESMTPSA id o23sm1765765wms.18.2021.10.19.02.36.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 02:36:27 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Zhang Rui <rui.zhang@intel.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 fparent@baylibre.com, khilman@baylibre.com,
 Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v2 1/4] dt-bindings: thermal: mediatek: Add mt8365
Date: Tue, 19 Oct 2021 11:34:01 +0200
Message-Id: <20211019093404.1913357-2-msp@baylibre.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211019093404.1913357-1-msp@baylibre.com>
References: <20211019093404.1913357-1-msp@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211019_023629_388214_F98B406B 
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

This unit is present on the mt8365 SoC as well. But there is a
difference in the usage of an apmixed register.

This patch adds a distinct mt8365 to the list of compatibles.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 Documentation/devicetree/bindings/thermal/mediatek-thermal.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/mediatek-thermal.txt b/Documentation/devicetree/bindings/thermal/mediatek-thermal.txt
index 5c7e7bdd029a..ba4ebffeade4 100644
--- a/Documentation/devicetree/bindings/thermal/mediatek-thermal.txt
+++ b/Documentation/devicetree/bindings/thermal/mediatek-thermal.txt
@@ -14,6 +14,7 @@ Required properties:
   - "mediatek,mt2712-thermal" : For MT2712 family of SoCs
   - "mediatek,mt7622-thermal" : For MT7622 SoC
   - "mediatek,mt8183-thermal" : For MT8183 family of SoCs
+  - "mediatek,mt8365-thermal" : For MT8365 family of SoCs
   - "mediatek,mt8516-thermal", "mediatek,mt2701-thermal : For MT8516 family of SoCs
 - reg: Address range of the thermal controller
 - interrupts: IRQ for the thermal controller
-- 
2.33.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
