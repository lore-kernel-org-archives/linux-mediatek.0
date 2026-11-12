Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D6A606A31C
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2026 18:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qRktTu6D
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=0GCLapWmIezzyEfrQyi4uMy74mmpvzRuFkK70SRG3GE=; b=qRktTu6DDPQsBlgpR7KTZzNxwH
	Ub9kL1DJBUbft7NUNQNCNBHAmapqCy1LAFUUeFgHRUr7bk+sAtNS8+1eMkwkm+/mgbfdriV/+NQCY
	Cs45qbkUXmk8+IXk++reoxBPHf/xIY1j+Qinb8qWVCOty3nKmBFqnRsF1ctcMXexAecbE7qTI4vqB
	jT+zS2M1JI6T7cyRYP/VDHprJsl2JXF8NTleNajMMnSxWVMnELZ4XMTjU1mti/mgeSi+wdKgpLi8j
	6VxirMH1KjsY52/Yff+u0KZqb83Nk2cdrHrNVmaLwXaa5L5M2q1WNsSAiUI79sTJqm2vZK4e9fcPZ
	IWjbK72Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRZx0-0000000Atbi-3pFM;
	Thu, 12 Nov 2026 18:55:11 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRZwr-0000000AtWs-2DBF;
	Thu, 12 Nov 2026 18:55:04 +0000
Received: from [2a04:4540:1403:f2fc:83ce:6656:246:c906] (helo=bertha10..)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <john@phrozen.org>)
	id 1xRZwj-002XXn-2b;
	Thu, 12 Nov 2026 19:54:53 +0100
From: John Crispin <john@phrozen.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	devicetree@vger.kernel.org,
	Felix Fietkau <nbd@nbd.name>,
	lei.dong@airoha.com,
	Linqi.zhang@airoha.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Rajeev.kumar@airoha.com,
	upstream@airoha.com,
	Weifeng.xu@airoha.com,
	zhengping.zhang@airoha.com
Subject: [PATCH v2 0/3] arm64: dts: airoha: add AN7589 support
Date: Thu, 12 Nov 2026 19:54:43 +0100
Message-Id: <20261112185446.1314808-1-john@phrozen.org>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_105501_702024_C19D9AB9 
X-CRM114-Status: UNSURE (   9.29  )
X-CRM114-Notice: Please train this message.
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

The Airoha AN7589 is a quad Cortex-A73 SoC. This series adds its board
compatibles, a base SoC dtsi with the CPUs, PSCI, the GICv3, the
architected timer and the console UART, and the device tree of the
evaluation board with 2 GiB of DRAM.

The remaining blocks follow with the series of their drivers.

The series applies to next-20261105 and has no dependencies.

Changes in v2:
- Patch 1: add Acked-by of Conor.
- Patch 2: set the size of the GICV region to 0x2000 and order the nodes
  and properties as Documentation/devicetree/bindings/dts-coding-style.rst
  describes.
- Link to v1: https://lore.kernel.org/r/20261110172143.296304-1-john@phrozen.org

John Crispin (3):
  dt-bindings: arm: airoha: add AN7589
  arm64: dts: airoha: add AN7589 SoC dtsi
  arm64: dts: airoha: add AN7589 evaluation board

 .../devicetree/bindings/arm/airoha.yaml       |   4 +
 arch/arm64/boot/dts/airoha/Makefile           |   1 +
 arch/arm64/boot/dts/airoha/an7589-evb.dts     |  22 +++
 arch/arm64/boot/dts/airoha/an7589.dtsi        | 134 ++++++++++++++++++
 4 files changed, 161 insertions(+)
 create mode 100644 arch/arm64/boot/dts/airoha/an7589-evb.dts
 create mode 100644 arch/arm64/boot/dts/airoha/an7589.dtsi


base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
-- 
2.34.1


