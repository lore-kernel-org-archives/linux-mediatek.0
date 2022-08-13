Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33B2AC19F2D
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Aug 2022 15:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YrxeWYVqwHcz/RGDRF2/ZwwFUnUxdU7yXD9JFNxZb2Q=; b=RmiR5jz2M0SfQZBJfqVdbN4DSr
	hydjBI6G30A9VQdtiyudDgOj58dRxAmKRx4/6p9JIfyt0KORxIpSpqx1d58TvdiVB+zI8rjzL2xkH
	0S6LpBNG1/aR3M3y3lLYaAHdToVsK7e7ae/00tysxTeEytQylSltdc42bmFSYsbtSm7T637dU344+
	ClfL7oAd8cLG01s4RwtnUCmX1m229etFKpOYSS+Twzs3tLxo6HomDVlNMbu8pdsFxhSqQUVe5Agw9
	bbJiimIvn17OllVUQ5LMl7aDMpWxbd65/yW1bbyuDdK3OQTk4XadMdMS4LZ61nmwJTLml5K9mZiwk
	OXjzlk2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMtCo-00FVAJ-8l; Sat, 13 Aug 2022 15:37:42 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMtCa-00FV2R-DA; Sat, 13 Aug 2022 15:37:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 17949B8069B;
	Sat, 13 Aug 2022 15:37:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 928BEC433D6;
	Sat, 13 Aug 2022 15:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660405045;
	bh=YKS5k8HQOL4Skk22H+cxjJPrMUDWvdWUTz36jDqZAJY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cXROFHWGoInf1pK354gp5Gb9NyimQMtBez5XiY9JTc+SxkCr6CWCJe+n2oZqHfzlH
	 wfzhWVtq6NHlL5/TjcUp4bmN36+oYBF5bh041xeTET3yfGzrenYrA0fDV7khptS650
	 zb5W4MOzma2Xk26UWd8/VQLvRxwsrTO8C2J5P992bopRmg1EIpDz8gOorUsKv3Ii7F
	 Qy+gg6gmNcisR4OqIC402ov2Evvymt2UYJXnySgcq0igmFxGrnoADcSwhpGGeuT+wA
	 JccQ8kCw2Jy7xQMfLherw5k43kwBXycb4aj4+Rft3sWzV5XyMZrS3FQxr8QZW/NcNO
	 qDKiTP1zMFlUw==
Date: Sat, 13 Aug 2022 16:47:48 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Lee Jones <lee.jones@linaro.org>
Cc: ChiaEn Wu <peterwu.pub@gmail.com>, daniel.thompson@linaro.org,
 jingoohan1@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, sre@kernel.org,
 chunfeng.yun@mediatek.com, gregkh@linuxfoundation.org, lars@metafoo.de,
 lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, deller@gmx.de, andy.shevchenko@gmail.com,
 chiaen_wu@richtek.com, alice_chen@richtek.com, cy_huang@richtek.com,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org,
 szunichen@gmail.com, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Lee Jones <lee@kernel.org>
Subject: Re: [PATCH v7 06/13] dt-bindings: mfd: Add MediaTek MT6370
Message-ID: <20220813164748.0c5564c2@jic23-huawei>
In-Reply-To: <YvJdpq0MWNPQZw5c@google.com>
References: <20220805070610.3516-1-peterwu.pub@gmail.com>
	<20220805070610.3516-7-peterwu.pub@gmail.com>
	<YvJdpq0MWNPQZw5c@google.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220813_083728_627358_C3E1E3A8 
X-CRM114-Status: GOOD (  14.54  )
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

On Tue, 9 Aug 2022 14:14:14 +0100
Lee Jones <lee.jones@linaro.org> wrote:

> On Fri, 05 Aug 2022, ChiaEn Wu wrote:
> 
> > From: ChiYuan Huang <cy_huang@richtek.com>
> > 
> > Add MediaTek MT6370 binding documentation.
> > 
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> > Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
> > ---
> >  .../devicetree/bindings/mfd/mediatek,mt6370.yaml   | 280 +++++++++++++++++++++
> >  include/dt-bindings/iio/adc/mediatek,mt6370_adc.h  |  18 ++
> >  2 files changed, 298 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
> >  create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6370_adc.h  
> 
> Applied, thanks.
> 
Hi Lee,

The iio: adc: patch is dependent on this (due to the binding header) -
so either you should pick that up as well, or it'll get delayed until what
you've picked up is available upstream - or I guess some hackery to allow them
to go via different trees and flip to the header only once all the prior steps
are in place.

Note I'd messed up sending an Ack on the ADC patch which I've now fixed.

Thanks,

Jonathan



