Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F4DECCF9E3
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Nov 2025 13:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B4cJaSvdyQCbEMb76mhwbw00KVaPl98c0awaqdZ3M8o=; b=N3MvcWoYdYVKjD
	OwDxxaDoL56SYazq3JJFBdzIk8BMWAKbaR+5RcGndxEZNfsjZLXpL8bfn5BYA+GZrAUKEIBJSZleU
	/ZFPO/kA37UNj0V0jgtwO+mrY+BN0xrlxXnnJ5hgHzwI4Lyr/VJ1kRak8cyCCIikW9C28m8GyCUV2
	HggEwkDTZLDncCUsl4pxIgcKCdA0pIMe0JCT6NCbsv4qnWWdGa+EZspxTn9DbQmPFtx37sexza0dI
	b+cgkjrn39eEVifKhyfjC4SWxIq3myAscmf3wbUxJB4J3rWpBYBmHad4HuJD/DYPJIiIW/XH0V9A0
	5T4Mpokzq07k4xWDGdcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIRcK-00000005Sbs-1u5d;
	Mon, 10 Nov 2025 13:07:32 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIRcI-00000005Sb3-0MMc
	for linux-mediatek@lists.infradead.org;
	Mon, 10 Nov 2025 13:07:31 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4775895d69cso15429045e9.0
        for <linux-mediatek@lists.infradead.org>; Mon, 10 Nov 2025 05:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762780048; x=1763384848; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B4cJaSvdyQCbEMb76mhwbw00KVaPl98c0awaqdZ3M8o=;
        b=CS7QtDNWdvhvhoviMg6B7FAhFaJ/X9h2azyobTjN+9s/uwOftv6yA5LIl6XiMKFenQ
         R6DCQI1+Vh69Uf+c3YSgHHJJRaoJMCTUk0mS/41RedskBL2/3YshwFyJDBPcXqb6Qu9/
         6d/AECof0XFA900qCjW8j6V/epkJpViP4K6xPvpTih9uWq+GqRIy5SS/ZRNISFkAqlTr
         jNTcPB9oTqFkHRYHDHw+IlkxLH8X1DtgCqmA5yGN9c8MtSRyTKWcc1Mku0UUHa9cqt0R
         Hox6600GieHKjn7DK8THj8j+xQl/x5wrgDCzjQ58tjDUnDKke321Mqw6sMWvkiteQPH4
         U1Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762780048; x=1763384848;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B4cJaSvdyQCbEMb76mhwbw00KVaPl98c0awaqdZ3M8o=;
        b=Uvp6oV4gjmAanHemSQJ+nePvvlE296Ji/Pn1pd9tUtmVg2UoIebm/wEQ++WQ8zzylo
         tNyPc+t6cvw49+SZuHGJK+wRf6VZkHfAJU9OS2pu9ZHInrwjHk1HtApwMYuDKfTYNYde
         flvksFyd3p6HQS/uqeaI2mBdOmEQRzpgL7h4ycL/yu4fWIf8tXNbTFcWyXCAfenmHI9w
         xjpJJKMMT4QOe7fwV2B0ICTPWsezg1S5EDQC0hkNZhMcM6ricmLXUmj32+KJehNjk8Cb
         t02CSK4nAxs2drYs7SNoQ55rsPG1nIsjYlOVUw9JfI2G1eYcPUUHhv7FJ7nojQitjl1h
         JWlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMpmdGxld6G89dwF1tDCVOV72pJSMnZUex6iK4KGeZLps+fiTLa7jXL+HjKJvjIf3V4tZX/SZduat7PjcStg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyzgsNN24KIBzYHKREHCzD0ric0pIKoMgkcwWOobx3T9srTsXGj
	BK88xoTYI8EFW13YIn4lXb1OChN9vmyi2kqFXOJsptSLYGQlpqHfxdzRb7D0ZSyRVi4=
X-Gm-Gg: ASbGncvb4bEr3CMl8Q7Wy/NZNFHaOD9tn3T7q6jsQCKQptER1JK8sAg71i1JZL4IJhC
	1RQP05cV/P3MlyiIq2SD4r6MxEpnUE7lZ40sQk/xRPkkXHBcAD8Z9dVIKW5rfzY7zvk6pA/TTxz
	iK7R5y4FVfvFDpJFn7NW5ZZ6MIPkr4m/JqunVqjLPqHrYfY9BL7nivdmTZJw1SJPvDmBT6L6krh
	yH824i/X3y7KnO/z6HZixnLM/Eb3f9aVpC9obONrsy7jRAKFLFmYBe7jzzD+SYHLSoi3LQgThwd
	bU4/RxkQQ/Uc7XvTWGFi3kYm3YiS/I4EAKWxw4BxBYd446gRqykGPZZTztgQB1tyVDHvu+Ltgsz
	/apyra5azwu1pAmrV1B4Iv0dMD0PKkcVA8MgbbaG14eFDM1xEVbWxUsrP9s1HqKDKBSFVlZnacK
	3zzEobKT4WyYTqZRtddurmOIM8LTEsDlvVgnI0R20W0h4MGIgT21lxVOo=
X-Google-Smtp-Source: AGHT+IHcCOONTIlqmfkXgQ46x6qRMAz8cIzqeP6tpBIy8/x9/ya7VMOfAxTxh9tydHHTLgqTp1lvxg==
X-Received: by 2002:a05:600c:3b8d:b0:477:641a:1402 with SMTP id 5b1f17b1804b1-477732308acmr85105745e9.4.1762780047939;
        Mon, 10 Nov 2025 05:07:27 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:2b20:d700:6e9c:533c? ([2a05:6e02:1041:c10:2b20:d700:6e9c:533c])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4776bd084d4sm252075645e9.14.2025.11.10.05.07.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 05:07:27 -0800 (PST)
Message-ID: <adceca49-acbc-4ae6-984c-5a8916aba8be@linaro.org>
Date: Mon, 10 Nov 2025 14:07:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v3 5/9] thermal/drivers/mediatek/lvts: Add
 lvts_temp_to_raw variant
To: Laura Nao <laura.nao@collabora.com>, srini@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, rafael@kernel.org,
 rui.zhang@intel.com, lukasz.luba@arm.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com
References: <20251016142158.740242-1-laura.nao@collabora.com>
 <20251016142158.740242-6-laura.nao@collabora.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20251016142158.740242-6-laura.nao@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_050730_188511_1D8C6D45 
X-CRM114-Status: GOOD (  12.66  )
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
Cc: andrew-ct.chen@mediatek.com, lala.lin@mediatek.com, arnd@arndb.de, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, nfraprado@collabora.com, devicetree@vger.kernel.org, u.kleine-koenig@baylibre.com, linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>, linux-mediatek@lists.infradead.org, kernel@collabora.com, colin.i.king@gmail.com, bchihi@baylibre.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 10/16/25 16:21, Laura Nao wrote:
> MT8196/MT6991 require a different version of lvts_temp_to_raw(),
> specifically the multiplicative inverse of the existing implementation.
> Introduce a variant of the function with inverted calculation logic to
> match this requirement.
> 
> This ensures accurate raw value generation for temperature
> thresholds, avoiding spurious thermal interrupts or unintended hardware
> resets on MT8196/MT6991.
> 
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Fei Shao <fshao@chromium.org>
> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---
>   drivers/thermal/mediatek/lvts_thermal.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
> index df1c0f059ad0..31796a5b8858 100644
> --- a/drivers/thermal/mediatek/lvts_thermal.c
> +++ b/drivers/thermal/mediatek/lvts_thermal.c
> @@ -300,6 +300,18 @@ static u32 lvts_temp_to_raw(int temperature, int temp_factor)
>   	return div_s64(raw_temp, -temp_factor);
>   }
>   
> +static u32 lvts_temp_to_raw_v2(int temperature, int temp_factor)

Same comment as the previous patch ... _v2 ...




-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

