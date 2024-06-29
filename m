Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B42C5C27C4F
	for <linux-mediatek@archiver.kernel.org>; Sat, 29 Jun 2024 13:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pn/SRjI16DQP4OUwpERLWBGnEo5hYTf8uYBI34hwHz4=; b=ElK/BMpQsvgFpPbHWFLTREfuzM
	Zw95L++BAcuzvj+VlNY8iJcoSBwqr9X2Uyjyf/x1bz/5kuxgxFkjt8IvTktP35CQwqaXala/CAuYh
	rxXSdmXFXjIODoe4eA+CF6Udx+oFyIZNwbStCQ60cJCktWSHKLjH+/kmNlNJ2yvVZF3z8VSrE0b81
	86/mAZfeXxjDiPwH+FCYN9Y6f7av0rLeHxY3+OVqhKvzQ3K/qpsEfXb7cKPydxTaE6XP7+02kLZfY
	u/s3XQNIxlT6URi4Fgy98nZ0qeMxTjDdHibbKavMnumHtJNUAXA/H86JUtptEqsr0cvN0IwmO9Len
	VJ5QQKxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNYVX-0000000GTpU-0jaW;
	Sat, 29 Jun 2024 13:52:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNYVL-0000000GTkf-2Hu9;
	Sat, 29 Jun 2024 13:52:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D378D60B4E;
	Sat, 29 Jun 2024 13:52:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05AE8C32789;
	Sat, 29 Jun 2024 13:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719669158;
	bh=4JK/dGJ9vvO4cLTeLu7sbX/N3rtNnVVFCgve2xC0CtM=;
	h=From:To:Cc:Subject:Date:From;
	b=WZwv03Ua2YjdX8OiM7lnP/Z25I34m+FpQrtS/c/Fc9Ex7OtQYniNJg8aFaGdvV2CX
	 ReIXK2RDLzpESL5oTCdRW7L/LsXevd8Zw4HQognwrjxdNr9hL4PjFewJNXblw2HsyH
	 bB59jlJHYe5PD5OOvf5+EiZLGkMbtnWpLJrAmr5l+MDtnL3pdapXjAG68nH8+44LAl
	 HyB6/lu5KCs7FywkAnTjqQ8lM0KQlsSDChejtuoQ4K9d/Rpg6JE5QUt0f/87FcFS4F
	 jz0ob2dpEL2fLQwl4kvAfLUo0UJkVTGdMHHhcp6labgZzv/fIsXj+R8RlQ/XH6Oosq
	 WC7Zo6y9PSBgw==
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
Subject: [PATCH v3 0/4] Add Airoha EN7581 PCIe support
Date: Sat, 29 Jun 2024 15:51:50 +0200
Message-ID: <cover.1719668763.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240629_065239_652769_B662B9F3 
X-CRM114-Status: UNSURE (   6.55  )
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
 drivers/pci/controller/pcie-mediatek-gen3.c   | 175 ++++++++++++++++--
 3 files changed, 224 insertions(+), 21 deletions(-)

-- 
2.45.2


