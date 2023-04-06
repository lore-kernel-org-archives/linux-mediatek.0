Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A4EEC77B6C
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Apr 2023 08:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ICl5yXhMxeO2u+7yTPtP7Jl3u4X7NhJCydXnMv94CdE=; b=3q8PuaDJjKFgS7sThFC/aSl5GG
	ZcFB0VNmF6oeRotFIsazf3ST6/w88sNmRDHOFtsO2lmZ7wPaM9SjTcWjBTuMO4arShtMpjq37jedS
	h+++BWB2K97xK+KWodAu3BdFpr42l84Dg2AqRr1qBJuOJRqwu4B5E5mKEpRsCW1S07kusW1nGMA1d
	xMVrLjUzBDev4/7qMJc7IkOaxmcI7tfpHJl0ppdDEdUZbkur7KR5kd50UbmpzHkJixlZRhTyCWgys
	Pl0WUJG6EDWGaRL+63WR54B+f9fCcJbHbXTEiBLYVrSmo7OVJRkrF32QOXkmNZxbtUYjoDCoKWsCk
	VHm/Z1pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkKZV-006gar-2t;
	Thu, 06 Apr 2023 08:02:17 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkKZR-006gZb-37;
	Thu, 06 Apr 2023 08:02:15 +0000
Received: by mail-wm1-x330.google.com with SMTP id m6-20020a05600c3b0600b003ee6e324b19so23297519wms.1;
        Thu, 06 Apr 2023 01:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680768132;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ICl5yXhMxeO2u+7yTPtP7Jl3u4X7NhJCydXnMv94CdE=;
        b=it8N5epu/hXZbHWuT1hr22stKIGl0pvvUn+gedunaw90tc0hnlroPv6UR0rKExvyi+
         /5HNW3X0Ey7HHnOjoxPAscBmzuT17opVmLbvKHPbxAl711L9R07V1KEsXUGg5vV06HuO
         bZ5kFMF6w8bZZU7YwUoTdeLRR+lD6jPKd+bCJ0Qr9B2qnZCTYFvuKmQuq7v9J6HYVtc8
         qkmBat7UPxpQ5MPXBkDfZJG9DUV0RANmcXSYDpJEtxYvai9w9ZpVQtUP5ezdt5QNVT8x
         JJDinsYCQ0vLm1/73RGpI1qYadaH2rbnLSSsb6axGuq/3jwX5U27iIUFZhCW0uqGJmsL
         jPxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680768132;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ICl5yXhMxeO2u+7yTPtP7Jl3u4X7NhJCydXnMv94CdE=;
        b=YXXwgzbihKV3M/M+b9r+3iMk9kEwXF8K27jvmLL20z66GCV0gL7NAFJ5NMomVeJI0T
         YdOXhq804yQqrnibKLF6TxGgsZGfZvRU/ws29BI8GCeWXGoOAxF24CdjHLta74/WGjNm
         bdMSFV1QeKiYVqqYgA/LLkShvLGDnA4/q5v06NiC6isEjojTOwBAdJ1Zd44yU7FHEHkU
         yXpFvEJEkR2/cwu1+ubjjtp2cfvE7cVX+dNDQvj4fm6EM41+NOCZRbg9qEXY+4AoLYNI
         gsSjUfnzfNC/AdAjmD+gKduAvwaiqWBkeULWhNhVH4addjR4sroXKpw50M8kSu8gXSDp
         58gA==
X-Gm-Message-State: AAQBX9cEfexL9JANeA/UZD6hOypZqFZQAQFBjuweNKiRJdIHT9gu2w4o
	pecRyrSvctNJoQ9To3zitXo=
X-Google-Smtp-Source: AKy350a/F/lBPdvFizmroFVH3fzHbWGMlo4ft4HctNyHW+b1LaJS8K92j1zaDn1g279tfeuONBh+TA==
X-Received: by 2002:a7b:ca47:0:b0:3ed:1f9c:af12 with SMTP id m7-20020a7bca47000000b003ed1f9caf12mr6967575wml.22.1680768131483;
        Thu, 06 Apr 2023 01:02:11 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id s9-20020a7bc389000000b003ef64affec7sm826993wmj.22.2023.04.06.01.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 01:02:10 -0700 (PDT)
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
Subject: [PATCH 1/7] dt-bindings: net: dsa: mediatek,mt7530: correct brand name
Date: Thu,  6 Apr 2023 11:01:35 +0300
Message-Id: <20230406080141.22924-1-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_010214_006324_FA78865F 
X-CRM114-Status: GOOD (  11.70  )
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

The brand name is MediaTek, change it to that.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
index e532c6b795f4..6df995478275 100644
--- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Mediatek MT7530 and MT7531 Ethernet Switches
+title: MediaTek MT7530 and MT7531 Ethernet Switches
 
 maintainers:
   - Arınç ÜNAL <arinc.unal@arinc9.com>
-- 
2.37.2


