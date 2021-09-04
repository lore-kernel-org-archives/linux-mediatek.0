Return-Path: <SRS0=vCgL=N2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AB9DC433EF
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Sep 2021 14:59:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE5D660E9B
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Sep 2021 14:59:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EE5D660E9B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ASUN32HYONFq1S1zRy6ZfkIxLtjYJLayS3nHWkTnvPU=; b=spqWk6+qfJEQ+z
	M7A39STnAGWiSYhgWvAFQ/kU4mz28anhPaCopdQ9MYlH71sJQr5kkxG8GzTlCulFveECI0X00dQm7
	cmeVGwAgQ0BpWy4WtrgenrjjsSPrFWI0Cv/b8rRDNzethohkqHLAWale4JYWGodsK37bcvl+6c6+h
	AG9g+3iGZLMBbddzWBhngeMYNkbHlllhhMwLo/hDD6NN9gEWHJPDXkkyjbPIX+laY/rH2VkKSy3H6
	4wXmJtz4mr4tWwvUOgZZAfCIdoJ5FPCqGcQr4FVTlnoCHKEaJ2jsoBxY8HQi7tCVRuz0bVgq377xb
	ZFzf8Py+We+jjDSP0alQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mMX8M-00EJ4t-7C; Sat, 04 Sep 2021 14:59:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mMX8H-00EJ38-S0; Sat, 04 Sep 2021 14:59:04 +0000
X-UUID: 9c771ea07c4946dbae2988631a367194-20210904
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=NcyKglH3WRKZUH2Gc+Xwk717ZaqTZxcE/SFRFahdX94=; 
 b=YJftiIpO5RlukKqyVFE2rv2hlVHvyEdBWqTVJb4KUq/EDb2it7jQB58aRtTXrml8qi/dqyOUtcTdKbp0CkiuE4oxq7fbulOeaGqDW6+h76McuCpFiZU+QUmcJ1OPAQMrbQkXfSTYCywPYymOSURGdENxubBKPn2SnOpqYZMCyl0=;
X-UUID: 9c771ea07c4946dbae2988631a367194-20210904
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1786602903; Sat, 04 Sep 2021 07:58:53 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 4 Sep 2021 07:58:52 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 4 Sep 2021 22:58:50 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 4 Sep 2021 22:58:50 +0800
Message-ID: <bb2772830f6c47157493a3da3c380590588c9fd5.camel@mediatek.com>
Subject: Re: [PATCH] clk: imx: use module_platform_driver
From: Miles Chen <miles.chen@mediatek.com>
To: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abel.vesa@nxp.com>, "Fabio
 Estevam" <festevam@gmail.com>, Michael Turquette <mturquette@baylibre.com>,
 NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo
 <shawnguo@kernel.org>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <wsd_upstream@mediatek.com>
Date: Sat, 4 Sep 2021 22:58:50 +0800
In-Reply-To: <163069398650.405991.6861280615873228198@swboyd.mtv.corp.google.com>
References: <20210902080211.7922-1-miles.chen@mediatek.com>
 <163069398650.405991.6861280615873228198@swboyd.mtv.corp.google.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210904_075903_351627_50B81123 
X-CRM114-Status: GOOD (  10.29  )
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

On Fri, 2021-09-03 at 11:33 -0700, Stephen Boyd wrote:
> Quoting Miles Chen (2021-09-02 01:02:11)
> > Replace builtin_platform_driver_probe with
> > module_platform_driver_probe
> > because that CONFIG_CLK_IMX8QXP can be set to =m (kernel module).
> > 
> > Cc: Stephen Boyd <sboyd@kernel.org>
> > Signed-off-by: Miles Chen <miles.chen@mediatek.com>
> > ---
> 
> Should it have a fixes tag?

ok, I will add a fixes tags in the next patch.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
