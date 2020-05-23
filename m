Return-Path: <SRS0=+XBv=7F=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86AF1C433E0
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 May 2020 23:56:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C1B320727
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 May 2020 23:56:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CGx+zvoa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C1B320727
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davemloft.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ape8f/mFPWqz844AQQu1T5Jb8nV1Se+et/rO7wMVthA=; b=CGx+zvoaVTGXUp
	i5rLJTBm4GlKCcT5y1PbmQWy26awUMEyA9NyGGCrn6E8rpVf5baDlmcfznIYdxkJlF04tZ6SwerCI
	U5uZu3Mhb4MUtKO6CENYuZxMbn1kP6e0RCMaeFfS7GVFy88YD+kXQF+l0fM9E/avzTtovNb/2EirQ
	D4HM+/p6POLN/x5UXwOGkI18UjkmS3Dxiyw7miQ+oHAtKCqeqIyhPmC/Lhl65uWRqh5I5DMh4EKNZ
	b1depzGhSmEqMdyPQRsA9b5VIZFRzcj5QjHlFG8uxW7c7idWOxHqs9rg6epe36uX0+KYcdQXliog+
	iqVzF0fF+UrjHt5ynIdg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jce0R-0001p0-Hh; Sat, 23 May 2020 23:56:43 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jce0I-0001j9-PK; Sat, 23 May 2020 23:56:36 +0000
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 2E5D81287375F;
 Sat, 23 May 2020 16:56:33 -0700 (PDT)
Date: Sat, 23 May 2020 16:56:32 -0700 (PDT)
Message-Id: <20200523.165632.2131763470920616688.davem@davemloft.net>
To: brgl@bgdev.pl
Subject: Re: [PATCH v2 0/5] net: provide a devres variant of register_netdev()
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200523132711.30617-1-brgl@bgdev.pl>
References: <20200523132711.30617-1-brgl@bgdev.pl>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Sat, 23 May 2020 16:56:33 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200523_165634_826157_004AADC9 
X-CRM114-Status: UNSURE (   7.08  )
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
 linux-kernel@vger.kernel.org, fparent@baylibre.com, pedro.tsai@mediatek.com,
 linux-mediatek@lists.infradead.org, andrew.perepech@mediatek.com,
 john@phrozen.org, matthias.bgg@gmail.com, kuba@kernel.org,
 Mark-MC.Lee@mediatek.com, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sat, 23 May 2020 15:27:06 +0200

> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> Using devres helpers allows to shrink the probing code, avoid memory leaks in
> error paths make sure the order in which resources are freed is the exact
> opposite of their allocation. This series proposes to add a devres variant
> of register_netdev() that will only work with net_device structures whose
> memory is also managed.
> 
> First we add the missing documentation entry for the only other networking
> devres helper: devm_alloc_etherdev().
> 
> Next we move devm_alloc_etherdev() into a separate source file.
> 
> We then use a proxy structure in devm_alloc_etherdev() to improve readability.
> 
> Last: we implement devm_register_netdev() and use it in mtk-eth-mac driver.
> 
> v1 -> v2:
> - rebase on top of net-next after driver rename, no functional changes

Series applied, thank you.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
