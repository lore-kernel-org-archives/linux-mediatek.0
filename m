Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 639ACC433F5
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 May 2022 17:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FZ4REJPKlehAiBVv8/qWuYbjB5ttxeS/pSvwaYaXpqQ=; b=kgD4HvqEOe2j3+
	FNkOn3OyEHlG8Yn7Kn/IV3dHT8mC7BB9w5WzURpU+bgvs3dSoas5PpaBSshDTwGN5z3EZe+j+Y/ji
	F9oQHIBrLEkDFJW7mCOzpWsmGqP8A2ygKS20ELdSmhyN2hEDg41+9ikuFzy8nqBylkvLn/O3gU3Qg
	IsIN4VZSwRHFv/RXwDUUGxmVh6mPDUXVvdaYyH49FI8MO4hJSarmFYdzKZ0z1yxyJy2yLsfR8H0jB
	U3NKUqJC09bFZsylI/ut1GjDAQowwqQebH45pIUUy+IIvaDZ+lfGRuV4+dImLtNNXhXE31KPPW+D5
	FmMbDykud9ZGKpzLmfGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nnNrs-007ktD-KK; Sat, 07 May 2022 17:05:20 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnNrW-007klS-9D; Sat, 07 May 2022 17:04:59 +0000
Received: from mxbox4.masterlogin.de (unknown [192.168.10.79])
 by mxout3.routing.net (Postfix) with ESMTP id A35D2604E9;
 Sat,  7 May 2022 17:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
 s=20200217; t=1651943090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=EjaSzJO2uUUmd5uhe8Cz84DcqNwhDvLFMPUk6p2YS/w=;
 b=u7ml8eB1fN+vbtefw+qMcmyX+1x1u+VpRfN7Qm4QGQK3PfOjiFFDhbtiKiHKpl3ITd/h/f
 3aJN4bZopDwRZfuHzZy/qQEA5AQxmoyTD1CcKIv7wBHwEBVy1G72nkZG2/GWbkQ3Mb1+Qa
 P6XeQOfNH4/HylmPQdkCehDTQoFB7xY=
Received: from localhost.localdomain (fttx-pool-80.245.74.2.bambit.de
 [80.245.74.2])
 by mxbox4.masterlogin.de (Postfix) with ESMTPSA id 376E2800AB;
 Sat,  7 May 2022 17:04:49 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-rockchip@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 0/6] Support mt7531 on BPI-R2 Pro
Date: Sat,  7 May 2022 19:04:34 +0200
Message-Id: <20220507170440.64005-1-linux@fw-web.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mail-ID: da758d6d-308b-42e9-967d-54e70fb985a9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220507_100458_538010_4BA2E233 
X-CRM114-Status: GOOD (  11.33  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Heiko Stuebner <heiko@sntech.de>,
 =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Greg Ungerer <gerg@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Vivien Didelot <vivien.didelot@gmail.com>, devicetree@vger.kernel.org,
 Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 DENG Qingfang <dqfext@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Peter Geis <pgwipeout@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
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

Due to the Changes i also made a regression Test on mt7623 bpi-r2 using
mt7530 with cpu-port 6. Tests were done directly (ipv4 config on dsa user
port) and with vlan-aware bridge including vlan that was tagged outgoing
on dsa user port.

Main change is that i now include the binding-changes into the patchset which
i posted separately.

Frank Wunderlich (6):
  dt-bindings: net: dsa: convert binding for mediatek switches
  net: dsa: mt7530: rework mt7530_hw_vlan_{add,del}
  net: dsa: mt7530: rework mt753[01]_setup
  net: dsa: mt7530: get cpu-port via dp->cpu_dp instead of constant
  dt-bindings: net: dsa: make reset optional and add rgmii-mode to
    mt7531
  arm64: dts: rockchip: Add mt7531 dsa node to BPI-R2-Pro board

 .../bindings/net/dsa/mediatek,mt7530.yaml     | 421 ++++++++++++++++++
 .../devicetree/bindings/net/dsa/mt7530.txt    | 327 --------------
 .../boot/dts/rockchip/rk3568-bpi-r2-pro.dts   |  48 ++
 drivers/net/dsa/mt7530.c                      |  82 ++--
 drivers/net/dsa/mt7530.h                      |   1 -
 5 files changed, 522 insertions(+), 357 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
 delete mode 100644 Documentation/devicetree/bindings/net/dsa/mt7530.txt

-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
