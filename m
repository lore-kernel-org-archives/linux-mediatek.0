Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 539EFCFD354
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Oct 2024 11:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ljavxxGKKAm3GSVsD5lJ5uz4ljKEZIvQJpDMgna7Szw=; b=IhAg0LrdaLr3K/9B8ocjxMCW6i
	YocPku0Gyeb+GdFkZ94yPhuR8jX+r1kbwQBODj047jBe2WiLiz/38hSE3e+uwORBiJ8qtMcN4iuHJ
	/lnR5lNPKZPVTSHGJ52ii0bbLz5pwVgUkmQcxzyrpcXWJ5jppmfb3naoLZIWGsidj0g8LsH26zc7C
	qpgAwn3pkDdH9UwtrC3SEfRm94K0BteHZjU2oEatJaPBwyLTqt3HhE60/Bqkv7jVqBcXJwamBWNNl
	PxIDqwhoJH5qIm+b7RznvkFYLQYmFCVLoAmgseGpUzA6Z0FjzluRx0EH5CQnf2eE3DtsZiQHWOmd9
	nryB4ZCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szE6M-0000000GBXj-0A1g;
	Fri, 11 Oct 2024 11:46:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szD0q-0000000FzOp-1Z6C;
	Fri, 11 Oct 2024 10:36:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BBBCE497;
	Fri, 11 Oct 2024 03:37:14 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9B0EC3F73F;
	Fri, 11 Oct 2024 03:36:42 -0700 (PDT)
Date: Fri, 11 Oct 2024 11:36:32 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Hans de Goede
 <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Florian
 Fainelli <florian.fainelli@broadcom.com>, Broadcom internal kernel review
 list <bcm-kernel-feedback-list@broadcom.com>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH 03/10] Input: sun4i-lradc-keys - switch to
 for_each_child_of_node_scoped
Message-ID: <20241011113632.2eee613c@donnerap.manchester.arm.com>
In-Reply-To: <20241010-input_automate_of_node_put-v1-3-ebc62138fbf8@gmail.com>
References: <20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com>
	<20241010-input_automate_of_node_put-v1-3-ebc62138fbf8@gmail.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_033648_535519_BA0252E1 
X-CRM114-Status: GOOD (  16.84  )
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

On Thu, 10 Oct 2024 23:25:53 +0200
Javier Carrasco <javier.carrasco.cruz@gmail.com> wrote:

Hi,

> Use the scoped variant of the macro to simplify the code and error
> handling. This makes the error handling more robust by ensuring that
> the child node is always freed.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Looks good to me:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  drivers/input/keyboard/sun4i-lradc-keys.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/input/keyboard/sun4i-lradc-keys.c b/drivers/input/keyboard/sun4i-lradc-keys.c
> index f304cab0ebdb..f1e269605f05 100644
> --- a/drivers/input/keyboard/sun4i-lradc-keys.c
> +++ b/drivers/input/keyboard/sun4i-lradc-keys.c
> @@ -202,7 +202,7 @@ static void sun4i_lradc_close(struct input_dev *dev)
>  static int sun4i_lradc_load_dt_keymap(struct device *dev,
>  				      struct sun4i_lradc_data *lradc)
>  {
> -	struct device_node *np, *pp;
> +	struct device_node *np;
>  	int i;
>  	int error;
>  
> @@ -223,28 +223,25 @@ static int sun4i_lradc_load_dt_keymap(struct device *dev,
>  		return -ENOMEM;
>  
>  	i = 0;
> -	for_each_child_of_node(np, pp) {
> +	for_each_child_of_node_scoped(np, pp) {
>  		struct sun4i_lradc_keymap *map = &lradc->chan0_map[i];
>  		u32 channel;
>  
>  		error = of_property_read_u32(pp, "channel", &channel);
>  		if (error || channel != 0) {
>  			dev_err(dev, "%pOFn: Inval channel prop\n", pp);
> -			of_node_put(pp);
>  			return -EINVAL;
>  		}
>  
>  		error = of_property_read_u32(pp, "voltage", &map->voltage);
>  		if (error) {
>  			dev_err(dev, "%pOFn: Inval voltage prop\n", pp);
> -			of_node_put(pp);
>  			return -EINVAL;
>  		}
>  
>  		error = of_property_read_u32(pp, "linux,code", &map->keycode);
>  		if (error) {
>  			dev_err(dev, "%pOFn: Inval linux,code prop\n", pp);
> -			of_node_put(pp);
>  			return -EINVAL;
>  		}
>  
> 


