Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29AC5E69172
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Nov 2024 19:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pg8ARmV+VJILJW4rFmfiIZEwD9CYPnADjGn3ERUeOMQ=; b=v5iiqpL2ReAIPVQclW8NobN/lj
	Z24jKneWUdRhqLbu3DPH7aOyMOz1JKTTX7f6dM8CymkYR/E6qmlU2TuGwM7hIXrOKSxNpkaeW9tZX
	lQW5lc0c5vpDt1sqxvfinFcfpYX0c/fdg2WhMWtBnDDbmlU7C2lsQy4zRgveqOZbHYhUwYF0IsQBh
	dyRtAvi3HokPLWqLdMM+0Z3c9CNeapHcmc8uUfZ1O06hC9hgyFbwyJSZN03AbSo92RuChUkIL+WoR
	JnrIn42lcbkFX4nh51i98REXoJnKymNx5eShDfPS49uHHXdER/7cJ5U8uldp1LMbAjdfnKhlxXbnw
	BQU+lWbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEvuW-00000004mo4-0ybe;
	Sat, 23 Nov 2024 19:35:16 +0000
Received: from fgw20-7.mail.saunalahti.fi ([62.142.5.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEvtb-00000004mj3-2hRg
	for linux-mediatek@lists.infradead.org;
	Sat, 23 Nov 2024 19:34:20 +0000
Received: from localhost (88-113-25-143.elisa-laajakaista.fi [88.113.25.143])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id eb92df3f-a9d1-11ef-9b92-005056bd6ce9;
	Sat, 23 Nov 2024 21:34:14 +0200 (EET)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 23 Nov 2024 21:34:13 +0200
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Gene Chen <gene_chen@richtek.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 06/18] leds: el15203000: switch to
 device_for_each_child_node_scoped()
Message-ID: <Z0IuNZq3g_0q0TkU@surfacebook.localdomain>
References: <20240927-leds_device_for_each_child_node_scoped-v1-0-95c0614b38c8@gmail.com>
 <20240927-leds_device_for_each_child_node_scoped-v1-6-95c0614b38c8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240927-leds_device_for_each_child_node_scoped-v1-6-95c0614b38c8@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241123_113419_828506_3EA51713 
X-CRM114-Status: GOOD (  12.87  )
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

Fri, Sep 27, 2024 at 01:20:57AM +0200, Javier Carrasco kirjoitti:
> Switch to device_for_each_child_node_scoped() to simplify the code by
> removing the need for calls to fwnode_handle_put() in the error paths.
> 
> This also prevents possible memory leaks if new error paths are added
> without the required call to fwnode_handle_put().
> 
> After switching to the scoped variant, there is no longer need for a
> jump to 'err_child_out', as an immediate return is possible.

...

>  		if (ret) {
>  			dev_err(priv->dev, "LED without ID number");
> -			goto err_child_out;
> +			return ret;

Now

			return dev_err_probe(...);

>  		}
>  
>  		if (led->reg > U8_MAX) {
>  			dev_err(priv->dev, "LED value %d is invalid", led->reg);
> -			ret = -EINVAL;
> -			goto err_child_out;
> +			return -EINVAL;

Ditto.

>  		}

>  			dev_err(priv->dev,
>  				"failed to register LED device %s, err %d",
>  				led->ldev.name, ret);
> -			goto err_child_out;
> +			return ret;

Ditto.

			return dev_err_probe(priv->dev, ret, "failed to register LED device %s\n",
				led->ldev.name);

...

Also notice missed '\n' at the end of the strings (and yes, I know
that it's not a problem for dev_*() macros, but still...).

-- 
With Best Regards,
Andy Shevchenko



