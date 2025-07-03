Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC4CC83F03
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Jul 2025 13:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aF/GWsyKLKXlc//yRm64Ocxqyy2kdJMqf6CPnn5gj/c=; b=Ek12bVKR/rojybzfyT1B8MCzNb
	nRxnhWR2XrzzHaT7o42MOgzHz/b/b1oUVHXDcIt/EwZB6T1Y6A3rmRqrL6zcvpa7vHiChxYQl/1fX
	7GS0eNfGC35414G+MqKZwv8EtA7RSwZZZGOd2Q9X35aaZSFFZXFV0pphnFRnXXxxqHhpsfWjOEevC
	gkKNcLetbNLJI95YMoNkHO7h+3I2fweILhlEyNUfT1Tk4LGTu/AUBHOhrlNYoAlZbubv9LhEKc7vZ
	5wRYwPUBsetgTa8FmoabIPxUMH11lOH4+evrKS6ki7KehPppdVxlgkH2kkMkR+C+1OdUXd7n/kXGF
	+5F2Twsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXJxn-0000000BUPO-3brq;
	Thu, 03 Jul 2025 13:26:55 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXIkG-0000000BGl5-3nd0;
	Thu, 03 Jul 2025 12:08:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751544531;
	bh=kaTHkQ9BvDf7ruSvyJH0uvXewC0X/FMNr21hBYYZKWk=;
	h=From:To:Cc:Subject:Date:From;
	b=nC0IqfHUyWu8VgCSceBYs/tyGuoWlBwhCNE3BPpAidWAf3zeQaKYCqhW+oMTJwgtr
	 CMkSN6SSMXhFSvJgoGvLkLxGND1+r8HKFsm/FeQ55eFm0VzRVfUDK0yVMh19sJKFiH
	 0cIh+iuJlpcVowJx5ElRj82pXogcEAqNvjWHhlFqsXc4F2ksYLVggOvXTn/vhUWtVq
	 0CmWObY6yPTHMAPJGP47AMvrqp2dsZz0irrnsMFKhuiCDdgH249pz7pic5Mp9sR9Fi
	 on8rIcteRcsUxhZ9lVgiPwZjxebtTQmvjWKbl84QKKY7QGAU4dINBbhuu2PXgvRroT
	 156/LgUvGHRxw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8001217E0939;
	Thu,  3 Jul 2025 14:08:50 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: jianjun.wang@mediatek.com
Cc: ryder.lee@mediatek.com,
	bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	manivannan.sadhasivam@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v2 0/3] mediatek-gen3: Add support for MT8196/MT6991
Date: Thu,  3 Jul 2025 14:08:44 +0200
Message-ID: <20250703120847.121826-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_050853_117709_6B57F449 
X-CRM114-Status: UNSURE (   9.34  )
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

Changes in v2:
 - bindings: Removed useless minItems in reset
 - bindings: Defined reset-names items

This series adds (at least partial) support for the MediaTek MT8196
Chromebook SoC and for the MT6991 Dimensity 9400 Smartphone SoC's
PCI-Express controller.

Some strange PEXTP settings were omitted, as the intention is to find
a way to set those bits *outside* of the PCI-Express driver itself as
the downstream implementation is using ugly syscons to make the PCIe
controller driver to change bits inside of a clock controller.

In the meanwhile, this is a set of clean changes that are required for
the controller inside those SoCs in *any* case; further development
will occur, with high hopes to find a solution outside of this driver.

AngeloGioacchino Del Regno (3):
  PCI: mediatek-gen3: Implement sys clock ready time setting
  dt-bindings: PCI: mediatek-gen3: Add support for MT6991/MT8196
  PCI: mediatek-gen3: Add support for MediaTek MT8196 SoC

 .../bindings/pci/mediatek-pcie-gen3.yaml      | 35 +++++++++++++++++++
 drivers/pci/controller/pcie-mediatek-gen3.c   | 24 +++++++++++++
 2 files changed, 59 insertions(+)

-- 
2.49.0


