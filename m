Return-Path: <SRS0=fggR=7S=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C148CC433DF
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jun 2020 09:10:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92BB22074B
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jun 2020 09:10:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dF2xwf3i";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ls9R6n9I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92BB22074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G8b1XgFfy/vd0MpoYfDLo28nEgKqe6ortVZ62zo2UtU=; b=dF2xwf3i5DYL6L
	t+9xkngV3kYoZFrpmmzEBNSu/kFSWbit3Fgz0ImTuvdvNEPGV2QilBSJFvuM2s+rbXPvybFU9PP2l
	B1LcrygWt3yDOXeNgusOHelxYKwHKQ+HFyTf1TiqPAGzCAf56JDyPxVOjra2S2H/zEolgekI4KhqZ
	cxhLeRdF1HDsxHHTwU49CW3BbLQf92NPuiRG+4joS0YYYCwBu0GhkArhm8wtf/NiwHeS2V5RvBTBt
	LVpyyIYb4JFKfKTKkr+NYezJdxS3rtlLL/JLlxfBp60vrN9dqPHmTx+KFPpU/F7kwpa/stDOECfJ5
	toV149Z9Joxg6wZeyHNQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jh8Mh-0004qh-0w; Fri, 05 Jun 2020 09:10:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jh8Me-0004jh-BZ; Fri, 05 Jun 2020 09:10:14 +0000
X-UUID: c0a01acc12cd45f988df559337340d18-20200605
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=VjXux5WMEXt+SNJUOpjSrCg/TII0W/Rj7aI7a6xVHpE=; 
 b=ls9R6n9IGXDUKqpHS5IXQejgeStm7Hy3+RXWs4hTJ+knZzsD4Aj62NTea3yFMY7uIt/Cx9DNQ051TNBTkashYSbBdUJw9kVVg0KNw/5u0eXPOEut2d+yF3+spTGiZ6k0hKFYz/p2IE3avUG0c/DpU/75Uhtw2dsTCwaVZ+FZ+3g=;
X-UUID: c0a01acc12cd45f988df559337340d18-20200605
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <neal.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 995161006; Fri, 05 Jun 2020 01:10:03 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 5 Jun 2020 02:00:06 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 5 Jun 2020 16:59:42 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 5 Jun 2020 16:59:42 +0800
Message-ID: <1591347582.21704.9.camel@mtkswgap22>
Subject: Re: Security Random Number Generator support
From: Neal Liu <neal.liu@mediatek.com>
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Date: Fri, 5 Jun 2020 16:59:42 +0800
In-Reply-To: <20200605080905.GF1551@shell.armlinux.org.uk>
References: <1591085678-22764-1-git-send-email-neal.liu@mediatek.com>
 <CAMj1kXHjAdk5=-uSh_=S9j5cz42zr3h6t+YYGy+obevuQDp0fg@mail.gmail.com>
 <85dfc0142d3879d50c0ba18bcc71e199@misterjones.org>
 <1591169342.4878.9.camel@mtkswgap22>
 <fcbe37f6f9cbcde24f9c28bc504f1f0e@kernel.org>
 <20200603093416.GY1551@shell.armlinux.org.uk>
 <1591341543.19510.4.camel@mtkswgap22>
 <20200605080905.GF1551@shell.armlinux.org.uk>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 877F0A62BB37F3A937A5DF7C63E4C12D4C5FEB8F623D563618F2A16D037472AE2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200605_021012_409152_3404245B 
X-CRM114-Status: GOOD (  15.44  )
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED
 DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 Julius Werner <jwerner@google.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 Arnd Bergmann <arnd@arndb.de>, Marc Zyngier <maz@kernel.org>,
 Matt Mackall <mpm@selenic.com>, Sean Wang <sean.wang@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, wsd_upstream <wsd_upstream@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Crystal Guo =?UTF-8?Q?=28=E9=83=AD=E6=99=B6=29?= <Crystal.Guo@mediatek.com>,
 Ard
 Biesheuvel <ardb@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-06-05 at 09:09 +0100, Russell King - ARM Linux admin wrote:
> On Fri, Jun 05, 2020 at 03:19:03PM +0800, Neal Liu wrote:
> > On Wed, 2020-06-03 at 17:34 +0800, Russell King - ARM Linux admin wrote:
> > > This kind of thing is something that ARM have seems to shy away from
> > > doing - it's a point I brought up many years ago when the whole
> > > trustzone thing first appeared with its SMC call.  Those around the
> > > conference table were not interested - ARM seemed to prefer every
> > > vendor to do off and do their own thing with the SMC interface.
> > 
> > Does that mean it make sense to model a sec-rng driver, and get each
> > vendor's SMC function id by DT node?
> 
> _If_ vendors have already gone off and decided to use different SMC
> function IDs for this, while keeping the rest of the SMC interface
> the same, then the choice has already been made.
> 
> I know on 32-bit that some of the secure world implementations can't
> be changed; they're burnt into the ROM. I believe on 64-bit that isn't
> the case, which makes it easier to standardise.
> 
> Do you have visibility of how this SMC is implemented in the secure
> side?  Is it in ATF, and is it done as a vendor hack or is there an
> element of generic implementation to it?  Has it been submitted
> upstream to the main ATF repository?
> 

Take MediaTek as an example, some SoCs are implemented in ATF, some of
them are implemented in TEE. We have no plan to make generic
implementation in "secure world".

Due to there must have different implementation in secure world for
vendors, we plan to provide a generic SMC interface in secure rng kernel
driver for more flexibility.

Vendors can decide which "secure world" they want (HYP/ATF/TEE) by
different smc/hvc and different SMC function IDs in DT node.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
