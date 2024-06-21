Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA733C27C4F
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jun 2024 14:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YGFw0D80TEeLo0zuzV71YH8CJ+pjAS+916/gNeTaarg=; b=rwo8ATq8fKoMJVMp5CsA1Cw+FD
	XsDClCnUq4GiLUqOR+E7yj6KTZbzrcJmK/Nt39UC5CGPrje78OPVFiryZt4nAMRv4VI4WUEFoR9BA
	GqpGtwHpmLOLnrcVZKTgWi1/mhTtXohu30WHXrHMHiPjscq0UtPuVEmsTRFBJwKpcyit2lsmGupzg
	TS0nbCDmcBV/hmjoolnnV1pCy9ZNmDDGVS4laRKHOX6G+e0ZuWYNTY3SWcINy2N9MMJmGchiZVdu2
	5Q9+Rga4s6DH5sOoZihfjtoD7kYPd0EuHgDsBqd8vbybZeS13so108FCQCbObfAIzX12L+S9i4YXk
	pscw8KAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKfZn-00000009aOB-1pC5;
	Fri, 21 Jun 2024 14:49:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKfZi-00000009aLj-0DUt;
	Fri, 21 Jun 2024 14:49:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F0DB161DC2;
	Fri, 21 Jun 2024 14:49:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F4BBC2BBFC;
	Fri, 21 Jun 2024 14:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718981352;
	bh=JolrwFO5Y598QPe1Pt51c15YFqkxtE9Cd/0+WsztOxw=;
	h=From:To:Cc:Subject:Date:From;
	b=DBaqXkJ+XBmgzUTWqRDn1pz6BhA0a99gz3ardMNz4byaDeMAefa653Z7afiXJLWOD
	 IN15/ghr4ycgWs3W7N3WMZ8K1HvU0/Rj08BLZJE8TrjWVz5pVOx1yqC6Qia7nYybQ4
	 5TZg978hT3LnXMMsvRgIeJTcxywi54g/Nln9Wl21Abk+3OWSw+AbCM4aGKk6aB1gsN
	 mlUbaAbmt7G/T5tDJKIOQNHBXAN57JghaEOCigKFOkjIhGwhGnhEK1mqfxj+Gf7c+0
	 QMu4j7NVNlsVVMDyZ/32MiyhcVKx1VJ06DC7qAXvpcDhknr9FAaexcelhQ8jvcJFVk
	 rUO6rvBlJbAcg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: linux-pci@vger.kernel.org
Cc: ryder.lee@mediatek.com,
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
Subject: [PATCH 0/4] Add Airoha EN7581 PCIE support
Date: Fri, 21 Jun 2024 16:48:46 +0200
Message-ID: <cover.1718980864.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_074914_174042_AD74A80F 
X-CRM114-Status: UNSURE (   6.32  )
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

Introduce support for EN7581 SoC to mediatek-gen3 pcie driver

Lorenzo Bianconi (4):
  dt-bindings: PCI: mediatek-gen3: add support for Airoha EN7581
  PCI: mediatek-gen3: Add mtk_pcie_soc data structure
  PCI: mediatek-gen3: rely on reset_bulk APIs for phy reset lines
  PCI: mediatek-gen3: Add Airoha EN7581 support

 .../bindings/pci/mediatek-pcie-gen3.yaml      |  25 ++-
 drivers/pci/controller/Kconfig                |   2 +-
 drivers/pci/controller/pcie-mediatek-gen3.c   | 155 ++++++++++++++++--
 3 files changed, 161 insertions(+), 21 deletions(-)

-- 
2.45.2


