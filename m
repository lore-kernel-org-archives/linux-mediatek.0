Return-Path: <SRS0=s7tg=JT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCFACC433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 08:48:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26E2B613ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 08:48:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26E2B613ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1kqc4NaiAVhHPwvZa0ABBtlio0jxsq4+RzimP/NzE6I=; b=Ua3Hm5s7opOFaKfrBhcoB0Iii
	cy1/TzhXLlrnuGnqDySX16ZC4Cuy0Oaexz2gje6PrSdUm8nk4fcxvkL0xLSococ01X4+4yXDz+JVP
	S7EXSzSnQo+URRbMD/UgRVptwOxgi9GEEjdkZgT/rgvFj5zxvrAOnkZomgWmKJyDVITad5wbiKMt8
	0Q4Q6qX9R2ul68y8oeSblKQnMSH4HAQCYhfC0lR7t7f5V996ZmlUjgakZ8ZgNEqs9l36W/MfnrRTQ
	khoMKMaCJA9p9/E7ffb2Ox/GF3QFKRE0LZJQqzfiw8XF1k0RyMcXwMFf1GT9syRKVp9S3LDQsZP3b
	q5llPSSTg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZUzx-00GJI2-JC; Thu, 22 Apr 2021 08:47:45 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZUzu-00GJHZ-6W; Thu, 22 Apr 2021 08:47:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=lgjhrko7voA+5hsxOvNsIZmAxBpH3ReDLI988ioHR74=; b=bEjh0jePxSk9A9ANFvlLUOOdJz
 d+FiL3yjdJzFvikF3e5yKuwwkbfUrlOmrvr/Z2MUChBk9s2NUkxOFcndlSO5OkMrpUQf6BI0nzvHJ
 AHe0i/aaHPjDQ8faFmzXYhfEBiyeHpU6KJLlnMa6cswzC2eCsokeRBHn4N7thpJKmZxpB8VnTmvwP
 JkZ+mtBDX97CbYZ7AUjvvRa/X5OAa4l242Bs21LO8c+Q2MuBKd7ScqK8RroBWkAH3HMgMsszCudH2
 anjPxADSaFOmM8n6ac++k9V7OVf090UGqR6dxU7zgGM531Etfp24ZVVmHUudB3VhO5OfN7wPFk67+
 9qLXIl9g==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZUzq-00DW3a-QS; Thu, 22 Apr 2021 08:47:40 +0000
X-UUID: 7d59eb3e0d9c4eb6b44528bef5397a2a-20210422
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=lgjhrko7voA+5hsxOvNsIZmAxBpH3ReDLI988ioHR74=; 
 b=GDbtABg/bqPK4i5D3Rj4ErPPlokcSctZ0uujYopggvPH6Wjt69vap6rgqz8ZB9cYL5geNJzFPJgvGCOgZzr8Y/Z8UKOg0j956y8Hrp7k+NM0FgRczQUp1sTg4bMjY7WyVeDaJaUC0pI2kmp+9gOUBh5vo0ee5sGHxf8n/jUESjM=;
X-UUID: 7d59eb3e0d9c4eb6b44528bef5397a2a-20210422
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <michael.kao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1935579793; Thu, 22 Apr 2021 01:47:31 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Apr 2021 01:47:29 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Apr 2021 16:47:28 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 22 Apr 2021 16:47:27 +0800
Message-ID: <6db776994f939cd5403addeffdc78fc82bc98e7a.camel@mediatek.com>
Subject: Re: [v3,1/3] thermal: mediatek: Relocate driver to mediatek folder
From: Michael Kao <michael.kao@mediatek.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui
 <rui.zhang@intel.com>, <linux-pm@vger.kernel.org>,
 <srv_heupstream@mediatek.com>
CC: Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <hsinyi@chromium.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Date: Thu, 22 Apr 2021 16:47:28 +0800
In-Reply-To: <836581c1-0738-8e42-b168-b54d0bd078a5@linaro.org>
References: <20210312034018.17437-1-michael.kao@mediatek.com>
 <20210312034018.17437-2-michael.kao@mediatek.com>
 <836581c1-0738-8e42-b168-b54d0bd078a5@linaro.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210422_014738_882030_CF5A97F3 
X-CRM114-Status: GOOD (  26.37  )
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

On Tue, 2021-04-20 at 23:22 +0200, Daniel Lezcano wrote:
> On 12/03/2021 04:40, Michael Kao wrote:
> > Add Mediatek proprietary folder to upstream more thermal zone and
> > cooler
> > drivers. Relocate the original thermal controller driver to it and
> > rename
> > as soc_temp.c to show its purpose more clearly.
> 
> We already know the purpose :)
> 
> soc_temp gives no additional information.
> 
> Either keep the name or give the hardware sensor name. It is a driver
> directory.
> 

Dear Daniel,
The new thermal hardware design called lvts (Low voltage thermal
sensor).
Instead of original one using auxadc, the lvts use lvts device to
access thermal senosrs.
It will save power and be more efficient.
We use the config CONFIG_MTK_THERMAL and CONFIG_MTK_SOC_THERMAL_LVTS[1]
to select the different hardware archtecture.

[1] [v3,2/3] thermal: mediatek: Add LVTS drivers for SoC theraml zones

https://patchwork.kernel.org/project/linux-mediatek/patch/20210312034018.17437-3-michael.kao@mediatek.com/

> > Signed-off-by: Michael Kao <michael.kao@mediatek.com>
> > ---
> >  drivers/thermal/Kconfig                       | 14 ++++-------
> >  drivers/thermal/Makefile                      |  2 +-
> >  drivers/thermal/mediatek/Kconfig              | 23
> > +++++++++++++++++++
> >  drivers/thermal/mediatek/Makefile             |  1 +
> >  .../{mtk_thermal.c => mediatek/soc_temp.c}    |  0
> 
> [ ... ]
> 
> vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
> 
> 
> > +config MTK_THERMAL
> > +	tristate "Mediatek thermal drivers"
> > +	depends on THERMAL_OF
> > +	help
> > +	  This is the option for Mediatek thermal software
> > +	  solutions. Please enable corresponding options to
> > +	  get temperature information from thermal sensors or
> > +	  turn on throttle mechaisms for thermal mitigation.
> > +
> > +if MTK_THERMAL
> 
> 
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
> All the above not needed.
> 
> > +config MTK_SOC_THERMAL
> > +	tristate "Temperature sensor driver for mediatek SoCs"
> > +	depends on HAS_IOMEM
> > +	depends on NVMEM
> > +	depends on RESET_CONTROLLER
> > +	help
> > +	  Enable this option if you want to get SoC temperature
> > +	  information for Mediatek platforms. This driver
> > +	  configures thermal controllers to collect temperature
> > +	  via AUXADC interface.
> > +
> > +endif
> > diff --git a/drivers/thermal/mediatek/Makefile
> > b/drivers/thermal/mediatek/Makefile
> > new file mode 100644
> > index 000000000000..f75313ddce5e
> > --- /dev/null
> > +++ b/drivers/thermal/mediatek/Makefile
> > @@ -0,0 +1 @@
> > +obj-$(CONFIG_MTK_SOC_THERMAL)	+= soc_temp.o
> > diff --git a/drivers/thermal/mtk_thermal.c
> > b/drivers/thermal/mediatek/soc_temp.c
> > similarity index 100%
> > rename from drivers/thermal/mtk_thermal.c
> > rename to drivers/thermal/mediatek/soc_temp.c
> 
> 
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
