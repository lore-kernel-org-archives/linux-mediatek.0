Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85876E6FE53
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Sep 2024 08:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TmO/jwRZ9wDG3Ah+Zs0yWac1dD02Q833aV6DukRkr2U=; b=DbiMTLLJ3GyrsQYyDBLL/BJIvp
	R18M8qgwwU7zXiiszKjx3T+/VK0PxCH4WdU7SrJEvnptqgAhWwKSMYMyS7ZO0g3QWOu7Kz+DmN4Sd
	sVdTzqIDiDYPYOpBQT40wC9nrXmiNSChgurTz+cV0ev6LeJYmaF89HjtTh8EzUoZXmy4NUFxuTTj/
	IhlGdUQG4LZ9CaW1TxYduOwOehII1cOuaB/w+GCEHgzWDBojUEPA6nRCV49bF5VDP+VPXB88AbxKa
	DPllqsJJOGmulcPP++w/LAFvpIXeoGYjIYIFgTQhu3EEOhjglMMGyG2foTpwF0nxy9ujOoZcNVg6w
	iZtrGMPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smqeH-0000000EdVl-0G9P;
	Sat, 07 Sep 2024 08:18:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smqdG-0000000EdOC-3Doa;
	Sat, 07 Sep 2024 08:17:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A20AD5C1360;
	Sat,  7 Sep 2024 08:17:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84B7CC4CEC2;
	Sat,  7 Sep 2024 08:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1725697041;
	bh=huYN6+MlW4CvxdcII51CVqGSD+IQZTvKcJcE+Wu8Tpk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NAXFqDdEXiYpfLW+ebN3NkO1UDKgBJyiF56peYQp+dxd6PzkZNmCKHFEd2siokpoX
	 2oNAjQO6S2QVy89MuxCM5Lh3VZ3ZwxBXWGoZtoymEJQyzMy9AdP4EJWMQBL/2dNuDS
	 z+/ClfuecoUhMLU0NrV4CImTbcbn+RFg4rOF337w=
Date: Sat, 7 Sep 2024 10:17:16 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Lin Ruifeng <linruifeng4@huawei.com>
Cc: b-liu@ti.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH -next] usb: musb: mediatek: Simplify code with
 dev_err_probe()
Message-ID: <2024090704-jingle-playroom-7411@gregkh>
References: <20240907075508.79889-1-linruifeng4@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240907075508.79889-1-linruifeng4@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240907_011723_224445_A2B6C149 
X-CRM114-Status: GOOD (  26.98  )
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

On Sat, Sep 07, 2024 at 03:55:08PM +0800, Lin Ruifeng wrote:
> The combination of dev_err() and the returned error code could be
> replaced by dev_err_probe() in driver's probe function. Let's,
> converting to dev_err_probe() to make code more simple.
> 
> Signed-off-by: Lin Ruifeng <linruifeng4@huawei.com>
> ---
>  drivers/usb/musb/mediatek.c | 27 +++++++++++----------------
>  1 file changed, 11 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/usb/musb/mediatek.c b/drivers/usb/musb/mediatek.c
> index 0a35aab3ab81..63c86c046b98 100644
> --- a/drivers/usb/musb/mediatek.c
> +++ b/drivers/usb/musb/mediatek.c
> @@ -416,10 +416,9 @@ static int mtk_musb_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	ret = of_platform_populate(np, NULL, NULL, dev);
> -	if (ret) {
> -		dev_err(dev, "failed to create child devices at %p\n", np);
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				"failed to create child devices at %p\n", np);
>  
>  	ret = mtk_musb_clks_get(glue);
>  	if (ret)
> @@ -448,23 +447,19 @@ static int mtk_musb_probe(struct platform_device *pdev)
>  		glue->role = USB_ROLE_NONE;
>  		break;
>  	default:
> -		dev_err(&pdev->dev, "Error 'dr_mode' property\n");
> -		return -EINVAL;
> +		return dev_err_probe(&pdev->dev, -EINVAL,
> +				"Error 'dr_mode' property\n");
>  	}
>  
>  	glue->phy = devm_of_phy_get_by_index(dev, np, 0);
> -	if (IS_ERR(glue->phy)) {
> -		dev_err(dev, "fail to getting phy %ld\n",
> -			PTR_ERR(glue->phy));
> -		return PTR_ERR(glue->phy);
> -	}
> +	if (IS_ERR(glue->phy))
> +		return dev_err_probe(dev, PTR_ERR(glue->phy),
> +				"fail to getting phy\n");
>  
>  	glue->usb_phy = usb_phy_generic_register();
> -	if (IS_ERR(glue->usb_phy)) {
> -		dev_err(dev, "fail to registering usb-phy %ld\n",
> -			PTR_ERR(glue->usb_phy));
> -		return PTR_ERR(glue->usb_phy);
> -	}
> +	if (IS_ERR(glue->usb_phy))
> +		return dev_err_probe(dev, PTR_ERR(glue->usb_phy),
> +				"fail to registering usb-phy\n");
>  
>  	glue->xceiv = devm_usb_get_phy(dev, USB_PHY_TYPE_USB2);
>  	if (IS_ERR(glue->xceiv)) {
> -- 
> 2.17.1
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

