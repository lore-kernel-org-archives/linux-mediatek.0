Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A2E5C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Mar 2022 13:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QC9MVdcIli2IEJ5wjKVX7D5V2YJyQA/LSIfavn0pYLU=; b=oz+amKumMqC1SL
	oJLMskKChRoRM0Bjd9+sLEPdxHbRNriv6JE+we5/0JaNaIYJTsEd/xNr5U/SZO63/PurWEfeRcJjV
	qrpsR2P53XMdqNamuUYPnR1uCRWXjOwgBkmKHXL2l8CLeDrpilxLJauvwxf8do+5UGKNeDS/TOgJ4
	oN7N5LUyXBSbuEYnKM87SdUqoeQar62NUFE2uIf9JJvhjtgNPXgknwf/PdglnyfBxNGqb97DcTja0
	MOClR31cU+7hqZPLLFTS/rRpH7P1tG7lWtudlG0SENRAH9K+uv2TUa0TwjMSaqvzvs+t4CQ5G8ugQ
	BABOOFEKCHBSaXDEZkew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQ7fZ-00A3sU-Gw; Fri, 04 Mar 2022 13:08:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQ7fU-00A3pj-Cw; Fri, 04 Mar 2022 13:08:27 +0000
X-UUID: dac07aec58474d239035f81b9da34bea-20220304
X-UUID: dac07aec58474d239035f81b9da34bea-20220304
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 79834591; Fri, 04 Mar 2022 06:08:20 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Mar 2022 05:08:18 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 4 Mar 2022 21:08:11 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 4 Mar 2022 21:08:11 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Chen-Yu Tsai" <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>, Hui
 Liu <hui.liu@mediatek.com>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH v3 00/21] Add driver nodes for MT8192 SoC 
Date: Fri, 4 Mar 2022 21:07:48 +0800
Message-ID: <20220304130809.12924-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_050824_471694_5C4EE8FD 
X-CRM114-Status: GOOD (  11.17  )
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

Add driver nodes for MT8192 SoC and this series are based on tag: next-20220304, linux-next/master.

The current mmsys dt-binding,
Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml, doesn't define mboxes or mediatek,gce-client-reg.
Need to reference the below link
https://urldefense.com/v3/__https://lore.kernel.org/all/20220126071932.32615-2-jason-jh.lin@mediatek.com/__;!!CTRNKA9wMg0ARbw!zNfQkN-YYjiqPCd5m9DsLhrQDymgEZJoY4oSl24nC3R95P0gIXEmNjyJMhjQZXkWX7mZPa5QS7KIMlGXMbDjDA1_2A$ 

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

Allen-KH Cheng (21):
  arm64: dts: mt8192: Add pwrap node
  arm64: dts: mt8192: Add spmi node
  arm64: dts: mt8192: Add gce node
  arm64: dts: mt8192: Add SCP node
  arm64: dts: mt8192: Add usb-phy node
  arm64: dts: mt8192: Add xhci node
  arm64: dts: mt8192: Add audio-related nodes
  arm64: dts: mt8192: Add infracfg_rst node
  arm64: dts: mt8192: Add PCIe node
  arm64: dts: mt8192: Fix nor_flash status disable typo
  arm64: dts: mt8192: Add efuse node
  arm64: dts: mt8192: Add mmc device nodes
  arm64: dts: mt8192: Add mipi_tx node
  arm64: dts: mt8192: Add m4u and smi nodes
  arm64: dts: mt8192: Add H264 venc device node
  arm64: dts: mt8192: Add vcodec lat and core nodes
  arm64: dts: mt8192: Add dpi node
  arm64: dts: mt8192: Add display nodes
  arm64: dts: mt8192: Add dsi node
  arm64: dts: mt8192: Add gce info for display nodes
  arm64: dts: mt8192: Add pwm node

 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 778 ++++++++++++++++++++++-
 1 file changed, 767 insertions(+), 11 deletions(-)

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
