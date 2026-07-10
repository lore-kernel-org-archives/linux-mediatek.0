Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07A85C44506
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2026 10:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9M4o3iN5nWztVryd5NG1m3lFycIITbNkOd3Ijgz0aSY=; b=oJmrO/4cQuwx7fuK5FP+9ggpe/
	liYCFFdfBfpjB7AI6jUEtzkJxZRxyeB9S/6Wl0F8y0CSqrIVim4dbFOk9iXB+fiNaNY3XC5qDR9ky
	zM5udZojW8ufN6A/4HD+dIJsFxh1atzSdPwGqaJhUwaCLuEOleZDOGVDMOMIlz6D7RH5xsLNFAW3J
	1wsXW1kkwVU/OJDQZgdmvALB8N8wT5L+v+7yQH18lKR/Vgc+xPPNNpWSjilH476IXF88Q4H9SB77O
	rFZADL4iVwl1vm8p8ck5JfJCsY6FUiAfG4vx+4poosWXQaTErYm294WsKO2DH2VZXhJJ/QWe6jW7f
	J7BpETCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi8sg-00000004krK-0aLM;
	Fri, 10 Jul 2026 10:54:54 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi8sd-00000004kou-1xaz
	for linux-mediatek@lists.infradead.org;
	Fri, 10 Jul 2026 10:54:52 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-ca7bea5e5b3so620616a12.1
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Jul 2026 03:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783680890; x=1784285690; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9M4o3iN5nWztVryd5NG1m3lFycIITbNkOd3Ijgz0aSY=;
        b=sRiIBeKvM3YUQ0UCz8lFUqi8qAhPL9c1MChaZTG/R9iiphOAmVZxzVh6snpiudqAvg
         9rRew+Rq/lhOlcYId/G6zI/or0M3EJmyl17cykP2srfo8muzeYi2s3g3FH2NgYvkk5E0
         CMGsilJfz8WNBcruC2Czp+L1pOM2170wJvDBpJyRm06kzAjydkWcl4i/SNLhZqq+TshZ
         6Py7AyNkrIfy7gVN1VVCTmtpPmJ2apzATdRtkUGleTb+jN3NG+VH2SLvOqnnV7Q45eYH
         KbztTcIPZqSGdoS6EgtavH+zNpLoWog7M6Coqg2eEFsUM1Qbxn3tsQFE/PUKI9A1GqFi
         3cvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783680890; x=1784285690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9M4o3iN5nWztVryd5NG1m3lFycIITbNkOd3Ijgz0aSY=;
        b=UzBCP2/yv+lpQFnRO46onI5mWZucG2D+WUcV2CveM3r4WLGDle0/OXQIsff09Hd7TK
         lyOTjOLMoCDZVPsS/9gaTa2qnDm/+9yPVdE2SDjk+t7UBbNMWXr8P1e7izP4rODYHwUK
         28UFBqGxl0DgV8xEkagSmfmttkl+K8fvESgLjfZJqmO36636TO5XgLpn7daj80q7X5Et
         Qtt4u7u2YoBKZTQkfRGoXv9x268E/s7ArhZbpmn8PJ3q9QMR3UON9nrLFU+f3DFmyJ7l
         xljz2gw/+1r1gsdQ3skTGJfygmnbf7Dr9Z0iHRtueXhH0pdUUfck6aj4afxGfjDp6YLR
         RcLw==
X-Forwarded-Encrypted: i=1; AHgh+RqcKA7eN7cZ3irgOOEl7CldlBjoIb/NeTeHUSvm5T/gSksnz7ilfz4f/LpbZs3jYqHacoDlauAgLRaSvL6ojQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxNSw6+ILCENWZg80HDcXzjV/5wQuJ5B584VohoB3XYs9bl6/x5
	IFhXYI324SCAaFoQx+OELkiuiQToqIn0G4Xv00LfWfhSsKFzGWFHDLLV
X-Gm-Gg: AfdE7cl/xz44cgwnkDxoR2MQwTbzkfPxkfMGVoH66T4137xF+a2EgLa9mKuk+mcqNIK
	ayYsGfok9yu66ENzTNg8KXrMj+rEIs521RMpgPhfXFM1LPnBSA4BtjBHJL9ct2hAbpQJbkKnZ4Z
	VWGih8zvWREpaPEsF0y7W9JZ0guIV4fvhGsRCPiIFZkZlIK0jX5dTIgvL6lDGAkECIPB5XVBica
	oOnUhA0ec+zyGKoZVziEFUcw8ETOox6+CBMDLzi2VzxSbjKaPD+X88M+hOWCN1i4pAuWu8Hukjv
	GsfjkKWSe8otPdebGk9lkXhnnPqEIGuLWm67r9pl/1n4a+GcsTnHevhipSvy4ImlKdgeA8B/9IP
	yY+Yz0o2O5/qysahqHgrKPmy3T07jt0ebuP2biiKQlAIX5vLbWtq5Dw80DRwlY6xiVNsLlbrhc7
	Z3YcWj8IBzNIy41nA5D8QI
X-Received: by 2002:a05:6a20:4304:b0:3bf:e24e:3afe with SMTP id adf61e73a8af0-3c0bd206c10mr13691119637.43.1783680890615;
        Fri, 10 Jul 2026 03:54:50 -0700 (PDT)
Received: from DESKTOP-TIT0J8O.dm.ae ([49.47.198.15])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659c8572sm40752937c88.9.2026.07.10.03.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 03:54:50 -0700 (PDT)
From: Ahmed Naseef <naseefkm@gmail.com>
To: netdev@vger.kernel.org
Cc: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	"David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Sean Wang <sean.wang@mediatek.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Ahmed Naseef <naseefkm@gmail.com>
Subject: [PATCH net-next 1/2] dt-bindings: net: dsa: mediatek,mt7530: add econet,en7528-switch
Date: Fri, 10 Jul 2026 14:54:23 +0400
Message-Id: <68e85666b6dfedab719aaa388450eb86312eccd0.1783680864.git.naseefkm@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1783680864.git.naseefkm@gmail.com>
References: <cover.1783680864.git.naseefkm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_035451_510973_1F22FDB0 
X-CRM114-Status: GOOD (  10.67  )
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

The EcoNet EN7528 MIPS SoC integrates an MT7530 Gigabit switch,
memory-mapped in the SoC register space like the built-in switches of
the MediaTek MT7988 and Airoha EN7581/AN7583 SoCs. Its four user ports
are connected to integrated Gigabit PHYs and its CPU port is connected
internally to the SoC Ethernet MAC.

Add the econet,en7528-switch compatible, with the same constraints as
the other built-in switches.

Signed-off-by: Ahmed Naseef <naseefkm@gmail.com>
---
 .../devicetree/bindings/net/dsa/mediatek,mt7530.yaml         | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
index 815a90808901..90b3582b7619 100644
--- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
@@ -100,6 +100,10 @@ properties:
           Built-in switch of the Airoha AN7583 SoC
         const: airoha,an7583-switch
 
+      - description:
+          Built-in switch of the EcoNet EN7528 SoC
+        const: econet,en7528-switch
+
   reg:
     maxItems: 1
 
@@ -318,6 +322,7 @@ allOf:
             - mediatek,mt7988-switch
             - airoha,en7581-switch
             - airoha,an7583-switch
+            - econet,en7528-switch
     then:
       $ref: "#/$defs/builtin-dsa-port"
       properties:
-- 
2.34.1


