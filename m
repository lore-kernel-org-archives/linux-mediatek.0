Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 403C7C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 Apr 2022 13:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8+DBE/rH20DbxGqKI0hHiiH8hb9FETNAzymvEDxA5pU=; b=GYgu1VGKiFxIyQ
	ztAc9rW5TlGtvfWMyQdYNOhmZkZSpHju0zGocn1G8Ya4ZUmeIIEzLVOuDelVKlhVPFrrh/qAwfGqg
	gor743DNNl8mPSNrNYEjYS9B90d4ybvQRocG8T7pFQGhXWQs9d8v5M0nN6Cgb0wDUoSaY3OkgCOOk
	kRAl/K2l8qZubpwty2FGcfO7Vp1TZQCDLmzpsbPtdrSddnLYLb9j7rDQl5JoTAFA5I48CZANFWPst
	CThGUu7rD41XNrJg8qtCgfhW5NOCqIzik+63kX2ccf0gIQzRvuxtbTyabhux0/FR65dBFDiUQk4+/
	yRs8/u+gHy1wjTDeqKkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkmln-00EGo7-Qt; Sat, 30 Apr 2022 13:04:19 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkmla-00EGgx-Cs; Sat, 30 Apr 2022 13:04:08 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
 by mxout3.routing.net (Postfix) with ESMTP id DA8BC6054A;
 Sat, 30 Apr 2022 13:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
 s=20200217; t=1651323839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=E/DjbKxcbIiIW9rYKpEMs3z/xZdjhL53L8stR7y8sO4=;
 b=c/b2QyYwrIXU5MbbqgvfcAfL4FUW9cZZKO0WzmDYe7xspvdKnTqhl3uEd3tymKqcZ2zZ59
 UG0RabZgG7IZYViF/AZ6N+MnHtUdzPBYfsByChAIUePYmEx8natLwxwu3IcmdSKWNz/JFn
 //VNzhNLCclCBauqbsf/bSVec02HjAg=
Received: from localhost.localdomain (fttx-pool-80.245.72.211.bambit.de
 [80.245.72.211])
 by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 5AC8B3600EF;
 Sat, 30 Apr 2022 13:03:57 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [RFC v2 0/4] Support mt7531 on BPI-R2 Pro
Date: Sat, 30 Apr 2022 15:03:43 +0200
Message-Id: <20220430130347.15190-1-linux@fw-web.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mail-ID: b931c4e7-0a19-447e-82b1-0aeac9a6c684
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220430_060406_603337_94EE259F 
X-CRM114-Status: UNSURE (   9.41  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, DENG Qingfang <dqfext@gmail.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, Vivien Didelot <vivien.didelot@gmail.com>,
 Peter Geis <pgwipeout@gmail.com>
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

Frank Wunderlich (4):
  net: dsa: mt7530: rework mt7530_hw_vlan_{add,del}
  net: dsa: mt7530: rework mt753[01]_setup
  net: dsa: mt7530: get cpu-port via dp->cpu_dp instead of constant
  arm64: dts: rockchip: Add mt7531 dsa node to BPI-R2-Pro board

 .../boot/dts/rockchip/rk3568-bpi-r2-pro.dts   | 48 +++++++++++
 drivers/net/dsa/mt7530.c                      | 81 ++++++++++++-------
 drivers/net/dsa/mt7530.h                      |  1 -
 3 files changed, 100 insertions(+), 30 deletions(-)

-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
