Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1E92C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jun 2022 17:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9Irvh8oy/2cWHaS/k49AxiPjISJRLQjMQASSeLtSqgA=; b=BXqg8szCIhesnZ
	ybJSBDVJ/rQJmCT7d4TCPgLfUqaitP36ptaktVcXBm4oQJ5SMJAeMVUaeMDI/LiyT7Ii0UrWQX++/
	NL6KXY5rMwlVH0reSac2AFp/yYxoKaG3DT0H8qLBMeNlz6XvRTkmcpS88j6e+mE6n4MhcUNvyZC/i
	jWzNWDislp1svIf4jUHuzfWMHIvUZIlbiG/JMeSeL4r55Nsju3SpEVz804orHaXLkJtrwfy8ctAtJ
	8nG5n2vtBGZ11T9VklOYQyl87AknFGW+qPtgh1X2m4v3wtEEAB5icxwh8CyFOQTlpxTnrZxD7GjRk
	+Kccq9IpY/MYXAPYoqNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzi5a-0093c5-Lc; Fri, 10 Jun 2022 17:06:26 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzi5M-0093Se-QN; Fri, 10 Jun 2022 17:06:14 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout3.routing.net (Postfix) with ESMTP id 759B7604C3;
	Fri, 10 Jun 2022 17:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1654880766;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pDrlZAy3kJCxHKJSLpDfcRAgAZ5uvq2tLGud8Ozt00E=;
	b=xGbp7x7si1B6h/1C0Jfk2q+eiwlESBh2O7MtEPJYQy5+n8FyxKi1gr5ZLtWFqJvIA7JeGb
	jQ+iU5pw0t5w9zxkPGnUQxZb+fdh8IYzcOYTKrLHZaPKaqUKEiaU95Yt6i1na3AnZk3Zlg
	meTpB1Zadm2jjbOo3eHT8wMlmkp+eTg=
Received: from frank-G5.. (fttx-pool-217.61.154.155.bambit.de [217.61.154.155])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 6F413100863;
	Fri, 10 Jun 2022 17:06:04 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-rockchip@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v4 0/6] Support mt7531 on BPI-R2 Pro
Date: Fri, 10 Jun 2022 19:05:35 +0200
Message-Id: <20220610170541.8643-1-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mail-ID: 2b0c5315-20fe-4f65-8769-27f3112e1833
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_100613_066558_930FDE0A 
X-CRM114-Status: GOOD (  12.47  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Heiko Stuebner <heiko@sntech.de>, =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Greg Ungerer <gerg@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Vivien Didelot <vivien.didelot@gmail.com>, devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Geis <pgwipeout@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

This Series add Support for the mt7531 switch on Bananapi R2 Pro board.

This board uses port5 of the switch to conect to the gmac0 of the
rk3568 SoC.

Currently CPU-Port is hardcoded in the mt7530 driver to port 6.

Compared to v1 the reset-Patch was dropped as it was not needed and
CPU-Port-changes are completely rewriten based on suggestions/code from
Vladimir Oltean (many thanks to this).
In DTS Patch i only dropped the status-property that was not
needed/ignored by driver.

Due to the Changes i also made a regression test on mt7623 bpi-r2
(mt7623 soc + mt7530) and bpi-r64 (mt7622 soc + mt7531) with cpu-
port 6. Tests were done directly (ipv4 config on dsa user port)
and with vlan-aware bridge including vlan that was tagged outgoing
on dsa user port.

v4: 
- rebase on 5.19-rc1
- some changes in bindings-document and fix wrong squashing from v3

Frank Wunderlich (6):
  dt-bindings: net: dsa: convert binding for mediatek switches
  net: dsa: mt7530: rework mt7530_hw_vlan_{add,del}
  net: dsa: mt7530: rework mt753[01]_setup
  net: dsa: mt7530: get cpu-port via dp->cpu_dp instead of constant
  dt-bindings: net: dsa: make reset optional and add rgmii-mode to
    mt7531
  arm64: dts: rockchip: Add mt7531 dsa node to BPI-R2-Pro board

 .../bindings/net/dsa/mediatek,mt7530.yaml     | 404 ++++++++++++++++++
 .../devicetree/bindings/net/dsa/mt7530.txt    | 327 --------------
 .../boot/dts/rockchip/rk3568-bpi-r2-pro.dts   |  48 +++
 drivers/net/dsa/mt7530.c                      |  82 ++--
 drivers/net/dsa/mt7530.h                      |   1 -
 5 files changed, 505 insertions(+), 357 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
 delete mode 100644 Documentation/devicetree/bindings/net/dsa/mt7530.txt

-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
