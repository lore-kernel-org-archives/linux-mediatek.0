Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FACDC38A02
	for <linux-mediatek@archiver.kernel.org>; Sat, 29 Oct 2022 15:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=F28icF3t/ZJZnzJ1jYpuHgDKBjTOtvEe+03X+Age5+w=; b=nMz06a7rmKgbH5
	9TeFMdK6uLxgxS5EJ65f5bOwIGW1pn0DJPmh+vYfwr5lmipueZZMde0JMsQVFEeSjpUG6Z8LhJeMT
	OzETbG7X+ah4jrXpo7gdvA/D03JQ+gc0rRw7N8DUJwqb9t7NXkZF0IEdfWt6ttzkwD0hXZNCBzeZ8
	X/cMmjkuv91PhWizPPL0RqbE5k2pNmAVLyDzMOjT5CBRLktW/D90nYAe9PgqnJkP3s/ZsjIQ8tdGi
	7dLyRRASmllpOb2SzQrli5rNqUnngIzKnWN+3EK4YEm4fIw+FmXQGhOyG2aiB/ZySczCgW8JW+Z4u
	Xs7bsMq3+vlnRM2wlaiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oonzG-006vOZ-99; Sat, 29 Oct 2022 15:43:06 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oonz1-006vCx-EM; Sat, 29 Oct 2022 15:42:55 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout1.routing.net (Postfix) with ESMTP id 2099A403E3;
	Sat, 29 Oct 2022 15:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1667058166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=F28icF3t/ZJZnzJ1jYpuHgDKBjTOtvEe+03X+Age5+w=;
	b=iQwpRoeuL1M5N78QvYS6ScSXvstS9WycunzN1i3DKaDCyFcSCqeCKJ+5ZkULjMrm2R/0v5
	J7+ynWZzxGq8OBMeFQRyuQQvQjb4XuNzXU2/IZ60PGGNUk65mIlmI7RrULUhtTOTd4eD1t
	aYMVKeWpI2oqivbCtZF/1Zw+N1LAh88=
Received: from frank-G5.. (fttx-pool-217.61.156.178.bambit.de [217.61.156.178])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 37C273600A1;
	Sat, 29 Oct 2022 15:42:45 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v3 0/2] rework mtk pcie-gen3 bindings and support mt7986
Date: Sat, 29 Oct 2022 17:42:17 +0200
Message-Id: <20221029154219.4833-1-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 9d1853c2-04a8-4447-aaa2-a41ba2a3b9e1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221029_084252_097331_8B4536FE 
X-CRM114-Status: UNSURE (   8.31  )
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
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, Jianjun Wang <jianjun.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

This Series prepares support for mt7986 PCIe which is basicly gen3 PCIe
but with slightly differnt clock configuration.

To make differences better to read i split the exiting bindings which
has already different settings with a compatible switch and then add a
new one for mt7986.

v2:
- fixed typo in part 1 (SoC based config)
- squashed part2+3 (compatible and clock config for mt7986)

v3:
- fixed problem with fallback-compatible not compatible to main

Frank Wunderlich (2):
  dt-bindings: PCI: mediatek-gen3: add SoC based clock config
  dt-bindings: PCI: mediatek-gen3: add support for mt7986

 .../bindings/pci/mediatek-pcie-gen3.yaml      | 64 +++++++++++++++----
 1 file changed, 52 insertions(+), 12 deletions(-)

-- 
2.34.1


