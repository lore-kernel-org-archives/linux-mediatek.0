Return-Path: <SRS0=UyV0=DN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 300E9C46466
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Oct 2020 06:54:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0A0E20757
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Oct 2020 06:54:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q1sN+Zc+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ZloxSqHc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0A0E20757
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0hy6dCsFXChH8nuq5ofHRjRs0KCONTY5L8qSneB/OVc=; b=q1sN+Zc+ybm/I3v8HCpuj8Nnq
	2pxgj+SD4CpsYGaNeXuI5KrZJhcxcvAwcIQkZkFLOPV59ih2v6pWxT3XFdLMJF1h6lyihjfKiDxMK
	eE6yInFMw+1UdvcwdFXn/yBcJ/5O9LD+ZnIxQK33E/iMPbwTSsXKFhzSXdaOoUqccYIP3KzPW3imK
	Yc1EPyYb+eYS1SwVjgspN2eTaYQIDG3eW+hn1wlLTQozYUIos9Rvuzhr1qemaJMq7f5JuqE3GQaMq
	OwYRMRlLSxHkX7FBlS1MXsMv8oKCzhgHthdN1RQIptd4H14EodI8bWAstE7J+SQTg4Jz36m83NmgN
	zSomQX7aA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPgrC-0002NG-Vm; Tue, 06 Oct 2020 06:53:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPgr8-0002Kw-MZ; Tue, 06 Oct 2020 06:53:54 +0000
X-UUID: 85a3d4d5d2ee4b77abfb6e42d1bfaf10-20201005
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=0mBtm/fCfqfZesQrhxR5PAO+6fo5yZk/+rrmxHbf6SI=; 
 b=ZloxSqHc45HuaK+nctBUhapu1q54qPxSma5UZYtJhHUvf8HuKfYyEYGtfNoOXl5qeg20yXjSjIA01KOOTRQL0rjJXhs16N0Ggf5ADFBgm4mdj2v6LCYtBa0QbtJkak2lCBzLvmnnmDH2h8AAsqrJvmq88lNcfDJPqevWuEQvnYU=;
X-UUID: 85a3d4d5d2ee4b77abfb6e42d1bfaf10-20201005
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 78218353; Mon, 05 Oct 2020 22:53:30 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 5 Oct 2020 23:53:28 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 6 Oct 2020 14:53:26 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 6 Oct 2020 14:53:26 +0800
Message-ID: <1601967207.8638.4.camel@mtksdaap41>
Subject: Re: [PATCH 00/12] soc: mediatek: pm-domains: Add new driver for
 SCPSYS power domains controller
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Tue, 6 Oct 2020 14:53:27 +0800
In-Reply-To: <19678952-e354-2067-e619-ffac28b347be@gmail.com>
References: <20200910172826.3074357-1-enric.balletbo@collabora.com>
 <1601028361.1346.38.camel@mtksdaap41>
 <19678952-e354-2067-e619-ffac28b347be@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201006_025350_864662_81A466AC 
X-CRM114-Status: GOOD (  40.08  )
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
Cc: devicetree@vger.kernel.org, drinkcat@chromium.org,
 linux-kernel@vger.kernel.org, fparent@baylibre.com,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org, Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-09-25 at 16:04 +0200, Matthias Brugger wrote:
> 
> On 25/09/2020 12:06, Weiyi Lu wrote:
> > On Thu, 2020-09-10 at 19:28 +0200, Enric Balletbo i Serra wrote:
> >> Dear all,
> >>
> >> This is a new driver with the aim to deprecate the mtk-scpsys driver.
> >> The problem with that driver is that, in order to support more Mediatek
> >> SoCs you need to add some logic to handle properly the power-up
> >> sequence of newer Mediatek SoCs, doesn't handle parent-child power
> >> domains and need to hardcode all the clocks in the driver itself. The
> >> result is that the driver is getting bigger and bigger every time a
> >> new SoC needs to be supported.
> >>
> > 
> > Hi Enric and Matthias,
> > 
> > First of all, thank you for the patch. But I'm worried the problem you
> > mentioned won't be solved even if we work on this new driver in the
> > future. My work on the MT8183 scpsys(now v17) is to implement the new
> > hardware logic. Here, I also see related patches, which means that these
> > new logics are necessary. Why can't we work on the original driver?
> 
> Well the decision was to change the driver in a not compatible way to make 
> device tree entries better. If we work on the old driver, we would need to find 
> some creative ways to handle old bindings vs new bindings.
> 
> So I thought it would be better doing a fresh start implementing mt1873 support 
> for reference and add mt8183 as new SoC. From what I have seen mt8192 and others 
> fit the driver structure too.
> 
> > Meanwhile, I thought maybe we should separate the driver into general
> > control and platform data for each SoC, otherwise it'll keep getting
> > bigger and bigger if it need to be support new SoC.
> > 
> 
> We could in a later series split the SoC depended data structures and put them 
> in drivers/soc/mediatek/pm-domains-mt8183.h or something like this. Is that what 
> you mean?
> 

Yes, that is what I want. And I guess it could avoid the collisions in
the different defines to the control registers and power status bits you
mentioned. Hope this will happen in this series.

> > And consider DVFSRC
> > (dynamic voltage and frequency scaling resource collector), should we
> > keep the original driver name "scpsys" instead of "pm-domains" because
> > it may provide more functions than power domains?
> > 
> 
> It's on my list to look deeper into this series. The thing with the new driver 
> is, that the binding takes into account, that scpsys has several hardware block, 
> which are represented as child nodes in DTS. The pm-domains is just one of these 
> functionalities and I think DVFSRC should be a new driver with a child node of 
> scpsys in DTS. Does this make sense?
> 
> Regards,
> Matthias
> 
> >> All this information can be getted from a properly defined binding, so
> >> can be cleaner and smaller, hence, we implemented a new driver. For
> >> now, only MT8173 and MT8183 is supported but should be fairly easy to
> >> add support for new SoCs.
> >>
> >> Best regards,
> >>    Enric
> >>
> >> Enric Balletbo i Serra (4):
> >>    dt-bindings: power: Add bindings for the Mediatek SCPSYS power domains
> >>      controller
> >>    soc: mediatek: Add MediaTek SCPSYS power domains
> >>    arm64: dts: mediatek: Add mt8173 power domain controller
> >>    dt-bindings: power: Add MT8183 power domains
> >>
> >> Matthias Brugger (8):
> >>    soc: mediatek: pm-domains: Add bus protection protocol
> >>    soc: mediatek: pm_domains: Make bus protection generic
> >>    soc: mediatek: pm-domains: Add SMI block as bus protection block
> >>    soc: mediatek: pm-domains: Add extra sram control
> >>    soc: mediatek: pm-domains: Add subsystem clocks
> >>    soc: mediatek: pm-domains: Allow bus protection to ignore clear ack
> >>    soc: mediatek: pm-domains: Add support for mt8183
> >>    arm64: dts: mediatek: Add mt8183 power domains controller
> >>
> >>   .../power/mediatek,power-controller.yaml      | 173 ++++
> >>   arch/arm64/boot/dts/mediatek/mt8173.dtsi      |  78 +-
> >>   arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 160 +++
> >>   drivers/soc/mediatek/Kconfig                  |  13 +
> >>   drivers/soc/mediatek/Makefile                 |   1 +
> >>   drivers/soc/mediatek/mtk-infracfg.c           |   5 -
> >>   drivers/soc/mediatek/mtk-pm-domains.c         | 952 ++++++++++++++++++
> >>   include/dt-bindings/power/mt8183-power.h      |  26 +
> >>   include/linux/soc/mediatek/infracfg.h         |  39 +
> >>   9 files changed, 1433 insertions(+), 14 deletions(-)
> >>   create mode 100644 Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> >>   create mode 100644 drivers/soc/mediatek/mtk-pm-domains.c
> >>   create mode 100644 include/dt-bindings/power/mt8183-power.h
> >>
> > 
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
