Return-Path: <SRS0=uv63=QA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36ECFC433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Nov 2021 08:20:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF895610F7
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Nov 2021 08:19:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CF895610F7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VzpJhmaahQkVSOYmJy5bUkD9KlwMmCXBDjiVT99Q7BA=; b=IxwfBLX7bgdDMK
	MotlIdiQFapqQI0wkS7dMFoQI2XzGRXa+ZTzzNV0QwqPYdXZpA/wicf9QjiYXgfGuMPO8qGVj3wSs
	7UyqiV6I+xjsUjiN+VqS1I+JFMQdtgPxrj/LvLeYry3T986fy2mRihy4ZaC6JwfGaq73sz3upB4Wd
	jtQKcV5FhjGtPLWxw3HFrko6ztXFwOWjbpLGVZTetRKK2cNXB8z5c//6NFiwgcZBqGsbcg2FERmhK
	3n4HtLfGpH93COXfYb4gyqE3Bbax5Vk3TpRtQFQq42JneVHivxd8kqyyKgWDCvK3WLnvWPm+SsZ5/
	FAwaextkDYm7ntETHSCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mloGJ-00CMfr-7m; Sat, 13 Nov 2021 08:19:47 +0000
Received: from smtprelay0043.hostedemail.com ([216.40.44.43]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mloG6-00CMeC-U4; Sat, 13 Nov 2021 08:19:36 +0000
Received: from omf20.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
 by smtprelay03.hostedemail.com (Postfix) with ESMTP id 8A8DA837F24D;
 Sat, 13 Nov 2021 08:19:31 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf20.hostedemail.com (Postfix) with ESMTPA id 7C4B780193D0; 
 Sat, 13 Nov 2021 08:19:30 +0000 (UTC)
Message-ID: <f4ac00433f64d0637f5bbcf19b631072bddad097.camel@perches.com>
Subject: Re: [PATCH] Staging: mt7621-dma: reindent to avoid '(' at the end
 of line
From: Joe Perches <joe@perches.com>
To: Greg KH <gregkh@linuxfoundation.org>, Liu Junqi <liujunqi@pku.edu.cn>
Cc: linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Sat, 13 Nov 2021 00:19:29 -0800
In-Reply-To: <YY9xD1K0cUpc5iCW@kroah.com>
References: <20211113052815.358793-1-liujunqi@pku.edu.cn>
 <YY9xD1K0cUpc5iCW@kroah.com>
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
X-Stat-Signature: k4wax484oj33isr6s7ng4qkrgrpfxddc
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: 7C4B780193D0
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/bjIbunX20jf5R9k4knLoAmPpVgNYPdLo=
X-HE-Tag: 1636791570-751348
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211113_001935_076415_E982FC49 
X-CRM114-Status: GOOD (  14.02  )
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

On Sat, 2021-11-13 at 09:02 +0100, Greg KH wrote:
> On Sat, Nov 13, 2021 at 01:28:15PM +0800, Liu Junqi wrote:
> > Fixed a coding style issue.

This isn't really a fix, but instead is a change to make
the code more like typical coding style.

> > diff --git a/drivers/staging/mt7621-dma/hsdma-mt7621.c b/drivers/staging/mt7621-dma/hsdma-mt7621.c
[]
> > @@ -455,9 +455,9 @@ static void mtk_hsdma_issue_pending(struct dma_chan *c)
> >  	spin_unlock_bh(&chan->vchan.lock);
> >  }
> >  
> > -static struct dma_async_tx_descriptor *mtk_hsdma_prep_dma_memcpy(
> > -		struct dma_chan *c, dma_addr_t dest, dma_addr_t src,
> > -		size_t len, unsigned long flags)
> > +static struct dma_async_tx_descriptor
> > +*mtk_hsdma_prep_dma_memcpy(struct dma_chan *c, dma_addr_t dest, dma_addr_t src,
> 
> No, this is now worse looking.  The original was not pretty, but better
> than this.

More typical would be to have the return value on a separate line
as using * on the start of a line is poor form in the kernel.

static struct dma_async_tx_descriptor *
mtk_hsdma_prep_dma_memcpy(struct dma_chan *c, dma_addr_t dest, dma_addr_t src,
			  size_t len, unsigned long flags)
{
	...
}


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
