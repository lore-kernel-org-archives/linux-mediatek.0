Return-Path: <SRS0=EINh=AK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4299C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 17:17:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B24CF255A5
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 17:17:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u/pVU31u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B24CF255A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fYG88TXhdoVYR5DIRi2unCyVbZG2wGq1ANdMrYCXf3A=; b=u/pVU31u2Lqdw3lK1HZAVLovP
	ca1T7jSKG7d+0RjerDh0fQIwBn63cRP+6S3lBcc96pl9xJg7a3WjHgbNHlmh5IqRo0vFr8/oJ/wKk
	I1ETDar9OO+CkTaSO5AZ5C1ptx0iiSDYGTsnRkSayPgQlV5rvyvMWxRZeh+5bys7HpG9JkoB+bGcX
	HJ3L4L+MJ3OK7UYR3fimNj3FxnG/zWrsBFC7vbCE4srZGGZvYcPIaKzyvGM8agO8+hYeRzNLKryQC
	RY9GBm5gcNhSmD5lWuGSQ2R5HAiza8iPkvyMKfs5Ga2nlV1oIkR+hRnpsKfUob4fjS18wSYSfpAui
	Qb8I4rsIQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpxPB-0001oG-0c; Mon, 29 Jun 2020 17:17:17 +0000
Received: from mga06.intel.com ([134.134.136.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpxP8-0001o0-Iz; Mon, 29 Jun 2020 17:17:15 +0000
IronPort-SDR: EQn7cdVm3VK3uowQIZZ1k2+ftvHUOrqVZzTI+GXGs1so5rX37cc7ICgRSCr2Jr/pGmgI6iSDtx
 4suO9NoHhSvQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9666"; a="207519971"
X-IronPort-AV: E=Sophos;i="5.75,295,1589266800"; d="scan'208";a="207519971"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2020 10:17:12 -0700
IronPort-SDR: drsb/8/BwkA3Y2h1fsUPStPFXNQJ5FQkja8l/n53h3urLpIrJ7NopQ1VBDXnKKbcTMU7N0TbNS
 9Qh3pagMirFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,295,1589266800"; d="scan'208";a="280936341"
Received: from orsmsx109.amr.corp.intel.com ([10.22.240.7])
 by orsmga006.jf.intel.com with ESMTP; 29 Jun 2020 10:17:12 -0700
Received: from orsmsx111.amr.corp.intel.com (10.22.240.12) by
 ORSMSX109.amr.corp.intel.com (10.22.240.7) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 29 Jun 2020 10:17:12 -0700
Received: from orsmsx112.amr.corp.intel.com ([169.254.3.199]) by
 ORSMSX111.amr.corp.intel.com ([169.254.12.75]) with mapi id 14.03.0439.000;
 Mon, 29 Jun 2020 10:17:11 -0700
From: "Kirsher, Jeffrey T" <jeffrey.t.kirsher@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, "David S . Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, John Crispin
 <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>, Mark Lee
 <Mark-MC.Lee@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Heiner
 Kallweit <hkallweit1@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Florian
 Fainelli <f.fainelli@gmail.com>, Russell King <linux@armlinux.org.uk>, Rob
 Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Subject: RE: [PATCH v2 01/10] net: ethernet: ixgbe: check the return value
 of ixgbe_mii_bus_init()
Thread-Topic: [PATCH v2 01/10] net: ethernet: ixgbe: check the return value
 of ixgbe_mii_bus_init()
Thread-Index: AQHWTg2BLgDIjVCQa0C9CEFbwRBNpqjv0qMg
Date: Mon, 29 Jun 2020 17:17:11 +0000
Message-ID: <61CC2BC414934749BD9F5BF3D5D94044987405F1@ORSMSX112.amr.corp.intel.com>
References: <20200629120346.4382-1-brgl@bgdev.pl>
 <20200629120346.4382-2-brgl@bgdev.pl>
In-Reply-To: <20200629120346.4382-2-brgl@bgdev.pl>
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
> Subject: [PATCH v2 01/10] net: ethernet: ixgbe: check the return value of
> ixgbe_mii_bus_init()
> 
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> This function may fail. Check its return value and propagate the error code.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
 
Acked-by: Jeff Kirsher <jeffrey.t.kirsher@intel.com>

> ---
>  drivers/net/ethernet/intel/ixgbe/ixgbe_main.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
