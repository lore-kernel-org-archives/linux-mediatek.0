Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6BDCE77188
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jan 2025 04:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AOWmyxksIGQ0wwOhQFWR2aE2r3LuQkCrmyY8eIZP3Dc=; b=xE0JwocCwQSHy9y/tKN1bTkiE/
	wrFHS9YMr1MOOvSgTb5eU5dvpsiqGbP6Z5g0VokIF7vtdYn+ue959o5UAywRlO8NfimFLQS1ysFRw
	MxvI9+1txG88aRR+3dqvROFgxhYaLOE+MtO/35NbNn3uwsyak7Pi2XDYM4FP9aT+tQQArDeMxInY3
	ZDUY2WYmaWFOZ4b+fY56R8ups5wdWKGfDrjPEBjkBohBJ2dCQ/VHmGTtNdtwpxtcJ5GBaZ8UNYJ1s
	EPvYMR0WpUggez3/CDi+doW3baiDgCC+aMbOVW88HVrXdBSqGBjmFX1rR/3GcX9ZAXXoC4RZp0z1P
	P55VeJ7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYHrZ-0000000DpVH-3Jrb;
	Thu, 16 Jan 2025 04:52:13 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYHrX-0000000DpUO-0m9k
	for linux-mediatek@lists.infradead.org;
	Thu, 16 Jan 2025 04:52:12 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2165cb60719so7328405ad.0
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Jan 2025 20:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1737003130; x=1737607930; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AOWmyxksIGQ0wwOhQFWR2aE2r3LuQkCrmyY8eIZP3Dc=;
        b=NeItmDZFlDmCCTgAqAwdyOF9CjmPnHJHUEH2ls9tYxpWdSVB5x5mxGVA9Bd71o217X
         oUKLrimZjPxaFFcqtQulpAFV+EEophbi2V9s4Bahy3unxF+uGKQA8B/W/EREL173SFHd
         4eoVFJXnRadxO1MRTU9lxpX91S6y006KxAel9aTUUIlEg/y+lQbe/fFrto15KSMUvSWY
         4L7Zkku/ao2z/3huZVrNEmPy0Xyxap2nHDHU8XUucM6hDv+KKqFcq1cxHl/Wiyg2REGL
         LyQPS5eaKSh/WOgfMhZqk2sB8TKyPz2C3BRhdem8WMx/2ilKgS97voWN+r1n8Pd4lSeQ
         46sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737003130; x=1737607930;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AOWmyxksIGQ0wwOhQFWR2aE2r3LuQkCrmyY8eIZP3Dc=;
        b=ReSohCdrKR7FQmzVkZNnIhbWWc33dI2fdQjXGIb7/y0j0O/9rl5VwbGqPPTVFXK5XI
         l3JFL0Uwkh1AvmwAMpi0C0zhOQxl/SK7+54aOPKH1LtWiYAlsmwOXFNp7zURsRoY187j
         sKAODtBw2Qwq71dfIBccONlfAR/aePAucwfRjZYpU9L0eILplwCa8O+K1FgWjfAurdso
         ++Wq1mNkO/W41/8Gf3OObIaKhnrWS6d4u8em+aRdFf9zvyyVJ3gpzmH6z3vcJT2Bdy0H
         7cV7+MlUM0AzG0ICrMUSnc6HKA40kXVSW9u+UHnN4Br9twKRJFLIXZyQ9wLO0oyTmWAG
         njZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMijDRTFDZnCdHTejqr0ZnWq7jSyTmiPdfFrr3x3tlVuAM0k9jHCxxoeZh0Ezwz+efniUgD3i7ogSW46upXQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwUaCt4JdxnhgathDgd7ZejzDIT23NpMh7eFgArbCDHAoDlOums
	nW/96Ovf130HWTHS7kYa4bpQi+8T3Iws7KErsxRS2CJbjDNYg1On7RmbAWpV5aA=
X-Gm-Gg: ASbGncvP2roheeaOabv/W7D8ocgPSMs2yyBpXIFu5IXBCdtH2a5ZCINVMe0DvESNKfY
	jQ0cqJ/maF/Hd2AegCHyW4X5mVfTDhbJwhc8mKFkZP4wzIIecDTThZW5aF1YlpKWbKtFqoTEc8v
	vJ7bg/CiecRCs5BjHPO+6aSDY7yNhg6qa1a7BoUrSdSHjqmKoXOHcZIecnZvw8ZTOKab0Jgy6cA
	o3Nmg2aexziTeoXIFrivZrhdtH44AHLnaEXYUZt1ig1T8OqvXTi1/yIpoMaHNjG0WseB5c=
X-Google-Smtp-Source: AGHT+IFdClh55M2sh3NGGkRxPih7LhmCsVDPwH4rFFOPzqgi1cC12kO5lb+ICakqsGCKRHcDhEzKVA==
X-Received: by 2002:a17:902:c411:b0:216:2bd7:1c49 with SMTP id d9443c01a7336-21a83f64abemr481766055ad.29.1737003130537;
        Wed, 15 Jan 2025 20:52:10 -0800 (PST)
Received: from [157.82.204.145] ([157.82.204.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f13c92dsm89358035ad.97.2025.01.15.20.52.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 20:52:10 -0800 (PST)
Message-ID: <05f32e33-8cf7-4c23-bbcd-aaed0c7aa02b@pf.is.s.u-tokyo.ac.jp>
Date: Thu, 16 Jan 2025 13:52:06 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] spmi: hisi-spmi-controller: Drop duplicated OF node
 assignment in spmi_controller_probe()
To: mchehab+huawei@kernel.org, sboyd@kernel.org
Cc: konradybcio@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, marijn.suijten@somainline.org,
 bjorn.andersson@oss.qualcomm.com, abel.vesa@linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250116044725.2946205-1-joe@pf.is.s.u-tokyo.ac.jp>
Content-Language: en-US
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
In-Reply-To: <20250116044725.2946205-1-joe@pf.is.s.u-tokyo.ac.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_205211_229327_2DA8BA13 
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



On 1/16/25 13:47, Joe Hattori wrote:
> spmi_controller_probe() assigns a parent device and an OF node to an
> SPMI controller. However, the operations are not needed as they are
> already assigned in spmi_controller_alloc(). Thus, remove the duplicated
> assignments. An unnecessary OF node reference acquisition is also
> dropped by this patch.
> 
> Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>est,
> Suggested-by: Stephen Boyd <sboyd@kernel.org>
> ---
>   drivers/spmi/hisi-spmi-controller.c | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/spmi/hisi-spmi-controller.c b/drivers/spmi/hisi-spmi-controller.c
> index 3cafdf22c909..122140b97579 100644
> --- a/drivers/spmi/hisi-spmi-controller.c
> +++ b/drivers/spmi/hisi-spmi-controller.c
> @@ -300,9 +300,6 @@ static int spmi_controller_probe(struct platform_device *pdev)
>   
>   	spin_lock_init(&spmi_controller->lock);
>   
> -	ctrl->dev.parent = pdev->dev.parent;
> -	ctrl->dev.of_node = of_node_get(pdev->dev.of_node);
> -
>   	/* Callbacks */
>   	ctrl->read_cmd = spmi_read_cmd;
>   	ctrl->write_cmd = spmi_write_cmd;

Kindly disregard this patch since I forgot to CC 
linux-kernel@vger.kernel.org. The new patch can be found at
https://lore.kernel.org/all/20250116044725.2946205-1-joe@pf.is.s.u-tokyo.ac.jp/

Best,
Joe

