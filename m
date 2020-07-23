Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18AEFC433E3
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 08:19:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D70242086A
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 08:19:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mof4EmAr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="p5m/COyp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D70242086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eXfF4p4nAW8xvYK1sTBs4E8auHFGQZkE9U3M9ZYrqCQ=; b=mof4EmArjIPGNrqAI3kj5Delm
	mbEfMOPq6x8ihkYKIieJ2JbsqmxtUBH/5e8khgxYzcWcQIdTZq7tAbh/G9nFCnXkbmyoDnRKmim0F
	TqtMXPfKLGPwBOzBqVCnSyEfV4DajsgrTd5HO+lsigy27+hcGuSlwqycC3GX6/rVOg5lHl2R0r42f
	5M+9ojf2J2eBsqCH1XjwtVS/qJDNjR3cuzvi9LnEclgkTtkCQm0SXFe3paeQ8+GpnwL1wZHuUTD0C
	e2Q35BQXHm1IuQ/p410l8lsluS4X/myJ382SSAm4eXgXfk8HnVy8vBPw05ta8CC7jjt2JzPcjQk+2
	4WyqebrMA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyWRm-00020s-2c; Thu, 23 Jul 2020 08:19:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyWRj-000204-Ng; Thu, 23 Jul 2020 08:19:20 +0000
X-UUID: dae85d986a6a4a73b53064f611e9fd25-20200723
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=fSiTx6h04vMgROFBHuBqIq+Fo4UKmOysYSBBC24bIvw=; 
 b=p5m/COyppFN9UbEVJvmKuB+4Bb1HlVu/jvrAHJQc0zBm0MHQCYu7qtnzJSU5ftLyPG6WCTiOcgurUMKIKIVAGnB01LLxKXa5J08040dLB3ZlqnBtkxPl9hBYlbuLzT2jYpjdEsKjJgAMvk73pOcE62FFQY3q36cTD1gh66OKYgI=;
X-UUID: dae85d986a6a4a73b53064f611e9fd25-20200723
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <wendell.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1852481680; Thu, 23 Jul 2020 00:19:12 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 01:09:08 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 16:09:07 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Jul 2020 16:09:07 +0800
Message-ID: <1595491748.17583.4.camel@mtkswgap22>
Subject: Re: [PATCH 2/2] clk: mediatek: Add EXPORT_SYMBOL for kernel module
 support
From: Wendell Lin <wendell.lin@mediatek.com>
To: Stephen Boyd <sboyd@kernel.org>
Date: Thu, 23 Jul 2020 16:09:08 +0800
In-Reply-To: <159448481956.1987609.4970524569331045099@swboyd.mtv.corp.google.com>
References: <1593588382-19049-1-git-send-email-wendell.lin@mediatek.com>
 <1593588382-19049-3-git-send-email-wendell.lin@mediatek.com>
 <159448481956.1987609.4970524569331045099@swboyd.mtv.corp.google.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_041919_961841_34CE83D7 
X-CRM114-Status: GOOD (  10.28  )
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
Cc: wsd_upstream@mediatek.com, Weiyi Lu <weiyi.lu@mediatek.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, 2020-07-11 at 09:26 -0700, Stephen Boyd wrote:
> Quoting Wendell Lin (2020-07-01 00:26:22)
> > Export common APIs from Mediatek clock driver.
> > 
> > Signed-off-by: Wendell Lin <wendell.lin@mediatek.com>
> 
> Is this needed for something? I'd prefer to see some sort of mediatek
> modular patches that included this patch in it before this is applied.

Got it. 
I'll prepare a new series of mediatek modular patches that included this
patch in it later.

Regards,
Wendell

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
