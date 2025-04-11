Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D72C36010
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Apr 2025 08:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zMGgS5fCEfGgSPkzbjBwVuqib9p8e2egk8zRG8FlzXk=; b=yJoVuRjgt8whgz
	vAn8IRa/2ZU01FUHLQ3w5cj+FQ85n8OWBzYRmOjuFtoDxDVMNo94gwaZh44LBVL4XgjHQUywWeMgx
	mM8kFFxseD2dbPpC/mBszZmHWywfIpGPqrqWfdMTpwIcfBnKUZnCSq8CTcgrTWowJ7ZWOtzcz/2F7
	1feCG6r4lvLZokMqSgzpe5wWMlLSXImwutd+91OX84DmRTZj0iZctMbP6HgWcmnGaaBYL0yK2IDkw
	urTjAXCafiDtujOLaxAxDk5vBTKJhxbJFE6kSkLmsy9NMD4zFuXi15a4Ukreggc1+c+04vVDFCo9V
	uZWw0NW6D1P4eYuUjoFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3A9r-0000000D6A6-13AL;
	Fri, 11 Apr 2025 08:54:43 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3A0I-0000000D4fn-2n7w
	for linux-mediatek@lists.infradead.org;
	Fri, 11 Apr 2025 08:44:52 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-39ac8e7688aso1016052f8f.2
        for <linux-mediatek@lists.infradead.org>; Fri, 11 Apr 2025 01:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744361089; x=1744965889; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zMGgS5fCEfGgSPkzbjBwVuqib9p8e2egk8zRG8FlzXk=;
        b=WuJgtgWO90bQVabBCewCJe6xTx8CTR1QkxSA3hpVPixwvS+YEG68K0gSEJMmArbLMU
         EoLRKNNFSD/HybzdDVBIlmBsIBMbFRVfwNOpV0/ouR/LPJbWEHcWYqLN1ByaGFaw5WkP
         4A4IljkwTPCoCV/c3h02RNBRejEcu6V/gx8psQd/m3fQTAbChTc65VeAS7oRqQ0eaXn9
         yXBVLsqLpFtKSRktT6PH3BD7swqDS6OhyfoRP5dHijd/Nwuft+VMeZjGjXN9Tii9kFDf
         pbmw61mD0ZDPtxBuQ9p5VAPpGctyIvwydwF79uMQHrQi4spfJOYeW6t4289vMyC9h7F1
         mNDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744361089; x=1744965889;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zMGgS5fCEfGgSPkzbjBwVuqib9p8e2egk8zRG8FlzXk=;
        b=Ihrv4rIurZUC7Tj94WZ+EqNWrpW97QJmUcxoS/JtEgYzg/UQ8Jo8Wf4D4PWe+wc6Ro
         QXySsocNpoQZYyjW8iEqHezXmMIheVZ+/sZGnsVPh6nqph6H2OUZHvMh5pR5FU9noQF5
         h9B9cx2DIL07IvyZVZ/iQlnT824dz7B8HHKhtcWNuaWN2/R4xqOrKRqooxaRSSFSSbAd
         Enp2JhL+IkU+dYHGABl+9dKxekw+ouxvrj208oBzSGHu1QZnNKQq+6cnfWPhqnvdaCPK
         GncI3QA5rSZykkJD+zfv8OwbHqClr4v3iOncrcovFOpK2CAhMcmkrEtw4+Oikg3V5cIR
         Q/MA==
X-Forwarded-Encrypted: i=1; AJvYcCWatEwwYe+vx+T8NGWRVidqoJJR84+YmKem103kZ23F+kkueg++ZTqXJJsMiQTPwnXQkc86hAYEv4A3Ohz2Jw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6DWEkK4uv14zGaGF+mVdASNp/bCN5OpAQWU0n4NXA1NHJUbLP
	eym8KSUWfaziqFTxx3fmcg604NDcwHhKcrxG8PRece+EX/T9r2zDXfj+1UaQOvM=
X-Gm-Gg: ASbGncv7WctR2H2uW35pDpxZdJ7Taayy8PP5i2JZe7sso1Z8+uZw5jRacvJqrtWFGhz
	EpBkIu5c5Fq6g9cwDvvjzk5qRW8mygIzwcvt5E+va8avFgOzDe1eJNAi/iuou5mjjCVZpYGXas5
	CpQDW2/9NV1BCHxjEZXG63ZP9yUgCGMUkgCerM0SvXbN6qhEqIIsfSfXkR9KJAtHX3BbpN8WLVn
	MoJ2N9stOQsvGk3pbC17qxJyijZcaQO6+MbYyosvBhOMgze7YtnmuUGsVz+k5xTR3Kgq/OMK2xH
	SHQHpJ2+0VQ1q3HTH5QW9jnZBGykNbgSfJahYg==
X-Google-Smtp-Source: AGHT+IE9HwRJqdBoFZARSKejgbKlYpB5ZyiUnFyow4d/RQYRPI6i3/YxPI/2/DT5RWcCHGw3YkUedA==
X-Received: by 2002:a05:6000:40d9:b0:39c:1258:2dc9 with SMTP id ffacd0b85a97d-39eaaeca292mr1424739f8f.58.1744361089162;
        Fri, 11 Apr 2025 01:44:49 -0700 (PDT)
Received: from [192.168.2.177] ([81.0.8.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f235a5b08sm78726825e9.33.2025.04.11.01.44.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 01:44:48 -0700 (PDT)
Message-ID: <2746c8a3-2d35-44bf-829a-e09c9441c2f9@suse.com>
Date: Fri, 11 Apr 2025 10:44:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] pmdomain: mediatek: Bump maximum bus protect data
 array elements
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 robh@kernel.org
References: <20250410143944.475773-1-angelogioacchino.delregno@collabora.com>
 <20250410143944.475773-3-angelogioacchino.delregno@collabora.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <mbrugger@suse.com>
Autocrypt: addr=mbrugger@suse.com; keydata=
 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
 PVrr2NoUqi/bxI8fFQJD1jVj8K0=
In-Reply-To: <20250410143944.475773-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_014450_716720_C2A1D0EF 
X-CRM114-Status: GOOD (  11.78  )
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, y.oudjana@protonmail.com, linux-pm@vger.kernel.org, ulf.hansson@linaro.org, linux-kernel@vger.kernel.org, mandyjh.liu@mediatek.com, lihongbo22@huawei.com, wenst@chromium.org, matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org, krzk+dt@kernel.org, kernel@collabora.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 10/04/2025 16:39, AngeloGioacchino Del Regno wrote:
> In preparation for adding support for the MediaTek Dimensity 1200
> MT6893 SoC, bump the maximum elements of the bp_cfg array to 7.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Matthias Brugger <mbrugger@suse.com>

> ---
>   drivers/pmdomain/mediatek/mtk-pm-domains.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.h b/drivers/pmdomain/mediatek/mtk-pm-domains.h
> index 2ac96804b985..7085fa2976e9 100644
> --- a/drivers/pmdomain/mediatek/mtk-pm-domains.h
> +++ b/drivers/pmdomain/mediatek/mtk-pm-domains.h
> @@ -44,7 +44,7 @@
>   #define PWR_STATUS_AUDIO		BIT(24)
>   #define PWR_STATUS_USB			BIT(25)
>   
> -#define SPM_MAX_BUS_PROT_DATA		6
> +#define SPM_MAX_BUS_PROT_DATA		7
>   
>   enum scpsys_bus_prot_flags {
>   	BUS_PROT_REG_UPDATE = BIT(1),


