Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB0F8C7618D
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Apr 2023 08:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RmRk0xNMsCgcrJI+xRy0MzfsEtKexUj93Cn4/6APjX4=; b=CJPOHpEnGTWD1M7gykfARiyTd0
	RE/uBrxElHdEMdyCiPF8AA/CQBVCP2eQ4BHt7GeGLqyXGzKSVQQtcrV/0Wdl+5BYV0sxrO5PMZUVP
	2fJ97kg4pE35IbGxKHIVP31IEucIlYmfbI9HrrtvazGaqkGhdD093X4kqOg+vlIiXuMH2fu1/mWn+
	67b4DYhHd2Q5EelYH55fJFsTOTClUiMcAvXIfmgVDvSORMSdZTZDhYt1idJyRBXAXV3xMSh0u/RGr
	AmUPCxFSvNqUgI85mEUYwBQsOBwSb5n9kmq8LPU6oV5M+5kmq9UVvMtTg860Ws9Xbzr+5OhBYcDUn
	57z+dHdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkKZj-006giY-2x;
	Thu, 06 Apr 2023 08:02:31 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkKZd-006gel-2j;
	Thu, 06 Apr 2023 08:02:27 +0000
Received: by mail-wm1-x331.google.com with SMTP id n9-20020a05600c4f8900b003f05f617f3cso4139007wmq.2;
        Thu, 06 Apr 2023 01:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680768144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RmRk0xNMsCgcrJI+xRy0MzfsEtKexUj93Cn4/6APjX4=;
        b=mPJYOeA/OqyZBFsaE+PJHnSCcxVCH7AsuJcTDA6Kn0cpNisoIlJ53FufnOmcsr5FI+
         GgFkNmFTOFmRJJvdv6zaYXpxWwdSoe8jJPr+X/77ixE0GBzWMGm4uA5lVc8D6lZZE4bA
         OAUMoNbG8sefSz8agTff7mjEdGmwYnHhvvxUx6yHZ2B7RGxVD0ZPusatK/GwRcnIMbmx
         TDDsimNHyUM4HMgCQpBkEw+dmo4UOTOB4tssZZfvO/wXcjqGX0IT/Ge8l4fXPMxlVm9g
         YLfito9EZ96sysUz2LRCXuRj6g0ESA+6HeQUxNHB5wKVtTruB9kjF2DkFYLzfn5Jav2w
         2qRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680768144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RmRk0xNMsCgcrJI+xRy0MzfsEtKexUj93Cn4/6APjX4=;
        b=tWfqjc/X3K64AC4VzU4XUBxtojkvzuqL6iAb1rth7ezYBnpspSTZxyONBx0/QeEjiz
         J2TpkDRI4I5navzck+f94vcEEcDcCBOe2zrNJrSrgkT0mXB0dpfVI8dOc7X2/q23ZmfV
         Qbt3FRQXs6/bLc0jgKqYjZYcoHEldQMjGVdmr8g/mYRQuwjbv6qtbXozdzTbBFpIv88G
         fe13dYv9+doRK5sfajgpolUejHgHw86ZGLFmiBRtMQXHcEte2J8qZQ/nzi4lJ+yplCS2
         SM3k2B6HUex5dHlU5yWKerN2XRNvACupQUqXLA3eFxDPBqDwFlUuMn1+m2LY+OIyNRb7
         NlsQ==
X-Gm-Message-State: AAQBX9fZrGoz4sxxjTvsjWE6r/vMzJJkHgb+fO9GFXY5NE8YPnW/BKR0
	6DysXX3DHBIxoci2pYNepa4=
X-Google-Smtp-Source: AKy350YR8IyuUclg8HySvJg9M4xWTYXQw+ShkQu/tly5qXQdseVIwZ8mZF6V3eJiL+2q4c+B/TqXQA==
X-Received: by 2002:a1c:790c:0:b0:3ee:7022:5eda with SMTP id l12-20020a1c790c000000b003ee70225edamr6859209wme.7.1680768144497;
        Thu, 06 Apr 2023 01:02:24 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id s9-20020a7bc389000000b003ef64affec7sm826993wmj.22.2023.04.06.01.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 01:02:23 -0700 (PDT)
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
Subject: [PATCH 6/7] dt-bindings: net: dsa: mediatek,mt7530: disallow core-supply and io-supply
Date: Thu,  6 Apr 2023 11:01:40 +0300
Message-Id: <20230406080141.22924-6-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230406080141.22924-1-arinc.unal@arinc9.com>
References: <20230406080141.22924-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_010225_882770_AE8F8C59 
X-CRM114-Status: GOOD (  10.43  )
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

The core-supply and io-supply properties are used only on hardware that
uses the mediatek,mt7530 compatible string. Set them to false if the
compatible string is not mediatek,mt7530.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 .../devicetree/bindings/net/dsa/mediatek,mt7530.yaml          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
index 3fd953b1453e..0095b7fcef72 100644
--- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
@@ -299,6 +299,10 @@ allOf:
       required:
         - core-supply
         - io-supply
+    else:
+      properties:
+        core-supply: false
+        io-supply: false
 
   - if:
       properties:
-- 
2.37.2


