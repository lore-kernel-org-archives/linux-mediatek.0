Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF4FC88E75
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2026 12:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EBth4tRMg8GOGvhksLcEkRFTz5ARAzMlbCo5jt8vu2Q=; b=fDEUVnBIleW7HbBrlGhBnhCLIA
	C4dJdLdB3hhjBWg0yyqsAbllEoS5otWk5ljyyN1shXG2iL0AW3uRi3nC8JenDAJnyQAiIn4oyOrV1
	UkEcAHpoFc2jKXAG5Hw+uy5xh8B1WGFd50QdfO8xTtD3vW5NbNU2p1RrgqGgc1sTlCsOLdKhza7nn
	LCRXabAadhWjmbYvQ0XakYVMLX2/bFYRqBn4a/cKg+D+TAyBIu4npmw2dtXAyvaV9YZk3cN8jeIfI
	E1GPkcZ7a8XlXfAMmq8SEzkAxL2iaTYzd12KC+rwAtmn6ffzAnpuYUVzE9DPXBJHKdBp17ClnAOyu
	EeYH8olw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6SQt-00000006WmP-03il;
	Tue, 15 Sep 2026 12:38:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6SQg-00000006WdC-43GL
	for linux-mediatek@bombadil.infradead.org;
	Tue, 15 Sep 2026 12:38:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description;
	bh=EBth4tRMg8GOGvhksLcEkRFTz5ARAzMlbCo5jt8vu2Q=; b=C/ALLGxZdUyiaseae213K4qSyt
	ZRie751s6gCn/dge6EiliEkl1x0Slvpugcf3Ki/7NoBJnl4eZQzKjeHTJWCVu1ZTEqrsJJQ+wlOdB
	Z+6L6HRKMyiO0NpDVCRs6BwDvE/nslcWOMZ8gBrgeL8TkCQPJDlQzWHtv4Fwkq7fI5sJrOIdHp4Ux
	viNzjSPxX1wLldfAC7ViHvBdxcXUy3zG2V+RwbwsQwmibtPNxa/o0ACOfai2K1whb9EwffL455C7q
	4Iq50QVRrrQph/RSBf8FXcxkm/4yQD1Axbi/8GSAkB40q3FHsdh4WydtKmtJEgaSlkxghZ//7mDm4
	uMWtLTLw==;
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6SQd-00000006kDb-3qOT
	for linux-mediatek@lists.infradead.org;
	Tue, 15 Sep 2026 12:38:29 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b912d8239so18849225e9.0
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Sep 2026 05:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789475906; x=1790080706; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EBth4tRMg8GOGvhksLcEkRFTz5ARAzMlbCo5jt8vu2Q=;
        b=Xhyr3sq6+njl9hsi5JKBzmrqTXVaUb6oeUtZFcMGkMQYYQYEjqD7UOi2l++i4u5Psu
         VAObeAUCIukGy4cOqhtHaLbIGXpiG/03aSsgJjNKpTKuEYQqcqsBtibN/HimXZlH53U0
         v9VcoSjkauQMPZYvfVj9eaA/YoxNSUTn+/XmzdtnFav8zhVRhetd/7aVicg24oip20WM
         ZVaSe3e3uIOGrNonpk+vE/tFDepRzshtdG4hTN/Y3cWXGfslAJOoinLOVLPuyAdJ4nfz
         6boqk8ffsGLbCr1GX7ChrB8QdfpXkdR5qrWVayLFufOC0pjUKTvV1LSaposzk6cDSIl9
         ctcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789475906; x=1790080706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=EBth4tRMg8GOGvhksLcEkRFTz5ARAzMlbCo5jt8vu2Q=;
        b=VnbluCC3hVXPrd3kL9Jq6lyLfudrdl+83qC8IMfUc1tz4/DfQj+mMGh0NG+ng9aZz7
         4H89yXlKsEMKlwlh5cG79ST53oTxyEucnrw39nRUyl9R+qrVQRx3r7u3AowaJuOOiK2N
         Ghr8k/jlw070LI9WdWuk2ob/g4UFMauL37VuSg1VqWW+ls0rFHXnmhMgzu/62mn440bs
         cB+HkpVHeWFJTTvG4QWTXP9B6rXftF5hHhEdoYgtOWVKBNqdgDRfK3XmIrjYuj155ymv
         2xBYDkKv50zO6nv6DvXaHSQq8yUuoE09sJ+WaktQT8OwVAViNkzwWPgPNlcTNtiop3u3
         1Mww==
X-Forwarded-Encrypted: i=1; AKwUvByjbEy86ImD6flBUfCCDtEbjrXMXtuGCTisiDFquwMvFHr9P3NLxQUkzUzSN6z5xVwFBwAyVgHhxVziOK3HzA==@lists.infradead.org
X-Gm-Message-State: AFuF++kQb1O619Qdok4RYwzjM+ZlPm/O3gJcA31Klz+Jh0LlOPnBRK90
	2ceZzumerkC0/6oSP6UX0sD8/jaXH2vJy9Mvqw42pvWrJ0WpYbSjIwaE
X-Gm-Gg: AYBFou1Sa+/i10RlgQuP8LtqNBqKOdGkqA9m9Hqm2lcB3vS+CLnS7Y3+wr5Yvv0/KHI
	kZzjt5kZdPyLwbyKTWNmUa4JUVAUx2kbTDZmJG0ge1BhVVY3eHDFY9QOyLERKFWRE3rf5ua6oVa
	WUlxYYzAP634MZwdkEooCDIRb7iRKr/CTo6IK9fUyXXf5TTESERHIoeNB9POv2H9d6r6Uii56Qn
	EnbP3qvv99wRKPme99QOTnAl354KnPpuLD6EF78cHbXWoHNr8l7DYfXir5u6y6rK6dE2sf3M2/a
	D+x9RJwXTUGkfLYIRfP+RXKXDMNVmszQTSulL03VNG8e6T7sZ0mggKucbg67FJwr3zWDX32Qval
	7k8BRZrh3UmatWgarv8FQks3faIc4fNPutfsa4tuHTJcw2aVN7OSp1ooXhAlgaC05mtO5g7/erG
	cCzmMIKDyjU7mqj6SLL/0brw3TtQC5lWGmYRuq40YCuiaYU90CW7Zd5zpYW//w7c3/XD2GTE/fp
	/cQEoTB0UjhpUfSvIYineG6mt9TTYy4pZQGcp1TBbwyh/pe98WnogHt3OcsJQ9H
X-Received: by 2002:a05:600c:3b89:b0:49c:ff3c:973f with SMTP id 5b1f17b1804b1-49e7a692d5emr106570525e9.24.1789475905719;
        Tue, 15 Sep 2026 05:38:25 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49e7d6a8d5asm62958635e9.9.2026.09.15.05.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:38:25 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v22 1/9] dt-bindings: net: dsa: Document support for Airoha AN8855 DSA Switch
Date: Tue, 15 Sep 2026 14:37:58 +0200
Message-ID: <20260915123812.14747-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915123812.14747-1-ansuelsmth@gmail.com>
References: <20260915123812.14747-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_133828_064422_2FD9B966 
X-CRM114-Status: GOOD (  13.96  )
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

Document support for Airoha AN8855 5-port Gigabit Switch.

It does expose the 5 Internal PHYs on the MDIO bus and each port
can access the Switch register space by configuring the PHY page.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../net/dsa/airoha,an8855-switch.yaml         | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml

diff --git a/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml b/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
new file mode 100644
index 000000000000..5ad9b9e13983
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/dsa/airoha,an8855-switch.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN8855 Gigabit Switch
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description: >
+  Airoha AN8855 is a 5-port Gigabit Switch.
+
+  It does expose the 5 Internal PHYs on the MDIO bus and each port
+  can access the Switch register space by configuring the PHY page.
+
+$ref: dsa.yaml#/$defs/ethernet-ports
+
+properties:
+  compatible:
+    const: airoha,an8855-switch
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    ethernet-switch {
+        compatible = "airoha,an8855-switch";
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                label = "lan1";
+                phy-mode = "internal";
+                phy-handle = <&internal_phy1>;
+            };
+
+            port@1 {
+                reg = <1>;
+                label = "lan2";
+                phy-mode = "internal";
+                phy-handle = <&internal_phy2>;
+            };
+
+            port@2 {
+                reg = <2>;
+                label = "lan3";
+                phy-mode = "internal";
+                phy-handle = <&internal_phy3>;
+            };
+
+            port@3 {
+                reg = <3>;
+                label = "lan4";
+                phy-mode = "internal";
+                phy-handle = <&internal_phy4>;
+            };
+
+            port@4 {
+                reg = <4>;
+                label = "wan";
+                phy-mode = "internal";
+                phy-handle = <&internal_phy5>;
+            };
+
+            port@5 {
+                reg = <5>;
+                label = "cpu";
+                ethernet = <&gmac0>;
+                phy-mode = "2500base-x";
+
+                fixed-link {
+                    speed = <2500>;
+                    full-duplex;
+                    pause;
+                };
+            };
+        };
+    };
-- 
2.53.0


