Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BAD4C44515
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jul 2026 16:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v07hhIYgCpv/xDn5L0MGVWF5jtYyj0RekFw4y7lgqkQ=; b=wQSJbYDiw6GNI0lMWC5BuMnBv2
	4+gUpdL9FCyOkDD9GW3CIOAImYIFijI0xjcvTw7EHWVesrw0gibdMQCdelLmWSsH3l/sCoPMivwSe
	ISUQ7amn7Z7jWsA9NX7beodZwH9JakDy65LO1Gd+2FI2SocjJAKPkzpQZr71zvOP2D8RnQYnjdysP
	gYcEzrJ/pgbJ5WOwnUKutLeRaPWIj/CQnooZMvhS20pQXw56bMfF74rWxhg4LjOGcaGPimD+czRf8
	XK3nZfPxC0OEZHe9s9ecfkT4eGJ0cakhDNDqsjfRWe2Zvz8TUSERkj5hJsCD9CQoAIw4ND6Ltjydy
	WnQj6AnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkOoa-0000000085J-0u1X;
	Thu, 16 Jul 2026 16:20:00 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkOoQ-000000007yV-47Wm
	for linux-mediatek@lists.infradead.org;
	Thu, 16 Jul 2026 16:19:52 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-84867f07d63so7800554b3a.2
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Jul 2026 09:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784218790; x=1784823590; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v07hhIYgCpv/xDn5L0MGVWF5jtYyj0RekFw4y7lgqkQ=;
        b=pmwM7NbVe5fu6z/zYYbxh0ZTFdfv5H5gbnD9qWJ5t85giUBjp4eFAET4PWGXslOG03
         e63GZXknvxmlH5Kz/aWY8gfahXvFMKwb2ohBrRHw0loE6tRdLHqjoCEHDvwj50070tG2
         O08Jj+W9XUnmnoGzU+EIfz6xE8As0yxkgocreC0oSASnB5t7yPnKuw6DXI9m6V/3o3M5
         Amdf9tu/2/OlLmIYCVwVQusmjXLszAf94PsRzE/3oYAMoQNhTDot484XRL0exen4UF85
         QtSb4wbR3zNTNEzVTrlMhS1fpgKgApLiLuzf6NxELKHcwQ85OLUiFNxRrkPt1i8CdO6E
         fHVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784218790; x=1784823590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v07hhIYgCpv/xDn5L0MGVWF5jtYyj0RekFw4y7lgqkQ=;
        b=JAiF0bXahY+gvhOc5gEX4oESv5F7tiCvta8uhivjks1HAo369YS0DEJRkIqtaz4Kgu
         GFsE0j88oO3JGfCKA4SpMeMU2fFqxBAecdRjnIhPTLZxjZYOOFqWzA+vCBvJqcH1Js6W
         e9G+4vAMtRTuaKmj0/xY9jwUceA0B91aeunv6OOiV7kYbMHymmXpyr5Y7aLrWFUrctDr
         sL0Z/0I81EDoGPinCBcb1Tazz1SwCiSLYE9s926WZrpI8vi2zp+xPYxVz8C1soRrraCf
         el73bNYS9tL3Sh1tPnHjPe6aCzq6I92scwRLAlM8LmEIrcw6+rEu6yl/2HRNWseM/F9r
         Sp1Q==
X-Forwarded-Encrypted: i=1; AHgh+RqSJ8Kz7wHCWZSV4vEw7rGchAMZLD1AiYTXub8zn4Ylx5iwqFvJi8q58NwoJHuNRD+tMV7go94OvgFD1xUnuQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyJSXOEPhHY1qc0rGzRaJxLwp0ip5OHcTeTnC9mbdFTJ3+OccjD
	/YWicl0wO/alW6OrMBdsu+6S0ErjTgFAiYbb4Dd4fq+5kB+nx1TVjt+7
X-Gm-Gg: AfdE7ckP2j3nFj/dEiKQsj1MpDzqeDpyb+gfjvsHyvXPBuUFCCb8mEeFnPpjgR4ByTm
	pvTOAhi567O+Edjl86unqeXhpB43KSsBD7Uf391l3aEtSXw0MX+VxTufmZNpffZJ7wX7sDnoDVQ
	nQV43Z32DLG0dACVsO2hIgJfcxC6Sny1ulT8YVB96YTci88bOnsZ1iPgG/Ux5wAS8tt4Ur0zwLL
	gxv9Li+8As6SVObZSaMQTQ4y9fysG0R4+OTaCDLc7hr3FMwpoMRkxiqjQ8plcx/ALP0hbqsSJjN
	MdpuwDUdiZzYw8VkSRtH1kBy7Jx8dnzfozMOpUUrkB0PfgdtgHdMPsL6PTarbgodf6y5XMxizlQ
	NeDlsu9wqEw9oCWzyF7tonbu0SXIx6DINf91Ilnkpa0oPp47GMXVu+2FmEkWZqe+c5fxeWaMtbW
	NUiVVyVkQO72W/SbFKSfCD/A7lma7SS/KeOw==
X-Received: by 2002:a05:6a00:4f8f:b0:848:2f7a:2e50 with SMTP id d2e1a72fcca58-84a67308928mr7306361b3a.63.1784218789947;
        Thu, 16 Jul 2026 09:19:49 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f23a600sm5092661b3a.6.2026.07.16.09.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 09:19:49 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-watchdog@vger.kernel.org (open list:WATCHDOG DEVICE DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	Roman Vivchar <rva333@protonmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH 2/7] dt-bindings: watchdog: mediatek,mtk-wdt: add compatibles for all SoCs
Date: Fri, 17 Jul 2026 01:19:18 +0900
Message-ID: <20260716161923.266315-3-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260716161923.266315-1-akkun11.open@gmail.com>
References: <20260716161923.266315-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_091951_027134_EFAEBD1B 
X-CRM114-Status: UNSURE (   8.09  )
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

The driver recognizes each SoC-specific compatible, update the binding
to list them in the top-level enum alongside the existing ones. Keep
the fallback items definition so that old DTS continue to validate.

Affected SoCs: mt2701, mt6572, mt6582, mt6797, mt7622, mt7623,
mt7629, mt8173, mt8189, mt8365, mt8516.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 .../bindings/watchdog/mediatek,mtk-wdt.yaml           | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
index 953629cb9558..f4eaa5f7c5bc 100644
--- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
@@ -20,17 +20,28 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - mediatek,mt2701-wdt
           - mediatek,mt2712-wdt
+          - mediatek,mt6572-wdt
+          - mediatek,mt6582-wdt
           - mediatek,mt6589-wdt
           - mediatek,mt6735-wdt
           - mediatek,mt6795-wdt
+          - mediatek,mt6797-wdt
+          - mediatek,mt7622-wdt
+          - mediatek,mt7623-wdt
+          - mediatek,mt7629-wdt
           - mediatek,mt7986-wdt
           - mediatek,mt7988-wdt
+          - mediatek,mt8173-wdt
           - mediatek,mt8183-wdt
           - mediatek,mt8186-wdt
           - mediatek,mt8188-wdt
+          - mediatek,mt8189-wdt
           - mediatek,mt8192-wdt
           - mediatek,mt8195-wdt
+          - mediatek,mt8365-wdt
+          - mediatek,mt8516-wdt
       - items:
           - enum:
               - mediatek,mt2701-wdt
-- 
2.54.0


