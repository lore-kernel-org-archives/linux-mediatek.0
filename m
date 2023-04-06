Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A55BCC77B6C
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Apr 2023 08:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WPfB86t+nbjtQNmGqonvhYdyRwayc+B/NfmEAcnxhaY=; b=iYOTRHE4vYOPpS477xGe44kJZ5
	/IvWUiEK3kejsRfTaXS+hUyxWm4UTmJtwFBPlxE4QBjkdcKcQd8bqU7JsK/eTU3PAMIlaq4vYgHVr
	nVDWfv8398u71pUOc0QrY6iNkNvnd8WM/XdXcsUz0k/KedfFR5BJu4ppuyGaKlZ+h4KwlyP1wplVP
	+Fv7AXQWHmOVd+TIP6EmH/GhN/EOVh1TNRGi4lkRxnAF8NBBKJcWMfNUvENuZf/QSv0D/2nncBOV8
	AdA687/5mDxZXN+frnqe2p5GNhhlq/kFYHiKoxPldi/tXusytA1qDAs9LmI7uS01zJ8I5gn/QWTqk
	cS9Sv+bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkKZg-006ggx-2a;
	Thu, 06 Apr 2023 08:02:28 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkKZc-006gcn-0X;
	Thu, 06 Apr 2023 08:02:25 +0000
Received: by mail-wm1-x32c.google.com with SMTP id n10-20020a05600c4f8a00b003ee93d2c914so24735626wmq.2;
        Thu, 06 Apr 2023 01:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680768142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WPfB86t+nbjtQNmGqonvhYdyRwayc+B/NfmEAcnxhaY=;
        b=gDOU9qcSBn5YF586j9L2PcoNM2JnU+QiRJv01Cf+abyOI5XBvMdDVBl/RXCleLpqD8
         +p4uNaXMHKa17Vz6kOTtHzHCu0Fli6Yo/pVJDwRWKMlz+NYcRcXqd/ACtkw/4hcQ2qPp
         rI0ZNsmjuF5EtZ1h90CjejIlK7o2t8TQczn2gAUsKMNXQS1MxkiPIaz7CABkIkMoUGWV
         v3r7njOe720uKsZjHEbz+Cr13leaPJGg8R+izEAlmtKUofV2Ldy+8ovA+hQCXYlwlmi2
         4Cbs6OelciOyWR9iO/zEAgPCZrXhiBJYD4z4acnXBPcFKlZy2222fGH0GR3YRhSaJfJZ
         7KAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680768142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WPfB86t+nbjtQNmGqonvhYdyRwayc+B/NfmEAcnxhaY=;
        b=qIT4zpzZcpbzVAmXnVxnnPwkPh1fSm/bkD0QSG01MiRhoZtQvnJ+QvAZG40r42D4/8
         lcZEuTMNlNEYRb6IxPzv4YeGPrI5FF4w5PJE4NqPHciNvMI4zJxYNTvdBKUvCaShy9o4
         ubLKvGpbH9tN7pSGTDO96cpNlbemiFUpjU0N1Z5v9SOghovyxE89AGu7KdE6KqdjnWSX
         OZQLjnhJUrkBDFuHZArLKQifgE8zsScC+RWwv+Kxmw35gk3mwV36oqQValWXQgH1FuI2
         XTGe7Me+hR/ww5s7rpOtUh+NUdVDgeG8V/+IPLWxQ97Dn+f1hmfajV6JG7UvKhRzdVcY
         RyBg==
X-Gm-Message-State: AAQBX9fHZBsNSzkY5k7drguoDJorc7VYEm/xyIfVUvUDsE/Pv79SfuqO
	7W7CrQxTjvATsyrzqu/4iYE=
X-Google-Smtp-Source: AKy350b4aoIYcpf6jCSqmpCE9htfsTH/GIbFV9cCyChDpC1YQ8GkUjnVJ8aijJvGqy4Ee0cnZKxxMg==
X-Received: by 2002:a1c:790b:0:b0:3ed:2b49:1571 with SMTP id l11-20020a1c790b000000b003ed2b491571mr6195603wme.20.1680768141695;
        Thu, 06 Apr 2023 01:02:21 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id s9-20020a7bc389000000b003ef64affec7sm826993wmj.22.2023.04.06.01.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 01:02:20 -0700 (PDT)
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
Subject: [PATCH 5/7] dt-bindings: net: dsa: mediatek,mt7530: disallow reset without mediatek,mcm
Date: Thu,  6 Apr 2023 11:01:39 +0300
Message-Id: <20230406080141.22924-5-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230406080141.22924-1-arinc.unal@arinc9.com>
References: <20230406080141.22924-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_010224_205895_EB39F0CE 
X-CRM114-Status: GOOD (  11.46  )
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

The resets and reset-names properties are used only if mediatek,mcm is
used. Set them to false if mediatek,mcm is not used.

Remove now unnecessary 'reset-names: false' from MT7988.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 .../devicetree/bindings/net/dsa/mediatek,mt7530.yaml         | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
index 9d99f7303453..3fd953b1453e 100644
--- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
@@ -282,6 +282,10 @@ allOf:
       required:
         - resets
         - reset-names
+    else:
+      properties:
+        resets: false
+        reset-names: false
 
   - dependencies:
       interrupt-controller: [ interrupts ]
@@ -324,7 +328,6 @@ allOf:
       properties:
         gpio-controller: false
         mediatek,mcm: false
-        reset-names: false
 
 unevaluatedProperties: false
 
-- 
2.37.2


