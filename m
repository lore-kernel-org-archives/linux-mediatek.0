Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23657C369AE
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Apr 2025 09:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SkS+vSuo1znIoysQeehovZJ1m0kqebSTrJLxr1xkdnM=; b=FTF3oESD3tLE3+
	PENxnaHcJrmogf7fwPK170Mveb1d5weM89R7j7Kp1kIASgpDrS0zZIJ4P9JtG5Z9/HWv/MZTqGms8
	l9hYJ6YmaCkbzeyspmAHwAtGB1MWHBtqvTlMzvL5ykvJGmMwzgMWco0fHlh1YKukR/Ah4GlA4V28h
	nqDTFTSf2JEf+jR9D0NG5fSYjMhjcd2hIgqyS6v6Pp5lpmfTv8anPVDQh6v0nDY8xw0SborxOEXjV
	oN0CpSrG6zHgpozzcB4UcBSitft36UWWw4UbKEpe7tPQFXT/u7tD+qcZsHtyP6f520BJbb/KYcG3X
	S3XHQmcimTvSLX2Z7cFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3tE7-0000000Gz6T-0RoU;
	Sun, 13 Apr 2025 09:02:07 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3tAM-0000000Gyl4-2UaW;
	Sun, 13 Apr 2025 08:58:16 +0000
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
	by mxout2.routing.net (Postfix) with ESMTP id 108B65FC6A;
	Sun, 13 Apr 2025 08:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1744534692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SkS+vSuo1znIoysQeehovZJ1m0kqebSTrJLxr1xkdnM=;
	b=cDGfs988LIIYqcjiBKSyw6TwXfDQDp1uPMMGUitip6CDKhA7ECg11X5UOhErtB/remUPCz
	3UnW6VKdgwOqndaB9+6KGu2jRN0BGd569DiE+0gDk1SwxQ6T6IAhABO/UQxA9+lMm1wDtI
	ZCZpacRkyp9eOA3WwXE7i3BsBOvg/6k=
Received: from frank-u24.. (fttx-pool-194.15.86.153.bambit.de [194.15.86.153])
	by mxbox1.masterlogin.de (Postfix) with ESMTPSA id CA8EE4006C;
	Sun, 13 Apr 2025 08:58:10 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [RFC 0/5] Add mt7988 XS-PHY
Date: Sun, 13 Apr 2025 10:58:00 +0200
Message-ID: <20250413085806.8544-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 29a3ad43-8079-44b9-9f98-200054c44558
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_015814_800522_EFCD9D05 
X-CRM114-Status: UNSURE (   8.19  )
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
Cc: devicetree@vger.kernel.org, Sam Shih <sam.shih@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, MandyJH Liu <mandyjh.liu@mediatek.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Mediatek XS-Phy is a high speed phy used for pcie and usb on mt7988 platform.

It requires a topmisc power controller to switch between USB and PCI mode.
This topmisc system controller is also used by ethernet-node which is not
upstreamed yet.
---
regading syscon-fallback...i know that it should be avoided ;)

based on these commits:

ba5095ebbc7a ("mfd: syscon: Allow syscon nodes without a "syscon" compatible")
5728c92ae112 ("mfd: syscon: Restore device_node_to_regmap() for non-syscon nodes")

I tried to get it working without syscon by changing

instance->type_sw = syscon_node_to_regmap(args.np);
to
device_node_to_regmap()

then xsphy was probed sucessfully, but all pcie (not only the one with xsphy)
stopped working.

for ethernet its driver uses syscon_regmap_lookup_by_phandle which needs to
be patched in syscon driver to also use device_node_to_regmap instead of
syscon_node_to_regmap (with create=true). But have not tried this.

regarding the pcie issue when dropping the syscon compatible i would leave
this compatible, but send this patchset as RFC. Maybe anyone can solve this.

Daniel Golle (1):
  phy: mediatek: xsphy: support type switch by pericfg

Frank Wunderlich (4):
  dt-bindings: phy: mtk-xs-phy: Add mt7988 compatible
  dt-bindings: phy: mtk-xs-phy: support type switch by pericfg
  dt-bindings: power: Add binding for MediaTek MT7988 topmisc power
    controller
  arm64: dts: mediatek: mt7988: Add xsphy for ssusb0/pcie2

 .../bindings/phy/mediatek,xsphy.yaml          | 17 ++++
 .../power/mediatek,power-controller.yaml      | 35 +++++---
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi     | 39 +++++++++
 drivers/phy/mediatek/phy-mtk-xsphy.c          | 85 ++++++++++++++++++-
 4 files changed, 164 insertions(+), 12 deletions(-)

-- 
2.43.0


