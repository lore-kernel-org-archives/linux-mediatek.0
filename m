Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2DF1C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jun 2022 02:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=52G/aB5oIkcj7BYvZSrpZN7nn4fcy5LZJpOTEXQStuI=; b=QzBrkklHfUuXWJ
	Z8VcHyYeAPia9pZpqTftMBwrdYid0uQ69JDYwiBLdPJxUl+niI7j6irlueWpWKeZ+esCIdEJRnOUf
	lhhqeUcxyJJRQwgEnZSzNOqw5UipzCoGK7ATmr3T0IreJ05Svsx2XX7ugSzHFQDPYIq7Q7u75jdAl
	afBP7tLUdkuZ6Oor7nRg2RwapJMT+e48ZJhcfOe/EBHW1CM0AX0zRUAfFgnZiuz/wPvoX1eA78MtU
	XV+FWx3Kv2ldqf3whwbAbee01zd0XKSdh5yeo0LwBBuLc/K0mrmEBt60ao/dGbd6bL0stktN7QJZ1
	oNWCDR5IhWiJo7dNnNsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0wTU-006m9S-LL; Tue, 14 Jun 2022 02:40:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0wTR-006m8W-Jl; Tue, 14 Jun 2022 02:40:11 +0000
X-UUID: 3614fe93d33d4f92aabc8f910f4cbfdb-20220613
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=15XA/ewnRXi3CTe0LITMKCEUWtVCirZXbQ/aZEu8kWg=;
	b=dKVocuFcT6NkoFb6xFwOX5WFSPvD9curIaN47nnMimINaMBQQM3uBRGPrlqhKDDpY7RYcJ2GZxPajOdrZQlcyfj8XnlIIU3NfQ9RpPlKtoEY5RCZoPbg1W3a53r5zOlus/CFexuwinwaaspJ8yoDJnUF9KBNYIsFnPViYtMYqYE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:b42cae36-4cb9-4771-94b9-4d0e0d178471,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:b14ad71,CLOUDID:337053c5-c67b-4a73-9b18-726dd8f2eb58,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 3614fe93d33d4f92aabc8f910f4cbfdb-20220613
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <jianjun.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1118894753; Mon, 13 Jun 2022 19:40:02 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 13 Jun 2022 19:39:02 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 14 Jun 2022 10:39:00 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Tue, 14 Jun 2022 10:38:59 +0800
Message-ID: <bcc98dbbf737e4d98c25c839a390a0d9782cde3e.camel@mediatek.com>
Subject: Re: [PATCH v9 0/2] phy: mediatek: Add PCIe PHY driver
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I
	<kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>,
	"AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, Wei-Shun Chang <weishunc@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <rex-bc.chen@mediatek.com>,
	<randy.wu@mediatek.com>, <jieyy.yang@mediatek.com>,
	<chuanjia.liu@mediatek.com>, <qizhong.cheng@mediatek.com>,
	<jian.yang@mediatek.com>
Date: Tue, 14 Jun 2022 10:38:59 +0800
In-Reply-To: <Ypb6AS6oj2en/Roi@matsya>
References: <20220520064920.27313-1-jianjun.wang@mediatek.com>
	 <96f7cc90171bb6e088ce0ed88e10ad14f06a98bb.camel@mediatek.com>
	 <Ypb6AS6oj2en/Roi@matsya>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_194009_701594_8E0BFFD8 
X-CRM114-Status: GOOD (  23.77  )
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

Hi Vinod,

Sorry to disturb you, would you mind taking a look at this patch?

Thanks.

On Wed, 2022-06-01 at 11:02 +0530, Vinod Koul wrote:
> On 01-06-22, 10:21, Jianjun Wang wrote:
> > Hello Maintainers,
> > 
> > Gentle ping for this patch series, if there is anything I can do to
> > get
> > these patches merged, please let me know.
> 
> Patience my friend patience. This was received very late in cycle and
> I
> will review after merge window closes..
> 
> 
> > 
> > Thanks.
> > 
> > On Fri, 2022-05-20 at 14:49 +0800, Jianjun Wang wrote:
> > > These series patches add support for PCIe PHY driver on MediaTek
> > > chipsets.
> > > 
> > > Changes in v9:
> > > 1. Check if the return value is -ENOMEM when reading efuse data
> > > fails.
> > > 
> > > Changes in v8:
> > > 1. Use "device_property_present()" to increase human readability;
> > > 2. Use "GPL" as recommended in commit bf7fbeeae6db ("module: Cure
> > >    the MODULE_LICENSE "GPL" vs. "GPL v2" bogosity").
> > > 
> > > Changes in v7:
> > > 1. Add bitfield.h header to fix the build error on non-arm64
> > > platforms.
> > > 
> > > Changes in v6:
> > > 1. Remove unnecessary header files;
> > > 2. Use FILELD_PREP in bitfield.h to set value.
> > > 
> > > Changes in v5:
> > > 1. Fix typo in kerneldoc: "eFues" => "eFuse".
> > > 
> > > Changes in v4:
> > > 1. Fix no return when calling dev_err_probe.
> > > 
> > > Changes in v3:
> > > 1. Add introductions for structure members;
> > > 2. Add SoC dependent data;
> > > 3. Dynamically allocate efuse data;
> > > 4. Check return value if it's an -EPROBE_DEFER.
> > > 
> > > Changes in v2:
> > > 1. Add specific compatible name;
> > > 2. Read NVMEM data at probe time;
> > > 3. Fix typos.
> > > 
> > > Jianjun Wang (2):
> > >   dt-bindings: phy: mediatek: Add YAML schema for PCIe PHY
> > >   phy: mediatek: Add PCIe PHY driver
> > > 
> > >  .../bindings/phy/mediatek,pcie-phy.yaml       |  75 +++++
> > >  drivers/phy/mediatek/Kconfig                  |  11 +
> > >  drivers/phy/mediatek/Makefile                 |   1 +
> > >  drivers/phy/mediatek/phy-mtk-pcie.c           | 267
> > > ++++++++++++++++++
> > >  4 files changed, 354 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/phy/mediatek,pcie-phy.yaml
> > >  create mode 100644 drivers/phy/mediatek/phy-mtk-pcie.c
> > > 
> 
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
