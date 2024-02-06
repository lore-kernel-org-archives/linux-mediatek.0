Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23AAFC48297
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Feb 2024 11:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CCmFCzQG2z/azgqnYWYo4aro72qPRhbVfC2Hh/7EQKA=; b=QjKLp2OTrn55d7EskY5r70Y3Ve
	9F7IB+uc1ExorntEvN/SsC9mh8x3m36nlBt2O6vFwA0BGl1TjJ27hFgKNQQM6ryx5/sfrHg9zv9tr
	622XGXd5vxN/Hse2Ej+B83e7x7ETLnLjoEhRzZAR0AN0p2H4MCB/eq/UjAUfi3BZvVBT6v+1ICFsl
	Sjl9pC4dTi9s7b7UuGAO+O+SC6BcOjwIJIB2zxNJ1+mJ9HF0gsjZwDJhjS1vFHigaIvCoO1mPErY+
	wbwzMiEOeaTe5bWHkW838HsHzrrpCYZzk1X+l60/+XPadx4Iwe8H4TRlG1gd3ZXXrPgr0MN2u/Nd5
	4dTYliOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXJtd-00000007OVq-36MO;
	Tue, 06 Feb 2024 11:45:49 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXHpy-00000006jj6-42Jj;
	Tue, 06 Feb 2024 09:33:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707212029;
	bh=fQlylVz2jQb6NzL/+ZmTPkrnm96XO8ophYiGOdTCP8Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BzSbca5G9L3dzYbj7Chv/fm/rPCI1A0STw4ZW1zwSCyXp14y9HgLkPOYLVpM4JLxS
	 kjEVKyTlRDfWrRf83f8oc/+gLNWXUIO4DiC++tRCNHRDQ5QtU9+qdjL9SzoolgrW5j
	 SrZ/wQd/P4x/XxXV89kmGSIWgZZg19cOi5n/7k3CAgBcLrc5RkFuEuxlIv17V98v6+
	 NEeD1tVrPf4TdPFaegUu7Gx8YAKbesHL48lb8gW5r4frhrWa9uAKQUOAC6KQxTRWPx
	 UF5XwORaNQNPvKnzOxpifiwe3ugm+1qeaLJepWPYQeZYVJRLCY8rswdRVCfDXbJry4
	 y+FoHd6UJQIew==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 659763782039;
	Tue,  6 Feb 2024 09:33:48 +0000 (UTC)
Message-ID: <f5044987-2514-44cf-83d4-0976b37dc683@collabora.com>
Date: Tue, 6 Feb 2024 10:33:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/19] power: reset: mt6323-poweroff: Use
 devm_register_sys_off_handler(POWER_OFF)
Content-Language: en-US
To: Andrew Davis <afd@ti.com>, Sebastian Reichel <sre@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Sean Wang
 <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-actions@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240205194437.180802-1-afd@ti.com>
 <20240205194437.180802-12-afd@ti.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240205194437.180802-12-afd@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_013355_171021_87E28E97 
X-CRM114-Status: GOOD (  17.23  )
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

Il 05/02/24 20:44, Andrew Davis ha scritto:
> Use device life-cycle managed register function to simplify probe and
> exit paths.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>   drivers/power/reset/mt6323-poweroff.c | 28 ++++++++++++++-------------
>   1 file changed, 15 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/power/reset/mt6323-poweroff.c b/drivers/power/reset/mt6323-poweroff.c
> index 57a63c0ab7fb7..ca5d11b17ff03 100644
> --- a/drivers/power/reset/mt6323-poweroff.c
> +++ b/drivers/power/reset/mt6323-poweroff.c
> @@ -14,6 +14,7 @@
>   #include <linux/platform_device.h>
>   #include <linux/mfd/mt6397/core.h>
>   #include <linux/mfd/mt6397/rtc.h>
> +#include <linux/reboot.h>
>   
>   struct mt6323_pwrc {
>   	struct device *dev;
> @@ -21,11 +22,9 @@ struct mt6323_pwrc {
>   	u32 base;
>   };
>   
> -static struct mt6323_pwrc *mt_pwrc;
> -
> -static void mt6323_do_pwroff(void)
> +static int mt6323_do_pwroff(struct sys_off_data *data)
>   {
> -	struct mt6323_pwrc *pwrc = mt_pwrc;
> +	struct mt6323_pwrc *pwrc = data->cb_data;
>   	unsigned int val;
>   	int ret;
>   
> @@ -44,6 +43,8 @@ static void mt6323_do_pwroff(void)
>   	mdelay(1000);
>   
>   	WARN_ONCE(1, "Unable to power off system\n");
> +
> +	return NOTIFY_DONE;
>   }
>   
>   static int mt6323_pwrc_probe(struct platform_device *pdev)
> @@ -51,6 +52,7 @@ static int mt6323_pwrc_probe(struct platform_device *pdev)
>   	struct mt6397_chip *mt6397_chip = dev_get_drvdata(pdev->dev.parent);
>   	struct mt6323_pwrc *pwrc;
>   	struct resource *res;
> +	int ret;
>   
>   	pwrc = devm_kzalloc(&pdev->dev, sizeof(*pwrc), GFP_KERNEL);
>   	if (!pwrc)
> @@ -63,19 +65,20 @@ static int mt6323_pwrc_probe(struct platform_device *pdev)
>   	pwrc->base = res->start;
>   	pwrc->regmap = mt6397_chip->regmap;
>   	pwrc->dev = &pdev->dev;
> -	mt_pwrc = pwrc;
>   
> -	pm_power_off = &mt6323_do_pwroff;
> +	ret = devm_register_sys_off_handler(pwrc->dev,
> +					    SYS_OFF_MODE_POWER_OFF,
> +					    SYS_OFF_PRIO_DEFAULT,
> +					    mt6323_do_pwroff,
> +					    pwrc);

	if (ret)
		return dev_err_probe(....);

Regards,
Angelo

> +	if (ret) {
> +		dev_err(pwrc->dev, "failed to register power-off handler: %d\n", ret);
> +		return ret;
> +	}
>   


