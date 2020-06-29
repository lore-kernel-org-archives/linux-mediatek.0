Return-Path: <SRS0=EINh=AK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4ADEC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 17:19:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8ABA4255A5
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 17:19:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WVNzuAtw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8ABA4255A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mImCSDzsM9SbOHKxt7rE1GzTI4UqRxQ8EvHu6FdRb9Q=; b=WVNzuAtwD6ddb4zJRtNdF1OKz
	KJRRyNs/djkbRsDQAlFDZ+EakLBYPdfs2g9xgrIdkU9aG856hS4NcE88DmRS25gntpXCC/G5XUvJw
	iWJK06mqej2g56yn4Sp6EG8u/OIvv9CEJxLeNxsg0fZ8OYH+pZOEz2lEFu5edO5Ddizfd8r+LlkN3
	vPcW0iQZ96RxjAIBarJ+ZD8TJuTMz5SYGv29Xf4U2JbvWsoNWmcwAwMSTg9rUBkmtMWJ/YEkEZMra
	1aE+A1qEN8Q4RaeYReYkMVsUtANYDtFfhnNIdGSwlT6qn6U/0aIooZTLdso9C4FSxbaonfu7gphCp
	utisW5/6A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpxQl-00029u-ES; Mon, 29 Jun 2020 17:18:55 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpxQg-00028e-7s; Mon, 29 Jun 2020 17:18:51 +0000
IronPort-SDR: Fcsed77jMVRM44Ez+DPwhmlH1sikcu8VP5BQxX8i51lxD0o9L3DEjdWQ9xNHWnA7hygQTUoVmT
 4LjCAZgr9MOw==
X-IronPort-AV: E=McAfee;i="6000,8403,9666"; a="143489304"
X-IronPort-AV: E=Sophos;i="5.75,295,1589266800"; d="scan'208";a="143489304"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2020 10:18:48 -0700
IronPort-SDR: PfovTJ7ctRVVTVNzrBgATY6YChrZ/17qHIHtYJnPMMZEpZLRlO/kZ9uRGO0xFF6kZv7z2obVoF
 C6l1q1l38H6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,295,1589266800"; d="scan'208";a="424885466"
Received: from orsmsx106.amr.corp.intel.com ([10.22.225.133])
 by orsmga004.jf.intel.com with ESMTP; 29 Jun 2020 10:18:47 -0700
Received: from orsmsx112.amr.corp.intel.com ([169.254.3.199]) by
 ORSMSX106.amr.corp.intel.com ([169.254.1.104]) with mapi id 14.03.0439.000;
 Mon, 29 Jun 2020 10:18:47 -0700
From: "Kirsher, Jeffrey T" <jeffrey.t.kirsher@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, "David S . Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, John Crispin
 <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>, Mark Lee
 <Mark-MC.Lee@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 "Heiner Kallweit" <hkallweit1@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 "Florian Fainelli" <f.fainelli@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "Rob Herring" <robh+dt@kernel.org>, Frank Rowand
 <frowand.list@gmail.com>
Subject: RE: [PATCH v2 02/10] net: ethernet: ixgbe: don't call
 devm_mdiobus_free()
Thread-Topic: [PATCH v2 02/10] net: ethernet: ixgbe: don't call
 devm_mdiobus_free()
Thread-Index: AQHWTg2KqoUStuk1GEW2zcU3EcxbWKjv1lQw
Date: Mon, 29 Jun 2020 17:18:46 +0000
Message-ID: <61CC2BC414934749BD9F5BF3D5D940449874064D@ORSMSX112.amr.corp.intel.com>
References: <20200629120346.4382-1-brgl@bgdev.pl>
 <20200629120346.4382-3-brgl@bgdev.pl>
In-Reply-To: <20200629120346.4382-3-brgl@bgdev.pl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.22.254.138]
MIME-Version: 1.0
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> -----Original Message-----
> From: Bartosz Golaszewski <brgl@bgdev.pl>
> Sent: Monday, June 29, 2020 05:04
> To: Kirsher, Jeffrey T <jeffrey.t.kirsher@intel.com>; David S . Miller
> <davem@davemloft.net>; Jakub Kicinski <kuba@kernel.org>; John Crispin
> <john@phrozen.org>; Sean Wang <sean.wang@mediatek.com>; Mark Lee
> <Mark-MC.Lee@mediatek.com>; Matthias Brugger
> <matthias.bgg@gmail.com>; Heiner Kallweit <hkallweit1@gmail.com>; Andrew
> Lunn <andrew@lunn.ch>; Florian Fainelli <f.fainelli@gmail.com>; Russell King
> <linux@armlinux.org.uk>; Rob Herring <robh+dt@kernel.org>; Frank Rowand
> <frowand.list@gmail.com>
> Cc: linux-kernel@vger.kernel.org; netdev@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; linux-mediatek@lists.infradead.org;
> devicetree@vger.kernel.org; Bartosz Golaszewski
> <bgolaszewski@baylibre.com>
> Subject: [PATCH v2 02/10] net: ethernet: ixgbe: don't call
> devm_mdiobus_free()
> 
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> The idea behind devres is that the release callbacks are called if probe fails. As
> we now check the return value of ixgbe_mii_bus_init(), we can drop the call
> devm_mdiobus_free() in error path as the release callback will be called
> automatically.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
 
Acked-by: Jeff Kirsher <jeffrey.t.kirsher@intel.com>

> ---
>  drivers/net/ethernet/intel/ixgbe/ixgbe_phy.c | 14 +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
