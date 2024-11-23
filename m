Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AF49E66880
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Nov 2024 19:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1pzcTJwG9WcXay0jNHX9JqAvwk4neYrcZe7pOZVIiJY=; b=REnE+zC5ToF6ayAgj8U7FEMTMS
	pw+/KbZnA8/Jeg01wbfPmq3X9j9YzocTllUwLDS0WwaxktIIbwVZa7LtH+x2ViGAALIQzQXCbkVct
	Y8d5wAOnYeUESn4jKV0gct/d7Ji4UfbSIMQp/VhUKNPpbe59zcePlfj5eLFkjtXBwV2gjghX6KHNf
	ZBqdEdZ7tDqS6QPXPXdtHkcVr64XsNf5SKq4QBuNGYSnmSqj3iz8Ff/Vd4uYTWVzohpLTM3A8Ibz7
	Zj71OzmLT30Y4b2SYqlFlYOFgJ4HSiy1Ev36UTcmRXyjqtLIJp6e+tPdf9Cu8ZzVhv/XmLVWQygY3
	Z+8DXptg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEw0B-00000004nYQ-1xQu;
	Sat, 23 Nov 2024 19:41:07 +0000
Received: from fgw21-7.mail.saunalahti.fi ([62.142.5.82])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEvzH-00000004nU6-0jy1
	for linux-mediatek@lists.infradead.org;
	Sat, 23 Nov 2024 19:40:12 +0000
Received: from localhost (88-113-25-143.elisa-laajakaista.fi [88.113.25.143])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id bd3dc34a-a9d2-11ef-a0f6-005056bdfda7;
	Sat, 23 Nov 2024 21:40:06 +0200 (EET)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 23 Nov 2024 21:40:05 +0200
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
Subject: Re: [PATCH 16/18] leds: tca6507: switch to
 device_for_each_child_node_scoped()
Message-ID: <Z0IvleO2ag1ktM4c@surfacebook.localdomain>
References: <20240927-leds_device_for_each_child_node_scoped-v1-0-95c0614b38c8@gmail.com>
 <20240927-leds_device_for_each_child_node_scoped-v1-16-95c0614b38c8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240927-leds_device_for_each_child_node_scoped-v1-16-95c0614b38c8@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241123_114011_364058_53E42DDF 
X-CRM114-Status: UNSURE (   9.42  )
X-CRM114-Notice: Please train this message.
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

Fri, Sep 27, 2024 at 01:21:07AM +0200, Javier Carrasco kirjoitti:
> Switch to device_for_each_child_node_scoped() to simplify the code by
> removing the need for calls to fwnode_handle_put() in the error path.
> 
> This also prevents possible memory leaks if new error paths are added
> without the required call to fwnode_handle_put().

...

>  		ret = fwnode_property_read_u32(child, "reg", &reg);
> -		if (ret || reg >= NUM_LEDS) {
> -			fwnode_handle_put(child);
> +		if (ret || reg >= NUM_LEDS)
>  			return ERR_PTR(ret ? : -EINVAL);
> -		}

It's now two nested conditionals instead of two independent ones:

		if (ret)
			return ERR_PTR(ret);
		if (reg >= NUM_LEDS)
			return ERR_PTR(-EINVAL);

I believe my wariant is much better to read, understand, and maintain.

-- 
With Best Regards,
Andy Shevchenko



