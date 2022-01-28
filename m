Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5747C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jan 2022 11:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dKmt7UlZpDXjhKt2oqUB1bxWwIkTNiaMYaJQRtWPPmA=; b=KnbiNmYEJMomyB
	7JPXFgl4kEgNnRB/0zF13YfWOvQPKXJVa6JmwxWLa3+An0lKnNz3xWNboqKmgDxOWdgTTSCknYvRa
	KI78E9S2AKRcsqBbnM9xHZqGD0W7fQt7X+Zn5y5ptrW10z1eSB5rIqJGwgIXFsIEnaFGxriwY0AZA
	Dqi+RzmUh7QbpIheHygQ23pJ5LDOMs8KiG00RUaJ2EUCCospTsDFQgJDs9ZPUaXn/LOVkjq57mnKo
	z6Jool/llYavv76kkQHQAafG4K0eJqiqZx1AKXF9ZcEMo/iQag8pIor10ROjiPU14q4CHO56EhMsr
	vWdUmj00CDfRS85V6/hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDP4l-001bcy-7S; Fri, 28 Jan 2022 11:05:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDP4i-001bbk-DN; Fri, 28 Jan 2022 11:05:53 +0000
X-UUID: b1e7c9e9a2e14b139e7ae1348aa7ccfe-20220128
X-UUID: b1e7c9e9a2e14b139e7ae1348aa7ccfe-20220128
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 782557608; Fri, 28 Jan 2022 04:05:49 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 28 Jan 2022 03:05:48 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 28 Jan 2022 19:05:46 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 28 Jan 2022 19:05:46 +0800
Message-ID: <88655c2bd0e2db25861803550f0a6b393177ec67.camel@mediatek.com>
Subject: Re: [PATCH v3 0/7] Add basic node support for Mediatek MT8186 SoC
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
CC: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Kishon Vijay Abraham I
 <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Wim Van Sebroeck
 <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>,
 <hsinyi@chromium.org>, <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-iio@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
 <linux-serial@vger.kernel.org>, <linux-spi@vger.kernel.org>,
 <linux-watchdog@vger.kernel.org>
Date: Fri, 28 Jan 2022 19:05:46 +0800
In-Reply-To: <20220128103209.00002704@Huawei.com>
References: <20220128062050.23978-1-allen-kh.cheng@mediatek.com>
 <20220128103209.00002704@Huawei.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_030552_501123_D8163157 
X-CRM114-Status: GOOD (  22.08  )
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

On Fri, 2022-01-28 at 10:32 +0000, Jonathan Cameron wrote:
> On Fri, 28 Jan 2022 14:20:43 +0800
> allen-kh.cheng <allen-kh.cheng@mediatek.com> wrote:
> 
> > From: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> > 
> > MT8186 is a SoC based on 64bit ARMv8 architecture.
> > It contains 6 CA55 and 2 CA78 cores.
> > MT8186 share many HW IP with MT65xx series.
> > 
> > This patchset was tested on MT8186 evaluation board to shell.
> 
> Please prune your cc list for any future versions.
> We all get enough emails as it is :)
> 
> I'm not seeing anything relevant to linux-iio in here for example.
> 
> Thanks,
> 
> Jonathan
> 

Hi Jonathan,

Sorry for any inconvenience caused to you.

I will remove linux-iio in next version.

Thanks.

> > 
> > Based on linux-next
> > 
> > changes since v2:$
> >  - add soc {} in mt8186.dtsi
> > 
> > changes since v1:
> >  - add dt-bindings: arm: Add compatible for Mediatek MT8186
> > 
> > 
> > Allen-KH Cheng (7):
> >   dt-bindings: timer: Add compatible for Mediatek MT8186
> >   dt-bindings: serial: Add compatible for Mediatek MT8186
> >   dt-bindings: watchdog: Add compatible for Mediatek MT8186
> >   dt-bindings: mmc: Add compatible for Mediatek MT8186
> >   dt-bindings: phy: Add compatible for Mediatek MT8186
> >   dt-bindings: arm: Add compatible for Mediatek MT8186
> >   arm64: dts: Add Mediatek SoC MT8186 dts and evaluation board and
> >     Makefile
> > 
> >  .../devicetree/bindings/arm/mediatek.yaml     |   4 +
> >  .../devicetree/bindings/mmc/mtk-sd.yaml       |   3 +
> >  .../bindings/phy/mediatek,tphy.yaml           |   1 +
> >  .../devicetree/bindings/serial/mtk-uart.txt   |   1 +
> >  .../bindings/timer/mediatek,mtk-timer.txt     |   1 +
> >  .../devicetree/bindings/watchdog/mtk-wdt.txt  |   1 +
> >  arch/arm64/boot/dts/mediatek/Makefile         |   1 +
> >  arch/arm64/boot/dts/mediatek/mt8186-evb.dts   |  24 ++
> >  arch/arm64/boot/dts/mediatek/mt8186.dtsi      | 360
> > ++++++++++++++++++
> >  9 files changed, 396 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-evb.dts
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8186.dtsi
> > 
> 
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
