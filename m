Return-Path: <SRS0=s7tg=JT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D303C433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 08:33:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAAC6613C2
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 08:33:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CAAC6613C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9qLH7sZYb2hNOWav/wbOX5QoWqy8j/f/Vp0oW/1nPyI=; b=S6zz1HmqoxgXNSY4k9PY9sDVN
	0FFNOH6F8Ut6tmCdGc24vcX+oXCpiNH1kGf5hQD6BTSsbvLTW73sL2aTcTX2966p4jxhVv81Jx/vd
	6rlFJA6w7lI8EJEB/Wr5crRCIc2bAoASckvUZjuVllVIFwxpX2L49t2NmmU8CpPFZppkZEX7+Y+qM
	FiRf5cuTHamZb/WGjEBzYLkxlmSeZVMyIOIjImoQJuNVJzD7JvFrBbztdbTmvsyuEzWXSo/5ptrQE
	W+KNW+0LJkGgTGvRZUQh0XBwQGahsceKTiuQS/H1AlKbaOdfExPjVdoYIU7c3ycxv0sZAjE9y0LHL
	6ifyDewbw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZUlf-00GHQ3-Tg; Thu, 22 Apr 2021 08:33:00 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZUlW-00GHM9-Fu; Thu, 22 Apr 2021 08:32:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=8OCuYAoKRzyNIrFHDh0JFHLltn0XV5hbwr2yNVi0Wv0=; b=kFdh6XgSH5bpaE78eK/CYb7Dqx
 vzPPSs/HAyRNAEh2LhiKRJdP4KS7hFfGvlzDNXec0NSMTcBL+586JEHqQg4xFu8y7NjiNyL+FV8Gp
 YUwrmKVyU7h/VLzcucE1+XkdhoXZpnE39qO31h8XLbanAwa20owhogW+lBYI407wDXkVO8jahvMxY
 uaaQTlSzWdMEF7rP+f7cffEh5zxEyPwCCR8nlu739ExoJEFw85AzgCfTcJHUHuii+LPZahEle96Eq
 g5sQFED7hzWvMbG6o+wkFF/c3M1Uo37awtdtJ2j+A0qSrqF9d5KNuqPjJsqeCduro5WFbZd4JNV6N
 4ukkOG2w==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZUlT-00DVU0-19; Thu, 22 Apr 2021 08:32:48 +0000
X-UUID: 4658482b16b24d7481cc733b8d9f4a94-20210422
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=8OCuYAoKRzyNIrFHDh0JFHLltn0XV5hbwr2yNVi0Wv0=; 
 b=jKG0rinnyhbZPdIEZimqhhz23phdv1EdmpqnlmVIMg/lOguXU676OoXN0H+NTbp3B/eAE2GPZEFMi3eGvg0cYdbGjJDwuZD4v0o/2PKl3SfseEJNAPxqH4LG8cxF+rRgpPx3SwctIZrbTmbpmD4y0igaMOCvRiNU9Eb+3pQX+kQ=;
X-UUID: 4658482b16b24d7481cc733b8d9f4a94-20210422
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <michael.kao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1068341220; Thu, 22 Apr 2021 01:32:41 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Apr 2021 01:32:39 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Apr 2021 16:32:38 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 22 Apr 2021 16:32:38 +0800
Message-ID: <8532c21e518530d06a37c25bbcbc08d97147769a.camel@mediatek.com>
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
Date: Thu, 22 Apr 2021 16:32:38 +0800
In-Reply-To: <836581c1-0738-8e42-b168-b54d0bd078a5@linaro.org>
References: <20210312034018.17437-1-michael.kao@mediatek.com>
 <20210312034018.17437-2-michael.kao@mediatek.com>
 <836581c1-0738-8e42-b168-b54d0bd078a5@linaro.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210422_013247_101679_2FC89E9B 
X-CRM114-Status: GOOD (  25.38  )
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

We introduce the new thermal hardware design called lvts in the new
project. The new project will desgin with lvts will enable the
CONFIG_MTK_SOC_THERMAL_LVTS to build lvts driver[1].
The old project will use CONFIG_MTK_THERMAL to build soc_temp.c.

The new design use lvts device to access thermal sensors in the soc.
The original design access thermal sensors by auxadc.

[1] [v3,2/3] thermal: mediatek: Add LVTS drivers for SoC theraml zones


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
