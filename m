Return-Path: <SRS0=7Wwy=ZY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8084C43215
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2019 19:12:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E6F1217F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2019 19:12:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NwFfgEMX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E6F1217F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1BMLoBy9z7XFuITOgsHKeu91t8kCfC/UP+DSATiekwY=; b=NwFfgEMX7HydTb
	FLibZXl1wKROXZ/t9pRAD3N1X8r+q4uix6iJ3Ha8HYgfkFHXmtfaZIkeRewHGAkVCyWCFNRTAln8w
	SccFXbnASLQlHbhpvG+pDD/SQ/zfh57XTUewsIRFckSDMgteQGgPfDmU4blQHsxGuc9zVBEpV8kAg
	39VVhRHpaAt72GIVvEl2nCn4FnYzM/JSNrTUFs24Pl8P2bGjIS24vs1vCBCJBVEBrfwI57LPU8dCy
	lUTKenL5ERd5xa84ORTgpw2uE0Tb37r9BlqejzaxpW/cbYQpOVT6F+eaLF4kpWr8TFkVcQDImSw19
	f/BBxMQKgy9LOrx4oLiA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ibr7C-0006mQ-3c; Mon, 02 Dec 2019 19:12:10 +0000
Received: from inca-roads.misterjones.org ([213.251.177.50])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ibr79-0006lU-3b; Mon, 02 Dec 2019 19:12:09 +0000
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=why)
 by cheepnis.misterjones.org with esmtpsa (TLSv1.2:AES256-GCM-SHA384:256)
 (Exim 4.80) (envelope-from <maz@kernel.org>)
 id 1ibr6q-0006Qj-Gm; Mon, 02 Dec 2019 20:11:48 +0100
Date: Mon, 2 Dec 2019 19:11:46 +0000
From: Marc Zyngier <maz@kernel.org>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: Re: [PATCH v5 3/3] hwrng: add mtk-sec-rng driver
Message-ID: <20191202191146.79e6368c@why>
In-Reply-To: <CAKv+Gu_um7eRYXbieW7ogDX5mmZaxP7JQBJM9CajK+6CsO5RgQ@mail.gmail.com>
References: <1574864578-467-1-git-send-email-neal.liu@mediatek.com>
 <1574864578-467-4-git-send-email-neal.liu@mediatek.com>
 <CADnJP=uhD=J2NrpSwiX8oCTd-u_q05=HhsAV-ErCsXNDwVS0rA@mail.gmail.com>
 <1575027046.24848.4.camel@mtkswgap22>
 <CAKv+Gu_um7eRYXbieW7ogDX5mmZaxP7JQBJM9CajK+6CsO5RgQ@mail.gmail.com>
Organization: Approximate
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: ard.biesheuvel@linaro.org, neal.liu@mediatek.com,
 catalin.marinas@arm.com, will@kernel.org, lists@bofh.nu, mark.rutland@arm.com,
 devicetree@vger.kernel.org, herbert@gondor.apana.org.au,
 wsd_upstream@mediatek.com, sean.wang@kernel.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, Crystal.Guo@mediatek.com, linux-crypto@vger.kernel.org,
 mpm@selenic.com, matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on cheepnis.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191202_111208_078181_0F50DF17 
X-CRM114-Status: GOOD (  19.62  )
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
 Herbert Xu <herbert@gondor.apana.org.au>,
 wsd_upstream <wsd_upstream@mediatek.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Sean Wang <sean.wang@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Neal Liu <neal.liu@mediatek.com>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 Matt Mackall <mpm@selenic.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 "Crystal Guo \(=?UTF-8?Q?=E9=83=AD=E6=99=B6?=\)" <Crystal.Guo@mediatek.com>,
 Will Deacon <will@kernel.org>, Lars Persson <lists@bofh.nu>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2 Dec 2019 16:12:09 +0000
Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:

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

Absolutely. I'd love to see a standard, ARM-specified, virtualizable
RNG that is abstracted from the HW.

> Note that in addition to drivers based on vendor SMC calls, we already
> have a RNG h/w driver based on OP-TEE as well, where the driver
> attaches to a standardized trusted OS interface identified by a UUID,
> and which also gets invoked via SMC calls into secure firmware.

... and probably an unhealthy number of hypervisor-specific hacks that
do the same thing. The sooner we plug this, the better.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
