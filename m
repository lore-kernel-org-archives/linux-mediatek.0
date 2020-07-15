Return-Path: <SRS0=kQBs=A2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEA0CC433E5
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jul 2020 12:46:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C02D720578
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jul 2020 12:46:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LqQjxCQc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="O3EVXwim"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C02D720578
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=983CUn9JB+oCX5Wqxy33O7Gokpnn4Mp9Ox9xLh3vhfE=; b=LqQjxCQcuOXN5Py4tim5poNjKJ
	pyz9h46hx99vU3zqk+ugmWwzgHvVu0DU2vBbmG95Rd174igoKAL521XzdRC8zERkSiU7SYTPwIaJr
	NwAd3mfexc+Em6SHNl2YF70ilcmlIdpNlihARNQMljJhYXmTpSelbvV1zE5nw9V0jCa0EAp+EMmnB
	CVNJvYunuXqiVVNVFwPzGYKMxthCW4by8IDoBolFhgQqpwWLYfzW3lpATW3T15NnVLd7PGzq4VOPB
	TgF858XYXvxmgbZbyxvPWReazysTw+D8alaqmgmXMrJcjlny7JCV2t9RWj5tN5s54ImQktb8p3t/S
	QeihjpJA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvgo9-0003TJ-MV; Wed, 15 Jul 2020 12:46:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvgo7-0003St-BE
 for linux-mediatek@lists.infradead.org; Wed, 15 Jul 2020 12:46:44 +0000
Received: from localhost.localdomain.com (unknown [151.48.133.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D63BF20578;
 Wed, 15 Jul 2020 12:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594817202;
 bh=Ln6GACSEdsRfqzDZIE32+bve+4nimxMAv6/Q7sLUH/c=;
 h=From:To:Cc:Subject:Date:From;
 b=O3EVXwimOYPPUUKk3ihUFoOCXNO61T1jxwdXY8hMMbeqkJq3AZoQOuaciR7IuQ81g
 HGQ82UJzqc0HD84LtQhpK+rY5ABhGtbgshy6ENzpZ/91SJ2AVpgedXppnQ5qVzr4zU
 f+BOevjkIUXcv1YtN0Yl33qPG4CyIeCJdyXqpANU=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH v2 0/6] introduce support for mt7663s devices
Date: Wed, 15 Jul 2020 14:46:25 +0200
Message-Id: <cover.1594815602.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200715_084643_450756_A265A854 
X-CRM114-Status: UNSURE (   9.99  )
X-CRM114-Notice: Please train this message.
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

Changes since v1:
 - remove mt7663s reg-map dependency from mt76-sdio module
 - get rid of rx buffer pre-allocation in mt76-sdio module
 - enable sdio rx aggregation
 - move tx/rx post-processing in a dedicated kthread

Lorenzo Bianconi (4):
  mt76: mt7615: take into account sdio bus configuring txwi
  mt76: mt76u: add mt76_skb_adjust_pad utility routine
  mt76: mt7615: sdio code must access rate/key regs in preocess context
  mt76: mt7615: introduce mt7663-usb-sdio-common module

Sean Wang (2):
  mt76: introduce mt76_sdio module
  mt76: mt7615: introduce mt7663s support

 drivers/net/wireless/mediatek/mt76/Kconfig    |   4 +
 drivers/net/wireless/mediatek/mt76/Makefile   |   2 +
 drivers/net/wireless/mediatek/mt76/mac80211.c |   6 +-
 drivers/net/wireless/mediatek/mt76/mt76.h     |  32 +-
 .../net/wireless/mediatek/mt76/mt7615/Kconfig |  17 +-
 .../wireless/mediatek/mt76/mt7615/Makefile    |   6 +-
 .../net/wireless/mediatek/mt76/mt7615/mac.c   |  20 +-
 .../net/wireless/mediatek/mt76/mt7615/main.c  |   6 +-
 .../net/wireless/mediatek/mt76/mt7615/mcu.c   |  42 +-
 .../net/wireless/mediatek/mt76/mt7615/mcu.h   |  10 +
 .../net/wireless/mediatek/mt76/mt7615/mmio.c  |   1 +
 .../wireless/mediatek/mt76/mt7615/mt7615.h    |  23 +-
 .../net/wireless/mediatek/mt76/mt7615/regs.h  |  12 +
 .../net/wireless/mediatek/mt76/mt7615/sdio.c  | 478 ++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7615/sdio.h  | 115 +++++
 .../wireless/mediatek/mt76/mt7615/sdio_mcu.c  | 161 ++++++
 .../wireless/mediatek/mt76/mt7615/sdio_txrx.c | 271 ++++++++++
 .../net/wireless/mediatek/mt76/mt7615/usb.c   | 253 +--------
 .../wireless/mediatek/mt76/mt7615/usb_init.c  | 145 ------
 .../wireless/mediatek/mt76/mt7615/usb_mcu.c   |   3 +-
 .../wireless/mediatek/mt76/mt7615/usb_sdio.c  | 394 +++++++++++++++
 .../wireless/mediatek/mt76/mt76x02_usb_core.c |   3 +-
 drivers/net/wireless/mediatek/mt76/sdio.c     | 363 +++++++++++++
 drivers/net/wireless/mediatek/mt76/tx.c       |  29 ++
 drivers/net/wireless/mediatek/mt76/usb.c      |  29 --
 25 files changed, 1991 insertions(+), 434 deletions(-)
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7615/sdio.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7615/sdio.h
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7615/sdio_mcu.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7615/sdio_txrx.c
 delete mode 100644 drivers/net/wireless/mediatek/mt76/mt7615/usb_init.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7615/usb_sdio.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/sdio.c

-- 
2.26.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
