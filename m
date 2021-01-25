Return-Path: <SRS0=y96F=G4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70EE5C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jan 2021 18:33:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11A9522B3F
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jan 2021 18:33:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11A9522B3F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=holtmann.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:References:Message-Id:Date:In-Reply-To:From:
	Subject:Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YX50FoHtrrn3kF1M+cmF7JmWBfs2gS2xomMdyx5PQlk=; b=QzyHCO5YjbuUxeP/KC+OjK0U8
	SxqxX0isofJJZPd/6OpgiLiV4e6EZoNzdO/jGzRTUuKo904WTxVN0I9fuwCUvaM1CptEE4qvJTEBJ
	0GXqXyapryprUAlxLHR8wi7wDnwg4wNP0eonlu4Gb1YkCQ0tTlHIsfA1Ft5KGm0xDP4C8+IoKESyG
	ssAGv2fCPomF7xh2Dh4/1a7OTXpc82j+WUcSbrUzVU/1ljRQXKcjvKrFfj4i6vRo1FmuM1O5yluBi
	w+xEkenQMd3pWQr43LsTpNGj8AEVbPmWGe95/L98oNR2lHnO7L8J8g+YCnNEKdXXeewBOufpNj+NI
	muA4vgQ0A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l46fM-0005jb-Q1; Mon, 25 Jan 2021 18:32:44 +0000
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l46fI-0005hq-1a; Mon, 25 Jan 2021 18:32:41 +0000
Received: from marcel-macbook.holtmann.net (p4ff9f11c.dip0.t-ipconnect.de
 [79.249.241.28])
 by mail.holtmann.org (Postfix) with ESMTPSA id 78BB2CECCA;
 Mon, 25 Jan 2021 19:39:56 +0100 (CET)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: [PATCH] Bluetooth: btusb: Add a Kconfig option to disable USB
 wakeup by default
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20201230065441.1179-1-max.chou@realtek.com>
Date: Mon, 25 Jan 2021 19:32:31 +0100
Message-Id: <D8DB0325-437C-453B-86CC-55B4F255B335@holtmann.org>
References: <20201230065441.1179-1-max.chou@realtek.com>
To: Max Chou <max.chou@realtek.com>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_133240_216522_64DC49B7 
X-CRM114-Status: GOOD (  10.24  )
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
Cc: Johan Hedberg <johan.hedberg@gmail.com>, kidman@realtek.com,
 Hilda Wu <hildawu@realtek.com>, LKML <linux-kernel@vger.kernel.org>,
 Bluetooth Kernel Mailing List <linux-bluetooth@vger.kernel.org>,
 Alex Lu <alex_lu@realsil.com.cn>, linux-mediatek@lists.infradead.org,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Max,

> For the original commit of 9e45524a011107a73bc2cdde8370c61e82e93a4d,
> wakeup is always disabled for Realtek Bluetooth devices.
> However, there's the capability for Realtek Bluetooth devices to
> apply USB wakeup. Otherwise, there's the better power consumption
> without USB wakeup during suspending.
> In this commit, divide the original commit into two parts.
> 1. Redefine the feature that Realtek devices should be enabled wakeup on
> auto-suspend as BTUSB_WAKEUP_AUTOSUSPEND.
> 2. Add a Kconfig option to switch disable_wakeup for Bluetooth
> USB devices by default as CONFIG_BT_HCIBTUSB_DISABLEWAKEUP.

lets not make this so complicated. Lets just make this work. So define this based on the Realtek hardware that supports it and not just a generic option. If your hardware is broken or works different from revision to revision, then quirk it inside the driver.

Regards

Marcel


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
