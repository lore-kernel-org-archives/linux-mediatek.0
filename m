Return-Path: <SRS0=DVVK=FE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B886C63777
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Nov 2020 17:03:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2A6F20725
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Nov 2020 17:03:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vTeZSFE7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2A6F20725
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=holtmann.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:References:Message-Id:Date:In-Reply-To:From:
	Subject:Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LGeGs6jhljdgq1DZ2EaDoU4WFFwFEVtrtd8JFCLuMxE=; b=vTeZSFE7go/qBxhEt/2nQDrL4
	nKPkdGblulLrKCug5D3/+WbykqaRAHD+ylIUcszbEcjRja9hOJgvWBcXfz0fJTmJy46IMVa2E5bjX
	xXic5GGSYJsVEfkhmMt/j9wUFeCVlUAtNQ+hsrErD1zjY5We/I6ZZ9KEpuJb6DdxQ83jHKbbzo074
	BeP1dIng2nXDYksaC/xHQZq6YPfmVL9QIsd7z97+yt0IwNY1L2pMobd1V3cNx+7SaEVLri0equ96A
	fHIb3uY/6wpNyMjkcVfuxsY1NhWad+7iRYYuSQaGHfcuvNvcs4dhFY9f9jDS2uugFMJlYye1zrSCx
	xXptrkMZg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjmaB-0007Dj-JQ; Mon, 30 Nov 2020 17:03:23 +0000
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjma9-0007Cg-8D
 for linux-mediatek@lists.infradead.org; Mon, 30 Nov 2020 17:03:22 +0000
Received: from [172.20.10.2] (tmo-111-84.customers.d1-online.com
 [80.187.111.84])
 by mail.holtmann.org (Postfix) with ESMTPSA id 3FCBCCED17;
 Mon, 30 Nov 2020 18:10:26 +0100 (CET)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.20.0.2.21\))
Subject: Re: [PATCH] MTK mt7921 driver upstream
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20201130071655.31515-1-peter.tsao@mediatek.com>
Date: Mon, 30 Nov 2020 18:03:12 +0100
Message-Id: <BCEF6F87-2B01-49F6-9494-A08E75C9F1AD@holtmann.org>
References: <20201130071655.31515-1-peter.tsao@mediatek.com>
To: peter.tsao@mediatek.com
X-Mailer: Apple Mail (2.3654.20.0.2.21)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_120321_458994_6EA19769 
X-CRM114-Status: UNSURE (   9.53  )
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
Cc: Johan Hedberg <johan.hedberg@gmail.com>, mark-yw.chen@mediatek.com,
 justin.tsai@mediatek.com, LKML <linux-kernel@vger.kernel.org>,
 can.chen@mediatek.com, BlueZ development <linux-bluetooth@vger.kernel.org>,
 linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Peter,

every patch needs a proper commit message.

> Signed-off-by: Peter Tsao <peter.tsao@mediatek.com>
> ---
> drivers/bluetooth/btmtk_buffer_mode.c         |  263 +
> drivers/bluetooth/btmtk_main.c                | 5517 +++++++++++++++++
> drivers/bluetooth/include/btmtk_buffer_mode.h |   78 +
> drivers/bluetooth/include/btmtk_chip_if.h     |   30 +
> drivers/bluetooth/include/btmtk_define.h      |  304 +
> drivers/bluetooth/include/btmtk_drv.h         |  157 +
> drivers/bluetooth/include/btmtk_main.h        |  587 ++
> drivers/bluetooth/include/sdio/btmtk_sdio.h   |  147 +
> drivers/bluetooth/include/uart/btmtk_uart.h   |   86 +
> drivers/bluetooth/include/usb/btmtk_usb.h     |  100 +
> drivers/bluetooth/sdio/btmtksdio.c            | 2004 ++++++
> drivers/bluetooth/usb/btmtkusb.c              | 3218 ++++++++++
> 12 files changed, 12491 insertions(+)

The drivers/bluetooth/ is not your playground. Keep the structure flat.

> create mode 100644 drivers/bluetooth/btmtk_buffer_mode.c
> create mode 100644 drivers/bluetooth/btmtk_main.c
> create mode 100644 drivers/bluetooth/include/btmtk_buffer_mode.h
> create mode 100644 drivers/bluetooth/include/btmtk_chip_if.h
> create mode 100644 drivers/bluetooth/include/btmtk_define.h
> create mode 100644 drivers/bluetooth/include/btmtk_drv.h
> create mode 100644 drivers/bluetooth/include/btmtk_main.h
> create mode 100644 drivers/bluetooth/include/sdio/btmtk_sdio.h
> create mode 100644 drivers/bluetooth/include/uart/btmtk_uart.h
> create mode 100644 drivers/bluetooth/include/usb/btmtk_usb.h
> create mode 100644 drivers/bluetooth/sdio/btmtksdio.c
> create mode 100644 drivers/bluetooth/usb/btmtkusb.c

And this is too much in a single patch. Split this up.

This patch is not acceptable upstream in this form. Strip all your home grown debugging and duplicates out of the patch. And I am no longer accepting any line discipline drivers. So scrap that as well. Also any kind of snooping stuff is not needed since we have btmon.

In addition, what is wrong with the existing drivers?

Regards

Marcel


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
