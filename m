Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E991EC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jan 2022 10:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PSiPSCG1pY4MZ2YGwG9m/IJqhHZfnGYXnE7lpnp9NSM=; b=U9pMxEiaYRC94w
	wNHV/3U30apOGv+nUujQDY1dhfVvewJWMOz7SGY165nNtpjs1SPN8Ih2lKAKTXRw3jqmwehH+ILbl
	KDmK8QgWt4VeiN1MFRixibTDhZbAuAVopJp/vygAdaFqiJPdfyG8qolr0kVqtcxtZojMDzv3cgZ8/
	iUgzGxJBauBTx8pbEsWtUVe5nsz+I8l60Frfs2K9WRmFpuy3imL6ugZdim5AdPw3j1eGuq6Deq4VH
	D6xzoMpjDmGp8/V5BTbk7RAdVChFTxB0nC1m79yR5JleTZvjdtKihjlFX0vQOR5wtXJKGoGiOT0oO
	vVUF1OJHdG5gFX+anKAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDOYz-001VZh-Bu; Fri, 28 Jan 2022 10:33:05 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDOYL-001VMj-I0; Fri, 28 Jan 2022 10:32:27 +0000
Received: from fraeml709-chm.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4JlYfd3v7Sz67xvP;
 Fri, 28 Jan 2022 18:31:53 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml709-chm.china.huawei.com (10.206.15.37) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 28 Jan 2022 11:32:19 +0100
Received: from localhost (10.47.76.156) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.21; Fri, 28 Jan
 2022 10:32:18 +0000
Date: Fri, 28 Jan 2022 10:32:09 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: allen-kh.cheng <allen-kh.cheng@mediatek.com>
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
Subject: Re: [PATCH v3 0/7] Add basic node support for Mediatek MT8186 SoC
Message-ID: <20220128103209.00002704@Huawei.com>
In-Reply-To: <20220128062050.23978-1-allen-kh.cheng@mediatek.com>
References: <20220128062050.23978-1-allen-kh.cheng@mediatek.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.47.76.156]
X-ClientProxiedBy: lhreml731-chm.china.huawei.com (10.201.108.82) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_023225_961974_97DBC884 
X-CRM114-Status: GOOD (  14.33  )
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

On Fri, 28 Jan 2022 14:20:43 +0800
allen-kh.cheng <allen-kh.cheng@mediatek.com> wrote:

> From: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> 
> MT8186 is a SoC based on 64bit ARMv8 architecture.
> It contains 6 CA55 and 2 CA78 cores.
> MT8186 share many HW IP with MT65xx series.
> 
> This patchset was tested on MT8186 evaluation board to shell.

Please prune your cc list for any future versions.
We all get enough emails as it is :)

I'm not seeing anything relevant to linux-iio in here for example.

Thanks,

Jonathan

> 
> Based on linux-next
> 
> changes since v2:$
>  - add soc {} in mt8186.dtsi
> 
> changes since v1:
>  - add dt-bindings: arm: Add compatible for Mediatek MT8186
> 
> 
> Allen-KH Cheng (7):
>   dt-bindings: timer: Add compatible for Mediatek MT8186
>   dt-bindings: serial: Add compatible for Mediatek MT8186
>   dt-bindings: watchdog: Add compatible for Mediatek MT8186
>   dt-bindings: mmc: Add compatible for Mediatek MT8186
>   dt-bindings: phy: Add compatible for Mediatek MT8186
>   dt-bindings: arm: Add compatible for Mediatek MT8186
>   arm64: dts: Add Mediatek SoC MT8186 dts and evaluation board and
>     Makefile
> 
>  .../devicetree/bindings/arm/mediatek.yaml     |   4 +
>  .../devicetree/bindings/mmc/mtk-sd.yaml       |   3 +
>  .../bindings/phy/mediatek,tphy.yaml           |   1 +
>  .../devicetree/bindings/serial/mtk-uart.txt   |   1 +
>  .../bindings/timer/mediatek,mtk-timer.txt     |   1 +
>  .../devicetree/bindings/watchdog/mtk-wdt.txt  |   1 +
>  arch/arm64/boot/dts/mediatek/Makefile         |   1 +
>  arch/arm64/boot/dts/mediatek/mt8186-evb.dts   |  24 ++
>  arch/arm64/boot/dts/mediatek/mt8186.dtsi      | 360 ++++++++++++++++++
>  9 files changed, 396 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-evb.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8186.dtsi
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
