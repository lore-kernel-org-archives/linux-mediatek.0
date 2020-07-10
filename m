Return-Path: <SRS0=M7U7=AV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DA92C433E1
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2020 12:56:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE22B20720
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2020 12:56:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N38LNWzo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="iJb5IRo7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE22B20720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZFpIDr5vmvzjN5QUKSWpNsqQI/dRtv5Xi6Inoce8fYw=; b=N38LNWzoQR5RvagBUCkNsDzXci
	NAAH6IXG771guY7K4r172RQAbx+f4qT7A4IgghinEB6/j46WAZC41koncYSnsSyVC6o23g3gdj0jg
	6vUwfM48ciExpAZUsFQef1oZJXcmme2lwcKZ+5jT82BeJbz1QRnCWUjhGsQ0IjFZAfvOm6L9peicj
	6BVUXjifHbLk9ICluJs5fOPgZrx281Gka7g4xIon3Dq7CCNN3y6OhQtwJwBlNkojP5XB06L1RfIPw
	7CChnb0WdHVuEFcr26+UCINUzTbqdvn3mxHr0+OJ7SoiJwuSvpBsGoCydSNyd9SgMswrSXAcdeAiO
	ogu+VkKQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtsZs-00071F-Bb; Fri, 10 Jul 2020 12:56:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtsZq-0006zs-2P
 for linux-mediatek@lists.infradead.org; Fri, 10 Jul 2020 12:56:30 +0000
Received: from localhost.localdomain.com (unknown [151.48.133.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7B94620772;
 Fri, 10 Jul 2020 12:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594385788;
 bh=zEuVCwMPtcmeOrD97rEoLQftJ9vTfb19Y2/O838xjmQ=;
 h=From:To:Cc:Subject:Date:From;
 b=iJb5IRo7LIsk+gt6Jbd3t4MdAN1na6880DGZv+LSv5/CdJqrO41t5qoikkbeM1u5a
 DOlO5eF2bPJVwAxFdy8AaCTXO9lJMrpu0jSxiY5pkFdDshG8q1IKeGjMZFs5uVlccA
 T9Kz0nK+mKqOXu2nFQA2eE2EQUTvQs1J7/bL/Q9A=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH 0/6] introduce support for mt7663s devices
Date: Fri, 10 Jul 2020 14:56:14 +0200
Message-Id: <cover.1594384887.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200710_085630_195935_8BED8AC6 
X-CRM114-Status: GOOD (  10.01  )
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
Cc: linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com,
 sean.wang@mediatek.com, linux-wireless@vger.kernel.org, ryder.lee@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Introduce support for mt7663s 802.11ac 2x2:2 chipset to mt7615 driver.
Introduce mt76_sdio module as common sdio layer.
Introduce mt7663-common module as container for shared code between usb and
sdio mt7663 drivers

Lorenzo Bianconi (4):
  mt76: mt7615: take into account sdio bus configuring txwi
  mt76: mt76u: add mt76_skb_adjust_pad utility routine
  mt76: mt7615: sdio code must access rate/key regs in preocess context
  mt76: mt7615: introduce mt7663-common module

Sean Wang (2):
  mt76: introduce mt76_sdio module
  mt76: mt7615: introduce mt7663s support

 drivers/net/wireless/mediatek/mt76/Kconfig    |   4 +
 drivers/net/wireless/mediatek/mt76/Makefile   |   2 +
 drivers/net/wireless/mediatek/mt76/mac80211.c |   6 +-
 drivers/net/wireless/mediatek/mt76/mt76.h     |  34 +-
 .../net/wireless/mediatek/mt76/mt7615/Kconfig |  17 +-
 .../wireless/mediatek/mt76/mt7615/Makefile    |   6 +-
 .../net/wireless/mediatek/mt76/mt7615/mac.c   |  20 +-
 .../net/wireless/mediatek/mt76/mt7615/main.c  |   6 +-
 .../net/wireless/mediatek/mt76/mt7615/mcu.c   |  42 +-
 .../net/wireless/mediatek/mt76/mt7615/mcu.h   |  10 +
 .../net/wireless/mediatek/mt76/mt7615/mmio.c  |   1 +
 .../wireless/mediatek/mt76/mt7615/mt7615.h    |  20 +-
 .../net/wireless/mediatek/mt76/mt7615/regs.h  |  12 +
 .../net/wireless/mediatek/mt76/mt7615/sdio.c  | 204 ++++
 .../wireless/mediatek/mt76/mt7615/sdio_mcu.c  | 161 +++
 .../net/wireless/mediatek/mt76/mt7615/usb.c   | 253 +----
 .../wireless/mediatek/mt76/mt7615/usb_init.c  | 145 ---
 .../wireless/mediatek/mt76/mt7615/usb_mcu.c   |   3 +-
 .../wireless/mediatek/mt76/mt7615/usb_sdio.c  | 394 ++++++++
 .../wireless/mediatek/mt76/mt76x02_usb_core.c |   3 +-
 drivers/net/wireless/mediatek/mt76/sdio.c     | 948 ++++++++++++++++++
 drivers/net/wireless/mediatek/mt76/sdio.h     | 111 ++
 drivers/net/wireless/mediatek/mt76/tx.c       |  29 +
 drivers/net/wireless/mediatek/mt76/usb.c      |  29 -
 24 files changed, 2026 insertions(+), 434 deletions(-)
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7615/sdio.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7615/sdio_mcu.c
 delete mode 100644 drivers/net/wireless/mediatek/mt76/mt7615/usb_init.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7615/usb_sdio.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/sdio.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/sdio.h

-- 
2.26.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
