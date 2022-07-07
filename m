Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9723CC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jul 2022 10:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d/HBPx1CbTs6kyTT+icjI/8L1wM9zWEeGfg9iuHuqEg=; b=YyztdkMapZ2rIC6vMWFR3v5zKk
	pAVsNdl163Dz2uo8jYB77sXmAJyMDBbAuKiVYDv/QulvAARXXirqauGOqvDbPjhub80jzLTmT+2it
	Z+9x6TFRBWx+fQjI7YYYIW2K4r4kYNQ7vhap3nomwTdLMNG5lu7uKedtalyx2/k6A3cCWvZbk4D37
	nj1q3dGTE5QUC2hPScyhwtLDPn0Fyd1A+0CMwvzAVkJSsHqBxdMnfVbvpoO9qeA/QhnoRddBgIkYF
	a00td0Ejk/11d+4rDmozffV37R9lzJ/IaAPXIZvLPr5UeGRnP90PgQA2FEUVi0sXw9t4vxJvH7ORX
	drMFFHrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9OYc-00FY5p-54; Thu, 07 Jul 2022 10:16:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9OYY-00FY3b-Pn; Thu, 07 Jul 2022 10:16:24 +0000
X-UUID: 1bf1abf9d7ef44c7ae79d8602df4ee2d-20220707
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:e2f4efe6-3bbb-40e6-a093-1a745e0972ab,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:0b4eac63-0b3f-4b2c-b3a6-ed5c044366a0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 1bf1abf9d7ef44c7ae79d8602df4ee2d-20220707
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 322311525; Thu, 07 Jul 2022 03:16:16 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Thu, 7 Jul 2022 18:15:38 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 7 Jul 2022 18:15:38 +0800
Message-ID: <75855b7c8784909086db4e773c13a8e2eb591292.camel@mediatek.com>
Subject: Re: [PATCH v11 0/3] Add basic node support for MediaTek MT8186 SoC
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	"Chen-Yu Tsai" <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
	<hsinyi@chromium.org>
Date: Thu, 7 Jul 2022 18:15:38 +0800
In-Reply-To: <0f758c3d-a1cd-5e28-d3bb-70833b53c14b@gmail.com>
References: <20220520122217.30716-1-allen-kh.cheng@mediatek.com>
	 <37fb545a-bc45-65b0-b67b-5ef1b0346777@gmail.com>
	 <0f758c3d-a1cd-5e28-d3bb-70833b53c14b@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_031622_878908_41C18BCE 
X-CRM114-Status: GOOD (  28.20  )
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

Hi Matthias,

On Thu, 2022-07-07 at 11:40 +0200, Matthias Brugger wrote:
> 
> On 22/06/2022 17:40, Matthias Brugger wrote:
> > 
> > 
> > On 20/05/2022 14:22, Allen-KH Cheng wrote:
> > > MT8186 is a SoC based on 64bit ARMv8 architecture.
> > > It contains 6 CA55 and 2 CA76 cores.
> > > MT8186 share many HW IP with MT65xx series.
> > > 
> > > This patchset was tested on MT8186 evaluation board to shell.
> > > 
> > 
> > Applied, thanks!
> > 
> 
> Based on the review from Angelo I dropped patch 3 from the tree.
> Please address 
> the issues and submit again.
> 
> Regards,
> Matthias
> 

Sure, thanks for the comments from Angelo.

I will update in next version.

BTW, could you please take a look into this series ?


https://lore.kernel.org/all/20220622130824.29143-1-nancy.lin@mediatek.com/

This series is blocked for long time and it's in verion 24.

I would appreciate your help.

Best regards,
Allen

> > > Based on next-20220519, linux-next/master
> > > 
> > > changes since v9:
> > >   - remove some merged PATCHs from series
> > >   - reorder nodes in dts (cpu-map)
> > >   - remove okay status in auxadc
> > >   - remove unnecessary suffix node name for i2c
> > >   - add pwm node
> > >   - add dsi-phy node
> > >   - add dpi node
> > > 
> > > changes since v9:
> > >   - add one space before equal sign of drive-strength-adv
> > >   - corect compatible name for big cores (ca76)
> > >   - use upper case of address in pinctrl
> > >   - add pwrap node
> > >   - add pwm node
> > > 
> > > changes since v8:
> > >   - change name from pins_bus to pins-sda-scl
> > >   - correct email address
> > >   - add capacity-dmips-mhz for each CPU
> > >   - add ppi-partitions in gic node
> > >   - change name to power-domain
> > >   - remove status "okay" in scp node
> > >   - update timer and pericfg compatible in series
> > > 
> > > changes since v7:
> > >   - add scp&auxadc node
> > > 
> > > changes since v6:
> > >   - remove unnecessary blank line
> > > 
> > > changes since v5:
> > >   - replace Mediatek a to MediaTek
> > >   - use GPL-2.0-only OR BSD-2-Clause
> > > 
> > > changes since v4:
> > >   - correct driver clock of mt8186
> > >   - add power domains controller and clock controllers
> > >   - add pinctrl, usb host, spi and i2c nodes
> > >   - add node status in mt8186-evb.dts
> > >   - correct some dtbs_check warnings
> > > 
> > > changes since v3:
> > >   - remove serial, mmc and phy patch from series. (already
> > > merged)
> > >   - remove mcusysoff node
> > >   - move oscillator nodes at the head of dts
> > >   - change name from usb-phy to t-phy
> > > 
> > > changes since v2:
> > >   - add soc {} in mt8186.dtsi
> > > 
> > > changes since v1:
> > >   - add dt-bindings: arm: Add compatible for MediaTek MT8186
> > > 
> > > Allen-KH Cheng (3):
> > >    dt-bindings: arm: mediatek: Add mt8186 pericfg compatible
> > >    dt-bindings: arm: Add compatible for MediaTek MT8186
> > >    arm64: dts: Add MediaTek SoC MT8186 dts and evaluation board
> > > and
> > >      Makefile
> > > 
> > >   .../devicetree/bindings/arm/mediatek.yaml     |    4 +
> > >   .../arm/mediatek/mediatek,pericfg.yaml        |    1 +
> > >   arch/arm64/boot/dts/mediatek/Makefile         |    1 +
> > >   arch/arm64/boot/dts/mediatek/mt8186-evb.dts   |  232 ++++
> > >   arch/arm64/boot/dts/mediatek/mt8186.dtsi      | 1016
> > > +++++++++++++++++
> > >   5 files changed, 1254 insertions(+)
> > >   create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-evb.dts
> > >   create mode 100644 arch/arm64/boot/dts/mediatek/mt8186.dtsi
> > > 


