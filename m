Return-Path: <SRS0=AAZc=AL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D29AFC433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 22:58:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9974320722
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 22:58:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UDBBVEN9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9974320722
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davemloft.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:From:Subject:To:
	Message-Id:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2VZUtSmQyX9eJeCDd9afpOexSN6OrF39dGqaUn/ccZo=; b=UDBBVEN9VEx73ieWpTlBAG+o+
	skttnMj1AoawvNJdSzw7u+P7uTTCPMUN6N8x1htnjK7r0IWDGjbzDQ/spzZNksJH7loxDL7BH/8Sl
	dx2lc4s0Xz9FQVmKy1tI8sf7tAX8GyVQVR2mXbhJdnaOrOm/tSn5+aWoRb7I283VpGlfVeVP5niUC
	ApJOsNrp2bgbwwgcUa8u5f9TwfUgJLWSpSgModcHn0KMJLzhYb8o5FeZtzpo2FuB36aAnNSX8v8zm
	EKBHLaByWUjaNRfN693tC8ty5b1+Yp6XdEbj7MK2mmwYyigFzbpxl1flNVoqhXv9I2fEpN28889jd
	6XZ2dakQg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqPCh-0007gn-AG; Tue, 30 Jun 2020 22:58:15 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqPCd-0007eo-Bv; Tue, 30 Jun 2020 22:58:12 +0000
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 0DA8E127BE238;
 Tue, 30 Jun 2020 15:58:02 -0700 (PDT)
Date: Tue, 30 Jun 2020 15:58:02 -0700 (PDT)
Message-Id: <20200630.155802.2190042564289803175.davem@davemloft.net>
To: brgl@bgdev.pl
Subject: Re: [PATCH v2 00/10] net: improve devres helpers
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200629120346.4382-1-brgl@bgdev.pl>
References: <20200629120346.4382-1-brgl@bgdev.pl>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Tue, 30 Jun 2020 15:58:03 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200630_185811_685337_A014928E 
X-CRM114-Status: GOOD (  13.24  )
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
Cc: andrew@lunn.ch, f.fainelli@gmail.com, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, sean.wang@mediatek.com, linux@armlinux.org.uk,
 linux-kernel@vger.kernel.org, bgolaszewski@baylibre.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, jeffrey.t.kirsher@intel.com,
 john@phrozen.org, matthias.bgg@gmail.com, kuba@kernel.org,
 frowand.list@gmail.com, Mark-MC.Lee@mediatek.com,
 linux-arm-kernel@lists.infradead.org, hkallweit1@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 29 Jun 2020 14:03:36 +0200

> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> So it seems like there's no support for relaxing certain networking devres
> helpers to not require previously allocated structures to also be managed.
> However the way mdio devres variants are implemented is still wrong and I
> modified my series to address it while keeping the functions strict.
> 
> First two patches modify the ixgbe driver to get rid of the last user of
> devm_mdiobus_free().
> 
> Patches 3, 4, 5 and 6 are mostly cosmetic.
> 
> Patch 7 fixes the way devm_mdiobus_register() is implemented.
> 
> Patches 8 & 9 provide a managed variant of of_mdiobus_register() and
> last patch uses it in mtk-star-emac driver.
> 
> v1 -> v2:
> - drop the patch relaxing devm_register_netdev()
> - require struct mii_bus to be managed in devm_mdiobus_register() and
>   devm_of_mdiobus_register() but don't store that information in the
>   structure itself: use devres_find() instead

Series applied, thank you.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
