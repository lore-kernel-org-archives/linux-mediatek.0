Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2378CCF9C71
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Sep 2024 06:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gAfB/c2dUK7Tp4TizuYkDvXRM6wc04Km7rfihTnNlVI=; b=NnJKhZXDtrPOD+c+tHTAFOu5Pb
	QLeORK8ODEiSbE+4dHXsQXYPHQGUp1KdG3Ct9gJwdQeB/lL01ma9ZXz86pyOSc5IqVczqQ2e3h/vj
	4fHQxMLj0XBTbr3N9TDp7sfkC3udosClu/+y/yH/cxHvIZrZa1p9nqMKmUsPxSc5t+L8BCh5BB9S3
	dHz9iEkzNPSh4yvZqn+TXAHqJJ6qIZWUwoX7+fP2ojMLAQwcrIhCXW9NIIIF3uqnUNKoQXOoaPgq/
	ivA4a22VLd59MpCxcyuS9GYNenbb/D3zIUmyQqjxfkIJOeAJGifhudHXpuKJd3txOvDoY/fCnHBuT
	imjbJ4+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stLNJ-000000049iw-0Pz5;
	Wed, 25 Sep 2024 06:19:45 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stLMM-000000049Yd-0Jf3
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Sep 2024 06:18:47 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2da4ea59658so5055379a91.0
        for <linux-mediatek@lists.infradead.org>; Tue, 24 Sep 2024 23:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727245124; x=1727849924; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gAfB/c2dUK7Tp4TizuYkDvXRM6wc04Km7rfihTnNlVI=;
        b=nasZGI4T8kXHqhwx+3HOPNe3pdQdUMUcxV4EWe/309wdadP1DbRgH3BQxZUb/SSKWq
         Nv5ZimeUVm29UhdoXa2Tn4eazgmRzKbdJ0My3t4aZwm8DoOvSuGdZBFNCW6b+l5cogML
         naFFI7KRfeiPiyeVeTTCSBHITi1OIFdTUE4jU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727245124; x=1727849924;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gAfB/c2dUK7Tp4TizuYkDvXRM6wc04Km7rfihTnNlVI=;
        b=Wws3aVluEB6fCnbTxOt5pcV6ir2jBnZgtyV8UrTu8dNdx1yNOeZMuzShkKDQ2WrQGU
         Jc+jMHPTQqO7yIcAor79uJk9Zbf8E4PrI1ewOqOAf2RczpcEu9wy70TFLajJ+mx3FkuU
         EIqN/XdXpDklkGBLcvbHoSZ2ghNsh1/xijYlcbZoAT30wfYKFNiWRFXFbawwhBSE2nyN
         hY61en6RxmSr6KGeuw/ED47Il2tIdIl9lTSkj6xwN7Tt+d0R8L+D92swR8xtChKkObbN
         VQGOvyriB32U6z8x9PQGYWEDHiIRSK1ysEc3BGCyvlQqhxP5tTFwnPck87d3T2n3102T
         PRvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLMKXwOtDgcUiiVrkNWb5gUXMhnPPbhyVfBzG/H2X2qOs0xig89cgC8u9fTdhzciSJTEaLBVQ0KXR6DgJc/A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzau0v5NUsOSwbHc1Lp/0L5xj02E2SXZRg5C7aNOAs//pXdpMFn
	1KQzKoE8VrDjsuhHkSfqFYxz7AFBkb3+gO/p0R2vu/Xylw5aTg40Oo2lNn074A==
X-Google-Smtp-Source: AGHT+IEdnYbq5bAx4Sg9X+VZO3Xo5eBYOK7WziCE8Ch3Kc7BECkSDi4+tCYZhgtuKZ8+gFm9JzzLAw==
X-Received: by 2002:a17:90a:2dc6:b0:2c8:f3b7:ec45 with SMTP id 98e67ed59e1d1-2e06afe8f6fmr1835727a91.36.1727245124474;
        Tue, 24 Sep 2024 23:18:44 -0700 (PDT)
Received: from ?IPV6:2401:fa00:61:204:5d35:3dbe:2256:3e42? ([2401:fa00:61:204:5d35:3dbe:2256:3e42])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e06e1ae741sm665351a91.15.2024.09.24.23.18.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Sep 2024 23:18:44 -0700 (PDT)
Message-ID: <c9f7042b-1e61-4289-9ef9-ea15bd7e9847@chromium.org>
Date: Wed, 25 Sep 2024 11:48:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: display: mediatek: dpi: Add power
 domain for MT8183
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: chunkuang.hu@kernel.org, krzk+dt@kernel.org, ck.hu@mediatek.com,
 robh@kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20240919112152.2829765-1-rohiagar@chromium.org>
 <20240919112152.2829765-2-rohiagar@chromium.org>
 <4djlcabqjkq7thbxadjbbi6oumybnyzv7biwawke46ctjccwye@rmqougrj6pl2>
Content-Language: en-US
From: Rohit Agarwal <rohiagar@chromium.org>
In-Reply-To: <4djlcabqjkq7thbxadjbbi6oumybnyzv7biwawke46ctjccwye@rmqougrj6pl2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_231846_175430_048BFF3E 
X-CRM114-Status: GOOD (  11.21  )
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


On 24/09/24 2:41 PM, Krzysztof Kozlowski wrote:
> On Thu, Sep 19, 2024 at 11:21:51AM +0000, Rohit Agarwal wrote:
>> Add power domain binding to the mediatek DPI controller
> That's DPI controller, how can you add here power domain binding?
I think, I messed up in the commit message. I wanted to add a missing 
compatible string
in both the patches.
Will update the commit messages in both the patches.

Thanks,
Rohit.
>
>> for MT8183 that already had the property in DT.
> Best regards,
> Krzysztof
>

