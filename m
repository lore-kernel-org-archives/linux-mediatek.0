Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E26CC47073
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Jan 2024 11:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E/uOy3CnFQHiCBe8I/foRgMuvqzi5S8GoqT8eS9RKiI=; b=T3srp1OVyx3qA1e0g4CekPMinb
	7INxXs7Ot2VuQEokB5LS7kuxyGOEHF7HQKBDlt2+fgqItDvzdRjBJS3nWz0gGhOlY+oBM+Ld/LgZx
	f2xzJG6up3OvXTdmMnnjJxO3L+kRfEW7AlYXFPRy6hOu4Sd+5ylT6tHXtbDCVMjoJy0DgDVdMckel
	71zspM+DwmHwP4vsQtjkIVKp8ejw8R5L7AkQVmiPGBtS0IHaQe6Dg+K7g+cxdM9zN9hlOGSG1W13E
	+ydturBSkgM/cSD7MU108tSfD4QcRVlckjShiSGI1oOV3QERmhNSMLTQcnN4txxd6g2b9/CRKowQW
	SC4T2CDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKGjS-00665x-1m;
	Mon, 01 Jan 2024 11:45:22 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKGjP-00665Z-0n;
	Mon, 01 Jan 2024 11:45:20 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a27db7d85c7so88329766b.1;
        Mon, 01 Jan 2024 03:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704109516; x=1704714316; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E/uOy3CnFQHiCBe8I/foRgMuvqzi5S8GoqT8eS9RKiI=;
        b=Iptyp0MVwx9z2NCrkavVgHkQXnfAsIdzujJ2gc0jfInG7zSvnu969sAsTDXqh4F1Ir
         FF/y4rfDHjhu4XEHM5XO/TKD9Aq2AF1UVbc1f058KnWKnEprB4rpzY2llZSNALfXnI/l
         CV9urwGEmVRUTaHOj7UDZeK9suzbLhW3gn+38QLoFAtavktudEpH6lES6bVu07rcG35U
         1yhKz4HSQowJnODRNZe72zIf8HIuy4hS1jizXJ3ib1vOc5CPl6gUcStRxDwc2lFOjsKD
         /DP8aMSut45nAWeGrXAY69S2+UZKbGalW7K7k9g6fSeRnHYawIKcektlHWPKbwkn6h1+
         qQfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704109516; x=1704714316;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E/uOy3CnFQHiCBe8I/foRgMuvqzi5S8GoqT8eS9RKiI=;
        b=IxHrEb2aU3YiYwbcB4BPUl76Bcnb3o/dWES6isWUG9ykZWWRR6KbtJQqysUJCz79/k
         rZHWB0iEnlw8ofEUkWJVhOA1aaD+dttf0KolwP8QoG2A8uFTECN/EyZ/c6rXknk+4Py1
         tp07p4/RDm14qYH5eVCH178+yM8zBnAA90DyEJNasN8G+Ayp4gdE535e75ZkjBV0C+S5
         NAXnLElRduHtQULg3FJPRIYdrKpsHUtQNDQeGJdtAzXfKEckp2QlVL1BqXR3idgW/pbr
         gpYNnRoS/n3dhvdTCKTEqjQJj/rFA1N/qb533s/VdAMX82haxko70YMTDGpXyn7XVl1a
         95PQ==
X-Gm-Message-State: AOJu0Yyv50kQCJST7X58R8PgUXPUezuBCY79N4twEMe+4Jq5yBE+x52l
	rZwryrGs5OweD03cJabOJeU=
X-Google-Smtp-Source: AGHT+IFMWdpcy0/MWx/ibh/j5+HmrLs7nLJ4sDnWRai+R4T/INhnpkzvFC/JV7WzEppaM+XkK1gr4g==
X-Received: by 2002:a17:906:f1da:b0:a26:9812:deb9 with SMTP id gx26-20020a170906f1da00b00a269812deb9mr6081870ejb.126.1704109516008;
        Mon, 01 Jan 2024 03:45:16 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id fc19-20020a1709073a5300b00a26ea2179e8sm7455038ejc.41.2024.01.01.03.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jan 2024 03:45:15 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Antoine Tenart <atenart@kernel.org>,
	Sam Shih <sam.shih@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-crypto@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH RFC] dt-bindings: crypto: inside-secure,safexcel: make eip/mem IRQs optional
Date: Mon,  1 Jan 2024 12:44:32 +0100
Message-Id: <20240101114432.28139-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240101_034519_329628_90BC0A77 
X-CRM114-Status: GOOD (  10.25  )
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

Binding for this cryptographic engine defined 6 interrupts since its
beginning. It seems however only 4 rings IRQs are really required for
operating this hardware. Linux driver doesn't use "eip" or "mem" IRQs
and it isn't clear if they are always available (MT7986 SoC binding
doesn't specify them).

This deals with:
arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: crypto@10320000: interrupts: [[0, 116, 4], [0, 117, 4], [0, 118, 4], [0, 119, 4]] is too short
        from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: crypto@10320000: interrupt-names: ['ring0', 'ring1', 'ring2', 'ring3'] is too short
        from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#

Cc: Antoine Tenart <atenart@kernel.org>
Ref: ecc5287cfe53 ("arm64: dts: mt7986: add crypto related device nodes")
Cc: Sam Shih <sam.shih@mediatek.com>
Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 .../devicetree/bindings/crypto/inside-secure,safexcel.yaml      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/crypto/inside-secure,safexcel.yaml b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel.yaml
index ef07258d16c1..c8f4028aa7f3 100644
--- a/Documentation/devicetree/bindings/crypto/inside-secure,safexcel.yaml
+++ b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel.yaml
@@ -26,9 +26,11 @@ properties:
     maxItems: 1
 
   interrupts:
+    minItems: 4
     maxItems: 6
 
   interrupt-names:
+    minItems: 4
     items:
       - const: ring0
       - const: ring1
-- 
2.35.3


