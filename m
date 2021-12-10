Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3C0EC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Dec 2021 17:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6527O3y7FIhQfWMQxMO4Ch7sbjE/deVvy4NuRJoBRCM=; b=uRLGXjGiB7bTRl
	BdCOcY1V2KvtquEfX0v1SSOazzK9uEvrVuHwxgO4lnXqJGffU6fAijUPRgfIFbvKeVmmIj6DUYpLz
	3vWRLUpS/H8Om+rIgN/Mmyl3gvzsPuWZ1NeDmADHj4gQav9mJPqOlonuPyBAKTo9PdhQ2l9Ozbn0K
	A9GN+YoBrCf4H9VD74/FJrFnhpEU7fhYtkEVJF13reLkl/w1fioOo5OOmKrrwnQpEuuoJUoS9yyJy
	BFnkuz8nxw8oJPt6BnTO77CsRaP0CuQHP0TD+YnXiaW0FYPtaVRyTM+q4/gvyWNq8oemdQ5WUBxJ+
	CT646/B4vDebVXMxN2Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvjtn-002w0g-VW; Fri, 10 Dec 2021 17:41:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvjqH-002tyg-94; Fri, 10 Dec 2021 17:37:59 +0000
X-UUID: b3d6635189ca400eaa51b29325e9480c-20211210
X-UUID: b3d6635189ca400eaa51b29325e9480c-20211210
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <flora.fu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1537360448; Fri, 10 Dec 2021 10:37:49 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Dec 2021 09:37:48 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 11 Dec 2021 01:37:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 11 Dec 2021 01:37:46 +0800
From: Flora Fu <flora.fu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Pi-Cheng Chen
 <pi-cheng.chen@mediatek.com>
CC: <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Flora
 Fu" <flora.fu@mediatek.com>, Yong Wu <yong.wu@mediatek.com>, JB Tsai
 <jb.tsai@mediatek.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>
Subject: [PATCH 0/6] Add MT8195 APU Power Domain
Date: Sat, 11 Dec 2021 01:37:37 +0800
Message-ID: <20211210173743.30906-1-flora.fu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_093757_362009_A5C94DC2 
X-CRM114-Status: UNSURE (   7.27  )
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

Add MT8195 APU power domain.
This series is based on drivers implemented in
MT8192 apu power domain[1] and apu SMC[2].
[1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=593809
[2] https://patchwork.kernel.org/patch/12670253
The device tree depends on MT8195 dts[3] which is under reviewing.
[3] https://patchwork.kernel.org/patch/12616141

Flora Fu (6):
  dt-bindings: soc: mediatek: apu: Add MT8195 APU power domain
  dt-bindings: arm: mediatek: Add MT8195 APU bindings
  soc: mediatek: apu: Add MT8195 apu power domain
  arm64: dts: mt8195: Add APU nodes
  arm64: dts: mt8195: Add APU power domain node
  arm64: dts: mt8195: Set up apu power domain regulators

 .../arm/mediatek/mediatek,apusys.yaml         |   3 +
 .../soc/mediatek/mediatek,apu-pm.yaml         |   1 +
 arch/arm64/boot/dts/mediatek/mt8195-evb.dts   |   8 ++
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      |  31 +++++
 drivers/soc/mediatek/apusys/mtk-apu-pm.c      | 124 ++++++++++++++++++
 5 files changed, 167 insertions(+)

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
