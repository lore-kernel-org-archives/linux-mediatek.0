Return-Path: <SRS0=VX5C=HD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31323C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 02:15:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD47664E09
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 02:15:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD47664E09
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aVjKBGcjsifRuAzcoFHkzoKVuEQYMBJJQSEfEY6vX+M=; b=EG15bhsWrQiuIEVtbFqSMaZRy
	Mih+XCFBOmgz5ywh5Vy+2Y7m1fdLl533iNFNTGGXuDmpnjiNLyLQS4v/rT2xDfjM84ZG0gdpcH8sh
	rhwTWR6rV38bddL/g/Xd2K/GONy9bht4jMhP5yDTxr1lxHaXLAI6KXV7Xnm20wa9TXNbJeWt4VpEJ
	BpSoLoGydYqLvHCImZayGj06DdVBE2sr6JVpfIhFKYZBqzrd/vbIPeuh6yBUYMG1494SDgkBhVsjs
	CXoDwZgJi/EGyevrdbUAuJ54NMyeAux6fkWmbI5m8mHzBn7xVVsTHQvOWHppyMhvBX+RV8MCFUSC2
	fC52vtfWw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6Ojw-0005rx-TN; Mon, 01 Feb 2021 02:14:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6Ojt-0005rH-AL; Mon, 01 Feb 2021 02:14:54 +0000
X-UUID: 351e5c4f924d4cd5b2f1793367917246-20210131
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=OSHhhm/W19Y6B56K3//3peDiPN/C9u9TXy7oxQkRT3c=; 
 b=NLcOR43LRgHA4JMi7vPCuN7nzGT6rSZwyFu02vUSY3v0tn1AsILr1d8gm3qp7wEBCHGxANODFtU19dCCLRv06OXJQY9E8CORwl0H0KJW8FdSWD2ibecpqPsmbWpyqrxKF8fP1HmBKJYwnZ+8KLD70xXBbolstipvaskAV0A9ewk=;
X-UUID: 351e5c4f924d4cd5b2f1793367917246-20210131
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 941223478; Sun, 31 Jan 2021 18:14:47 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 31 Jan 2021 18:04:39 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 1 Feb 2021 10:04:35 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 1 Feb 2021 10:04:34 +0800
Message-ID: <1612145075.25113.7.camel@mhfsdcap03>
Subject: Re: [PATCH v7] usb: xhci-mtk: fix unreleased bandwidth data
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Mon, 1 Feb 2021 10:04:35 +0800
In-Reply-To: <YBPjJ8CCLcBjg42S@kroah.com>
References: <1611913099-25805-1-git-send-email-chunfeng.yun@mediatek.com>
 <YBPjJ8CCLcBjg42S@kroah.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 306A99247371E3F7DA2B90EE49997CA49BA06C6C3336BD45278E03C3B49E59BC2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210131_211453_771023_17533E25 
X-CRM114-Status: GOOD (  20.09  )
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
 Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tianping Fang <tianping.fang@mediatek.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Ikjoon Jang <ikjn@chromium.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2021-01-29 at 11:27 +0100, Greg Kroah-Hartman wrote:
> On Fri, Jan 29, 2021 at 05:38:19PM +0800, Chunfeng Yun wrote:
> > From: Ikjoon Jang <ikjn@chromium.org>
> > 
> > xhci-mtk needs XHCI_MTK_HOST quirk functions in add_endpoint() and
> > drop_endpoint() to handle its own sw bandwidth management.
> > 
> > It stores bandwidth data into an internal table every time
> > add_endpoint() is called, and drops those in drop_endpoint().
> > But when bandwidth allocation fails at one endpoint, all earlier
> > allocation from the same interface could still remain at the table.
> > 
> > This patch moves bandwidth management codes to check_bandwidth() and
> > reset_bandwidth() path. To do so, this patch also adds those functions
> > to xhci_driver_overrides and lets mtk-xhci to release all failed
> > endpoints in reset_bandwidth() path.
> > 
> > Fixes: 08e469de87a2 ("usb: xhci-mtk: supports bandwidth scheduling with multi-TT")
> > Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> > Changes in v7 from Chunfeng:
> > - rename xhci_mtk_droop_ep() as destroy_sch_ep(), and include parameters
> > - add member @allocated in mu3h_sch_ep_info struct
> >   used to skip endpoint not allocated bandwidth
> > - use xhci_dbg() instead of dev_dbg()
> > - rename bw_ep_list_new as bw_ep_chk_list
> 
> As a previous version of this patch is already in my public tree, just
> send a follow-on patch that resolves the issues in the previous one, as
> I can not apply this one.  Bonus is that you get the credit for fixing
> these issues :)
Ok, thanks

> 
> thanks,
> 
> greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
