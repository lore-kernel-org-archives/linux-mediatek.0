Return-Path: <SRS0=dQnm=BJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD955C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2020 10:32:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C4F02082E
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2020 10:32:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UV6dYmyF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Uwp9v1rd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C4F02082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=i7bJy1sVzGGrCh5EEm6TcJG89K7Ki0/6Hs8A+erHMuc=; b=UV6dYmyFNRlyGX4zABtVef1ND9
	mgWaszJDT6YW8s6GYXE/ISiO/JrW5st84rn7WpRb1ceEEN4QK5MLMkUSVSmc/NCpbhEa+GKoy2ANw
	zLhPP2SwJzdMO4hAOlu6n25AFahgXhQ78n/HvunpFL/xsmR76yMGGmwJ8HRvaSCab8w8GXFWVUbp7
	6LQzKckvXHYyHabSvtemtYTMAu2zaitxz7/gsk4+30h5UprkEoxJZqhWd9nsI8/s1OarYa6ZiGH3T
	3N/spySL8pHsjH0s1gmYSxKT11vrP2JebRvneVKeDfY3kPNjM72Z3o9ZKeuhSPhpGJrB8Et7ijdlO
	3+v5QXKg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k15rZ-0006Y4-BM; Thu, 30 Jul 2020 10:32:37 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k15rP-0006Tq-O1; Thu, 30 Jul 2020 10:32:29 +0000
X-UUID: c83c49a8748846a6a4566bae9e727f0d-20200730
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=G6HeZr3xVZvC12t/cmuV9GZ3u6QAq9e6j97h583fwvQ=; 
 b=Uwp9v1rdAQL4Vjv7C5YAhFcOydTO5cJYmdMUJMINYkmLuZiLyfGi+6vuxqL0n7W2q/hvqpXQziu8jIbIz9a5xwx6HdAD8JBYZ/Lrcl5e5k+vH8OpMs17WZSjLWeQu97ERTIjDgnx/eI7NsRuVedh6A90QeYmts4AIpq/g6rD7RQ=;
X-UUID: c83c49a8748846a6a4566bae9e727f0d-20200730
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <crystal.guo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 908135900; Thu, 30 Jul 2020 02:31:49 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 30 Jul 2020 03:22:19 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 30 Jul 2020 18:22:16 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 30 Jul 2020 18:22:16 +0800
From: Crystal Guo <crystal.guo@mediatek.com>
To: <linux@roeck-us.net>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
Subject: add watchdog support for mt8192 
Date: Thu, 30 Jul 2020 18:21:45 +0800
Message-ID: <1596104510-11113-1-git-send-email-crystal.guo@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200730_063228_021573_AA57EE1B 
X-CRM114-Status: GOOD (  10.91  )
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
Cc: linux-watchdog@vger.kernel.org, srv_heupstream@mediatek.com,
 seiya.wang@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

v3 changes:
1.separate fixing compatibles description and adding new board with two patches.
2.update mt8183 DTSI for sync with the binding, while mt2712 DTSI has no watchdog node,
thus not update it together.


v2 changes:
https://patchwork.kernel.org/patch/11690729/
https://patchwork.kernel.org/patch/11690731/
https://patchwork.kernel.org/patch/11690719/


v1 changes:
https://patchwork.kernel.org/patch/11680495/
https://patchwork.kernel.org/patch/11680497/

Crystal Guo (5):
  dt-binding: mediatek: watchdog: fix the description of compatible
  arm64: dts: mt8183: update watchdog device node
  dt-binding: mediatek: mt8192: update mtk-wdt document
  dt-binding: mt8192: add toprgu reset-controller head file
  watchdog: mt8192: add wdt support

 .../devicetree/bindings/watchdog/mtk-wdt.txt       |  5 ++--
 arch/arm64/boot/dts/mediatek/mt8183.dtsi           |  3 +--
 drivers/watchdog/mtk_wdt.c                         |  6 +++++
 .../dt-bindings/reset-controller/mt8192-resets.h   | 30 ++++++++++++++++++++++
 4 files changed, 40 insertions(+), 4 deletions(-)
 create mode 100644 include/dt-bindings/reset-controller/mt8192-resets.h
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
