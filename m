Return-Path: <SRS0=Fc+n=ES=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6A9AC63798
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2020 22:50:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C31BD2085B
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2020 22:50:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dcd7kBCH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C31BD2085B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gSSgDuGeF8rcicPyHPD2BTbYxjTpoEua5NNv4GlYci4=; b=dcd7kBCHESQ/ThKN0Za0cjPxg
	YkGtY+o0iM4EF7PNousvdaQg5XmTt5NuXRKLJDvnwNLLC5rk2xzoSBqJoaYvvTniqc/iImTpRz9Kr
	wqm6/tzPf3kq1bbdF9+YS+3mvHl5gxre2o1wnXVbrQ7tgESzoqKa7cl9b4pgjEIhq8aybnzhV4hT5
	YSTXQK1z+ge2+WIrOfjoKIKtIxYsMqRtIhhBXjX85rIOV6VzFpkI6wDbUKb2KXntZ562bKAFTj7Cx
	lEOl4bLNAFlkTL2VCe8/c2HXxrP4WzkE7dshXeTdrb2nWBFqyFTUCnyMy2Wif1pFUKv19/66fX9Jr
	XGtXRD3/Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdLQ8-0004o1-6r; Thu, 12 Nov 2020 22:50:24 +0000
Received: from elvis.franken.de ([193.175.24.41])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdLQ6-0004nK-BR; Thu, 12 Nov 2020 22:50:23 +0000
Received: from uucp (helo=alpha)
 by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
 id 1kdLQ2-0005gc-04; Thu, 12 Nov 2020 23:50:18 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
 id 17501C4DE1; Thu, 12 Nov 2020 23:41:33 +0100 (CET)
Date: Thu, 12 Nov 2020 23:41:33 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH v2 09/18] mips: dts: ralink: mt7628a: Harmonize EHCI/OHCI
 DT nodes name
Message-ID: <20201112224133.GE19695@alpha.franken.de>
References: <20201111091552.15593-1-Sergey.Semin@baikalelectronics.ru>
 <20201111091552.15593-10-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201111091552.15593-10-Sergey.Semin@baikalelectronics.ru>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201112_175022_522079_BCE0D1BD 
X-CRM114-Status: GOOD (  15.54  )
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
Cc: Felipe Balbi <balbi@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-mips@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Serge Semin <fancer.lancer@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Nov 11, 2020 at 12:15:43PM +0300, Serge Semin wrote:
> In accordance with the Generic EHCI/OHCI bindings the corresponding node
> name is suppose to comply with the Generic USB HCD DT schema, which
> requires the USB nodes to have the name acceptable by the regexp:
> "^usb(@.*)?" . Make sure the "generic-ehci" and "generic-ohci"-compatible
> nodes are correctly named.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  arch/mips/boot/dts/ralink/mt7628a.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
