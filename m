Return-Path: <SRS0=Nu0C=6Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 546B6C54E8E
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 15:08:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B4D220643
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 15:08:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JlerYIXy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="OTdMO8s1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B4D220643
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eAQXmHwyGoAE1bF7e58/ewx3uznWeFsQ4oflEJmyVtU=; b=JlerYIXy/VH08w
	TqyOxyM2vcm0tqHVMKGQ4Gwj5Bc6kZZFb5sT3+YgUO5dvu7ZaAAHcU9T13VBrmgeoOv7mEveZKuG+
	iRcG6vwNjVGAlgGxTjqwuulVp5cHjsDo3hTxTfVRJjP65ZM3h4Em3zUvRoGtkjUXJ/k8dObLq4nip
	uZhYlCB+vWeoQn4KFNi4uNzCitwS5iZNQnKR1FSS4jY/nWjwJzurB2eCkB4tCs0AG1YMnuwH+zYDt
	1Rzuceje2+wn8elQcQqsbPJJ0qbCSJxeEOvpbyc1w0V15p4rQIRNOK6HjpBNOzdUqCD+A0xz4OJqE
	AA5s8ytSl5By22Ud8+/Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYA2q-0002lG-Sb; Mon, 11 May 2020 15:08:40 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYA2X-0002H1-KX
 for linux-mediatek@lists.infradead.org; Mon, 11 May 2020 15:08:23 +0000
Received: by mail-wm1-x342.google.com with SMTP id e26so18398455wmk.5
 for <linux-mediatek@lists.infradead.org>; Mon, 11 May 2020 08:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/J8miyILwwd4yeHypeApHEY6tVwb+3C32vv+icx83JU=;
 b=OTdMO8s1WgboMNhaDTGwQRLL6oPTm6LLnYMKvpds/gLxCEYm/L/tz9ICUGzZLiU3ei
 YvwiSmIcssbhOdrNVTjU1HfBqBCs40dnl89hXOHPRmjaAeJghS71NCJu97EEFzClXyBj
 zTErYcE0rLjPIXk+WVMw1CWhUrB1AnSiADXS9GirXjYlf3y0SX2kJ2UxyLMjh70hVx8I
 8EHLcu3Ps8hB00DG8HRf8pVDeNBL0fkVe//Q9BB7IlC/wjAB4W/ZNdfHvQ/nEkSNqcuW
 58RZ2Gwh4Oygoe8bll6iXGBANCMQIPkT9lY0vDfjRphc+q+S6RvvW0gPn4yLXGy29b/Y
 zW1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/J8miyILwwd4yeHypeApHEY6tVwb+3C32vv+icx83JU=;
 b=MMLGGUzOEIIrvWpUMeYIQkpdskPWzXBCD5HHDg9Mb0+MwwZVepTQXQDbpmRta4PSl8
 mujqbEHdLdpHEPXKYP5dXeVwqyz8I+zOPHIjjJuGd3G4NCxJExH3lZjEoFfRI336yVp9
 bo3eKAfl7uT++1i4tryWeoEgIRI5kc426XQRK29+ccryaxnPS84tc1Spiyi9tyA1oR6G
 yA2KwLlN5PtLHjQ/jb5u3VFrr1I4LzBK2KAtDs4K3DSwbio5zAfXnxB5uf74kASuTuL5
 zQPmEK/d3rlsVuVddHc52aG2/MTLvRpVrftQKJZptINa6h/SsxMiMRsNY98qWHn6VaDh
 BihQ==
X-Gm-Message-State: AGi0Pua8i5SnucyfhprElMwOZEC3N4SMP4TcekLYvK1E8k+EfCwPcqOF
 BGrYS8eTuw728xEijFZrCx/Rbg==
X-Google-Smtp-Source: APiQypKvNSjq4TfJ0CivzedoluQIOXBiXcFnJi5slyojLcRrav800+2iZaWdjk73vkbbGixHhUBMBA==
X-Received: by 2002:a1c:2457:: with SMTP id k84mr30052808wmk.96.1589209699367; 
 Mon, 11 May 2020 08:08:19 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr.
 [2.15.156.232])
 by smtp.gmail.com with ESMTPSA id 94sm3514792wrf.74.2020.05.11.08.08.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 08:08:18 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Rob Herring <robh+dt@kernel.org>, "David S . Miller" <davem@davemloft.net>,
 Matthias Brugger <matthias.bgg@gmail.com>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Jakub Kicinski <kuba@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Fabien Parent <fparent@baylibre.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Edwin Peer <edwin.peer@broadcom.com>
Subject: [PATCH v2 00/14] mediatek: add support for MediaTek Ethernet MAC
Date: Mon, 11 May 2020 17:07:45 +0200
Message-Id: <20200511150759.18766-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_080821_720913_F866D4C2 
X-CRM114-Status: GOOD (  16.80  )
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

This adds support for the Ethernet Controller present on MediaTeK SoCs
from the MT8* family.

The first two patches add binding documents for the PERICFG syscon and
for the MAC itself.

Patches 3/14 & 4/14 do some cleanup of the mediatek ethernet drivers
directory.

Patch 5/14 provides a new helper that allows to retrieve the address of
the net_device associated with given private data address.

Patches 6-8/14 introduce the managed variant of register_netdev().

Patch 9/11 adds the new ethernet driver.

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

Bartosz Golaszewski (14):
  dt-bindings: arm: add a binding document for MediaTek PERICFG
    controller
  dt-bindings: net: add a binding document for MediaTek Ethernet MAC
  net: ethernet: mediatek: rename Kconfig prompt
  net: ethernet: mediatek: remove unnecessary spaces from Makefile
  net: core: provide priv_to_netdev()
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

 .../arm/mediatek/mediatek,pericfg.yaml        |   34 +
 .../bindings/net/mediatek,eth-mac.yaml        |   80 +
 arch/arm64/boot/dts/mediatek/mt8516.dtsi      |   17 +
 .../boot/dts/mediatek/pumpkin-common.dtsi     |   34 +
 drivers/net/ethernet/mediatek/Kconfig         |    8 +-
 drivers/net/ethernet/mediatek/Makefile        |    3 +-
 drivers/net/ethernet/mediatek/mtk_eth_mac.c   | 1561 +++++++++++++++++
 include/linux/netdevice.h                     |   14 +
 net/Makefile                                  |    2 +-
 net/devres.c                                  |   95 +
 net/ethernet/eth.c                            |   28 -
 11 files changed, 1845 insertions(+), 31 deletions(-)
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
