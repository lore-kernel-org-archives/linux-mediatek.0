Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F10C8D3C927
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Oct 2024 04:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j8Igh/6IvzPQAQpSsK6rU33pFUeTm6llxlXdk0W6E3c=; b=DSg+nR6B4i1U4DI/EQQCrKZDwh
	vGOy/qsrt7meoPOGjLdMEof6q8zY26XGzecKanxd7Ezpr1rFRZQvpQYKEM9LutVj5Jsmt7PkgkfqZ
	jqOfTVZNVBIAIWI21iJOZQJO+fcLxCY/ed5D/Okdw9kPGl545sdrWvlbUiUUo/1LsMod4VK4iJFXn
	xRNy/UAAYLYO0Abii3hbGxKZw9ZVPzMRAq89pelye5nNK5Khq+JjqS4G9XY/uXyp4XXBXbW/BQY06
	QWBJP++q43XKT6tifvdViZTqHpkljBDW4rK7TkSegeF2YIt4vPpDBRr44XpFXsBY20kosXNgufsAJ
	OzQegEbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2NB2-00000004MdW-3QDW;
	Sun, 20 Oct 2024 04:04:24 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2N9B-00000004Lzn-2ReD;
	Sun, 20 Oct 2024 04:02:31 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-20cf3e36a76so33653185ad.0;
        Sat, 19 Oct 2024 21:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729396948; x=1730001748; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j8Igh/6IvzPQAQpSsK6rU33pFUeTm6llxlXdk0W6E3c=;
        b=fRdnhZXaidvjrttdgCjKEL7XVZrinVG7VO17Yx07tPKvl3oN/6o/alm8+XEMpXVdVK
         uUp5uywF2E7G4wkMmo5sKyNhrWa00wNdRD5J9xtWlAyrfw/WhcUG5/Eb9KAfctLOchns
         OsiSucAkMQz+K1xdKgh0PilofZL7gcFR3XkZsVhNVX4QsLTxNtIXNEOnyUgtQHXThvJ+
         H4EbQFi93ftkyx5xJfGCI1NHJ5SgKdQZlENJtQruUqe89tHMWqaOFdYmWykkwDF0cO0N
         7dHD1qH3lU/j0RzMZR/NUjAu/65ZtGol6jWiVrYsaqNeiVuodlaaD+LCopfFQ8ZEBZx5
         3tRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729396948; x=1730001748;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j8Igh/6IvzPQAQpSsK6rU33pFUeTm6llxlXdk0W6E3c=;
        b=RMbiYZh9EMWPb4hKDxTn5ZRO+P3rWynQOstVGwWySoWovnsWacRW1vrHVaPWkk69V+
         oMF7cW0CwRPXOeB5L3+jDloya9yYaSsjOPxBSfoqdh4hIgdmQZANYm8yggXNHfZrhfnW
         5PhmashgelOwJKLs6BxYcWEIdof3I8Z+SlUepAzHAe2IxZGG3B56xSQalmc3frZhNEpz
         w1iiZiYp1p5jFpiHCM//4QKMg6L4YBiJ2ZCrSzinilplXFyCmFh6xt4mAWhAwoyH7Keo
         xL9solCUZcMIZe4tB870JE9ixu2mKp9hy/4YtTczHKuOSzTp7NsSL+jReVbYfCif4ME0
         hJTw==
X-Forwarded-Encrypted: i=1; AJvYcCUDQXgIaQzRtJGDUF2nl+pGVndhK1tI+k3/VmL32qGBQOaFAB0wLqV5d17TcRvuT41anmdlPzWgfxgWyjqvS0g=@lists.infradead.org, AJvYcCVD5oihOVtsTmQkm9SPxmyJG6qJSK/e4buHMemp2quec+25IRjvMREmO5MZxtpYj0W9aNw2cd1W4B9hY15mAB4L@lists.infradead.org, AJvYcCWo574X7nqfhZswZuiqOMUPyxT57xMt/3x+taJCcGW8JV7MJQFRgEliJ9RTgVmtqn8UqjyH6ZNsEYFzw80DJ2lI+g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2mnQELzTEGKLZfs1lp1pf+MByPBHRJpOvNvCgMRJNj5H+pPEv
	S3cesv/BDaOsw8YOmcwC23K4txNcCJd0hVaDzFkfn+i/Mrm2gYMI
X-Google-Smtp-Source: AGHT+IGmRe4gQ21zX8zFRCJZgS26LdpMMQu5DBpW8q3ltXUlMNmmTnmFWbMA1K68qw41N+h09JW/dg==
X-Received: by 2002:a17:902:f68f:b0:20c:ce1f:13bd with SMTP id d9443c01a7336-20e5a75a5b9mr92035705ad.18.1729396948526;
        Sat, 19 Oct 2024 21:02:28 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:2ce:a853:5ea4:fdb6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7eaeab581b1sm519692a12.45.2024.10.19.21.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 21:02:28 -0700 (PDT)
Date: Sat, 19 Oct 2024 21:02:25 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH 03/10] Input: sun4i-lradc-keys - switch to
 for_each_child_of_node_scoped
Message-ID: <ZxSA0YF3f7Q86pRV@google.com>
References: <20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com>
 <20241010-input_automate_of_node_put-v1-3-ebc62138fbf8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010-input_automate_of_node_put-v1-3-ebc62138fbf8@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241019_210229_668274_E7724BFA 
X-CRM114-Status: GOOD (  19.19  )
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

On Thu, Oct 10, 2024 at 11:25:53PM +0200, Javier Carrasco wrote:
> Use the scoped variant of the macro to simplify the code and error
> handling. This makes the error handling more robust by ensuring that
> the child node is always freed.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
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

I wonder if it would not be better to return the real error rather than
clobber it with -EINVAL, but I guess this should be a separate patch.

Applied, thank you.

-- 
Dmitry

