Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF08EC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Nov 2022 02:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zeEeQzOLbuhLXMeko+8qYQmX09d1tk4TKJlbQVgTC6U=; b=hktGWB5YB/GlWf5HHPV6rexqse
	Uq4/k7W6PJAYgQ8m3Q9V7VrOVNxAy16lQgwI6f1/TteYghuUQGAlMZFES5xumw9XD6g/SkUXAe3qS
	u9FqE/o7OtsDM947xpF2YkDg6qA3JrDXlIYedXcjjsogA5K+HainHp4NpiKuLhrFd3N1uZCgMc+2w
	v86cNFEV381l9011egRDj5XYsXe+dm5hZd+9DjJIMCTvKccw9cYC0l3XqiWqQ+IevI3bnTKjm7Omz
	LMoDEnABVfIFuVOsulHRU8PoD2Kntx1S5Df2cmRXWoUnb7l5o7gCLI4VVj8bGceQPZmCVYSDDsMbT
	vyRVTLeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Cbq-00C4zY-8a; Wed, 30 Nov 2022 02:14:02 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Cbl-00C4xT-AI
	for linux-mediatek@lists.infradead.org; Wed, 30 Nov 2022 02:13:59 +0000
Received: by mail-pl1-x632.google.com with SMTP id w23so15247199ply.12
        for <linux-mediatek@lists.infradead.org>; Tue, 29 Nov 2022 18:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zeEeQzOLbuhLXMeko+8qYQmX09d1tk4TKJlbQVgTC6U=;
        b=nkTWkiKt+w6VWANDSfpXOX1y7/FO+KxF8COOfHXa4oWqCNBM+BDPOc3cN21WlhAZQc
         GuwaySakbMcWJPTUKUIrOoK/d8JxVMwhgs5qSIpYJJYTSIXtZxhgOtV8Kh70i5HgSoSP
         XAJnU2aPSakeUdSCc43zM480yRq45nUTZZ9yaJXtpAYXUzlB23v2NOQlPE5lNBEO+X7F
         PeiMfW5zjaUa/q2jO1ADmCyXk3wYkuYpTTJQc/BLFPWEw/T0SCU5Ctvd+PI91lhT5AuU
         wj9rO8qkw5CTSnI3RFM2pQn3yvnukHgGY9mWKOuTbSBZFOca5oFEbljnN59k5aaVG8+E
         +LDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zeEeQzOLbuhLXMeko+8qYQmX09d1tk4TKJlbQVgTC6U=;
        b=JiwjJVzldTYMLcYTkSnWULSdDjn6OygKO8jmLbgsaw/editWP20g1VmqTEmjm9XGyU
         D1fbrJU31wDVEYqw752GPZZ5FIgWWuwlCuwrTFhndbIkNgKT7hwyLZlFsZ/A2DFOhc1K
         WcZCxeb9aw852VezTBSgR/L7iWXHK5vstIqxhqztfP7dx8D6c3nreijRGPy2gI8IgYkS
         N7KWMAe6wKgCYFjj2SFv1UYl4XvgRi+jJQLsNlLsCmJtYVlh8YuH33Lwyt7EeZluXfV9
         F8v9a/9dDjwsvUIY3d1Xfe9fUftnGOuPTrSKU8ynyVcFK7aPFpbmfkkjYaZqCSpMV2RM
         MmBg==
X-Gm-Message-State: ANoB5pktoaEmhrD1VrS+/RTO0IfY6F6yfLchMCPfVvJtYTDuAXaXhKy7
	94Ja8/gunnTHTzfll7fIEFDDY/0hQ6E=
X-Google-Smtp-Source: AA0mqf5RlzJWVQVKCgaOe8CnIAzZyOIBwk5/EH3oJpxp+q5WgIGh3a4ckzitt/rwdI/VpZWdxrBcuQ==
X-Received: by 2002:a17:902:a605:b0:189:680e:c2e5 with SMTP id u5-20020a170902a60500b00189680ec2e5mr23921887plq.51.1669774434454;
        Tue, 29 Nov 2022 18:13:54 -0800 (PST)
Received: from cyhuang-hp-elitebook-840-g3.rt ([2402:7500:486:4b30:18c:3eab:7c3:c142])
        by smtp.gmail.com with ESMTPSA id y7-20020aa78f27000000b0056bbeaa82b9sm155612pfr.113.2022.11.29.18.13.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Nov 2022 18:13:53 -0800 (PST)
Date: Wed, 30 Nov 2022 10:13:48 +0800
From: ChiYuan Huang <u0084500@gmail.com>
To: Yang Yingliang <yangyingliang@huawei.com>
Cc: lee@kernel.org, cy_huang@richtek.com, matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org, chiaen_wu@richtek.com,
	broonie@kernel.org
Subject: Re: [PATCH] mfd: mt6370: fix potential null-ptr-deref and uaf while
 removing device
Message-ID: <20221130021344.GA6282@cyhuang-hp-elitebook-840-g3.rt>
References: <20221128143601.1698148-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221128143601.1698148-1-yangyingliang@huawei.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_181357_386828_18621AA7 
X-CRM114-Status: GOOD (  29.37  )
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

On Mon, Nov 28, 2022 at 10:36:01PM +0800, Yang Yingliang wrote:
> I got the a UAF and a null-ptr-deref reports while
> doing module loading test:
> 
> ==================================================================
> BUG: KASAN: use-after-free in regulator_register.cold.70+0x191/0xe78
> Read of size 8 at addr ffff888118fb8c28 by task systemd-udevd/261
> 
> CPU: 2 PID: 261 Comm: systemd-udevd Tainted: G                 N 6.1.0-rc3+
> Call Trace:
>  <TASK>
>  dump_stack_lvl+0x67/0x83
>  print_report+0x178/0x4b0
>  kasan_report+0x90/0x190
>  regulator_register.cold.70+0x191/0xe78
>  devm_regulator_register+0x57/0xb0
>  mt6370_regulator_probe.cold.1+0xd8/0x222 [mt6370_regulator]
> 
> Allocated by task 261:
>  kasan_save_stack+0x1c/0x40
>  kasan_set_track+0x21/0x30
>  __kasan_kmalloc+0x7e/0x90
>  __kmalloc_node_track_caller+0x55/0x1b0
>  devm_kmalloc+0x5e/0x110
>  of_get_regulator_init_data+0x9e/0xd60
>  regulator_of_get_init_data+0x1a3/0x270
>  regulator_register+0x227/0x620
>  devm_regulator_register+0x57/0xb0
>  mt6370_regulator_probe.cold.1+0xd8/0x222 [mt6370_regulator]
> 
> Freed by task 250:
>  kasan_save_stack+0x1c/0x40
>  kasan_set_track+0x21/0x30
>  kasan_save_free_info+0x2a/0x50
>  __kasan_slab_free+0x102/0x190
>  __kmem_cache_free+0xca/0x400
>  release_nodes+0x9b/0xb9
>  devres_release_group.cold.10+0x5f/0x64
>  i2c_device_remove+0x60/0xf0
>  device_remove+0x73/0xc0
>  device_release_driver_internal+0x12d/0x210
>  bus_remove_device+0x1bd/0x240
>  device_del+0x357/0x770
>  i2c_unregister_device.part.22+0xe2/0x100
>  i2c_unregister_device+0x29/0x30
> ==================================================================
> 
> Here is how UAF happens:
> 
> CPU A				|CPU B
> mt6370_probe()			|
>   devm_mfd_add_devices()	|
> 				|mt6370_regulator_probe()
> 				|  regulator_register()
> 				|    //allocate init_data and add it to devres
> 				|    regulator_of_get_init_data()
> i2c_unregister_device()		|
>   device_del()			|
>     devres_release_all()	|
>       // init_data is freed	|
>       release_nodes()		|
> 				|  // using init_data causes UAF
> 				|  regulator_register()
> 
> While probing mt6370 regulator, the init_data is allocated in
> regulator_of_get_init_data(), and it's added to devres of
> device mt6370. When the device mt6370 is deleting, the devres
> is freed, then it causes a UAF in regulator_register().
> 
> ==================================================================
> BUG: kernel NULL pointer dereference, address: 0000000000000354
> CPU: 2 PID: 261 Comm: systemd-udevd Tainted: G    B            N 6.1.0-rc3+
> RIP: 0010:regmap_read+0x21/0xc0
> Call Trace:
>  <TASK>
>  regulator_get_voltage_sel_regmap+0x98/0x110
>  regulator_attr_is_visible+0x2da/0x4c0
>  internal_create_group+0x1f5/0x6b0
>  internal_create_groups.part.4+0x65/0xe0
>  sysfs_create_groups+0x24/0x50
>  device_add+0x5a9/0x1100
>  regulator_register.cold.70+0xb06/0xe78
>  devm_regulator_register+0x57/0xb0
>  mt6370_regulator_probe.cold.1+0xd8/0x222 [mt6370_regulator]
> ==================================================================
> 
> Here is how null-ptr-deref happens:
> 
> CPU A				|CPU B
> mt6370_probe()			|
>   // add regmap to devres	|
>   devm_regmap_init()		|
>   devm_mfd_add_devices()	|
> 				|
> i2c_unregister_device()		|
>   device_del()			|
>     devres_release_all()	|
>       // regmap is removed	|
>       remove_nodes()		|
> 				|mt6370_regulator_probe()
> 				|  regulator_register()
> 				|  // can't find regmap, it's NULL
> 				|  devm_get_regmap()
> 				|  device_add()
> 				|    // causes null-ptr-deref
> 				|    regulator_get_voltage_sel_regmap()
> 
> While probing mt6370 regulator, the mt6370 is deleting, the devres
> are removed including regmap, so in regulator_register() get a NULL
> regmap pointer, then it causes null-ptr-derf while using it in
> regulator_get_voltage_sel_regmap().
> 
> To fix theses races, switch to use non-devm function to add mfd
> devices, make removing child(regulator) devices earlier than
> freeing parent device resources, so the devres can not be freed
> until mt6370_regulator_probe() is finished.

It means the root cause is by 'mt6370-regulator', not mt6370 mfd driver.

Bucause there's no of_node for this regulator mfd cell.
That's why I directly use the parent dev (mt6370 i2c dev) to reuse
'regulator_of_get_init_data'

But I didn't notice this will cause the devres race condition.

To better solve it, I'll revise 'mt6370-regulator' code to
prevent this case by 'of_regulator_match' func.

Thanks for the issue reporting.

Best regards,
ChiYuan Huang.

> 
> Fixes: b2adf788e603 ("mfd: mt6370: Add MediaTek MT6370 support")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/mfd/mt6370.c | 34 ++++++++++++++++++++--------------
>  1 file changed, 20 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/mfd/mt6370.c b/drivers/mfd/mt6370.c
> index cf19cce2fdc0..dd19146612cf 100644
> --- a/drivers/mfd/mt6370.c
> +++ b/drivers/mfd/mt6370.c
> @@ -268,28 +268,33 @@ static int mt6370_probe(struct i2c_client *i2c)
>  	switch (vid) {
>  	case MT6370_VENID_MT6372P:
>  	case MT6370_VENID_MT6372CP:
> -		ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO,
> -					   mt6372_exclusive_devices,
> -					   ARRAY_SIZE(mt6372_exclusive_devices),
> -					   NULL, 0,
> -					   regmap_irq_get_domain(info->irq_data));
> +		ret = mfd_add_devices(dev, PLATFORM_DEVID_AUTO,
> +				      mt6372_exclusive_devices,
> +				      ARRAY_SIZE(mt6372_exclusive_devices),
> +				      NULL, 0,
> +				      regmap_irq_get_domain(info->irq_data));
>  		break;
>  	default:
> -		ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO,
> -					   mt6370_exclusive_devices,
> -					   ARRAY_SIZE(mt6370_exclusive_devices),
> -					   NULL, 0,
> -					   regmap_irq_get_domain(info->irq_data));
> +		ret = mfd_add_devices(dev, PLATFORM_DEVID_AUTO,
> +				      mt6370_exclusive_devices,
> +				      ARRAY_SIZE(mt6370_exclusive_devices),
> +				      NULL, 0,
> +				      regmap_irq_get_domain(info->irq_data));
>  		break;
>  	}
>  
>  	if (ret)
>  		return dev_err_probe(dev, ret, "Failed to add the exclusive devices\n");
>  
> -	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO,
> -				    mt6370_devices, ARRAY_SIZE(mt6370_devices),
> -				    NULL, 0,
> -				    regmap_irq_get_domain(info->irq_data));
> +	return mfd_add_devices(dev, PLATFORM_DEVID_AUTO,
> +			       mt6370_devices, ARRAY_SIZE(mt6370_devices),
> +			       NULL, 0,
> +			       regmap_irq_get_domain(info->irq_data));
> +}
> +
> +static void mt6370_remove(struct i2c_client *i2c)
> +{
> +	mfd_remove_devices(&i2c->dev);
>  }
>  
>  static const struct of_device_id mt6370_match_table[] = {
> @@ -304,6 +309,7 @@ static struct i2c_driver mt6370_driver = {
>  		.of_match_table = mt6370_match_table,
>  	},
>  	.probe_new = mt6370_probe,
> +	.remove = mt6370_remove,
>  };
>  module_i2c_driver(mt6370_driver);
>  
> -- 
> 2.25.1
> 
> 

