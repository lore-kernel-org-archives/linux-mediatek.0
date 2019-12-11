Return-Path: <SRS0=jhbW=2B=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67B53C43603
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Dec 2019 08:14:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39EF82077B
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Dec 2019 08:14:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="irlAOTrh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="VrSyV1Cp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39EF82077B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=37+ksmQhbOx30PukyHgy76Sf/ShJjP36Em1NlaJBQQM=; b=irlAOTrhm7iYbW
	Rhk2Dlq9n1BQdTQZ7L/yxBP/sa691WANRoR8ZMvHkYbgRoq4JDQ/melpskFYpLQz6aEnUDOgTcrS6
	QNNAFvy6BujqkNSsiGNCCbVci5pRtcxQFtYQKDpI3eFx9VQh13UpqT91kdltJCCsOjuet/7BA2NRV
	CSSOK+UzNVvN9sBmo24S0fE/VCB1FS89wszWbSlVASQCnA1QPHz0dDGYB2rADBvRbKJzNm24TGrTE
	p7v6xDTZIVvHKCAyLJRKTwVcPKbAe3Yh1AJOGMvfogb9iWHojnuAL1D6KzF1vz3+AmQyNrH9+L0OM
	mC6hGWdnstTFgd33LF0Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iex82-00028A-HH; Wed, 11 Dec 2019 08:13:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iex7z-00027D-7C; Wed, 11 Dec 2019 08:13:48 +0000
X-UUID: 53c14fa4ae144fad8c9fbb3e631e4350-20191211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=LMtGwOTN7KKUaEd8A9wg9LxG6VsxXxh0GBa84A4j5NY=; 
 b=VrSyV1Cp/l36nS3QpKYFQo/XlsRas7PPPnVbCA0Vmr0Xq/oddPdYCRZ+S1LbSxLa35dk22OAX4BCsnJciiodIVZTT0ChjctJfIyvGXWxdOJosTtSwLsF9p3akTdDJSv8K+NEZp+u963N+G6BOLk9LhnhyLF5R0EpP+D0ff2xj7o=;
X-UUID: 53c14fa4ae144fad8c9fbb3e631e4350-20191211
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <michael.kao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 447750902; Wed, 11 Dec 2019 00:13:35 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 11 Dec 2019 00:13:49 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 11 Dec 2019 16:13:09 +0800
Received: from [172.21.84.99] (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 11 Dec 2019 16:12:57 +0800
Message-ID: <1576052012.1631.13.camel@mtksdccf07>
Subject: Re: [PATCH] [RESEND] arm64: dts: mt8173: Add dynamic power node.
From: Michael Kao <michael.kao@mediatek.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Date: Wed, 11 Dec 2019 16:13:32 +0800
In-Reply-To: <4aaf8cee-eaa2-5de4-37f0-094b9bc8da22@linaro.org>
References: <20191122090610.17015-1-michael.kao@mediatek.com>
 <4aaf8cee-eaa2-5de4-37f0-094b9bc8da22@linaro.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191211_001347_267662_454C9465 
X-CRM114-Status: GOOD (  13.34  )
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
 linux-pm@vger.kernel.org, Dawei Chien <dawei.chien@mediatek.com>,
 linux-kernel@vger.kernel.org, Eduardo Valentin <edubezval@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Zhang Rui <rui.zhang@intel.com>, mn.tsou@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2019-12-05 at 17:00 +0100, Daniel Lezcano wrote:
> Hi Michael,
> 
> 
> On 22/11/2019 10:06, michael.kao@mediatek.com wrote:
> > From: "michael.kao" <michael.kao@mediatek.com>
> > 
> > This device node is for calculating dynamic power in mW.
> > Since mt8173 has two clusters, there are two dynamic power
> > coefficient as well.
> 
> Are you sure about the values? Usually, Big is ~x4 little, here it is ~x2.

Hi Daniel,

I have confirmed again with our IC designer.
The dynamic power coefficients are these value is right.
Designer comment that it is result from different IC implement.
> 
> > Signed-off-by: Dawei Chien <dawei.chien@mediatek.com>
> > Signed-off-by: Michael.Kao <michael.kao@mediatek.com>
> > 
> > ---
> >  arch/arm64/boot/dts/mediatek/mt8173.dtsi | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> > index 15f1842f6df3..b03ca5a71338 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> > @@ -157,6 +157,7 @@
> >  			enable-method = "psci";
> >  			cpu-idle-states = <&CPU_SLEEP_0>;
> >  			#cooling-cells = <2>;
> > +			dynamic-power-coefficient = <263>;
> >  			clocks = <&infracfg CLK_INFRA_CA53SEL>,
> >  				 <&apmixedsys CLK_APMIXED_MAINPLL>;
> >  			clock-names = "cpu", "intermediate";
> > @@ -170,6 +171,7 @@
> >  			enable-method = "psci";
> >  			cpu-idle-states = <&CPU_SLEEP_0>;
> >  			#cooling-cells = <2>;
> > +			dynamic-power-coefficient = <263>;
> >  			clocks = <&infracfg CLK_INFRA_CA53SEL>,
> >  				 <&apmixedsys CLK_APMIXED_MAINPLL>;
> >  			clock-names = "cpu", "intermediate";
> > @@ -183,6 +185,7 @@
> >  			enable-method = "psci";
> >  			cpu-idle-states = <&CPU_SLEEP_0>;
> >  			#cooling-cells = <2>;
> > +			dynamic-power-coefficient = <530>;
> >  			clocks = <&infracfg CLK_INFRA_CA72SEL>,
> >  				 <&apmixedsys CLK_APMIXED_MAINPLL>;
> >  			clock-names = "cpu", "intermediate";
> > @@ -196,6 +199,7 @@
> >  			enable-method = "psci";
> >  			cpu-idle-states = <&CPU_SLEEP_0>;
> >  			#cooling-cells = <2>;
> > +			dynamic-power-coefficient = <530>;
> >  			clocks = <&infracfg CLK_INFRA_CA72SEL>,
> >  				 <&apmixedsys CLK_APMIXED_MAINPLL>;
> >  			clock-names = "cpu", "intermediate";
> > 
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
