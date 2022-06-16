Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 951F9C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 09:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hEAYtQTHHdZwUKirA1tylxmAQA3opjXSdcQXRK7ewhs=; b=2w3GzG4WdrVD2l+vqipQalPUx+
	T9QShdfIrguPYbhsNSFWfPmYde7zO9VUVAZCtTMif95jtfzXh+dZQIiP1QAgsECY2RClYIgKu4nU3
	Fqe9wTkoLZ3u5sRX/uMWvxxkfh0Eb/TLnZMWYvhxE3CBdoVTnJYNETQm3RGydMoWBvXAwF7PkW44/
	wR8WXbNXmSXDygosv1mPKd3vtog75SDbktHoudTGgzYqDvPNi91kSs3bMIdGyfCnvqHzZZL+9CRrT
	zvSVeToHRENODFRJy+FCXJgo2z4JcbCO43D1MCVFvHSCdbzjI1WDF0B1Tt14t35FqiNNKkg4ll91A
	SlXViKxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1lbU-001cx8-C9; Thu, 16 Jun 2022 09:15:52 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1lbH-001csp-JC; Thu, 16 Jun 2022 09:15:41 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4CEFB6601747;
	Thu, 16 Jun 2022 10:15:37 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655370937;
	bh=KxykqQCEpRhgoPcgevBn0vXgBsCIPtUHhTP5rEIhH84=;
	h=From:To:Cc:Subject:Date:From;
	b=nrJ55i1q2xFY175KraxwqHeHZB23QmNubDj0+hMyX/Zj5vNBSoS6a/UknL2nHA16r
	 85n8dEMzWdHnvXUJ7nY/UJqN4L+weBcN2wkt8yKHfuCehh52W39oYwN0O+mxBP2M88
	 bP69toA2LrCQwpUaCoolkX6LpwtSRkmvIAN5izm1SXq06D6/hVjW1zISfqGblPdHIL
	 TFyvscrwLE9zFkbYITGxQZM8/nJ9dP7YcQDMfAEdldaikFSwOWdwCWoFIleRxcnPfF
	 WL0bmaeV5bdrayxFoKJ9tD+9Jv25bCtVeChp8C+nAZAjHjVPpsno0ROyOeBFtzU2wl
	 kyPdNRrDkQs9w==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: lee.jones@linaro.org
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	johnson.wang@mediatek.com,
	hsin-hsiung.wang@mediatek.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] MediaTek Helio X10 MT6795 - MT6331/6332 PMIC MFD integration
Date: Thu, 16 Jun 2022 11:15:29 +0200
Message-Id: <20220616091531.12646-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_021539_806719_93218468 
X-CRM114-Status: GOOD (  13.58  )
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

In an effort to give some love to the apparently forgotten MT6795 SoC,
I am upstreaming more components that are necessary to support platforms
powered by this one apart from a simple boot to serial console.

This series adds the necessary headers and support for the MT6331 with
MT6332 companion PMIC in the mt6397 MFD driver, along with some basic
devices.

Adding support to each driver in each subsystem will be done in different
patch series as to avoid spamming uninteresting patches to maintainers.

This series depends on another series [1] named
"MediaTek Helio X10 MT6795 - MT6331/6332 PMIC Wrapper", meaning that
even if this builds without, the changes in said series are necessary
to actually use these PMICs.

Tested on a MT6795 Sony Xperia M5 (codename "Holly") smartphone.

[1]: https://lore.kernel.org/lkml/20220520124039.228314-1-angelogioacchino.delregno@collabora.com/T/#t

Changes in v2:
 - Reworded commit description for commit [1/2] to include a list of
   the submodules provided by this hardware
 - Changed keys compatible documentation to a list

AngeloGioacchino Del Regno (2):
  dt-bindings: mfd: mt6397: Add compatibles for MT6331 RTC and keys
  mfd: mt6397: Add basic support for MT6331+MT6332 PMIC

 .../devicetree/bindings/mfd/mt6397.txt        |   7 +-
 drivers/mfd/mt6397-core.c                     |  47 ++
 drivers/mfd/mt6397-irq.c                      |   9 +-
 include/linux/mfd/mt6331/core.h               |  53 ++
 include/linux/mfd/mt6331/registers.h          | 584 ++++++++++++++++
 include/linux/mfd/mt6332/core.h               |  53 ++
 include/linux/mfd/mt6332/registers.h          | 642 ++++++++++++++++++
 include/linux/mfd/mt6397/core.h               |   2 +
 8 files changed, 1394 insertions(+), 3 deletions(-)
 create mode 100644 include/linux/mfd/mt6331/core.h
 create mode 100644 include/linux/mfd/mt6331/registers.h
 create mode 100644 include/linux/mfd/mt6332/core.h
 create mode 100644 include/linux/mfd/mt6332/registers.h

-- 
2.35.1


