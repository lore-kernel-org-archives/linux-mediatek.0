Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6DACC2BBCA
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jun 2024 11:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jGjvAzjDwlAq0rCpEO+mGer2SS+9hXiF0BPt0Wfq6d0=; b=0ngJgoRZT8wpGWRMvTz/zmx20M
	D5RtE2Yq6UBV07Nh4RMSzPjNtNu45c2g8qRrIv/0F3bKwfNUNQF79BRgfcC5pVeph76rMA2zwf/S5
	lyU5PJoTX6klpVerZev63Igq6tgkyOgnKTOBEOka6vYxU3QzDezcTIkEpwEdSREkSPmtoabmi6QPj
	45GWPTW6waIIc0O6mD/EVE9km1fYVB9M9JOSckPNc1sWT+d/77DJubXcnl1O0Vp/uF+tBgEFaMA/H
	8p3qTGfJba8tkk1VdHkCsqk2AgHMTrCQZfh/jYEkCqmDx9axPxbb90kRwgl7j53rSx4mnVMLj8kv4
	KNYyABfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN9cc-0000000DW4K-2a0M;
	Fri, 28 Jun 2024 11:18:30 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN9cO-0000000DW0r-0dgc;
	Fri, 28 Jun 2024 11:18:17 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3674e1931b7so386256f8f.2;
        Fri, 28 Jun 2024 04:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719573494; x=1720178294; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jGjvAzjDwlAq0rCpEO+mGer2SS+9hXiF0BPt0Wfq6d0=;
        b=KP2PCYxhFsGxPWzxYG5LsLuu9zVax4nJMf3hDhRXzshYlvqOKzx+ZOscFcLy/+qjSs
         0w5C5PBSS9LGlnKCE0qDkprkVZGH+iqs/LsbD6lwl0OY+fsa/oqyrwumdL/vRnO2bx4e
         2DfArRZhYwlL4BhnztMOqXKSAs3hcarlHV2Dp1Sxtu+/XUvCZzwlvmt6jiKZVkPP6/Ly
         3p+/cf5Xd8sM635xFsT6FTA67nPfGDotyzOV2LnM8fo/+rgn6QzIzV5xl2QG/yKJXItC
         aX8c3ZHsFvIYCU5uEyaIq+2xpB1wS0xE8HQxylqRlsoXnYaLiNpI5+D5Lgxu1UKc30z/
         Ht8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719573494; x=1720178294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jGjvAzjDwlAq0rCpEO+mGer2SS+9hXiF0BPt0Wfq6d0=;
        b=kK4Ch44UmjxiIdiQhkNMdhWYSkOZ0HkAxt+6w41JT/+NGJzoSW2BPKuREr5swxSm/u
         gNgo79HpmZO2MODulUWS1/bbxknnpL+6i9vzu6zibjZ1yy/InkMFGxJdA6lZDRquDV5Z
         DtKKkXesrjeMKj9Nd1HcEVT2YPBEsJFKpWVnyVaL2H7X/bd6ASVGv6EeuQZ7QzGk4UMz
         WOULQQApg0eQAOlPD7KjiprvP7qHzU82Mc7NFPJS0akdUpKbUdUwZWQxwWnzp9HDVlvJ
         6YX79wdVC60/iMiHNjbQDC5LgmiXfi2aLs27lrB9NBcclq6cWZkcs2kzNa8l1hE6OMrC
         yQIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWO4D2mpvpmIkExkqjg9MBzVTqaTErFLeRvnQ2yzwrwLQx9M/rIlFj+BTau1STr9944KKLi3nk+PCPtoANrwSIFSHutCvSdIH8OLgBX3kH5a8YQ1XmzqlIisbYz2InwF5jhl0YRxBsRtgWcfSrTGu1RvoRVoFLawCA=
X-Gm-Message-State: AOJu0YwSFocFWbsR/svfjVdX5X2w0t2LqWT3ykyREOWcDwijZd4u1zrl
	M/IVkreCLpPb65sRmhdWv2P546qFH/V3I2xausjAOqq3U5LZYa8z
X-Google-Smtp-Source: AGHT+IGpmgVVWhDU6L0Eg9bKaM5Un6mfYJKGEM6lzS/aXInSUCuH83Z2b5aWXKfw/hIZ/mcUBgHX5w==
X-Received: by 2002:adf:e507:0:b0:367:4165:ad4 with SMTP id ffacd0b85a97d-36741650be0mr3754348f8f.16.1719573494282;
        Fri, 28 Jun 2024 04:18:14 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3675a1055b9sm1979495f8f.95.2024.06.28.04.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 04:18:13 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v2 2/2] dt-bindings: clock: mediatek: add syscon compatible for mt7622 pciesys
Date: Fri, 28 Jun 2024 12:55:41 +0200
Message-ID: <20240628105542.5456-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240628105542.5456-1-ansuelsmth@gmail.com>
References: <20240628105542.5456-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_041816_217686_02152929 
X-CRM114-Status: GOOD (  11.36  )
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

Add required syscon compatible for mt7622 pciesys. This is required for
SATA interface as the regs are shared.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
Changes v2:
- Fix broken schema example

 .../bindings/clock/mediatek,mt7622-pciesys.yaml        | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt7622-pciesys.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt7622-pciesys.yaml
index c77111d10f90..9c3913f9092c 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,mt7622-pciesys.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt7622-pciesys.yaml
@@ -14,9 +14,11 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - mediatek,mt7622-pciesys
-      - mediatek,mt7629-pciesys
+    oneOf:
+      - items:
+          - const: mediatek,mt7622-pciesys
+          - const: syscon
+      - const: mediatek,mt7629-pciesys
 
   reg:
     maxItems: 1
@@ -38,7 +40,7 @@ additionalProperties: false
 examples:
   - |
     clock-controller@1a100800 {
-        compatible = "mediatek,mt7622-pciesys";
+        compatible = "mediatek,mt7622-pciesys", "syscon";
         reg = <0x1a100800 0x1000>;
         #clock-cells = <1>;
         #reset-cells = <1>;
-- 
2.45.1


