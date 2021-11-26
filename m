Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6888C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Nov 2021 09:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=My24Evo+pBIh4+asSXENiP3xPMEXNnpPeTGq0KfXQ2c=; b=cby7WwQKIbdJbO
	6UvhhpvLxm1oCMF+XFlFnFe8rjphF82KQDVV7TYDbKLyRQ/y5s7BijnJOJOFo+WB61BEubSeMPJWA
	7IMWb2bySuLg/zfXxQQjbdEWdG/wqbPRVGQqi1dsRrhxX4O0ImpOaQmFFs4KzqhQavutl4ZEy7dY0
	+VhZn1qIiWVsWWxaLLK0QzrxmMmvTvpOpG5XhV3JU02uP0MNPDrbSyWMdv3SF4yYToD1lCcGs0q8t
	3+qPB2hpr43S+9L67jEXVDPoAAU42K6xfnWmdBXYXGuTAVjjo7TNRutvxHNwEvsL1URV4AHPzZS9r
	R6q4RKz7iHCTo/XzSgAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqXj9-009k4W-Qh; Fri, 26 Nov 2021 09:41:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqXiZ-009jtP-HM; Fri, 26 Nov 2021 09:40:32 +0000
X-UUID: fee4f125b6bc4801a5aacfabd1d59140-20211126
X-UUID: fee4f125b6bc4801a5aacfabd1d59140-20211126
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <flora.fu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 416965493; Fri, 26 Nov 2021 02:40:23 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 26 Nov 2021 01:30:22 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 26 Nov 2021 17:30:20 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 26 Nov 2021 17:30:20 +0800
Message-ID: <ebc219fff8a1956d9880b555154d92b6eaef9eea.camel@mediatek.com>
Subject: Re: [RFC 06/13] soc: mediatek: apu: Add apu core driver
From: Flora.Fu <flora.fu@mediatek.com>
To: Randy Dunlap <rdunlap@infradead.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>, Sumit Semwal
 <sumit.semwal@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>, Yong Wu
 <yong.wu@mediatek.com>, Pi-Cheng Chen <pi-cheng.chen@mediatek.com>
Date: Fri, 26 Nov 2021 17:30:20 +0800
In-Reply-To: <35b6b7af-87f1-4390-faf8-9f44c192aedd@infradead.org>
References: <20211023111409.30463-1-flora.fu@mediatek.com>
 <20211023111409.30463-7-flora.fu@mediatek.com>
 <35b6b7af-87f1-4390-faf8-9f44c192aedd@infradead.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_014031_598644_514217CE 
X-CRM114-Status: GOOD (  21.07  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, 2021-10-23 at 08:49 -0700, Randy Dunlap wrote:
> Hi,
> 
> On 10/23/21 4:14 AM, Flora Fu wrote:
> > diff --git a/drivers/soc/mediatek/Kconfig
> > b/drivers/soc/mediatek/Kconfig
> > index d9bac2710494..074b0cf24c44 100644
> > --- a/drivers/soc/mediatek/Kconfig
> > +++ b/drivers/soc/mediatek/Kconfig
> > @@ -24,6 +24,24 @@ config MTK_APU_PM
> >   	  APU power domain shall be enabled before accessing the
> >   	  internal sub modules.
> >   
> > +config MTK_APU
> > +	tristate "MediaTek APUSYS Support"
> > +	select REGMAP
> > +	select MTK_APU_PM
> > +	select MTK_SCP
> > +	help
> > +	  Say yes here to add support for the APU tinysys. The tinsys
> > is
> 
> 	                                                       tinysys
> runs on
> 
> > +	  running on a micro processor in APU.
> 
> 	  a microprocessor in the APU.
> 
> > +	  Its firmware is load and boot from Kernel side. Kernel and
> > tinysys use
> 
> 	               is loaded and booted
> 
> > +	  IPI to tx/rx messages.
> 
> 	      to send/receive messages.
Ack. 

> > +
> > +config MTK_APU_DEBUG
> > +	tristate "MediaTek APUSYS debug functions"
> > +	depends on MTK_APU
> > +	help
> > +	  Say yes here to enalbe debug on APUSYS.
> 
> 	                  enable

Ack.
The tpyo will be fix in the next submission. 
Thanks for your review.

> 
> > +	  Disable it if you don't need them.
> 
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
