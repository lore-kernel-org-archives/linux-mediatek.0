Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 708A3C7619A
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 12:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pYHWVPNh478r6tCKBA2XsNzS4QSLnNlCpvhx3l9GU4M=; b=kos9gUVnGzIa+e/PPjWOVDb9GM
	rKZy9HQnDuKTwJjpr/tiuo+af3N4oYb1CsXOQAtvncwHcXO3IBW+5YUurEaJMgFAYTr+04Io1NsLD
	TIqw7pgC51oczdBwe4OCkEPtNVzKriopEO3flck9VCHWYqw+tWQ9+KJ2qkF65G4kaB+dg29onUn6Q
	9d3QM1L1lwuYfzuUu8feX88R2GUlP/8HWUYSRN2xj6ZA8spZB0Mjy4GOITPEpgv81kGdfdU4f/BMA
	/USOJsSDE1J3o3WPdaCxiLOYZjFR17MngUdh0HXIQ1YAI+MS5E40Hk6aMyH2iYyvfub8bwG67n8SG
	5vwIGEBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmZpZ-003Bvx-0z;
	Wed, 12 Apr 2023 12:44:09 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmZpU-003Bs1-0v
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Apr 2023 12:44:06 +0000
Received: by mail-wm1-x32b.google.com with SMTP id o6-20020a05600c4fc600b003ef6e6754c5so4147448wmq.5
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Apr 2023 05:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1681303440; x=1683895440;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pYHWVPNh478r6tCKBA2XsNzS4QSLnNlCpvhx3l9GU4M=;
        b=p/2nW88iXr9gE92aTk/lAd1quH/zW8Dnq9X3aW1rn5NMsP3Rn0SPqsEuUYsn+pfwMs
         4PqmXUSTkVT9QT3i+DZkbs+d9HTxOTFrbPTYUybrqjBFntXpnmVGZxouTezFZqDbw2Jx
         JDsERxKmawk+qK3T1DgPRjfPVr48/HPubE0TlyDLfyOH5UyW+5acRF9jdxq80J6NkO6M
         N3ROEqNhRNas9s0Qy4843x6rJ6Ctzw3BjSsukC+VE+gN9X18wFbzNb4SZweTnCRSEqpI
         5z93hOpNpac+/nBLMZfMjv5/7oqOPRmAZ3TO1IhMFaOSeEEecOl0FdCLJ5RE8im4kGQ6
         j1DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681303440; x=1683895440;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pYHWVPNh478r6tCKBA2XsNzS4QSLnNlCpvhx3l9GU4M=;
        b=rFQQ5tg3kS4fGcilpvpDO+TNC5vub42uBC04XywPRWnfu3UT80OsXR6gbdMttii6k6
         9bikmONnIChmhx4jDEvbMHUJJIIWLk9qSirR0lb5nQj3nGZrGltZcpznc63mTWhqhNRI
         hsUJHfs+8koDpEbM+hpSV3HoXTSkaciyAUD4XNlCGfNoUrNSvGXUZWU77nuPYIKc0rHu
         GElag4HhAjFX816M5IzmRw+vsGqZ5oKRZ1022ILdPTp9Lvfs1LV5nkZQmLO49hDoDwTB
         IYddEWSkuKtDpuWxt8lH1xuuWvxkoB3x9hnPcdfh4RYEDGytkCD/AP9Op8gaIjvfI55t
         hZmw==
X-Gm-Message-State: AAQBX9fuosE/i4L1gPBMeFlvmot/pNAo84T8l9KJVRVCk19COXE44HBw
	snqaDREjW5oqGGkSbRsfyiYFTg==
X-Google-Smtp-Source: AKy350aucULWK67KJKFtAg2sbmdsH9C74uYTVOZ+9GeoLa97rJpS2at3kqBAm7R2cg7ApgGk95s6yA==
X-Received: by 2002:a05:600c:c1:b0:3ed:9ce3:4a39 with SMTP id u1-20020a05600c00c100b003ed9ce34a39mr9981692wmm.26.1681303440384;
        Wed, 12 Apr 2023 05:44:00 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id a2-20020a05600c224200b003ee58e8c971sm2261465wmm.14.2023.04.12.05.43.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 05:43:59 -0700 (PDT)
Message-ID: <7d567846-a000-1bd2-6e43-7ca170366d76@baylibre.com>
Date: Wed, 12 Apr 2023 14:43:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] ARM:unwind:fix unwind abort for uleb128 case
Content-Language: en-US
To: Haibo Li <haibo.li@mediatek.com>, Russell King <linux@armlinux.org.uk>,
 linux-kernel@vger.kernel.org
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 xiaoming.yu@mediatek.com, Linus Walleij <linus.walleij@linaro.org>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Alex Sverdlin <alexander.sverdlin@nokia.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230407033341.5139-1-haibo.li@mediatek.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230407033341.5139-1-haibo.li@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_054404_325456_0D77E091 
X-CRM114-Status: GOOD (  24.54  )
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

On 07/04/2023 05:33, Haibo Li wrote:
> When unwind instruction is 0xb2,the subsequent instructions
> are uleb128 bytes.
> For now,it uses only the first uleb128 byte in code.
> 
> For vsp increments of 0x204~0x400,use one uleb128 byte like below:
> 0xc06a00e4 <unwind_test_work>: 0x80b27fac
>    Compact model index: 0
>    0xb2 0x7f vsp = vsp + 1024
>    0xac      pop {r4, r5, r6, r7, r8, r14}
> 
> For vsp increments larger than 0x400,use two uleb128 bytes like below:
> 0xc06a00e4 <unwind_test_work>: @0xc0cc9e0c
>    Compact model index: 1
>    0xb2 0x81 0x01 vsp = vsp + 1032
>    0xac      pop {r4, r5, r6, r7, r8, r14}
> The unwind works well since the decoded uleb128 byte is also 0x81.
> 
> For vsp increments larger than 0x600,use two uleb128 bytes like below:
> 0xc06a00e4 <unwind_test_work>: @0xc0cc9e0c
>    Compact model index: 1
>    0xb2 0x81 0x02 vsp = vsp + 1544
>    0xac      pop {r4, r5, r6, r7, r8, r14}
> In this case,the decoded uleb128 result is 0x101(vsp=0x204+(0x101<<2)).
> While the uleb128 used in code is 0x81(vsp=0x204+(0x81<<2)).
> The unwind aborts at this frame since it gets incorrect vsp.
> 
> To fix this,add uleb128 decode to cover all the above case.
> 
> Signed-off-by: Haibo Li <haibo.li@mediatek.com>
> ---
>   arch/arm/kernel/unwind.c | 19 +++++++++++++++++--
>   1 file changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/kernel/unwind.c b/arch/arm/kernel/unwind.c
> index 53be7ea6181b..e5796a5acba1 100644
> --- a/arch/arm/kernel/unwind.c
> +++ b/arch/arm/kernel/unwind.c
> @@ -20,7 +20,6 @@
>   #warning    Change compiler or disable ARM_UNWIND option.
>   #endif
>   #endif /* __CHECKER__ */
> -

Why delete this line ?

>   #include <linux/kernel.h>
>   #include <linux/init.h>
>   #include <linux/export.h>
> @@ -308,6 +307,22 @@ static int unwind_exec_pop_subset_r0_to_r3(struct unwind_ctrl_block *ctrl,
>   	return URC_OK;
>   }
>   
> +static unsigned long unwind_decode_uleb128(struct unwind_ctrl_block *ctrl)
> +{
> +	unsigned long result = 0;
> +	unsigned long insn;
> +	unsigned long bytes = 0;

Alphabetical order please.

> +
> +	do {
> +		insn = unwind_get_byte(ctrl);
> +		result |= (insn & 0x7f) << (bytes * 7);
> +		bytes++;
> +		if (bytes == sizeof(result))
> +			break;
> +	} while (!!(insn & 0x80));
> +
> +	return result;
> +}

Please add a blank line for readability.

>   /*
>    * Execute the current unwind instruction.
>    */
> @@ -361,7 +376,7 @@ static int unwind_exec_insn(struct unwind_ctrl_block *ctrl)
>   		if (ret)
>   			goto error;
>   	} else if (insn == 0xb2) {
> -		unsigned long uleb128 = unwind_get_byte(ctrl);
> +		unsigned long uleb128 = unwind_decode_uleb128(ctrl);
>   
>   		ctrl->vrs[SP] += 0x204 + (uleb128 << 2);
>   	} else {

Great job! I'm aligned with Linus Walleij's feedback about the need of 
few comments to explain the decode loop, even if your code is clear, 
light and robust.

-- 
Regards,
Alexandre


