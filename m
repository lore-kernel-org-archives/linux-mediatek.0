Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2CC6C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Oct 2022 09:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Bc6cQwclXRXDwOqWgeEjn61RmTobdHqJkYLEj/iLtpo=; b=0R6Wf7FLKYYBYc
	q/jI5GjMCFcwnPKNcmY5XnZnP7YM94gE8n3gB3aJsos9F4slAw4HSe1xaYVUzPgzvWSEEabnHtjA4
	ZjaKz16XmZLj+ODE+eh5DRi4jTPj3XY2loX3lyu3+NPvKoKZM4ZPkM4ktwA/6B9YohBVoosxPTORM
	NZER4QeVjKG8wsN4DtJRpASSFtuqLJlX+Q3yxjU5SQ50pvMoNtEZulC+f651be56xi8C96j5CFZmP
	EqnHsOTmEIZHZ6VUooDBo4q9acbc0dzyKb1/iBJCgebdwv/ILSPeXzgMAdJUJlr202OICZq0ioI10
	WujMCD85dJ6WSONA+fFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oncqn-008lgh-2z; Wed, 26 Oct 2022 09:37:29 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oncqT-008lWZ-7h; Wed, 26 Oct 2022 09:37:11 +0000
Received: from mxbox4.masterlogin.de (unknown [192.168.10.79])
	by mxout3.routing.net (Postfix) with ESMTP id C653F626A8;
	Wed, 26 Oct 2022 09:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1666777019;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Bc6cQwclXRXDwOqWgeEjn61RmTobdHqJkYLEj/iLtpo=;
	b=ia30a0U6EGjaqLmgGc7lXw/Gd0gDOGVekvdvCEexd7p50Xxw1gkKl8FPPjF5DxtpEE1Keh
	hxtGBbp3tHlkACKE6+6TyfgrYBjn2rJb18jWF/7iUmS2FWDFgLwadjRdWKXPs13Xfn8qKU
	dcqQ8sc7kAvaFiqfCe9i1r+N+D8Jg0w=
Received: from frank-G5.. (fttx-pool-80.245.72.174.bambit.de [80.245.72.174])
	by mxbox4.masterlogin.de (Postfix) with ESMTPSA id 062D68026C;
	Wed, 26 Oct 2022 09:36:58 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [RFC v2 0/7] Add BananaPi R3
Date: Wed, 26 Oct 2022 11:36:43 +0200
Message-Id: <20221026093650.110290-1-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 34114509-b48f-4b6e-a4e7-fd466745400a
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221026_023709_451037_71D09F85 
X-CRM114-Status: GOOD (  10.15  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

This Series adds some Nodes to mt7986 devicetree and the BananaPi R3

i included sams series for mt7986 DTS with small changes
https://patchwork.kernel.org/project/linux-mediatek/cover/20220427124741.18245-1-sam.shih@mediatek.com/

this series need these Patches:

i2c-support:
https://patchwork.kernel.org/project/linux-mediatek/cover/20221009101631.82380-1-linux@fw-web.de/

mmc bindings:
https://patchwork.kernel.org/project/linux-mediatek/list/?series=688675

update pinctrl-bindings:
https://patchwork.kernel.org/project/linux-mediatek/patch/20221024074349.7777-1-linux@fw-web.de/
https://patchwork.kernel.org/project/linux-mediatek/patch/20221025070255.14407-1-linux@fw-web.de/

hwrng and pinctrl (uart splitting) are already applied to next

v2 do not include PCIe as there is still a discussion on bindings.

i had run full dtbs-check but i end up with some strange warnings in
ethernet-node that should not come up as phy-handle and sfp/managed
properties are already defined.

phy-handle made optional
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/net/mediatek,net.yaml#n265

property sfp/managed (which is included for mac subnode in yaml above):
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/net/ethernet-controller.yaml#n137

Frank Wunderlich (2):
  arm64: dts: mt7986: add i2c node
  arm64: dts: mt7986: add Bananapi R3

Sam Shih (5):
  arm64: dts: mt7986: harmonize device node order
  arm64: dts: mt7986: add spi related device nodes
  arm64: dts: mt7986: add usb related device nodes
  arm64: dts: mt7986: add crypto related device nodes
  arm64: dts: mt7986: add mmc related device nodes

 arch/arm64/boot/dts/mediatek/Makefile         |   2 +
 .../mediatek/mt7986a-bananapi-bpi-r3-emmc.dts |  34 +
 .../mediatek/mt7986a-bananapi-bpi-r3-sd.dts   |  29 +
 .../dts/mediatek/mt7986a-bananapi-bpi-r3.dtsi | 593 ++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts  | 246 ++++++--
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi     | 127 ++++
 arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts  |  83 ++-
 7 files changed, 1059 insertions(+), 55 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtsi

-- 
2.34.1


