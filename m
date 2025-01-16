Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8287C02180
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jan 2025 09:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z2ao+rKhy2rrFNzC5Hk6CZpJrkvTuzh6Wda4P8nTqpU=; b=BRy8UZxYV7oxoj
	xSaG0TPkEw1Xa/h3JdGiSUS827C5Y9XEaXqh9TXSN9r1n2TlBVKwxfpkqLttmLCnK1GkB0YrMmqMN
	7wXcOyGL6IRLPhYQNsJbe1+X1Fo+ylC2I5KIaiL3encrumdD4+ID7WQcp76LW/RqJSatJetMHhpZ2
	ThzyHHRM+fkkTNmQLO77JqytWtlY+YaH9TYtfjBNLTl0UyClKHLKrbd6DH28jlmQW7yEgNCRmS6gw
	2quvnuPiMg9RV1A7cfnp0n8thAFIFkft27NPK1WKBE851UfzPUFO38uGLITXx7XUSBqN0FKKQJ1ko
	5Fi4xpD9qbCKywpI6PYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYMCf-0000000EN0d-3XZi;
	Thu, 16 Jan 2025 09:30:17 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYMBO-0000000EMjh-4BSA
	for linux-mediatek@lists.infradead.org;
	Thu, 16 Jan 2025 09:29:00 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4361e89b6daso3701675e9.3
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Jan 2025 01:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737019737; x=1737624537; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :reply-to:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z2ao+rKhy2rrFNzC5Hk6CZpJrkvTuzh6Wda4P8nTqpU=;
        b=W48f2hOAns40Jzdo7f/0t8JUox823gXYXFGQ0wUZnN3EHVV7Axti6e1RRnX7Cb3cGS
         AaLNPKoQdHSf19evGrKWdv6qYNWtFboaUsiBaziWCe+TOPHJ3WdIZKm1Wox0aTPV/LUi
         oCCP3skhnqnLOLHpzFGJv4JIX0tA+yAkMAT+pEL5H6yeNrPrem77+CkrNO/m71xefN0n
         TDBj/Mc8gkSGUu7no8EgiITG4/G6guVUoahciONgSq4gzt2IrLQKx0BNgjmgYxnrQGvq
         NuuMfffBVSeC7QPv16HihdfHU14Lvh2J5FLLXlvTdsZmYxM2tKE7WA5Hy9EFQNRvn1Xa
         a6+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737019737; x=1737624537;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :reply-to:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=z2ao+rKhy2rrFNzC5Hk6CZpJrkvTuzh6Wda4P8nTqpU=;
        b=AyOhjZv+rxYIVv53tSyRZwmbKcg1mxydvmmNKLRSUQzNAZIM/RlyQqYfxXnIdZ+wKM
         lHVU/gkwsuysHQ9u4Z/wL6YmlAD2nyiSpAyAUdzFUwOPiHQry3GOqgshUQFkjsEo7f0s
         MbnxiGPmE+h6/CwJdVXwDrXW+pWQs3fIndhDQqfh0bvU6mS6o/gz2cUgh1008JOqLXkN
         MEyDvcr5IPZhv0qBy3xBRTdjLmlw8xfGxZerX7uBS08CuLAOdmBdrxUS2KRMa1LoEKuL
         Armh4oK9mRhBpByFhA6/H7pRu6AhqtD5pfYlkOlOSciW4QYePzHiFCBT7rIK9maJvZLY
         iYQw==
X-Forwarded-Encrypted: i=1; AJvYcCUTX1aff0nS0iNJhPsOthxnfbZ3h87YpjnxRx9TZvbiRpbFg2jkYWTe8ouQXFfHQR2MYYXqH3OXTxWuzgy5/Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy963gmRLK5i0OIiU9pjizywk9ioOuE1PBuC3ISRFTXuvrH86AE
	ISZ7XbzNESEMiG96BlyElrvGy70JD31TTAosNIl4hrXpckDwni5TVAOBIvK4/Yk=
X-Gm-Gg: ASbGncv4YjbXzgT/AKgJMCux6vBqXaheyiZeOu+svzIsm28yAazhHNJG0MO1gksbJKD
	HK9Lswo9VMFw62DIDsJijyuJQBLelfFDd8IXkLVkS5Z3PUGM/L/D643Qfq+ZzcOvWolvqmB87tq
	NURC1iFMbmr60e5v9cin6hDfpWxunvsteYd+A2x9c75J+AuRtcW54ZNePcSjiXvfwrxOPrmz7jo
	x7xrGJHEy3df9aVS09glSitXzHYMxIala8Qx+tXKViCeUBXuxYrxg7PXVL7IiNIIV1FP4hNTtyr
	KKvC4BYkYihs6vzDtzR8V6fP+N2XXE8=
X-Google-Smtp-Source: AGHT+IHdmWN7Oeq0S+zEiZuKe5KeBcQ85jvcioqfybqbDRFTq5jmeJjyGwdZonKpDmR4f3lwPMFpRg==
X-Received: by 2002:a05:600c:a08b:b0:431:5863:4240 with SMTP id 5b1f17b1804b1-436e26dda73mr251928715e9.24.1737019737060;
        Thu, 16 Jan 2025 01:28:57 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:69b:c51f:3072:d4f5? ([2a01:e0a:982:cbb0:69b:c51f:3072:d4f5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c74e5e69sm51988535e9.37.2025.01.16.01.28.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jan 2025 01:28:56 -0800 (PST)
Message-ID: <92b2f271-34dc-4560-a96c-bdd372d5e3d6@linaro.org>
Date: Thu, 16 Jan 2025 10:28:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] Support Multi-frequency scale for UFS
To: Ziqi Chen <quic_ziqichen@quicinc.com>, quic_cang@quicinc.com,
 bvanassche@acm.org, mani@kernel.org, beanhuo@micron.com,
 avri.altman@wdc.com, junwoo80.lee@samsung.com, martin.petersen@oracle.com,
 quic_nguyenb@quicinc.com, quic_nitirawa@quicinc.com,
 quic_rampraka@quicinc.com
Cc: linux-scsi@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "open list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-mediatek@lists.infradead.org>
References: <20250116091150.1167739-1-quic_ziqichen@quicinc.com>
Content-Language: en-US, fr
From: Neil Armstrong <neil.armstrong@linaro.org>
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
In-Reply-To: <20250116091150.1167739-1-quic_ziqichen@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_012859_053043_052EC56E 
X-CRM114-Status: GOOD (  11.36  )
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

[+linux-arm-msm@vger.kernel.org]

On 16/01/2025 10:11, Ziqi Chen wrote:
> With OPP V2 enabled, devfreq can scale clocks amongst multiple frequency
> plans. However, the gear speed is only toggled between min and max during
> clock scaling. Enable multi-level gear scaling by mapping clock frequencies
> to gear speeds, so that when devfreq scales clock frequencies we can put
> the UFS link at the appropraite gear speeds accordingly.
> 
> This series has been tested on below platforms -
> SM8650 + UFS3.1

Which board did you use ? the MTP ?

> SM8750 + UFS4.0

Did you alse test it on SM8550 ? this platform is also concerned.
And perhaps SM8450 should be also converted to the OPP table & tested.

Please Cc linux-arm-msm on all patches since we're directly concerned by
the whole changeset.

Thanks,
Neil

> 
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
>    ARM: dts: msm: Use Operation Points V2 for UFS on SM8650
> 
>   arch/arm64/boot/dts/qcom/sm8650.dtsi | 51 ++++++++++++++++----
>   drivers/ufs/core/ufshcd-priv.h       | 17 +++++--
>   drivers/ufs/core/ufshcd.c            | 71 +++++++++++++++++++++-------
>   drivers/ufs/host/ufs-mediatek.c      |  1 +
>   drivers/ufs/host/ufs-qcom.c          | 60 ++++++++++++++++++-----
>   include/ufs/ufshcd.h                 |  8 +++-
>   6 files changed, 166 insertions(+), 42 deletions(-)
> 


