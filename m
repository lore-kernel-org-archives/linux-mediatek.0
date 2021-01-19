Return-Path: <SRS0=YRwc=GW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A40E7C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Jan 2021 02:55:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A376206C0
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Jan 2021 02:55:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A376206C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IEb7VDwMmi84vdR28sEUTS4N8fmsonhDNQQxVrI3xIg=; b=nmuZqZ8bArOTSa8a7u5MuGz2o
	9hioflXKj4ctGZVRlkyrni+yPE7YGVuPLL/AFGwHXg8KMc+vBPjQGUlBlWuv4ZaY8CUNsng11Lr9F
	vOAkhKFuCdUJ+Sy3lIz1Ype+31vFEEWvWiPXeWVTAav0ikoijVH3KokJxgNHtJkEdOFG5AJei4DIO
	+r9Br3EhCQ/giR3DDEXsu50tNsT0mjXuq0oWSk6J3VVCo1WC8JJn6frtUTLBKSk38Bqf3VQaDbVRg
	JnnFlSvNRzRII9t4uc4g7I4FAj2uNmQfoKWlPC6TMYBPmY/FLXuPJILqDEbsD13zjmXfzs8JVebIJ
	NqHZT8kYA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1hB7-0005eR-4i; Tue, 19 Jan 2021 02:55:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1hB4-0005dz-SM; Tue, 19 Jan 2021 02:55:32 +0000
X-UUID: b17a88bbcf0741689be7add4a37adefa-20210118
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=CiMAZ2leCHm8XOrAzh8HVdtQ7ukYUItVC28TwVzwG88=; 
 b=dhAsHzcHl8mZ5U0l4WOdks9aZOQTaIZtMNwFXbTFaIg/ZAcDxxs5U/gm+eouvSlJz1PHonRcgDVhlUg54MORcebc9cJC97MwZr5/0zR7A2XizsBrhDNzQ/cujbai5EcEyWQoNSJYEFj6pcBOUukWK401fFy2rbM+0lyhKXyoVEE=;
X-UUID: b17a88bbcf0741689be7add4a37adefa-20210118
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 363248484; Mon, 18 Jan 2021 18:55:27 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 18 Jan 2021 18:55:25 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 19 Jan 2021 10:55:23 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 19 Jan 2021 10:55:22 +0800
Message-ID: <1611024922.11995.18.camel@mhfsdcap03>
Subject: Re: [PATCH next 12/15] arm64: dts: mediatek: mt8183: fix dtbs_check
 warning
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Date: Tue, 19 Jan 2021 10:55:22 +0800
In-Reply-To: <8973d175-441d-0b03-6763-6eeed8595b17@gmail.com>
References: <20210116090656.11752-1-chunfeng.yun@mediatek.com>
 <20210116090656.11752-12-chunfeng.yun@mediatek.com>
 <8973d175-441d-0b03-6763-6eeed8595b17@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 95197C9BA3827A74B5B4DCC86214B786907A7F334A130892260E4361115999232000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210118_215531_275677_70C6D9C5 
X-CRM114-Status: GOOD (  15.26  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Min Guo <min.guo@mediatek.com>,
 devicetree@vger.kernel.org, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, 2021-01-16 at 12:43 +0300, Sergei Shtylyov wrote:
> On 16.01.2021 12:06, Chunfeng Yun wrote:
> 
> > Harmonize node names, compatibles and properties.
> > 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8183.dtsi | 9 ++++-----
> >   1 file changed, 4 insertions(+), 5 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > index 5b782a4769e7..a69a033a68ac 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> [...]
> > @@ -908,11 +908,11 @@
> >   			status = "disabled";
> >   		};
> >   
> > -		mipi_tx0: mipi-dphy@11e50000 {
> > +		mipi_tx0: dsi-phy@11e50000 {
> 
>     Again, why not just "phy@..."?
This following the style as usb-phy, pcie-phy etc.
but is not yet a standard prefix for Display serial interface PHY

> 
> [...]
> > @@ -931,11 +931,10 @@
> >   			};
> >   		};
> >   
> > -		u3phy: usb-phy@11f40000 {
> > +		u3phy: t-phy@11f40000 {
> 
>     Here as well...
Already explain it in [11/15]
> 
> [...]
> 
> MBR, Sergei

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
