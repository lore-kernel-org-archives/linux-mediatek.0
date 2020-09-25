Return-Path: <SRS0=ZCae=DC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F857C4727C
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 10:07:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5C4120BED
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 10:07:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ApqYRqA6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="uYdoEsn+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5C4120BED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OlFNjO7mZqb7nZ3rUb/a7wJjh1wGqvomRe/uo9d/g5k=; b=ApqYRqA6TT5vMjbbo2hPkrXuQ
	yKm7Q3r/Bzxj5SF4SkIDanzcB+5psIXPvWgZPFd2m1N84ZGWAUUx+O4uG3wR1Z+L1DWbjVocCb+9m
	QZhiquje7iMggv7HWnKifBrrFVt4EZGkR+Hn8asI/EKPHTALeBgwL/Vgn6rnoP+bCjED58vEu1vNa
	pr7k1yI3cdBXFW3ciRjPdzZtS98/24Tm17rJEC/GkrOCVLQaiaFHpTGBxUHpQzGFw4cMEpmqAcjGF
	vXMaQ3FfJznkkMH1gBD5AXr71c/4HapYY/QBTLy7yLsor+Kjg8GjC77quM8hhmabepQHLCtbQ8rbr
	NjzvmnPDA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLkdJ-0003fj-73; Fri, 25 Sep 2020 10:07:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLkdE-0003ey-VS; Fri, 25 Sep 2020 10:07:14 +0000
X-UUID: 30f100d3e8d541c4a9babb596709599e-20200925
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Bph4b89m0n2SvzrQ5y28tD7qLIYsd+I1XIgm6YWOMxg=; 
 b=uYdoEsn+gAceZhj9nTI+EJ9/uYegZSglG4cVZiwuPbc+vzLAhzefsG+snIJX4/mz7GY7tZune8HIxGV2S+aSg3XcZx86Ze2sDv4O3dGeY+MZE1g0bP450dNZWEVYRJyUMACVEsgNabpbq307nmEeOTyn5jPRIer+vxJV9M5jhUU=;
X-UUID: 30f100d3e8d541c4a9babb596709599e-20200925
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 799204048; Fri, 25 Sep 2020 02:07:02 -0800
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 25 Sep 2020 03:06:13 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 25 Sep 2020 18:06:01 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 25 Sep 2020 18:06:00 +0800
Message-ID: <1601028361.1346.38.camel@mtksdaap41>
Subject: Re: [PATCH 00/12] soc: mediatek: pm-domains: Add new driver for
 SCPSYS power domains controller
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Date: Fri, 25 Sep 2020 18:06:01 +0800
In-Reply-To: <20200910172826.3074357-1-enric.balletbo@collabora.com>
References: <20200910172826.3074357-1-enric.balletbo@collabora.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_060713_145203_EACFF9A2 
X-CRM114-Status: GOOD (  23.74  )
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
 hsinyi@chromium.org, matthias.bgg@gmail.com,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-09-10 at 19:28 +0200, Enric Balletbo i Serra wrote:
> Dear all,
> 
> This is a new driver with the aim to deprecate the mtk-scpsys driver.
> The problem with that driver is that, in order to support more Mediatek
> SoCs you need to add some logic to handle properly the power-up
> sequence of newer Mediatek SoCs, doesn't handle parent-child power
> domains and need to hardcode all the clocks in the driver itself. The
> result is that the driver is getting bigger and bigger every time a
> new SoC needs to be supported.
> 

Hi Enric and Matthias,

First of all, thank you for the patch. But I'm worried the problem you
mentioned won't be solved even if we work on this new driver in the
future. My work on the MT8183 scpsys(now v17) is to implement the new
hardware logic. Here, I also see related patches, which means that these
new logics are necessary. Why can't we work on the original driver?
Meanwhile, I thought maybe we should separate the driver into general
control and platform data for each SoC, otherwise it'll keep getting
bigger and bigger if it need to be support new SoC.

And consider DVFSRC
(dynamic voltage and frequency scaling resource collector), should we
keep the original driver name "scpsys" instead of "pm-domains" because
it may provide more functions than power domains?

> All this information can be getted from a properly defined binding, so
> can be cleaner and smaller, hence, we implemented a new driver. For
> now, only MT8173 and MT8183 is supported but should be fairly easy to
> add support for new SoCs.
> 
> Best regards,
>   Enric
> 
> Enric Balletbo i Serra (4):
>   dt-bindings: power: Add bindings for the Mediatek SCPSYS power domains
>     controller
>   soc: mediatek: Add MediaTek SCPSYS power domains
>   arm64: dts: mediatek: Add mt8173 power domain controller
>   dt-bindings: power: Add MT8183 power domains
> 
> Matthias Brugger (8):
>   soc: mediatek: pm-domains: Add bus protection protocol
>   soc: mediatek: pm_domains: Make bus protection generic
>   soc: mediatek: pm-domains: Add SMI block as bus protection block
>   soc: mediatek: pm-domains: Add extra sram control
>   soc: mediatek: pm-domains: Add subsystem clocks
>   soc: mediatek: pm-domains: Allow bus protection to ignore clear ack
>   soc: mediatek: pm-domains: Add support for mt8183
>   arm64: dts: mediatek: Add mt8183 power domains controller
> 
>  .../power/mediatek,power-controller.yaml      | 173 ++++
>  arch/arm64/boot/dts/mediatek/mt8173.dtsi      |  78 +-
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 160 +++
>  drivers/soc/mediatek/Kconfig                  |  13 +
>  drivers/soc/mediatek/Makefile                 |   1 +
>  drivers/soc/mediatek/mtk-infracfg.c           |   5 -
>  drivers/soc/mediatek/mtk-pm-domains.c         | 952 ++++++++++++++++++
>  include/dt-bindings/power/mt8183-power.h      |  26 +
>  include/linux/soc/mediatek/infracfg.h         |  39 +
>  9 files changed, 1433 insertions(+), 14 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
>  create mode 100644 drivers/soc/mediatek/mtk-pm-domains.c
>  create mode 100644 include/dt-bindings/power/mt8183-power.h
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
