Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22068C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Jul 2022 22:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wgTXRa0gUVNHwULWBQ6HmK4rStMh8mkQWbVbr/JyhMI=; b=OgNfSrDtQsMMjZa5N0tWlvCtu/
	jrpISVUU+d0ksOrA6M6bHpHWIy2VMtPFlQ1YhK9MJe3MZy5QNypA+hZX8X7WGWgroT7Z3LaAXmodu
	VtGGUhtwdYUleKThwolTlhJYcQQAbiGitI+flrVSUBvuIxMJ11SzzX27bK53REUCusG5FFy7QsgRr
	sgHsqHQIfB3WchwELfC94H+kb4bJnwTZdS9q6eATADIzQcVy/9upGILF4cXoTHYSJWmvLSkSv7zOY
	eim9jaSU1CnAp0AHCcb4I0IMqSSSxDBLo+d0oP22nhV/UYZwD6L1ydA6aGJPuxOpzF/B5HYHOxyge
	wZlmDOVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7P3Q-007Cg4-C4; Fri, 01 Jul 2022 22:24:00 +0000
Received: from mail-io1-f42.google.com ([209.85.166.42])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7P3F-007Ccx-IC; Fri, 01 Jul 2022 22:23:50 +0000
Received: by mail-io1-f42.google.com with SMTP id m13so3607300ioj.0;
        Fri, 01 Jul 2022 15:23:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wgTXRa0gUVNHwULWBQ6HmK4rStMh8mkQWbVbr/JyhMI=;
        b=Wx/v3Zi05cFCdNYQmZ5VyVZj3IxziUaIHOUkYs2zueCf7ID1hpBOTZGeXQ+gFTHTYd
         1ynmUIbGXL7cEpnvW0e+XhaNLLLHKz5qdPBkCq4gSHIbZj5xGOf/Cte8VaxRJSZ3t1XD
         aGl9e6MCVNNC44ssKknHnB1Cyy83gtRibFd5W66wpfFKYDUi7XKdVnZ7qxM6Z79im/lG
         xnCetj/X2UXrSAjGv45ayJkK9YyO+l6j+KxWL0KXvK5tOt43S8lC3jTWJ7QQRK9Lijrs
         DV7IYIMkGk864GmmeUxd0ahbqXr9z5+Cz1JOuIaq4gfGGg9IyJwx9qNY5ltgxD+9JQWj
         C1Kg==
X-Gm-Message-State: AJIora+XViNJ9n/KI+i3I63LdCyz3OpFO8zhLFWYMOXuLQ7w1z3RQSmA
	Hmtnx3FPUyWc9sXxXs6veQ==
X-Google-Smtp-Source: AGRyM1ulGVnw6GEJ6uNo8AiP90w7VF/bBbxVRP75OaGfKKmHCUmJ1JkpX14z5ToaHIpMF1cfcdXH/w==
X-Received: by 2002:a6b:c941:0:b0:672:734f:d05f with SMTP id z62-20020a6bc941000000b00672734fd05fmr8199292iof.87.1656714228220;
        Fri, 01 Jul 2022 15:23:48 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.248])
        by smtp.googlemail.com with ESMTPSA id t16-20020a92dc10000000b002d94906dacfsm9418189iln.67.2022.07.01.15.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 15:23:47 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Frank Wunderlich <frank-w@public-files.de>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: net: dsa: mediatek,mt7530: Add missing 'reg' property
Date: Fri,  1 Jul 2022 16:22:40 -0600
Message-Id: <20220701222240.1706272-1-robh@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_152349_642134_80A339BE 
X-CRM114-Status: UNSURE (   9.65  )
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

The 'reg' property is missing from the mediatek,mt7530 schema which
results in the following warning once 'unevaluatedProperties' is fixed:

Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.example.dtb: switch@0: Unevaluated properties are not allowed ('reg' was unexpected)

Fixes: e0dda3119741 ("dt-bindings: net: dsa: convert binding for mediatek switches")
Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
index a3bf432960d8..17ab6c69ecc7 100644
--- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
@@ -66,6 +66,9 @@ properties:
       - mediatek,mt7531
       - mediatek,mt7621
 
+  reg:
+    maxItems: 1
+
   core-supply:
     description:
       Phandle to the regulator node necessary for the core power.
-- 
2.34.1


