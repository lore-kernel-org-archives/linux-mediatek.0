Return-Path: <SRS0=aDjs=G5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4961EC433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jan 2021 14:14:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12A0922B3B
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jan 2021 14:14:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12A0922B3B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vPTHrUo8pbcNfu5v61yOTmao5h+4cqkzBP10rptcOyA=; b=M2s76jmGxnFvoqwbDlKEhKjk7
	b2gSPdNpEkhKNPhLnksQzQU/yMUGE8IogKLl0thdgWeJEYMxZs7zynpoqPNpNNMJgr8PSBV6GTKiw
	SMf/OfIAAmdHR4SIGYfesaxh6ZXTPn78CYQbNNWF4qp3RG7Zb+p7IYUvkAJdE32v9gkeRDl2biWfi
	ssK767qFGsGRRRj7FLJvYQmNgBbiHg/6R1Hf4ilAdURMFGhPoTi3u/cb6zRX614XaPhyyzTfe5Pss
	mDNKG1bLCzqzZgNXRaARQ5JSHZs0F3JKRvf73iRRrEb97OezxR+P1ZzpZtv8Zwkea3f32nh0lNgw3
	CbUPf6ceQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4P6J-0000rF-9i; Tue, 26 Jan 2021 14:13:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4P69-0000oD-Ue; Tue, 26 Jan 2021 14:13:39 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 803C122B2C;
 Tue, 26 Jan 2021 14:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1611670417;
 bh=YSv766COdRK+Q4CGhJ/sDz3wlp4qOX56jT9mW35921o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F7FCjZJHnZTBPMEB26msNAJ7TxSzFLjs5ERZ9VKkLxzMgTsOLNAZbLAKa1//mQdOB
 PQLMbwLKOY97s3i0PyVSnNweYooJXxoPsJ/oKlJViVAbBSMpLcteifgaXeZY/qV1XB
 /2aac8JLw5Pp+o/knr8B8TwoifBK26ZyT1XolYMc=
Date: Tue, 26 Jan 2021 15:13:34 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ikjoon Jang <ikjn@chromium.org>,
	Mathias Nyman <mathias.nyman@intel.com>
Subject: Re: [PATCH v6] usb: xhci-mtk: fix unreleased bandwidth data
Message-ID: <YBAjjmpc4yPrpmgQ@kroah.com>
References: <20210113180444.v6.1.Id0d31b5f3ddf5e734d2ab11161ac5821921b1e1e@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210113180444.v6.1.Id0d31b5f3ddf5e734d2ab11161ac5821921b1e1e@changeid>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210126_091338_088575_5BF40E5C 
X-CRM114-Status: GOOD (  12.08  )
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
Cc: Zhanyong Wang <zhanyong.wang@mediatek.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tianping Fang <tianping.fang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Jan 13, 2021 at 06:05:11PM +0800, Ikjoon Jang wrote:
> xhci-mtk needs XHCI_MTK_HOST quirk functions in add_endpoint() and
> drop_endpoint() to handle its own sw bandwidth management.
> 
> It stores bandwidth data into an internal table every time
> add_endpoint() is called, and drops those in drop_endpoint().
> But when bandwidth allocation fails at one endpoint, all earlier
> allocation from the same interface could still remain at the table.
> 
> This patch moves bandwidth management codes to check_bandwidth() and
> reset_bandwidth() path. To do so, this patch also adds those functions
> to xhci_driver_overrides and lets mtk-xhci to release all failed
> endpoints in reset_bandwidth() path.
> 
> Fixes: 08e469de87a2 ("usb: xhci-mtk: supports bandwidth scheduling with multi-TT")
> Signed-off-by: Ikjoon Jang <ikjn@chromium.org>

Mathias, any objection to me taking this patch, or do you have others
being queued up for 5.11-final?

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
