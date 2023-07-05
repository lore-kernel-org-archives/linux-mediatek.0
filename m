Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBC80EB64DD
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Jul 2023 07:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Yd8zDXEq3RULaEPp/Ek0WVAglGv03EXJSXY4CsHXuE=; b=nC2pOqwwowbKl/n9ov3Gv7Ml8H
	7wYP7OPoovgsabXIV87WwTFnxj1KJtKqIG1/zyqDPDIvO7lLglO5VBM3jIcM8ZbiIPnLvX6FG7smL
	BOlhSxOE0j8/AvSHkJaw1ftBYgH8L4XwI90SIdV0NHSFl+MJj7d5540vcXZANHtC93tYPHUHs3FKP
	YL7ObrOoeysciy6XqjtH3envqrOLG82TT4EPgP/ofwYJuKxkiT/UFhT59g3UB7WwqvS5PpqKkr4hY
	TpwTdwTAHWFBaB1pueh+gZZoz4kWVuDo2BYFNmCj1HtvIoMt2qBNHWILARdLXp/tkkSQnwflVqNLY
	xgLwHHFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGwkS-00F1Jy-2I;
	Wed, 05 Jul 2023 07:16:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGwkP-00F1JA-1h;
	Wed, 05 Jul 2023 07:16:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0B13E6143D;
	Wed,  5 Jul 2023 07:16:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24B7BC433C8;
	Wed,  5 Jul 2023 07:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1688541380;
	bh=o58/JqrKgnTTM59z0X9VKVpJhnUEaXu99mh7Van6qxo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=miagon6woTT1uw7fg/JNoEkEawgoRNFkjSS6kH++z2O8gB6wAsrWi7STLDEuM5dVK
	 EtPAQHC4Vt0OHyYBrU77zZjCdFl+axL9cwmwUiLQycc8KCR3wVRUBpkhIxlceko5Yc
	 qzgoYBe+EhhPREPEhZEZOBeTWkbDH7oFKpxaBiDA=
Date: Wed, 5 Jul 2023 08:16:18 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Yu Hao <yhao016@ucr.edu>
Cc: chunfeng.yun@mediatek.com, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: mtu3: Fix possible use-before-initialization bug
Message-ID: <2023070559-removable-emotion-70f1@gregkh>
References: <CA+UBctDxfb6+70+hzuXJ-gwb65E0uoNzXYEhpJT92sXr2CE7OA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+UBctDxfb6+70+hzuXJ-gwb65E0uoNzXYEhpJT92sXr2CE7OA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_001621_622281_012AB1B2 
X-CRM114-Status: GOOD (  25.05  )
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

On Tue, Jul 04, 2023 at 04:25:50PM -0700, Yu Hao wrote:
> The struct usb_ctrlrequest setup should be initialized in the function
> ep0_read_setup(mtu, &setup). However, inside that function,
> the variable count could be 0 and the struct usb_ctrlrequest setup
> is not initialized. But there is a read for setup.bRequestType.
> 
> Signed-off-by: Yu Hao <yhao016@ucr.edu>
> ---
>  drivers/usb/mtu3/mtu3_gadget_ep0.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/mtu3/mtu3_gadget_ep0.c
> b/drivers/usb/mtu3/mtu3_gadget_ep0.c
> index e4fd1bb14a55..67034fa515d0 100644
> --- a/drivers/usb/mtu3/mtu3_gadget_ep0.c
> +++ b/drivers/usb/mtu3/mtu3_gadget_ep0.c
> @@ -638,7 +638,7 @@ static int ep0_handle_setup(struct mtu3 *mtu)
>  __releases(mtu->lock)
>  __acquires(mtu->lock)
>  {
> -   struct usb_ctrlrequest setup;
> +   struct usb_ctrlrequest setup = {};
>     struct mtu3_request *mreq;
>     int handled = 0;
> 
> -- 
> 2.34.1

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

- Your patch is malformed (tabs converted to spaces, linewrapped, etc.)
  and can not be applied.  Please read the file,
  Documentation/process/email-clients.rst in order to fix this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

