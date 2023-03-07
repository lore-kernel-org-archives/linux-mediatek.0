Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E88E8C678D4
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 09:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yl2mpHuveUP7tQhvAv3v7QFO0cT2TOycTTxsdGGCBaU=; b=lbqjzfXhZrojxFdGX/asnquqVf
	V5bNDo2UgJnW4+jtsT98P9oGXmwhZ+LY+WdT6Q7aa0ZjJTni0lAjjV4FYP+cYBN7lyHyioGdnzZz4
	jefgLCjBJiqqXU/FwA5ZaiG8dt9grveQiFXTGCCrZ17zfvjfoUcClkowpk1ffy5WzW5D7AvLsPanq
	dCfrGX/Ru+u75o930LnpNEhFm/2uqiXRKjy4k/wcUcPlIokyQWlSOH9uSbRlebaDGRKlMxThCCyWS
	eGSeZRddelWbHhACt4Mav1PwIDHP1dEZo16JbaMUAqghOBl84F5x05S8PU+dQSNgmsSadOXePCoFf
	kXZxQ/aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZTxz-00H2Jp-NQ; Tue, 07 Mar 2023 09:50:43 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZTxc-00H26M-Ns; Tue, 07 Mar 2023 09:50:22 +0000
Received: by mail-wm1-x332.google.com with SMTP id o38-20020a05600c512600b003e8320d1c11so466324wms.1;
        Tue, 07 Mar 2023 01:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678182617;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yl2mpHuveUP7tQhvAv3v7QFO0cT2TOycTTxsdGGCBaU=;
        b=DO0/ionGVI+UCkpAP0wJ0Ky4zV5JZ4ipAfi4ou5qX9KaKgTXlOUNeMIgPkPYsBxbOe
         SSPbbBpHSWxw3H61cawOk/3Rwl/9yI2a9bKwMwMCkCME5LBo4v8O5l5GRX+vCsf28I9K
         uPtXvVhfmyyRqIO9AlF8RyoIEQqd1SttVIyCAIl8yAuOVsLHymKx55pNRaenW4JK83Ot
         rmvILk6HMWy0cuAptYPwIeFc94YchYKy8pCZHgydZSA4ok0PyccCb23MN/QaSyWz6nMP
         dyElaKAXnPTDZKYZaEfBJiXFyX1y4kLF/1N3zYP6hT3vgDdOxLw8AO7mdXTDspYE8coj
         tw0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678182617;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yl2mpHuveUP7tQhvAv3v7QFO0cT2TOycTTxsdGGCBaU=;
        b=dykf7eLCGZRItJDPAqCvzoGFaqFTw/ad8kTDBeK2AeQgo6bmTsPnDpZBaC6S1JTSeQ
         WkmGvHTqUj0MtUOAmHdOfy0OHFKDT5w8kfD5j1eR7DHDMPemny7syrMzWHDmwlfljn79
         lITMYEJEv2vQXWf3131yXO/7KMLOQZQvYdM7bZOW+c+hPyGviNIC0bFYI04EM2YEjpRl
         KPgTazaql6wq+HJm5EHEdPTWObrEDAlGSYmF9mgYuqPLCFHstmTog5M60zWQmYyY+AkM
         ww8BV+8AmFVGXFf2TTFGJ58eAYNF4aSeC596RlSlisGjxyTunWFLn43L0p5lSeiTFG4Z
         UJYw==
X-Gm-Message-State: AO0yUKWtbTDvFzPx+2dBmPFaMFMqw3iKy7O8yVyARGI/ndvqmNqLOrre
	8a1tsRuTRVnhaBmRcJjuHBA=
X-Google-Smtp-Source: AK7set/ppE7inaeTkWIv4ddlbRUVSqik1YeZrdxSZaUZnn15JQHNkAkVC05c0k8FepeErWjWwG5+ew==
X-Received: by 2002:a05:600c:a01:b0:3eb:29fe:70ec with SMTP id z1-20020a05600c0a0100b003eb29fe70ecmr13133009wmp.27.1678182616641;
        Tue, 07 Mar 2023 01:50:16 -0800 (PST)
Received: from arinc9-PC.lan ([212.68.60.226])
        by smtp.gmail.com with ESMTPSA id o6-20020a5d6706000000b002c573778432sm11841451wru.102.2023.03.07.01.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 01:50:16 -0800 (PST)
From: "=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?=" <arinc9.unal@gmail.com>
X-Google-Original-From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>
Cc: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Rob Herring <robh@kernel.org>,
	erkin.bozoglu@xeront.com,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] dt-bindings: net: dsa: mediatek,mt7530: change some descriptions to literal
Date: Tue,  7 Mar 2023 12:49:48 +0300
Message-Id: <20230307094947.12450-1-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_015020_850723_F22E05B7 
X-CRM114-Status: GOOD (  14.26  )
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

The line endings must be preserved on gpio-controller, io-supply, and
reset-gpios properties to look proper when the YAML file is parsed.

Currently it's interpreted as a single line when parsed. Change the style
of the description of these properties to literal style to preserve the
line endings.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Acked-by: Rob Herring <robh@kernel.org>
---

Sending again now that net-next is open.

Arınç

---
 .../devicetree/bindings/net/dsa/mediatek,mt7530.yaml        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
index 449ee0735012..5ae9cd8f99a2 100644
--- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
@@ -93,7 +93,7 @@ properties:
 
   gpio-controller:
     type: boolean
-    description:
+    description: |
       If defined, LED controller of the MT7530 switch will run on GPIO mode.
 
       There are 15 controllable pins.
@@ -112,7 +112,7 @@ properties:
     maxItems: 1
 
   io-supply:
-    description:
+    description: |
       Phandle to the regulator node necessary for the I/O power.
       See Documentation/devicetree/bindings/regulator/mt6323-regulator.txt for
       details for the regulator setup on these boards.
@@ -124,7 +124,7 @@ properties:
       switch is a part of the multi-chip module.
 
   reset-gpios:
-    description:
+    description: |
       GPIO to reset the switch. Use this if mediatek,mcm is not used.
       This property is optional because some boards share the reset line with
       other components which makes it impossible to probe the switch if the
-- 
2.37.2


