Return-Path: <SRS0=oIsV=74=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31897C433E2
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jun 2020 07:59:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3828206D7
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jun 2020 07:58:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RzA1o9pP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3828206D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=asem.it
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wsOhvbTYSXUy33cSEtTVv5h6yCyL2NsydvuFcw5G8CE=; b=RzA1o9pPImxAyB
	QXaRd1nFEjsvBORACES019VG/S3AG6uXEQ7Hx8pDREPO4IvP3+x38cm5+hfg6ggMy2aR6faEsVAvF
	FwQ/E40DlBGDz0TVJZyoofRr5U26iZ1OZr2YaO+YzHzLeUHKGsnM+AFzp4noQx1lxgKJsDYOaoW4L
	s+CnkxF1kHWLs30oM1KeWfgHXph8t4ciuLg4xRMgmBBMPzlaj3EbDvx4qr3zfWUZHHYI3L2DxLCSh
	GdfEHsLR6yjDvG530fQOW5DV4sH3teP/AHR44eWBDLzIHtZ/Bep7kQpGG/RKgGyLSkBJAZ0K8DV6H
	cXZinFscD0+u9h4JZrgA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jkk14-000461-Ac; Mon, 15 Jun 2020 07:58:50 +0000
Received: from smtp.asem.it ([151.1.184.197])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jkk11-000436-3H
 for linux-mediatek@lists.infradead.org; Mon, 15 Jun 2020 07:58:49 +0000
Received: from webmail.asem.it by asem.it (smtp.asem.it)
 (SecurityGateway 6.5.2) with ESMTP id SG000317057.MSG 
 for <linux-mediatek@lists.infradead.org>; Mon, 15 Jun 2020 09:58:39 +0200S
Received: from ASAS044.asem.intra (172.16.16.44) by ASAS044.asem.intra
 (172.16.16.44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 15
 Jun 2020 09:58:37 +0200
Received: from flavio-x.asem.intra (172.16.17.208) by ASAS044.asem.intra
 (172.16.16.44) with Microsoft SMTP Server id 15.1.1979.3 via Frontend
 Transport; Mon, 15 Jun 2020 09:58:37 +0200
From: Flavio Suligoi <f.suligoi@asem.it>
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Jason
 Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>, Guo Ren
 <guoren@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH v1] doc: devicetree: bindings: fix spelling mistake
Date: Mon, 15 Jun 2020 09:58:35 +0200
Message-ID: <20200615075835.15202-1-f.suligoi@asem.it>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-SGHeloLookup-Result: pass smtp.helo=webmail.asem.it (ip=172.16.16.44)
X-SGSPF-Result: none (smtp.asem.it)
X-SGOP-RefID: str=0001.0A09020A.5EE72A2D.0065, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0 (_st=1 _vt=0 _iwf=0)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200615_005847_326117_2872EA13 
X-CRM114-Status: UNSURE (   7.65  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Flavio Suligoi <f.suligoi@asem.it>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Fix typo: "triger" --> "trigger"

Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
Acked-by: Guo Ren <guoren@kernel.org>
---

v1: add Acked-by: Guo Ren <guoren@kernel.org>

 Documentation/devicetree/bindings/gpio/mediatek,mt7621-gpio.txt | 2 +-
 .../devicetree/bindings/interrupt-controller/csky,mpintc.txt    | 2 +-
 Documentation/devicetree/bindings/timer/csky,mptimer.txt        | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/mediatek,mt7621-gpio.txt b/Documentation/devicetree/bindings/gpio/mediatek,mt7621-gpio.txt
index ba455589f869..e1c49b660d3a 100644
--- a/Documentation/devicetree/bindings/gpio/mediatek,mt7621-gpio.txt
+++ b/Documentation/devicetree/bindings/gpio/mediatek,mt7621-gpio.txt
@@ -12,7 +12,7 @@ Required properties for the top level node:
    Only the GPIO_ACTIVE_HIGH and GPIO_ACTIVE_LOW flags are supported.
 - #interrupt-cells : Specifies the number of cells needed to encode an
    interrupt. Should be 2. The first cell defines the interrupt number,
-   the second encodes the triger flags encoded as described in
+   the second encodes the trigger flags encoded as described in
    Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
 - compatible:
   - "mediatek,mt7621-gpio" for Mediatek controllers
diff --git a/Documentation/devicetree/bindings/interrupt-controller/csky,mpintc.txt b/Documentation/devicetree/bindings/interrupt-controller/csky,mpintc.txt
index e13405355166..e6bbcae4d07f 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/csky,mpintc.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/csky,mpintc.txt
@@ -10,7 +10,7 @@ Interrupt number definition:
  16-31  : private  irq, and we use 16 as the co-processor timer.
  31-1024: common irq for soc ip.
 
-Interrupt triger mode: (Defined in dt-bindings/interrupt-controller/irq.h)
+Interrupt trigger mode: (Defined in dt-bindings/interrupt-controller/irq.h)
  IRQ_TYPE_LEVEL_HIGH (default)
  IRQ_TYPE_LEVEL_LOW
  IRQ_TYPE_EDGE_RISING
diff --git a/Documentation/devicetree/bindings/timer/csky,mptimer.txt b/Documentation/devicetree/bindings/timer/csky,mptimer.txt
index 15cfec08fbb8..f5c7e99cf52b 100644
--- a/Documentation/devicetree/bindings/timer/csky,mptimer.txt
+++ b/Documentation/devicetree/bindings/timer/csky,mptimer.txt
@@ -8,7 +8,7 @@ regs is accessed by cpu co-processor 4 registers with mtcr/mfcr.
  - PTIM_CTLR "cr<0, 14>" Control reg to start reset timer.
  - PTIM_TSR  "cr<1, 14>" Interrupt cleanup status reg.
  - PTIM_CCVR "cr<3, 14>" Current counter value reg.
- - PTIM_LVR  "cr<6, 14>" Window value reg to triger next event.
+ - PTIM_LVR  "cr<6, 14>" Window value reg to trigger next event.
 
 ==============================
 timer node bindings definition
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
