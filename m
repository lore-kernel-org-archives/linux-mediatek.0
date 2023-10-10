Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04373CD80BD
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Oct 2023 12:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2CYZ+/+DyhZ52BIz8QU22nLu1za05uFMUaEH4Bw/fqc=; b=TmE+3uMlsF5XUUoJc7qG2unM/c
	PWmqY0Wvw4qWgSZZIogJj16ZVToCGvcVRSK6dfNRkRuRj3AUZOlajwN6G/MdEDDcPudTH91cCShEv
	84YHZ6WMQSCIA+HQ4hDpWMjSPUwlZmMtW66PVfAWdwelurxyd654UsbbpkJvsnZHYn6gCk+mZn/Ao
	ypki394K33JmcWELhMYZ1BjSNELVAjOmlgX8Wm+F4G5LwRGpBLDa2gpqzFk2ZTuH7oSMUHE5yR67s
	NJN0C8C7ZcPQwNO2aGsqzfQN/xe4RYtA7hxPfnv0+OiepI0A4aPxzfGeesrUumJHqKwkcZ/uP92oY
	8HgcFGgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqBu0-00DLOy-2Q;
	Tue, 10 Oct 2023 12:31:56 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqBtx-00DLNP-1D
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Oct 2023 12:31:55 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-9ad8a822508so1021442866b.0
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Oct 2023 05:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696941109; x=1697545909; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2CYZ+/+DyhZ52BIz8QU22nLu1za05uFMUaEH4Bw/fqc=;
        b=Rzjw/uNdi8OvAEA3yoGohqSvTVDp2ZOvVTVZxx2FiiZKTnOtS+OTfguk5lfh+JzEdb
         vv/a6BH7saN72bdJ4plb+PubUM24G6yRah3VP2b8BTcR5vl6Z3nwO4AOAdkxHjEbIKKD
         TjFVw2ZZFOS/yTYw+/7QLpGwQj1NLsOPhRLiS/q/qSgNaOEPfHWhW59ib9zWQRlucH2V
         g9KUZCwxZgZQ5ei9DARgo5yeKkLtdT2x+/NUHlOAyR68pDJfI5uF28gXaigD+awthXH1
         3O0JPz/PE55p9rdffiZCdbPs65mka10MQYvKqPCUUSuxJdnFI0LHCSXyOZb0kEAmK2sB
         MxDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696941109; x=1697545909;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2CYZ+/+DyhZ52BIz8QU22nLu1za05uFMUaEH4Bw/fqc=;
        b=jZXDFowtR77OMDCB2UDdoY/cbNSuSu66Dli4iwnPVjOy4aRmYVXrhb03XJ2GkKkI1Z
         GxiBG3yMi9ROGWQEQXd1eQ2RFx4FRmpuyLMmUcCFgF1knxPJST9/4T5T082HNrASuzt7
         p8AY4OTVmwquozQ53zCZDKxKcWw8fuj8LVNY5m28pbBcEfSsjFbsPCqre3x1gC3h4EBc
         rIcneoIQdOMSU/D1Y1Rhhds+wn0h1usP/65l4ivupxcK3wUoLmEKiHiP51eUZZ/+gufY
         0BRJkmKLTXJjXctXwsP7p3CPyeF12iOqCDr6ksVIcdDCmj5tKWhc2ijqteRFTx5Nt8Kt
         o0Iw==
X-Gm-Message-State: AOJu0YzZePOPJnn4HEkS4GGng0lILVe1vS8P6VSoC7odMMuYur2iS7RA
	UQZoy96MMAmu5ONLnScXCyuAWw==
X-Google-Smtp-Source: AGHT+IGrJz2OZy7bjQItLxH2CVQ0LtUM1928DgKjvDvFMaoCllpF2bQB9OvuQc+61e+7xUGcp/crSw==
X-Received: by 2002:a17:907:7613:b0:9ae:55ae:587f with SMTP id jx19-20020a170907761300b009ae55ae587fmr14973981ejc.37.1696941109625;
        Tue, 10 Oct 2023 05:31:49 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id f5-20020a170906560500b009b8dbdd5203sm8394159ejq.107.2023.10.10.05.31.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Oct 2023 05:31:49 -0700 (PDT)
Message-ID: <ea2b3e42-9bf8-489c-b2d9-584ee2d909f4@baylibre.com>
Date: Tue, 10 Oct 2023 14:31:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8186: fix clock names for power
 domains
Content-Language: en-US
To: Eugen Hristev <eugen.hristev@collabora.com>, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com
Cc: allen-kh.cheng@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20231005103041.352478-1-eugen.hristev@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20231005103041.352478-1-eugen.hristev@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231010_053153_412566_D98BB25D 
X-CRM114-Status: GOOD (  14.26  )
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

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 05/10/2023 12:30, Eugen Hristev wrote:
> Clocks for each power domain are split into big categories: pd clocks 
> and subsys clocks. According to the binding, all clocks which have a 
> dash '-' in their name are treated as subsys clocks, and must be placed 
> at the end of the list. The other clocks which are pd clocks must come 
> first. Fixed the naming and the placing of all clocks in the power 
> domains. For the avoidance of doubt, prefixed all subsys clocks with the 
> 'subsys' prefix. The binding does not enforce strict clock names, the 
> driver uses them in bulk, only making a difference for pd clocks vs 
> subsys clocks. The above problem appears to be trivial, however, it 
> leads to incorrect power up and power down sequence of the power 
> domains, because some clocks will be mistakenly taken for subsys clocks 
> and viceversa. One consequence is the fact that if the DIS power domain 
> goes power down and power back up during the boot process, when it comes 
> back up, there are still transactions left on the bus which makes the 
> display inoperable. Some of the clocks for the DIS power domain were 
> wrongly using '_' instead of '-', which again made these clocks being 
> treated as pd clocks instead of subsys clocks.

-- 
Regards,
Alexandre

