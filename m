Return-Path: <SRS0=Qq0i=7Q=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D216FC433DF
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jun 2020 07:29:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A275D2067B
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jun 2020 07:29:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cpCPAzZu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="CEt6aRgE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A275D2067B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YkZFRo2AtB0bvDk4VOlXCpbkh1WxljSSmePLme/r7gc=; b=cpCPAzZu88VO5O
	FG4kOz4dSgQroTeqG1N5fo8Pjd4Dbu4KBoY/76XyWInhWrQzIox2JwS8q8LoIHkqzeNHslT8kDFmp
	YgxHYWGv+PrB7u8tTJqSbAe/G1d7qm5Q4FQhuDc1VXu9hLI9IAI5oWTcOaT0/xNkeNoeQq0YstkOO
	XS8Xe6fYmBILsFaPXKgw8/CAmAhD1/iqGphze4hTk0P7ATQXbcJaEFuSwJb5vTwNAsm1Q9Je9JhV3
	cR0FK0NQNT8qQvPWklG/DifCXe2E5TbW95HFVBgl2ssKpOGAOoR9fJmvm7K7IUzgEzuLR6YMzkEsw
	mnno36Vu7tsXZ5jqtKpg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgNpu-0004Hu-Bc; Wed, 03 Jun 2020 07:29:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgNpr-0004HL-6t; Wed, 03 Jun 2020 07:29:16 +0000
X-UUID: 68f36bbf5ee94faa878b71255c900f2d-20200602
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=uxJ/OyZIhvn8jO7euhdxxdoo6BqLiSJM0zglxbBqOos=; 
 b=CEt6aRgES19HkCxvzzojs8LYRDsf4UJVp+a2UCrOlilmbI/BJ9L+e5CoG6mCq5ixCZDHQIaqUIueDXroGlcGygPjR0x6ZgRF82VMqtmxQ42zwJrUvXSFxhlIQAOOERT8R6KrbMeGLoZRbjuzOsvDoZDjUGLoVhJABTso3DwAuZY=;
X-UUID: 68f36bbf5ee94faa878b71255c900f2d-20200602
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <neal.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 521984248; Tue, 02 Jun 2020 23:29:00 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Jun 2020 00:29:08 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Jun 2020 15:29:02 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 3 Jun 2020 15:29:01 +0800
Message-ID: <1591169342.4878.9.camel@mtkswgap22>
Subject: Re: Security Random Number Generator support
From: Neal Liu <neal.liu@mediatek.com>
To: Marc Zyngier <maz@misterjones.org>, Julius Werner <jwerner@google.com>,
 Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 3 Jun 2020 15:29:02 +0800
In-Reply-To: <85dfc0142d3879d50c0ba18bcc71e199@misterjones.org>
References: <1591085678-22764-1-git-send-email-neal.liu@mediatek.com>
 <CAMj1kXHjAdk5=-uSh_=S9j5cz42zr3h6t+YYGy+obevuQDp0fg@mail.gmail.com>
 <85dfc0142d3879d50c0ba18bcc71e199@misterjones.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200603_002915_254003_A5C3EB4E 
X-CRM114-Status: GOOD (  16.65  )
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
 Herbert Xu <herbert@gondor.apana.org.au>, Arnd Bergmann <arnd@arndb.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Sean Wang <sean.wang@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 lkml <linux-kernel@vger.kernel.org>, wsd_upstream <wsd_upstream@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Neal Liu <neal.liu@mediatek.com>,
 Linux Crypto
 Mailing List <linux-crypto@vger.kernel.org>, Matt Mackall <mpm@selenic.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Crystal Guo =?UTF-8?Q?=28=E9=83=AD=E6=99=B6=29?= <Crystal.Guo@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2020-06-02 at 21:02 +0800, Marc Zyngier wrote:
> On 2020-06-02 13:14, Ard Biesheuvel wrote:
> > On Tue, 2 Jun 2020 at 10:15, Neal Liu <neal.liu@mediatek.com> wrote:
> >> 
> >> These patch series introduce a security random number generator
> >> which provides a generic interface to get hardware rnd from Secure
> >> state. The Secure state can be Arm Trusted Firmware(ATF), Trusted
> >> Execution Environment(TEE), or even EL2 hypervisor.
> >> 
> >> Patch #1..2 adds sec-rng kernel driver for Trustzone based SoCs.
> >> For security awareness SoCs on ARMv8 with TrustZone enabled,
> >> peripherals like entropy sources is not accessible from normal world
> >> (linux) and rather accessible from secure world (HYP/ATF/TEE) only.
> >> This driver aims to provide a generic interface to Arm Trusted
> >> Firmware or Hypervisor rng service.
> >> 
> >> 
> >> changes since v1:
> >> - rename mt67xx-rng to mtk-sec-rng since all MediaTek ARMv8 SoCs can 
> >> reuse
> >>   this driver.
> >>   - refine coding style and unnecessary check.
> >> 
> >>   changes since v2:
> >>   - remove unused comments.
> >>   - remove redundant variable.
> >> 
> >>   changes since v3:
> >>   - add dt-bindings for MediaTek rng with TrustZone enabled.
> >>   - revise HWRNG SMC call fid.
> >> 
> >>   changes since v4:
> >>   - move bindings to the arm/firmware directory.
> >>   - revise driver init flow to check more property.
> >> 
> >>   changes since v5:
> >>   - refactor to more generic security rng driver which
> >>     is not platform specific.
> >> 
> >> *** BLURB HERE ***
> >> 
> >> Neal Liu (2):
> >>   dt-bindings: rng: add bindings for sec-rng
> >>   hwrng: add sec-rng driver
> >> 
> > 
> > There is no reason to model a SMC call as a driver, and represent it
> > via a DT node like this.
> 
> +1.
> 
> > It would be much better if this SMC interface is made truly generic,
> > and wired into the arch_get_random() interface, which can be used much
> > earlier.
> 
> Wasn't there a plan to standardize a SMC call to rule them all?
> 
>          M.

Could you give us a hint how to make this SMC interface more generic in
addition to my approach?
There is no (easy) way to get platform-independent SMC function ID,
which is why we encode it into device tree, and provide a generic
driver. In this way, different devices can be mapped and then get
different function ID internally.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
