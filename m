Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C58C02182
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jan 2025 20:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Majoph8E+cCh21U54jZPyu++uXYCQ8kOGOIWq+E+Nk0=; b=bNbrDqLborM25LQliiFmDLbM1E
	2Zff3wc0im/Hw23XNc7z/LHBJE0fJrxJgLeb4+Wqv1r+SnYzaXqUzEs1PJv6g15x+lfFAWT12yacS
	vqAGh/O8X5xxCaruoBokOjhDyv6Wt8r33dR/fm+fy6bLHM+L4TpijVUPZhWh9DQs1NoiEb4bYsMZV
	9AEKpxkBXBGX1gkyacgnUGIaCaf0aRVw+D+P6WUZz5RyGH4ABaGw0uJZt4CZ/I01KT9ZhmqGLE2lT
	LEdAbBj3BCZOqXjq8njSBKnxon7H7h0ag8Qwd33LTDIrq6lW92h1PYozTnfsjRg6aD/iANH8Nf884
	9OjQjsvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb3aS-0000000DDIB-1ebl;
	Thu, 23 Jan 2025 20:14:00 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tb3Z9-0000000DD2y-1zAn
	for linux-mediatek@lists.infradead.org;
	Thu, 23 Jan 2025 20:12:40 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2ee9a780de4so1922781a91.3
        for <linux-mediatek@lists.infradead.org>; Thu, 23 Jan 2025 12:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737663158; x=1738267958; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Majoph8E+cCh21U54jZPyu++uXYCQ8kOGOIWq+E+Nk0=;
        b=RY2sfzc8tvjUs2iQrqxILKQq4VDP9h+bTwPStaQfLmwcGO8SPwlKO+mKzmsYwEltLA
         zioEJ85gODIkcv9VK/2ILEUMIdALuFblPR3B0cBy5Dqsjb5g9yqqQPQJFxIfo9dn3iL7
         Jvatuih3h/zQigmx3uDdTi1Z72nzjmksHF0GQXItAaWs6gpnnrHbxCLvxCGiLOL2dcPC
         00lLc1Dg6jtR9jrTm4MAN44kcoPYUaCYwcQ9eQfHJaoxai4Gv9Pkx5J5jsd4j0OJqOHE
         q4RUMS8Djcj19sztXIuoF5vTOIUYqK4U/pn6SaYLmtAODx/jE2hzkISNs4CmIENoyQLQ
         tm7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737663158; x=1738267958;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Majoph8E+cCh21U54jZPyu++uXYCQ8kOGOIWq+E+Nk0=;
        b=pYvK7VBOURjqTwNOq28vLe51wRhBYW8MMw2wJDkrxTKcAdSbsDCyziNX/a9CEOUVyY
         dBp9U9Bw7KbKpRTiz6QLs3D9vQOjHAUZuc38DLjFwOEOtp219MPMUzf8Iv3+Mkd9O4ed
         gV7Ojecw+DGTImH93YLtZlsTmbVGRQLB7G1dC8WcP0NDyT26EKxvsIV1Bos05qjoAq6G
         +NnQiFIij6027+PoAsUD6PXqv9AM1W01Mxt4DFEWop2sUuAEUPljhbSaP9RJU0atJ/fi
         E3TVzim2XH3CJOAIXZvh+GzMOc57qPd88x61Lfr+VT77gYsQYaeS4SIlT0zzLkNd2/kX
         APOg==
X-Forwarded-Encrypted: i=1; AJvYcCVRZdFwjRkE2JRfbuA80lY2y+puruPzUcfG2FzbO7O8cbq0fRvOBa1R1Ly2vemG/jwgmPStkqPxm2GjTtMSMg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2hh9g6fgP0PtJjb+bdyGkezFNFjN69yE9nWCOoe8Cu4uHluhq
	X331puvLiEEluOM90q0xF7Zu/1oAGOVwV+GG7+I24rLTUl/FsezZTGScZTr/Wmo=
X-Gm-Gg: ASbGnctmONi2EBFO9xjB78iDaWdKfuTDccg32VOYAaW0ZrrmYgpLZW/u1Y/VCwVj33K
	aTk7MxIV6hwqqJw/tkB99mUFhrghxEu9TwNFFwCgSGHvWD+UuKUULIcYNmlVxodXyLHSwL4eYnB
	ms+Q1NDwwLhQhsDnF6QFVgs9WmT6zg1ZE5iZFaTt1/GFYSS9V3RWlxke4X1kWwlTwhj4uRzbLFV
	ygvqM9XwxpyceDCu9h8vCkQ6DdwstP66JSZwh/CYYupjMef5Do+Z2cmpmiWCNhQEjHpqM55QJ+y
	2sRWKUQYejT/WJI=
X-Google-Smtp-Source: AGHT+IGjYLbdTkDtVsKIemv83lRYfSaqRItS6634hiKj+p4fMBDbSMDFpjyvf11Hf9VpoP3IInSiyA==
X-Received: by 2002:a17:90a:c2c7:b0:2ef:2d9f:8e55 with SMTP id 98e67ed59e1d1-2f782ca1fffmr43193938a91.17.1737663158301;
        Thu, 23 Jan 2025 12:12:38 -0800 (PST)
Received: from [192.168.5.187] ([4.16.227.147])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffa54a83sm122332a91.11.2025.01.23.12.12.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 12:12:37 -0800 (PST)
Message-ID: <d4881156-a003-41fe-824e-4c29e279fbb7@linaro.org>
Date: Thu, 23 Jan 2025 21:12:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 0/8] Support Multi-frequency scale for UFS
To: Ziqi Chen <quic_ziqichen@quicinc.com>, quic_cang@quicinc.com,
 bvanassche@acm.org, mani@kernel.org, beanhuo@micron.com,
 avri.altman@wdc.com, junwoo80.lee@samsung.com, martin.petersen@oracle.com,
 quic_nguyenb@quicinc.com, quic_nitirawa@quicinc.com,
 quic_rampraka@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "open list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-mediatek@lists.infradead.org>
References: <20250122100214.489749-1-quic_ziqichen@quicinc.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20250122100214.489749-1-quic_ziqichen@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_121239_504303_E4BA79FB 
X-CRM114-Status: GOOD (  11.63  )
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
Reply-To: neil.armstrong@linaro.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On 22/01/2025 11:02, Ziqi Chen wrote:
> With OPP V2 enabled, devfreq can scale clocks amongst multiple frequency
> plans. However, the gear speed is only toggled between min and max during
> clock scaling. Enable multi-level gear scaling by mapping clock frequencies
> to gear speeds, so that when devfreq scales clock frequencies we can put
> the UFS link at the appropraite gear speeds accordingly.
> 
> This series has been tested on below platforms -
> sm8550 mtp + UFS3.1
> SM8650 MTP + UFS3.1
> SM8750 MTP + UFS4.0

Thanks, could you be more precise on how you tested this feature ? how did you exercise the gear changes and check that is cales correctly ?

Thanks,
Neil

> 
> v1 -> v2:
> 1. Withdraw old patch 8/8 "ARM: dts: msm: Use Operation Points V2 for UFS on SM8650"
> 2. Add new patch 8/8 "ABI: sysfs-driver-ufs: Add missing UFS sysfs addributes"
> 3. Modify commit message for  "scsi: ufs: core: Pass target_freq to clk_scale_notify() vops" and "scsi: ufs: qcom: Pass target_freq to clk scale pre and post change"
> 4. In "scsi: ufs: qcom: Pass target_freq to clk scale pre and post change", use common Macro HZ_PER_MHZ in function ufs_qcom_set_core_clk_ctrl()
> 5. In "scsi: ufs: qcom: Implement the freq_to_gear_speed() vops", print out freq and gear info as debugging message
> 6. In "scsi: ufs: core: Enable multi-level gear scaling", rename the lable "do_pmc" to "config_pwr_mode"
> 7. In "scsi: ufs: core: Toggle Write Booster during clock", initialize the local variables "wb_en" as "false"
> 
> Can Guo (6):
>    scsi: ufs: core: Pass target_freq to clk_scale_notify() vops
>    scsi: ufs: qcom: Pass target_freq to clk scale pre and post change
>    scsi: ufs: core: Add a vops to map clock frequency to gear speed
>    scsi: ufs: qcom: Implement the freq_to_gear_speed() vops
>    scsi: ufs: core: Enable multi-level gear scaling
>    scsi: ufs: core: Toggle Write Booster during clock scaling base on
>      gear speed
> 
> Ziqi Chen (2):
>    scsi: ufs: core: Check if scaling up is required when disable clkscale
>    ABI: sysfs-driver-ufs: Add missing UFS sysfs addributes
> 
>   Documentation/ABI/testing/sysfs-driver-ufs | 31 ++++++++++
>   drivers/ufs/core/ufshcd-priv.h             | 17 +++++-
>   drivers/ufs/core/ufshcd.c                  | 71 ++++++++++++++++------
>   drivers/ufs/host/ufs-mediatek.c            |  1 +
>   drivers/ufs/host/ufs-qcom.c                | 66 +++++++++++++++-----
>   include/ufs/ufshcd.h                       |  8 ++-
>   6 files changed, 159 insertions(+), 35 deletions(-)
> 


