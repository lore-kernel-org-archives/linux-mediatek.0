Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31E61C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Apr 2022 02:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=X/nLBxxDc/Um4/POr+C32aBXzS+5V3NmoZqX2q78zRc=; b=hqInQuIrOcmac6
	91rircJvO1wST7Qfaf9a8o9A/1XDLlDJzD+zo8ntR0jSpU4OPSZI2oUAQiPC/9lrl2N+w6tfF34JL
	GdRfrRbOcpWHZU8JLNQSnS68NE7j/ml76UXoHFpybDDUwBk8sY2nBosOgP12UDSUwNq/d837a+2eq
	r1pSL2Mzs/Cdjq6fOMmLktcNo8MEFE1mciTlQbfxdIAhTU8ALWuBqyewoqEO06frFL16hJwd5nLj5
	1D8khD+W/yI8TqlxxTE0xD9Gv7EnZwkT2C58u9konuavTl1XP64MEbHBqkPjQmvAHRKvbBiZUe9YX
	4EgtvKzBy492kWLOdHAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndjvG-006GQn-8f; Mon, 11 Apr 2022 02:36:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndjux-006GLU-2x; Mon, 11 Apr 2022 02:36:40 +0000
X-UUID: f92d3cc752ae4c76b8ff7f1901610794-20220410
X-UUID: f92d3cc752ae4c76b8ff7f1901610794-20220410
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <tinghan.shen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1458336720; Sun, 10 Apr 2022 19:36:36 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 10 Apr 2022 19:27:57 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 11 Apr 2022 10:27:55 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 11 Apr 2022 10:27:55 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Johnson Wang
 <johnson.wang@mediatek.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Henry Chen
 <henryc.chen@mediatek.com>, Zhiyong Tao <zhiyong.tao@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <ryder.lee@kernel.org>,
 <wenst@chromium.org>, <chunfeng.yun@mediatek.com>, Tinghan Shen
 <tinghan.shen@mediatek.com>
Subject: [PATCH v14 0/2] Add basic SoC support for mediatek mt8195
Date: Mon, 11 Apr 2022 10:27:22 +0800
Message-ID: <20220411022724.11005-1-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.15.GIT
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220410_193639_179052_AF3D5702 
X-CRM114-Status: GOOD (  14.84  )
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

This series adds basic SoC support for Mediatek's SoC MT8195.

---
Changes in v14:
  - update pwrap dt-bindings 
    this patch is picked from 20220411014121.15015-2-zhiyong.tao@mediatek.com 
  - enable u3phy2 and u3phy3 in evb dts 
Changes in v13:
  - add more description of reg items in mtk-sd.yaml
Changes in v12:
  - update mtk-sd.yaml to extend reg property and fix yamllint error
  - add xhci nodes and move xhci3 property (usb2-lpm-disable) to evb.dts
Changes in v11:
  - rebase on 5.17-rc4
Changes in v10:
  - clean CC list
Changes in v9:
  - remove duplicated cpus dt-bindings patch in v8
Changes in v8:
  - v7 mediatek,spi-mtk-nor.yaml patch is applied in branch for-5.17 at 
    kernel/git/broonie/spi.git
  - v7 pinctrl-mt8195.yaml patch is applied in branch for-next at 
    kernel/git/linusw/linux-pinctrl.git
  - add cortex-a78 compatible to cpus dt-bindings
  - add mediatek,drive-strength-adv property to pinctrl dt-bindings
  - fix evb dts
    - remove i2c nodes with disabled status from dts
    - fix pin properties not match pinctrl dt-bindings
    - remove unnecessary u3port*
  - fix dtsi
    - fix node format
    - reorder oscillator* nodes 
    - fix node name of cpu idle nodes
    - remove clock-frequency property in the timer node
    - reorder clock and clock names in usb nodes
Changes in v7:
  - refine title of spi-nor dt-bindings patch
  - refine commit message of pinctrl dt-bindings patch
  - update pinctrl-mt8195.yaml
    - change property pattern from 'pins' to '^pins'
    - update examples with new property in descriptions
    - add new example
  - drop '_' from node names of pinctrl subnodes in mt8195-evb.dts
Changes in v6:
  - rebase on 5.16-rc1
  - add new clock name to spi-nor dt-bindings
  - add "pins" property in pinctrl dt-bindings
  - fix fails of dtbs_checks
    - remove "arm,armv8" not matched in yaml from cpu compatile
    - fix node name of xhci
    - remvoe xhci upstreaming wakeup properties
    - remove xhci unused properties address-cells and size-cells
    - fix node name of ufs-phy 
    - fix node name of spi-nor
    - fix node name and sub-nodes of pinctrl
    - fix mmc compatible
Changes in v5:
  - enable basic nodes in mt8195-evb.dts
  - remove dedicated clock nodes
  - add mmc2 node
  - fix interrupt number of pinctrl node
  - update clock nodes to apply internal fixes
  - add dt-bindings for perficfg node

v4 thread:
https://lore.kernel.org/all/20210922093303.23720-2-seiya.wang@mediatek.com/
v3 thread:
https://lore.kernel.org/all/20210601075350.31515-2-seiya.wang@mediatek.com/
v2 thread:
https://lore.kernel.org/all/20210319023427.16711-10-seiya.wang@mediatek.com/
v1 thread:
https://lore.kernel.org/all/20210316111443.3332-11-seiya.wang@mediatek.com/
---

Tinghan Shen (1):
  arm64: dts: Add mediatek SoC mt8195 and evaluation board

Zhiyong.Tao (1):
  dt-bindings: pwrap: mediatek: fix pwrap document for mt8195

 .../bindings/soc/mediatek/pwrap.txt           |   10 +-
 arch/arm64/boot/dts/mediatek/Makefile         |    1 +
 arch/arm64/boot/dts/mediatek/mt8195-evb.dts   |  181 +++
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 1045 +++++++++++++++++
 4 files changed, 1232 insertions(+), 5 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-evb.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8195.dtsi

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
