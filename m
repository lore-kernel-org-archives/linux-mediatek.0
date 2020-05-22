Return-Path: <SRS0=9rwW=7E=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33EFDC433E1
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 May 2020 12:07:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F224F206F6
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 May 2020 12:07:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iWjg9vL5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="vT+6jpJ1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F224F206F6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=givZvO0HGm+z7f5p58NrVKb49CgxMY59m6C1r1Gtwxc=; b=iWjg9vL5m2XDyD
	g24lLFktmhvHKI7Ffc1yC8ZegWHnPQC32RcDmbOLD0gI8nAU7dZAWsJY6O2ScKFdvd7vHl4lk/PNr
	r/uQ21d2wgmFQN7YSs0Q7MZpLaytk5JFf/FHQtqMyk3qepzbUSVmMZewX/LIGa8+EW6d4J1/DiAsg
	MXFW5cFWTQJo0aXxz6s7tpHyyqDIMK6/kfK6STOzXW0MAHsG8rGW7kt1dtBy+gexikVth9VFHzy1r
	oGI+vuWpWxGY/GAGKnGUNjr1wOzolkQHZFG0PDvvnvxcvCZm4vNskJ7h3BtCv0JL7hvlnzPtKnUfS
	xU8feVZS3iH7EWws3Wvg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jc6So-0003dx-9G; Fri, 22 May 2020 12:07:46 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jc6ST-0003GG-35
 for linux-mediatek@lists.infradead.org; Fri, 22 May 2020 12:07:26 +0000
Received: by mail-wr1-x444.google.com with SMTP id i15so9893967wrx.10
 for <linux-mediatek@lists.infradead.org>; Fri, 22 May 2020 05:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4qsrdlMYn7x5hOVLhewaRstQDOvHPAnjD/8wA5HvEXI=;
 b=vT+6jpJ1P7RrV9Jx3RQ7Om4M58PL7A4kIEbnCSuEwEOJL4ZwGeVki9Qg0oZEvQxa/z
 ZsMPZbgH15zhCKs+z5ynXUnv4X8FrNw0pzlL6JmGT15ONKS83W/wge8ibRx3uAW1Hd9T
 T1Xk0eZUIdK8UDOL+Brz4BQ4Xr733SwB5MFE4voUF36q7jmzRuat/pg4wmHj8U+14+hm
 90IKoZfB5l5J3m8Eu+O9SZJxMh6FZQxw60EZEsIDIBlzFhFEFm7IdRwuBrFroWO7dx97
 +6ndN4CMhGcOVVdHF36okYgHYmAKHeuFv4t7CJ3+W5EZx6CI6URVELIypSZEmPjBV0oY
 Quqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4qsrdlMYn7x5hOVLhewaRstQDOvHPAnjD/8wA5HvEXI=;
 b=UF7CNGOAw5YsEzl+pHOwNZMzVPx2MGFLntGXzYgwBK8ikANQbeqe/yuRH9sktCX3pa
 lRNuCWHuJISUpGjcs+gd9q/1zptaDLueZ4XIdDy/bHEDOMUwd4cO87RRMqUDY90RbJMA
 9JHj+RkHEe4CtEjxOE6ZN8V5iOqPXZfy3wzwDh8tuN8XLQoJd55csG2qNGPj0Wff535/
 Y/A4GxV4rs+Mj3R5Kga4FDQ/nIHcBCTrlrGSDf8qNdKyDjKb59pqDmfsE/PZ/L5XX+wE
 y6xrznj/OkrEUXlON90zcH4aGQN86fM5f37oewzdMrPe87TQaHyji7e/MHALZjNk7q0E
 0hIw==
X-Gm-Message-State: AOAM5307YHglzb6icoD09vNSbWiyDM7w3VukUTBmwr+swVZ9Csl7klgI
 90Jv+c4K8wThPhwbhJgeA9F2eg==
X-Google-Smtp-Source: ABdhPJx0YTyJsAjfShQYfExW9Kil3IUzDeGMh+/tZJtiRbZd1I2UYjGr8s6bovo0qKKbD5mcqHGdLQ==
X-Received: by 2002:adf:ef47:: with SMTP id c7mr3440981wrp.57.1590149239980;
 Fri, 22 May 2020 05:07:19 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr.
 [2.15.156.232])
 by smtp.gmail.com with ESMTPSA id f128sm9946233wme.1.2020.05.22.05.07.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 05:07:19 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Rob Herring <robh+dt@kernel.org>, "David S . Miller" <davem@davemloft.net>,
 Matthias Brugger <matthias.bgg@gmail.com>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Jakub Kicinski <kuba@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Fabien Parent <fparent@baylibre.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Edwin Peer <edwin.peer@broadcom.com>
Subject: [PATCH v5 00/11] mediatek: add support for MediaTek Ethernet MAC
Date: Fri, 22 May 2020 14:06:49 +0200
Message-Id: <20200522120700.838-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200522_050725_134333_53A98DAB 
X-CRM114-Status: GOOD (  21.29  )
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

This series adds support for the STAR Ethernet Controller present on MediaTeK
SoCs from the MT8* family.

First we convert the existing DT bindings for the PERICFG controller to YAML
and add a new compatible string for mt8516 variant of it. Then we add the DT
bindings for the MAC.

Next we do some cleanup of the mediatek ethernet drivers directory.

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

v3 -> v4:
- drop the devres patches: they will be sent separately
- call netdev_sent_queue() & netdev_completed_queue() where appropriate
- don't redefine NET_IP_ALIGN: define a private constant in the driver
- fix a couple typos
- only disabe/enable the MAC in suspend/resume if netif is running
- drop the count field from the ring structure and instead calculate the number
  of used descriptors from the tail and head indicies
- rework the locking used to protect the ring structures from concurrent
  access: use cheaper spin_lock_bh() and completely disable the internal
  spinlock used by regmap
- rework the interrupt handling to make it more fine-grained: onle re-enable
  TX and RX interrupts while they're needed, process the stats updates in a
  workqueue, not in napi context
- shrink the code responsible for unmapping and freeing skb memory
- rework the barriers as advised by Arnd

v4 -> v5:
- rename the driver to make it less confusing with the existing mtk_eth_soc
  ethernet driver
- unregister the mdiobus at device's detachment
- open-code spin lock calls to avoid calling the _bh variants where unnecessary
- limit read-modify-write operations where possible when accessing descriptor
  memory
- use READ_ONCE/WRITE_ONCE when modifying the status and data_ptr descriptor
  fields

Bartosz Golaszewski (11):
  dt-bindings: convert the binding document for mediatek PERICFG to yaml
  dt-bindings: add new compatible to mediatek,pericfg
  dt-bindings: net: add a binding document for MediaTek STAR Ethernet
    MAC
  net: ethernet: mediatek: rename Kconfig prompt
  net: ethernet: mediatek: remove unnecessary spaces from Makefile
  net: ethernet: mtk-star-emac: new driver
  ARM64: dts: mediatek: add pericfg syscon to mt8516.dtsi
  ARM64: dts: mediatek: add the ethernet node to mt8516.dtsi
  ARM64: dts: mediatek: add an alias for ethernet0 for pumpkin boards
  ARM64: dts: mediatek: add ethernet pins for pumpkin boards
  ARM64: dts: mediatek: enable ethernet on pumpkin boards

 .../arm/mediatek/mediatek,pericfg.txt         |   36 -
 .../arm/mediatek/mediatek,pericfg.yaml        |   64 +
 .../bindings/net/mediatek,eth-mac.yaml        |   89 +
 arch/arm64/boot/dts/mediatek/mt8516.dtsi      |   17 +
 .../boot/dts/mediatek/pumpkin-common.dtsi     |   34 +
 drivers/net/ethernet/mediatek/Kconfig         |    9 +-
 drivers/net/ethernet/mediatek/Makefile        |    3 +-
 drivers/net/ethernet/mediatek/mtk_star_emac.c | 1678 +++++++++++++++++
 8 files changed, 1892 insertions(+), 38 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.txt
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml
 create mode 100644 Documentation/devicetree/bindings/net/mediatek,eth-mac.yaml
 create mode 100644 drivers/net/ethernet/mediatek/mtk_star_emac.c

-- 
2.25.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
