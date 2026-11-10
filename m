Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDDBA60A2606
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 17:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b//aPmJD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=GEmhqoKBqwQlH70Y7aS0Pdx89Lkc5hycHMCshw3pUM8=; b=b//aPmJDO/2+SH4XGqB36sXWQ/
	Nonlk0hqwiQ+4S0QTCmAmA6Hnk60KAFnFiVCUmqlZZ44mOMsN3t1ctvEjguB+QrBnKZtJ4xDqeEM/
	op8BBgdqru19S8yIrK2WQFqE9epLMkuTHjGARctszIZQ+rb1/G6HWLchSpmR9oFaCf83pGXe4PlIM
	Gta7HiMC8VaPWEszDYJEBJj6MlyJEnLGNYqIYZL7XvtYAV1DOWm3YW/0adWQXV+bbNQ2+UmTk7lOD
	T4f1uukSidVBWF944zkPvevZkyP9huUSz05sCB319LXikjfUgTWr9y3COX/78Bd/FoJBPl41k2jaK
	PSAQF2Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQpXn-00000004fYJ-10Ax;
	Tue, 10 Nov 2026 17:22:03 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQpXj-00000004fVu-4AmD;
	Tue, 10 Nov 2026 17:22:01 +0000
Received: from [2a04:4540:1403:9bfc:b113:5373:d0ec:2ad1] (helo=bertha10..)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <john@phrozen.org>)
	id 1xQpXU-001C99-0U;
	Tue, 10 Nov 2026 18:21:44 +0100
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
Subject: [PATCH 0/3] arm64: dts: airoha: add AN7589 support
Date: Tue, 10 Nov 2026 18:21:40 +0100
Message-Id: <20261110172143.296304-1-john@phrozen.org>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_092200_033423_BD7E2866 
X-CRM114-Status: UNSURE (   9.03  )
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


