Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E8BAC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Apr 2022 10:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PAXK7HfdcuO2S8QQahb5E8/CC2Gi7piErQV/UemD0FU=; b=Nnd0RNx3byP1GE
	/2FOrZKfQ27WsrF1Do4Lt0CZSMt1nmx3RDn5Rd5dPnFI+N6JypNkZWMAcoPLTWzsiOZgBgch5OnfG
	DUNIp/58o6j0hAyADON7zsC13MMcMyXXTRdB9PSTJamC4rGMDWEXiGlf+gznU4Tg9VJ00CEFcNYrC
	rElzwAC3x00fVwvGmPdcXlmNBH28o29rdu16t1g0ibSG8xkTpkXIu6s0B3TajYlpMeS+/oO68F1QW
	Pp+F4OqgSdlgpnBt031yQKqR2+0mhN9kvX5y6vvcYU4J87ombWfgVwRtoq4ncIA1K/mCaQ2jMq7KD
	w8qKT99B3rSHnPWW796A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nclnZ-00GMJm-P1; Fri, 08 Apr 2022 10:25:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nclnW-00GMIp-5m; Fri, 08 Apr 2022 10:24:59 +0000
X-UUID: 9d7e110ad20c464b821ae2d0a611bb3a-20220408
X-UUID: 9d7e110ad20c464b821ae2d0a611bb3a-20220408
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1908290170; Fri, 08 Apr 2022 03:24:50 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 8 Apr 2022 03:24:48 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 8 Apr 2022 18:24:47 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 8 Apr 2022 18:24:47 +0800
Message-ID: <8d466903d42dbc823f4d0a245378d983ab904435.camel@mediatek.com>
Subject: Re: [PATCH V2 01/15] dt-bindings: cpufreq: mediatek: Add MediaTek
 CCI property
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, <rafael@kernel.org>, 
 <viresh.kumar@linaro.org>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>
CC: <matthias.bgg@gmail.com>, <jia-wei.chang@mediatek.com>,
 <roger.lu@mediatek.com>, <hsinyi@google.com>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Fri, 8 Apr 2022 18:24:47 +0800
In-Reply-To: <a171f33c-cda1-8602-ac67-93076b676578@linaro.org>
References: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
 <20220408045908.21671-2-rex-bc.chen@mediatek.com>
 <a171f33c-cda1-8602-ac67-93076b676578@linaro.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_032458_268553_5803ADFD 
X-CRM114-Status: GOOD (  23.39  )
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

On Fri, 2022-04-08 at 10:10 +0200, Krzysztof Kozlowski wrote:
> On 08/04/2022 06:58, Rex-BC Chen wrote:
> > From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> > 
> > MediaTek Cache Coherent Interconnect (CCI) uses software devfreq
> > module
> > for scaling clock frequency and adjust voltage.
> > The phandle could be linked between CPU and MediaTek CCI for some
> > MediaTek SoCs, like MT8183 and MT8186.
> > Therefore, we add this property in cpufreq-mediatek.txt.
> > 
> > Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > ---
> >  .../devicetree/bindings/cpufreq/cpufreq-mediatek.txt          | 4
> > ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-
> > mediatek.txt b/Documentation/devicetree/bindings/cpufreq/cpufreq-
> > mediatek.txt
> > index b8233ec91d3d..d1b3d430c25c 100644
> > --- a/Documentation/devicetree/bindings/cpufreq/cpufreq-
> > mediatek.txt
> > +++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-
> > mediatek.txt
> > @@ -20,6 +20,10 @@ Optional properties:
> >  	       Vsram to fit SoC specific needs. When absent, the
> > voltage scaling
> >  	       flow is handled by hardware, hence no software "voltage
> > tracking" is
> >  	       needed.
> > +- cci: MediaTek Cache Coherent Interconnect uses software devfreq
> > module for scaling
> > +       clock frequency and adjust voltage.
> 
> You need to describe the type. I am a bit confused whether this is a
> cci
> (so cci-control-port property?) or an interconnect (so interconnect
> property)... It does not look like a generic property, so you need
> vendor prefix.

Hello Krzysztof,

Thanks for your review.

Yes, this cci is not arm's cci (cci-control-port property), and it's
mediatek's cci. I will revise this name to "mtk-cci" in next version.

> 
> > +       For details, please refer to
> > +       Documentation/devicetree/bindings/devfreq/mtk-cci.yaml
> 
> Such file does not exist.

This mediatek cci is still upstreaming in this patch:
message-id:20220408052150.22536-2-johnson.wang@mediatek.com

Do you have suggestion that I should put this reference?
Or I just remove it and describe the mediatek cci in detail?

BRs,
Rex
> 
> 
> Best regards,
> Krzysztof


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
