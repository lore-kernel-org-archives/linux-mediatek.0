Return-Path: <SRS0=tiIh=64=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17B21C433E3
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2020 08:00:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8ABC206DC
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2020 08:00:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s9irwefk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="UeCZEBRs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8ABC206DC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rbBxpCk3R2SBWXevhCS9PDd8bE2MzcPX2QRgwlOoZ1s=; b=s9irwefk1I393Z
	MmwO1WOti2Esk4Lct3V/gXaa+0QaMVbWaSnKgeBTSqf8qaOAP7byE+YoPdbbyr7yKLm3gH/sbenpN
	ZYEAC4p0fPPE4RJGG8ZPcIgDbWsLiN8Tu9Gifn3jyMyZprhhld75du/ZozdL5sGNHm74wDNWVsiDb
	Ft57IqjKIoUKZ5nZ5ntjuqrddmOb1k9wK6XjnicguaGa+3WtoGA101o91B4WQ41+kdNJbHhSSVRQt
	HauOMkFFVjCA8B5ak64xUT5eY7ZienKRHjGtqwsJ1mkIKHQUA8aYiApqhxMFx8pxgwlVtfUccOGsx
	x8rs9XKOLRGeUQitT7qg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZ8mn-00037a-TM; Thu, 14 May 2020 08:00:09 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZ8mk-00022p-5m
 for linux-mediatek@lists.infradead.org; Thu, 14 May 2020 08:00:08 +0000
Received: by mail-wr1-x442.google.com with SMTP id e1so2616177wrt.5
 for <linux-mediatek@lists.infradead.org>; Thu, 14 May 2020 01:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LxiKwe63FtUym2hYC0zoHVQTlvrxg5XLv5yLWaD9fEo=;
 b=UeCZEBRs20fQXYUJ0r4rTsxGg5GcFmWuh+lzieEtDQHE6NKCFyIP95HcoRaJphptG5
 74JYw+/BDgF0+IGCJKhnHi2sLi9epciTNrn5bNRabbYKCppawHl9heC30ToTWy8S+k7K
 bX2hvRdeMZyAwM2HRTSbE7gTewUuiRny5XmWOo+XV3wnsrYxyzDOekfkIC8mT2wEbEzO
 igxRgI47NryMgg+Oy9pl5skMNrp+Un81sJEPKNc3dUOYJnkSblhpuqBZ3a/jPmmHjshf
 C9AGxQFsPEl2nOzoQkl7j+thuirCBjnt6vDkFMZ1oNrZL2ANTi+lKoWUYkba21FsTb26
 ORag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LxiKwe63FtUym2hYC0zoHVQTlvrxg5XLv5yLWaD9fEo=;
 b=XF5u1vcoj48lrPO/+NMisFHOgykuHgPVFv1Lt+srp0+60/Jw+FGN9oQH1cbrTC9Lo9
 1K5/HZf8Yde0tTZV1E4p9+yRRrJdXwkFHaVgCD059Px2LMN/9rNbo5KR2bJB7Ta3B6l4
 R7c+R2xCJxmhaQB3tlALR/7u+CQyxgPmm4Hp9OpUwU5lp5x4Q6vi7jv9FdII2zbf39io
 rb/0qDhP8QyxOGJC2BSrMenjrwePVZ/15obnD5dytz+XTL/71Lf1uybyNsfflKDPXvOf
 enR6gkVpqim1JUDdTk2nbR8j7CI0roNoVSqNYXWsQ9YEeN2QlpBE4L3zGaVvfS5y5yqS
 y5cg==
X-Gm-Message-State: AOAM532cPBfo/5OS+8CYEjIIBlettbfw3k8m/eiin8OXFhv19nMMcfL0
 d/LxY1pomIuVmXHjqUY+1rzbOw==
X-Google-Smtp-Source: ABdhPJwI5TAiw6JGHe10xqjfyRvp21tN6e/WVtsWSo1V4Qnb8O2x5Ne8GkVd7g59r7PlsF292M6lGw==
X-Received: by 2002:a05:6000:1083:: with SMTP id
 y3mr3740674wrw.425.1589443204180; 
 Thu, 14 May 2020 01:00:04 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr.
 [2.15.156.232])
 by smtp.gmail.com with ESMTPSA id 81sm23337446wme.16.2020.05.14.01.00.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 01:00:03 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>,
 "David S . Miller" <davem@davemloft.net>,
 Matthias Brugger <matthias.bgg@gmail.com>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Jakub Kicinski <kuba@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Fabien Parent <fparent@baylibre.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Edwin Peer <edwin.peer@broadcom.com>
Subject: [PATCH v3 00/15] mediatek: add support for MediaTek Ethernet MAC
Date: Thu, 14 May 2020 09:59:27 +0200
Message-Id: <20200514075942.10136-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200514_010006_313109_D80DF926 
X-CRM114-Status: GOOD (  19.81  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org,
 Stephane Le Provost <stephane.leprovost@mediatek.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-mediatek@lists.infradead.org,
 Andrew Perepech <andrew.perepech@mediatek.com>,
 Pedro Tsai <pedro.tsai@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This adds support for the Ethernet Controller present on MediaTeK SoCs from
the MT8* family.

First we convert the existing DT bindings for the PERICFG controller to YAML
and add a new compatible string for mt8516 variant of it. Then we add the DT
bindings for the MAC.

Next we do some cleanup of the mediatek ethernet drivers directory and update
the devres documentation with existing networking devres helpers.

The following patches introduce a resource managed variant of
register_netdev() and move all networking devres helpers into a separate .c
file.

The largest patch in the series adds the actual new driver.

The rest of the patches add DT fixups for the boards already supported
upstream.

v1 -> v2:
- add a generic helper for retrieving the net_device associated with given
  private data
- fix several typos in commit messages
- remove MTK_MAC_VERSION and don't set the driver version
- use NET_IP_ALIGN instead of a magic number (2) but redefine it as it defaults
  to 0 on arm64
- don't manually turn the carrier off in mtk_mac_enable()
- process TX cleanup in napi poll callback
- configure pause in the adjust_link callback
- use regmap_read_poll_timeout() instead of handcoding the polling
- use devres_find() to verify that struct net_device is managed by devres in
  devm_register_netdev()
- add a patch moving all networking devres helpers into net/devres.c
- tweak the dma barriers: remove where unnecessary and add comments to the
  remaining barriers
- don't reset internal counters when enabling the NIC
- set the net_device's mtu size instead of checking the framesize in
  ndo_start_xmit() callback
- fix a race condition in waking up the netif queue
- don't emit log messages on OOM errors
- use dma_set_mask_and_coherent()
- use eth_hw_addr_random()
- rework the receive callback so that we reuse the previous skb if unmapping
  fails, like we already do if skb allocation fails
- rework hash table operations: add proper timeout handling and clear bits when
  appropriate

v2 -> v3:
- drop the patch adding priv_to_netdev() and store the netdev pointer in the
  driver private data
- add an additional dma_wmb() after reseting the descriptor in
  mtk_mac_ring_pop_tail()
- check the return value of dma_set_mask_and_coherent()
- improve the DT bindings for mtk-eth-mac: make the reg property in the example
  use single-cell address and size, extend the description of the PERICFG
  phandle and document the mdio sub-node
- add a patch converting the old .txt bindings for PERICFG to yaml
- limit reading the DMA memory by storing the mapped addresses in the driver
  private structure
- add a patch documenting the existing networking devres helpers

Bartosz Golaszewski (15):
  dt-bindings: convert the binding document for mediatek PERICFG to yaml
  dt-bindings: add new compatible to mediatek,pericfg
  dt-bindings: net: add a binding document for MediaTek Ethernet MAC
  net: ethernet: mediatek: rename Kconfig prompt
  net: ethernet: mediatek: remove unnecessary spaces from Makefile
  Documentation: devres: add a missing section for networking helpers
  net: move devres helpers into a separate source file
  net: devres: define a separate devres structure for
    devm_alloc_etherdev()
  net: devres: provide devm_register_netdev()
  net: ethernet: mtk-eth-mac: new driver
  ARM64: dts: mediatek: add pericfg syscon to mt8516.dtsi
  ARM64: dts: mediatek: add the ethernet node to mt8516.dtsi
  ARM64: dts: mediatek: add an alias for ethernet0 for pumpkin boards
  ARM64: dts: mediatek: add ethernet pins for pumpkin boards
  ARM64: dts: mediatek: enable ethernet on pumpkin boards

 .../arm/mediatek/mediatek,pericfg.txt         |   36 -
 .../arm/mediatek/mediatek,pericfg.yaml        |   64 +
 .../bindings/net/mediatek,eth-mac.yaml        |   89 +
 .../driver-api/driver-model/devres.rst        |    5 +
 arch/arm64/boot/dts/mediatek/mt8516.dtsi      |   17 +
 .../boot/dts/mediatek/pumpkin-common.dtsi     |   34 +
 drivers/net/ethernet/mediatek/Kconfig         |    8 +-
 drivers/net/ethernet/mediatek/Makefile        |    3 +-
 drivers/net/ethernet/mediatek/mtk_eth_mac.c   | 1578 +++++++++++++++++
 include/linux/netdevice.h                     |    2 +
 net/Makefile                                  |    2 +-
 net/devres.c                                  |   95 +
 net/ethernet/eth.c                            |   28 -
 13 files changed, 1894 insertions(+), 67 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.txt
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml
 create mode 100644 Documentation/devicetree/bindings/net/mediatek,eth-mac.yaml
 create mode 100644 drivers/net/ethernet/mediatek/mtk_eth_mac.c
 create mode 100644 net/devres.c

-- 
2.25.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
