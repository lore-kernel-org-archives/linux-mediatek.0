Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A52CDC30653
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jul 2024 16:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NWbkQn4+HFTjsPEwRJqQwDEdAVZnil5prz7fmYlV0Aw=; b=v75fiafq4DSKdAYvXcWGw42hY9
	NCrlORTbwtr6N272M488tP6Vr5NP6GcXI2D8MV76tRU9Wtyvz04XVQ1VBKRoGGsC8oYvJLIC5CeG5
	z91Orr4hrmCj3RWOs6a0hTTOW5yVvzcbhiPC+WTwgFMprV0qlJK+I16cw+zRKiRBxQBfZNPj1/mmU
	OaSmH4d4uiVlHkMUr/+PjGfDEM+W9EUy79dm5fW3moX48+uZs2KPj9LUbKHSMx3WsytDX9YsfFqwe
	F2RkMcUNjoMFJuA2TY9Q02sOM89/UhsLOYPHWjkwg23kYAuGA1s794qzdXW1u0fCqpsyuNj6xhKVy
	N1qwY7rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP2bj-0000000AoWy-2wsh;
	Wed, 03 Jul 2024 16:13:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP2bW-0000000AoSq-2XY1;
	Wed, 03 Jul 2024 16:13:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 28C666231E;
	Wed,  3 Jul 2024 16:13:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19C41C2BD10;
	Wed,  3 Jul 2024 16:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720023188;
	bh=Neb1+LB5kKM5TcMku4Gly5fFzuTkl9jDF4ySZTpJyGg=;
	h=From:To:Cc:Subject:Date:From;
	b=Jz28CjovdwpnYTsy06MiZQAsMdek36QR+T93huuEQ0T6T1MGKIOdWF7gccz4ehhNL
	 rHsYWgk9J4JIjdU3jPo+jcHB+m0AZL3YbAn3GIyun5ACp8UY7fJAk2oztbqUDkCPrh
	 KhTvnqk80Q4Kl04qE9CbPbUJiSXg5hapKqZMA3T7l4BJDyvgLFuBKqQ4Tp/WmRIzFx
	 MtiGcNhLP30mGdAswGCpKCDVvwi3e4NEisRnWnZBCFmV+jY9I9422YYWgBJBATBB+b
	 bPXbTQO6xzliykSu+taPZWWs7HQ6u3F6nNogFbqNUXSIN8DKdKU8Qk8Py1LFpVceaf
	 HxBjBe1/Le+7g==
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
Subject: [PATCH v4 0/4] Add Airoha EN7581 PCIe support
Date: Wed,  3 Jul 2024 18:12:40 +0200
Message-ID: <cover.1720022580.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_091310_705078_AD473B0C 
X-CRM114-Status: UNSURE (   6.66  )
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

Changes since v3:
- move phy initialization delay in pcie-phy driver
- rename en7581 PCIe reset delay
- fix compilation warning
Changes since v2:
- fix dt-bindings clock definitions
- fix mtk_pcie_of_match ordering
- add register definitions
- move pcie-phy registers configuration in pcie-phy driver
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

 .../bindings/pci/mediatek-pcie-gen3.yaml      |  68 ++++++-
 drivers/pci/controller/Kconfig                |   2 +-
 drivers/pci/controller/pcie-mediatek-gen3.c   | 180 ++++++++++++++++--
 3 files changed, 229 insertions(+), 21 deletions(-)

-- 
2.45.2


