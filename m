Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF59C021B8
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Feb 2025 08:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fKWX/emIPow0hH6vlh3Hb0EBxDSD6Jc60BBXE7N0te0=; b=i30FQWVdYgitnp
	FOVtQTg6zO/sGRTGrWZBORMbaYSDfIjb1G0444cqJRPjakqRwrgnRxfAINHXTDBEo0/qZu+5wKnle
	15DfllJu+ZlzpVQ1Q4feJhfobSJCoDqkjkzeY3JmG3Ht3cU2gdV6pL1u6XDrjucmhr0BOQCt8rMJt
	RmL849sTqmKxLaEQnm9Tc8+Ega3rJppoZm+4fF2sWX2yFWpaLlCEwfTABPKmOX7qfiXzAFGj3XYR0
	dnP5iyFMvI/vQcuKFHBySNmlJZ+ZafsE+nY7lh05mPk9/45eD1NwGuGTSysPHPavFPsAMYCzNsSII
	ITkT3U+VUUv4qwW+1/zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmq5H-0000000GL16-3h9M;
	Tue, 25 Feb 2025 08:14:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmpvG-0000000GJYr-3TCs;
	Tue, 25 Feb 2025 08:04:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2FFCB5C6521;
	Tue, 25 Feb 2025 08:03:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 476AAC4CEDD;
	Tue, 25 Feb 2025 08:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740470649;
	bh=Q/hlg5DJCs52keNQavSLTdyq9yKobf8eiX9XyuPCwnU=;
	h=From:Subject:Date:To:Cc:From;
	b=u0L7W7NN+Gcdq5skWKb/rmQjvQQxRAgXuBHzglJePGY9PCA5LDnb41LfRExJaoVx8
	 dDGqHtKBy3V5+Av0GAgJneNKWAJCtcfk3toOtx0aizsgzGLostLVRoFf3BP3i8UpGp
	 8UupDTXWBiu/Mol0DvAYsrbs6QtrZPjf/vVWeo0qIKwezteMQIbGhi2al8ajpAYRIx
	 tDv8m1F5qMT9MNvTqRMVqbmS39GUEcHajfL+5jqmqN946b72qpxwYICwAS47IzExpZ
	 z7zwhjh7bi4SLTLnGhU3PPEmyfgfLvHJRZgj/jeRU7c9oqHKhocl1uNiSTpUkzqSLp
	 sxSH5NKJAPl9w==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH v4 0/2] PCI: mediatek-gen3: Set PBUS_CSR regs for Airoha
 EN7581 SoC.
Date: Tue, 25 Feb 2025 09:04:05 +0100
Message-Id: <20250225-en7581-pcie-pbus-csr-v4-0-24324382424a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHZ5vWcC/3XNTQrCMBCG4auUrB1J86ONK+8hLtrppA1KWhINS
 undTQuCgi7fgXm+iUUKjiI7FBMLlFx0g8+hNgXDvvYdgWtzM8GF5oKXQH6vqxJGdARjc4+AMYA
 1qGxVIelGsvw6BrLusbKnc+7exdsQnutKEsv1DYrfYBLAYadbbPImmtocLxQ8XbdD6NgiJvmhi
 H+KzApxxLq0qpVGfSnzPL8AyRLbgP8AAAA=
X-Change-ID: 20250201-en7581-pcie-pbus-csr-f9c4f88ce5b3
To: Ryder Lee <ryder.lee@mediatek.com>, 
 Jianjun Wang <jianjun.wang@mediatek.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_000410_912564_D7A100E5 
X-CRM114-Status: UNSURE (   9.08  )
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

Configure PBus base address and base address mask to allow the hw
to detect if a given address is accessible on the PCIe controller.
Introduce mediatek,pbus-csr phandle array property.

Changes in v4:
- Remove check on resource size
- Remove checks on regmap_write()
- Link to v3: https://lore.kernel.org/r/20250222-en7581-pcie-pbus-csr-v3-0-e0cca1f4d394@kernel.org

Changes in v3:
- Get base address and base address mask from range property
- Define mediatek,pbus-csr as phandle array
- Link to v2: https://lore.kernel.org/r/20250202-en7581-pcie-pbus-csr-v2-0-65dcb201c9a9@kernel.org

Changes in v2:
- Introduce mediatek,pbus-csr phandle property
- Drop patch 1/2 in v1
- Do not hard-code compatible sting in the driver and use phandle
  instead

---
Lorenzo Bianconi (2):
      dt-bindings: PCI: mediatek-gen3: Add mediatek,pbus-csr phandle array property
      PCI: mediatek-gen3: Configure PBUS_CSR registers for EN7581 SoC

 .../bindings/pci/mediatek-pcie-gen3.yaml           | 17 +++++++++++++
 drivers/pci/controller/pcie-mediatek-gen3.c        | 28 +++++++++++++++++++++-
 2 files changed, 44 insertions(+), 1 deletion(-)
---
base-commit: b6d7bb0d3bd74b491e2e6fd59c4d5110d06fd63b
change-id: 20250201-en7581-pcie-pbus-csr-f9c4f88ce5b3

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


