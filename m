Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF2E6E784B8
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Oct 2023 14:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+NnmpsGvayd/gABxBPysi49ASjWA69obkOyILmV3YXI=; b=F9ERt7pffiWHQKnxEErz+yYZCp
	GMN1QAbgapY5sdGAj5mBrAPg3dWBaAoOlFDYcdSQPUIEEJFCtietjN7sm48iITFeVTQQOqiaATWzh
	Z0UQVZfsVR7L5sxWx/6JAv0UPbicXSyUwqaHURh14QFkmEta25l+6B2i6O99PY+QAYcY5ceNMyTuI
	MajBI+K0NhlBj9A/VRN1mmo+YgbmAyzq86EGO4prVoX35wk9sXv+d6K9VuolvPi5Jc/i2D1DiTOmr
	ANzxNnh9TmoiY9r/NuLKHVO6Z6o8JF0aKPc2Hc+0sg1FmNm67/VOduE/NpqLSlVvstWm4eW3cD8HO
	eNZGEQ0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnK5U-00CtrW-1Z;
	Mon, 02 Oct 2023 14:39:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnK5R-00Ctqw-0h
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Oct 2023 14:39:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1BBE360F08;
	Mon,  2 Oct 2023 14:39:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34E24C433C8;
	Mon,  2 Oct 2023 14:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696257590;
	bh=mfetEKQLfVvOsbkQ2Cy6lZWuc5c3sKvX7rQKRBDc538=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qhMrkH+9QTbAsa6GPqtCgY3pJ+2VLDzOjfIJX2snnANn6BHEvlA//XS4DZQn/00vX
	 GSgyNlCl3UvdW0IbKK8z2z/mEgP47qESqnMCwGNxpMP9RrO7i3wK9O/HekuGmzSdmD
	 VLCaI4KTc7k7D0FdNNuMoTLovqPUskRjJ0F+Xi7I=
Date: Mon, 2 Oct 2023 16:39:47 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org,
	linux-mediatek@lists.infradead.org, kernel@pengutronix.de
Subject: Re: [PATCH v2] usb: mtu3: Convert to platform remove callback
 returning void
Message-ID: <2023100219-variety-genre-befe@gregkh>
References: <20230914200251.919584-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230914200251.919584-1-u.kleine-koenig@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_073953_371198_7F9D4822 
X-CRM114-Status: GOOD (  31.33  )
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

On Thu, Sep 14, 2023 at 10:02:51PM +0200, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> The function mtu3_remove() can only return a non-zero value if
> ssusb->dr_mode is neiter USB_DR_MODE_PERIPHERAL nor USB_DR_MODE_HOST nor
> USB_DR_MODE_OTG. In this case however the probe callback doesn't succeed
> and so the remove callback isn't called at all. So the code branch
> resulting in this error path could just be dropped were it not for the
> compiler choking on "enumeration value 'USB_DR_MODE_UNKNOWN' not handled
> in switch [-Werror=switch]". So instead replace this code path by a
> WARN_ON and then mtu3_remove() be converted to return void trivially.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
> Changes since (implicit) v1 sent with Message-Id:
> 20230709163335.3458886-1-u.kleine-koenig@pengutronix.de:
> 
>  - Keep case USB_DR_MODE_UNKNOWN to cope for the compiler being called
>    with -Werror=switch.
>  - Rebase to a newer tree
> 
> Just to evaluate the options, I tried with a BUG_ON(ssusb->dr_mode ==
> USB_DR_MODE_UNKNOWN) before the switch, but even then gcc insists on the
> case label for this value.
> 
> Best regards
> Uwe
> 
>  drivers/usb/mtu3/mtu3_plat.c | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/mtu3/mtu3_plat.c b/drivers/usb/mtu3/mtu3_plat.c
> index 6f264b129243..18c6cf9a2d71 100644
> --- a/drivers/usb/mtu3/mtu3_plat.c
> +++ b/drivers/usb/mtu3/mtu3_plat.c
> @@ -451,7 +451,7 @@ static int mtu3_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> -static int mtu3_remove(struct platform_device *pdev)
> +static void mtu3_remove(struct platform_device *pdev)
>  {
>  	struct ssusb_mtk *ssusb = platform_get_drvdata(pdev);
>  
> @@ -469,8 +469,17 @@ static int mtu3_remove(struct platform_device *pdev)
>  		ssusb_gadget_exit(ssusb);
>  		ssusb_host_exit(ssusb);
>  		break;
> -	default:
> -		return -EINVAL;
> +	case USB_DR_MODE_UNKNOWN:
> +		/*
> +		 * This cannot happen because with dr_mode ==
> +		 * USB_DR_MODE_UNKNOWN, .probe() doesn't succeed and so
> +		 * .remove() wouldn't be called at all. However (little
> +		 * surprising) the compiler isn't smart enough to see that, so
> +		 * we explicitly have this case item to not make the compiler
> +		 * wail about an unhandled enumeration value.
> +		 */
> +		WARN_ON(1);

Please don't add new WARN_ON() calls to the kernel, print out a big
error message and return, don't reboot the machine.

thanks,

greg k-h

