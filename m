Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2526AC77B6E
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Apr 2023 08:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aA5NdqluYyuyJgpU2xMc4bklKNQ4+NDybzhpsjIzUzo=; b=VXaeRpbiphJ6qDJAKmn/f3qog7
	WIYu4GzVwIIaxluS/QAUnMQsWhu7WDa6ejEDOT/4Loba2D2GA8QgKBuUhEsPpxhY/WMzXh7VbStmV
	ArtKvpotYk60Ud/0gwA2ryK0sfhaP/RMYyjdxTe1SEYRZ7s4vXV1gu8p81u+55mDa72Ca2uVS0d2O
	+jdP9zRKZSgkdKkbSydvCmrvoBIePgogRKjI0xMlRd9hf97xlpI+NP8peTYgdFfX3W/W5kzL6KmUQ
	9nTGOarx2vxHgTJT71fEKR7GNkFHATYJ/1q76qPTCkr846nyp8Y7jPOaGTv46RdezB8svW449edE1
	kD/P/L6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkKZm-006glu-2X;
	Thu, 06 Apr 2023 08:02:34 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkKZh-006ggJ-17;
	Thu, 06 Apr 2023 08:02:30 +0000
Received: by mail-wm1-x32d.google.com with SMTP id n19so22151624wms.0;
        Thu, 06 Apr 2023 01:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680768147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aA5NdqluYyuyJgpU2xMc4bklKNQ4+NDybzhpsjIzUzo=;
        b=lV/QZB18CxFfmJKB4mKWpBOCfPvrpEhyZ6LkZPtrlnwqSJ8zhP2DRZoju2VW/Oy0UN
         thhs5LDM/CKa2MMn9r74RUEiIQLMRwEaxKL1pwZqDEpm2XxygHkH8Y101yBkkhYERijF
         nXT5IicjEujXwoGBWLdp7yIZAnmdZO4/JdVuOagei4jFms9+e9zLEedXEE3m4RcpECj9
         ZuG4F0JncgjSr5pvapi1MmP410E/svBGd0lzGUuSSZzYMIwvD3N9JV/seTJ7rfixquDg
         xktnfAmSD3z35x+I7Q3amTffZwdgllldRnCvNKwd+bK1RMXOhrQawdom8c3X0SWkSF3J
         piMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680768147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aA5NdqluYyuyJgpU2xMc4bklKNQ4+NDybzhpsjIzUzo=;
        b=DNtdIaXLdih0LDiRyesTWEeHG6og2NKvuq017+aTh/ppAYih+ntoxBfraL9CZQZpKk
         P/0YOMg3j9cU5Oo0wXNu3V1Isq5Gq+pJz6MRN/7dgjt/SUUxMd2ItPDZLUvhd2yWki9p
         QcapuW2RqvkYkUeToEvmNjW8842tA8t7CciMWPXHaes9/1VDW7Zs1+VHDA9kGevUfnUp
         RVQT41xPKSfqBJLNfDN8THbedfZ/1OiSEobK6NG7eeUaKeD2bwZQ6RXGi9rG+xpy0YVd
         sL32udKjRbkIm0KHBAiB4LRx6pFNACF1xR5T7URyZkGjn/mOFBWmuNzL0letBmariO7l
         PZLg==
X-Gm-Message-State: AAQBX9dRTEmcWqVhpII4IMQJqu2yAeEWOBMmI6HKCq+A6ytF0UBTG0RO
	4u1sGU4VOaaDxfJQM2L0AIyrEoETYxa0zw==
X-Google-Smtp-Source: AKy350bzZPnNNXqxUTt+rQdFAAXBkweS3uWiUyTfUHfxuieEJ7GOxGxGgDDmv9vTnksNwhu8CxQDMg==
X-Received: by 2002:a05:600c:301:b0:3e2:19b0:887d with SMTP id q1-20020a05600c030100b003e219b0887dmr6579110wmd.25.1680768146933;
        Thu, 06 Apr 2023 01:02:26 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id s9-20020a7bc389000000b003ef64affec7sm826993wmj.22.2023.04.06.01.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 01:02:26 -0700 (PDT)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
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
	Daniel Golle <daniel@makrotopia.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>
Cc: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	erkin.bozoglu@xeront.com,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 7/7] dt-bindings: net: dsa: mediatek,mt7530: allow mediatek,mcm on MT7531
Date: Thu,  6 Apr 2023 11:01:41 +0300
Message-Id: <20230406080141.22924-7-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230406080141.22924-1-arinc.unal@arinc9.com>
References: <20230406080141.22924-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_010229_380416_202F3245 
X-CRM114-Status: GOOD (  10.71  )
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

From: Arınç ÜNAL <arinc.unal@arinc9.com>

Allow mediatek,mcm on MT7531. There's code specific to MT7531 that checks
if the switch is part of an MCM.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
index 0095b7fcef72..b1dc1600f0dc 100644
--- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
@@ -312,7 +312,6 @@ allOf:
       $ref: "#/$defs/mt7531-dsa-port"
       properties:
         gpio-controller: false
-        mediatek,mcm: false
 
   - if:
       properties:
-- 
2.37.2


