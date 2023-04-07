Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CA26C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 12:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d2Jx75BdmM1DRIeZU7e7TBMUNuXWgIzSc84P6AFM0gY=; b=Xy6jtg7VqFkdBiATig1rt/+0hO
	OKaFAeugtKK0fhAf2o2JuX7AmB++VqIN15f6zu9fkFrmwZY2YlDSPSkwX0O9acrwMNzubuv4gT1Qd
	QvOYrJbRi0WuuK/x5CrEzD6CRKFjMe/TEZUi+Y2EnTXb5Siwm1QflpuKqOQN13RDmuclVfcXe+cON
	UWpLeiheczkuFAldQbsbMpp3MvC1CRhDUNTqOVhvTHhI8KkAiZf7FYWp286px/EnM6cdBy8xonq9G
	k0IQ3QaFgJtqcbqIRiv/mLVOkufXU1ymhJBvJD4G8tn/j5yEqgPqdLzSdx1jxB3dw9fOTb+Z+FFCf
	fZO7x1+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pklY8-00ACfY-1Q;
	Fri, 07 Apr 2023 12:50:40 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pklXw-00ACWc-31;
	Fri, 07 Apr 2023 12:50:30 +0000
Received: by mail-wr1-x434.google.com with SMTP id g5so2285364wrb.5;
        Fri, 07 Apr 2023 05:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680871825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d2Jx75BdmM1DRIeZU7e7TBMUNuXWgIzSc84P6AFM0gY=;
        b=hZcWa0HFwLeUOYBlBloUEX+Gaq7fM3R9AG4Q0VV839B/i1zN0VBj9/LLXSiAe7Wm8i
         NlJLovn8esr+YA3r2p9QBzTDZtCpCjvoxkZAuTQRdZ8dW/uk+VMvskWOFBr61bGMOf+C
         P+cEpbWt17E14Uda2Tz9uIryMW0StfE31q0EfhYGG94gCqvDvBlAW5/kXQitzd9k1pA0
         9WwvCys+4g6nr42u+6sOjSZeJkQSbp1HLQmBg3vBus5sP2Msozdnt8/nK21NCHdsdEhR
         NZL98Qxy6kkxsaSBHbzQPQhHVC+sQJVlgKAoqVsGHAWLpUQ2lMa99neOIniVOwKFRJ5M
         CsBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680871825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d2Jx75BdmM1DRIeZU7e7TBMUNuXWgIzSc84P6AFM0gY=;
        b=Q9vhOHbGRBUaI7ReuBjCZFPL5tsCFM3eYc/1GVoIsMAgN5YBZwXF1bEDehhAmGm7F5
         WNB2M9ZBkhj0GNcGP+0TcKLQS7dH2MLcZW+yktXjY5+fPSAV4CLM0lYNF4L/TIOIUF7X
         qD+ghh7ZPL8/UfR6oW+WaLTaUkjv9VwiBbzApA2c/WaNzYK3K07BS0Dp9NN1pTOhVSHI
         wQOIj1AtR76mybeg46sOGVpdwLnwZ8OXLWY95wALirI/OQu/RujV9qECI2p2bYFQkbsB
         yu549guN3pcuiXmt+LlTY3fEqFAKSSNca0MZzgKcbM6xOw+LF85TCvz+ikY7Fy0XB32/
         vNPw==
X-Gm-Message-State: AAQBX9fOuw13Jjw+Dn9EvmT3q2BRJI/9CL92XpQKm/X8xQqIifEaXFVo
	lI2iVdauvP1kotYH50nFyS8=
X-Google-Smtp-Source: AKy350aDOnsG7tp548bKfnKmtM6qwQHsjisCGHW0Ku6OVLIOs5Mlcs/gY2OHF8QTarpzU8KyH0pYng==
X-Received: by 2002:a5d:5383:0:b0:2d8:82f9:9dbd with SMTP id d3-20020a5d5383000000b002d882f99dbdmr1320495wrv.11.1680871825298;
        Fri, 07 Apr 2023 05:50:25 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id n37-20020a05600c3ba500b003f0652084b8sm8176596wms.20.2023.04.07.05.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 05:50:25 -0700 (PDT)
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
Subject: [PATCH v2 4/7] dt-bindings: net: dsa: mediatek,mt7530: allow delayed rgmii phy-modes
Date: Fri,  7 Apr 2023 15:50:06 +0300
Message-Id: <20230407125008.42474-4-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230407125008.42474-1-arinc.unal@arinc9.com>
References: <20230407125008.42474-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_055028_971681_4624AE39 
X-CRM114-Status: UNSURE (   9.41  )
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
Acked-by: Daniel Golle <daniel@makrotopia.org>
---
 .../devicetree/bindings/net/dsa/mediatek,mt7530.yaml        | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
index 922865a2aabf..79ddd16e530b 100644
--- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
@@ -188,6 +188,9 @@ $defs:
                       - gmii
                       - mii
                       - rgmii
+                      - rgmii-id
+                      - rgmii-rxid
+                      - rgmii-txid
               else:
                 properties:
                   phy-mode:
@@ -226,6 +229,9 @@ $defs:
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


