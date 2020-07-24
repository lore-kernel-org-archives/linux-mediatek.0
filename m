Return-Path: <SRS0=BOys=BD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56D32C433E1
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 07:03:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2543120714
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 07:03:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B84dPoxw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="X5PD51Uu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2543120714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WB5kc6pTAWbc1xapIFsRq5Q+8ekaAJqzVTh2UQOLF3k=; b=B84dPoxw4BAe19gNni/0Fx55D
	YKG0Ivuc6xTTfve2r7eKtn7JuiBKa0CqCEWPgg5NQ0fyrnr8nqy/z4KIriTFvGFKfY47YKDe+iI+v
	7uFQuK+OS+82z/x3ck0If2j3MKwChR58aXmxeA2/+jAcC29ujZ9WxIhEqn8gWrGnzvIq8PYfPYJ5g
	oTcEFUBasCph1fBM5h1Aq6ehw1Kc6lD80Q1hz+YK6NNAHLoo5hbOl+EseJ6qaSogI6etEPXWzn/9k
	l9HwsY7vvrbPDB+LdPhLc5d5cIEVBFF5IQZOQ2WeU5tv9TRb13IRAxhT2bzHwwjbRwDZ9m0l0fUXo
	VsOom0x8A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyrk8-0000CM-0s; Fri, 24 Jul 2020 07:03:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyrk1-00009z-4a; Fri, 24 Jul 2020 07:03:38 +0000
X-UUID: 9ba55bcfd7ac485f867ccf852fe30e17-20200723
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=pQEzRPBBsfVAYpz/jWwz9ulLUcB7f5ZARXi1n6E4uJE=; 
 b=X5PD51UuZTUw9T9biWy2CeEPUtz6YAwpyRH2/VSsrukFa4TQ8pfTM+32aBQgtZFO2lqlO0ayl//FOUUWyCC9se6M+aRq/1L+ms/zv7iFcukwb5a3+EwLbvPGGc99BjT1zr9133HlrcymoHHS7qIPlC/r5F8etwrsiYdB/znPgIg=;
X-UUID: 9ba55bcfd7ac485f867ccf852fe30e17-20200723
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <crystal.guo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 597981940; Thu, 23 Jul 2020 23:03:26 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 24 Jul 2020 00:03:31 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs06n2.mediatek.inc
 (172.21.101.130) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 24 Jul 2020 15:03:30 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 24 Jul 2020 15:03:27 +0800
Message-ID: <1595574138.15289.16.camel@mhfsdcap03>
Subject: Re: [PATCH 3/4] watchdog: mt8192: add wdt support
From: Crystal Guo <crystal.guo@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Fri, 24 Jul 2020 15:02:18 +0800
In-Reply-To: <bdd9f543-0fe0-af25-1843-aae95fcd4230@gmail.com>
References: <20200723090731.4482-1-seiya.wang@mediatek.com>
 <20200723090731.4482-4-seiya.wang@mediatek.com>
 <bdd9f543-0fe0-af25-1843-aae95fcd4230@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 13D0D2DA84AEC947E1C8752AB204567EA3348C69F831154A8F05B16077032F5D2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_030337_395610_2B6F238A 
X-CRM114-Status: GOOD (  18.02  )
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 Seiya Wang =?UTF-8?Q?=28=E7=8E=8B=E8=BF=BA=E5=90=9B=29?=
 <seiya.wang@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-07-24 at 06:00 +0800, Matthias Brugger wrote:
> 
> On 23/07/2020 11:07, Seiya Wang wrote:
> > From: Crystal Guo <crystal.guo@mediatek.com>
> > 
> > add driver setting to support mt8192 wdt
> > 
> > Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
> > ---
> >   drivers/watchdog/mtk_wdt.c | 5 +++++
> >   1 file changed, 5 insertions(+)
> > 
> > diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> > index d6a6393f609d..ad23596170af 100644
> > --- a/drivers/watchdog/mtk_wdt.c
> > +++ b/drivers/watchdog/mtk_wdt.c
> > @@ -76,6 +76,10 @@ static const struct mtk_wdt_data mt8183_data = {
> >   	.toprgu_sw_rst_num = MT8183_TOPRGU_SW_RST_NUM,
> >   };
> >   
> > +static const struct mtk_wdt_data mt8192_data = {
> > +	.toprgu_sw_rst_num = 23,
> 
> Should be defined in include/dt-bindings/reset-controller/mt8192-resets.h

mt8xxx-resets.h actually just used to define TOPRGU_SW_RST_NUM, may be
it's more easier to maintain by define it at OF data directly, instead
of resubmit the mt8xxx-reset.h and add
"include/dt-bindings/reset-controller/mt8xxx-resets.h" at mtk_wdt.c.

Regards
Crystal Guo

> 
> > +};
> > +
> >   static int toprgu_reset_update(struct reset_controller_dev *rcdev,
> >   			       unsigned long id, bool assert)
> >   {
> > @@ -322,6 +326,7 @@ static const struct of_device_id mtk_wdt_dt_ids[] = {
> >   	{ .compatible = "mediatek,mt2712-wdt", .data = &mt2712_data },
> >   	{ .compatible = "mediatek,mt6589-wdt" },
> >   	{ .compatible = "mediatek,mt8183-wdt", .data = &mt8183_data },
> > +	{ .compatible = "mediatek,mt8192-wdt", .data = &mt8192_data },
> >   	{ /* sentinel */ }
> >   };
> >   MODULE_DEVICE_TABLE(of, mtk_wdt_dt_ids);
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
