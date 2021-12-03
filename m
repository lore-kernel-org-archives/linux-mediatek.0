Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA7EC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Dec 2021 01:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sZjWIVPDhFBG9lmDyy7bIrpI4HOfpy6kjwWiYBZoIcM=; b=lEim0qnHlLhHc8
	buGr6Y3vikF1TtJsIsDmDCeC6xMjggrT3QxUPJjxTwn6u0yThD346/xizkZNFRy/Ipfr4ypkQ/VtI
	0+pmwaKyC9jiRR9F19Z6hrcKK5gZOYyMZTA5KH7+KEoXsQzjzExQvD2prtrj7J07Ycs1hHGkwO6H0
	0KBBTmxT4IA3gPb1R//fJy4Xk9x2Y3hl/m4isC38Et4gyfmyD+JjCYQ94Gtq2jdRvOXfAHOHSWUzu
	aipj/yiCpx0r0c80t67JeCk3oyLwi4Eec/++uHxo/v3jsYfcZMxwvTjS+6XRLBwnEEuQ1xrUsP19p
	K/uF9j4NnjYvAX/9m3jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msxpK-00E1P9-P7; Fri, 03 Dec 2021 01:57:30 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msxp6-00E1Js-Uv; Fri, 03 Dec 2021 01:57:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 95AE2B8256E;
 Fri,  3 Dec 2021 01:57:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BCBCC00446;
 Fri,  3 Dec 2021 01:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638496634;
 bh=/UDPkKhe1xuwTbm+tg8qCshVaTn9o077A90hWi1CX6Q=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=P22bOfSNPryoQdsSZD7kk6eRN7s+Om6vT2CrvzGA+WfQqsOfcQWB28+L3q4+DEVdg
 RaEnE/+bS+Xa+JMb5+pnHft6xafn/ejRiKDa0WjnCi0lPjxlbn3MUtOhXAhMVbIPib
 AVPGDMb85P3nJzplra/0mv6p6X7QkdB7dXOemB6QWNPx2K9Zpo9HOcRU1vDZsqrSu5
 tOscy+82u0EROxyAmpcuYvHIoIuHxzebeqig5l/zRoOe0d4ZosVQ5sSce3PJZHGEMg
 VERM8XGJcQF5Kv/6vDJt0fOyx25PEaweT+OYxDdLnveZRLlY5ZydyC9FqcwaDLAEQC
 GAlTDVckYpiMQ==
MIME-Version: 1.0
In-Reply-To: <YZlchKnEqWN8nKQk@ryzen>
References: <163087455086.405991.14496690646389782129@swboyd.mtv.corp.google.com>
 <20211105055932.3432-1-miles.chen@mediatek.com> <YZlchKnEqWN8nKQk@ryzen>
Subject: Re: [PATCH v3] clk: imx: use module_platform_driver
From: Stephen Boyd <sboyd@kernel.org>
Cc: festevam@gmail.com, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-imx@nxp.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, mturquette@baylibre.com,
 s.hauer@pengutronix.de, shawnguo@kernel.org, wsd_upstream@mediatek.com
To: Abel Vesa <abel.vesa@nxp.com>, miles.chen@mediatek.com
Date: Thu, 02 Dec 2021 17:57:13 -0800
User-Agent: alot/0.9.1
Message-Id: <20211203015714.4BCBCC00446@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_175717_177798_5DED19B6 
X-CRM114-Status: GOOD (  15.65  )
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

Quoting Abel Vesa (2021-11-20 12:37:24)
> On 21-11-05 13:59:32, miles.chen@mediatek.com wrote:
> > From: Miles Chen <miles.chen@mediatek.com>
> > 
> > Hi Stephen,
> > 
> > >> Fixes: e0d0d4d86c766 ("clk: imx8qxp: Support building i.MX8QXP clock driver as module")
> > >> Cc: Fabio Estevam <festevam@gmail.com>
> > >> Cc: Stephen Boyd <sboyd@kernel.org>
> > >> Signed-off-by: Miles Chen <miles.chen@mediatek.com>
> > 
> > > Reviewed-by: Stephen Boyd <sboyd@kernel.org>
> > 
> > Thanks for doing the review, I cannot find this patch in clk-imx tree,
> > Would you pick this patch, please?
> 
> Sorry for the delay. 
> 
> Fixes are usually picked up directly by Stephen, 
> therefore they're not going through clk-imx tree.
> 
> Stephen, can you pick this one up please?
> 

It doesn't look like a very critical fix but ok. I suppose someone could
try to use =m for these files?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
