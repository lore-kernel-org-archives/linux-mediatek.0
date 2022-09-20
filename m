Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34986C54EE9
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Sep 2022 17:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=loETMcYAL4ROIG1xQMzWE1mjbgbUJ8t+eJJu11sOFyI=; b=ZuEtfJ/Kz3ojh+WGaRj3dBnmgO
	et1OevNMtPzBwAwnDUMY3TjKbbtb2g5u4e/wNpg139DlJRYVYwYs02pvldcR6upzB5Rtvq20CVby5
	6nSLzuLUPTwi+kT5qr7HtWguTjcM0sB00Ub9krvNsiOfizcf3DpKl27L9luu35hv9AqvLBvV+o4er
	gWI0F8seMZ3vxYuy31daiGywRP5lSgXY6Q9kT/WX28zI9zFM+JA0m0MJ1Y8C4xrMEv/2wzehzX9Wr
	0nub4iPTNF3e92AnTQ4NGeCEW8VtQzvYp4k2Kv2BNOz4wKU0VakCJGAmznXGh9pkbTmFwUVzD2p+U
	Pe1nlLyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oah1R-005RQQ-NF; Tue, 20 Sep 2022 17:27:01 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oah1G-005RKk-12; Tue, 20 Sep 2022 17:26:51 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1663694782; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=S2KQStHwuKEd4+hBYLoZ5gUngnG4E9dNJi7vvVnWj0tSadFLUIQmXAMvddt1j0SChdE6lHDIZOMhvxBtZCU2RaDzPq05bCMRHWL3z74muFiXyU+7a204lKVjVnIGrtmndoH6gpn0OEgdMzRdhkki9hjoCfcPvuJbI/l46AKAl8Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1663694782; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=loETMcYAL4ROIG1xQMzWE1mjbgbUJ8t+eJJu11sOFyI=; 
	b=UZiYNvlmjUi3L5PX4HM7seS0fLf9iAPe3lACnIXtoCZbfep6g4WALNQRAKXWCDrzm8oNNjz56JcWZzHLqof1hH0e4XHLmuKNa3IzorDIntYNoxJJrCTM7Ol1NEDVsQ40p5z0+2C6lGHdxCLLMtntBPbIsJnhiv5/+krE6FZUMFA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1663694782;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=loETMcYAL4ROIG1xQMzWE1mjbgbUJ8t+eJJu11sOFyI=;
	b=BxFzmi/d14yBqIP++BxD98r4FRYTlFhMkcRY9nzLy/DnZpoBs9xn+x4yASVXly/c
	+Omd/ZZVafNOLiV56TkCKDwr4aK+yh3F4f6rmjtbZIhWNk2T5s6mWPbUA3Qo02zI4fv
	D167GusK1Bc++aY6xGMS0zxeRQqFT2lfe4MjK2Lk=
Received: from arinc9-Xeront.fusolab.local (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1663694780726325.1013179736344; Tue, 20 Sep 2022 10:26:20 -0700 (PDT)
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	erkin.bozoglu@xeront.com
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
Subject: [PATCH v4 net-next 00/10] dt-bindings and mt7621 devicetree changes
Date: Tue, 20 Sep 2022 20:25:46 +0300
Message-Id: <20220920172556.16557-1-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_102650_163393_148261D8 
X-CRM114-Status: UNSURE (   8.78  )
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

Hello there!

This patch series removes old MediaTek bindings, improves mediatek,mt7530
and mt7621 memory controller bindings and improves mt7621 DTs.

v4:
- Keep memory-controller node name.
- Change syscon to memory-controller on mt7621.dtsi.

v3:
- Explain the mt7621 memory controller binding change in more details.
- Remove explaining the remaining DTC warnings from the patch log as there
are new schemas submitted for them.

v2:
- Change memory controller node name to syscon on the schema example.
- Keep cpu compatible string and syscon on the memory controller node.
- Add Rob and Sergio's tags.

Arınç ÜNAL (10):
  dt-bindings: net: drop old mediatek bindings
  dt-bindings: net: dsa: mediatek,mt7530: change mt7530 switch address
  dt-bindings: net: dsa: mediatek,mt7530: expand gpio-controller
    description
  dt-bindings: memory: mt7621: add syscon as compatible string
  mips: dts: ralink: mt7621: fix some dtc warnings
  mips: dts: ralink: mt7621: remove interrupt-parent from switch node
  mips: dts: ralink: mt7621: change phy-mode of gmac1 to rgmii
  mips: dts: ralink: mt7621: change mt7530 switch address
  mips: dts: ralink: mt7621: fix external phy on GB-PC2
  mips: dts: ralink: mt7621: add GB-PC2 LEDs

 .../mediatek,mt7621-memc.yaml                   |  6 +-
 .../bindings/net/dsa/mediatek,mt7530.yaml       | 34 ++++++-----
 .../bindings/net/mediatek,mt7620-gsw.txt        | 24 --------
 .../bindings/net/ralink,rt2880-net.txt          | 59 --------------------
 .../bindings/net/ralink,rt3050-esw.txt          | 30 ----------
 .../boot/dts/ralink/mt7621-gnubee-gb-pc1.dts    |  8 +--
 .../boot/dts/ralink/mt7621-gnubee-gb-pc2.dts    | 50 +++++++++++++----
 arch/mips/boot/dts/ralink/mt7621.dtsi           | 35 +++++-------
 8 files changed, 80 insertions(+), 166 deletions(-)



