Return-Path: <SRS0=JxBa=DV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88447C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2020 02:36:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24B7021775
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2020 02:36:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="v9SFuyD7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="XshiTFUN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24B7021775
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iydyRFRYtk6bx60HlHGX0N34zLC31IocE+hDno1m8rQ=; b=v9SFuyD7VOyi8j5Kc1q5F4j0E
	Ea82y9/uWr7WDCpl1Qd6iahlNuDzv1ZjNZbiKgwIQvswsANPLdILbNN8mnMbe+Zag/aE/dda5jWR9
	m+T+0vnykdPILw78gPk1/gondc2ld9tEFvPj5FTM3tL43W+6OuA89ry5AmYsb3RE0n0491k47HPJu
	3apB3X9b89kFiqoJrNw7o8wNDzvq94JV8PebXRggwiN7GM2vEu0Lg11IRAZ21eOHtiyfDetVKTkE3
	ifGC6UgySwqOMyTnO0xi8b7QeA8T9WcXzkPleZRjEdG56mnePuDeh6fRYrJeRSLvdMCiwwOyo+ccJ
	WejpVXRyw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSWeD-0003Pv-Cc; Wed, 14 Oct 2020 02:36:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSWe6-0003N7-3q; Wed, 14 Oct 2020 02:36:08 +0000
X-UUID: 5bc44204aef0465b996f7b7acc3d3130-20201013
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=86OsRMMbYlWcUWN23W9NddA6ngFDdGK9EuPCIrIysn8=; 
 b=XshiTFUN3XBYADa3ihYOxO4edxF77hPRWlu0DNiPapZ+I51vZHI0pkvsVOGXHiCY/dg9DZgZ47pDSBYByDZiFAJ4KCbTRlUvkeK4TEXsukCZroXr78ERNzqmUe7tAYEv+i5lBeOcWvFln6taEKUuJWfGDw2VTla0Rdw7KMLe3bk=;
X-UUID: 5bc44204aef0465b996f7b7acc3d3130-20201013
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <wenbin.mei@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1989736829; Tue, 13 Oct 2020 18:35:53 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 13 Oct 2020 19:28:53 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 14 Oct 2020 10:28:50 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 14 Oct 2020 10:28:50 +0800
Message-ID: <1602642530.11864.3.camel@mhfsdcap03>
Subject: Re: [PATCH v6 4/4] mmc: mediatek: Add subsys clock control for
 MT8192 msdc
From: Wenbin Mei <wenbin.mei@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Wed, 14 Oct 2020 10:28:50 +0800
In-Reply-To: <72ae1d89-fe31-4f50-15c0-29119d662ea1@gmail.com>
References: <20201012124547.16649-1-wenbin.mei@mediatek.com>
 <20201012124547.16649-5-wenbin.mei@mediatek.com>
 <72ae1d89-fe31-4f50-15c0-29119d662ea1@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: EA5C87158EF05DF46265A81A6E9FE3CD459D96D9A1D5B523820C9EA2686636C02000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201013_223606_401294_5568BEF2 
X-CRM114-Status: GOOD (  19.76  )
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
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
 srv_heupstream@mediatek.com, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Chaotian Jing <chaotian.jing@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2020-10-13 at 17:10 +0200, Matthias Brugger wrote:
> 
> On 12/10/2020 14:45, Wenbin Mei wrote:
> > MT8192 msdc is an independent sub system, we need control more bus
> > clocks for it.
> > Add support for the additional subsys clocks to allow it to be
> > configured appropriately.
> > 
> > Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
> > ---
> >   drivers/mmc/host/mtk-sd.c | 74 +++++++++++++++++++++++++++++----------
> >   1 file changed, 56 insertions(+), 18 deletions(-)
> > 
> > diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> > index a704745e5882..c7df7510f120 100644
> > --- a/drivers/mmc/host/mtk-sd.c
> > +++ b/drivers/mmc/host/mtk-sd.c
> [...]
> > +static int msdc_of_clock_parse(struct platform_device *pdev,
> > +			       struct msdc_host *host)
> > +{
> > +	int ret;
> > +
> > +	host->src_clk = devm_clk_get(&pdev->dev, "source");
> > +	if (IS_ERR(host->src_clk))
> > +		return PTR_ERR(host->src_clk);
> > +
> > +	host->h_clk = devm_clk_get(&pdev->dev, "hclk");
> > +	if (IS_ERR(host->h_clk))
> > +		return PTR_ERR(host->h_clk);
> > +
> > +	host->bus_clk = devm_clk_get_optional(&pdev->dev, "bus_clk");
> > +	if (IS_ERR(host->bus_clk))
> > +		host->bus_clk = NULL;
> > +
> > +	/*source clock control gate is optional clock*/
> > +	host->src_clk_cg = devm_clk_get_optional(&pdev->dev, "source_cg");
> > +	if (IS_ERR(host->src_clk_cg))
> > +		host->src_clk_cg = NULL;
> > +
> > +	host->sys_clk_cg = devm_clk_get_optional(&pdev->dev, "sys_cg");
> > +	if (IS_ERR(host->sys_clk_cg))
> > +		host->sys_clk_cg = NULL;
> > +
> > +	/* If present, always enable for this clock gate */
> > +	clk_prepare_enable(host->sys_clk_cg);
> > +
> > +	host->bulk_clks[0].id = "pclk_cg";
> > +	host->bulk_clks[1].id = "axi_cg";
> > +	host->bulk_clks[2].id = "ahb_cg";
> 
> That looks at least suspicious. The pointers of id point to some strings defined 
> in the function. Aren't they out of scope once msdc_of_clock_parse() has returned?
> 
These constants are not in stack range, so they will not be lost.
And I have confirmed it after msdc_of_clock_parse() has returned, these
ids still exist.

> Regards,
> Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
