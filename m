Return-Path: <SRS0=tiIh=64=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD254C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2020 19:56:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EF9F2065C
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2020 19:56:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MoaUnMJR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EF9F2065C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davemloft.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q406S9fdyEnJ0G/En+Og3orIEes/XeN27kWEtScN9rI=; b=MoaUnMJRRn9dhp
	HkUUAL2ZRKGikx1B5ZZRk/5mbH8lf25gnj4aC78jezLprGozz8Nk49KpqHBxl8zAXohQa/83+D9Xv
	jUk7VARxn+95I6RsbpqTcryKtG1qGviATfgFKw8OHUHzXwj3sSKSzj5UnnNpYdLyKDbYXYv8A8lzA
	K0QjKNNAyxhwKR7c8pkbX0vOaHlP1hhX6jdxsCvOVFoL+4WekPxAEk62n9XjQm8KEFyA4T2Xxw2sk
	eDIV9eVFfQHsqB+jxE2281frGCVSqwFJWXvIjwHX70XcaF77oC+BV1Yi957MIKAVio7evVJQPih9z
	x++PyclNjJcKG2iCGqPA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZJxm-0007pT-0c; Thu, 14 May 2020 19:56:14 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZJxd-0007hs-Gm; Thu, 14 May 2020 19:56:06 +0000
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id EE51E128D3256;
 Thu, 14 May 2020 12:56:03 -0700 (PDT)
Date: Thu, 14 May 2020 12:56:03 -0700 (PDT)
Message-Id: <20200514.125603.1095750660571738939.davem@davemloft.net>
To: brgl@bgdev.pl
Subject: Re: [PATCH v3 00/15] mediatek: add support for MediaTek Ethernet MAC
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200514075942.10136-1-brgl@bgdev.pl>
References: <20200514075942.10136-1-brgl@bgdev.pl>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Thu, 14 May 2020 12:56:04 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200514_125605_555856_3A797F44 
X-CRM114-Status: UNSURE (   5.94  )
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
Cc: edwin.peer@broadcom.com, devicetree@vger.kernel.org,
 bgolaszewski@baylibre.com, stephane.leprovost@mediatek.com, arnd@arndb.de,
 corbet@lwn.net, netdev@vger.kernel.org, sean.wang@mediatek.com,
 linux-kernel@vger.kernel.org, pedro.tsai@mediatek.com, fparent@baylibre.com,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 andrew.perepech@mediatek.com, john@phrozen.org, matthias.bgg@gmail.com,
 kuba@kernel.org, Mark-MC.Lee@mediatek.com,
 linux-arm-kernel@lists.infradead.org, hkallweit1@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 14 May 2020 09:59:27 +0200

> Next we do some cleanup of the mediatek ethernet drivers directory and update
> the devres documentation with existing networking devres helpers.

I don't agree with the new devres stuff.

You have to be very careful with the ordering of when you map/unmap
registers, free up anciliary resources, etc. in relationship to when
the netdev unregister happens.

Please submit this driver without these controversial devres changes,
and then you can submit and discuss those changes separately later.

Thanks.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
