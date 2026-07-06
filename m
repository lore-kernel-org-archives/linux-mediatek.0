Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C66C43458
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jul 2026 15:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z7QdVjoOKtxuvUEU767FFuHnfqMD1JnXubUuX2zL/s8=; b=DozP345pu+oj2Wd5MlsSKtWLGy
	/GlMukJTSGBAnSJrlcz9XbZ8h5VVocuWhh711GhP2tZQw6jAdvr2wFvqVF043ZRo1LYOvOlvp+MxN
	UxsBKVJ49XLLAR4HHiQ7SHqvtSuuE8wLgaypiEXlP4mLl14Dtq3mNXUklHF2anrNTvNMzIxTCz7F5
	BC5MLc/wThO/s11XchGN+qRwnG7IKFXuGhFCP32KG3Zg8eNgRzCq1fa0dVmm7KsQHB5Lg3+iUMuh6
	L3Hc1m97sST7snrIi2UA4x1bpSQuNxnEGoEQD9IOb11/3NYO8kv5R0s6pSaPwfDkB45xLRRzq8BJr
	wfoIVu4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgkty-0000000Cq8N-1FDb;
	Mon, 06 Jul 2026 15:06:30 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgktu-0000000Cq7E-0O2m
	for linux-mediatek@lists.infradead.org;
	Mon, 06 Jul 2026 15:06:28 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-493b61b52b6so21848545e9.1
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Jul 2026 08:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783350384; x=1783955184; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z7QdVjoOKtxuvUEU767FFuHnfqMD1JnXubUuX2zL/s8=;
        b=d/KesYU2kRZ5V/vd/EyPep+C7MIUTqy7Blu30eyncYOU/C++RVTw5GMhbdYf3p+IQx
         18nlQtoEfyCBg7CEVxJJC82a+uMcv/o57g3ewlYHklMlcYXquRRscuq43GmajtcXjJn2
         KHyQh94oVXv3vOlHOoUEnEtaXCzrjpHUgG50tdUoBElqnpOT0HvCvGd6p/SeH7VZCtZ4
         9gyIoYhFUsL0Sk2mUFP5mifizBkRo0CjK02OSrBuvVhe4MwrirLKJaiqhvvZVRJfFJl9
         e/dLF9ASFgXq61AdHzG+edzvgJ7MHkPxjCexv+9VsRb8QciNMv32lCjDpR7eyuKp8ojp
         PL0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783350384; x=1783955184;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z7QdVjoOKtxuvUEU767FFuHnfqMD1JnXubUuX2zL/s8=;
        b=qOxMiltSzDgFrvQW1Jfy0xMFDkL1Xj6CWbje33749rhurQJko3MIevzkHa+397OP20
         N1/C3o0E2/LO+y0R9uR07xnmaQ+KvMVR6sZNTXT9AB2/gWX61tFyh+2p0IUU/yDm55s+
         puDb9tHApFN8fMUSasWHs1dtdpvN/Gd5VYyrZ1dxjvtB4cxq1m8fkVLpBV//AaJemu3C
         yAesMO8QTIDtGw9H1jd95wv7k1TJLehIm4zzQHhb/7WFNJ6RHsYSq9mpfdDD+XAtWdu/
         6ONMfmjzS5lP9Gy8PkK8X7rHRP2JiprslFf18SeO7cUQq2Qw9L3ovt4Sjv3c9Axu9xu0
         ECjQ==
X-Forwarded-Encrypted: i=1; AHgh+RrAEF2M5pQiA3fMgAU9HuZKXh2Pr2VEmc+Hi9tzkjql1Ixb4Coh7eo/mNB2F7qWCQowwo8idjNx+kcrG1LQ1A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxCPcxyaf+7GBrui4WfPfi584WHuFOpfwExRoyG9pMMMZVG4P11
	23FEzX7Z/fUynpIe9/T9Y33iNb9w0zdjDWst/XgHyRwDvuTKNKJxG7ywlXtjE9waSAg=
X-Gm-Gg: AfdE7cln8tgw9KtUhLvK2uPABwfmW4el+Cq/xgINC6a8LSP3va00Fp+u19/SYskDG3l
	t8AO7I5qotpHIrB8QbM5sKtmzxf0gCS3bf+x39yJoUWWWqeAjLwvLff3xyIFUavfJFO6VhOAHRA
	gDGIy+gcR/nKWtLyo4PFCsTd2gIcRnnu+DVWjtKAXAR28emPy7k5YWqJskhbIYsjOBNI0/9o4lD
	meMq8yCiP3I5RyCrt/3yZn1zl9HNlMpS2Xm48JaM50GgwoJLSm5/nZGb1HwSQV51IrpbwzaxkpD
	wX5iHfl5WhnTCIjQwqSpsJwUYc34sa8p+G4Kx9lsalYo24SWw9d+frKq5RRIoRYxRv96w8QLclx
	nLrbPssqM8UW5AL0IOrP0eMQAl3W2HHOZvMvBsKgkrMxP2+D79YqkasbhvEEsRNlNGJ1YcAij1W
	sBQW8RQggUQu31CA7fFdbMAh/2Atr9O/LlAzKXh5ZkHpfAk6aAGHZgRaORgzde
X-Received: by 2002:a05:600c:6990:b0:493:915b:dc4a with SMTP id 5b1f17b1804b1-493df055999mr10670715e9.8.1783350382884;
        Mon, 06 Jul 2026 08:06:22 -0700 (PDT)
Received: from [192.168.1.136] (48.85-85-171.dynamic.clientes.euskaltel.es. [85.85.171.48])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493bef17c82sm291903115e9.1.2026.07.06.08.06.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 08:06:22 -0700 (PDT)
Message-ID: <a275b0b4-30c6-4a9e-bcd1-56de269423de@suse.com>
Date: Mon, 6 Jul 2026 17:06:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: power: mediatek: Add support for MT8196
 direct HFRP
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 ulfh@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, nfraprado@collabora.com, irving-ch.lin@mediatek.com,
 macpaul.lin@mediatek.com, aford173@gmail.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 justin.yeh@mediatek.com, kernel@collabora.com
References: <20260701121920.19347-1-angelogioacchino.delregno@collabora.com>
 <20260701121920.19347-2-angelogioacchino.delregno@collabora.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <mbrugger@suse.com>
Autocrypt: addr=mbrugger@suse.com; keydata=
 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
 PVrr2NoUqi/bxI8fFQJD1jVj8K0=
In-Reply-To: <20260701121920.19347-2-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_080627_218854_976BFF5D 
X-CRM114-Status: GOOD (  11.99  )
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



On 01/07/2026 14:19, AngeloGioacchino Del Regno wrote:
> Add support for the HFRPSYS direct control power domains in the
> MT8196 SoC, controlling power for the DisplayPort and for the
> Embedded DisplayPort Transmitter IPs.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   .../devicetree/bindings/power/mediatek,power-controller.yaml  | 1 +
>   include/dt-bindings/power/mediatek,mt8196-power.h             | 4 ++++
>   2 files changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> index 07f046277f8a..070c6e5666dc 100644
> --- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> +++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> @@ -34,6 +34,7 @@ properties:
>         - mediatek,mt8189-power-controller
>         - mediatek,mt8192-power-controller
>         - mediatek,mt8195-power-controller
> +      - mediatek,mt8196-hfrp-power-controller
>         - mediatek,mt8196-hwv-hfrp-power-controller
>         - mediatek,mt8196-hwv-scp-power-controller
>         - mediatek,mt8196-power-controller
> diff --git a/include/dt-bindings/power/mediatek,mt8196-power.h b/include/dt-bindings/power/mediatek,mt8196-power.h
> index 0f622a93c807..085790bf8124 100644
> --- a/include/dt-bindings/power/mediatek,mt8196-power.h
> +++ b/include/dt-bindings/power/mediatek,mt8196-power.h
> @@ -30,6 +30,10 @@
>   #define MT8196_POWER_DOMAIN_MM_PROC_DORMANT		0
>   #define MT8196_POWER_DOMAIN_SSR				1
>   
> +/* HFRPSYS Multimedia Power Control (MMPC) - Direct Control */
> +#define MT8196_POWER_DOMAIN_EDPTX			0
> +#define MT8196_POWER_DOMAIN_DPTX			1
> +
>   /* HFRPSYS MultiMedia Power Control (MMPC) - HW Voter */
>   #define MT8196_POWER_DOMAIN_VDE0			0
>   #define MT8196_POWER_DOMAIN_VDE1			1


