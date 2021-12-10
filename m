Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A7EDC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Dec 2021 17:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ovqKgPKAWnC475yqK8ji8/aQa1+va4IwjgDhdVSoEWM=; b=XaF/SkD+md1eg9
	ccSyRzKAedRbCaHyNR6/sT95F7pTWUSAAE3sYp8XeJ0R/qRP7eciHW5umiOt9BPUW8uqxLAn3Ij14
	ZumnQkBtBW2AXMiNY1tS44shlOAGu02xZJZfunMDa2d2AidPFT1okoN/DMA7qh2BVwQuykx80jXpb
	MAN+Ck1gTm1YjtpDkwK/aRxq399h2FragbpXFEFqdXM2ZNNvsO3ZGuWnW6bkdhMsuNxNJ0yppCEbl
	0uSyjFYAfS//zsM+UHHceuJyeChSbybsvv/uRIIG6SoirRFL8k7gDvQUeBW7I/k1jkLN3rU+yCVKD
	d4wgu10alPrtJ/niCrbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvk94-0033V2-J8; Fri, 10 Dec 2021 17:57:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvk4b-0030tt-LC; Fri, 10 Dec 2021 17:52:47 +0000
X-UUID: 6397806958214855934a0cc83ac2dfbd-20211210
X-UUID: 6397806958214855934a0cc83ac2dfbd-20211210
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <flora.fu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 806435060; Fri, 10 Dec 2021 10:52:40 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Dec 2021 09:52:39 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 11 Dec 2021 01:52:25 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 11 Dec 2021 01:52:25 +0800
From: Flora Fu <flora.fu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Pi-Cheng Chen
 <pi-cheng.chen@mediatek.com>, Yong Wu <yong.wu@mediatek.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Flora Fu <flora.fu@mediatek.com>, "JB
 Tsai" <jb.tsai@mediatek.com>
Subject: [PATCH 00/12] MediaTek MT8195 APU
Date: Sat, 11 Dec 2021 01:52:11 +0800
Message-ID: <20211210175223.31131-1-flora.fu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_095245_773411_AFFEF082 
X-CRM114-Status: UNSURE (   9.85  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

MT8195 SOC has APU hardware and this series add support
for MT8195 APU driver. The initial APU driver is implemented in
MT8192 APU driver[1] and we add MT8195 platform configuration to enable
APU functions.
The MT8195 APU drivers uses the MT8195 apu power domain[2].
[1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=593825
[2] https://patchwork.kernel.org/project/linux-mediatek/list/?series=593841

Flora Fu (12):
  dt-bindings: memory: mediatek: Add MT8195 apu iommu bindings
  dt-bindings: remoteproc: mediatek: Add MT8195 in apu rproc
  dt-bindings: soc: mediatek: apu: Add MT8195 APU power bindings
  iommu/mediatek: Add APU iommu data for mt8195
  remoteproc: mediatek: Add MT8195 APU remoteproc support
  soc: mediatek: apu: Add MT8195 APU power driver
  arm64: dts: mt8195: Add APU mtk-apu-mailbox node
  arm64: dts: mt8195: Add APU-IOMMU nodes
  arm64: dts: mt8195: Add apu tinysys node
  arm64: dts: mt8195: Add APU power nodes
  arm64: dts: mt8195: Add apu-sw-logger node
  arm64: dts: mt8195: Set up regulators for APU subsys

 .../bindings/iommu/mediatek,iommu.yaml        |  3 +
 .../bindings/remoteproc/mediatek,apu-rv.yaml  |  1 +
 .../soc/mediatek/mediatek,apu-pwr.yaml        | 23 ++++-
 arch/arm64/boot/dts/mediatek/mt8195-evb.dts   |  5 ++
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 84 +++++++++++++++++++
 drivers/iommu/mtk_iommu.c                     | 20 +++++
 drivers/remoteproc/mtk-apu-rproc.c            | 15 ++++
 drivers/soc/mediatek/apusys/apu-pwr.c         | 34 +++++++-
 .../dt-bindings/memory/mt8195-memory-port.h   |  4 +
 9 files changed, 187 insertions(+), 2 deletions(-)

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
