Return-Path: <SRS0=tvhu=GL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C057EC433DB
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 18:25:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37CC523A7C
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 18:25:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37CC523A7C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jLwEYwM9i1aqUuXsEy6FtAWkv4DdgwiuQimFst8zlTM=; b=tLrgV7Jfc805jlXwUhEEtbs9R
	A6Q3wBnuk5czG4Ml/TZUfL1FnJNnyWvqSRV7ggIGgutJc1o8YSrc/8v40Nh2V3N4D6koqWROjvlsP
	5Eiagh3CVr11T4t+n9HLwhoUY6t/nMV7s1I5s9JQG3ZGb39/dQ9TTziJS/GrJklFOAeHcWyvzGQEX
	Ya8YxjJpZoN+Z4IdOLo0IFOm1PmIikUuElHA0X7KmdSs9nEbDhKZqQHfCkW63kj7KFW45NSTVgJGo
	BFGqahRq+obqrUbFDKvJyaSqXlm/BrN3Ft7pNi3z7AhdimmGs764trvEnIGzNalpoFrWE+jGOrCho
	lEPv+B0pg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxwS0-0005DY-2p; Fri, 08 Jan 2021 18:25:28 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxwRw-0005CM-6g; Fri, 08 Jan 2021 18:25:24 +0000
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1kxwRp-00GwrN-3T; Fri, 08 Jan 2021 19:25:17 +0100
Date: Fri, 8 Jan 2021 19:25:17 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: DENG Qingfang <dqfext@gmail.com>
Subject: Re: [PATCH] staging: mt7621-dts: remove obsolete switch node
Message-ID: <X/ijjWpq4eLQEDot@lunn.ch>
References: <20210108025155.31556-1-dqfext@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210108025155.31556-1-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210108_132524_313118_1365EB9F 
X-CRM114-Status: UNSURE (   8.03  )
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
Cc: devel@driverdev.osuosl.org,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 NeilBrown <neil@brown.name>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Rosen Penev <rosenp@gmail.com>,
 Chuanhong Guo <gch981213@gmail.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jan 08, 2021 at 10:51:55AM +0800, DENG Qingfang wrote:
> This was for OpenWrt's swconfig driver, which never made it upstream,
> and was also superseded by MT7530 DSA driver.

What about
Documentation/devicetree/bindings/net/mediatek,mt7620-gsw.txt ?
Should that also be removed?

       Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
