Return-Path: <SRS0=cfj9=OV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35C02C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Oct 2021 15:22:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF8EE6115A
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Oct 2021 15:22:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DF8EE6115A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lBEqmQYvU5L9Xe11m4pOaixIS52TntJ3k8xh+h5zeR8=; b=G66GVUmf3KD/cN
	KfZ6Q47CGhOV/zJl0a60/8kTDhWX/Vq+pov6dXvb18fDBDIg+ZSe9jnestZz2X0kCBJ7IZra10sv2
	Ml8VkjbEC9ftK3hoxZseHzKXSexFhX34zjwvR7obvVn4tWRGRbDcko6Ol9EkOmDkQ/qvWGNL/dzmt
	9tAxcaV4ijtyGCIQJgVOanUxtFb1lodlyS5NEQ4esNVYnG7X1Q/u/SRICgql7+dkQUF7FZ5zmABxF
	A3iDmqMqCirMnvehu13qT2wuUEstXfLTxJNf6w/cQihuQm31XLBKdttJKXCo6oT5Ik1zL6codf/qT
	M14VezG5mI/jz3FHzS4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mWKN3-000iUY-Pf; Fri, 01 Oct 2021 15:22:45 +0000
Received: from netrider.rowland.org ([192.131.102.5])
 by bombadil.infradead.org with smtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWKMq-000iNc-9F
 for linux-mediatek@lists.infradead.org; Fri, 01 Oct 2021 15:22:33 +0000
Received: (qmail 506376 invoked by uid 1000); 1 Oct 2021 11:22:26 -0400
Date: Fri, 1 Oct 2021 11:22:26 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Hayes Wang <hayeswang@realtek.com>
Cc: Oliver Neukum <oneukum@suse.com>,
 Jason-ch Chen <jason-ch.chen@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "Project_Global_Chrome_Upstream_Group@mediatek.com"
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 "hsinyi@google.com" <hsinyi@google.com>, nic_swsd <nic_swsd@realtek.com>
Subject: Re: [PATCH] r8152: stop submitting rx for -EPROTO
Message-ID: <20211001152226.GA505557@rowland.harvard.edu>
References: <20210929051812.3107-1-jason-ch.chen@mediatek.com>
 <cbd1591fc03f480c9f08cc55585e2e35@realtek.com>
 <4c2ad5e4a9747c59a55d92a8fa0c95df5821188f.camel@mediatek.com>
 <274ec862-86cf-9d83-7ea7-5786e30ca4a7@suse.com>
 <20210930151819.GC464826@rowland.harvard.edu>
 <3694347f29ed431e9f8f2c065b8df0a7@realtek.com>
 <5f56b21575dd4f64a3b46aac21151667@realtek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5f56b21575dd4f64a3b46aac21151667@realtek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211001_082232_493593_09C3D932 
X-CRM114-Status: GOOD (  17.36  )
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

On Fri, Oct 01, 2021 at 03:26:48AM +0000, Hayes Wang wrote:
> > Alan Stern <stern@rowland.harvard.edu>
> > [...]
> > > There has been some discussion about this in the past.
> > >
> > > In general, -EPROTO is almost always a non-recoverable error.
> > 
> > Excuse me. I am confused about the above description.
> > I got -EPROTO before, when I debugged another issue.
> > However, the bulk transfer still worked after I resubmitted
> > the transfer. I didn't do anything to recover it. That is why
> > I do resubmission for -EPROTO.
> 
> I check the Linux driver and the xHCI spec.
> The driver gets -EPROTO for bulk transfer, when the host
> returns COMP_USB_TRANSACTION_ERROR.
> According to the spec of xHCI, USB TRANSACTION ERROR
> means the host did not receive a valid response from the
> device (Timeout, CRC, Bad PID, unexpected NYET, etc.).

That's right.  If the device and cable are working properly, this 
should never happen.  Or only extremely rarely (for example, caused 
by external electromagnetic interference).

> It seems to be reasonable why resubmission sometimes works.

Did you ever track down the reason why you got the -EPROTO error 
while debugging that other issue?  Can you reproduce it?

Alan Stern

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
