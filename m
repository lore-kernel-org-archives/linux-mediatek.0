Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B2F2C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 08:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MMS+IRyzaJ22gh/QzHUewp5vXZbkJw6XhTKBo2guJKY=; b=ciht/hOq81FCZO
	wvP/3HXziUK1qCGPVtd4bHKSb7MGRmCtCYP4er5SoL2Ey2bRg4lf+8oeLFMl692I5OLYyqNysHR72
	duhgCLNv8r36HsCFDlYWkBlhn2/EBUvwg2fcEDhwqKBNsy+6U7CvUFtbVizboGPY9sSgxm3Nj0kkn
	ABcOsdW9Z+ox82vxry6TzRYz8XQ6PFK0Aa7dvebqYFmxt/sv1yrA2Lp3xZDjwtQ/sMk1CWeq/pkbx
	mAA6hB8Jkazo6Woyg2AlXeg2VdfKFf6a+ZoYerJHCAR3aozjcxdSuebPP90blX3WMaVyfIpntdFTF
	90c5TVLoKJUWY6mV346g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njGbm-00DJap-JT; Tue, 26 Apr 2022 08:31:42 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njGbP-00DJRU-QA; Tue, 26 Apr 2022 08:31:21 +0000
X-UUID: ee1f1c0da8e14bb482f967b41c51bf31-20220426
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:d7bde37e-18cd-4ffe-b717-372cc637e20b, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:e90084c6-85ee-4ac1-ac05-bd3f1e72e732,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: ee1f1c0da8e14bb482f967b41c51bf31-20220426
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 287511999; Tue, 26 Apr 2022 01:31:15 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 Apr 2022 01:26:56 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 26 Apr 2022 16:26:54 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 26 Apr 2022 16:26:54 +0800
Message-ID: <1ec1f18809a75faef249cf2303dd19d26c51afff.camel@mediatek.com>
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
Date: Tue, 26 Apr 2022 16:26:54 +0800
In-Reply-To: <9ff80bc2-d63b-14aa-5769-20bff6e3a21e@linaro.org>
References: <20220422075239.16437-1-rex-bc.chen@mediatek.com>
 <20220422075239.16437-2-rex-bc.chen@mediatek.com>
 <f2e5a34b-ed02-91a1-bc7b-fecaa95e227e@linaro.org>
 <811bf944-a230-ab9b-583a-840e57af8a1e@linaro.org>
 <28f75ac2995b116af9b2accf760786d1d1798c93.camel@mediatek.com>
 <7873f0fa-25c3-191f-5096-3ceb9afd50cc@linaro.org>
 <c1b910098a0a5cbe06ec971c1bf745ac37986274.camel@mediatek.com>
 <9ff80bc2-d63b-14aa-5769-20bff6e3a21e@linaro.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_013119_919803_8A96D140 
X-CRM114-Status: GOOD (  20.27  )
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

On Mon, 2022-04-25 at 12:52 +0200, Krzysztof Kozlowski wrote:
> On 25/04/2022 12:20, Rex-BC Chen wrote:
> > > However I am not sure if you solved your problem... see below:
> > > 
> > > > For example:
> > > > mediatek cci set 1.2V originally. When cpufreq want to adjust
> > > > lower
> > > > frequency adn set voltage to 1.0V.
> > > > The framework will remain using 1.2V to prevent crash of
> > > > mediatek
> > > > cci.
> > > 
> > > No, regulator_set_voltage() for proc_reg says:
> > > "NOTE: If the regulator is shared between several devices then
> > > the
> > > lowest
> > >  request voltage that meets the system constraints will be used."
> > > 
> > > Not the highest. So when your devfreq and cpufreq boots, calling
> > > regulator_set_voltage will still cause high frequency and low
> > > voltage.
> > > 
> > 
> > From the driver comment, I think it still needs to match "meets the
> > system constraints".
> > 
> > From drivers, we can trace the driver and it finally to
> > regulator_get_optimal_voltage().
> > In [1], the framework will get max voltage while finding each
> > device's
> > voltage.
> > 
> > [1]: 
> > 
https://urldefense.com/v3/__https://elixir.bootlin.com/linux/latest/source/drivers/regulator/core.c*L3815__;Iw!!CTRNKA9wMg0ARbw!35L9ISPWDpbGPsLEc0935D2nWTLtaLSNfPipvteddPaxwO2i_KaN0wfWegpkyaPjjagW$
> >  
> 
> Right, actually in your case it's the regulator_check_consumers()
> above
> that line, because you
> 
> I think it's quite generic problem, so would be worth solving for
> more
> regulator consumers, but your approach is fine. At least I do not
> have
> anything smarter, at the moment.
> 
> Best regards,
> Krzysztof

Hello Krzysztof,

Thanks for your review!
I will send next version to modify the description of mediatek,cci when
the driver part is explained clear.

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
