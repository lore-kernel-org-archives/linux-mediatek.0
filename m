Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F410C25B7F
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Aug 2023 20:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kJl2Cum5v1j8M/WdWxJ+2Hg9ZCvN4o0DHv+SL/M5e9A=; b=d5oR13LX4jPXygLxwP+UVu7v3Y
	pPz6jBfavC/wkXVP7R9guMMPSrvl27pW2pwu0XOp0kPyUO/GF+C+VfECIBEiNuHaxvRYwxTYLtz2U
	s1+N8deQdgP/uaT8Pi/IUYNHK+Nf/sXelfODGG6Cj8M90Rgw3dBW1kdWHkY6nDsqoGEdmMQW/X1FE
	Wk571Gsspui/RG21Xt2PBuTK32T7sAz2n4Jdl3dNHrgj9kBJBWTOzmOFqt5Up0w83pdgYKGlbF5qK
	dVeM5yXBnYHj39IDs7XhhWPAWoelw+WnK5v24pVttabehBFFGmL0ThS7WSBeqnSMxAG53cDObrBru
	HY+j/Mvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWNSJ-004yyd-2l;
	Wed, 16 Aug 2023 20:49:27 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWNSI-004yxj-02
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Aug 2023 20:49:27 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3197b461bb5so2713730f8f.3
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Aug 2023 13:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692218963; x=1692823763;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kJl2Cum5v1j8M/WdWxJ+2Hg9ZCvN4o0DHv+SL/M5e9A=;
        b=O6WSQYOx4vG3alpUI7OrrntJAaU1eprK0XFrLDLZprIVBQou4d+o1gesHIOvck50cc
         LLYELyQ9wFphneQIJfvxJv+RUFsdzyNz8CqZx5/RhL4Lro6f6IigEMcvs9ONwXigp08K
         TqdGr8CRkjb9QhVSygnhDpQ5vhwBpJK3++Sip8xjB8D0+5SNEooWFXEGJWr17xw8kD8K
         Ie7Wz5e3lHOBuMB+gv/D1/pOT6/HP3YFbb1BIfDp5U+oPbUUUbdkSwhu9Lg2csOIomS2
         zgvnic7ZZSoWXC0LyPTxgrfmvAD4sZ2eFeZZOvTGTq15e1hXaI4jKBVzLliA4Y7Ndn2C
         /kXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692218963; x=1692823763;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kJl2Cum5v1j8M/WdWxJ+2Hg9ZCvN4o0DHv+SL/M5e9A=;
        b=Kb6EjR2rmDYcFjQQBVJGbiATe+hrlTe4rXlKTUQcHxCTCxKgx8O10bo+j5Ed7us1Nv
         a1YrXPj6aerPXUjsh6GCD0CObYEso216SYOJwHqBoe/3tg0I9+QqtCcy8zbLxzY7OhXG
         k8XnSXfefO+/jd0uKe03bk+R/eXilXaKhNev0shvR1dBJIv++Ua6uBRltWwBx6a7YUKq
         rFxwSKclBcX+Kw5b5C31QZWR19eLG6hd8mBKh8sJe+lG8PQN8Dr5ew4BPjC07rk3gJCt
         KTk1yaSWTrNqHRwYyLbUeKunfqIUipS7tPUVnCuC7zDS6ZOfTXT5BCBCPWQKhOsFQV0Y
         CIyg==
X-Gm-Message-State: AOJu0YzCbHmhR7s9RyKkZFbptGBU66ga7A4I9nqsp7XRJD8UcWQycwgu
	/KUtdgUV9bYR09hGBJcy1I6LPw==
X-Google-Smtp-Source: AGHT+IEUdC0DgMSeHraqpjQYSbPR8ia8XpHQGI73h9NGhXoy2ygew8Iv2toIFp6k/NP6kCCh8WVZwg==
X-Received: by 2002:adf:ed0c:0:b0:319:8444:939f with SMTP id a12-20020adfed0c000000b003198444939fmr2396203wro.32.1692218963118;
        Wed, 16 Aug 2023 13:49:23 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id p14-20020a7bcc8e000000b003fe1cac37d8sm538331wma.11.2023.08.16.13.49.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Aug 2023 13:49:22 -0700 (PDT)
Message-ID: <a97efd71-23e2-5ac9-8d3d-427a431353c6@linaro.org>
Date: Wed, 16 Aug 2023 22:49:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 0/5] Add LVTS support for mt8192
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 angelogioacchino.delregno@collabora.com, rafael@kernel.org,
 amitk@kernel.org, rui.zhang@intel.com, matthias.bgg@gmail.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 rdunlap@infradead.org, ye.xingchen@zte.com.cn, p.zabel@pengutronix.de,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, wenst@chromium.org, james.lo@mediatek.com,
 rex-bc.chen@mediatek.com, abailon@baylibre.com, amergnat@baylibre.com,
 khilman@baylibre.com
References: <20230530195132.2286163-1-bero@baylibre.com>
 <107678ff-c3d5-4c3a-ad0e-fa292a125daa@notapiano>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <107678ff-c3d5-4c3a-ad0e-fa292a125daa@notapiano>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_134926_051115_6FE745E8 
X-CRM114-Status: UNSURE (   9.01  )
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


Hi,

On 16/08/2023 21:57, Nícolas F. R. A. Prado wrote:

[ ... ]

> Hi Daniel,
> 
> just a gentle reminder. As you've just applied [1], there are no longer any
> concerns with this series, and it'll provide both working interrupts and
> reliable thermal readings on MT8192.

There are still concerns and questions in the series for patch2 and 3.





-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


