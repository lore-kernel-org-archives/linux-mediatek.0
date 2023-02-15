Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 806F7C636D4
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Feb 2023 21:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wwhRGKzzxRmhQ49hS4QWcVBIwbWV+s9hRRdXyP5iSY0=; b=bG+lYqISg7kViDXz+ZmyTPrLtR
	ZAesgmKFq9im5JNhCq2rmbwARtxIsAvcF5hSaFZs4sKKx32L/Z+qZz2eHmE0fmTf+9xzOxH1LcHmo
	vaN8fMjBycbfc/vOHUMtQA9r9mJWVpF9U6IWurVQUs9rzQPqgelXrfYSCB/3Od3yQnUYg8ijVhckf
	kI1+2oUqQvc2xy6+K0JFScl9jw3kf7C727nRoTl9CHylZtTqiuDU84MMXqI3FoeFHvn6MmPmjXHbI
	kmd8xf+54O+Yp7yf/RnAiKiNfv4UOk3P8JtG4edqi379yrbwqz5SNvFBLMX1f05cC1OryajSUf5iR
	pkZpvQLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSPMl-007ZaR-SR; Wed, 15 Feb 2023 21:31:03 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSPMZ-007ZW8-Tn; Wed, 15 Feb 2023 21:30:53 +0000
Received: by mail-wm1-x32a.google.com with SMTP id o36so133552wms.1;
        Wed, 15 Feb 2023 13:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wwhRGKzzxRmhQ49hS4QWcVBIwbWV+s9hRRdXyP5iSY0=;
        b=Z6PKgfElsvUztbaP1UgQEj8lPrM9wfGWphQUsc3B7ceB6XwV29NZos2LBs2XD/Lbea
         OnFSLIPD0g7doJnmy2CzMuXfd+lZPEb9LxbrJHTvRK84geSiS420fnwq0kc5DTvFiHpI
         p/JnQHxxwJTe7cLr1dto5kt5OgOO7Ua888nhaMysM49JWuCeLQu1sAtaLrN+Xkx8tdhc
         atExoZ0RLXF7kRnVZmrqAIWuS/ErosDOatILyvTxC3Q5rlLn6Q1WE+OhL5+F1GK9daIc
         XGKrnsJqQjUfcSl2riQyVsNgv3jc8OawoXWmxHkQvczv/ZhlrhuMgsXxyIvK6jXix4NO
         1FDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wwhRGKzzxRmhQ49hS4QWcVBIwbWV+s9hRRdXyP5iSY0=;
        b=C45eQMcilSATz9PnK7Zxo1W0YXHndefkciRN+/8oSVo2sh4VjznD4CS/UKWeDTi2HO
         sWuiYBj1OvsyncMaA7aa6DUb/zFDEJtRjDl0xzTPDVnHXNuk/N8u13EdeYxWwfDIgUtY
         xPHhf5aIdgAaKDOJi5oC/oil9onlCo6l4c+NjiUHW3Wq7bUWbdJooPa1YSGV4dS4BSBV
         n5s2avST8yQUcBeLXtJ2FtgjvVDyvpojpUdoWfkhSLaPQSkGra/lvPNhQNLgzE5+B76W
         SKhF5WA+CFfIvfhAqho4O1YTSJDNZkaOlLags3R8WEvYvgx6sUVaynjmAVdktpd85xJd
         UuDQ==
X-Gm-Message-State: AO0yUKVOGay7hHq+++7oF2tp/opN3YpCRcnsqorFeHnxyV1Z4Bhyj0Tu
	PJuZgy5sZkp8xQdiuNsmaYM=
X-Google-Smtp-Source: AK7set8iMEK3VVHdeN+zzhoqFRVgIYezADgMMKC3NNKrFZt2Pq9ug0Jwtc11+Mj5+wUNupHmjzygQg==
X-Received: by 2002:a05:600c:816:b0:3dc:5390:6499 with SMTP id k22-20020a05600c081600b003dc53906499mr3444167wmp.1.1676496645352;
        Wed, 15 Feb 2023 13:30:45 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id m7-20020adfe947000000b002c559626a50sm7912740wrn.13.2023.02.15.13.30.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Feb 2023 13:30:44 -0800 (PST)
Message-ID: <066340d4-adec-a4da-3b88-d52f10f8bceb@gmail.com>
Date: Wed, 15 Feb 2023 22:30:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH -next v2] wifi: mt76: mt7996: Remove unneeded semicolon
Content-Language: en-US
To: Yang Li <yang.lee@linux.alibaba.com>, kuba@kernel.org
Cc: pabeni@redhat.com, angelogioacchino.delregno@collabora.com,
 ryder.lee@mediatek.com, lorenzo@kernel.org, nbd@nbd.name,
 shayne.chen@mediatek.com, sean.wang@mediatek.com, kvalo@kernel.org,
 davem@davemloft.net, edumazet@google.com, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Abaci Robot <abaci@linux.alibaba.com>
References: <20230215055650.88538-1-yang.lee@linux.alibaba.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230215055650.88538-1-yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_133051_994206_298B26E8 
X-CRM114-Status: GOOD (  14.37  )
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



On 15/02/2023 06:56, Yang Li wrote:
> ./drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:3136:3-4: Unneeded semicolon
> 

Please be more verbose in the commit message.

Regards,
Matthias

> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=4059
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
> 
> change in v2:
> Add the linux-wireless to cc list.
> 
>   drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
> index dbe30832fd88..8ad51cbfdbe8 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
> @@ -3133,7 +3133,7 @@ int mt7996_mcu_get_chip_config(struct mt7996_dev *dev, u32 *cap)
>   			break;
>   		default:
>   			break;
> -		};
> +		}
>   
>   		buf += le16_to_cpu(tlv->len);
>   	}

