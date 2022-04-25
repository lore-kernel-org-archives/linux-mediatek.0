Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96881C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Apr 2022 10:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eFxgWtyGbTFFcCbWy/V5c2bVwgkSNrgOJ26/DOamFLo=; b=HOTAXWGCE05IXC
	BWU2HTtpB81pBDRUdBdEvopz6vIqqwJe7CWGzbZAaArlnKFLT7mk4f1e+rIVxMPKXrn+mCjMQsYTJ
	ETyaWvoY5MCKptEiLM3FVbrWPqUKMMn2unGyZTIL7X+Yi9Pcfonn8R/gHEJpuG/7TGMfm0BSoBAWy
	S+ul1bV6uTeEGfEEnGkUqCQb+gTPLSLeZC6QO5wOOBQxzOVaym+bsQAazQM5I0airl8JNUNQJZQHU
	oqrhwsl22xyDelIJRrSv+FiWIu97QOVvrJmkb0eDBU9+ObUhhw2xyfzILjva7MqeFUlUjxpR7OAip
	5d3DeP3FPgsHsA9U2ZOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nivwa-0097jO-Cp; Mon, 25 Apr 2022 10:27:48 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nivwW-0097i2-3M; Mon, 25 Apr 2022 10:27:46 +0000
X-UUID: 542628d5b9054adc8f55e3ca2ed7457f-20220425
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:d8b37595-9d52-4d9e-a31e-8fc91410d9f7, OB:0,
 LO
 B:0,IP:0,URL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:25
X-CID-META: VersionHash:faefae9, CLOUDID:5c3b06f0-06b0-4305-bfbf-554bfc9d151a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 542628d5b9054adc8f55e3ca2ed7457f-20220425
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2021294241; Mon, 25 Apr 2022 03:27:40 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 25 Apr 2022 03:21:04 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 25 Apr 2022 18:20:55 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 25 Apr 2022 18:20:55 +0800
Message-ID: <c1b910098a0a5cbe06ec971c1bf745ac37986274.camel@mediatek.com>
Subject: Re: [PATCH V4 01/14] dt-bindings: cpufreq: mediatek: Add MediaTek
 CCI property
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, <rafael@kernel.org>, 
 <viresh.kumar@linaro.org>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>,
 <matthias.bgg@gmail.com>
CC: <jia-wei.chang@mediatek.com>, <roger.lu@mediatek.com>,
 <hsinyi@google.com>, <khilman@baylibre.com>,
 <angelogioacchino.delregno@collabora.com>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 25 Apr 2022 18:20:55 +0800
In-Reply-To: <7873f0fa-25c3-191f-5096-3ceb9afd50cc@linaro.org>
References: <20220422075239.16437-1-rex-bc.chen@mediatek.com>
 <20220422075239.16437-2-rex-bc.chen@mediatek.com>
 <f2e5a34b-ed02-91a1-bc7b-fecaa95e227e@linaro.org>
 <811bf944-a230-ab9b-583a-840e57af8a1e@linaro.org>
 <28f75ac2995b116af9b2accf760786d1d1798c93.camel@mediatek.com>
 <7873f0fa-25c3-191f-5096-3ceb9afd50cc@linaro.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_032744_207741_05BEC15D 
X-CRM114-Status: GOOD (  46.48  )
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

On Mon, 2022-04-25 at 10:55 +0200, Krzysztof Kozlowski wrote:
> On 25/04/2022 08:19, Rex-BC Chen wrote:
> > On Fri, 2022-04-22 at 19:34 +0200, Krzysztof Kozlowski wrote:
> > > On 22/04/2022 19:26, Krzysztof Kozlowski wrote:
> > > > On 22/04/2022 09:52, Rex-BC Chen wrote:
> > > > > MediaTek Cache Coherent Interconnect (CCI) uses software
> > > > > devfreq
> > > > > module
> > > > > for scaling clock frequency and adjust voltage.
> > > > > The phandle could be linked between CPU and MediaTek CCI for
> > > > > some
> > > > > MediaTek SoCs, like MT8183 and MT8186.
> > > > > Therefore, we add this property in cpufreq-mediatek.txt.
> > > > > 
> > > > > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > > > > ---
> > > > >  .../devicetree/bindings/cpufreq/cpufreq-
> > > > > mediatek.txt         | 5
> > > > > +++++
> > > > >  1 file changed, 5 insertions(+)
> > > > > 
> > > > > diff --git
> > > > > a/Documentation/devicetree/bindings/cpufreq/cpufreq-
> > > > > mediatek.txt
> > > > > b/Documentation/devicetree/bindings/cpufreq/cpufreq-
> > > > > mediatek.txt
> > > > > index b8233ec91d3d..3387e1e2a2df 100644
> > > > > --- a/Documentation/devicetree/bindings/cpufreq/cpufreq-
> > > > > mediatek.txt
> > > > > +++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-
> > > > > mediatek.txt
> > > > > @@ -20,6 +20,11 @@ Optional properties:
> > > > >  	       Vsram to fit SoC specific needs. When absent,
> > > > > the
> > > > > voltage scaling
> > > > >  	       flow is handled by hardware, hence no software
> > > > > "voltage
> > > > > tracking" is
> > > > >  	       needed.
> > > > > +- mediatek,cci:
> > > > > +	MediaTek Cache Coherent Interconnect (CCI) uses the
> > > > > software
> > > > > devfreq module to
> > > > > +	scale the clock frequency and adjust the voltage.
> > > > 
> > > > Devfreq is a SW mechanism, it should not be part of bindings
> > > > description.
> > 
> > Hello Krzysztof,
> > 
> > The reason we want to get the "mediatek,cci":
> > We need to check the mediatek cci is ready and probed done.
> > Because cpufreq and mediatek cci are sharing the same regulator in
> > little core cpus.
> > Therefore, to prevent high frequency low voltage issue, we need to
> > make
> > sure the mediatek cci is ready.
> > 
> > If mediatek cci is ready, cpufreq and mediatek cci will register
> > the
> > same regulator and from regulator's implementation, if there are
> > two
> > device using the same regulator, the framwork will make sure it's
> > using
> > the max voltage.
> 
> Thanks for explanation. The property should be described with what
> you
> said here. The property and description should match hardware, so
> there
> is no place for devfreq. Instead mention that power rail is shared or
> voltage regulators are common.
> 

Hello Krzysztof,

I will modify the description to the reason why we need mediatek,cci.

> However I am not sure if you solved your problem... see below:
> 
> > For example:
> > mediatek cci set 1.2V originally. When cpufreq want to adjust lower
> > frequency adn set voltage to 1.0V.
> > The framework will remain using 1.2V to prevent crash of mediatek
> > cci.
> 
> No, regulator_set_voltage() for proc_reg says:
> "NOTE: If the regulator is shared between several devices then the
> lowest
>  request voltage that meets the system constraints will be used."
> 
> Not the highest. So when your devfreq and cpufreq boots, calling
> regulator_set_voltage will still cause high frequency and low
> voltage.
> 

From the driver comment, I think it still needs to match "meets the
system constraints".

From drivers, we can trace the driver and it finally to
regulator_get_optimal_voltage().
In [1], the framework will get max voltage while finding each device's
voltage.

[1]: 
https://elixir.bootlin.com/linux/latest/source/drivers/regulator/core.c#L3815

> > 
> > Therefore, we need to confirm the mediatek cci is ready and
> > register
> > the regulator.
> > 
> > > > 
> > > > > +	For details, please refer to
> > > > > +	Documentation/devicetree/bindings/interconnect/mediatek
> > > > > ,cci.yam
> > > > > l
> > > > 
> > > > Since the file does not exist, I have troubles reviewing it.
> > > > First
> > > > of
> > > > all, you already have "mediatek,cci-control" property in DT, so
> > > > why
> > > > using different name?
> > 
> > I am not sure where is "mediatek,cci-control". I think this name is
> > not
> > used before.
> > 
> 
> Documentation/devicetree/bindings/net/mediatek-net.txt
> 
> > > > 
> > > > Second, it looks like you want to put devfreq into bindings
> > > > instead
> > > > of
> > > > using proper interconnect bindings.
> > > 
> > > Actually judging by the driver this looks like some
> > > device-boot-time-ordering, so I wonder whether this is a proper
> > > way
> > > to
> > > express it.
> > 
> > Yes, we need to get the mediatek cci node and let cpufreq and
> > mediatek
> > cci link succefully. In that case, we can know the mediatek cci is
> > ready. And we can set the voltage using the regulator framwork.
> > 
> > [1]: 
> > 
https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/patch/20220422075239.16437-11-rex-bc.chen@mediatek.com/__;!!CTRNKA9wMg0ARbw!xOuKKyjBosmRcUseQXU9SiPu8msBXrrQAASdxwVbR0SU2inuXUtO180Y0Erkpy-JmOwu$
> >  
> 
> Yes, I see the use case. I am not convinced yet whether this is
> proper
> approach...
> 

When mediatek cci is ready (probe done and register regulator done), we
can confirm that regulator framwork will make sure the voltage setting
is safe.

BRs,
Rex

> 
> Best regards,
> Krzysztof


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
