Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D95C83F26
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Jul 2025 22:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SW20ypPIfCwWzDyApEVu137flF7JF7gBm3arCQYvIbI=; b=fBKq/ZhJkd1m8/Bq4GB/BwRqvL
	nvFcYKe9AGWWOMfq+FcWzYWmqxYkR6ALzis/UjowM96agM6e4/g7nTVTE1SjRiYVhWCvsHVeCRyPa
	qKYySjv2GhT3reZCZDV5vXhPiOG+4a1Ge2KKNy3nrMHdcr741wBBtfP6U1oQVejzmllDktfPjKim7
	YIIOHtYgjCIiVIofYDu+fIPWS4BlJE/mxmbLaLlszBuPfj94w3I8BrCUEexnpvbaxyVynHOhJFGDE
	4YaK9qQ6KXPeC3jYJmLAWSxQlociLHThORg91+Y/gYlvSCFyX7VEKGkixTgpLMdDlPIb0r9HZ06tM
	6OKO5vgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugVvc-0000000FUfO-1RdF;
	Mon, 28 Jul 2025 22:02:40 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugVt8-0000000FUWW-3WGy
	for linux-mediatek@lists.infradead.org;
	Mon, 28 Jul 2025 22:00:08 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-3e3d2ad9180so12508005ab.1
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Jul 2025 15:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753740006; x=1754344806; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SW20ypPIfCwWzDyApEVu137flF7JF7gBm3arCQYvIbI=;
        b=HDijcqgIFAmw1XKnQ8hC7cm5Tyltl97TkZgNlmTZmZ7FIOMcZd+sM1qG3kURg7RkGQ
         1vixRNb0qw5/ObHKWjCGOhMNMxT5Eyznjxu+ASD/66XOrRfHDIK8Gkp0xfOlihY5IWKX
         eA4oLTYMmPcSBbnJF2a632QzmC6CDEt4b9Zu0524Ew1pIc/0eVIhzouKs6W1kInphTXa
         O1heLTW8Drjes6mjBo32Xc/JvItgzJFboHFciG6/ZH7hTnTHghCv/FOZ0pgCk6ZYMkbo
         CZyzB8nkTpbm+JIoV7+0J2SUQwwYCpr/FUAQb5X0zHcH21ynszcl+JW9IYuL9+/fEHjD
         EEsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753740006; x=1754344806;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SW20ypPIfCwWzDyApEVu137flF7JF7gBm3arCQYvIbI=;
        b=RlyW2IImIkGgT9moes//YHOX8lSSBvU+UNJ5red9BFC/mtYq2N899Dzy6hBtBaCMyR
         GMMeCdR3is4Np/5rAOf8+NcFOc9YNCVEDWTY+C6V357JcPIpX6OZRaQnU935Cg6v/V+u
         GhibqHmILmhOrJpRobJ2pFeRMGDuqu5rLwJRa/5Ukc9wQWOaov5NZw4T5vkdb6pBJmzJ
         Tny3c7gcDKkMC2RyLRNnDl8gmWNemQ3Hyu9OUM5TP+/yjlMfj2yPF5AcdKzjXP6VEJ9P
         Ueuyhl1UH60tWxLQsUBXa7vhl/eXN6eWBbt9ZilreQsdHYptDws2jhNmBjoypcw9jvuJ
         K+hQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPTdXksA6F5ZGe9Wt1VK9HUwTdgE9dYbVseiiJgUUz9rT921O7FuUnYxqU3wP/xvLwra5OxbpS2Y8+VKQ1Tw==@lists.infradead.org
X-Gm-Message-State: AOJu0YySJNP/CAUeGvi/FJQbn2MtU8+8ij+ZClQpo0ZRE1YZ/yjLvymX
	O8pb/bF/O99+b1R/7mSv30bp7XDYrP4iR1+FPWyL30mp6DuGVw9sAfIBLon9iCE3BQU=
X-Gm-Gg: ASbGncsqNDYHfRwdVwAm/AnflVULAB5iZw65EZokjNFbveNow1yVQkJyVwh3Hz1bCFQ
	ayWxQmPC7g1meJxaL9iA98SZQbouwNIO2yWfGIiCXJ55wUdn8+efbU2inuWUQpeNClCTLZOYlWc
	MJ2nYUvQTgcKtl1dOorPFbkkRng1cRQeHOYQvmqTr/RCFVa0DY/tSgKVAEktBN+l4XxrRJ82J0t
	BDFDaoQ/B1Z6WTih29hg86tnvoKY2gdvhqGmgNFNcDagVz4+fjtdNdWha5cO2eAhvpvXn6+Xw7s
	WIuunJuKlydvsow7acaVIxml7hfhXWhItjeuw6gpyTxXmHC0lhpLhwmaojxCXt67d+3YoAIQ3p1
	+q8WZw0d38rY8CLGyEXIsxbv6bq/MTQTuu/eftcIcjSESSTZmQrmRc8QDQkvosfDzWg==
X-Google-Smtp-Source: AGHT+IEInGF/Uihao86Df5Hh8l2S/n6kOMKGVWM1LdBNeEbSuGAD9Xt1OLU4ny9gFPGHVpMlKG5tfQ==
X-Received: by 2002:a05:6e02:1d98:b0:3e3:d185:9163 with SMTP id e9e14a558f8ab-3e3d185932fmr133375445ab.20.1753740005684;
        Mon, 28 Jul 2025 15:00:05 -0700 (PDT)
Received: from zippy.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-508c91c9fdfsm2167331173.4.2025.07.28.15.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 15:00:05 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@gentoo.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	lkundrak@v3.sk
Cc: devicetree@vger.kernel.org,
	linux-serial@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] dt-bindings: serial: 8250: allow "main" and "uart" as clock names
Date: Mon, 28 Jul 2025 17:00:01 -0500
Message-ID: <20250728220002.599554-1-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_150006_965720_7680008A 
X-CRM114-Status: GOOD (  10.88  )
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

There are two compatible strings defined in "8250.yaml" that require
two clocks to be specified, along with their names:
  - "spacemit,k1-uart", used in "spacemit/k1.dtsi"
  - "nxp,lpc1850-uart", used in "lpc/lpc18xx.dtsi"

When only one clock is used, the name is not required.  However there
are two places that do specify a name:
  - In "mediatek/mt7623.dtsi", the clock for the "mediatek,mtk-btif"
    compatible serial device is named "main"
  - In "qca/ar9132.dtsi", the clock for the "ns8250" compatible
    serial device is named "uart"

In commit d2db0d7815444 ("dt-bindings: serial: 8250: allow clock 'uartclk'
and 'reg' for nxp,lpc1850-uart"), Frank Li added the restriction that two
named clocks be used for the NXP platform mentioned above.  Extend that
so that the two named clocks used by the SpacemiT platform are similarly
restricted.

Add "main" and "uart" as allowed names when a single clock is specified.

Fixes: 2c0594f9f0629 ("dt-bindings: serial: 8250: support an optional second clock")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202507160314.wrC51lXX-lkp@intel.com/
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../devicetree/bindings/serial/8250.yaml      | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
index e46bee8d25bf0..cef52ebd8f7da 100644
--- a/Documentation/devicetree/bindings/serial/8250.yaml
+++ b/Documentation/devicetree/bindings/serial/8250.yaml
@@ -61,11 +61,17 @@ allOf:
             - const: uartclk
             - const: reg
     else:
-      properties:
-        clock-names:
-          items:
-            - const: core
-            - const: bus
+      if:
+        properties:
+          compatible:
+            contains:
+              const: spacemit,k1-uart
+      then:
+        properties:
+          clock-names:
+            items:
+              - const: core
+              - const: bus
 
 properties:
   compatible:
@@ -162,6 +168,9 @@ properties:
     minItems: 1
     maxItems: 2
     oneOf:
+      - enum:
+          - main
+          - uart
       - items:
           - const: core
           - const: bus

base-commit: 0b90c3b6d76ea512dc3dac8fb30215e175b0019a
-- 
2.48.1


