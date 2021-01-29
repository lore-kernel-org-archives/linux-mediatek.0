Return-Path: <SRS0=ALEk=HA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD729C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 10:28:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A6C064EB2
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 10:28:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A6C064EB2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vOePL1y8P+towiyXDMcFuZvVU0enXmfAHLtViyuQOU0=; b=flmb4sNCC81dwBvlad65YmetO
	NlbNHX4ePFSkKDbNYbwCw1ut32GMPPDbHcB8cXNZUCxh9fzySkVJYWQUNgQvR5d8XBYiwBWTyeW5u
	A1NtY0uyJ13BEv0CToZjDbLnyqD5Ap0Y/wwrdlifqnF4AwbyfSadPs5Pr9AYL5ioaxEeDJnfUQoLZ
	KisIpp6Mvx8dXBjGI24gP0VpecVrclntgDXx1Oos5SlxH/dgP8st4GvkoPguoCJcmtcMUF7k/rQ6N
	hvNXjKdRV06BSLgT0b020XqgPsRy/HMuB8uwPHXmncVopv4SsZQUogvfl+r4axgpRoj6F+RfZpos5
	M209KiUfw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5R0T-0003fr-Lx; Fri, 29 Jan 2021 10:28:01 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5R0N-0003cs-1Q; Fri, 29 Jan 2021 10:27:56 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8D97A64EAE;
 Fri, 29 Jan 2021 10:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1611916074;
 bh=FiV4qFcEXKbaqyjtb5Fuz/QqIfhWpdMDxGSGl3xSD1Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rGNK36BmEZualpYDr6g8RA54jllDAdRCpW1UdSQeWmlwvxpS2KMxCQGbEWIdnLTFE
 iGM15PrfyGo1n5q+C1qmBgOpyXKCL19nkB5BA7pq0xMMLbNwP+WxUmORpm8jkaeI4l
 AP5LuNRn7UPleGreoEZy5GH9FUBxQNBbnVzMIPkQ=
Date: Fri, 29 Jan 2021 11:27:51 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH v7] usb: xhci-mtk: fix unreleased bandwidth data
Message-ID: <YBPjJ8CCLcBjg42S@kroah.com>
References: <1611913099-25805-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1611913099-25805-1-git-send-email-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_052755_171767_D41A2D44 
X-CRM114-Status: GOOD (  15.14  )
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

On Fri, Jan 29, 2021 at 05:38:19PM +0800, Chunfeng Yun wrote:
> From: Ikjoon Jang <ikjn@chromium.org>
> 
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
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> Changes in v7 from Chunfeng:
> - rename xhci_mtk_droop_ep() as destroy_sch_ep(), and include parameters
> - add member @allocated in mu3h_sch_ep_info struct
>   used to skip endpoint not allocated bandwidth
> - use xhci_dbg() instead of dev_dbg()
> - rename bw_ep_list_new as bw_ep_chk_list

As a previous version of this patch is already in my public tree, just
send a follow-on patch that resolves the issues in the previous one, as
I can not apply this one.  Bonus is that you get the credit for fixing
these issues :)

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
