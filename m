Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8801460A2626
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2026 19:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y84OkyZh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=oX9WJwyLz5UhhyuAKKsYqcUYIJ/Hapm54bh6HW3658k=; b=Y84OkyZhIVpeulsXLVy9p+qLaI
	tOFUv/72BacHMVCgij9jmEAM/ptzPFZS37EbraHJVCAqbBHaNEgEQaZDDEc6HEyE3vMDh45y5DaSe
	o+IUYRa3kyxohhIadODgn68KZP7aJmVh2OdvtPgGsN+sk2Ac1uaX8t5dwP4wBNc4YhV/HvpsBmPV2
	MOiZba94g3befXTVMwMwCP0RxSjjc5wxlT7L3lsGitHcUn7X/DE2p8mgPV9ZADCJs3nUddVTPX+N2
	kFSYFsGMkvwwAGQVLdPNpJpCj9RbybnpmGyJzwWTg1LAWn8MLv58GaFGoRjBv6FWKQrDU1UWRSBEk
	TdSq5aBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRa1g-0000000AuPS-2lTB;
	Thu, 12 Nov 2026 19:00:00 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRa1b-0000000AuKP-2GGo
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Nov 2026 18:59:57 +0000
Received: from [2a04:4540:1403:f2fc:83ce:6656:246:c906] (helo=bertha10..)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <john@phrozen.org>)
	id 1xRa1T-002Xgt-2z;
	Thu, 12 Nov 2026 19:59:47 +0100
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
Subject: [PATCH v2 0/7] pinctrl: airoha: add AN7589 support
Date: Thu, 12 Nov 2026 19:59:34 +0100
Message-Id: <20261112185941.1316112-1-john@phrozen.org>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_105955_707544_0ED9C12F 
X-CRM114-Status: GOOD (  12.42  )
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

Patch 5 adds the bindings for the pin controller and the GPIO system
controller it sits under. Patch 6 moves the GPIO register offsets to
the common header, so the AN7589 data can describe its own register
table, with no functional change. Patch 7 adds the AN7589 pin data.

The series applies to next-20261105 and has no dependencies.

Changes in v2:
- Patch 3: look up the airoha,chip-scu phandle before the check for
  a chip SCU compatible (Lorenzo).
- Patch 5: one function per block type (uart, i2c, spi, pcm, mdio,
  pcie, pon, sgpio, jtag), with the group selecting the instance, as
  in the other Airoha pin controller bindings. List the valid groups
  for the groups property (Conor).
- Patch 7: the function table follows the binding. Name the match
  data, the OF match table and the platform driver after the AN7589
  (Lorenzo).
- Link to v1: https://lore.kernel.org/r/20261110173941.301478-1-john@phrozen.org

John Crispin (7):
  pinctrl: airoha: make gpio register layout per SoC
  pinctrl: airoha: add per pin mode field mux
  pinctrl: airoha: make the chip SCU optional
  pinctrl: airoha: mux a requested GPIO through the IOMUX
  dt-bindings: pinctrl: airoha: add AN7589
  pinctrl: airoha: move the GPIO register offsets to the common header
  pinctrl: airoha: add support of an7589 SoC

 .../mfd/airoha,an7589-gpio-sysctl.yaml        |  66 ++
 .../devicetree/bindings/mfd/syscon.yaml       |   1 +
 .../pinctrl/airoha,an7589-pinctrl.yaml        | 354 ++++++++++
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
 14 files changed, 1192 insertions(+), 32 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/airoha,an7589-gpio-sysctl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/airoha,an7589-pinctrl.yaml
 create mode 100644 drivers/pinctrl/airoha/pinctrl-an7589.c


base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
-- 
2.34.1


