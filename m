Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A760C77B6C
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 12:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PvJDsmC2qYd1pgQ85lBs960eVGMLB3x0B1T+4QHFB/Q=; b=cK758kY4UYuUS97iP/mioqM6db
	ZcEvVgDLtA0n+CIvIL4vwkQLu4NlsjT/XEgVI33QtE9ZQ3RaXnUmAxtbjTSersADMOtzH33TX+3uE
	YtaFCt5CvqcnjWqCQix4W3M43byLxMHk593GHgBHePnoM6NtQn7QmON3oeXwjBQWHXk5QMbAzhp0q
	M4LlN4Jbe/8Khe1DuUabyZCibCdnOF7VQANeTw3G8PpMzw9ZU5/7/FvFO5YSgXijWcd1HVnLXdW/7
	e/FvMqjURQdCcL6XYSnNBCOFGXNxC6LEnuTJJ3ihTii92nIeYttauije+aUbEeHm2hAWkEm8dl9Mz
	0QQgV91A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pklXz-00ACaU-2o;
	Fri, 07 Apr 2023 12:50:31 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pklXr-00ACVA-20;
	Fri, 07 Apr 2023 12:50:25 +0000
Received: by mail-wm1-x336.google.com with SMTP id n9-20020a05600c4f8900b003f05f617f3cso6005817wmq.2;
        Fri, 07 Apr 2023 05:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680871819;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PvJDsmC2qYd1pgQ85lBs960eVGMLB3x0B1T+4QHFB/Q=;
        b=or7WakKRtDQDG/fo28VWWqQ07MrMmoabczFnS36b+Yv6/y2tULbns4a+2N+gTqVBXc
         BGw/C7SSv9esONmfQEAH8t8CiBBHYzU/725u/zfpeIqD87qN7w8FOkQsyamZbQC2Q8Ay
         p0Hb+asWzOzTdnTxhTwIZGsEJs3HcInQzDFJd5bvel6mc0MswbuKG7n8D1LiTG/a4wj9
         rGbbl81d393pX3y/1rZCSUmO3dQEfCWywNUlW0eZNf1jEwYZHlOn5oi+h4pEvMNoGcy3
         kZNc1koD34agwDKSTG2GqqzB7w+9KKdjRB+lO5fJcjkk0PcgcxtC3/wNv0kHf90ixWcg
         cP2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680871819;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PvJDsmC2qYd1pgQ85lBs960eVGMLB3x0B1T+4QHFB/Q=;
        b=otTr9R53RlKfg+IAAzAXKoOKgxi/5OSNwkbO00/NuKHDZlyQofbiKwV8Uayp6f0ljN
         7DyGnfuy+UpBUPjT0zEA4dzLiXV/ccWrM/ibcOwpKaNyrcVVTAxflF6z1tI9Q78cE6kp
         P8NdspCJYY+0kCMs3rWP0cRG/kDQbHjaCjlEwAt6lY5YV5RB2LgYMiAFhmpb58eReQPx
         db4OucOMOBuiaETq5Tdd+JnA7V35ERYeHoIyX8FwWx//6bQ0kPcdfWA1b5ilTp6o7XIJ
         yqlfXuliG73rEefV2caLpF47vFelpXwr+IwuRwu98U/QQVEw413yT2NykgmcXEykjjhZ
         Vcxw==
X-Gm-Message-State: AAQBX9dkLPhUkTaN6gVxnnFZMa8FOQDpfdqpjQIG89D5aStV8botxbt9
	sloqRdGntDUdW7G1JJyUDlc=
X-Google-Smtp-Source: AKy350Y38LWAG0Pi4Cy7ceE+yBoIdK/XagcUtp+HxL2q1jU0J/A1wR05OD7xPN4j1W40G6jbzPlkQg==
X-Received: by 2002:a05:600c:2296:b0:3ed:358e:c1c2 with SMTP id 22-20020a05600c229600b003ed358ec1c2mr1164737wmf.18.1680871819058;
        Fri, 07 Apr 2023 05:50:19 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id n37-20020a05600c3ba500b003f0652084b8sm8176596wms.20.2023.04.07.05.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 05:50:18 -0700 (PDT)
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
Subject: [PATCH v2 1/7] dt-bindings: net: dsa: mediatek,mt7530: correct brand name
Date: Fri,  7 Apr 2023 15:50:03 +0300
Message-Id: <20230407125008.42474-1-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_055023_677930_5EA8C80A 
X-CRM114-Status: GOOD (  11.82  )
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
Acked-by: Daniel Golle <daniel@makrotopia.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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


