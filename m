Return-Path: <SRS0=NAie=2C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A175C43603
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Dec 2019 14:44:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67CA721655
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Dec 2019 14:44:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rgiS0DU9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67CA721655
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cG6kAyCZhy2u46Q9rJzF3zQYdslph6wGgYuRm8ndKps=; b=rgiS0DU9mXQWZM
	Xnwb8cOE5n2XzsfG4HsmWLcXcHRQuGAo9S0mCQpGRyk/CZ7Z8/Uz7g07KtVxv2yYici6diTDyHX5j
	Q3qsg63Xps/BcvR2nKPQOzCpf+0t3+9vocIYf92sX4wxmxqc+Zpo28PoVGNaYaKCaFBue8ZZTDvcn
	zstCXyhcIoYCqppWd3SrBxRapvBpNjU9GL16vjsHWnwyafytMSAiUCiBYqq0a1laTRN4d7KT/BkV1
	swUG0C0QPqZLahOuqrWtzYvxPpYUbkvJW78qtJh2lSG+myilrQzh50I8W1mO6HxkTwY6kpmmCv/3l
	ghHjNJx3FShwYvhifXqw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ifPhS-0008FT-SP; Thu, 12 Dec 2019 14:44:18 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifPhD-00083P-Vh; Thu, 12 Dec 2019 14:44:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4B0E530E;
 Thu, 12 Dec 2019 06:44:03 -0800 (PST)
Received: from bogus (e107155-lin.cambridge.arm.com [10.1.196.42])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D90EA3F718;
 Thu, 12 Dec 2019 06:44:00 -0800 (PST)
Date: Thu, 12 Dec 2019 14:43:55 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: Re: [PATCH v5 3/3] hwrng: add mtk-sec-rng driver
Message-ID: <20191212144355.GA13263@bogus>
References: <1574864578-467-1-git-send-email-neal.liu@mediatek.com>
 <1574864578-467-4-git-send-email-neal.liu@mediatek.com>
 <CADnJP=uhD=J2NrpSwiX8oCTd-u_q05=HhsAV-ErCsXNDwVS0rA@mail.gmail.com>
 <1575027046.24848.4.camel@mtkswgap22>
 <CAKv+Gu_um7eRYXbieW7ogDX5mmZaxP7JQBJM9CajK+6CsO5RgQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKv+Gu_um7eRYXbieW7ogDX5mmZaxP7JQBJM9CajK+6CsO5RgQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191212_064404_110337_825483FF 
X-CRM114-Status: GOOD (  20.86  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 Sudeep Holla <sudeep.holla@arm.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 wsd_upstream <wsd_upstream@mediatek.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Matt Mackall <mpm@selenic.com>,
 Sean Wang <sean.wang@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Neal Liu <neal.liu@mediatek.com>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 Marc Zyngier <maz@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Crystal Guo =?utf-8?B?KOmDreaZtik=?= <Crystal.Guo@mediatek.com>,
 Will Deacon <will@kernel.org>, Lars Persson <lists@bofh.nu>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Dec 02, 2019 at 04:12:09PM +0000, Ard Biesheuvel wrote:
> (adding some more arm64 folks)
> 
> On Fri, 29 Nov 2019 at 11:30, Neal Liu <neal.liu@mediatek.com> wrote:
> >
> > On Fri, 2019-11-29 at 18:02 +0800, Lars Persson wrote:
> > > Hi Neal,
> > >
> > > On Wed, Nov 27, 2019 at 3:23 PM Neal Liu <neal.liu@mediatek.com> wrote:
> > > >
> > > > For MediaTek SoCs on ARMv8 with TrustZone enabled, peripherals like
> > > > entropy sources is not accessible from normal world (linux) and
> > > > rather accessible from secure world (ATF/TEE) only. This driver aims
> > > > to provide a generic interface to ATF rng service.
> > > >
> > >
> > > I am working on several SoCs that also will need this kind of driver
> > > to get entropy from Arm trusted firmware.
> > > If you intend to make this a generic interface, please clean up the
> > > references to MediaTek and give it a more generic name. For example
> > > "Arm Trusted Firmware random number driver".
> > >
> > > It will also be helpful if the SMC call number is configurable.
> > >
> > > - Lars
> >
> > Yes, I'm trying to make this to a generic interface. I'll try to make
> > HW/platform related dependency to be configurable and let it more
> > generic.
> > Thanks for your suggestion.
> >
> 
> I don't think it makes sense for each arm64 platform to expose an
> entropy source via SMC calls in a slightly different way, and model it
> as a h/w driver. Instead, we should try to standardize this, and
> perhaps expose it via the architectural helpers that already exist
> (get_random_seed_long() and friends), so they get plugged into the
> kernel random pool driver directly.
> 
> Note that in addition to drivers based on vendor SMC calls, we already
> have a RNG h/w driver based on OP-TEE as well, where the driver
> attaches to a standardized trusted OS interface identified by a UUID,
> and which also gets invoked via SMC calls into secure firmware.

Yes, I agree. I had raised the issue internally and forgot to follow up.
I raised this few months back after I read a blog[1]

--
Regards,
Sudeep

[1] https://community.arm.com/developer/ip-products/processors/f/cortex-a-forum/43679/arm-really-should-standardize-an-smc-interface-for-hardware-random-number-generators

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
