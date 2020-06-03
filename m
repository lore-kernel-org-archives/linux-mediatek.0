Return-Path: <SRS0=Qq0i=7Q=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7CCEC433DF
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jun 2020 09:49:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99E4C20679
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jun 2020 09:49:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KdBF5VQC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99E4C20679
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tNtZBFnDa+SjT4q1yUBhG0EvP0JZCm/UCA7On/T0dRk=; b=KdBF5VQC2XIpdo
	8s05ho93wxgb+690uSfIzk6/LWYUUtKyO1hyClgyqm/QJEwW8vSdqkodfG1JK5QkKsquoQ45ZfwEy
	eThZyJvEe8EjPRVt1/JNC44w8VNG9Qu4JxL0OUUDRme7ZRfaOELzffA2I3ad7uA6VE2z59Hh9RiSl
	J+p7+cDgWItSFlcvA1RW8/AGX9mvtXWCxgWVpaUQJt+KFhaE4nBeXBGEAGVeZSR6kb3UsCy1jcF/w
	qgxhFrQMN3hERmu3ZsIX9NcFx7ZKK1ZKl3ZUoZmUZjAo63q7RNal593dYAJ012KBCGW4NoFM5TtwN
	ZzEvCNzMeB0mg6HybsQA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgQ19-00055O-Oa; Wed, 03 Jun 2020 09:49:03 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgQ13-0004ye-1l; Wed, 03 Jun 2020 09:48:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B576831B;
 Wed,  3 Jun 2020 02:48:54 -0700 (PDT)
Received: from bogus (unknown [10.37.12.118])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2EE943F305;
 Wed,  3 Jun 2020 02:48:51 -0700 (PDT)
Date: Wed, 3 Jun 2020 10:48:40 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Neal Liu <neal.liu@mediatek.com>
Subject: Re: Security Random Number Generator support
Message-ID: <20200603094829.GA7259@bogus>
References: <1591085678-22764-1-git-send-email-neal.liu@mediatek.com>
 <CAMj1kXHjAdk5=-uSh_=S9j5cz42zr3h6t+YYGy+obevuQDp0fg@mail.gmail.com>
 <85dfc0142d3879d50c0ba18bcc71e199@misterjones.org>
 <1591169342.4878.9.camel@mtkswgap22>
 <fcbe37f6f9cbcde24f9c28bc504f1f0e@kernel.org>
 <1591170857.19414.5.camel@mtkswgap22>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1591170857.19414.5.camel@mtkswgap22>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200603_024857_136616_03885F6F 
X-CRM114-Status: GOOD (  14.00  )
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Julius Werner <jwerner@google.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Arnd Bergmann <arnd@arndb.de>,
 Marc Zyngier <maz@kernel.org>, Matt Mackall <mpm@selenic.com>,
 Sean Wang <sean.wang@kernel.org>, lkml <linux-kernel@vger.kernel.org>,
 wsd_upstream <wsd_upstream@mediatek.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Crystal Guo =?utf-8?B?KOmDreaZtik=?= <Crystal.Guo@mediatek.com>,
 Ard Biesheuvel <ardb@kernel.org>, Jose Marinho <Jose.Marinho@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

+ Jose

On Wed, Jun 03, 2020 at 03:54:17PM +0800, Neal Liu wrote:
> On Wed, 2020-06-03 at 08:40 +0100, Marc Zyngier wrote:

[...]

> > The idea is simply to have *one* single ID that caters for all
> > implementations, just like we did for PSCI at the time. This
> > requires ARM to edict a standard, which is what I was referring
> > to above.
> >
> > There is zero benefit in having a platform-dependent ID. It just
> > pointlessly increases complexity, and means we cannot use the RNG
> > before the firmware tables are available (yes, we need it that
> > early).
> >
>
> Do you know which ARM expert could edict this standard?
> Or is there any chance that we can make one? And be reviewed by
> maintainers?
>

Jose Marinho is working on the spec, may be he has more updates on the
timeline.

--
Regards,
Sudeep

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
