Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B98A3C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Mar 2022 13:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bvmHHeZ4CgFecty+LnRliDPXgKBGyrFqC4Ir54j/pdI=; b=1kUtQ+m0v949Kw
	SLFvnaqwtc6zRYojTXuwmiFyjboZjs1F9V4FtCG1NOYHHckl5pP9EJY7C+aPOGuJtY1gWoFJi7V2+
	XClKDm8ej0yjQSN6K1AQpYo0B83S0YGv4vJX7QG0t2Grv0ZyisK7pwuR6hwgIcSz0TtJpsEVmpQlG
	ILo984VW90ZoYcPYsGotCGtzeKHaRInZRDC60ox+zRd6eKH3nldZFUTC91pHtjzRfJdpC/TY/wLJz
	K6yY++iIzoTDaLplC0urOKO81CEUFttDlmQKVxRyyCvel41Hyz6kOdFn3x2MTMunYu6zvyZnFQVUR
	qsg74Q98QflbObBWKPlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZYWr-00G70d-7L; Wed, 30 Mar 2022 13:38:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZYWn-00G6zs-3l; Wed, 30 Mar 2022 13:38:27 +0000
X-UUID: fc6dabecd639480ca91fd173c30bc878-20220330
X-UUID: fc6dabecd639480ca91fd173c30bc878-20220330
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2131156900; Wed, 30 Mar 2022 06:38:21 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Mar 2022 06:38:19 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Mar 2022 21:38:17 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 30 Mar 2022 21:38:17 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Chen-Yu Tsai" <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>, Hui
 Liu <hui.liu@mediatek.com>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH v5 0/4] Add driver nodes for MT8192 SoC 
Date: Wed, 30 Mar 2022 21:38:12 +0800
Message-ID: <20220330133816.30806-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_063825_203806_5405B009 
X-CRM114-Status: GOOD (  13.16  )
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

Add driver nodes for MT8192 SoC and this series are based on matthias.bgg/linux.git, v5.18-next/dts64
(PCIe, mmc, H264 venc, vcodec lat and core nodes)

In order to track the dependencies of some patches, I remove them from this series and will
send a new series for each node. (spmi, gce, infracfg_rst, mipi_tx, dpi, display, dsi, gce info and pwm)

changes since v4:
- remove some patches from this series.
- PCIe: remove reset node, correct the clk names
- mmc: reserve msdc node
- vcodec: correct the clk names (remove vdec- prefix)

changes since v3:
- add patch: add the mmsys reset bit to reset the dsi0
- dsi0: use mmsys for reset controller support
- mmc: reorder clocks as specified in the dt-bindings
- vcodec: use ranges for regs of subnodes

changes since v2:
- rebase on next-20220304
- remove power domains controller patch from series (already in linux-next)
- scp: fix indentation
- t-phy: change node name from usb-phy to t-phy and set ranges address
- usb: change node name from xhci to usb and add disabled status
- audsys: syscon: add increasing the address range's length info in commit message
- infracfg_rst: add simple-mfd info in commit message
- nor_flash: add Fixes tag d0a197a0d064a in  commit message
- efuse: use lower case characters
- mmc: use single line for reg
- mipi_tx: change node name from mipi-dphy to dsi-phy, drop clock-names and add disabled status
- m4u and smi: fixing the formatting of the mediatek,larbs properties and remove smi-id property
- H264 venc: fix indentation, remove '0x' prefix for node address
- vcodec lat and core: use '-' instead of '_' in the node name, fix indentation and
  set mtk-vcodec-lat and mtk-vcodec-core as subnodes of vcodec-dec
- dpi: add disabled status
- display: appended "mediatek,mt8183-disp-aal" for ccorr
- dsi: fix indentation and add disabled status
- gce info: add drivers' CMDQ support inn commit message
- pwm: add disabled status
- i2c aliases: move the aliases at the board level.

changes since v1:
- add usb-phy node for xhci node
- move infracfg_rst patch in front of PCIe patch
- add display nodes, i2c aliases and pwm node.

Allen-KH Cheng (4):
  arm64: dts: mt8192: Add PCIe node
  arm64: dts: mt8192: Add mmc device nodes
  arm64: dts: mt8192: Add H264 venc device node
  arm64: dts: mt8192: Add vcodec lat and core nodes

 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 150 +++++++++++++++++++++++
 1 file changed, 150 insertions(+)

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
