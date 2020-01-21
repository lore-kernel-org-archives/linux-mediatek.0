Return-Path: <SRS0=O6hk=3K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B518DC2D0CE
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jan 2020 15:24:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87E1D217F4
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jan 2020 15:24:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GZ/GL3k9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="eAEI4U3S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87E1D217F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+6AY8NZi09nvXaOxhVbXGLYpe0M0vzLZMfLNNxBEE8E=; b=GZ/GL3k9u06Wre
	xvC3ZYBYgW6XZylTsnTAmZydpj0GOeHfitUVpwla8VSmRPYi5aJR0Rq3qofF0aHPZJvkthC+k+jlg
	Km+RCBWgJx7MUPJBWx3pn6Z/ULec+U7F43giuHGTICBAN4CDCbYCEaoGdnLAfGM9ZFkRb+XGwq0FC
	A5ExMAwMCoPfvVNtOUe6ovaxsVEK1P4YErczgTv90jnouyWYYew7gIfoZn2h4SNr93AHYBDbORaXx
	fnsdROFeDfe+Ovquwou5HwcSdLIxLOPIttF4Oqrzns9K5ljkzE0ehS8rX3FKTASdp9SuguFg68wgN
	XT7PWBdPwyuPbxs03HeA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1itvNy-0002mR-QJ; Tue, 21 Jan 2020 15:24:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1itvNm-0002do-Ej; Tue, 21 Jan 2020 15:24:02 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E2516217F4;
 Tue, 21 Jan 2020 15:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579620237;
 bh=SPh9mzwvhAdkUs6vC0kUWXdfIIlM4+eJLXXJUm9Egv0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eAEI4U3SGvRtfioj899ov7S10ysziOtVUxEcw3jlCpLyG7LVWy/xExHC9Vxlin9s2
 vbejJPuMBoxi2D/6GTwXEOhNsd8EiQ8q/RRAX920lIjv1B4PDWrrvOUzl5US6VABXk
 bRXoGZUYWbrMIJw5+PlHp+kLqXerqaP4sNJudB8w=
Date: Tue, 21 Jan 2020 16:23:55 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sandesh Kenjana Ashok <sandeshkenjanaashok@gmail.com>
Subject: Re: [PATCH] staging: mt7621-pinctrl: Align to fix warnings of line
 over 80 characters
Message-ID: <20200121152355.GB572414@kroah.com>
References: <20200121134705.GA28240@SandeshPC>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200121134705.GA28240@SandeshPC>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200121_072358_513842_4D18F505 
X-CRM114-Status: GOOD (  14.81  )
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
Cc: Matthias Brugger <matthias.bgg@gmail.com>, devel@driverdev.osuosl.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jan 21, 2020 at 02:47:05PM +0100, Sandesh Kenjana Ashok wrote:
> Issue found by checkpatch.
> 
> Signed-off-by: Sandesh Kenjana Ashok <sandeshkenjanaashok@gmail.com>
> ---
>  drivers/staging/mt7621-pinctrl/pinctrl-rt2880.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/mt7621-pinctrl/pinctrl-rt2880.c b/drivers/staging/mt7621-pinctrl/pinctrl-rt2880.c
> index d0f06790d38f..df5da5fce630 100644
> --- a/drivers/staging/mt7621-pinctrl/pinctrl-rt2880.c
> +++ b/drivers/staging/mt7621-pinctrl/pinctrl-rt2880.c
> @@ -159,7 +159,8 @@ static int rt2880_pmx_group_enable(struct pinctrl_dev *pctrldev,
>  }
>  
>  static int rt2880_pmx_group_gpio_request_enable(struct pinctrl_dev *pctrldev,
> -						struct pinctrl_gpio_range *range,
> +						struct pinctrl_gpio_range
> +						*range,

Ick, that looks worse now, right?  checkpatch is a guideline, not a
hard-and-fast rule here.

>  						unsigned int pin)
>  {
>  	struct rt2880_priv *p = pinctrl_dev_get_drvdata(pctrldev);
> @@ -218,10 +219,10 @@ static int rt2880_pinmux_index(struct rt2880_priv *p)
>  	p->func_count++;
>  
>  	/* allocate our function and group mapping index buffers */
> -	f = p->func = devm_kcalloc(p->dev,
> -				   p->func_count,
> -				   sizeof(struct rt2880_pmx_func),
> -				   GFP_KERNEL);
> +	f = p->func;
> +	p->func =  devm_kcalloc(p->dev, p->func_count,
> +				sizeof(struct rt2880_pmx_func), GFP_KERNEL);
> +

You broke the code here :(

Please learn a bit more about how C works before attempting to work on
kernel code.

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
