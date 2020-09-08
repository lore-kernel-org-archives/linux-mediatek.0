Return-Path: <SRS0=x1vn=CR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 575C1C433E2
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2020 13:39:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DDBB120732
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2020 13:39:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qH4h9hS+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="uvFZrsev"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DDBB120732
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sBA3drntv4mLf8ikt+l4RNrfcJYUcStJlHiNHfRjBRY=; b=qH4h9hS+FUzbg/eZ2ntdijP5Q
	Nj7UrBI2G0bP+nLOGyhdrVIQD2mQFtZMuRNiWjq5kvmQ/6xLJSCZwhLVEIf9vho0Im0qJLKFMnOwE
	CcKnBw/t5BRbRVh0VHm/fNrMOy44xsDrPXU7OBr50Lbv6ew1Rp25M3tbyH2WmclE7EFv3PJ32lo7d
	Y3WfSKKOEnBEWF7V2IYL5gVLHB2CnWWaMJEN+MsTj1CCKQ2ATEohnrGGGkN+WWhTQCoyfaRNRnNhg
	qR47ngQWB054TjMT393DdAsB+UXH1syvZj6HZhZXUhojHZDfuXBAJGjSXUQytkJzdrfB+t8TZ+OPR
	LyluS5xRw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFdpy-00040F-Rn; Tue, 08 Sep 2020 13:39:06 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFdpv-0003zT-B8; Tue, 08 Sep 2020 13:39:04 +0000
X-UUID: b2dd8fc6a3704c868b6986efddd2637d-20200908
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=oQzZwJh3y7+kGJk/4w1rH1iequi645UjG2KFNV11C7k=; 
 b=uvFZrsevXgDGmwNjyt6oi0NaK0IJUJ/hmfn2VflP7ZXeZ4eOMGUMM9A5a2yk6fl00pS0o18v75RSOUk17I5B0kfy9Q/4oBcC360CvxIlhClbwFLgZW9c3/OS4DIhWJf9WhvvUXCSsfuKDD/DeUNbfI8WUylMtz/rGnMUDYOiUl0=;
X-UUID: b2dd8fc6a3704c868b6986efddd2637d-20200908
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <crystal.guo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 36490027; Tue, 08 Sep 2020 05:38:54 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Sep 2020 06:28:51 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 8 Sep 2020 21:28:48 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 8 Sep 2020 21:28:48 +0800
Message-ID: <1599571618.14806.7.camel@mhfsdcap03>
Subject: Re: [v4,4/4] arm64: dts: mt8192: add infracfg_rst node
From: Crystal Guo <crystal.guo@mediatek.com>
To: Suman Anna <s-anna@ti.com>
Date: Tue, 8 Sep 2020 21:26:58 +0800
In-Reply-To: <211bd78f-3b70-1e65-eea9-75cc73a3dfdd@ti.com>
References: <20200817030324.5690-1-crystal.guo@mediatek.com>
 <20200817030324.5690-5-crystal.guo@mediatek.com>
 <211bd78f-3b70-1e65-eea9-75cc73a3dfdd@ti.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: E2B71D7CF58B128302A1F43348A6FECCA6782FE097627415268B005A7ADAC0792000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200908_093903_522081_BBBF4D89 
X-CRM114-Status: GOOD (  18.57  )
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Yong
 Liang =?UTF-8?Q?=28=E6=A2=81=E5=8B=87=29?= <Yong.Liang@mediatek.com>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 Seiya Wang =?UTF-8?Q?=28=E7=8E=8B=E8=BF=BA=E5=90=9B=29?=
 <seiya.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Fan Chen =?UTF-8?Q?=28=E9=99=B3=E5=87=A1=29?= <fan.chen@mediatek.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 Yingjoe Chen =?UTF-8?Q?=28=E9=99=B3=E8=8B=B1=E6=B4=B2=29?=
 <Yingjoe.Chen@mediatek.com>,
 Stanley Chu =?UTF-8?Q?=28=E6=9C=B1=E5=8E=9F=E9=99=9E=29?=
 <stanley.chu@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-09-03 at 07:29 +0800, Suman Anna wrote:
> Hi Crystal,
> 
> On 8/16/20 10:03 PM, Crystal Guo wrote:
> > add infracfg_rst node which is for MT8192 platform
> > 
> > Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
> 
> I understand you are posting these together for complete reference, but driver
> subsystem maintainers typically don't pick dts patches. In anycase, can you
> clarify if your registers are self-clearing registers?
> 
> regards
> Suman
> 
Hi Suman,

Thanks for your reply.
Our reset registers are not self-clearing, it needs to set the clear bit
to 1 to clear the related bit.
And should I separate this dts patch from the patch sets?

regards
Crystal
> > ---
> >  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 11 ++++++++++-
> >  1 file changed, 10 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > index 931e1ca17220..a0cb9904706b 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > @@ -10,6 +10,7 @@
> >  #include <dt-bindings/interrupt-controller/irq.h>
> >  #include <dt-bindings/pinctrl/mt8192-pinfunc.h>
> >  #include <dt-bindings/power/mt8192-power.h>
> > +#include <dt-bindings/reset/ti-syscon.h>
> >  
> >  / {
> >  	compatible = "mediatek,mt8192";
> > @@ -219,9 +220,17 @@
> >  		};
> >  
> >  		infracfg: infracfg@10001000 {
> > -			compatible = "mediatek,mt8192-infracfg", "syscon";
> > +			compatible = "mediatek,mt8192-infracfg", "syscon", "simple-mfd";
> >  			reg = <0 0x10001000 0 0x1000>;
> >  			#clock-cells = <1>;
> > +
> > +			infracfg_rst: reset-controller {
> > +				compatible = "mediatek,infra-reset", "ti,syscon-reset";
> > +				#reset-cells = <1>;
> > +				ti,reset-bits = <
> > +					0x140 15 0x144 15 0 0 (ASSERT_SET | DEASSERT_SET | STATUS_NONE) /* 0: pcie */
> > +				>;
> > +			};
> >  		};
> >  
> >  		pericfg: pericfg@10003000 {
> > 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
