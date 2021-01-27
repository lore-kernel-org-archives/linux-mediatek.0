Return-Path: <SRS0=2T+p=G6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6B06C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jan 2021 02:14:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60A6A206B5
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jan 2021 02:14:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60A6A206B5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Kb2Fq/TEQYzPN4Fb8tbjju+qvWN4KX0i/Q9w/CXQn6I=; b=AounLOF3CfVnlxDi7OfSyr+2m
	UJ8zGn274avEZQbGiGitScVqqiQN90MpV3C5JSZ8faWY+JhBNdRBMMUc+038iVr4uOdc4FtTrczsp
	0tQ91aIFVvkC7mLYoMESki5JrAZUrQJFjnoL8bRc9QKtlUPxUOKqVl4F9y0UQXf/95QjIhZLTE2xw
	Ugm+uL7OcqbHsfXxw0DY//ccuLZf0VySkY1SVejHZALpc0+AVVNJYzUrru7UV5yCMDI94uXTRFx2d
	NFe2m3oex5Kesm8esgn4g6NmFmzVxkPGG1yKMePRI96uXdmsyFp2jutm7iU6TM60c4Y1HPgmN061G
	Pe5t1qUSw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4aLu-0001x2-15; Wed, 27 Jan 2021 02:14:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4aLo-0001v3-0L; Wed, 27 Jan 2021 02:14:33 +0000
X-UUID: d5b3a603f18a46469eb3f15100029b6e-20210126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Rw/VpEX3T9vli1tbHyKZzNAiYyU8LmRhAEbiaUGY6bs=; 
 b=DjXlJcKP0MPY9pVjuPJblfduT3x/oHr6ShWowDqhLj6/QXn0FHrMtMcGHeVcZpdK2463w2nTYN03C+Goyq+FeujHSDMKLSsprGtTP7LmSMYCReCV2lZXhJ0hQfgVBDRSlC3H5acsMxqSHqUkoPCMePNu42wn5UFA54oM/SwBSNY=;
X-UUID: d5b3a603f18a46469eb3f15100029b6e-20210126
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 550691174; Tue, 26 Jan 2021 18:14:27 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 Jan 2021 18:14:26 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 27 Jan 2021 10:14:23 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 27 Jan 2021 10:14:22 +0800
Message-ID: <1611713663.3905.19.camel@mhfsdcap03>
Subject: Re: [PATCH v6] usb: xhci-mtk: fix unreleased bandwidth data
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Mathias Nyman <mathias.nyman@intel.com>
Date: Wed, 27 Jan 2021 10:14:23 +0800
In-Reply-To: <b8a2cd47-ff32-2251-4431-da05a0f038f7@intel.com>
References: <20210113180444.v6.1.Id0d31b5f3ddf5e734d2ab11161ac5821921b1e1e@changeid>
 <YBAjjmpc4yPrpmgQ@kroah.com>
 <b8a2cd47-ff32-2251-4431-da05a0f038f7@intel.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 017506B0ECBD3990E5B8BE4EFC066A9874C9FCE0C451CA2BA053A9B4C643E5EA2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210126_211432_243167_D75A796F 
X-CRM114-Status: GOOD (  19.31  )
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
Cc: Zhanyong Wang <zhanyong.wang@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tianping Fang <tianping.fang@mediatek.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Ikjoon Jang <ikjn@chromium.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2021-01-26 at 16:27 +0200, Mathias Nyman wrote:
> On 26.1.2021 16.13, Greg Kroah-Hartman wrote:
> > On Wed, Jan 13, 2021 at 06:05:11PM +0800, Ikjoon Jang wrote:
> >> xhci-mtk needs XHCI_MTK_HOST quirk functions in add_endpoint() and
> >> drop_endpoint() to handle its own sw bandwidth management.
> >>
> >> It stores bandwidth data into an internal table every time
> >> add_endpoint() is called, and drops those in drop_endpoint().
> >> But when bandwidth allocation fails at one endpoint, all earlier
> >> allocation from the same interface could still remain at the table.
> >>
> >> This patch moves bandwidth management codes to check_bandwidth() and
> >> reset_bandwidth() path. To do so, this patch also adds those functions
> >> to xhci_driver_overrides and lets mtk-xhci to release all failed
> >> endpoints in reset_bandwidth() path.
> >>
> >> Fixes: 08e469de87a2 ("usb: xhci-mtk: supports bandwidth scheduling with multi-TT")
> >> Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> > 
> > Mathias, any objection to me taking this patch, or do you have others
> > being queued up for 5.11-final?
> > 
> 
> No objections, haven't tried it out but it looks good to me.
> 
> If I finish some additional small fix for 5.11-final I can make it on top of this
Please give me some time to test this patch, thank you

> 
> -Mathias 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
