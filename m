Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 730BEC77B75
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 May 2023 15:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qoKeBGVLOBu4DrLK/qM8cN/bO+eEqfiWPQ9nbUj9vHo=; b=0jFefclUpjgRpcsysS+l6PNixv
	eXTGksKEV793goQnYWbagBcOuuurhNr4GDCpd1R7YWTNmfpoOxsEWO2JY8ngbo49YxcT0rjD2BnGo
	moS3lr7L2avjK1uo6CU9bmcQHtd7iFSO2Uw0TRqofaUlxyKG0LRDU61m/fnjeCOrG/qq8MPlNE0iu
	sT4XoOnZcBMUz4BvBcZfyJMkk2vOdNNVCOrpEL2lF2g9Xm5daW186xCpTLPSzWZETTea/Vbop+4Ew
	oap+ZriprAKiwp7JOrNxZcKD1Mj9VBrW3QTArhpTpKUAtd2jhv+GSB62e1rw9xXfmOSpiXVhpikh3
	s26hzVpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pw3G8-000unq-34;
	Mon, 08 May 2023 15:58:44 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pw3G5-000ulh-2q;
	Mon, 08 May 2023 15:58:43 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4f00d41df22so29644819e87.1;
        Mon, 08 May 2023 08:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683561517; x=1686153517;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qoKeBGVLOBu4DrLK/qM8cN/bO+eEqfiWPQ9nbUj9vHo=;
        b=njc2uBhQTwCCXVHXm/oE2IOFTW4zhdBqaTkEe+Jkvty3fbq0HmDNIHQ+Dtnov5JE5B
         DlCRgIXF4wRZsVTIxt/In6dIIJjr93rvVkJbdIsGM0WJCVM2PkZZP6nK3YzraVbSFXZ/
         y1axOGjBwCE6LLrV2/3hb3EdM9u2ked3GmCe5fNpfHcYDPSYlh20egY3TJDc/69WfH/S
         JxsccU+FleZQKxQ98hjZKKI9ARdJDrE+RaZG1h0IycyLct/DXTCWhglMwDQ/8TryxT10
         x6tdLtYXTIzB2e7w21vFDYkqfD65okleWow13EfeXpkPHi+Q2wdW6Wp9I8giWU6MD12i
         BE7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683561517; x=1686153517;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qoKeBGVLOBu4DrLK/qM8cN/bO+eEqfiWPQ9nbUj9vHo=;
        b=eOtCsgDMu7CasgWF/MyFKO9qf1d9IgN53ktriCLJMUOhWs94TJAlMw51gcsHTW0Q/8
         39aYuT8fZBjH0YMw13qJxee2398lyRxtgafItnOLlP/Op1rc4vzyEWbjSTlmDZtdx2S+
         nbadqUKZ4snsqEXsDOz5/3QzPIhac8VgdLvfrEjnjgdvd2oVALThJps7/9CEm/HAFcug
         rq1S46WvMICpQyGngdRXDfcDSAmxrzm53dKyP6y3pj31GgiwXODE64AHwNYx9lbZFPn2
         MxSgj3gbQntlg7LxH2OAkhKzc2wbTuQQ0YJHEbK4I7A6q2qkl4LdB11DnUfzOJzmHfCx
         rn4A==
X-Gm-Message-State: AC+VfDxDuo4Y1ieCG4ZlItiTEdXm7/T1pRch0xPrp+Mbhk18RK1YRDNC
	PNsE0TBJCKYVpmOFj5RQXQM=
X-Google-Smtp-Source: ACHHUZ6pT3RD+p8XzST+vQ2EfJpmtSMjPL9zzBcCqUFO+eXzEx90tVk4CD3LshCQFBxntLgVrASleA==
X-Received: by 2002:a05:6512:3b14:b0:4f1:b38d:bfb8 with SMTP id f20-20020a0565123b1400b004f1b38dbfb8mr1765747lfv.24.1683561517097;
        Mon, 08 May 2023 08:58:37 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id b29-20020ac25e9d000000b004edce1d338csm30878lfq.89.2023.05.08.08.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 08:58:36 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Kalle Valo <kvalo@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH] dt-bindings: mt76: support pointing to EEPROM using NVMEM cell
Date: Mon,  8 May 2023 17:58:20 +0200
Message-Id: <20230508155820.9963-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_085841_926767_1A52FA8F 
X-CRM114-Status: GOOD (  13.84  )
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

From: Rafał Miłecki <rafal@milecki.pl>

All kind of calibration data should be described as NVMEM cells of NVMEM
devices. That is more generic solution than "mediatek,mtd-eeprom" which
is MTD specific.

Add support for EEPROM NVMEM cells and deprecate existing MTD-based
property.

Cc: Christian Marangi <ansuelsmth@gmail.com>
Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
Ansuel is working on mt76 driver support for NVMEM based EEPROM access:
https://github.com/openwrt/mt76/pull/765

I took the liberty to propose this binding patch.

One important difference: my binding uses "eeprom" while Ansuel went
with "precal". I found a lot of "eeprom" references and only one
"precal". If you think however "precal" fits better please comment.
---
 .../bindings/net/wireless/mediatek,mt76.yaml         | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
index 67b63f119f64..0500caa4107c 100644
--- a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
@@ -71,6 +71,14 @@ properties:
 
   ieee80211-freq-limit: true
 
+  nvmem-cells:
+    items:
+      - description: NVMEM cell with EEPROM
+
+  nvmem-cell-names:
+    items:
+      - const: eeprom
+
   mediatek,eeprom-data:
     $ref: /schemas/types.yaml#/definitions/uint32-array
     description:
@@ -84,6 +92,7 @@ properties:
           - description: offset containing EEPROM data
     description:
       Phandle to a MTD partition + offset containing EEPROM data
+    deprecated: true
 
   big-endian:
     $ref: /schemas/types.yaml#/definitions/flag
@@ -258,7 +267,8 @@ examples:
       interrupt-parent = <&cpuintc>;
       interrupts = <6>;
 
-      mediatek,mtd-eeprom = <&factory 0x0>;
+      nvmem-cells = <&eeprom>;
+      nvmem-cell-names = "eeprom";
     };
 
   - |
-- 
2.35.3


