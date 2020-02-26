Return-Path: <SRS0=ht0X=4O=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B3C0C4BA06
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2020 01:58:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19F8321927
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2020 01:58:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W5PjCsRj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Lc1aYqVx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19F8321927
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ByucCkDG7wOrvDoN7akMLZhWezMY9mmXEBIBteyIwRs=; b=W5PjCsRjbF6NfR
	Uc4GaJpEZCx4BYlf0YRiYdnaKPsTtk839tPljVYyVVE/OW2IFFua+oTZi44hivZz0AY6AIq/Jk5Mf
	3XMEk0ecDL5MS5sWbiZJxdLEhLMNL9G43bhrj4NL9aDRo8CtQad4fo9WxAtjuWbOEhETCQnM1/G79
	7JX1uC3iVs3XykQrox9Xqc0DuOEx9x3ncrZ2jna5iZ6mPizOZMv+Pq8dPrG1Dfl3lwnxYl5veP27j
	dqRSOmY3/HOjbYA3DYqtuTl6cljaNXCuMkx1vpObAWU0EjW9F0r4AJ8iCLF9+VCpFJIKnq+xya52m
	sy+eM0uuPuQG8EnvPPpA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6lxz-0007N4-4V; Wed, 26 Feb 2020 01:58:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6lxq-0007FJ-HM; Wed, 26 Feb 2020 01:58:19 +0000
X-UUID: 33b96651ba4d4d58b8a2b412bd4a2475-20200225
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=vf8T9NPJWFBx7DbraFo8ckmrgUSJi9hCexuNn4KVT70=; 
 b=Lc1aYqVxmjkvE/NuTc23T/B/hNlstQP00nsGSTODeMJj7NxIUrEad1qZ+NMG1tASggiTYGtQY4sEf5nFbOqhbShrF6Wpdy4b/YDu/mAVITfsjv3Jm8/P5rgV1MctUV6QMb/8Kj1G2TvFQb3RBzaYn8199qElzYw57qYTLiwuZew=;
X-UUID: 33b96651ba4d4d58b8a2b412bd4a2475-20200225
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <michael.kao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2022579074; Tue, 25 Feb 2020 17:58:13 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 25 Feb 2020 17:58:49 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 26 Feb 2020 09:57:21 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 26 Feb 2020 09:58:19 +0800
Message-ID: <1582682289.27539.5.camel@mtksdccf07>
Subject: Re: [PATCH v3,1/8] arm64: dts: mt8183: add thermal zone node
From: Michael Kao <michael.kao@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Wed, 26 Feb 2020 09:58:09 +0800
In-Reply-To: <4fab7d40-d7d9-883e-1c50-0507ee1dd750@gmail.com>
References: <20200103064407.19861-1-michael.kao@mediatek.com>
 <20200103064407.19861-2-michael.kao@mediatek.com>
 <00c8be46-3ba1-571a-0230-7c722ce1901e@linaro.org>
 <1581391046.31005.12.camel@mtksdccf07>
 <270efbcf-51bb-629f-c64b-fa343b3d2988@linaro.org>
 <4fab7d40-d7d9-883e-1c50-0507ee1dd750@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200225_175818_584244_8E340C22 
X-CRM114-Status: GOOD (  19.06  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 srv_heupstream@mediatek.com, linux-pm@vger.kernel.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org,
 Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 Zhang Rui <rui.zhang@intel.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-02-20 at 21:57 +0100, Matthias Brugger wrote:
> 
> On 20/02/2020 12:52, Daniel Lezcano wrote:
> > On 11/02/2020 04:17, Michael Kao wrote:
> >> On Thu, 2020-01-09 at 12:31 +0100, Daniel Lezcano wrote:
> >>> On 03/01/2020 07:44, Michael Kao wrote:
> >>>> From: "michael.kao" <michael.kao@mediatek.com>
> >>>>
> >>>> Add thermal zone node to Mediatek MT8183 dts file.
> >>>>
> >>>> Signed-off-by: Michael Kao <michael.kao@mediatek.com>
> >>>> ---
> >>>>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 85 ++++++++++++++++++++++++
> >>>>  1 file changed, 85 insertions(+)
> >>>>
> >>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> >>>> index 10b32471bc7b..a2793cf3d994 100644
> >>>> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> >>>> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> >>>> @@ -570,6 +570,88 @@
> >>>>  			status = "disabled";
> >>>>  		};
> >>>>  
> >>>> +		thermal: thermal@1100b000 {
> >>>> +			#thermal-sensor-cells = <1>;
> >>>> +			compatible = "mediatek,mt8183-thermal";
> >>>> +			reg = <0 0x1100b000 0 0x1000>;
> >>>> +			interrupts = <0 76 IRQ_TYPE_LEVEL_LOW>;
> >>>
> >>> What is this interrupt for?
> >>
> >> The interrupts pin is designed in our SoC. But it is not used in our
> >> upstream thermal code now. There is also add the settings but not use
> >> for mt8173.dtsi. To align the thermal dtsi format, I follow the past
> >> experience to add the interrupt settings of this project first.
> > 
> > Assuming the interrupt can be set by the driver to fire when a specified
> > temperature is set, I suggest to change your driver to handle it so you
> > can get rid of the polling waking up the SoC every second.
> > 
> 
> For the record the interrupt is a required property by the binding description.
> 
> Regards,
> Matthias

After checking with interrupt owner, it is not required property for
thermal.
I will remove the property of hw-reset-temp and interrupt.
And also I will add new line to fix format.
These three change will resend v4 to fix them.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
