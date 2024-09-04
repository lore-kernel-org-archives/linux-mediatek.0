Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F728CA0ED3
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Sep 2024 09:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vy90VFulS8e/nyhzi0U0xOoN1F9n1Y4+P2Hnc5uXLeE=; b=qTUx5sIoU1+/sCTTw+rbBrb5xf
	VoQKcXRUlPUII3URAJQyaBItvFMXBM1yn06Gu+pw7keSlRu2wBSHaqDYsiJAxX1QNGkCHBnEgug+P
	sPTt2NoTJqN1dOPGxyyFkuwUX7aZpkfoSrm3SxIavZSRDBuwHTpSlZsY4Y+TqgNpCu3AQSrZSfHDl
	HVNLXM4NhB5I5jiEYQtiT2H2ejRgUVu7rt/MX1GNck2NBOjmbCbod3KFpkmZFXhXivet1sOZvjIBB
	EUh57GQy5GfzZ5pW4mFnus7WVEn8GTmTU64QcDMq7pWC/LDDr/oyCAEkLYVBOBUqOCsJZhfr2W3uI
	AG7gWaXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slmPH-00000003hbS-3SHe;
	Wed, 04 Sep 2024 09:34:31 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sllsN-00000003YmM-1MCC;
	Wed, 04 Sep 2024 09:00:32 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-42bbd0a40faso43103695e9.1;
        Wed, 04 Sep 2024 02:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725440429; x=1726045229; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Vy90VFulS8e/nyhzi0U0xOoN1F9n1Y4+P2Hnc5uXLeE=;
        b=mRzjLQXV8oQSYzPSNLH/dwHq3KofGhHMWCo3bDwZYTjybO2oitvz0bH/9G+34YdSo8
         rONLwfeDY/2Iv5mdzd5fGhwLvx1FoD5wQvQd2NEwmarWVicqsa7sFF0W6q9lxLzdikDO
         kAlyRnfrBDyfadja0TdqOsaS7CfKlM0egoNwhdbCNPy3DMRy+g2gjbKMem0/BLUnuFlf
         lTeRJRZJa0NgX5AfmRp2pnUstRXgqm5pXaxxQzojMaLwRHWWP/nB/yOfm+9VjmsL1KbE
         hKnE1x1KFXGuy81KBHWR/erFJvoD7bV8iAfl1inO5E62SVkmgMeYN7FgpDQ6vrSMZxk7
         84XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725440429; x=1726045229;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vy90VFulS8e/nyhzi0U0xOoN1F9n1Y4+P2Hnc5uXLeE=;
        b=Jjc+4F5kqwALGjx95XJe+U6gyt72JVM9bV/Izv2nrS7uUISM04abnQzFuvNxNgZJ79
         9HjwpRlqN0twQP8azKiu91cLiD8dHwsJQQOw5UaLatGLcFsYPfrY1S9km+3fUv3TN3LS
         1JcTdIq0N1QqgsRSJTyJFkobejS89LcMwTtUqzwpoo0vNydvuwWcrZxlfSJsSbK4/e7f
         zwdY7ob58y9tK27TbkKtTLIQynYAIg2ZX4EmwkKq+KQPFXRjAozfxPr0DqTemSGc+Z8M
         RZRes9cXS8VY7aZlSOCpHGxpTrd5JHXlP5nr3oDfjAzZpIzhBP7XQt2H2v2UrpLdTCsT
         MlAg==
X-Forwarded-Encrypted: i=1; AJvYcCV+zxXDvn49pfuQXJSYWapWy/QG3oyvyQYHL7gZ7fqE69SMHobNH0CVrna02/BbXpKUJCbgxa1aVuU0nM+Y6WoU@lists.infradead.org, AJvYcCXvYqyqvZZq0FNoTuhEKn4u+Y/4dJH7TODasSO8MVqCBZx+gX+UKw0ToYRuVb/YV9G5xKpe7pK5f+Vhwx+sxuQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/Ene7b2ZFITtv20tCyGYprEb3a4xFIxc8dt7iIPBujukVktgE
	eIV90fI/KPoGEMherpkO0xcaXdnHMY+1iFEdSl22d+N4R9NBD0yH
X-Google-Smtp-Source: AGHT+IEtlT/yGsPphh+1fUhiEvpB+7pooR/GcaT/vc+N+I6fSNITQKA/Tm7hayaCxE8vwNZ1yEM4fA==
X-Received: by 2002:a05:600c:1c06:b0:42b:b594:4a8c with SMTP id 5b1f17b1804b1-42c881030dcmr49127195e9.27.1725440429094;
        Wed, 04 Sep 2024 02:00:29 -0700 (PDT)
Received: from [192.168.0.20] ([148.56.230.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6e274ccsm200917995e9.37.2024.09.04.02.00.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 02:00:28 -0700 (PDT)
Message-ID: <f48db1ae-23e2-4587-a4ab-3844d0822194@gmail.com>
Date: Wed, 4 Sep 2024 11:00:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] wifi: mt76: mt7921: Check devm_kasprintf()
 returned value
To: Ma Ke <make24@iscas.ac.cn>, nbd@nbd.name, lorenzo@kernel.org,
 ryder.lee@mediatek.com, shayne.chen@mediatek.com, sean.wang@mediatek.com,
 kvalo@kernel.org, angelogioacchino.delregno@collabora.com,
 mingyen.hsieh@mediatek.com, deren.wu@mediatek.com, ruanjinjie@huawei.com,
 greearb@candelatech.com, akpm@linux-foundation.org
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 stable@vger.kernel.org
References: <20240903014455.4144536-1-make24@iscas.ac.cn>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20240903014455.4144536-1-make24@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_020031_402720_0B9F5154 
X-CRM114-Status: GOOD (  14.03  )
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



On 03/09/2024 03:44, Ma Ke wrote:
> devm_kasprintf() can return a NULL pointer on failure but this returned
> value is not checked. Fix this lack and check the returned value.
> 
> Found by code review.
> 
> Cc: stable@vger.kernel.org
> Fixes: 6ae39b7c7ed4 ("wifi: mt76: mt7921: Support temp sensor")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>

Reviwed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/net/wireless/mediatek/mt76/mt7921/init.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
> index ef0c721d26e3..5ab395d9d93e 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
> @@ -52,6 +52,8 @@ static int mt7921_thermal_init(struct mt792x_phy *phy)
>   
>   	name = devm_kasprintf(&wiphy->dev, GFP_KERNEL, "mt7921_%s",
>   			      wiphy_name(wiphy));
> +	if (!name)
> +		return -ENOMEM;
>   
>   	hwmon = devm_hwmon_device_register_with_groups(&wiphy->dev, name, phy,
>   						       mt7921_hwmon_groups);

