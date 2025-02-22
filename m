Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE62C021B2
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Feb 2025 10:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tdmIHdsbzb8umbERSlAF5QUn1kxQ5VRQnjnz4IKcAf4=; b=lYyRaLsBFmnh+B
	QBwsytGFaqYVODHalCs8K1hDCfSWngAGZYsTXX1taqQA/DeIv80gGoP4OWWSo0iXFRBHHDePpXYAQ
	tkRqHjz3tLCcqUcbzWHQLgM6ik1yob3InjPe+N7WeYrcoz8VE0Y8Zusi3D2Hv9YiXlF76zTWg3OdY
	kLsEKqwGMJvIfBVVLwXvidTJQZYfjMtUuBRy5Tiqk0xFEI9CeQ+gAuyuY2/VbEceoO5rpbDSXyX0d
	R5z72FpL5mBcZXyLXzGlNRj2GjGaKpMG2WVswxxMrQeGPhrRzlvGO0x9IvC+2Q91OlM09z2ImKHoT
	TJHf9Kt1Lr5uKFGyUyfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tln13-00000007qMJ-0jJn;
	Sat, 22 Feb 2025 10:45:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlmzZ-00000007qBg-451v;
	Sat, 22 Feb 2025 10:44:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 310F86113C;
	Sat, 22 Feb 2025 10:44:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6982FC4CED1;
	Sat, 22 Feb 2025 10:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740221054;
	bh=1EgGu4K6OScm1oy60Hd1e93/YxaKGFVdoWrvXutqVW0=;
	h=From:Subject:Date:To:Cc:From;
	b=Tut8NhPHV5YQ2j2Cev3+E18p21LBX32h8+hopks7Bc4vtsyFbNqRH4xkbQMBMCJDO
	 OYeTrgmvjXNISssHiWIxn3wS9rVvd/CTcKgMmiFzDcygh3lltunhat8ucN4l3FD2F/
	 NDPFknDY/44+wpxk86KxMULtCFu4nGgDYCP361CpWpGTrtSyW4wBbP04fDM+VNqDk8
	 he1Xu61wRtYpWDS07ojJIXiMYhqHa83hBRDwRG8cSO+9/jnODJGOsM0jIsu5zQFILG
	 AQmAuEuyA8ULMNzAEWBZkPsZwtd9+g9kT3E9GF8PuvYzH7arvfN+dXYlvqZAlUjYJH
	 zHCia7a6oIm4A==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH v3 0/2] PCI: mediatek-gen3: Set PBUS_CSR regs for Airoha
 EN7581 SoC.
Date: Sat, 22 Feb 2025 11:43:43 +0100
Message-Id: <20250222-en7581-pcie-pbus-csr-v3-0-e0cca1f4d394@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF+quWcC/22NQQ6CMBBFr0Jm7ZhSrIIr72FYwDDARNOSqRIN4
 e5WEncu30/+ewtEVuEI52wB5VmiBJ+g2GVAY+MHRukSgzXWGWtyZH9yZY4TCePUPiNSVOwrOvR
 lSezaAtJ1Uu7ltWmvdeJR4iPoe6vM9rv+hPa/cLZo8Og6alOTqqa63Fg93/dBB6jXdf0A6iDIO
 LkAAAA=
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
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
X-Mailer: b4 0.14.2
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

 .../bindings/pci/mediatek-pcie-gen3.yaml           | 17 +++++++++++
 drivers/pci/controller/pcie-mediatek-gen3.c        | 34 +++++++++++++++++++++-
 2 files changed, 50 insertions(+), 1 deletion(-)
---
base-commit: b6d7bb0d3bd74b491e2e6fd59c4d5110d06fd63b
change-id: 20250201-en7581-pcie-pbus-csr-f9c4f88ce5b3

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


