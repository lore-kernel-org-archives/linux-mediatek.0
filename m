Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB55EC2BD09
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jun 2024 08:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/hFeqgQnbfTX3UPFkZWOlRRgcv77LFblBgWDVRgcw3g=; b=z3De0yWkdXhFR5p690+v6CxFQA
	ad1RXf47/VmdFLOn5HNaSeOY9CBSsufExb+rZLeJr7SGR1p/UXMA5XUzx3yJhkrA6cxTeqwR0e7rw
	5jHjg07865xkbXENAxzQ6hwZ8lcZm6RW4B7HiwVhwFRuAHbUj5CENN9uJl0ca32BWfrpRj0pI0EmV
	WUb3ObX5xXtM/6oYb8Y8zmom0Ac0pYKNhs/45c7r9MQQW1nukgvblnFGKrwyCtcqg/OGg1BFdovgL
	k1eE+2ftJvo2oIsv6STxU8kiAmDIIi9cerYuVW33a03yTceWDc/l60S5N28LTtwt11WHM8Hz09pvQ
	A98NAcHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMkFl-00000009h7s-1EvG;
	Thu, 27 Jun 2024 08:13:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMkFX-00000009h0u-20kE;
	Thu, 27 Jun 2024 08:13:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A8EF661418;
	Thu, 27 Jun 2024 08:12:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8BDDC2BBFC;
	Thu, 27 Jun 2024 08:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719475976;
	bh=amUTYbcz2Egm/QZ6bc3w45w4qx9G/lTJ+yraUnLwzCA=;
	h=From:To:Cc:Subject:Date:From;
	b=XuzT0KorWcHa0DrTvhfubLEJ7/cSfgzFRxsHSk3Iu4zDuijlZ5iExFu0k0fmFbN6Q
	 CBlZquTI16hu0vh8w9Yowvx1YmCCPMD8W2q2LBMPaLCaJOANPhbg3RhYh/+/C5/slP
	 wWUrFo0uXnFXfqzoJm9T+Q573l+ldWdXeHRJDbybJIA2pz38/B4xcOxDsKQpX8woH+
	 uQRcbq15Ey71a9sxXg7pMw+VSdNyyyHUzqAxMP6fnoV7L/HDhMXumpYHRO9ULUJ6Gf
	 qE2po5Qb7QlRADYyZSwUurmHwDJ46NnTOtSEN7Q1zRNR1XABpEZmj3jmb07P9qh/r9
	 raUO31zezUkxA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: linux-pci@vger.kernel.org
Cc: ryder.lee@mediatek.com,
	jianjun.wang@mediatek.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	robh@kernel.org,
	bhelgaas@google.com,
	linux-mediatek@lists.infradead.org,
	lorenzo.bianconi83@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	krzysztof.kozlowski+dt@linaro.org,
	devicetree@vger.kernel.org,
	nbd@nbd.name,
	dd@embedd.com,
	upstream@airoha.com,
	angelogioacchino.delregno@collabora.com
Subject: [PATCH v2 0/4] Add Airoha EN7581 PCIe support
Date: Thu, 27 Jun 2024 10:12:10 +0200
Message-ID: <cover.1719475568.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_011300_063001_A98A79E1 
X-CRM114-Status: UNSURE (   6.48  )
X-CRM114-Notice: Please train this message.
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

Introduce support for EN7581 SoC to mediatek-gen3 PCIe driver

Changes since v1:
- remove register magic values
- remove delay magic values
- cosmetics
- fix dts binding for clock/reset

Lorenzo Bianconi (4):
  dt-bindings: PCI: mediatek-gen3: add support for Airoha EN7581
  PCI: mediatek-gen3: Add mtk_gen3_pcie_pdata data structure
  PCI: mediatek-gen3: Rely on reset_bulk APIs for PHY reset lines
  PCI: mediatek-gen3: Add Airoha EN7581 support

 .../bindings/pci/mediatek-pcie-gen3.yaml      |  68 +++++++-
 drivers/pci/controller/Kconfig                |   2 +-
 drivers/pci/controller/pcie-mediatek-gen3.c   | 163 ++++++++++++++++--
 3 files changed, 212 insertions(+), 21 deletions(-)

-- 
2.45.2


