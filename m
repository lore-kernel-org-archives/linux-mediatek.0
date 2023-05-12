Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8573CC77B7C
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 May 2023 07:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:From:
	Message-ID:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1V8lxBdwYKPl36jH8/r7eKXviqpECb1L0Oc7etXyHQ0=; b=Gys5yzPE+o1+mYQboivKg+6cDm
	J1nwdDfD46t94alcPlwsPTc5OVvG9Z70ej3Db+LyaAeywmqdK7ewTHzLbeLuObKR11dqzKQEXVdT5
	3uFltbJ3YMCTn6kK9vssZULCIqVkoo/S1/P5K8BsVz+6cYMnIB1b035Qop6DrE6GPsQEO6zhcgrYJ
	JvF9fPLF22EkKQAX1eA4kieSdD3jZ2eFYqPCdbMzr607Qq4Q75283ZW/J/y1TBPFOKUqwntlYmSBP
	873kzpI1MW62PssanM7eb85tXWpxKCPLWV338Ny+boUHcTcSnK0VUbSS0bg6OC59EbK/qkdVwKzEh
	VYL0EBaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxNYW-00BEUq-2Y;
	Fri, 12 May 2023 07:51:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxNYU-00BETi-0G;
	Fri, 12 May 2023 07:51:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5134F65371;
	Fri, 12 May 2023 07:51:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFE2AC433EF;
	Fri, 12 May 2023 07:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683877868;
	bh=xQJ6kpGBdd8sMe9djXAeDmkVMiiz4MwCxAnjryMRGP0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Tw4wiNJBJmWZsvKinXNZwXCJc8CJP8zJqZ56sGWKW8umDPbGIQ3KwNLn6bDZ4fjqY
	 Afwga5cdvBkcbgsQAfzQge0Gg/z4bUELXtpISFrZJTdwbygBQ35jbnXg/1Y3obhzJC
	 aLcZRUwMwpuJjfy4D0DTQNB0KdDvBqRBDi3m32kOzfXa8jPixC1MQvZZ+PZLalDPY6
	 yaXlnp/7JBYhPr3plLjrFofQBv5+NskX5hl3lBbDkoX5xdhumjd8w9QTK2vh1GbWnx
	 g05WgbqI6gEe48DuZspT02HDarfVtlgUDELvdRMbfIe/EnxqVv7GYss+UIZL316yev
	 3bJ9sKebTTJFw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1pxNYQ-00EVeu-HZ;
	Fri, 12 May 2023 08:51:06 +0100
Date: Fri, 12 May 2023 08:51:06 +0100
Message-ID: <86wn1em1hx.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: =?UTF-8?B?IllpLURlIFd1ICjlkLPkuIDlvrcpIg==?= <Yi-De.Wu@mediatek.com>
Cc: "corbet@lwn.net" <corbet@lwn.net>,	"linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>,	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,	=?UTF-8?B?Ik1Z?=
 =?UTF-8?B?IENodWFuZyAo6I6K5piO6LqNKSI=?= <MY.Chuang@mediatek.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"quic_tsoni@quicinc.com" <quic_tsoni@quicinc.com>,	=?UTF-8?B?IlNoYXduIEhz?=
 =?UTF-8?B?aWFvICjola3lv5fnpaUpIg==?= <shawn.hsiao@mediatek.com>,
	=?UTF-8?B?Ik1pbGVzIENoZW4gKOmZs+awkeaouiki?= <Miles.Chen@mediatek.com>,
	=?UTF-8?B?IlBlaUx1biBTdWVpICjpmovln7nlgKspIg==?=
 <PeiLun.Suei@mediatek.com>,	=?UTF-8?B?IkxpanUtY2xyIENoZW4gKOmZs+m6lw==?=
 =?UTF-8?B?5aaCKSI=?= <Liju-clr.Chen@mediatek.com>,	=?UTF-8?B?IkphZGVzIFNo?=
 =?UTF-8?B?aWggKOaWveWQkeeOqCki?= <jades.shih@mediatek.com>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,	"dbrazdil@google.com"
 <dbrazdil@google.com>,	"linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,	=?UTF-8?B?IllpbmdzaGl1YW4gUGFu?=
 =?UTF-8?B?ICjmvZjnqY7ou5IpIg==?= <Yingshiuan.Pan@mediatek.com>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,	"arnd@arndb.de"
 <arnd@arndb.de>,	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	=?UTF-8?B?IlplLXl1IFdhbmcgKOeOi+a+pOWuhyki?= <Ze-yu.Wang@mediatek.com>,
	"will@kernel.org" <will@kernel.org>,	=?UTF-8?B?Ikl2YW4gVHNlbmcgKOabvg==?=
 =?UTF-8?B?5b+X6LuSKSI=?= <ivan.tseng@mediatek.com>
Subject: Re: [PATCH v2 5/7] virt: geniezone: Add irqchip support for virtual interrupt injection
In-Reply-To: <762e3494ed468f0337b1c336615065b154396d23.camel@mediatek.com>
References: <20230428103622.18291-1-yi-de.wu@mediatek.com>
	<20230428103622.18291-6-yi-de.wu@mediatek.com>
	<f1c8c1c1c091be87dfbc27b9178fc3e6@kernel.org>
	<762e3494ed468f0337b1c336615065b154396d23.camel@mediatek.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/28.2
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: Yi-De.Wu@mediatek.com, corbet@lwn.net, linux-kernel@vger.kernel.org, robh+dt@kernel.org, angelogioacchino.delregno@collabora.com, linux-mediatek@lists.infradead.org, linux-arch@vger.kernel.org, MY.Chuang@mediatek.com, devicetree@vger.kernel.org, quic_tsoni@quicinc.com, shawn.hsiao@mediatek.com, Miles.Chen@mediatek.com, PeiLun.Suei@mediatek.com, Liju-clr.Chen@mediatek.com, jades.shih@mediatek.com, catalin.marinas@arm.com, dbrazdil@google.com, linux-arm-kernel@lists.infradead.org, Yingshiuan.Pan@mediatek.com, krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, arnd@arndb.de, linux-doc@vger.kernel.org, Ze-yu.Wang@mediatek.com, will@kernel.org, ivan.tseng@mediatek.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_005110_205371_E8C26BE0 
X-CRM114-Status: GOOD (  25.67  )
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

On Fri, 12 May 2023 08:19:31 +0100,
"Yi-De Wu (=E5=90=B3=E4=B8=80=E5=BE=B7)" <Yi-De.Wu@mediatek.com> wrote:
>=20
> On Fri, 2023-04-28 at 19:59 +0100, Marc Zyngier wrote:
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >=20
> >=20
> > On 2023-04-28 11:36, Yi-De Wu wrote:
> > > From: "Yingshiuan Pan" <yingshiuan.pan@mediatek.com>
> > >=20
> > > Enable GenieZone to handle virtual interrupt injection request.
> > >=20
> > > Signed-off-by: Yingshiuan Pan <yingshiuan.pan@mediatek.com>
> > > Signed-off-by: Yi-De Wu <yi-de.wu@mediatek.com>
> > > ---
> > >  arch/arm64/geniezone/Makefile       |  2 +-
> > >  arch/arm64/geniezone/gzvm_arch.c    | 24 ++++++--
> > >  arch/arm64/geniezone/gzvm_arch.h    | 11 ++++
> > >  arch/arm64/geniezone/gzvm_irqchip.c | 88
> > > +++++++++++++++++++++++++++++
> > >  drivers/virt/geniezone/gzvm_vm.c    | 75 ++++++++++++++++++++++++
> > >  include/linux/gzvm_drv.h            |  4 ++
> > >  include/uapi/linux/gzvm.h           | 38 ++++++++++++-
> > >  7 files changed, 235 insertions(+), 7 deletions(-)
> > >  create mode 100644 arch/arm64/geniezone/gzvm_irqchip.c
> >=20
> > [...]
> >=20
> > > +++ b/arch/arm64/geniezone/gzvm_irqchip.c
> > > @@ -0,0 +1,88 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Copyright (c) 2023 MediaTek Inc.
> > > + */
> > > +
> > > +#include <linux/irqchip/arm-gic-v3.h>
> > > +#include <kvm/arm_vgic.h>
> >=20
> > NAK.
> >=20
> > There is no way you can rely on anything from KVM in
> > your own hypervisor code.
> >=20
>=20
> Same with previous discussion, we'd like to copy or rename the related=20
> part from KVM and keep the maintainance at our own if it's ok.

Why do you need *ANY* of the KVM stuff? Please fully enumerate these
dependencies and why you have them.

Directly using KVM stuff for something completely unrelated is not OK,
and will never be.

	M.

--=20
Without deviation from the norm, progress is not possible.

