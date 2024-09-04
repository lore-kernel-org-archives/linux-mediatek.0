Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 438C7CD3431
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Sep 2024 09:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=coqROFg8ieCUdM0Q+87b+N5eZVFIazUMtX0eKOozZo4=; b=Fs0WV+NN3CGUCJvRnS024W0wjv
	BUalG7nCDqZ/VlRYjnZjnGBUYeCFEHEEGpmyw3oLvoZyjHbAVosYJWKNSn5epHO2JGb2NhGmdoQ7t
	RTk4tAkb/D/XGb5/kmVpvHQzOO1YuGuE6/VqoE91mOeaYtqmnHZNKrwBHcs6JSoEWvkfgJXaawh6w
	9uEKG7qsD8gqtndXJd9OKbEdMrlZ0UAYaL4KYaXKksBgyZJVpMz0my3EZ3qYiXngKS6TLgJBsOK8P
	WrRBmamKAOMWtwiSyPyy4X1lr1voZK4yhHjueNFUXJfdb/zsDr6bt4COTWwbsX+c9zUZWNNmMqSv3
	Pmo3lJcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sllun-00000003ZcT-2ph4;
	Wed, 04 Sep 2024 09:03:01 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sllVU-00000003RiE-1fUO;
	Wed, 04 Sep 2024 08:36:54 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-42bb885f97eso2507125e9.0;
        Wed, 04 Sep 2024 01:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725439010; x=1726043810; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=coqROFg8ieCUdM0Q+87b+N5eZVFIazUMtX0eKOozZo4=;
        b=gwHJBh0/UPkdlVajSrVAeT8D/v7z8uiKuRsbFgPsOwF35/6D81c7zpC49vuCxFN4sc
         KYGNhgN/SK/W3RNClJJAbxJAr62c4Hp6zacGJykUaj68ZzCidVJE8pb/XQ39tt1ItKN5
         Y1WDg9mBglj/s/gFLfWXiFcm9wTtL2jMazSu2AxN25PWWAa8p5rgUKSSkvXqbxx/A/aS
         mpEPmTBZMHcLfCgpgxqyzHJ/xxfMpsdnHIsLgvtqnUrRUUZn1H5phGoi8cJxXoCDQ6Tf
         WjH/MF2DM0Co51h00IqIlgoLhveSKOYSTwkEWDl0dF/VTyBtyl4E8Wr0atEywMXzXizR
         ks5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725439010; x=1726043810;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=coqROFg8ieCUdM0Q+87b+N5eZVFIazUMtX0eKOozZo4=;
        b=ZRtShkMUg5xMrmYijUwkCbKCvwW9YUkQKz8k9wYiJPln10qMefoafJ1g6Owa8pJ/R0
         enANdAkISCdVRW63s1XBoCLPd26Z5q0EpoGMqPQfjcAmL2ey7hw3GJ5zGkV/5LYc2/yU
         5tmR1MewNkwgIsz9i+hiZ4TtTvZS8IG6hKmA4/mQOuYxKaT5hi13sE4N8FkrtNkLyPZ2
         O3UqeXJZs/Ox5u3kKADbYA602D4RhAIX6XnBxY9/YbKhAegHTA87KGdD7/mIdlmXir/L
         DJODkim5rKAKsBi2KbJ8Z0vEekgxCgbWXTI+Im8Vkv+T+wnPMYSbIFh4zYL5uaAaJ0nO
         EPPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLR/C/oB8dKiEo3+i0sPJJPaAa+biw4SH4AE5uEopyByndqrGvB5tlJsX+gG9sNKzC+mxxQHBQyD3ltZavn3s=@lists.infradead.org, AJvYcCXTneKEub8vuI0nrEYYNS0wTEkq21fEC2zbeYsWmyM3/gtHiIUK0yohPRRKSCP3IlpFq7F/0miyLHwjuKAi76xS@lists.infradead.org
X-Gm-Message-State: AOJu0YzZHXduMOdRj7+4O2gn41RC0BjCQpazTOsXNPWxZeY3c1wizZ7b
	H3icUtHq1R1tl5ywYE2mTGq3CL/EHRMJLiEsjFvpKlZNKqRIDW68
X-Google-Smtp-Source: AGHT+IFZfXBla80xFEu9ewJ3fbefvH2EuZAZIRSZp/svaazCGUxVeydes80wRxUEgoJGLqgLEyeXdQ==
X-Received: by 2002:a05:600c:511a:b0:426:5c36:f57a with SMTP id 5b1f17b1804b1-42c95b9a087mr7582415e9.14.1725439009520;
        Wed, 04 Sep 2024 01:36:49 -0700 (PDT)
Received: from [192.168.0.20] ([148.56.230.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bbc87773fsm157261795e9.0.2024.09.04.01.36.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 01:36:48 -0700 (PDT)
Message-ID: <f2380ad1-f1d1-41c1-b00e-782f2c1937fc@gmail.com>
Date: Wed, 4 Sep 2024 10:36:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: mt76: mt7925: convert comma to semicolon
To: Chen Ni <nichen@iscas.ac.cn>, nbd@nbd.name, lorenzo@kernel.org,
 ryder.lee@mediatek.com, shayne.chen@mediatek.com, sean.wang@mediatek.com,
 kvalo@kernel.org, angelogioacchino.delregno@collabora.com,
 deren.wu@mediatek.com, mingyen.hsieh@mediatek.com
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240904075213.1352976-1-nichen@iscas.ac.cn>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20240904075213.1352976-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_013652_481882_95C0474C 
X-CRM114-Status: GOOD (  14.50  )
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



On 04/09/2024 09:52, Chen Ni wrote:
> Replace comma between expressions with semicolons.
> 
> Using a ',' in place of a ';' can have unintended side effects.
> Although that is not the case here, it is seems best to use ';'
> unless ',' is intended.
> 
> Found by inspection.
> No functional change intended.
> Compile tested only.
> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
> index 9dc22fbe25d3..82c5a8def344 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
> @@ -2171,12 +2171,12 @@ void mt7925_mcu_bss_rlm_tlv(struct sk_buff *skb, struct mt76_phy *phy,
>   
>   	tlv = mt76_connac_mcu_add_tlv(skb, UNI_BSS_INFO_RLM, sizeof(*req));
>   	req = (struct bss_rlm_tlv *)tlv;
> -	req->control_channel = chandef->chan->hw_value,
> -	req->center_chan = ieee80211_frequency_to_channel(freq1),
> -	req->center_chan2 = ieee80211_frequency_to_channel(freq2),
> -	req->tx_streams = hweight8(phy->antenna_mask),
> -	req->ht_op_info = 4, /* set HT 40M allowed */
> -	req->rx_streams = hweight8(phy->antenna_mask),
> +	req->control_channel = chandef->chan->hw_value;
> +	req->center_chan = ieee80211_frequency_to_channel(freq1);
> +	req->center_chan2 = ieee80211_frequency_to_channel(freq2);
> +	req->tx_streams = hweight8(phy->antenna_mask);
> +	req->ht_op_info = 4; /* set HT 40M allowed */
> +	req->rx_streams = hweight8(phy->antenna_mask);
>   	req->band = band;
>   
>   	switch (chandef->width) {

