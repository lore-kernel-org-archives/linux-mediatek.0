Return-Path: <SRS0=Ndyv=OF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07198C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Sep 2021 01:50:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB89B60FBF
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Sep 2021 01:49:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BB89B60FBF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IJB7zjjb8fs8u7cp4yOppDwKotCnzbyZy+2r9KRVCTA=; b=mGGzqw5F0dk7pb
	ho9QsHUgoyNAVJOtMLdPflAU1k5W6OnupitNXbEzDJqJAcShUB7doq+2yci3LOnl7COu2L7/PrWdW
	lPgLRqfchBeIcoblBrFh+OpYBNVg0wzfhvMRscftEgDuAX7KsFa3q2m5guXaicPwtEwhl8d/WaBan
	kW9+CknkNUFZrniTLOSknLwQt0n+h7c93mMTx3Ti92m1zc/bNTJ7U4qHwtwlGKygk2tKet9B2vJZz
	m/ARUxqCNBwFjV9tzC9YTseKXWl/7PK6N+j9c5bfhmSTcjNyyhkqfcaZ2dlKR0S1VSVfTm/t4q//P
	P1EOzzfTQzU+5I3OzPIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQK3I-007rMx-Ms; Wed, 15 Sep 2021 01:49:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQK3F-007rLk-Rp; Wed, 15 Sep 2021 01:49:31 +0000
X-UUID: fe9001a4e2724794867b6378bc3b0101-20210914
X-UUID: fe9001a4e2724794867b6378bc3b0101-20210914
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1408844836; Tue, 14 Sep 2021 18:49:24 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Sep 2021 18:49:22 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 15 Sep 2021 09:49:21 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 15 Sep 2021 09:49:21 +0800
Message-ID: <214844bdf9ccb3e37fe2c8815b6c4dfc6ecff253.camel@mediatek.com>
Subject: Re: [PATCH v3 0/4] clk: mediatek: modularize COMMON_CLK_MT6779
From: Miles Chen <miles.chen@mediatek.com>
To: Stephen Boyd <sboyd@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>
CC: Wendell Lin <wendell.lin@mediatek.com>, Hanks Chen
 <hanks.chen@mediatek.com>, <linux-clk@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <wsd_upstream@mediatek.com>
Date: Wed, 15 Sep 2021 09:49:21 +0800
In-Reply-To: <163166901247.763609.17762427178197245692@swboyd.mtv.corp.google.com>
References: <20210901222526.31065-1-miles.chen@mediatek.com>
 <163166901247.763609.17762427178197245692@swboyd.mtv.corp.google.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_184929_953607_E9DE01A6 
X-CRM114-Status: GOOD (  12.34  )
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

On Tue, 2021-09-14 at 18:23 -0700, Stephen Boyd wrote:
> Quoting Miles Chen (2021-09-01 15:25:23)
> > This patch set makes COMMON_CLK_MEDIATEK and COMMON_CLK_MT6779*
> > be able to built as kernel modules. Necessary symbols are exported
> > in this patch.
> > 
> 
> The subject says 4 patches but there's really only three.

yes, there should be only 3 patches. sorry for the incorrect "0/4"
cover letter.

Miles


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
