Return-Path: <SRS0=Rw5Z=YR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3EC4CA9EAF
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Oct 2019 10:11:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84EFF20663
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Oct 2019 10:11:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="toXmhw0w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84EFF20663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TFPb+qZ80jgXt5lnVbmO8U79lWgTan7mh4aDHN2Vhj8=; b=toXmhw0wNSyCIy
	e+OFuC3/hCxXErq/0tIM+sRn57CEKzp0f5FMrVwTtPK5m+rIuKYBQ2aXzWiq7VSh9M9nnFDjLMYfw
	Z2USReWDw+PjRfwnFM3oM0agd3v1So6yJr5csjaRb4kviJjm2TjWB+3S88u7ryMtGlMc0o9v3hyQW
	mLMEhTY3vVxY6veQwsa+f0tr759QXgP66PgGA+hFLkhUGo0KcdVlaeqDGpnRxzZHjJiqOkYy8GOVx
	8oMxtSRjHtMOpszwHa+UOGHDvtLRw1IsrWSmTyu5pPTjFT9ws7SoTN4nte7Ea0yE56Ulktj0lf8fM
	aIEZOwIbDpXt++R0SbhA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iNa5Y-0003t8-Oz; Thu, 24 Oct 2019 10:11:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNa5Q-0003jb-Lf; Thu, 24 Oct 2019 10:11:22 +0000
X-UUID: 75b15357a60c4b3184ddcd002971d5a2-20191024
X-UUID: 75b15357a60c4b3184ddcd002971d5a2-20191024
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <luhua.xu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 228353546; Thu, 24 Oct 2019 02:11:09 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 24 Oct 2019 03:11:10 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 24 Oct 2019 18:11:09 +0800
Received: from [10.15.20.246] (10.15.20.246) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 24 Oct 2019 18:11:08 +0800
Message-ID: <1571911880.4955.11.camel@mbjsdccf07>
Subject: Re: [PATCH 1/1] spi: mediatek: add power control when set_cs
From: luhua xu <luhua.xu@mediatek.com>
To: Mark Brown <broonie@kernel.org>
Date: Thu, 24 Oct 2019 18:11:20 +0800
In-Reply-To: <1571898319.4311.3.camel@mbjsdccf07>
References: <1571834322-1121-1-git-send-email-luhua.xu@mediatek.com>
 <1571834322-1121-2-git-send-email-luhua.xu@mediatek.com>
 <20191023151121.GC5723@sirena.co.uk> <1571898319.4311.3.camel@mbjsdccf07>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191024_031120_711248_E54FE734 
X-CRM114-Status: GOOD (  13.00  )
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
Cc: wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, luhua.xu@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2019-10-24 at 14:25 +0800, luhua xu wrote:
> On Wed, 2019-10-23 at 16:11 +0100, Mark Brown wrote:
> > On Wed, Oct 23, 2019 at 08:38:42AM -0400, Luhua Xu wrote:
> > > From: "luhua.xu" <luhua.xu@mediatek.com>
> > 
> > > Use runtime PM to power spi when set_cs
> > > As set_cs may be called from interrupt context,
> > > set runtime PM IRQ safe for spi.
> > 
> > Why might we be trying to set the chip select state while the device is
> > runtime idle?  It seems like whatever is trying to set the chip select
> > should be dealing with this, not the chip select operation itself since
> > that's unlikely to be happening in isolation.
> 
> Hi Mark,
> Spi framework provideds  spi_setup() to modify spi settings for spi
> device (maybe spi is runtime idle now), and this will call
> spi_controller->set_cs() accessing registers.
> Other spi_controller callbacks that need to access hardware registers,
> are triggered by spi transfer. Spi framework will get and put runtime
> power in __spi_pump_message().

hi Mark,
      If the spi slaver  who wants to set cs  need to  power spi
itself , this means we need to provide spi power on/off APIs  while spi
controller is runtime PM device.
      And spi slaver  needs to power spi itself when it wants to set cs,
and don't need to do so when do spi data transfer.

      I see  several case of spi driver with power control:
      (1)No clk control  in set_cs,  such as spi-cadence.c
      (2)Enable spi clk  in probe before the first time hitting reg,
and never power down. Such as  spi-sifive.c  spi-armada-3700.c
      (3)Enable spi clk  in  controller->set_cs  callback,  such as
spi-geni-qcom.c.    
      My patch works the same as (3).For mtk platform, without this
patch, if user do spi_setup(), cs setting cannot take effect, and reg
access violation occurs.
                

        


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
