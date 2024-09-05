Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4516BCD4F59
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Sep 2024 08:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LcloJpQ7Qx914ckr6DHP/VtDGnDFfv98JfcoR3vFduA=; b=WG5h8EFxFclwVXwblYqBw6+sna
	b9yYy/dNyTtYPZBPQgrmEEwdm/fVhEfaTM/x1lqceC7XVRdoWGVF1l5M6nkozW64ystfd4eGHtAdJ
	EV6iP5Nqy3unr95g2Sy2gli3YzuqR7LpOa2ctqiz7XXEWsgpbh6H7AEUJkFipHWBZqfzhz1b9rav4
	rraMg3jNjLSbXOeL0ObRTlPJ3yZwIxOD2Xw0KUFnj/MNbjVMT5WxqRWbHIPfI6iITiCj11cIGT6We
	Y/8XUP3/CmbFTqD2hMC3KVVHLGLpADMS5C22lZIJ3LolshNMFBDSUAEu9g1kfl4Zezo/mFyJ6g7hV
	2UWN6mWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm7RZ-00000007TOo-2fpy;
	Thu, 05 Sep 2024 08:02:17 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm7Qa-00000007TAW-0yqU;
	Thu, 05 Sep 2024 08:01:17 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3787e067230so262526f8f.1;
        Thu, 05 Sep 2024 01:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725523274; x=1726128074; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LcloJpQ7Qx914ckr6DHP/VtDGnDFfv98JfcoR3vFduA=;
        b=N9OpLUJ6IVYNvDbJCVLEuTSz+7X7Rqdtfix8jugJPnm6pbk41WfMOv3FdGQETDtXXt
         hejqUwmDBkLTD5UlPHiTj7aOFSKY5LXrNy7prKKJEHS8sna1wVWse4Zd/7Q0g2oMBle/
         n/YGK+rogKzc/g3QOOjYysvrFxptjFV9S+RwUOJzjg4b/UykNuNJGe/KiCcT0vpg7QYD
         f+ah6y7GVJYTnOQ5uST8g0r61HD5+BHTTuTY66eZQEz3XlEtSvWwTwf7sJYYio233z2P
         36vRSFtngnDi66OebXLauG05c8+py9Xp3f5qZRtYRDzPi6hgS/0N8BXTwE24kgEXSQY2
         i62A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725523274; x=1726128074;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LcloJpQ7Qx914ckr6DHP/VtDGnDFfv98JfcoR3vFduA=;
        b=jA8j+PGzenwyCi+HIGDWxDUO4hVkCV4Qk3vgJD1U71QYL+9RrE7Hp4oF7St9e8YHS8
         0eEWwbZ3AHm47EjoF5BtbJYMftJcLo3HWGJ212nH/nXvjIU4BRyEHHdlP7YICNtLwEQA
         hmWZlvPGBOPE15oVbO4e97034TSe3XvW54fjww15mEsP5HG3khzDEavq8fMk59eSq87H
         LuQClPZj0XjfE43oxfJQv+9tKBEsXbWN37iYyz1Bg2kVwURqbpYP4Leo8wfuiKvKguSm
         GTdAT3aIp5oEtGfFH/JSziA6ngjwijhSS5b5D+BP2JNgEnoexaqTSQK0A8IcXho0Hdj2
         jh5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUknYV8PuqdPzVKk6dT4gaVlKZd33IA+lSYiiDWlrPxGNZFHvr5GpU7yx5ZWvurGfKhsJDPlBGl26ZwLA6KQws=@lists.infradead.org, AJvYcCWaOoiJ9vfkXUHn/QkVrCeDHV0GS0UIACTqZg+GOXbv+pIcQMwjM2BzoCnGz9Z/DfzcOgVYQGQ2zWn95Wsrriu1@lists.infradead.org
X-Gm-Message-State: AOJu0YwaWTZ12RAUcyeDGnmTIl5gDmwefmHsqSM3ErBdHb3ocYxJzyFW
	hPryCwtqFSV/i4JMY4HiJqc0RpapQmeH0rENIutOOTCR6w9dDngEWUSARwTB
X-Google-Smtp-Source: AGHT+IH0cTvMC7J9SZVb/l2bMXoWPnfwQMm6bTLm0lrIHjJQ8ONHttlFqy/nKxKAXLIAVrlr7wJFjw==
X-Received: by 2002:adf:fc08:0:b0:374:c2cf:c017 with SMTP id ffacd0b85a97d-376dea47344mr3921448f8f.46.1725523273889;
        Thu, 05 Sep 2024 01:01:13 -0700 (PDT)
Received: from [192.168.2.177] ([81.0.7.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374d1dd1e76sm7770962f8f.113.2024.09.05.01.01.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Sep 2024 01:01:12 -0700 (PDT)
Message-ID: <1ac78d8a-c0dc-4f90-9e25-6d9569894670@gmail.com>
Date: Thu, 5 Sep 2024 10:01:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mt76: mt7615: check devm_kasprintf() returned value
To: Ma Ke <make24@iscas.ac.cn>, nbd@nbd.name, lorenzo@kernel.org,
 ryder.lee@mediatek.com, shayne.chen@mediatek.com, sean.wang@mediatek.com,
 kvalo@kernel.org, angelogioacchino.delregno@collabora.com,
 ruanjinjie@huawei.com
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 stable@vger.kernel.org
References: <20240905014753.353271-1-make24@iscas.ac.cn>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20240905014753.353271-1-make24@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_010116_318305_D815D710 
X-CRM114-Status: GOOD (  14.93  )
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



On 05/09/2024 03:47, Ma Ke wrote:
> devm_kasprintf() can return a NULL pointer on failure but this returned
> value is not checked. Fix this lack and check the returned value.
> 
> Found by code review.
> 
> Cc: stable@vger.kernel.org
> Fixes: 0bb4e9187ea4 ("mt76: mt7615: fix hwmon temp sensor mem use-after-free")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

If you find more problems of that sort in the mediatek wireless drivers, I think 
a better approach would be to send them all as one patch.

> ---
>   drivers/net/wireless/mediatek/mt76/mt7615/init.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/init.c b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
> index f7722f67db57..0b9ebdcda221 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7615/init.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
> @@ -56,6 +56,9 @@ int mt7615_thermal_init(struct mt7615_dev *dev)
>   
>   	name = devm_kasprintf(&wiphy->dev, GFP_KERNEL, "mt7615_%s",
>   			      wiphy_name(wiphy));
> +	if (!name)
> +		return -ENOMEM;
> +
>   	hwmon = devm_hwmon_device_register_with_groups(&wiphy->dev, name, dev,
>   						       mt7615_hwmon_groups);
>   	return PTR_ERR_OR_ZERO(hwmon);

