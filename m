Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB0AC76196
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Apr 2023 08:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z1Dy9jILghc2oin2d9VIZqVYpUmKIJ7JSNuj8W4KgH8=; b=iEheMdfHqu1LSj/3mdpBLs6FyP
	rrkD4peodXQ27GnWWRc8hz8vAI4oGSPmcqvirVQGmgoQPL58n0U3EABxqQ9yjx6R2qE8ovADC2vS/
	QVmnh3b3t7rShTTtCHD88HBu2LkmyM+5Oh1DIN31Cdf+4jY+w10skBHyzrR0WIEInpo0qMsvKfUmG
	NQhFpWZs+JS7Gb8d5vN30XWTgkq+dxnk8EJf3OoNyMkFcPOQDCpbWOmpwp7b3NTO40h97LCFg8aCw
	NZmEo1BvzmXZHamjJPHmndyNbbKPq2OZEegmYuYhRmHGeYCkp33dwbOpbcK1nFB1pnY+5VnY1mWDo
	BCK5EAGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkKZf-006gfu-0i;
	Thu, 06 Apr 2023 08:02:27 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkKZZ-006gbV-0d;
	Thu, 06 Apr 2023 08:02:22 +0000
Received: by mail-wm1-x32e.google.com with SMTP id hg25-20020a05600c539900b003f05a99a841so5351341wmb.3;
        Thu, 06 Apr 2023 01:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680768139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z1Dy9jILghc2oin2d9VIZqVYpUmKIJ7JSNuj8W4KgH8=;
        b=RGvP+SDZxX9ME1EKpF3ct3mhEv1ZmdaEzq63cIvihhDYWiECOzUOxAgTEaIJStyOHt
         3Q3RDWHrn9fZSiI8hOlPQYwy988GyH9GtytIjPpNwN2BccfQnKBKuCQ4DHe3eCJSFrFW
         WwrIIQ0nkdMXOQhtAkDPhZWeq2KlUIAjkgLvWyPnc/GFhXTLZtEpbhtirZRCyHhdSmEj
         c1foqVMh+QGOqph6DBFcPdVXjYV/Tm1agZgpbPdmx/h+2oVUumbHPjQZA5VgCdE2nYd0
         HZqWyWgeOQoI8FyqkkOKpHXQsviiZweeQ7TlYjjbfNCJf8/XtBxqc8w3axtSx3kOyAwz
         /n9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680768139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z1Dy9jILghc2oin2d9VIZqVYpUmKIJ7JSNuj8W4KgH8=;
        b=S64+MFTC9XZnIaO5ksCzYTeJ9ojzWPC8Sxi5M3mtIxm4IzlXOSdBwMBvLU08oAUj32
         O5u1wonikQMXsEiNLa0oe675vbwGIFizLhl4kqNBZGLLuCoHYTYGbq56eQjtYdYH4qSx
         sbqdDZc7lidYN/uddeceQdGH86B5A75kCHuY3zBpGL+33jFyjSjTmdnt6I9K7J5fTUK7
         INiBwPMY7jsDtz3f1aUvLH5yU3rqV7plV9HRqZhpTgFzQvt7fib+eBsaNeKioYggbdGr
         ZOY03YAHex0VWoUmma3uiqyy0F6AMn/21OMLj/BTM79S+Hz3m9t4Jg9b41fRsVeQoXFN
         L36A==
X-Gm-Message-State: AAQBX9cPJpFje491VieCVLQu68G+lnaOqh/wAFa2tghIbzpXAm1hCT5T
	JaXxhAysOBK6MRFz/CgwrCg=
X-Google-Smtp-Source: AKy350YO5UG8gcVMQFQKFtkzSgSlc9tFvejLdwA8V7eMge/Igj8Gq/c0hD+r7klScptaKFWE9kKbNQ==
X-Received: by 2002:a1c:4b10:0:b0:3ed:de58:1559 with SMTP id y16-20020a1c4b10000000b003edde581559mr6869833wma.2.1680768139043;
        Thu, 06 Apr 2023 01:02:19 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id s9-20020a7bc389000000b003ef64affec7sm826993wmj.22.2023.04.06.01.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 01:02:18 -0700 (PDT)
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
Subject: [PATCH 4/7] dt-bindings: net: dsa: mediatek,mt7530: allow delayed rgmii phy-modes
Date: Thu,  6 Apr 2023 11:01:38 +0300
Message-Id: <20230406080141.22924-4-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230406080141.22924-1-arinc.unal@arinc9.com>
References: <20230406080141.22924-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_010221_230166_2E993C1A 
X-CRM114-Status: UNSURE (   9.20  )
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

From: Arınç ÜNAL <arinc.unal@arinc9.com>

According to mt7530_mac_port_get_caps() and mt7531_mac_port_get_caps(), all
rgmii phy-modes on port 5 are supported. Add the remaining to
mt7530-dsa-ports and mt7531-dsa-ports definitions.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 .../devicetree/bindings/net/dsa/mediatek,mt7530.yaml        | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
index 605888ce2bc6..9d99f7303453 100644
--- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
@@ -196,6 +196,9 @@ $defs:
                       - gmii
                       - mii
                       - rgmii
+                      - rgmii-id
+                      - rgmii-rxid
+                      - rgmii-txid
               else:
                 properties:
                   phy-mode:
@@ -234,6 +237,9 @@ $defs:
                       - 1000base-x
                       - 2500base-x
                       - rgmii
+                      - rgmii-id
+                      - rgmii-rxid
+                      - rgmii-txid
                       - sgmii
               else:
                 properties:
-- 
2.37.2


