Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5875460A261C
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2026 09:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xqG/NT9Q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=hzoAA8suBfAH96OxtCvb1EidrQYp2xqds7CuCam9eJU=; b=xqG/NT9Q7v6SqBm9oXBob2wZHu
	xfRYmYJH/3v2fz7WtVvTRUNGmvl1MytMPcQ6S4Mn0JnjnddZztKGdXxf0ILKJPdUjdzv8w8wqJVWA
	Gmob2O3vZhqpOqxypVysc96wnT9v7XlSjJ4HxsWLluSaIN6T15Eq0C//l1L5FASDhSI9plCb2VoZt
	iE3xMr+p+/ACG7gKLA6Ov5kXYGAxJCUq2VdYbnODjb7HOE7EPXOnl9mbhv1OCS2vM9SFf1ZeLbtt4
	SiznVxi8UDqxWJf8HhFO8pjCE6To1c8CY2Z/MqbOqzzsnTt9LPTnjtMmEra3HMLl6HgV2h/Yn8Nfj
	rXg/p8Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVn1r-000000065fO-2hPk;
	Tue, 24 Nov 2026 09:41:35 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVn1e-000000065Qh-2VQb
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Nov 2026 09:41:25 +0000
Received: from [2a04:4540:1403:dffc:4a09:a431:737f:f29f] (helo=bertha10..)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <john@phrozen.org>)
	id 1xVn1L-007e57-2l;
	Tue, 24 Nov 2026 10:41:03 +0100
From: John Crispin <john@phrozen.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Ahmed Naseef <naseefkm@gmail.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Christian Marangi <ansuelsmth@gmail.com>,
	devicetree@vger.kernel.org,
	lei.dong@airoha.com,
	Linqi.zhang@airoha.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	mfd@lists.linux.dev,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Rajeev.kumar@airoha.com,
	upstream@airoha.com,
	Weifeng.xu@airoha.com,
	zhengping.zhang@airoha.com
Subject: [PATCH v4 0/9] pinctrl: airoha: add AN7589 support
Date: Tue, 24 Nov 2026 10:40:50 +0100
Message-Id: <20261124094059.3882014-1-john@phrozen.org>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_014122_636096_1D556094 
X-CRM114-Status: GOOD (  14.32  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Airoha AN7589 has a GPIO controller like the EN7581 one, with a
third bank for 74 GPIOs in total. Its pin functions are selected
differently: a separate IOMUX block holds a 4 bit mode field per pin,
eight pins per register, and mode 0 makes any pin a GPIO.

The first four patches prepare the shared driver and change nothing
for the SoCs it serves today:

 1. The GPIO register layout moves into the match data, so a SoC can
    describe more than 64 pins.
 2. A function group can carry one IOMUX mode per pin. A SoC
    describes its IOMUX in the match data: the width of the mode
    field and, from patch 4, the mode that makes a pin a GPIO.
 3. The chip SCU becomes optional, as the AN7589 needs none.
 4. A pin requested by gpiolib is put into GPIO mode through the
    IOMUX, so no per pin gpio function is needed.

Patch 5 adds the IOMUX to the syscon compatibles. Patch 6 adds the
binding for the pin controller. Patch 7 adds the binding for the GPIO
system controller it sits under, which also holds the PWM controller.
Patch 8 moves the GPIO register offsets to the common header, so the
AN7589 data can describe its own register table, with no functional
change. Patch 9 adds the AN7589 pin data.

The series applies to next-20261123 and has no dependencies.

Changes in v4:
- Patch 6: limit the pins of a conf node to 12, the size of the
  largest pin group (Conor).
- Patch 7: the commit message no longer names the PWM controller a
  second child, as it gets no child node (Conor).
- Add the Acked-by of Conor to patches 5 and 7.
- Link to v3: https://lore.kernel.org/r/20261116174854.342912-1-john@phrozen.org

Changes in v3:
- Split the bindings in three: the syscon compatible (patch 5), the
  pin controller (patch 6) and the GPIO system controller (patch 7)
  (Lee, Conor).
- Patch 6: allow one group per node, except for pcm_spi and pcie,
  whose groups carry different signals of one device. Fix the uart5
  example (Conor).
- Patch 7: name the PWM controller in the commit message (Conor).
- Add the Reviewed-by of Lorenzo to patches 3 and 9.
- Link to v2: https://lore.kernel.org/r/20261112185941.1316112-1-john@phrozen.org

Changes in v2:
- Patch 3: look up the airoha,chip-scu phandle before the check for
  a chip SCU compatible (Lorenzo).
- Patch 6: one function per block type (uart, i2c, spi, pcm, mdio,
  pcie, pon, sgpio, jtag), with the group selecting the instance, as
  in the other Airoha pin controller bindings. List the valid groups
  for the groups property (Conor).
- Patch 9: the function table follows the binding. Name the match
  data, the OF match table and the platform driver after the AN7589
  (Lorenzo).
- Link to v1: https://lore.kernel.org/r/20261110173941.301478-1-john@phrozen.org


John Crispin (9):
  pinctrl: airoha: make gpio register layout per SoC
  pinctrl: airoha: add per pin mode field mux
  pinctrl: airoha: make the chip SCU optional
  pinctrl: airoha: mux a requested GPIO through the IOMUX
  dt-bindings: mfd: syscon: add airoha,an7589-iomux
  dt-bindings: pinctrl: airoha: add AN7589
  dt-bindings: mfd: airoha: add AN7589 GPIO system controller
  pinctrl: airoha: move the GPIO register offsets to the common header
  pinctrl: airoha: add support of an7589 SoC

 .../mfd/airoha,an7589-gpio-sysctl.yaml        |  66 ++
 .../devicetree/bindings/mfd/syscon.yaml       |   1 +
 .../pinctrl/airoha,an7589-pinctrl.yaml        | 355 ++++++++++
 MAINTAINERS                                   |   3 +
 drivers/pinctrl/airoha/Kconfig                |  11 +
 drivers/pinctrl/airoha/Makefile               |   1 +
 drivers/pinctrl/airoha/airoha-common.h        |  41 +-
 drivers/pinctrl/airoha/pinctrl-airoha.c       | 119 +++-
 drivers/pinctrl/airoha/pinctrl-an7563.c       |   1 +
 drivers/pinctrl/airoha/pinctrl-an7581.c       |   1 +
 drivers/pinctrl/airoha/pinctrl-an7583.c       |   1 +
 drivers/pinctrl/airoha/pinctrl-an7589.c       | 623 ++++++++++++++++++
 drivers/pinctrl/airoha/pinctrl-en7523.c       |   1 +
 drivers/pinctrl/airoha/pinctrl-en7528.c       |   1 +
 14 files changed, 1193 insertions(+), 32 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/airoha,an7589-gpio-sysctl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/airoha,an7589-pinctrl.yaml
 create mode 100644 drivers/pinctrl/airoha/pinctrl-an7589.c


base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
-- 
2.34.1


