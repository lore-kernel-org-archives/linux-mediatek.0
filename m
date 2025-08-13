Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 039DDCA0EC4
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Aug 2025 03:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8PhVQGmNNzCiMu9pw3hx+9YH1Eu7sHoNmFIOK1HnGfI=; b=3BYXbaXmH/NoittZNETrbHyTxO
	qTtparShzidGPj/o8vt4czfUAibbAWRgf96IKMB7KwIolngitVVzsx66+PPi1buzB47IliED/lv2f
	k5FOQilJhLOPBywtEF4XMx7m8ecsoeU4rHvY/j23Zr432ZhNd8u1qnlwlOhiAvMQwMSJgCG8GDMxh
	CgUfPaTRe0FvS/eI5z1hzMkEzfsSZb23xZr6KokCTUu1agvPrAzwAZFX8EqKJoyTyF/cvwVIFFlkR
	JJVUwOuXWY7cFUcYlX7/4rEQYfhjRAB7+kc9KchLbthuaovcQTMrkqNdtcd+X2Bqrfts6bJ1xNEiF
	92aYyfng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um1vs-0000000CUlv-49ex;
	Wed, 13 Aug 2025 03:13:44 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um1vq-0000000CUkP-2ONc
	for linux-mediatek@lists.infradead.org;
	Wed, 13 Aug 2025 03:13:43 +0000
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-3e55b170787so2614795ab.1
        for <linux-mediatek@lists.infradead.org>; Tue, 12 Aug 2025 20:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755054821; x=1755659621; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8PhVQGmNNzCiMu9pw3hx+9YH1Eu7sHoNmFIOK1HnGfI=;
        b=PnMnonRbSACDqRAuvGpnYXYwd09bd90Qy4lgJVxoihZgqRj6f6r2JqBgNbOL8AXMQ+
         Sq5M2DZ/xzOEcerc2kYbAhdcgnpZozII872m19JyfBZlWlC4et2q7RDgHr241USUPTTz
         KGod6QvCtfXHvFX9k9gyVO+CyS7BZ7CUvErDqzQ/7UFqkLcAz2mgdM0dcDTXvG7NDI+6
         cORjCOl1gwywiGibGkxHq+oB7T4Dt6eYJfeogmfgLJk4b6RoBFYXeayrrJtTrkIcUGQ3
         5Cy2CN5DJQgb/XMco/gIsGuAAr5e9xufOXBLzKegY/vFSLk8NyIjmN9Bfkp2dsjlEPMd
         ITLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755054821; x=1755659621;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8PhVQGmNNzCiMu9pw3hx+9YH1Eu7sHoNmFIOK1HnGfI=;
        b=nj9ZNP1mdLulceftZqTENGOvY/mZVblsyo3VLqm9xpulGq9+Lsz02Z//JGHkGGo3Rr
         mylOkPFErynvpzgQFs8radZCKI2y3P0AG65s5VDf+XiJeTHt5kvRo9AA/cduALq4wmeN
         KhyTAp+ZU6JekfMQ02ZUgyeUxdBIRc/0v9tvWv3lydyuhkF8Gqyjw4QaK90Y2RtRLw0m
         02sSqzC+DaE5QUhDPh16uDYrqZtOaUpNDChkFSNsn3u0WqVY/4dFC6XrZWCT84U/gcrz
         FySYpFyMf/8fbl4SQBJuxZZipBsQHPwcRiwKKBbicgznbFec1iUL7N5l1ANKV+OVqu1i
         HMXg==
X-Forwarded-Encrypted: i=1; AJvYcCXuqIpTjWpbdVA/HvOf2gEmNE1FXoz0d3GvPUtIvSMFOT5CHJXvjoRDI8mEQ7aWqC68xiDpFgqeYz58ajtmSw==@lists.infradead.org
X-Gm-Message-State: AOJu0YztiUd8eYHRgz7XGMyP6nO2dkylGzR3XpOkiYDzxTGx+NVqhoY6
	exTqDro5SytvWsUSYskN5tgpF/AP3RciTbiSX6qmbx2jD42o5tNem69TDmY0OEoPUjM=
X-Gm-Gg: ASbGncsb9UP6PvN0OXq/lFKxe3t6x9m1ODgj2/zmeX3m36YoDe/vuGUCm7h1bhjQAEG
	pOdb8M87fbGIVU1QeqwjCc5fH/t5yE/rlnr6G/ADKDIz9arRGXwoJg1ki4ibdxCKI1r3sqjGJZM
	uniu8Bxw5MGP4ZT5VJvuKTn2wjAvsWMnbrHx4raJZ9O/OuwoF0+9gnsUmyuqB1M2QOVMAcwBBbz
	teHTa9M/Clem91FDJDYdiTzjjxAyQZK0nrv2gqMi4WpC09VtqoPynVNY4g+mBh14LMSruIRLwyJ
	OTib9I4QrRfvPt3CC3Z9TnjrSZ9Yl+O2lQU7j6R5Dnc1GOrcnrPVYrtHRbIG9Xb06Vu287ayR09
	jHeL5n+fXx8XLC4BryU098p9CzgCe7v0C0s1rLSI1uTniokz7Sr1lNS/UNWx1kFDNvA==
X-Google-Smtp-Source: AGHT+IHJ3cV6K51nVGXbggkk4n0mggTrNvjqK58YjsUKI/uGamOMw1V+7ccv0fj3Is/jMTtEld3VjA==
X-Received: by 2002:a92:ca07:0:b0:3e5:55b7:1eb5 with SMTP id e9e14a558f8ab-3e5685ab4f6mr13673995ab.11.1755054821496;
        Tue, 12 Aug 2025 20:13:41 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50ae9bcfecbsm3616330173.62.2025.08.12.20.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 20:13:41 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org
Cc: dlan@gentoo.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	lkundrak@v3.sk,
	devicetree@vger.kernel.org,
	linux-serial@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v2] dt-bindings: serial: 8250: allow "main" and "uart" as clock names
Date: Tue, 12 Aug 2025 22:13:35 -0500
Message-ID: <20250813031338.2328392-1-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_201342_609637_A3097A84 
X-CRM114-Status: GOOD (  12.11  )
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

In commit d2db0d7815444 ("dt-bindings: serial: 8250: allow clock
'uartclk' and 'reg' for nxp,lpc1850-uart"), Frank Li added the
restriction that two named clocks be used for the NXP platform
mentioned above.

Change that logic, so that an additional condition for (only) the
SpacemiT platform similarly restricts the two clocks to have the
names "core" and "bus".

Finally, add "main" and "uart" as allowed names when a single clock is
specified.

Fixes: 2c0594f9f0629 ("dt-bindings: serial: 8250: support an optional second clock")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202507160314.wrC51lXX-lkp@intel.com/
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 Documentation/devicetree/bindings/serial/8250.yaml | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
index e46bee8d25bf0..0a05a1647b5cc 100644
--- a/Documentation/devicetree/bindings/serial/8250.yaml
+++ b/Documentation/devicetree/bindings/serial/8250.yaml
@@ -60,7 +60,12 @@ allOf:
           items:
             - const: uartclk
             - const: reg
-    else:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: spacemit,k1-uart
+    then:
       properties:
         clock-names:
           items:
@@ -162,6 +167,9 @@ properties:
     minItems: 1
     maxItems: 2
     oneOf:
+      - enum:
+          - main
+          - uart
       - items:
           - const: core
           - const: bus

base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
-- 
2.48.1


