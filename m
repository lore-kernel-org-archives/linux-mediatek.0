Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E683C77B7C
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 May 2023 09:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:From:
	Message-ID:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DTDX6asLsixd9ZbOXOzvY5G5N5+upQjqKBLO3aEsv6E=; b=DMdRVGKgG9tUV23jmXhsztD4wd
	lS91ZmkQBVGIPslUZvH1u2ci0ku/5r4miurOZQXsyxP8oLB3blnwKiHJng+obK4wa4z3+pFeQKz7m
	Pl5EXS7k3pZ4FpsS7afqsvJ2xftnQ7aM+6HM3Ax49SF6THuZm4lKKCMrhp0Vznw7HYBlJMnkLh4/Y
	TPW4gxDBqyA76ct07lsfE2wKxBQpcW1iRWkfNPF9BI1IqDfMKKosfg8dFxhASMYMsEz67LeMvLDBd
	8t+CRwFmYujep6ra8SWL0bCOZOx4AB3unQi0vi9V6vuyMtZiKUVV7SAqCHkoTgiEq+fhyOraRLjaG
	vHnYe2PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxPWe-00BWD0-1Q;
	Fri, 12 May 2023 09:57:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxPWa-00BWBd-11;
	Fri, 12 May 2023 09:57:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 89B5E61450;
	Fri, 12 May 2023 09:57:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF9CEC433EF;
	Fri, 12 May 2023 09:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683885438;
	bh=8DTsk65nzftmPloQGhgyIVvnjxc6rGKFraKcYqAzBoU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=XHWpVGpvScJ+wnFPOzsMLnISW2WY1i2rUko+qPMXnt0buD+d6cYPywna543TP4k19
	 P5o/7EPIO7vE1aGbh6sd9Mu1AFCxs7g8cyuemSQ3woOmsJgLRCJdelwmM76WjeLu/V
	 rc6FrAN+8nik0LnkIHU2XWS/GnqB5ZfkWwjGAfHUj+W2YTg3P6iTqknW6dUTCMm1hx
	 TpVVy99g2LZdtjW9JEYHlhdhewyicJMzh2e6+uohyx7/mNT/0eQy9Di5swJf4A0CZ+
	 TEB3fUrdOfI32JMcqr95RbHIkIs5yQd01D375YzFq+ZQtk668BK4Sz+wrjdsS8AH2i
	 0VCLrAb11a0Jw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1pxPWW-00EX9F-8e;
	Fri, 12 May 2023 10:57:16 +0100
Date: Fri, 12 May 2023 10:57:15 +0100
Message-ID: <86sfc1na84.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: =?UTF-8?B?IllpLURlIFd1ICjlkLPkuIDlvrcpIg==?= <Yi-De.Wu@mediatek.com>
Cc: "corbet@lwn.net" <corbet@lwn.net>,	"linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>,	"linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>,	"robh+dt@kernel.org"
 <robh+dt@kernel.org>,	=?UTF-8?B?Ik1ZIENodWFuZyAo6I6K5piO6LqNKSI=?=
 <MY.Chuang@mediatek.com>,	"quic_tsoni@quicinc.com"
 <quic_tsoni@quicinc.com>,	"krzysztof.kozlowski+dt@linaro.org"
 <krzysztof.kozlowski+dt@linaro.org>,	"devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>,	=?UTF-8?B?Ikl2YW4gVHNlbmcgKOabvuW/l+i7kiki?=
 <ivan.tseng@mediatek.com>,	=?UTF-8?B?IlplLXl1IFdhbmcgKOeOi+a+pOWuhyki?=
 <Ze-yu.Wang@mediatek.com>,	=?UTF-8?B?IlBlaUx1biBTdWVpICjpmovln7nlgKspIg==?=
 <PeiLun.Suei@mediatek.com>,	=?UTF-8?B?IkxpanUtY2xyIENoZW4gKOmZs+m6lw==?=
 =?UTF-8?B?5aaCKSI=?= <Liju-clr.Chen@mediatek.com>,	=?UTF-8?B?IkphZGVzIFNo?=
 =?UTF-8?B?aWggKOaWveWQkeeOqCki?= <jades.shih@mediatek.com>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,	"dbrazdil@google.com"
 <dbrazdil@google.com>,	=?UTF-8?B?IlNoYXduIEhzaWFvICjola3lv5fnpaUpIg==?=
 <shawn.hsiao@mediatek.com>,	"linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,	=?UTF-8?B?Ik1pbGVzIENoZW4gKA==?=
 =?UTF-8?B?6Zmz5rCR5qi6KSI=?= <Miles.Chen@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,	=?UTF-8?B?IllpbmdzaGl1?=
 =?UTF-8?B?YW4gUGFuICjmvZjnqY7ou5IpIg==?= <Yingshiuan.Pan@mediatek.com>,
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,	"arnd@arndb.de"
 <arnd@arndb.de>,	"angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,	"linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>,	"will@kernel.org" <will@kernel.org>
Subject: Re: [PATCH v2 5/7] virt: geniezone: Add irqchip support for virtual interrupt injection
In-Reply-To: <fa864743c550ecd0a0c8052bfe7fddcc3f9be15c.camel@mediatek.com>
References: <20230428103622.18291-1-yi-de.wu@mediatek.com>
	<20230428103622.18291-6-yi-de.wu@mediatek.com>
	<f1c8c1c1c091be87dfbc27b9178fc3e6@kernel.org>
	<762e3494ed468f0337b1c336615065b154396d23.camel@mediatek.com>
	<86wn1em1hx.wl-maz@kernel.org>
	<fa864743c550ecd0a0c8052bfe7fddcc3f9be15c.camel@mediatek.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/28.2
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: Yi-De.Wu@mediatek.com, corbet@lwn.net, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, robh+dt@kernel.org, MY.Chuang@mediatek.com, quic_tsoni@quicinc.com, krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org, ivan.tseng@mediatek.com, Ze-yu.Wang@mediatek.com, PeiLun.Suei@mediatek.com, Liju-clr.Chen@mediatek.com, jades.shih@mediatek.com, catalin.marinas@arm.com, dbrazdil@google.com, shawn.hsiao@mediatek.com, linux-arm-kernel@lists.infradead.org, Miles.Chen@mediatek.com, matthias.bgg@gmail.com, Yingshiuan.Pan@mediatek.com, linux-arch@vger.kernel.org, arnd@arndb.de, angelogioacchino.delregno@collabora.com, linux-doc@vger.kernel.org, will@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_025720_433953_C5B445F3 
X-CRM114-Status: GOOD (  34.35  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 12 May 2023 09:16:58 +0100,
"Yi-De Wu (=E5=90=B3=E4=B8=80=E5=BE=B7)" <Yi-De.Wu@mediatek.com> wrote:
>=20
> On Fri, 2023-05-12 at 08:51 +0100, Marc Zyngier wrote:
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >=20
> >=20
> > On Fri, 12 May 2023 08:19:31 +0100,
> > "Yi-De Wu (=E5=90=B3=E4=B8=80=E5=BE=B7)" <Yi-De.Wu@mediatek.com> wrote:
> > >=20
> > > On Fri, 2023-04-28 at 19:59 +0100, Marc Zyngier wrote:
> > > > External email : Please do not click links or open attachments
> > > > until
> > > > you have verified the sender or the content.
> > > >=20
> > > >=20
> > > > On 2023-04-28 11:36, Yi-De Wu wrote:
> > > > > From: "Yingshiuan Pan" <yingshiuan.pan@mediatek.com>
> > > > >=20
> > > > > Enable GenieZone to handle virtual interrupt injection request.
> > > > >=20
> > > > > Signed-off-by: Yingshiuan Pan <yingshiuan.pan@mediatek.com>
> > > > > Signed-off-by: Yi-De Wu <yi-de.wu@mediatek.com>
> > > > > ---
> > > > >  arch/arm64/geniezone/Makefile       |  2 +-
> > > > >  arch/arm64/geniezone/gzvm_arch.c    | 24 ++++++--
> > > > >  arch/arm64/geniezone/gzvm_arch.h    | 11 ++++
> > > > >  arch/arm64/geniezone/gzvm_irqchip.c | 88
> > > > > +++++++++++++++++++++++++++++
> > > > >  drivers/virt/geniezone/gzvm_vm.c    | 75
> > > > > ++++++++++++++++++++++++
> > > > >  include/linux/gzvm_drv.h            |  4 ++
> > > > >  include/uapi/linux/gzvm.h           | 38 ++++++++++++-
> > > > >  7 files changed, 235 insertions(+), 7 deletions(-)
> > > > >  create mode 100644 arch/arm64/geniezone/gzvm_irqchip.c
> > > >=20
> > > > [...]
> > > >=20
> > > > > +++ b/arch/arm64/geniezone/gzvm_irqchip.c
> > > > > @@ -0,0 +1,88 @@
> > > > > +// SPDX-License-Identifier: GPL-2.0
> > > > > +/*
> > > > > + * Copyright (c) 2023 MediaTek Inc.
> > > > > + */
> > > > > +
> > > > > +#include <linux/irqchip/arm-gic-v3.h>
> > > > > +#include <kvm/arm_vgic.h>
> > > >=20
> > > > NAK.
> > > >=20
> > > > There is no way you can rely on anything from KVM in
> > > > your own hypervisor code.
> > > >=20
> > >=20
> > > Same with previous discussion, we'd like to copy or rename the
> > > related
> > > part from KVM and keep the maintainance at our own if it's ok.
> >=20
> > Why do you need *ANY* of the KVM stuff? Please fully enumerate these
> > dependencies and why you have them.
> >=20
> > Directly using KVM stuff for something completely unrelated is not
> > OK,
> > and will never be.
> >=20
> >         M.
> >=20
> > --
> > Without deviation from the norm, progress is not possible.
>=20
> The particular part we'd like to leverage from KVM are as followed
> 1. `gfn_to_pfn_memslot` to convert guest physical address(or
> intermediate physical address) to physical address

What is a memslot in your hypervisor? How does it relate to KVM's?
What about the use of struct kvm?

I'm sorry, but your use of *internal* structures and API would make it
impossible for us to make any further change without potentially
affecting your hypervisor. Which is closed source and untestable.

To sum it up, I'm strongly opposed to any use of these data
structures.  If you can spot some commonalities, expose them as a
0-cost abstraction. But don't use them as is your code.

> 2. get ARM's number of interrupt of different types e.g. number of SGI,
> number of PPI...etc

These are architectural constants, and you can define your own. That
will cost you nothing but a handful of #define, and keep the two
subsystem independent.

	M.

--=20
Without deviation from the norm, progress is not possible.

