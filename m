Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9724C53210
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Jan 2023 06:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rM0KgNmnSZO7R3K4bUC8tZO+fNWZ9r7BepvZWMal+zk=; b=ihSd64HP3LhKXz0YPsNMuou+kV
	Pszjg6YF4o2g8vwS14+Qk/MAglHwi7IaibBPHIgQhjKQd1Em/7Qshf2gd0ME7LTqAq/gCPnrajOS2
	Pt5HjC3b0PikKaC1Nkl+u/EfV+vg6vNKVaXH/s+dTiCg5yjetdZzlu9g5u7LrGHpFjc7RbgjwjQPN
	B8M4iP7MAXLLg3cxNtimvkRsHhiftij1msla+GStY2wW/jBPsmPvuikv+ik/VY09zpRNgfvthA69H
	tzl2qZdfv7dQyB/rQbSJDbNwyTGxVvS46OIftHVCwj4h1EYHudeqaEb870WvyTlBKO18hJz/cDm4d
	f0ka9MvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCb8T-00HGEQ-JY; Tue, 03 Jan 2023 06:50:57 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCb4R-00HEo7-Gx; Tue, 03 Jan 2023 06:46:51 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3036kIY0020186;
	Tue, 3 Jan 2023 00:46:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1672728378;
	bh=rM0KgNmnSZO7R3K4bUC8tZO+fNWZ9r7BepvZWMal+zk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=VSfNdYV+AmmYXTCI5JFlqecezz8CPZwF7EaIO0QjBB15/IkgtQJ+5LXNhTIsFbPRb
	 3O8JsYIQEzlPd7bsbGy84guLFeXS5QZqlphmysZBcpdcCXXd5xAG1bhYb2YaMd08Ax
	 7bpAklcAh3uVWVxTXZ9gCM9kIXl978b+Fv1gAcDg=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3036kINl005625
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 3 Jan 2023 00:46:18 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 3
 Jan 2023 00:46:18 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 3 Jan 2023 00:46:18 -0600
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3036kH4Q075225;
	Tue, 3 Jan 2023 00:46:17 -0600
From: Aradhya Bhatia <a-bhatia1@ti.com>
To: Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Tomi Valkeinen <tomba@kernel.org>, Jyri
 Sarha <jyri.sarha@iki.fi>,
        David Airlie <airlied@gmail.com>, Daniel Vetter
	<daniel@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime@cerno.tech>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>,
        Lad Prabhakar
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Paul Walmsley
	<paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou
	<aou@eecs.berkeley.edu>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Guo Ren
	<guoren@kernel.org>
CC: DRI Development List <dri-devel@lists.freedesktop.org>,
        Devicetree List
	<devicetree@vger.kernel.org>,
        Linux Kernel List
	<linux-kernel@vger.kernel.org>,
        Linux RISC-V List
	<linux-riscv@lists.infradead.org>,
        Linux ARM Kernel List
	<linux-arm-kernel@lists.infradead.org>,
        Linux Mediatek List
	<linux-mediatek@lists.infradead.org>,
        Linux C-SKY Arch List
	<linux-csky@vger.kernel.org>,
        Nishanth Menon <nm@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>,
        Rahul T R <r-ravikumar@ti.com>, Devarsh Thakkar
	<devarsht@ti.com>,
        Jai Luthra <j-luthra@ti.com>, Jayesh Choudhary
	<j-choudhary@ti.com>,
        Aradhya Bhatia <a-bhatia1@ti.com>
Subject: [RFC PATCH 1/4] dt-bindings: vendor-prefixes: Add microtips
Date: Tue, 3 Jan 2023 12:16:12 +0530
Message-ID: <20230103064615.5311-2-a-bhatia1@ti.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230103064615.5311-1-a-bhatia1@ti.com>
References: <20230103064615.5311-1-a-bhatia1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_224648_221381_0657113B 
X-CRM114-Status: GOOD (  10.05  )
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

Add document vendor prefix for Microtips Technology USA (microtips).

Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 70ffb3780621..516134cbcb3c 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -821,6 +821,8 @@ patternProperties:
     description: Microsoft Corporation
   "^microsys,.*":
     description: MicroSys Electronics GmbH
+  "^microtips,.*":
+    description: Microtips Technology USA
   "^mikroe,.*":
     description: MikroElektronika d.o.o.
   "^mikrotik,.*":
-- 
2.39.0


