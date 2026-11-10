Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41255606B9FB
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 09:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4YCW6AZ/;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=lkNkxeE5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=m2zyjpjCatk61E/s/TP65CRra9P/1L2a4z/kweMtxFE=; b=4YCW6AZ/TT0zo0raDxfAElDUaQ
	JbDpmGHJNYl+nm09NqBDly3iMVJzN5+ey5c+df8mLWUO2Gt1IKZzC8CWeEBt8a2l0HBV4fBze9qnK
	1FbRHDMCTiWmPp878RnB16395tHoW9A8wg/o401fbke70lEQetwlR01qhd+0TPgwK6k4o/9C99j21
	INiidWt/DC8TK9nLNZyB6xodbajp+w9o/jJm6KRYbp+0+ecjlFQsPUJWMTaloR7c/Pg3FgLErfo1U
	odx4/BLGT7lRSOYuHuh33TdUcC4Ghv+jgydqgHZWSUMc0hJOhB2g8X2O2SiCahexHLTX+4yZQD8R3
	xYcu59rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQiOO-00000003Jqu-4B4I;
	Tue, 10 Nov 2026 09:43:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQiOM-00000003JoE-3YX8
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Nov 2026 09:43:52 +0000
X-UUID: 384691dedceb11f1afed4741b24580c9-20261110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=m2zyjpjCatk61E/s/TP65CRra9P/1L2a4z/kweMtxFE=;
	b=lkNkxeE5e5wGoZQwsVIrDFl96hFdWZV6GkZMCzEtNk2DkU6X/yRSLr+wV/LJWq/8Aj2fl1bnp/oyELQBMGfU0a25AdbkPcSfzmy0m27CwxRsMulnWA8do38h0PIzufDoXFnAZX/FSHlIIAvec/u+ZbRvAsbW71QWDbSc+zQwCw4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:e50021c9-5ac7-4d63-883a-017f20871b37,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:3de61766-4b51-4c95-bb1b-80ac6aad9c96,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 384691dedceb11f1afed4741b24580c9-20261110
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <zhengping.zhang@airoha.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 62348018; Tue, 10 Nov 2026 02:43:44 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 10 Nov 2026 17:43:42 +0800
Received: from mediatek.com (172.18.153.129) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.2562.29 via Frontend
 Transport; Tue, 10 Nov 2026 17:43:42 +0800
From: Zhengping Zhang <zhengping.zhang@airoha.com>
To: <linusw@kernel.org>, <lorenzo@kernel.org>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<brgl@kernel.org>, <mikhail.kshevetskiy@iopsys.eu>, <naseefkm@gmail.com>,
	<benjamin.larsson@genexis.eu>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <lei.dong@airoha.com>,
	<ansuelsmth@gmail.com>, Zhengping Zhang <zhengping.zhang@airoha.com>
Subject: [PATCH 00/12]  pinctrl: airoha: configure GPIO muxes explicitly and fix pad mappings
Date: Tue, 10 Nov 2026 17:43:27 +0800
Message-ID: <20261110094339.749110-1-zhengping.zhang@airoha.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_014350_899921_B3728A22 
X-CRM114-Status: GOOD (  12.75  )
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
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series makes GPIO mode selection explicit on AN7581, AN7583 and
EN7523, and fixes related GPIO direction, LED group and SPI/eMMC mux
configuration issues.

Background
----------
GPIO direction and data register programming is separate from pad mux
selection on these SoCs. The current GPIO request path does not select
the GPIO function, relying on the pads already being in an appropriate
state. If the bootloader leaves a pad configured for an alternate
function, a GPIO request can succeed without connecting the GPIO
controller to the pad. Output writes may then fail to drive the pin,
and input reads may not reflect the external signal.
The problem also affects the opposite transition. Once a pad has been
forced to GPIO mode, selecting its peripheral mux without releasing
the GPIO override can leave the peripheral disconnected from the pad.
While addressing these transitions, the series also corrects GPIO
direction programming, AN7581 PHY LED group assignments, AN7583 SPI/eMMC
mux configuration and the EN7523 128-pin PCM SPI CS2 pad assignment.

Implementation
--------------
On these SoCs, shared GPIO pads can be routed to peripheral functions
through mux control bits in the SCU registers. In the absence of an
enabled alternate function, these shared pads normally operate as
GPIOs. Dedicated peripheral pads have separate selectors for GPIO
operation, so clearing all mux bits is not a universal way to select
GPIO mode.

Per-pad force GPIO controls allow individual shared pads to operate
as GPIOs while leaving shared peripheral mode settings intact for
other pads. GPIO-controller PWM output also requires the appropriate
pad routing: selecting ordinary GPIO operation clears the pad's PWM
selection, while PWM operation uses the PWM selection together with
the applicable GPIO routing controls.

The series uses these per-pad controls to configure GPIO mode on
demand. Resetting the IOMUX registers at probe could disrupt interfaces
still using bootloader settings, while clearing shared peripheral
mode bits could affect pads outside the requested group.

The common driver gains a gpio_request_enable callback and identifies
GPIO-category functions through the pinmux core. It finds the matching
single-pin GPIO group using pinctrl pin numbers, including controllers
whose GPIO ranges have a nonzero pin base. GPIO requests and explicit
GPIO pinctrl states apply the same SoC-specific group configuration.

The common code checks for incompatible values of shared mux bits
against GPIO owners and claimed mux groups. Validation and register
updates are serialized, and register update failures are returned to
the caller. GPIO request handling and conflict checks are enabled
through SoC match data.

The SoC-specific changes select GPIO mode as follows:

  - AN7581: GPIO1-31 use SCU 0x228, and GPIO32-46 use 0x22c.
    GPIO47-49 retain their PCIe reset GPIO selectors at 0x21c.
    GPIO1/2 additionally require the I2C/MDIO routing to be disabled.

  - AN7583: GPIO1-31 use SCU 0x228, and GPIO32-38 use 0x22c.
    GPIO39-52 use the dedicated-pad GPIO selectors at 0x21c.

  - EN7523: GPIO0-29 use SCU 0x224. GPIO28/29 also retain their
    existing PCIe reset GPIO selector settings at 0x218.

AN7581 and AN7583 have no documented force GPIO bit for GPIO0; their
GPIO0 configuration clears the existing PWM selection only.

Peripheral group configurations release the corresponding GPIO
overrides when selecting their functions. AN7581 retains its existing
MDIO and PWM configurations; AN7583 and EN7523 also enable the required
GPIO overrides when selecting GPIO-controller PWM output.

The AN7583 and EN7523 PON groups exclude the software-controlled
TX_DIS/RX_DIS pads so they can be requested independently as GPIOs by
the PON PHY driver, avoiding ownership conflicts with PON mux selection.

The bindings describe the expanded GPIO groups and corrected pad
assignments. GPIO numbering and existing compatible strings are retained.
The final patch adds an Airoha co-maintainer and extends the maintained
file patterns to cover the SoC-specific drivers and bindings.

Validation
----------
Tested the PINCTRL functionality on AN7581, AN7583 and EN7523 using OpenWrt
master (backport to kernel 6.18), including build tests and explicit GPIO
requests, with particular attention to GPIO-controlled LEDs.

Daniel Schwierzeck (2):
  pinctrl: airoha: fix setting of GPIO direction
  pinctrl: airoha: an7583: fix SPI pin mux config

Robert Marko (1):
  pinctrl: airoha: an7583: fix eMMC pin mux config

Zhengping Zhang (9):
  pinctrl: airoha: configure pin muxes on GPIO requests
  dt-bindings: pinctrl: airoha: describe all EN7581 GPIO mux groups
  pinctrl: airoha: an7581: fix PHY LED GPIO group assignments
  pinctrl: airoha: an7581: select force GPIO mode on GPIO requests
  dt-bindings: pinctrl: airoha: describe all AN7583 GPIO mux groups
  pinctrl: airoha: an7583: use force GPIO mode for GPIO requests
  dt-bindings: pinctrl: airoha: describe all EN7523 GPIO mux groups
  pinctrl: airoha: en7523: use force GPIO mode for GPIO requests
  MAINTAINERS: add myself as Airoha pinctrl co-maintainer

 .../pinctrl/airoha,an7583-pinctrl.yaml        |  18 +-
 .../pinctrl/airoha,en7523-pinctrl.yaml        |   9 +-
 .../pinctrl/airoha,en7581-pinctrl.yaml        |  28 +-
 MAINTAINERS                                   |   5 +-
 drivers/pinctrl/airoha/airoha-common.h        |  15 +-
 drivers/pinctrl/airoha/pinctrl-airoha.c       | 263 ++++++-
 drivers/pinctrl/airoha/pinctrl-an7581.c       | 629 ++++++++++++---
 drivers/pinctrl/airoha/pinctrl-an7583.c       | 736 ++++++++++++++----
 drivers/pinctrl/airoha/pinctrl-en7523.c       | 579 +++++++++++---
 9 files changed, 1855 insertions(+), 427 deletions(-)


base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
-- 
2.43.0


