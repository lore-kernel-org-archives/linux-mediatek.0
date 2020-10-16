Return-Path: <SRS0=WAzV=DX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEEEAC433E7
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Oct 2020 08:53:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E74D20663
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Oct 2020 08:53:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RNQ2llxz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E74D20663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baikalelectronics.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PzDoK+WSLxCy+HERadLP2dnZbDPzm+lGqw3Xm+1pZZg=; b=RNQ2llxz3l1hpU/kV8romcNUl
	9Kh39JzlOBo0AYAW+cdgfGjCj5xOG7t9XorJvCTc+tE4tF+SWS7f4rfiv7I/VkOd+Kxxb+hGh4BEY
	zKfVfI2uXgZ00LM7cEomLJmDBZApPGNe1M2zgmy6ICwOpayZQWJaSSj1LxQrsdYjC3Ncpw5W5x1bZ
	BJqSiCtE+P+2mFMLAI8YvLz6m89gICbg+VemQPJamiPNlIvjjgHOsSbOL+wDDT3Gh3fHNgumH6XS1
	hKw3a3osk8Xh7GV2gTpkocJkFVGwCWaB0HOdFrp0Ki826nQA99RZiHuL+sDHSicEKx6ojQVN03sTI
	jhhIuL7aw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTLTq-0005cA-9f; Fri, 16 Oct 2020 08:52:54 +0000
Received: from mail.baikalelectronics.com ([87.245.175.226]
 helo=mail.baikalelectronics.ru)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTLTl-0005ZT-8H; Fri, 16 Oct 2020 08:52:50 +0000
Received: from localhost (unknown [127.0.0.1])
 by mail.baikalelectronics.ru (Postfix) with ESMTP id 8039D8030808;
 Fri, 16 Oct 2020 08:52:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
 by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PNU5UTBKGSXE; Fri, 16 Oct 2020 11:52:40 +0300 (MSK)
Date: Fri, 16 Oct 2020 11:52:35 +0300
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH 18/20] arch: dts: Fix EHCI/OHCI DT nodes name
Message-ID: <20201016085235.znzzbqxac4yvh3cz@mobilestation>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-19-Sergey.Semin@baikalelectronics.ru>
 <8a7af322-227b-9923-8fb6-f284af582b40@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8a7af322-227b-9923-8fb6-f284af582b40@st.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_045249_576439_72D13F93 
X-CRM114-Status: GOOD (  15.50  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Paul Cercueil <paul@crapouillou.net>, Paul Mackerras <paulus@samba.org>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 linux-stm32@st-md-mailman.stormreply.com,
 Michael Ellerman <mpe@ellerman.id.au>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Alexey Brodkin <abrodkin@synopsys.com>, Wei Xu <xuwei5@hisilicon.com>,
 Andy Gross <agross@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 Kevin Hilman <khilman@baylibre.com>, linux-snps-arc@lists.infradead.org,
 devicetree@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>,
 Hauke Mehrtens <hauke@hauke-m.de>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 linux-arm-kernel@lists.infradead.org, Roger Quadros <rogerq@ti.com>,
 Felipe Balbi <balbi@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-usb@vger.kernel.org, linux-mips@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, linux-kernel@vger.kernel.org,
 Manu Gautam <mgautam@codeaurora.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vineet Gupta <vgupta@synopsys.com>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello Alexandre,

On Fri, Oct 16, 2020 at 09:08:23AM +0200, Alexandre Torgue wrote:
> Hi Serge,
> 
> On 10/14/20 12:14 PM, Serge Semin wrote:
> > In accordance with the Generic EHCI/OHCI bindings the corresponding node
> > name is suppose to comply with the Generic USB HCD DT schema, which
> > requires the USB nodes to have the name acceptable by the regexp:
> > "^usb(@.*)?" . Let's fix the DTS files, which have the nodes defined with
> > incompatible names.
> > 
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > 
> > ---
> > 
> > Please, test the patch out to make sure it doesn't brake the dependent DTS
> > files. I did only a manual grepping of the possible nodes dependencies.
> > ---
> >   arch/arc/boot/dts/axs10x_mb.dtsi               | 4 ++--
> >   arch/arc/boot/dts/hsdk.dts                     | 4 ++--
> >   arch/arc/boot/dts/vdk_axs10x_mb.dtsi           | 2 +-
> >   arch/arm/boot/dts/bcm5301x.dtsi                | 4 ++--
> >   arch/arm/boot/dts/bcm53573.dtsi                | 4 ++--
> >   arch/arm/boot/dts/hisi-x5hd2.dtsi              | 4 ++--
> >   arch/arm/boot/dts/lpc18xx.dtsi                 | 4 ++--
> >   arch/arm/boot/dts/stm32mp151.dtsi              | 4 ++--
> >   arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi | 4 ++--
> >   arch/arm64/boot/dts/hisilicon/hip06.dtsi       | 4 ++--
> >   arch/arm64/boot/dts/hisilicon/hip07.dtsi       | 4 ++--
> >   arch/mips/boot/dts/ingenic/jz4740.dtsi         | 2 +-
> >   arch/mips/boot/dts/ingenic/jz4770.dtsi         | 2 +-
> >   arch/mips/boot/dts/mti/sead3.dts               | 2 +-
> >   arch/mips/boot/dts/ralink/mt7628a.dtsi         | 2 +-
> >   arch/powerpc/boot/dts/akebono.dts              | 6 +++---
> >   16 files changed, 28 insertions(+), 28 deletions(-)
> > 
> 

> I surely missed something, but we have here in the same patch modifications
> for different architectures and different vendors.
> 
> Do you plan to split this patch after getting some Acked-by / Tested-by ?

Yeah, I'll split this patch and two next ones up in v3.

-Sergey

> 
> regards
> Alex
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
