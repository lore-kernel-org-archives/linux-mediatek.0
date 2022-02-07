Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A94C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Feb 2022 10:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5xpm+SObStwuOagvPqsMsYdCAr0UsxIyH176QWYzRs0=; b=hn5d2Q4+l/Qsww
	3QS0tIqzznmR1RQrGmniIFKN6tBnyTsBP8ZFQovhubZ6ZRWsYuGb8olcoZBP3SXsdZnjCsZOeLzEL
	CeBeghIn0D/tmUkPAu3LjWj3seGGjUC6+pjTQ8prdWTUOnVc0uCB9Fklt+hliD4SpUly77kMgOfaC
	BqOeVJKW91Wf8kioJrkE4kcNVoGoH6rAjl0HLDpwYXd1GGm8or7KHxxQ85gQZ5dwFmVVtZrguShlO
	XON+DjccUf1ZdINXw1jEm64mBsrhsGtxmfAEYiErLq3Wf2DKYmH/C4XBYtq8LTFkioH0K7CjAmFOC
	2m/BW24e1etbxRvXhSmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nH0tx-009kRf-9L; Mon, 07 Feb 2022 10:05:41 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nH0or-009ifT-BC; Mon, 07 Feb 2022 10:00:27 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 47D961F43D76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644228021;
 bh=C6ahXcGBr3wYvchAhyVsk7tAn1/VzH+lrX2SOz7k5LU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=en+A+ujlU32xmni49UHQs2C5/vrYE7HalLjBIO4xXfMDnYOj1bjpDYOcdDTb+c/Ob
 2sBZ/f9AwZ7mkzWoCOTVsPVDTUnY8msojKcGtlc48aH0RCKoyW/a6gUvXHiboufPdQ
 u4kK/FepuqLnObZd9EljObZL5xhbKAsd/F4pN4wwEb+KCLAlFVY4Yj7OWKsfHWxHgs
 ZJuJMeQlHnLzRpkVLs+dyzr7+gVShpHsF8Cpm4aFbHBTJGcjzNgfMbzUQ9cbzz1g0k
 wIopPqak1XVIJNxkat+Y81V3Cvp+SjMuz/+D4exsoe8NRa6pgtRy7piosNJ5tWowwN
 z31K2vKS3GHFg==
Message-ID: <02d0dba2-ffc8-1bf1-d8a7-f7fa19f2c7ed@collabora.com>
Date: Mon, 7 Feb 2022 11:00:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH] usb: host: xhci-mtk: Simplify supplies handling with
 regulator_bulk
Content-Language: en-US
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org,
 matthias.bgg@gmail.com, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220118133348.111860-1-angelogioacchino.delregno@collabora.com>
 <91bb8078e2d0824c325eb3819e59cdcb65b68a4e.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <91bb8078e2d0824c325eb3819e59cdcb65b68a4e.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220207_020025_807476_24766B58 
X-CRM114-Status: GOOD (  21.69  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 20/01/22 07:50, Chunfeng Yun ha scritto:
> On Tue, 2022-01-18 at 14:33 +0100, AngeloGioacchino Del Regno wrote:
>> Remove the custom functions xhci_mtk_ldos_{enable,disable}() by
>> switching to using regulator_bulk to perform the very same thing,
>> as the regulators are always either both enabled or both disabled.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <
>> angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/usb/host/xhci-mtk.c | 56 ++++++++++++-----------------------
>> --
>>   drivers/usb/host/xhci-mtk.h |  4 +--
>>   2 files changed, 20 insertions(+), 40 deletions(-)
>>
>> diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-
>> mtk.c
>> index 62c835d446be..3b81931e5b77 100644
>> --- a/drivers/usb/host/xhci-mtk.c
>> +++ b/drivers/usb/host/xhci-mtk.c
>> @@ -395,31 +395,6 @@ static int xhci_mtk_clks_get(struct xhci_hcd_mtk
>> *mtk)
>>   	return devm_clk_bulk_get_optional(mtk->dev, BULK_CLKS_NUM,
>> clks);
>>   }
>>   
>> -static int xhci_mtk_ldos_enable(struct xhci_hcd_mtk *mtk)
>> -{
>> -	int ret;
>> -
>> -	ret = regulator_enable(mtk->vbus);
>> -	if (ret) {
>> -		dev_err(mtk->dev, "failed to enable vbus\n");
>> -		return ret;
>> -	}
>> -
>> -	ret = regulator_enable(mtk->vusb33);
>> -	if (ret) {
>> -		dev_err(mtk->dev, "failed to enable vusb33\n");
>> -		regulator_disable(mtk->vbus);
>> -		return ret;
>> -	}
>> -	return 0;
>> -}
>> -
>> -static void xhci_mtk_ldos_disable(struct xhci_hcd_mtk *mtk)
>> -{
>> -	regulator_disable(mtk->vbus);
>> -	regulator_disable(mtk->vusb33);
>> -}
>> -
>>   static void xhci_mtk_quirks(struct device *dev, struct xhci_hcd
>> *xhci)
>>   {
>>   	struct usb_hcd *hcd = xhci_to_hcd(xhci);
>> @@ -475,6 +450,10 @@ static int xhci_mtk_setup(struct usb_hcd *hcd)
>>   	return ret;
>>   }
>>   
>> +static const char * const xhci_mtk_supply_names[] = {
>> +	"vusb33", "vbus",
>> +};
>> +
>>   static const struct xhci_driver_overrides xhci_mtk_overrides
>> __initconst = {
>>   	.reset = xhci_mtk_setup,
>>   	.add_endpoint = xhci_mtk_add_ep,
>> @@ -507,17 +486,18 @@ static int xhci_mtk_probe(struct
>> platform_device *pdev)
>>   		return -ENOMEM;
>>   
>>   	mtk->dev = dev;
>> -	mtk->vbus = devm_regulator_get(dev, "vbus");
>> -	if (IS_ERR(mtk->vbus)) {
>> -		dev_err(dev, "fail to get vbus\n");
>> -		return PTR_ERR(mtk->vbus);
>> -	}
>> +	mtk->num_supplies = ARRAY_SIZE(xhci_mtk_supply_names);
>> +	mtk->supplies = devm_kcalloc(dev, mtk->num_supplies,
>> +				     sizeof(*mtk->supplies),
>> GFP_KERNEL);
>> +	if (!mtk->supplies)
>> +		return -ENOMEM;
>>   
>> -	mtk->vusb33 = devm_regulator_get(dev, "vusb33");
>> -	if (IS_ERR(mtk->vusb33)) {
>> -		dev_err(dev, "fail to get vusb33\n");
>> -		return PTR_ERR(mtk->vusb33);
>> -	}
>> +	regulator_bulk_set_supply_names(mtk->supplies,
>> xhci_mtk_supply_names,
>> +					mtk->num_supplies);
>> +
>> +	ret = devm_regulator_bulk_get(dev, mtk->num_supplies, mtk-
>>> supplies);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to get
>> regulators\n");
>>   
>>   	ret = xhci_mtk_clks_get(mtk);
>>   	if (ret)
>> @@ -558,7 +538,7 @@ static int xhci_mtk_probe(struct platform_device
>> *pdev)
>>   	pm_runtime_enable(dev);
>>   	pm_runtime_get_sync(dev);
>>   
>> -	ret = xhci_mtk_ldos_enable(mtk);
>> +	ret = regulator_bulk_enable(mtk->num_supplies, mtk->supplies);
>>   	if (ret)
>>   		goto disable_pm;
>>   
>> @@ -667,7 +647,7 @@ static int xhci_mtk_probe(struct platform_device
>> *pdev)
>>   	clk_bulk_disable_unprepare(BULK_CLKS_NUM, mtk->clks);
>>   
>>   disable_ldos:
>> -	xhci_mtk_ldos_disable(mtk);
>> +	regulator_bulk_disable(mtk->num_supplies, mtk->supplies);
>>   
>>   disable_pm:
>>   	pm_runtime_put_noidle(dev);
>> @@ -695,7 +675,7 @@ static int xhci_mtk_remove(struct platform_device
>> *pdev)
>>   	usb_put_hcd(hcd);
>>   	xhci_mtk_sch_exit(mtk);
>>   	clk_bulk_disable_unprepare(BULK_CLKS_NUM, mtk->clks);
>> -	xhci_mtk_ldos_disable(mtk);
>> +	regulator_bulk_disable(mtk->num_supplies, mtk->supplies);
>>   
>>   	pm_runtime_disable(dev);
>>   	pm_runtime_put_noidle(dev);
>> diff --git a/drivers/usb/host/xhci-mtk.h b/drivers/usb/host/xhci-
>> mtk.h
>> index 4b1ea89f959a..9b78cd2ba0ac 100644
>> --- a/drivers/usb/host/xhci-mtk.h
>> +++ b/drivers/usb/host/xhci-mtk.h
>> @@ -150,9 +150,9 @@ struct xhci_hcd_mtk {
>>   	int num_u3_ports;
>>   	int u2p_dis_msk;
>>   	int u3p_dis_msk;
>> -	struct regulator *vusb33;
>> -	struct regulator *vbus;
>>   	struct clk_bulk_data clks[BULK_CLKS_NUM];
>> +	struct regulator_bulk_data *supplies;
>> +	u8 num_supplies;
> Could you please help to change it like as clock bulk?
> 
> 1. #define BULK_REGULATORS_NUM 2; then define @supplies array,
> 
>          struct regulator_bulk_data supplies[BULK_REGULATORS_NUM];
> 
> 2. also add a helper to get regulator bulk; e.g.
> 
> static int xhci_mtk_regulators_get(struct xhci_hcd_mtk *mtk)
> {
>      struct regulator_bulk_data *supplies = mtk->supplies;
> 
>      supplies[0].supply = "vusb33";
>      supplies[1].supply = "vbus";
> 
>      return devm_regulator_bulk_get(mtk->dev, BUL
> K_REGULATORS_NUM, supplies);
> }

Hello Chunfeng,
I chose to go for this way to enhance the implementation flexibility: like that,
any future SoC that needs different regulators (more vregs, less, different names)
will simply need a new array of vreg names, like:

static const char * const xhci_mtk_mtxxxx_supply_names[] = {
	"vusb33", "vbus", "another-supply", "and-another-one",
};

Other than enhancing flexibility, this will also make sure that we don't allocate
more regulator_bulk_data entries than needed, enhancing memory usage.

Your proposal, though, is valid if you are sure that future SoCs will have only
and always these two power supplies and nothing else...

Regards,
Angelo

> 
> Thanks a lot
> 
> 
>>   	unsigned int has_ippc:1;
>>   	unsigned int lpm_support:1;
>>   	unsigned int u2_lpm_disable:1;
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
