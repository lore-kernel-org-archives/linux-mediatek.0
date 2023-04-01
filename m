Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3BA9C76196
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Apr 2023 20:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TMWQ7lJfy2rRcfJxRRfnhA0AkYqLVxzTiSyUCxhMmZM=; b=KKUAAMvrelJNVPY+CCmmpzihYI
	wqh4tf70BLRjlEu5E7akh9WlubRA++djxAsq1kIWMIEHnPVrc0OYgDRSTTJzvIeh4HMGBpWv4nD1W
	N3AfMsN/yS8+2u/pUuoYlVpmk1JHrnLuJi233RJNIrbaguMoaJHP2lEdl3BdJTJHZfhlDi69n81HS
	lsA1qsD46HaZgu3Bo1RrJaUrHRHdDHUhC3xGEjOVp7CF3rBdce3pPTt/CsXa0J8tRlCauC106vkcS
	SIBsniYT+PSu2lzQptZBaWGNB5pB1IBFlCb++7C+/PgcYJ4CsyGiZlP7gQQ0354j9FZ+mkktBSlXS
	KXoTrj+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piiC6-00BIHB-19;
	Sat, 01 Apr 2023 20:51:26 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piiC2-00BIFo-0J
	for linux-mediatek@lists.infradead.org;
	Sat, 01 Apr 2023 20:51:24 +0000
Received: by mail-wr1-x42d.google.com with SMTP id d17so25633021wrb.11
        for <linux-mediatek@lists.infradead.org>; Sat, 01 Apr 2023 13:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680382279;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TMWQ7lJfy2rRcfJxRRfnhA0AkYqLVxzTiSyUCxhMmZM=;
        b=o919TC/9eFI7nT9tSFOb+eWcnqvKwTe2IZe5pRtIQW8tZyifCtY7Hv9DUm3VB7c7qv
         z5Tr5SUIrSqDgYLjXpwtQgMsHV/gZQ47kWJzASNBw1wYQsYwFbt4E00D0cgQAe/zv4ae
         PHTEFub8+DD2F6QxMaqZgV3vtMB8WymPab02w16puN5HOOxeIqxynrXX0H22Jd/vZjNq
         pqmumjFy5NA4lwZmfqVPoHeU3L14lUgcHqOaSSohtBZbzQNbBiKnJacPsTx/WFSoHLVn
         aTFvfGAXWc7YfTVBeYq99LUp54xRa/z0pWwzb9hBIAE1GHk6I9SFs/CwFpmWad7ozbUt
         F5tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680382279;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TMWQ7lJfy2rRcfJxRRfnhA0AkYqLVxzTiSyUCxhMmZM=;
        b=sp127DVUKbztjC0aBGPRSqz9vCsdeZN6ak8HgEJgb0H5imYge/xvIav7Pje1z9mhe4
         YC6mL2jtLwIgaWZ/XRW0yZvQq7KkI6egARrcR1r3Xt5JYcp+PQqQbxOROX2zYV2ReJ6B
         nJZcuA5C4yr0jI8t18+AnGfgiklD0yTxK441dTdwlqFGb3tHwW/m8Y/vxFXnvyDl5rMY
         saw5+sJ7g87jOz0zOHZLyMwk3NHodilZzDnTMRPIoUEVCo+rRJaJg/hoFD3Bqf+o3FXu
         wP5N9pJVbKVF0gjE+kro841BRx0Pu9koQWSYf9PKnx2bNBW34EIc4ENKw10aiN+73mKx
         US1w==
X-Gm-Message-State: AAQBX9cMJWmcj9mc/K51FBgtCEqXCB2RNxfCWZPoBr//2dSLcuMuH0z2
	sQqlqALFKVhABSDLlUoJ6uDkQQ==
X-Google-Smtp-Source: AKy350Y5Y5d0oyq7FRXKb5ZRRxdbT/gKk1HkXoEP4jPfypIiihsIJ3SLzYUhnJ1tLpn5pDGChougfQ==
X-Received: by 2002:adf:f245:0:b0:2e6:2c05:8e97 with SMTP id b5-20020adff245000000b002e62c058e97mr4098803wrp.30.1680382279506;
        Sat, 01 Apr 2023 13:51:19 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:b36a:1186:309c:1f9a? ([2a05:6e02:1041:c10:b36a:1186:309c:1f9a])
        by smtp.googlemail.com with ESMTPSA id u18-20020a5d5152000000b002be5bdbe40csm5673614wrt.27.2023.04.01.13.51.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Apr 2023 13:51:19 -0700 (PDT)
Message-ID: <259ae527-631e-95cc-f3b0-039ef8536364@linaro.org>
Date: Sat, 1 Apr 2023 22:51:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/4] dt-bindings: thermal: mediatek: Add AP domain to LVTS
 thermal controllers for mt8195
Content-Language: en-US
To: bchihi@baylibre.com, angelogioacchino.delregno@collabora.com,
 rafael@kernel.org, amitk@kernel.org, rui.zhang@intel.com,
 matthias.bgg@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, rdunlap@infradead.org,
 ye.xingchen@zte.com.cn, p.zabel@pengutronix.de
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, khilman@baylibre.com, james.lo@mediatek.com,
 rex-bc.chen@mediatek.com
References: <20230307154524.118541-1-bchihi@baylibre.com>
 <20230307154524.118541-2-bchihi@baylibre.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230307154524.118541-2-bchihi@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_135122_138082_097D55B6 
X-CRM114-Status: UNSURE (   7.07  )
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

On 07/03/2023 16:45, bchihi@baylibre.com wrote:
> From: Balsam CHIHI <bchihi@baylibre.com>
> 
> Add AP Domain to LVTS thermal controllers dt-binding definition for mt8195.
> 
> Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> ---

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


