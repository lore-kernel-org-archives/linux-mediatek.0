Return-Path: <SRS0=YRwc=GW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 608B2C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Jan 2021 02:56:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5E73206C0
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Jan 2021 02:56:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5E73206C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=x4jdJoY+OZrt639MR7EYEKqChHieQimdZteKLbt4qYE=; b=O4LCH++qB81ndtpjA1ziiL6av
	Y7vX8xq94eaOtxXEd7jSXz6LsnznRuGBnVx82sAzRvK0Xgtd9p9jvq+E+vLYZgzXI56TOFjC9TGBY
	Z0EsEzo/gT6dvhP7xfjA7UbJvj0GMtjgStDhVT4Rz0q3BrhmPyGoSjqk3JxMGR0BMDx1oFURdz2vQ
	oO/u9VnSGsb7pWQJYzcoP1SSHDN1uKXiwTV7cr4rXjEQgw8oReucW8wa7rPZ2SkVwLMlvyIrBhwuJ
	uqQGMxS6h66UEjfLtDhPoBh8+83HeDvyb7JiRoWT6A0eu75SM50s3IuSbM45/boE+HXBqY/d9DZdz
	8sLAJiuDA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1hBP-0005gk-4N; Tue, 19 Jan 2021 02:55:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1hBM-0005gH-KL; Tue, 19 Jan 2021 02:55:49 +0000
X-UUID: 66222011013b4699aeaa4c129e6d5afb-20210118
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=nkY5HVAfuNiTv1kPd0LeWdjKcUU6stCZlV+8WtTpNvA=; 
 b=IOKKTkXTYlMa0nVC6c8c0e/sMd5jgbNqBUOrixqqpg8ndr8yjLz22eqKUeJgMac2qEdpbC/rhEObwzmd3dD3uP1WrRY21cZKzcaXuH+6UhIEagHQO3kxCiC1VIGDwjegEKexyqxW56WaKOtykHQGd03oOvwiEBgmI/aJnQ22A7Q=;
X-UUID: 66222011013b4699aeaa4c129e6d5afb-20210118
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1040432008; Mon, 18 Jan 2021 18:55:47 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 18 Jan 2021 18:45:45 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 19 Jan 2021 10:45:43 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 19 Jan 2021 10:45:42 +0800
Message-ID: <1611024342.11995.14.camel@mhfsdcap03>
Subject: Re: [PATCH next 11/15] arm64: dts: mediatek: mt7622: harmonize node
 names and compatibles
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Date: Tue, 19 Jan 2021 10:45:42 +0800
In-Reply-To: <8f859d54-f9f8-d7c9-db66-89860124b539@gmail.com>
References: <20210116090656.11752-1-chunfeng.yun@mediatek.com>
 <20210116090656.11752-11-chunfeng.yun@mediatek.com>
 <8f859d54-f9f8-d7c9-db66-89860124b539@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 413E3955A7FABB03405605F12E3C87305ECF06DF62AEE3A661B158243F74BBA22000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210118_215548_808213_B69FF85A 
X-CRM114-Status: GOOD (  17.18  )
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

On Sat, 2021-01-16 at 12:36 +0300, Sergei Shtylyov wrote:
> Hello!
> 
> On 16.01.2021 12:06, Chunfeng Yun wrote:
> 
> > This is used to fix dtbs_check warning
> > 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> >   arch/arm64/boot/dts/mediatek/mt7622.dtsi | 9 +++++----
> >   1 file changed, 5 insertions(+), 4 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> > index 5b9ec032ce8d..4cfa09b0ca3c 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> > @@ -740,8 +740,8 @@
> >   		status = "disabled";
> >   	};
> >   
> > -	u3phy: usb-phy@1a0c4000 {
> > -		compatible = "mediatek,mt7622-u3phy",
> > +	u3phy: t-phy@1a0c4000 {
> 
>     What is "t-phy"? Perhaps you should have used just "phy" here...
At first I use "phy", but it causes dt_binding_check fail:
"'#phy-cells' is a required property"

Due to we only need add '#phy-cells' for each subnode (usb-phy, pcie-phy
or sata-phy), but not for parent one, I change the parent node name as
"t-phy" which is a glue layer node, not a real phy.
I also prefer to "phy", but seems dt_binding_check can't distinguish
this case.

Thanks

> 
> > +		compatible = "mediatek,mt7622-tphy",
> >   			     "mediatek,generic-tphy-v1";
> >   		reg = <0 0x1a0c4000 0 0x700>;
> >   		#address-cells = <2>;
> > @@ -875,8 +875,9 @@
> >   		status = "disabled";
> >   	};
> >   
> > -	sata_phy: sata-phy@1a243000 {
> > -		compatible = "mediatek,generic-tphy-v1";
> > +	sata_phy: t-phy@1a243000 {
> 
>     Same here...
> 
> > +		compatible = "mediatek,mt7622-tphy",
> > +			     "mediatek,generic-tphy-v1";
> >   		#address-cells = <2>;
> >   		#size-cells = <2>;
> >   		ranges;
> 
> MBR, Sergei

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
