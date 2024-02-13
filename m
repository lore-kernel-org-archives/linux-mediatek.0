Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5882C48BC1
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Feb 2024 11:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=99tKWXJsyD1+GaANADhQPLuJwfmrp0nEqtu0ZF/vQt0=; b=rmM/L3g6ywPPwYXKE1ZScZP+z7
	lbF2ndBwrVq6zmr7z6a7NxjdFfn2JrdgSXnwLvhwEVp2UzGjZNGSmeJgMPVwNsNDdCyfGR2ACXpXa
	OP59MnkDzwz7h/wmf5D+RQMosk6WJPzBgtTyD/qlqSkRm3gGeYjDnGbkaCZvnGTVM/a3WN3GCtV44
	yt6gZ2m6sMfaZijEV1n5N/LpHT1dbbHX/NRQcP879DlxFA0A6N598Ny5qirMH2i98Mjk63FkYuFFY
	3Bei7ouyixm7ACKaZjC3ZG6iij2Wwx/VXbryupOImjQJAkHDQh7CeYh5rKru8kXi1hOlbWWuOn+1P
	Ae3tBUvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZrNM-000000095ap-0A7l;
	Tue, 13 Feb 2024 11:55:00 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZrNJ-000000095Z1-27kA
	for linux-mediatek@lists.infradead.org;
	Tue, 13 Feb 2024 11:54:59 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-411c7359e35so2469675e9.1
        for <linux-mediatek@lists.infradead.org>; Tue, 13 Feb 2024 03:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707825295; x=1708430095; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=99tKWXJsyD1+GaANADhQPLuJwfmrp0nEqtu0ZF/vQt0=;
        b=HR6uKll3kk7geJeEVUzgcnX6HQOon15vjU1DTNz5Ws2FuRrenPJepdz94hKqTFE7tS
         dntdJd8Cv9mVbN5/zxTR298scMwYzqOfzMxuqKWS+9Rb8GXM7cjehAnjAkHW4skXhAcp
         ORj4keCbgumh4t9wrXsFaYDZ6ze8M4RUj1w8SfKbj80taKLavMgkZyjrpbGefEMYQTlh
         ZOg1eTCRuH9THhsj2+j7K0aal5Iag74rnpFHtSF0c2FeRDT9bSfAGlQREqdl5IHWLgsz
         1A62BoKMWmag+Z+CQpVf82xqQ11lf20W//+68ggFM7F5iJfFgOvMyPp47cSOp1E0QFyt
         0ZYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707825295; x=1708430095;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=99tKWXJsyD1+GaANADhQPLuJwfmrp0nEqtu0ZF/vQt0=;
        b=mwTkFm4XevHZsRO+3OoeSc+Raz/blfkRmcvphJXgG8wL6ZbSJ40VLEP2yF0NzZR89w
         YgM5srL0x7StY4HrV7HyC+n+bBRi0uVr8BpATNnR+p1T9BCKIZrMfNfGKmbMhXOIig0H
         KSQMv1fheaoGDwPAmP70sYKQY9iuR8zpfrTa2yoDPeC3Ma/WX3LooeyHD42CXDQGZo7h
         CsOdapmls3UYXEdy9WW60q5mEEahyH8za1wQ1wx9ubEgDk+bFhwTqg5RDTL19ZA0Ld7W
         652C3AnU1wBEe9cVu3+VcayHJH4VrqrL32+8hiCNZGbTgEktxswiMLhZe6Seu4B3JqiP
         ELBg==
X-Forwarded-Encrypted: i=1; AJvYcCV6IuvT6wjLdFBhmAlFTngVu0TbDDMWRjeXEUVpdYvg+f78n7djgDo9aDoIv1qPIGDPWzJNCjwj1LiNvYY6w5OItt3zHHHD9eFZYyQWDpypyUVG
X-Gm-Message-State: AOJu0Yz1MAn7n8NV0BFCu1htjPi4usuRdNJJUc6dSz+FVjamvVPzgcXd
	9iKbJruy/aSidOAMuTwC/NQRaOkg1CmwPuKXcOyITFSqcVBnA1mAwx7VVTgvdXc=
X-Google-Smtp-Source: AGHT+IHGQ2aMYIdGYJIv42FsAKrZu/3Fya8npB6QiuMT/v02JoCEShYniIGIiBnoXqvMFeFB91zkyg==
X-Received: by 2002:a05:600c:3587:b0:410:880c:b85c with SMTP id p7-20020a05600c358700b00410880cb85cmr7924099wmq.2.1707825295677;
        Tue, 13 Feb 2024 03:54:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWYS7ABtKfHePj92eloyH20dIgAwggcorlQW5Qj2CAsMPmY3pH1U80cdjS+bu2EyYuqDa1g+0AIxr/ow2Qkha/a107DVw2ZAM77L0lEdS4tW3l50MKXvhTJI5pFzOeJMF/NyVcX7dy1PEauexYDMyzVpHZt/ckfsV2/zDxaw/VRMdSF1mDd4ZXT+k80Hx29M5yamjtOTpXhfd6VAIorjg/UDohrhCGsTlLuWFRs4AM3jp7tBJV00rLHT1eFIhek32+7yUir6fuwY2yvY1Ek8UfoIWUx9hSx20rMn3B+iL+FB5lNTyIqChgpv+qasAqb2huwyKIB99NWnLhZ0ZBe0RhvtZ8YJGwcNau1rI1/p3F2irakNmhkHuDebCViZTB10HXKHyIl31MCRwHcQs74ECo7p03UOXx3jAt3ZEKr3pnWUEN03C6p59dBtqACdrBqQbmmEwjqk1rbDGnofz5iL4P+ynHGkWquLglKdLOlXnzaTCfRDGtC0kOqHP+EiAuG9dMyhLbW7xaPJCp9hXvnj3nw
Received: from [192.168.1.20] ([178.197.223.6])
        by smtp.gmail.com with ESMTPSA id r11-20020a05600c458b00b00410504b582csm11595700wmo.11.2024.02.13.03.54.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Feb 2024 03:54:55 -0800 (PST)
Message-ID: <272705aa-a942-4676-8010-d001e336b26e@linaro.org>
Date: Tue, 13 Feb 2024 12:54:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: ata: convert MediaTek controller to the
 json-schema
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ryder Lee <ryder.lee@mediatek.com>, linux-ide@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20240213074747.26151-1-zajec5@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240213074747.26151-1-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_035457_762461_AAAC59DB 
X-CRM114-Status: UNSURE (   6.57  )
X-CRM114-Notice: Please train this message.
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

On 13/02/2024 08:47, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This helps validating DTS files.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>  .../devicetree/bindings/ata/ahci-mtk.txt      | 51 ----------
>  .../bindings/ata/mediatek,mtk-ahci.yaml       | 98 +++++++++++++++++++
>  2 files changed, 98 insertions(+), 51 deletions(-)


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


