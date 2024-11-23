Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF54E66882
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Nov 2024 19:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KlPy/CGqNCGcU4xj6O8ddrlXpc7JHUlfmC6njU1qc/s=; b=VtjnhwJ+huqSeIMBQSs62278bJ
	AxCVzZzgf0pQigsH2YnHuJrhPhgya734RyuSmKE+qMxxWNJLhC3AonTMqoBSz3LjSrEcWo4eNxWr+
	Yl+SAEp86mSYJGeGtgs3nvMjpnpDrZxz3pJfFDoqMOh+nM36e3w7Za65ChqUzvZPRLocueqgwrpdH
	XJxOf8ShsF+dNW6T7kYsJ3VemUdH7ieaM/yhJjW6kJl/y95YD8a9Ugg3skCpAhZCDy1/ApwMWRzxW
	ToHhHL3KZA4svJSFlnjo98uX0K5/ZcUhZj5bVSHFYx9IePHRzaX0Qk8CuxMnf3rk9M4yEu0svw9u9
	tTGaXP0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEw7K-00000004oPK-43jV;
	Sat, 23 Nov 2024 19:48:30 +0000
Received: from fgw20-7.mail.saunalahti.fi ([62.142.5.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEw6X-00000004oHi-1RdR
	for linux-mediatek@lists.infradead.org;
	Sat, 23 Nov 2024 19:47:42 +0000
Received: from localhost (88-113-25-143.elisa-laajakaista.fi [88.113.25.143])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id cada6636-a9d3-11ef-a0f6-005056bdfda7;
	Sat, 23 Nov 2024 21:47:38 +0200 (EET)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 23 Nov 2024 21:47:37 +0200
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
Subject: Re: [PATCH 11/18] leds: max77650: switch to
 device_for_each_child_node_scoped()
Message-ID: <Z0IxWdV8ZWhJ5Pp4@surfacebook.localdomain>
References: <20240927-leds_device_for_each_child_node_scoped-v1-0-95c0614b38c8@gmail.com>
 <20240927-leds_device_for_each_child_node_scoped-v1-11-95c0614b38c8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240927-leds_device_for_each_child_node_scoped-v1-11-95c0614b38c8@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241123_114741_547064_52FF3232 
X-CRM114-Status: GOOD (  12.08  )
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

Fri, Sep 27, 2024 at 01:21:02AM +0200, Javier Carrasco kirjoitti:
> Switch to device_for_each_child_node_scoped() to simplify the code by
> removing the need for calls to fwnode_handle_put() in the error paths.
> 
> This also prevents possible memory leaks if new error paths are added
> without the required call to fwnode_handle_put().
> 
> After switching to the scoped variant, there is no longer need for a
> jump to 'err_node_out', as an immediate return is possible.

...

>  		rv = fwnode_property_read_u32(child, "reg", &reg);
> -		if (rv || reg >= MAX77650_LED_NUM_LEDS) {
> -			rv = -EINVAL;
> -			goto err_node_put;
> -		}
> +		if (rv || reg >= MAX77650_LED_NUM_LEDS)
> +			return -EINVAL;

Again (yes, I know that is original issue, but with your series applied
it may be nicely resolved), shadowing error code. Should be

		if (rv)
			return rv;
		if (reg >= MAX77650_LED_NUM_LEDS)
			return -EINVAL;

-- 
With Best Regards,
Andy Shevchenko



