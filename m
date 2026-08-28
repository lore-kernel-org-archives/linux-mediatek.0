Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B115C61DBD
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2026 15:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rQup+UUtgEL0yAVMr8c4LZuaauGy5rlbpwT/5caEB14=; b=dbeyxjMpMjYo8J08nV6kHN3spQ
	s5YU8yNlw7tyRKnLZCDAXl3e7JWDao9p4RNcYcWMQpYcMwrZ3n7Rk1JiCu6808PpQdaYQDukXPVOu
	8kaoha+9Ses790NfBLkEhqVP/x4r4kQTK1k/S9ypMJ1DZr8JaRJmnBMEvqc4rWUxriO/IzorGD2Fm
	4KbRREtdIyvJTAWoRzljmgj4NjebBgKObdc6R33uMQr0HgefMbu2WvxtiviumLLCP6Y7Ax2vo/fxp
	94sLH7YpEm+nXM/e+Iqt4J7uL5VSqNAOaC33Ws3+slcfp1G1+IyoyNkmmkTqRDKmGD2Bf9QEJ5ycV
	94QG/i0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzycA-000000066ox-2X3u;
	Fri, 28 Aug 2026 15:35:34 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzyc7-000000066oK-2EMH
	for linux-mediatek@lists.infradead.org;
	Fri, 28 Aug 2026 15:35:32 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2ceab75934dso10895535ad.2
        for <linux-mediatek@lists.infradead.org>; Fri, 28 Aug 2026 08:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787931331; x=1788536131; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rQup+UUtgEL0yAVMr8c4LZuaauGy5rlbpwT/5caEB14=;
        b=S1y0n40cSHtzYBk5d9Iy1UfIKtAhkqGAxvbvVcsiOIR6rw8cONo0WqiIeTCInY07OY
         s4uDDynOqRkOkLeBoJiTRUlyXG7VCAbVf62OqvgAkFKXMhqOHkfvUpkfzsZXkOK1szri
         JN7WgZKWWUyR8w1paYpGMxrYrOJPdiADnnHdItQMDJgA6pTs+GSewzj07vURHEehK+Ez
         9weoG2L7Wu5JkVoGnlMUPRkUq1NGfHEIH9g/G094166zXMzvejqJcxfHTPhMd/lWXo7a
         tWuWy11byo8qyQt97ATPDyDRNZMDCbhbW0AvoDz28uJ+LV/zK57FuI6CraJxX1SQytdj
         f9Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787931331; x=1788536131;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rQup+UUtgEL0yAVMr8c4LZuaauGy5rlbpwT/5caEB14=;
        b=rPwmHV6NZpHJq2r0C3YR2bVfUBO5WsHyGSFZBZnDTNamqa2RmR3ltia0VlvLzYrjq2
         C/VScZER3WADlkRvs+XuKRgbNvzRK0HUTOCC4QHw8VbVPOMM2/MF63CJ18hMRju/mXMm
         YUGl0dSqhqs+cJQYtcs1PnWizSjdkUpmEP42sKKwhs99amT6/ua0QTYzkr+FuCVM3J5s
         j7wJhclufHPM4ViffjpPsm3RFJl2ppHxx0uuD968/pQDKKx7ENrsCOWkt+qKJljERcBJ
         ltY8HLZoQOTC1YQOkgCggLapF8vyUi0faRkxM/k64m4rbKnuf5VDu7oUdq/kHvkWE6Hh
         5Y5g==
X-Forwarded-Encrypted: i=1; AHgh+Ro+qOssaWa6QG93gcqlwRzCuZVLmBaa9DcrycHuIAp8j+slAE7dKc9X2BrOdtx6AWnykjWhJA/YbuSyBxjqtA==@lists.infradead.org
X-Gm-Message-State: AFuF++l16B8zLRH9HdzRbCEh9hb+/d6/mdi6j4R9mpzmgm6U8oTrmrXe
	PmLLLPHxp4dFxG3L/icJX/xYlEycUPEm52flsZ65DeeaEoJzSfEWTFTa
X-Gm-Gg: AR+sD11IPeTdkOqT0YAd6bi3LVVDlbc4kFOez/ygOYEM/JZ1w54j07WXn5kRZFU3L1A
	Ooaz5fJSgFjxzI3kIQiFNgi+AMXQ/blGgV0paeYmHq1VIsigIsPWk2KkKdy0AfEfp7oU13ex+mW
	dimfNEobWUd/ZyD3Z2yyaChGA05eSodfZx4kEV8D3kZSSXuso9fSKowKfCyq7tVG44a7zEXwyCI
	y03idQ43Jt/RGAIsGhcAAaVKCqLogsY+Rdh3ZeGbioVjxJR6og5IRhGUyzTOGBlvq8oS31qlQGZ
	Zd+n+sMp3A7rlUg+osFQj15Zhe603LsFN8qLwCDPI2SWWDlz7bUjjGZUglKTkZsucoHT0SuvlRJ
	/qDvlY5cExmC/pRok1iFOL9+zlLHMnEZjlPDplq70vTuwxWyLFLqot0X6bXzVMGsB5IqR1VhYw0
	ECbzST3YZ1KR6i3ht+4OwPGWu1TYVQKrJlyqVV5VwDO8Rw+Wa91bHjkzjpH7VmpI+5z5L06ReG9
	NFUL5wWFcU=
X-Received: by 2002:a17:903:286:b0:2c8:248a:5dbb with SMTP id d9443c01a7336-2d74dcbe867mr167466245ad.7.1787931330475;
        Fri, 28 Aug 2026 08:35:30 -0700 (PDT)
Received: from DESKTOP-TIT0J8O.dm.ae ([157.51.224.60])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9e2a95sm6256824eec.23.2026.08.28.08.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 08:35:29 -0700 (PDT)
From: Ahmed Naseef <naseefkm@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Ahmed Naseef <naseefkm@gmail.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 0/3] pinctrl: airoha: add EcoNet EN7528 pin controller support
Date: Fri, 28 Aug 2026 19:35:12 +0400
Message-Id: <cover.1787931313.git.naseefkm@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_083531_577286_2ECA5AC0 
X-CRM114-Status: GOOD (  15.04  )
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

The EcoNet EN7528 is a MIPS SoC that uses the same pin controller and GPIO
IP as the Airoha SoCs, so it reuses the shared driver code introduced by
the split into per-SoC drivers. Its register layout differs from every
existing variant though: all IOMUX mode bits live in a single CHIP SCU
register plus a few spill-over bits in IOMUX Control 3, EJTAG has its own
enable register, and every pin configuration register is at a different
offset than on EN7523.

It also differs in a way the shared code did not model: only GPIO0-GPIO15
are wired to the interrupt controller, while the driver assumed all
AIROHA_NUM_PINS GPIOs could raise an interrupt. Patch 1 adds a
num_irq_pins field to the per-SoC match data to describe that, bounds the
interrupt callbacks and handler with it, and feeds it to gpiolib through
gpio_irq_chip::init_valid_mask so gpiod_to_irq() fails up front for a pin
that can never be an interrupt source. All existing SoCs pass
AIROHA_NUM_PINS and are unaffected.

Patch 2 documents the binding, patch 3 adds the driver.

The series is based on linux-pinctrl/for-next, as it depends on the
per-SoC driver split and on the CHIP SCU lookup by "airoha,chip-scu"
phandle that landed there.

Tested on a DASAN H660GM-A (EN7528, Airtel), booting OpenWrt.

Changes in v2:
- 2/3: move patternProperties after properties, and allOf to the end before
  additionalProperties (Krzysztof Kozlowski).
- Rebased on linux-pinctrl/for-next.
- Link to v1:
  https://lore.kernel.org/linux-gpio/cover.1786262697.git.naseefkm@gmail.com/

Ahmed Naseef (2):
  pinctrl: airoha: limit GPIO interrupts to interrupt-capable pins
  dt-bindings: pinctrl: Add EcoNet EN7528 pin controller

Benjamin Larsson (1):
  pinctrl: airoha: add support of en7528 SoC

 .../pinctrl/econet,en7528-pinctrl.yaml        |  190 +++
 drivers/pinctrl/airoha/Kconfig                |   15 +-
 drivers/pinctrl/airoha/Makefile               |    1 +
 drivers/pinctrl/airoha/airoha-common.h        |    3 +
 drivers/pinctrl/airoha/pinctrl-airoha.c       |   33 +-
 drivers/pinctrl/airoha/pinctrl-an7563.c       |    1 +
 drivers/pinctrl/airoha/pinctrl-an7581.c       |    1 +
 drivers/pinctrl/airoha/pinctrl-an7583.c       |    1 +
 drivers/pinctrl/airoha/pinctrl-en7523.c       |    1 +
 drivers/pinctrl/airoha/pinctrl-en7528.c       | 1204 +++++++++++++++++
 10 files changed, 1443 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/econet,en7528-pinctrl.yaml
 create mode 100644 drivers/pinctrl/airoha/pinctrl-en7528.c

Range-diff against v1:
1:  5a7f97adbca7 ! 1:  420a5e385cf7 pinctrl: airoha: limit GPIO interrupts to interrupt-capable pins
    @@ Commit message
         instead of deferring the failure to request_irq().
     
         Signed-off-by: Ahmed Naseef <naseefkm@gmail.com>
    +    Reviewed-by: Benjamin Larsson <benjamin.larsson@genexis.eu>
     
      ## drivers/pinctrl/airoha/airoha-common.h ##
     @@ drivers/pinctrl/airoha/airoha-common.h: struct airoha_pinctrl {
2:  7e6150b186c2 ! 2:  c20005a81b40 dt-bindings: pinctrl: Add EcoNet EN7528 pin controller
    @@ Documentation/devicetree/bindings/pinctrl/econet,en7528-pinctrl.yaml (new)
     +  '#interrupt-cells':
     +    const: 2
     +
    -+allOf:
    -+  - $ref: pinctrl.yaml#
    -+
    -+required:
    -+  - compatible
    -+  - airoha,chip-scu
    -+  - interrupts
    -+  - gpio-controller
    -+  - gpio-ranges
    -+  - "#gpio-cells"
    -+  - interrupt-controller
    -+  - "#interrupt-cells"
    -+
     +patternProperties:
     +  '-pins$':
     +    type: object
    @@ Documentation/devicetree/bindings/pinctrl/econet,en7528-pinctrl.yaml (new)
     +
     +    additionalProperties: false
     +
    ++required:
    ++  - compatible
    ++  - airoha,chip-scu
    ++  - interrupts
    ++  - gpio-controller
    ++  - gpio-ranges
    ++  - "#gpio-cells"
    ++  - interrupt-controller
    ++  - "#interrupt-cells"
    ++
    ++allOf:
    ++  - $ref: pinctrl.yaml#
    ++
     +additionalProperties: false
     +
     +examples:
3:  c3b785d8463e = 3:  ea5b2ce92136 pinctrl: airoha: add support of en7528 SoC

base-commit: d067f0f4c96cb5402a111cf649b7bf9c5771ec74
-- 
2.34.1


