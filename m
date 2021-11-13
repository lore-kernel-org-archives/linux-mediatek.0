Return-Path: <SRS0=uv63=QA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 423F4C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Nov 2021 13:37:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E51626056B
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Nov 2021 13:37:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E51626056B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A+ifM+ZzDrxyv1Rfnz9lSKqkWu1PJw1qHQAeHSPDRyk=; b=rbxv2cNVPoXheX
	bErcrFDZwCemk7m46yUBH/eOLywKbFbOZit8czv2vmZ0MNZu7W/voMNEIvOaaqf59l8opVjF385i8
	s0YCL4E9wy+kU7wh7RDZj5t/9OlSR7uCvs8HNuHZjlqTE1I/AXZBFCeHYTPTCt5WWVQ1ObCpTjEz5
	YrEXoezUYNkCTsrdglLypV+L9BtbxVdwp842GYwGPj02D6725Sfj9/Wn85tSZrb7ltvBc97Zz+Ho+
	vj80E6bTVqIk6mdoH5Ugi2xCoQCHA1qfU69YnVjhahN2dyXy9N0ltzvm12oJCc3B+2pNJvynNsCuV
	/Mq7CTs6WOAvGMvpC4Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mltDM-00ChqA-PZ; Sat, 13 Nov 2021 13:37:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mltDA-00ChoV-D1; Sat, 13 Nov 2021 13:36:53 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A3DBE61051;
 Sat, 13 Nov 2021 13:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1636810612;
 bh=fp6UseD2UeNDrdF0AZQ9E0WNms+itCAHyBOMUPTn4FQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PBCtDT2M2sXX9130lKj2Ls0vno8Q2iCDjF/EErvEKGcdLEbn9KMHYSPUpWU09DGuk
 AujUccIyaHKbdgqh4R3Q64An23gJyJHpbKdR/7KyOisltux/PNITj3EiVb31Vb4gU8
 7cEDyEzDzWepb1dVy8d0Qj3F5tKec/xcehMMxPoI=
Date: Sat, 13 Nov 2021 14:36:49 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Liu Junqi <liujunqi@pku.edu.cn>
Cc: linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: mt7621-dma: reindent to avoid '(' at the end
 of line
Message-ID: <YY+/cflE5fowvTg+@kroah.com>
References: <20211113132033.363916-1-liujunqi@pku.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211113132033.363916-1-liujunqi@pku.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211113_053652_487367_225E3303 
X-CRM114-Status: GOOD (  23.36  )
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

On Sat, Nov 13, 2021 at 09:20:34PM +0800, Liu Junqi wrote:
> A change to make the code more like typical coding style.
> 
> Signed-off-by: Liu Junqi <liujunqi@pku.edu.cn>
> ---
>  drivers/staging/mt7621-dma/hsdma-mt7621.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/mt7621-dma/hsdma-mt7621.c b/drivers/staging/mt7621-dma/hsdma-mt7621.c
> index 1424d01d434b..f303579bd1a2 100644
> --- a/drivers/staging/mt7621-dma/hsdma-mt7621.c
> +++ b/drivers/staging/mt7621-dma/hsdma-mt7621.c
> @@ -455,9 +455,9 @@ static void mtk_hsdma_issue_pending(struct dma_chan *c)
>  	spin_unlock_bh(&chan->vchan.lock);
>  }
>  
> -static struct dma_async_tx_descriptor *mtk_hsdma_prep_dma_memcpy(
> -		struct dma_chan *c, dma_addr_t dest, dma_addr_t src,
> -		size_t len, unsigned long flags)
> +static struct dma_async_tx_descriptor *
> +mtk_hsdma_prep_dma_memcpy(struct dma_chan *c, dma_addr_t dest, dma_addr_t src,
> +			  size_t len, unsigned long flags)
>  {
>  	struct mtk_hsdma_chan *chan = to_mtk_hsdma_chan(c);
>  	struct mtk_hsdma_desc *desc;
> -- 
> 2.32.0
> 
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/SubmittingPatches for what needs to be done
  here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
