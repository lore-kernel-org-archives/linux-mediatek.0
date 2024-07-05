Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D2AC30658
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jul 2024 08:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2a735ksNfSsfXhpxGPpdkQ1jOmesu6ZOUURcuhcoYOM=; b=FlnWSQvcKG+yOUjlaLdai4bV1b
	xlHr9m9HQI/XuW/BySkYbuWrNKo0KZ+ZsAYDY5ism0QkFzhpOZQam4bDv6LcZWXrqiwuq7U7DksYg
	RnVW0V1MSXJmZe2md1/MHCq53VrWuQMzd69RAz9DwWcDflqfhig0jmSYlI+kLljN/LmXVOwLoFuId
	S3OlE11s4owU/aZH1U1GgEMU4dNBBhJWmKPkWjg7MeQAzKlX11WDNDmH3+oquMuL6rcYdhzl168v5
	gS48HPTsWeOcxFqagt0br+19kdmg0cidZNV+MgdA+XHDkGv0JcMkfAh5VuPhoKooyyNPLlRKy+lhA
	+2LYqcrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPe6I-0000000FFNt-1iC7;
	Fri, 05 Jul 2024 08:15:26 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPe63-0000000FFKE-2Fyd;
	Fri, 05 Jul 2024 08:15:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1720167308;
	bh=DiwSS4yikvpV+oKcCFDeiIn47VFoALKnDeJ3RnaTyBE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=z3V/Uwks/hWpV2Xqj43hnEGdSrVkIMEYacjN6dVuj3nX28wNONmI+5BvSzuSJnHWn
	 eeMemKqU5iHlLUy1FqnsUPQbq1dCvuDXrvwetKIZSGPkYKEifdzbxFyF3ibwCraUNQ
	 jST6WfOfcYTffU9/Se0x/yxperp/4dL2Sddv2YfZgeCSh/22yWIWfH+Ot5vv3/nYYr
	 r363D1aeVZsdo5GWqigju4Q50NkiOnAZOpBoXB5wcKU2V5elIvVQynXjfrFktF07jv
	 +rofkPQXvk4sPKjeBQD15i6e4sPvcnJ6+2KoVckWcx+fIpXUXZziJ4c7XpthmjIEvD
	 pafvg3c9XRggw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8EF7E378219E;
	Fri,  5 Jul 2024 08:15:07 +0000 (UTC)
Message-ID: <b402896c-6b91-4973-9e4f-8d1f7128afdc@collabora.com>
Date: Fri, 5 Jul 2024 10:15:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] i2c: mt7621: make device_reset optional
To: Lorenzo Bianconi <lorenzo@kernel.org>, linux-i2c@vger.kernel.org
Cc: sr@denx.de, andi.shyti@kernel.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 lorenzo.bianconi83@gmail.com, upstream@airoha.com,
 benjamin.larsson@genexis.eu
References: <cover.1720130844.git.lorenzo@kernel.org>
 <3ea697be239c450cbc622f3e2e9dff8bf17515c0.1720130844.git.lorenzo@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <3ea697be239c450cbc622f3e2e9dff8bf17515c0.1720130844.git.lorenzo@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_011511_742546_4D385235 
X-CRM114-Status: GOOD (  17.16  )
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

Il 05/07/24 00:16, Lorenzo Bianconi ha scritto:
> Rely on device_reset_optional() instead of device_reset() in
> mtk_i2c_reset routine since Airoha EN7581 reset controller does not
> implement the reset callback and device reset is not mandatory on this

Not mandatory means that the reset line for I2C exists, but you don't want
to use it? If so, that's not right.

On the other hand, if there is an issue with using that reset line and you
want to avoid using it for a good reason, please describe it into the commit
description and - in that case, you'll have to add a EN7581 compatible and
code to avoid calling device_reset() on that SoC.

What you're doing here is removing an error log on SoCs that do *need* that
reset line to be in place, so, hiding a problem that could be causing other
issues on peripherals connected to the I2C bus of those other SoCs.

Cheers,
Angelo

> SoC. This will remove the following log:
> 
> i2c-mt7621 1fbf8000.i2c0: I2C reset failed!
> 
> Tested-by: Ray Liu <ray.liu@airoha.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>   drivers/i2c/busses/i2c-mt7621.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
> index 81d46169bc1f..8cd89a2f59df 100644
> --- a/drivers/i2c/busses/i2c-mt7621.c
> +++ b/drivers/i2c/busses/i2c-mt7621.c
> @@ -85,7 +85,7 @@ static void mtk_i2c_reset(struct mtk_i2c *i2c)
>   {
>   	int ret;
>   
> -	ret = device_reset(i2c->adap.dev.parent);
> +	ret = device_reset_optional(i2c->adap.dev.parent);
>   	if (ret)
>   		dev_err(i2c->dev, "I2C reset failed!\n");
>   



