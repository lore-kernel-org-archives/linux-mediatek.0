Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 571AAC25B7A
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 May 2024 09:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JRjtoycu6QiYQPIcHAZ506CIemzizife0bP7oo/LEUE=; b=IscPB6aRL9UlmAvD5Ct2guJigS
	XcvhSEl0QUil4z+nizsdC4hZEkSGo204ZvWRLJMhCu7XzpARecK7AfcBAUPLhafqW5d4eLL//xDkt
	0o4UO2p9woDhITdPWtUOiG6gW0DeYFpExVBcRjHdnBgo017WhvLjh8p3lc1FVC/DlbcAskTEsTDO+
	KwLlYuMOyDa2vuR3QW/WevXEbu2yPwhp+ON+RNtZw7btSRh4ETmkQoxpgm5bdA07k3SQkkvTLqEKF
	qU7mL+3Msw1un97XAbC40uVC4nvemlQ/nu/RLZWnCYskgt4HX+9i/5Wkzkfd2cd28+58yuJOXMmEX
	BiHm2PNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9iCA-00000002UXp-0IdC;
	Wed, 22 May 2024 09:23:38 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9iC6-00000002UWP-2prI
	for linux-mediatek@lists.infradead.org;
	Wed, 22 May 2024 09:23:37 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-41fe54cb0e3so36070585e9.2
        for <linux-mediatek@lists.infradead.org>; Wed, 22 May 2024 02:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716369812; x=1716974612; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JRjtoycu6QiYQPIcHAZ506CIemzizife0bP7oo/LEUE=;
        b=0Y50EMz6cHIwVKxvJTLZKhEnehYJZb0yFXc27Od3DIIS2S7E7UUl6iH0Doa4GQsHbZ
         ITW54DdUpW0YoJ08RLqa3BF6w5tD6flnA4NF7cWF0B6NLYyCEYHnztZ35qMQB04uz7PH
         MAcq398kXSwv28pvwX/cDtUrQHSOdXn84afXOREk+picy4U3Dtz1VshcrFiq6sngbQus
         oJ5ts1LRrIJ4Nd8Ge0Qj/caz5xa/WGe5JYKS6CIztOvIUdusziE658+wpJQQ6H0Zp1Ie
         xERkAjdUKOuGc5sAOooR+yiACL8lG5JHq0VeKZx1GShCwXD7YI4N0rG+9CjrrFNzrAXc
         GUQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716369812; x=1716974612;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JRjtoycu6QiYQPIcHAZ506CIemzizife0bP7oo/LEUE=;
        b=nKgDFnHUxVesSzEasMuBBy9VaIl7waQhmZL0E5uGnQYwGvDOemOLmcYA1dTGLRA9dY
         19KhYBskaZtBDClSHxzkhvcn7blx1MKipsiY1/i7M9pSAnl4X+UR9J/UU9VqzH35L1O6
         tgwQxw/CwA5BsyMbxZOLsoZXCGw3va6F66rqz1viKcestP4H99+tynMUZLFxRsAnAMfi
         cORfFKH9CmenFtCOX0Q1aK27D7BHrhA4VUBmI5mmMBG7zw4EneSHb6oZOuKKWFMK0Y82
         CCOlnKec0nDif3cV0PIS4SjBU1t/LbvjBZccGG4DM9fPRjlcYO5S+whOxU3dfO6KbA30
         4QSA==
X-Forwarded-Encrypted: i=1; AJvYcCULtrrcUkyQ/xAbKSJbhWQ8p+LbBIg7QiuwDNb/qu8+UkBdwm4LqPVz+Z6ogzHZ3Ow5C/kUzhea4nG2PyzrpsmzBzTXXcLVyD6nPZYX/Ka4vVgu
X-Gm-Message-State: AOJu0Yw2Z0XcBYU3mUhr1phNIKPq6y3icT4GtB1fbJz9Abc2nVLaCGAz
	lzhpmCuhzMYYNfJ4Ic3MkLt0VDnUaQfCyKEQ3iwX6NxtDXjkSs5rgl05dEjn2gwijiqNKuM3I6M
	NpR8=
X-Google-Smtp-Source: AGHT+IGBRKl5DCZ+kljNpjZnc9YzdCw1hs2bWkudIcHS/AaEdVRmj8bHA3gNsPb+/c/8i/lsYuEbJQ==
X-Received: by 2002:a05:600c:ac1:b0:41b:f359:2b53 with SMTP id 5b1f17b1804b1-420fd37f2f5mr9924295e9.37.1716369811860;
        Wed, 22 May 2024 02:23:31 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42011d91edfsm402874715e9.44.2024.05.22.02.23.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 May 2024 02:23:31 -0700 (PDT)
Message-ID: <e9b8a423-9ee3-4f5d-a0a2-374603762127@baylibre.com>
Date: Wed, 22 May 2024 11:23:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/16] ASoC: mediatek: mt8365: Add ADDA DAI support
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Lee Jones <lee@kernel.org>,
 Flora Fu <flora.fu@mediatek.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20240226-audio-i350-v4-0-082b22186d4c@baylibre.com>
 <20240226-audio-i350-v4-7-082b22186d4c@baylibre.com>
 <a693b696-92cf-48cf-8c9d-17aa7f182d98@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <a693b696-92cf-48cf-8c9d-17aa7f182d98@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_022334_826592_D1C68AAA 
X-CRM114-Status: GOOD (  11.41  )
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



On 20/05/2024 12:27, AngeloGioacchino Del Regno wrote:
>> +int mt8365_dai_disable_adda_on(struct mtk_base_afe *afe)
>> +{
>> +    unsigned long flags;
>> +    struct mt8365_afe_private *afe_priv = afe->platform_priv;
>> +
>> +    spin_lock_irqsave(&afe_priv->afe_ctrl_lock, flags);
>> +
>> +    adda_afe_on_ref_cnt--;
>> +    if (adda_afe_on_ref_cnt == 0)
>> +        regmap_update_bits(afe->regmap, AFE_ADDA_UL_DL_CON0,
>> +                   AFE_ADDA_UL_DL_ADDA_AFE_ON,
>> +                   ~AFE_ADDA_UL_DL_ADDA_AFE_ON);
>> +    else if (adda_afe_on_ref_cnt < 0)
>> +        adda_afe_on_ref_cnt = 0;
> 
> Should we dev_warn() here? The refcount should never be less than zero - if it is,
> then there's some issue somewhere that must be solved.

Ok to add dev_warn, but I also want to keep "adda_afe_on_ref_cnt = 0;" for robustness, even if it 
shouldn't reach this case.

-- 
Regards,
Alexandre

