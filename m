Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BD93C77B70
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 12:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BhBtxDtSz4bH7TbpHPVA9FnwXJmNesfBIN2Sp8mydaA=; b=HBxDW6J5PVtk+nzUJ2UZUh+i61
	NX++st7Jn1wyvsRJZWVyZ7qIOvB7JXbXloW6SdFs3s8F+wJzy+LH+Y4PEVo6kqKsFeUytz1nLADgU
	9qWgWvflfnvxtg8v7kWOy4Ttm8fRVqJEM5nC6ZnL0nnFmokvL29zwFFrHWaeSKTfgxP0LGAf+5DCG
	s8/IzAdx5l48zyU2ldKaAjxNehZ9xpi+Jh+9IVGUEzUTj2t+hkKy2HYyzWAwBh223H2NI692ZzA3V
	BX+VYewTc8937zCh9RGGMQA1tv7WpOu6JWz0GS/fPRljSW7pWzG0wEtpxrXqX4bIwCcivgIM9JlF+
	tpZUvZkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pklY0-00ACap-1f;
	Fri, 07 Apr 2023 12:50:32 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pklXs-00ACVP-0H;
	Fri, 07 Apr 2023 12:50:25 +0000
Received: by mail-wm1-x32a.google.com with SMTP id s13so23967860wmr.4;
        Fri, 07 Apr 2023 05:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680871821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BhBtxDtSz4bH7TbpHPVA9FnwXJmNesfBIN2Sp8mydaA=;
        b=VMxkrT7qvXhqqRG7V6RDlV9gwWNBpUI1gCouk5IpwxbSAW+6uZ1cJ6dPxDZ2jxheeE
         Mck1FjSAyxcAvRrlJ4g5Q7r7dcmikNMbMrh5aBIkOqx8bmhlgzC111MBUk4ts6luURtN
         WCXvuUvPaTpuWLXaPmhn3kddiwrLbpcKkbS2iKnHWvKVu648mhC9/3yGfPr8VSJ9oca3
         WeIrXuPN1gcH65YSjv5JQ43Q9ZdxNvq0H8I3fRMGmAsb+ZkvOmhT04vegdUZLR6OyuuZ
         HtDNlBGkp6oZHk+dNPXrNnNplkWeQrCF83aZejrFayq2EztMgyXjuDQnOwa2+H4/PHO9
         aA/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680871821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BhBtxDtSz4bH7TbpHPVA9FnwXJmNesfBIN2Sp8mydaA=;
        b=aQy6RERckm3qkmJt+bNokVxitVALNS3poP/IYzQvK+/hfY0Yu+2wVRIDP/HMlTmZmm
         eXQKPCLqy//VvyEjfBmO1Ptt4oeZtGgNzcSMVtSRfRaBR5bO1qfQ8/VBYylNm0YSUOFU
         VQgUWXRg3HN00X3dLt87YECg7jKjCCbxqXex7BKziXIe9UdQu8TZNudCMp26vGrqaX/9
         5rQat7Sd9IPZqnNT04UJtwB+qeb1dup3W352ENhR5UzV0yqhMN1BLFWZe8pPGHbv6bZD
         E60PURZt8yFgrs/Q5WZU8+qeyhLHgQGA7JcEWwbP3ue0bfatyI+50zUFJBOZrLIzS+ix
         iAbw==
X-Gm-Message-State: AAQBX9cUGvYorexfLANmmH3dGos9fDEIilh1lowRAdZDss0b0I9KTWya
	MadmsyNycAE2OLfo4rLCb+qzGIYoLTycUg==
X-Google-Smtp-Source: AKy350aP+Zz+P6Ae0/eMi3ClAC6lpFOkTb8pPG5GtRkLI+FW+xHkQ4WoadPWcXIdrsg760lMm4uQIA==
X-Received: by 2002:a7b:c04b:0:b0:3eb:3104:efec with SMTP id u11-20020a7bc04b000000b003eb3104efecmr1160754wmc.16.1680871821214;
        Fri, 07 Apr 2023 05:50:21 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id n37-20020a05600c3ba500b003f0652084b8sm8176596wms.20.2023.04.07.05.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 05:50:20 -0700 (PDT)
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
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	erkin.bozoglu@xeront.com,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 2/7] dt-bindings: net: dsa: mediatek,mt7530: improve MCM and MT7988 information
Date: Fri,  7 Apr 2023 15:50:04 +0300
Message-Id: <20230407125008.42474-2-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230407125008.42474-1-arinc.unal@arinc9.com>
References: <20230407125008.42474-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_055024_209245_6663F148 
X-CRM114-Status: GOOD (  14.34  )
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

Improve the description of the schema.

The MT7620 SoCs described are not part of the multi-chip module but rather
built into the SoC. Mention the MT7530 MMIO driver not supporting them.

Move information for the switch on the MT7988 SoC below MT7531, and improve
it.

List maintainers in alphabetical order by first name.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Acked-by: Daniel Golle <daniel@makrotopia.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/net/dsa/mediatek,mt7530.yaml     | 25 ++++++++++---------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
index 6df995478275..7045a98d9593 100644
--- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
@@ -8,29 +8,30 @@ title: MediaTek MT7530 and MT7531 Ethernet Switches
 
 maintainers:
   - Arınç ÜNAL <arinc.unal@arinc9.com>
+  - Daniel Golle <daniel@makrotopia.org>
   - Landen Chao <Landen.Chao@mediatek.com>
   - DENG Qingfang <dqfext@gmail.com>
   - Sean Wang <sean.wang@mediatek.com>
-  - Daniel Golle <daniel@makrotopia.org>
 
 description: |
-  There are three versions of MT7530, standalone, in a multi-chip module and
-  built-into a SoC.
+  There are three versions of MT7530, standalone, in a multi-chip module, and
+  built into an SoC.
 
-  MT7530 is a part of the multi-chip module in MT7620AN, MT7620DA, MT7620DAN,
-  MT7620NN, MT7621AT, MT7621DAT, MT7621ST and MT7623AI SoCs.
-
-  The MT7988 SoC comes with a built-in switch similar to MT7531 as well as four
-  Gigabit Ethernet PHYs. The switch registers are directly mapped into the SoC's
-  memory map rather than using MDIO. The switch got an internally connected 10G
-  CPU port and 4 user ports connected to the built-in Gigabit Ethernet PHYs.
+  MT7530 is a part of the multi-chip module in MT7621AT, MT7621DAT, MT7621ST and
+  MT7623AI SoCs.
 
   MT7530 in MT7620AN, MT7620DA, MT7620DAN and MT7620NN SoCs has got 10/100 PHYs
-  and the switch registers are directly mapped into SoC's memory map rather than
-  using MDIO. The DSA driver currently doesn't support MT7620 variants.
+  and the switch registers are directly mapped into the SoC's memory map rather
+  than using MDIO. The MT7530 MMIO driver currently doesn't support these SoCs.
 
   There is only the standalone version of MT7531.
 
+  The MT7988 SoC comes with a built-in switch with four Gigabit Ethernet PHYs.
+  The characteristics of the switch is similar to MT7531. The switch registers
+  are directly mapped into the SoC's memory map rather than using MDIO. The
+  switch has got an internally connected 10G CPU port and 4 user ports connected
+  to the built-in Gigabit Ethernet PHYs.
+
   Port 5 on MT7530 has got various ways of configuration:
 
     - Port 5 can be used as a CPU port.
-- 
2.37.2


