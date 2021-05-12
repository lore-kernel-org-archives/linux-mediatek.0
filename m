Return-Path: <SRS0=1nN3=KH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CF03C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 May 2021 15:46:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8ABDD61D94
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 May 2021 15:46:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8ABDD61D94
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=84+EjWwudmH3o5OFfiulJ5zYnWDhyoBljq5pWLnyUII=; b=MSRFsgIHa8ni1DZ2udaOiISuX
	3najynafNZX0eNVGKNb5ArgcezZWQu7PI+Ypx16xpku/k0PsHzDRpI/hzP3VPt5hNPhmXj4dUdfwG
	Wt/Lp4fQ2ktxrNkgiQBXOKcL+X7PlifRLDFwiE+ABsVq9f3CPZDRJmW5f0Yv7wB3xczDJpO4OCogs
	DV3RhCVUuWyZUUueEOFFgi2qtPAf+9Pzwaspy8mrEi/Md/0cszyZO3eYUcE0BojnT9tXD1jI/nQt6
	f5/yHqJWlYDc9hbcx/7N4PDvbnmDdVDjatf/kChwfdOzsjTtuRC5XazZrXpxOYAMSVOahWj9630Ut
	6nS6mD4YA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgr3u-003F7e-Lk; Wed, 12 May 2021 15:46:14 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgr3t-003F7K-RA; Wed, 12 May 2021 15:46:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=t/meNjZ0Nht+RonvzyRGNz+Sylq/Yz/vgFjTi37bDrE=; b=wfXKzLxkTIIA7OQQyW2GPPEWLb
 jCA9Au0bUY7FNN6OhArYqJoEKRZCRGDWw51NhQF7HlaHhDkb44zk4k4YZuRrVK8Qkww/aFLflHWcS
 bNsdi/viMEWhEZu4pXWqVH2mU2Smmx9J0YknBxLcEcGs1uQ57rw3tYNYgPaIAQePtLITCXzr4T96v
 0CamdKP9AnnRJfotikNNRluF7f/4o43xH2gJG9fpbOjaYesJgKPeLEpjzYpj20vUwyYh9XwiUXzmu
 2D3BPBAI5qrKhvKVsaY+Y0GZ+crUVX+oOPN6AJ5wbi2raY+lyzoJNQM2/4cWGVCwThiiHxhrVwK0k
 C6BYm7hA==;
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgr3q-00AXce-Jk; Wed, 12 May 2021 15:46:12 +0000
Received: by mail-wm1-x32d.google.com with SMTP id
 s5-20020a7bc0c50000b0290147d0c21c51so3292415wmh.4; 
 Wed, 12 May 2021 08:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=t/meNjZ0Nht+RonvzyRGNz+Sylq/Yz/vgFjTi37bDrE=;
 b=p5H95YkRm4qypJ1VXfunFTs2qXkp3RFcPncyQHjSJbn/3m9QkH/OQu1lUj3zhLqIdW
 feakVA3m4oTBW0eOYpdDK5G83qoWpWdUFpOoow6+H1zn78zwpoNKI8sIH2YxEi4ihzdo
 F8Pj8aT+sifNO1+kh5HW9mdwQNzOloBZ3HHeX45DLJvE5WO7Z1D4oP2+y41/k2IYfKYN
 b7MreOOv9dgsFa2sXpPVWoLLpVvn/K/RmkUM5uJZErt6IyyLhyOvycvSkyk7/LlXmoB2
 DjfvXjwpvZh1j6yksb6cpBSSA5mCbeeIeYnmN8tqWW48Fa60sSz++wbjs8GnZswdM5dS
 j59Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=t/meNjZ0Nht+RonvzyRGNz+Sylq/Yz/vgFjTi37bDrE=;
 b=pqOlbQqPlXNDEXzf+vyPCabP23fvZtkV6KRd4IO8d/WkKR1pzngsn/WmZHo2zTNhI4
 MYuN7g1zvFgGlG6eZeHzpaR5e8+pu1f5duhg9F+82Vkpg80rvK/5EGBCvGJxF2kJU93y
 oBYQ+wJA0iV66AIse6CfLfkAVrWxMsi3tIpZaA3kzNDKfA+IeGasV6vKjJGzvZht3K3w
 nxQbXslqsKZkxt0iMklBwGHZ/5C/nPOhWo+Xt5Hk3rXfok/gwDg9M2NnNlvnbN2WoWE8
 h+2Z9M8AZukoV4M/x3Mr/VFykVDNrZVcwi6JznpnpKY8aALIfs3ZajlKGJBsAdmeA8GJ
 LiZA==
X-Gm-Message-State: AOAM530E86d+QiPCQmDB19K7Z0QXIDiSCF3Tgn1i3+nie38tB5Rp7wOy
 KaCGgngpuMIdZJ4CDKXp8o8=
X-Google-Smtp-Source: ABdhPJwYuTCotr2sEyzdL2rZRhrQqc7oqM7Iiyowlk8hQGp59sT8OOJrmqBcqcP+2r/KwlLq3/sU4g==
X-Received: by 2002:a05:600c:322a:: with SMTP id
 r42mr39484143wmp.98.1620834369271; 
 Wed, 12 May 2021 08:46:09 -0700 (PDT)
Received: from ziggy.stardust ([37.223.140.37])
 by smtp.gmail.com with ESMTPSA id p1sm48270wrs.50.2021.05.12.08.46.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 May 2021 08:46:08 -0700 (PDT)
Subject: Re: [PATCH v21 3/5] i2c: mediatek: mt65xx: add optional vbus-supply
To: Hsin-Yi Wang <hsinyi@chromium.org>, Wolfram Sang <wsa@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: linux-i2c@vger.kernel.org, Qii Wang <qii.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Arnd Bergmann <arnd@arndb.de>
References: <20210507131406.2224177-1-hsinyi@chromium.org>
 <20210507131406.2224177-4-hsinyi@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <6e971f16-a325-34cd-faaa-cfd51db86c66@gmail.com>
Date: Wed, 12 May 2021 17:46:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210507131406.2224177-4-hsinyi@chromium.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210512_084610_680406_04C14CB0 
X-CRM114-Status: GOOD (  19.21  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 07/05/2021 15:14, Hsin-Yi Wang wrote:
> Add vbus-supply which provides power to SCL/SDA. Pass this regulator
> into core so it can be turned on/off for low power mode support.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>  drivers/i2c/busses/i2c-mt65xx.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
> index 5ddfa4e56ee2..22d1d14b5de5 100644
> --- a/drivers/i2c/busses/i2c-mt65xx.c
> +++ b/drivers/i2c/busses/i2c-mt65xx.c
> @@ -1220,6 +1220,13 @@ static int mtk_i2c_probe(struct platform_device *pdev)
>  	i2c->adap.quirks = i2c->dev_comp->quirks;
>  	i2c->adap.timeout = 2 * HZ;
>  	i2c->adap.retries = 1;
> +	i2c->adap.bus_regulator = devm_regulator_get_optional(&pdev->dev, "vbus");
> +	if (IS_ERR(i2c->adap.bus_regulator)) {
> +		if (PTR_ERR(i2c->adap.bus_regulator) == -ENODEV)
> +			i2c->adap.bus_regulator = NULL;
> +		else
> +			return PTR_ERR(i2c->adap.bus_regulator);
> +	}
>  
>  	ret = mtk_i2c_parse_dt(pdev->dev.of_node, i2c);
>  	if (ret)
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
