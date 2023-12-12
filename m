Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F34EFC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Dec 2023 10:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EMS+t5OHiNQmrl+IJ1dXyaooUs1LhRs+fwfmmbpi2Ck=; b=DQ3IJt3zTxHQNXYZBD9qrBr1va
	XLstWv4M+ag1vfKOts/aAUpPSH1kOI/RzGqtNDeYaF3vNkbaw7hjq5PFrLzbNYwV9a3Oa9xD3s3Cw
	aD/PoOoGQsYICvKcHuCP1EPDxz6vXRyZYaXbtx0qRpGKkTEa+NSTHDm1iQDlgXe7DCbxVAxke1BZA
	x649vkbF9f0RoLgRzF/muSmzvcDCMPL31RjyETSkiIETAblnoaMJQgDvp9M0U1M8pwLcWuyRa1jdT
	sJxRTlJRKdvU8nZfcS+oZOh09Md9YIZnWWeu86zr5iXgRisi0LrUQzu/4GwPH1zw1OeKVY0B/sJ5e
	2pkmO/BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rD04c-00BJ8k-04;
	Tue, 12 Dec 2023 10:33:10 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rD04Z-00BJ88-09
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Dec 2023 10:33:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 5D264B81183;
	Tue, 12 Dec 2023 10:33:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6525FC433C8;
	Tue, 12 Dec 2023 10:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1702377184;
	bh=mE398c7jk9AvIxkEkHC4GzU5TspzQBYu7lYnUJsZEyk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nEGcQylXEfvsf5IxoXzgDn6PdeiN46WBGEHowzAvHvcd87Ie4PtfoBkhURrh3LwpF
	 rDvKnjhTdh0w4yQxyBRDdFE1zqiNdyBgvFK/FA/+ortmNTh2Sgh2+Q6hZ738qsgQbk
	 ifWzXUQ5HRwpIyxIY9s1R2eRxXBrJVscTY43WGW4=
Date: Tue, 12 Dec 2023 11:33:02 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: shitao <shitao@kylinos.cn>
Cc: alcooperx@gmail.com, chunfeng.yun@mediatek.com,
	justin.chen@broadcom.com, kernel-bot@kylinos.cn,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: udc: bdc: fix comment typo
Message-ID: <2023121251-attest-shout-cbaa@gregkh>
References: <2023121236-earful-email-ea09@gregkh>
 <20231212101955.3115267-1-shitao@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231212101955.3115267-1-shitao@kylinos.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_023307_239121_B0F55D42 
X-CRM114-Status: GOOD (  21.67  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Dec 12, 2023 at 06:19:55PM +0800, shitao wrote:
> Fix comment typo in bdc_core.c file.
> "dynamic" is misspelled as "dyanmic".
> 
> Reported-by: k2ci <kernel-bot@kylinos.cn>
> Signed-off-by: shitao <shitao@kylinos.cn>
> ---
>  drivers/usb/gadget/udc/bdc/bdc_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/udc/bdc/bdc_core.c b/drivers/usb/gadget/udc/bdc/bdc_core.c
> index 35a652807fca..874122f8baa3 100644
> --- a/drivers/usb/gadget/udc/bdc/bdc_core.c
> +++ b/drivers/usb/gadget/udc/bdc/bdc_core.c
> @@ -361,7 +361,7 @@ int bdc_reinit(struct bdc *bdc)
>  	return ret;
>  }
>  
> -/* Allocate all the dyanmic memory */
> +/* Allocate all the dynamic memory */
>  static int bdc_mem_alloc(struct bdc *bdc)
>  {
>  	u32 page_size;
> -- 
> 2.34.1
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
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

