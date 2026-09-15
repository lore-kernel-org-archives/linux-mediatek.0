Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C28C88E7F
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2026 14:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ahwYgxWMEileOU99DTxmNSErnxm7zxJkhpgn6sFwtI=; b=APdtKrF/vrdJapuodm0AGgaqBh
	OW34OtZYkbHoxFRVQJ9Zgflk62/dJ1AM/8ya4+2lE3FMm1+c4sKDy2k4ASWCiIUp+I8vy71S2V591
	gy9z1+X95NihDwVBuPvkxde4LTAi+Z5lGPZkVljAvSolUxREvnXm4mmtCmTN8UXrZ1+cRieqTkgPK
	dm9NAa/JBgESYKajy0fSwSrxhjQfl2/ARx2tBH+t+av+XcWaNcmpsL/k1gjQHPsGvWip3NfVskcyD
	ZVq/FYHQn72L1cjyZdSFGruOYtmilPLaeU29TLslP1lZT3EOyCV9XxcW0cXMG8Pe3wrGY84cbWKEU
	1S18Yhcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6UWV-000000071aI-0Xg8;
	Tue, 15 Sep 2026 14:52:39 +0000
Received: from mail-oa1-x44.google.com ([2001:4860:4864:20::44])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6UWS-000000071Yj-0q8W
	for linux-mediatek@lists.infradead.org;
	Tue, 15 Sep 2026 14:52:38 +0000
Received: by mail-oa1-x44.google.com with SMTP id 586e51a60fabf-4827cc09f20so673047fac.0
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Sep 2026 07:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789483954; x=1790088754; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+ahwYgxWMEileOU99DTxmNSErnxm7zxJkhpgn6sFwtI=;
        b=ovgvDxZOu2hoSUlWY+zoMtbjjEKfe+aYzwUbBy4pjrPTEDAq0wDj4DI/IFWn0PVEdP
         FQ5TjEJI/Pm0iJ/B3jIOpBrNrswArwVIZWEhElKVkVZJuHbJzJbQAQQEU26zwKXuxInL
         X+E7aDcXVLSxhG6mGobxYGdCS5ev72ETXemxkJFlmq6nMRxZ8Zv7TDKsBRgk28mKUm+8
         w2SWV5a5skpUK0kWjxMRic7wCOFkYX9EFc6vIF/3LT251Mpx0bxd0U/AhHO8r9R0f/Gc
         W/Vmz6942ozLJTo7wnOVNF5S8tpuyV0O4STe6DUksWKrAo+0bF8cGFRIdzIXeCpv7Oxn
         xfjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789483954; x=1790088754;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ahwYgxWMEileOU99DTxmNSErnxm7zxJkhpgn6sFwtI=;
        b=z7MbxLVZCkMnIF72+TYdim6yUrs9dOJ5yWnEhTXxs+IiBhONwEIrLBIjs5+X0ZpPjK
         mgXqMRnXgLpf6SDJZFcNXdVcsxNBKCO7Za1kx16TyNIjd5EE1uOq4PsXDSe4c5Br8Mqn
         gSQHbMGGmwAy8Va6cDXP8feZDO5v+jpJ01SqdRJR6z5i0aTGiSbGrBpTx8vOaWk+09Yg
         37B+DMjfj2xatIabQo7ideoeivBDUWnBzgfESC1R9vF8PVwjAJmfV8uuUIC1PkM05rH+
         wfyzwLxBAHO2w/KMVthhkp6Miz6aho0+a/5TFDJxXyqMlbEuu2Z1R7BE+q+8ac/qGnY+
         Ic4Q==
X-Forwarded-Encrypted: i=1; AKwUvBz/rBEN9r/oVS+ya8m4b+SrLJzfvZcUM8BIlZHrukOIdJHk5umVEcivKJmZaEhm566YaB5Pgl4mg/aQnbDdzg==@lists.infradead.org
X-Gm-Message-State: AFuF++n4f3WwjIZ7DuqDWWGqIZQ/zREQ41txpp/SKy95tUWt6dLjA5pF
	yh0VUcKS/+TnKMAkPBkhbJ9cV92Kzn0rPiEUtRzHUv3/D20HqloYW4zl
X-Gm-Gg: AYBFou1w0NrtpRdp3QOxJLkFF0z49oeOSakrHe8T6sh6w4oB0ltZvuVupfpOuXpBZRN
	6B1n9Kxt1wJ9RaU3nsQL/r7ve+H74QvNfQMDf0zyxFEkODYmJnTBu4+8iA8qKncHX0cM12hQ2NJ
	HI8m32I6rP8mLtH58w7OtpFduwxAvYmmt6rT6QWHOfjzxwOIV4NwGgvya2OLBHD8mwdQy6DbDEJ
	6bbWh/+KFZdpoDtTOdKcPiHfr69cpBxNyKJquJqyM0kAqZfgm+EiBEQj1LmxnbmkdRhFEbjyGz/
	MW7YIUNUTkI5lD9FTJqMRX1o7D06u7NI+3pcHHIrvrEP1bs5GtKCOxaJ3JCU73hIR/7sZZmLn09
	b8HVQsHShbrMM+hy11ORzhi38ohhvzHr0tSrk15RO/AuntErEOBHc/gwvYlecX4shqrNkc5iJPq
	ZA6A5dmxoSTlTAx8yqBE9mfdWZJ/Dj2xrGmEElr1hXs/VmUoJrsIKupkgDA6yNpgD39pTXFPaVk
	EnO1Y6Y7ptBerDr
X-Received: by 2002:a05:6870:459b:b0:462:e12e:c561 with SMTP id 586e51a60fabf-482e39ea87amr2549366fac.4.1789483953749;
        Tue, 15 Sep 2026 07:52:33 -0700 (PDT)
Received: from ?IPV6:2600:8804:5716:d800::b712? ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df86995d6sm12588398fac.6.2026.09.15.07.52.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 07:52:33 -0700 (PDT)
Message-ID: <2791fd80-627a-4353-be41-213240e207ed@gmail.com>
Date: Tue, 15 Sep 2026 09:52:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Novatek NT51021 DSI panel IC driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Nickolay Goppen <setotau@mainlining.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alexey Minnekhanov <alexeymin@minlexx.ru>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260913-qcom-novatek-nt51021-panels-v3-0-266bc5d7e8c9@mainlining.org>
 <2ac704f5-40e5-4212-8b16-6b23912ef4b8@gmail.com>
 <20260915-funky-hot-lobster-2eeee8@quoll>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20260915-funky-hot-lobster-2eeee8@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_075236_271769_13862433 
X-CRM114-Status: GOOD (  11.69  )
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

On 9/15/26 5:39 AM, Krzysztof Kozlowski wrote:

> On Sun, Sep 13, 2026 at 12:23:46PM -0500, Ryan Brue wrote:
>> Tested-by: Ryan Brue <ryanbrue.dev@gmail.com> # Amazon Fire HD 10 (2017),
>> boe,tv101wum-nm0
> This tag is applicable only to one patch out of tree, so just respond
> there instead of causing scripts to get this tag to all patches.
>
> Best regards,
> Krzysztof
My apologies, I'm new to kernel development, and didn't realize, but in 
hindsight it makes sense. Thanks for being kind about it, it won't 
happen again.

Best regards,
Ryan

