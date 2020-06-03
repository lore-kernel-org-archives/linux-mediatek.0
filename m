Return-Path: <SRS0=Qq0i=7Q=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86A6CC433DF
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jun 2020 08:04:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56BD4206C3
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jun 2020 08:04:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dw/DoZOS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="rHr5kn9o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56BD4206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1JU6BYm097FTkN3qvaUk8HxbWY8sO8OKcv9uJdy15uQ=; b=dw/DoZOSGBqFBr
	efILc35yLe0VAo0tma7/WA0TMoWhyQJBNOQMEKKx9fP/wpO+dqDWjOkP5J+R1cjRiy4bLnXT2uTGl
	PBfDs37G5mC1wb8Z5q9XYCSHr8Qhtx76j9OWWgfJKaubRcI4BkQ3oFaxt8lzxUW90p3FSS7YXgoyR
	A6lg/JVZHQMI4h9n40YFE8XQUe1LK801s55ySYIYzCLaNI4iTZzikMV9RhZAGSRUzTV4ytsiN8XgL
	d3SXesWB9Yxn6QivIVUUcrGDA5PQ2/446Cstxm444JVDSt7+B1LIp/D/v1qsIa4b+UeZb7t5uRN40
	V8ZbOjLqJNy8A6NUPrAw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgOO2-0000K6-Lf; Wed, 03 Jun 2020 08:04:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgONz-0000JO-BD; Wed, 03 Jun 2020 08:04:33 +0000
X-UUID: 0b9ac466551f46e1bf1b3aeee38c3cd1-20200603
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=07Kpr56aB3PFy6IWckMxSvdLdNklg9y3xgmgR9sXxKc=; 
 b=rHr5kn9ofuNPAE/oxBhtz2Bn5mwE11DrgVafexCGqE0he1Y5+7YUnEK9U6h+MV4DCUeksNhAbGVLc5bWCzgNZWuRevU81yG70v6gdmtfUfIZI6oxZvFvmG1WQgKsZSQ/YW/9Yp1NmJKb+OQWUUuX9kBCSb4hIC6AzPhFIdjX/f4=;
X-UUID: 0b9ac466551f46e1bf1b3aeee38c3cd1-20200603
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <neal.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 306737306; Wed, 03 Jun 2020 00:04:22 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Jun 2020 00:54:24 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Jun 2020 15:54:16 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 3 Jun 2020 15:54:16 +0800
Message-ID: <1591170857.19414.5.camel@mtkswgap22>
Subject: Re: Security Random Number Generator support
From: Neal Liu <neal.liu@mediatek.com>
To: Marc Zyngier <maz@kernel.org>
Date: Wed, 3 Jun 2020 15:54:17 +0800
In-Reply-To: <fcbe37f6f9cbcde24f9c28bc504f1f0e@kernel.org>
References: <1591085678-22764-1-git-send-email-neal.liu@mediatek.com>
 <CAMj1kXHjAdk5=-uSh_=S9j5cz42zr3h6t+YYGy+obevuQDp0fg@mail.gmail.com>
 <85dfc0142d3879d50c0ba18bcc71e199@misterjones.org>
 <1591169342.4878.9.camel@mtkswgap22>
 <fcbe37f6f9cbcde24f9c28bc504f1f0e@kernel.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200603_010431_393966_D2E8787B 
X-CRM114-Status: GOOD (  21.09  )
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE
 TREE BINDINGS" <devicetree@vger.kernel.org>, Julius Werner <jwerner@google.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Arnd Bergmann <arnd@arndb.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Sean Wang <sean.wang@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, wsd_upstream <wsd_upstream@mediatek.com>,
 Crystal Guo =?UTF-8?Q?=28=E9=83=AD=E6=99=B6=29?= <Crystal.Guo@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Neal Liu <neal.liu@mediatek.com>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Matt Mackall <mpm@selenic.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, Ard
 Biesheuvel <ardb@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-06-03 at 08:40 +0100, Marc Zyngier wrote:
> On 2020-06-03 08:29, Neal Liu wrote:
> > On Tue, 2020-06-02 at 21:02 +0800, Marc Zyngier wrote:
> >> On 2020-06-02 13:14, Ard Biesheuvel wrote:
> >> > On Tue, 2 Jun 2020 at 10:15, Neal Liu <neal.liu@mediatek.com> wrote:
> >> >>
> >> >> These patch series introduce a security random number generator
> >> >> which provides a generic interface to get hardware rnd from Secure
> >> >> state. The Secure state can be Arm Trusted Firmware(ATF), Trusted
> >> >> Execution Environment(TEE), or even EL2 hypervisor.
> >> >>
> >> >> Patch #1..2 adds sec-rng kernel driver for Trustzone based SoCs.
> >> >> For security awareness SoCs on ARMv8 with TrustZone enabled,
> >> >> peripherals like entropy sources is not accessible from normal world
> >> >> (linux) and rather accessible from secure world (HYP/ATF/TEE) only.
> >> >> This driver aims to provide a generic interface to Arm Trusted
> >> >> Firmware or Hypervisor rng service.
> >> >>
> >> >>
> >> >> changes since v1:
> >> >> - rename mt67xx-rng to mtk-sec-rng since all MediaTek ARMv8 SoCs can
> >> >> reuse
> >> >>   this driver.
> >> >>   - refine coding style and unnecessary check.
> >> >>
> >> >>   changes since v2:
> >> >>   - remove unused comments.
> >> >>   - remove redundant variable.
> >> >>
> >> >>   changes since v3:
> >> >>   - add dt-bindings for MediaTek rng with TrustZone enabled.
> >> >>   - revise HWRNG SMC call fid.
> >> >>
> >> >>   changes since v4:
> >> >>   - move bindings to the arm/firmware directory.
> >> >>   - revise driver init flow to check more property.
> >> >>
> >> >>   changes since v5:
> >> >>   - refactor to more generic security rng driver which
> >> >>     is not platform specific.
> >> >>
> >> >> *** BLURB HERE ***
> >> >>
> >> >> Neal Liu (2):
> >> >>   dt-bindings: rng: add bindings for sec-rng
> >> >>   hwrng: add sec-rng driver
> >> >>
> >> >
> >> > There is no reason to model a SMC call as a driver, and represent it
> >> > via a DT node like this.
> >> 
> >> +1.
> >> 
> >> > It would be much better if this SMC interface is made truly generic,
> >> > and wired into the arch_get_random() interface, which can be used much
> >> > earlier.
> >> 
> >> Wasn't there a plan to standardize a SMC call to rule them all?
> >> 
> >>          M.
> > 
> > Could you give us a hint how to make this SMC interface more generic in
> > addition to my approach?
> > There is no (easy) way to get platform-independent SMC function ID,
> > which is why we encode it into device tree, and provide a generic
> > driver. In this way, different devices can be mapped and then get
> > different function ID internally.
> 
> The idea is simply to have *one* single ID that caters for all
> implementations, just like we did for PSCI at the time. This
> requires ARM to edict a standard, which is what I was referring
> to above.
> 
> There is zero benefit in having a platform-dependent ID. It just
> pointlessly increases complexity, and means we cannot use the RNG
> before the firmware tables are available (yes, we need it that
> early).
> 
>          M.

Do you know which ARM expert could edict this standard?
Or is there any chance that we can make one? And be reviewed by
maintainers?


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
