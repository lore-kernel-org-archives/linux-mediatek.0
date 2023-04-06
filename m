Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3352CC76196
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Apr 2023 08:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qh7/8q6ObYiJ8rFG7u0fNoXDSPJQ6AW2HK/HF1hPhps=; b=1NDsXCpCs304CR38BlB7qjt8gv
	5tzugFv57ykQm8EIW51Em9mEN4Xj5pvoGqrAzOgvFCty/yv90SX2c3cnnTNx2YOt5NtVgRsgXpDuY
	zu6oXQBsYP7tGsdn8GqAR7qBVanxmPIo9t77TfUviBWMc+ZaQ9Ue/0FgePJKNsoQ5L3x+LkrjrCmG
	5+XAy+MlarjoHUZ9oenRHjyQz1BpA0EhRUyhLrjBogiqV1JFSmejnM/ngbFfTHaY1A3rG4FfBl1b5
	grtKciCWZRz57+rD9Jzpk35zzwpgWi248WzMC6ROPNexClrL147NWinOmfUS3dLRkc8pdz4GPC6+s
	LjvF+YUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkKZY-006gbj-1D;
	Thu, 06 Apr 2023 08:02:20 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkKZU-006gZp-1Z;
	Thu, 06 Apr 2023 08:02:17 +0000
Received: by mail-wm1-x329.google.com with SMTP id m8so11232928wmq.5;
        Thu, 06 Apr 2023 01:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680768134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qh7/8q6ObYiJ8rFG7u0fNoXDSPJQ6AW2HK/HF1hPhps=;
        b=BnHWav7djfJ0AnrN+7BSjt2yjCiUpxrN2syTjNZ6vdv3213viKA4wHb0Vcqzj5m4Vd
         SwmooCnH0nPxRf8nXu6VPgOH8Vkh3oAiDfMYToZTTX5XC7uF0uvkGCe2xaVHsLHCVT6q
         kgYN5DVuxR0T6LpqVa17kk8lND1sgA48HGPnPdB41B4abfnbrHfpMxCwUBwBLrJmimCT
         kJ/6h8yIFb1oxz7P7VBJnrJfEqRHJibSQGtcMNuAoaKMIG3DHSLhICxP6j0YK216xu4t
         DePFP7rcsrsb8/K5H8jtVrJgcXibo0BUFKvmQMZNQZPsSAVmhC5xyQiE8ePgxaU7MZn6
         tNtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680768134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qh7/8q6ObYiJ8rFG7u0fNoXDSPJQ6AW2HK/HF1hPhps=;
        b=ZEwLJEVo8LJzGhFHC8LdNMSTqtwBLIVLDwMexoBfDOBlDkZ9O42J4vJP6Mq78HUs0A
         IYkwDI5YMsPCjdMGnfU11LkIVuPVa2dKhNP8PQk0zIwG/lwIFAbDHMKtHidEEvPICpCJ
         PxHe9t6bNqK25woXBxVlXf0cBb94ZdXkJ93UKpPyPB0xbAIvyyyZQzESoPuJv++QkZPT
         Qbf3crq2GTCWsLS6Jdc4WYkfusf5xG6bjznCT04ktk8hdOA/UrjuSdcIiaMFFhzrxBbo
         8zDSKz10iMLgZGmZir/0vOkIbGgCohOFqBYi1wch434C3A80PjqjCrPY3tbZMfXj33bf
         y1xQ==
X-Gm-Message-State: AAQBX9e91Md1akqXzH7KNO6rQDpWiKGFuqpBy5GXd6p8G//c9mDZhUTH
	uV7feliqssybg6fs5MBkEQE=
X-Google-Smtp-Source: AKy350Z8BUntUGgaUZ0JsYY0YWX6eYpdtEuArg2Rn3T2ll8NM3bGUndFU79f26oyoEzymFlcIcppzA==
X-Received: by 2002:a05:600c:2312:b0:3ef:6396:d9c8 with SMTP id 18-20020a05600c231200b003ef6396d9c8mr6317377wmo.5.1680768134079;
        Thu, 06 Apr 2023 01:02:14 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id s9-20020a7bc389000000b003ef64affec7sm826993wmj.22.2023.04.06.01.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 01:02:13 -0700 (PDT)
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
Subject: [PATCH 2/7] dt-bindings: net: dsa: mediatek,mt7530: improve MCM and MT7988 information
Date: Thu,  6 Apr 2023 11:01:36 +0300
Message-Id: <20230406080141.22924-2-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230406080141.22924-1-arinc.unal@arinc9.com>
References: <20230406080141.22924-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_010216_523150_DF4B533B 
X-CRM114-Status: GOOD (  14.43  )
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


