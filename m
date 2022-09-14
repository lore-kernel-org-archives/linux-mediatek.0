Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB00ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 09:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9UI9eP83Fgm+l/Q0CkzxP3QIa+aLPYZVv/RvTUoxtY0=; b=USRnU1ekvMoWyjVKdBBEx+Ls6e
	8LNqi6H6k/daxBhY3d7ZH7MEa16GnrvGUbw+EIe6DxOa7KFzUf6O0kud588IYM4jdyJ96LguEzycB
	zhTbKC4l9f2ne2sfB+lhLrU1FwcvBBUXqP+Ev/4jfkdUmoEU9UgPePPXiKZqdo0CXaBDbR65tzkh+
	QRSoY3igYYAoBb8UVIAi43Kirn2rkMWPogrojOxc0sKsIFOH0ZRnmUnT0aeV/RCdJF/l1wQNmvKCK
	ibt+gTmpY6WrIxxrSg9089qHGgKKAa3jAOg4nOdxj+13eVwlW7MbWoYlrkk2e7zvTL2Y7yjucAodo
	8IbZO6SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYOPT-00Dx5V-It; Wed, 14 Sep 2022 09:10:19 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYOB8-00DkqB-LR; Wed, 14 Sep 2022 08:55:32 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1663145704; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Gjg8AqWpUhD3m3MK0P4K7x/Bct//nRGED2qY4TuaEIlrojvenQmGZBGEEkDqiWCWrM/cNfuUyM+gBOSPFYj1aB15CMrLMmdBKRgtnEQaBHitzIF7wbyblLGKENu7YGcPIh5M5lBiDW9tj1Ood5izj1jsvAV/k8o+0g2UvdYrreA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1663145704; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=9UI9eP83Fgm+l/Q0CkzxP3QIa+aLPYZVv/RvTUoxtY0=; 
	b=jtXHcg3BFSxuzGOT96wPbzL4NLtCnzgyHIxZSEtabmdsNHgXY8+MUk9ppCaahd+JRKneW0qY6j4fNPBt31JoxKN52mI5tY0Z6twTBAIrMKJf5AefC1QcbLN515Rwdu+UCiYZBauJSKNdf5uE53Fib6pmAWDp1zvet1LdEPS+u4E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1663145704;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=9UI9eP83Fgm+l/Q0CkzxP3QIa+aLPYZVv/RvTUoxtY0=;
	b=X+XppHQ9toIBSo3MA8oAudZLQnta9EmpVSypCgMaRMOIvkogGwa4L3Yj/ICE1rs+
	4x0Q7HU+UAImBw5sQug+Gt7HL5aMHIZBMaOem5fenIjQH/YI8v+TgZPupYTr5/zNo0r
	raKpQl9wE74w3Y/AR2ezVeOcOxxBBx2FIMua+x4Y=
Received: from arinc9-PC.lan (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1663145701578840.6285235337986; Wed, 14 Sep 2022 01:55:01 -0700 (PDT)
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
Subject: [PATCH net-next 00/10] dt-bindings and mt7621 devicetree changes
Date: Wed, 14 Sep 2022 11:54:41 +0300
Message-Id: <20220914085451.11723-1-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_015530_826359_A741AFD0 
X-CRM114-Status: UNSURE (   7.16  )
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
 arch/mips/boot/dts/ralink/mt7621.dtsi           | 37 +++++-------
 8 files changed, 80 insertions(+), 168 deletions(-)



