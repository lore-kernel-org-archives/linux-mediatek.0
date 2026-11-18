Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80EA606A333
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2026 22:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YWsyI7Z5;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CCH6y8Mp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=eGiTz5a4RWzDfrU+6uE44Y9DQD7JN0lrvIFzNORDJ0I=; b=YWsyI7Z5IX2Hol
	k3aNND7RNNj9YsAOzYLgnP4uwdqS34ootIJGNrk/9vdwqd/BsnufGPVfl18LK8hN9OBEcC0wNGhq1
	wSLVGzk8zxu8OIvXFAvoAt54TjMlUZahT8eGlZ1Y29Ph9vLGvNrIhDs9Jj9RC02SewsrEAa1rbhGO
	bACbrS7PdrISyi/SZx1Oue1XFzmjs30LV/JZRWitUGOk0hr64f8Y2xzRPF2xlhKvsTEKHF8+qz7TU
	+DiI26x6eh8hX54Mw4L5vxvPW6ry5QHsskXWNHhlFUZSA62mTkF2K+r/wizml6emvAstl2Gtnwb+X
	j+KfhJPNZ6ZG4KlETtxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTnom-0000000AO4W-0lCq;
	Wed, 18 Nov 2026 22:07:52 +0000
Received: from mail-oo2-x0a.google.com ([2607:f8b0:4864:31::a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTnoj-0000000AO3h-1gBL
	for linux-mediatek@lists.infradead.org;
	Wed, 18 Nov 2026 22:07:50 +0000
Received: by mail-oo2-x0a.google.com with SMTP id 46e09a7af769-862ac6a951dso548814a34.1
        for <linux-mediatek@lists.infradead.org>; Wed, 18 Nov 2026 14:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795039668; x=1795644468; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eGiTz5a4RWzDfrU+6uE44Y9DQD7JN0lrvIFzNORDJ0I=;
        b=CCH6y8Mp2nom6NtzDtme9jPQZdKHEq/rzIyPD4kzZjQnDtsAU7ERt/o3vxFuzGL3Dw
         mRvBJJvfTY7R3/CgjVTF8IVBya3al46Z3VqwovaKYzusAb6+7Gx/9auo0EdviOUL3g8R
         noNLqsLdRKq6ajmNHJlNrKlDunu0gpbJqO+8a5dtnLK2Kc067xnOgQtzWlEkMYXKrb97
         xfeUTEmm1y8Gr9lzoj1JgQMlKlZWyzS2gTmmorI4BBRuAkQlJ/+YuxS3umIco+HC7aeU
         ZUgmnfVee3V3wjk3p7SAH8Ntn/2z6AVn9Mir4mnjndnq/JUX+v63xyPivAY2/w2wKBTB
         ubog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795039668; x=1795644468;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eGiTz5a4RWzDfrU+6uE44Y9DQD7JN0lrvIFzNORDJ0I=;
        b=G72uZh51S9IKOkVNiV7+oftTql/dlf5uw8DCb89I30tFesbw5XG4Mr/W6YP/FMFpOk
         zt6PzBIOfO3fnE6bs3KH5Y2htvcobSNYrO1gpfQwaJVodQej//JRc20hVTM+wKfy/fM7
         6cLUg14rHbMTGh2FxOmhXu+lU7a0gjdpVBJQ7EWWSYvgXlLYIRvm77dj41TEN3470P0v
         UYkg8o66IohHvUtbEP6pfKajguzKCJ125pn2KvRNjc4EcmbzFKnCO074znnSNGOk3Sl6
         uoLs2m8io3z3KiVhtz2b7evLdbPVgDbtZT6b9eqNEt+7rRYyRuEGmycax2iqojR2FdSM
         yLRA==
X-Forwarded-Encrypted: i=1; AL+hErEdIR4bfW4qTDjtbWoUhyGZUqi7wPQQtkCq9ULZl/zRN3KYWASgwv4QanvbxxZs9Y9i9WlfVoTlHoHimTzsPQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z/EjDD0C840305vJ0EIoy1ZJTNaCXfF7sKZZRTpdRjHGsnZpu1M
	1Aa0ogt0ys+dg6+mQGSiN20sqlgtzvx+YWVpPgFpEBVLtpzkg2XVwkzO
X-Gm-Gg: AYBFou2vYiW7K0kySYO5YuM3quNef3t3/M7XAWqcZZTIgKX6CdGBTak5jQzvzRI5pEC
	YnUAFRyE3Ih42LfjuC/5pBGR6CzWkE2rUtcTCM9fucLDBqI4377BX6P51VRYxBy3u+koJP/CoF0
	ZGGX1pm0YRsqMYNbjhZ3W4UyzAF0Q4Kpt6WKu+qm+gcSWgh/n1nkiNvjA5Pl8O95+wZtsKsLrq7
	nJ6+qWk6wlmVdBmr8EEK3Xrn1Bs/6kUJw3V4i/N0EOROJsbms+IWujWayPouT1VCH/2486ybL+B
	odTXaxIVUl1RLRj5nYWfVeDM8eg2p6Y3vAp5imcL2Tu8Q8nHCd70N9jyrQfHTFmsnwXg6EmOIO0
	x2x0Si3rvgcfpE+9xfeV4V0BYiNqJkgraKhHBydtdgaNeePzMshFT/JbE/IzMHoFRbawKxvpRET
	XWKUFhOncDNMTBNdFs/LJDCIwZPtBuF6SMJfoUdW5Ku75Zq5tYIZzVZ3paULukgCLpuQzEcWOb7
	yy8YCzs89/ZCy96XxQbkI/l0ParBSY2S6yZN6hKI4Wo63Qoc9R3StSlqtQ5r5pRaSDbmcOALUbQ
	xsQlv1uQi6w3KATnDXk3cWLkpY1Rh2HwwTTPYQqYXGOtp6Y7+fazFtot+LEpoKPPWdIvwve6zHK
	RCw7ykNapd/HxUrwnemf5dHkxF0FS2NBOiZ6jD7cvxg==
X-Received: by 2002:a05:6830:3495:b0:829:9992:20f0 with SMTP id 46e09a7af769-862f08c9ce4mr4131980a34.28.1795039667975;
        Wed, 18 Nov 2026 14:07:47 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862f021aae9sm3024029a34.18.2026.11.18.14.07.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 14:07:47 -0800 (PST)
Message-ID: <2fb4e011-8ee8-408b-8684-f3bb8e1ac624@gmail.com>
Date: Wed, 18 Nov 2026 16:07:45 -0600
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/2] iio: adc: add mt6397 PMIC AUXADC support
To: Jonathan Cameron <jic23@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Roman Vivchar <rva333@protonmail.com>,
 Luca Leonardo Scorcia <l.scorcia@gmail.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Andy Shevchenko <andriy.shevchenko@intel.com>
References: <20261025-rbrue-suez-upstreaming-mt6397-auxadc-v5-0-5c3c7a5a1851@gmail.com>
 <89c8cadb-0ccb-4aac-9b95-89f355beb24a@collabora.com>
 <60eeaaf9-57db-4ca7-b4f5-bdec111dcdbb@collabora.com>
 <4c64aa52-2b75-427e-8f26-c2ef7fc5b822@gmail.com>
 <20261118215144.301c2467@jic23-hlaptop>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20261118215144.301c2467@jic23-hlaptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_140749_485531_9790D803 
X-CRM114-Status: UNSURE (   8.22  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/18/26 3:51 PM, Jonathan Cameron wrote:
> That's indeed a common solution to cases where a binding header
> is involved. So I'd do this - then chase with a patch next cycle
> to use the define.
>
> J

I jumped the gun a bit and sent out v3 of the suez dts earlier today 
with the proposed change [1]. Should be all ready for AngeloGioacchino.

[1] 
https://lore.kernel.org/all/20261118-rbrue-suez-upstreaming-amazon-suez-dts-v3-1-c1a8b0febf35@gmail.com/

Thanks,
Ryan Brue

