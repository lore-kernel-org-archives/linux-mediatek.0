Return-Path: <SRS0=k4UB=JD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CFF7C433ED
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 08:54:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B61361284
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 08:54:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B61361284
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=u9jAch9aMH1ACbQGe8QckmycILe7bn5R6/BoVxXMpIo=; b=OmGFUcQIOEpncCerC4hsRz37X
	V4UTQID3NspSo+Rc2HZ+zapSiPRayJyOBcjCRu1JYEJWEZG1i2U32osugRlJ7uEsvBkIGTN89iHzG
	JHvech8p/F4WeY5ww+Cuc0HJyPVMk0x10zo+zOgSHixeblFvB58Dg6TJg5BSXqY8EYNdDFKsloTvy
	DyK8U1srh1hi2yNe/RtnG5fD6HKLlRgxk9Kx6hwOFeZWJKD3prpa7mNXVwVjXN6UUPnwjL5wK7xda
	WJpmRyndoqSadCE48tSxvoahhkt5LxZp4Utshq6CztbOirYiFwsuauB8md/DUFJqVI0L0q0BP6lJL
	rgafb8+VA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lThTg-001ubS-OM; Tue, 06 Apr 2021 08:54:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lThTT-001uZT-K3; Tue, 06 Apr 2021 08:54:18 +0000
X-UUID: 35c8ba4844894d0e92c054eeaf6b2263-20210406
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=jskoNae0qUUv9JNUt4/vWKhrhKvU8yBtWmyh/Q5AcmM=; 
 b=G8rFL6yhGxb8jkhu3+o8gHKE6mQjcPX5MXgR5gDWr5dgEPEJX5cCNb3eJYOrwSmS9uBohDsfDX6Bfi33cZ7wxj5PusOpLET3kDYjB2kFLr4rYSF/fIQsl7Ah8Wgnf15j0gQt7gXyXPDL/CNgc2GqD2079Cub0VXk+05sI1j21sY=;
X-UUID: 35c8ba4844894d0e92c054eeaf6b2263-20210406
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1495162955; Tue, 06 Apr 2021 01:54:12 -0700
Received: from MTKMBS33N1.mediatek.inc (172.27.4.75) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 6 Apr 2021 01:44:10 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 6 Apr 2021 16:43:56 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 6 Apr 2021 16:43:56 +0800
Message-ID: <1617698636.26944.8.camel@mhfsdcap03>
Subject: Re: [PATCH 3/5] arm64: dts: mediatek: mt8167: add larb nodes
From: Yong Wu <yong.wu@mediatek.com>
To: Fabien Parent <fparent@baylibre.com>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <mkorpershoek@baylibre.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Tue, 6 Apr 2021 16:43:56 +0800
In-Reply-To: <20210405200821.2203458-3-fparent@baylibre.com>
References: <20210405200821.2203458-1-fparent@baylibre.com>
 <20210405200821.2203458-3-fparent@baylibre.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 7691E83C22369EB7F43B506DD7397EE3A87FE371554C2C63EF10D93131A4815E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_095416_221947_A02DE6B8 
X-CRM114-Status: GOOD (  14.57  )
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

On Mon, 2021-04-05 at 22:08 +0200, Fabien Parent wrote:
> Add larb nodes for MT8167:
> * larb0 is used for display (dsi and hdmi)
> * larb1 is used for camera (csi)
> * larb2 is used for the video hardware decoder
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8167.dtsi | 33 ++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8167.dtsi b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
> index 4b951f81db9e..9b352031c5f6 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8167.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
> @@ -140,5 +140,38 @@ smi_common: smi@14017000 {
>  			clock-names = "apb", "smi";
>  			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
>  		};
> +
> +		larb0: larb@14016000 {
> +			compatible = "mediatek,mt8167-smi-larb";
> +			reg = <0 0x14016000 0 0x1000>;
> +			mediatek,smi = <&smi_common>;
> +			mediatek,larbid = <0>;

From [1], This should be: mediatek,larb-id.

Actually this property is unnecessary in this SoC since this larb-id in
the m4u node is consecutive.

[1]
https://elixir.bootlin.com/linux/v5.12-rc2/source/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml#L58

> +			clocks = <&mmsys CLK_MM_SMI_LARB0>,
> +				 <&mmsys CLK_MM_SMI_LARB0>;
> +			clock-names = "apb", "smi";
> +			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
> +		};
> +
> +		larb1: larb@15001000 {
> +			compatible = "mediatek,mt8167-smi-larb";
> +			reg = <0 0x15001000 0 0x1000>;
> +			mediatek,smi = <&smi_common>;
> +			mediatek,larbid = <1>;
> +			clocks = <&imgsys CLK_IMG_LARB1_SMI>,
> +				 <&imgsys CLK_IMG_LARB1_SMI>;
> +			clock-names = "apb", "smi";
> +			power-domains = <&spm MT8167_POWER_DOMAIN_ISP>;
> +		};
> +
> +		larb2: larb@16010000 {
> +			compatible = "mediatek,mt8167-smi-larb";
> +			reg = <0 0x16010000 0 0x1000>;
> +			mediatek,smi = <&smi_common>;
> +			mediatek,larbid = <2>;
> +			clocks = <&vdecsys CLK_VDEC_CKEN>,
> +				 <&vdecsys CLK_VDEC_LARB1_CKEN>;
> +			clock-names = "apb", "smi";
> +			power-domains = <&spm MT8167_POWER_DOMAIN_VDEC>;
> +		};
>  	};
>  };

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
