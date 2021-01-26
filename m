Return-Path: <SRS0=aDjs=G5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FF8AC433E6
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jan 2021 14:12:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3824022B3B
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jan 2021 14:12:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3824022B3B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bNRvCaF+Na2NwwfdwVCLt6g3AC/xFE2+X1q7qSTYw5Q=; b=fIHZJ0O3jFDds7fHokcd4FleR
	zEcvKczdGeK0ApkCpwzBgUfPo9HKhJUsFF65IlZPumEaHH0kLXz7hV0bQaXglMpDd6wenGCZHipnR
	WtIipSyThOBG5aNWAUmpSlw1y0Op9yh/ikyeZH/bEhe67yX2OKdYTTSTEvN8jPQAnARmMrBH1cZzf
	kMCs0lMJxy/Igx6VLASDFwhuRSZT9PzOmt0IRTYjRCulexIKbMFRx+bWTLBNtcLbPxrkmhC7UoQPR
	xyFvxBXyMoRDqcV01xB6CJRKXPDqpTqEFP1W8mslRbuehd+xCHcI2eRQI94UiERno/P0xyGCJMj4d
	f2MwvRnfg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4P5C-0000Ue-BP; Tue, 26 Jan 2021 14:12:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4P4z-0000R2-9I; Tue, 26 Jan 2021 14:12:28 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3FBBC22B2C;
 Tue, 26 Jan 2021 14:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1611670343;
 bh=G8RbizNkdNhtYdbjdcp6CKdodVotlaNcKkCrkrgBOM4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RebdL0YABKv/TCxvi7C2gTeM2+0QKQEemTQWlYvunvF5ClLDr0dn/6NpKVgViC+yW
 BEj0iJ9GJRY8O3yXcKbITcIeI/SidE3xJ2cbdiMgzmjbLqYZFxUWAlIvkSMOd96LqI
 rre5pS6FU1M0YjFBWfPesiGrOCmP9mjr/LE4I8ME=
Date: Tue, 26 Jan 2021 15:12:21 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH v6] usb: xhci-mtk: fix unreleased bandwidth data
Message-ID: <YBAjRUSEd/6sCl4O@kroah.com>
References: <20210113180444.v6.1.Id0d31b5f3ddf5e734d2ab11161ac5821921b1e1e@changeid>
 <1611640920.3905.13.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1611640920.3905.13.camel@mhfsdcap03>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210126_091225_423026_3DFFA629 
X-CRM114-Status: GOOD (  11.60  )
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

On Tue, Jan 26, 2021 at 02:02:00PM +0800, Chunfeng Yun wrote:
> Hi Ikjoon,
> 
> Can I put this patch into my patch series about bandwidth scheduler?
> the series also include "[RFC PATCH v3 1/5] usb: xhci-mtk: improve
> bandwidth scheduling with multi-TT", put them together will help to fix
> dependence issue, meanwhile I try to build xhci-mtk-sch.c into
> xhci-mtk.ko instead of xhci-hcd.ko.

This should probably be merged now, first, as it fixes an issue that
showed up in 4.20 so this needs to be backported to older kernels.

Please rebase your future patches on top of this.

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
