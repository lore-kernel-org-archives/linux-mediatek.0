Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 192BDC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Dec 2022 10:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VLuAMovx3wtMwAZuA9wPgXsMxzyrcuLZS+V5UGunqYI=; b=Znpp2jGn5zGMS8UVFmHVxjmZIv
	VhdtpzD41CNclag5ptNfQi2yK52xdU/dM/TQDuo2DPdWtBr+Ix3dw1oWtjetQZ0zvTCFmvsIVLsiU
	34YJlB7Lb6QQ39OCZK/vIOlmNIRPk4li3Vm5pdB25zngf3gHu/z113w50+PYukkkpBezkT9YqlK/3
	dp4ajFeqdF4UizWlq0dP90ahj8QXoZTEtOS2Lv3OZoRQaR70Bqn5Aq8PVp/4KqgGyXu4AylmGoUVt
	Lk3r2hglOforTMgHohj6mtG4uWV2NnkSS9Z2jYWw589ThgTuV0I/R+vnFmZ8p/Bmep4P6ZIQCeUAs
	znwmJpfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p68OO-00EGAl-Fz; Fri, 16 Dec 2022 10:56:40 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p68OL-00EG8E-RV
	for linux-mediatek@lists.infradead.org; Fri, 16 Dec 2022 10:56:39 +0000
Received: by mail-lf1-x12f.google.com with SMTP id g7so2911453lfv.5
        for <linux-mediatek@lists.infradead.org>; Fri, 16 Dec 2022 02:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VLuAMovx3wtMwAZuA9wPgXsMxzyrcuLZS+V5UGunqYI=;
        b=M00egMnkPSfthC3etGdifZG9wOqcc/otExoRD7b8l9w3SDvgCzmznQrvNeCzm7UbA6
         juLNxaZd1b6EiCKuuixpeln1Bk3MA8D0zk9e2JIkDjMRIGhVupD9JLSnthwAw8Ka+lRP
         KHkx1wXxvvyE8FkMQPcTSUtLkB9RyrT3e//sYX/UiEVpCJcz1uxN0s0LJMe/LNsgk2Zb
         NuFM1BOIAU/WiSURWLmLiuqIdTEkVkFE8QAnotjxcXD8IcjUpIfqTUzvjFAh+JyfDRae
         hID6tTnjRqbL2decER67YBEEfGq5Vx+US5iT9FFD6yld6Igvb8uiF6UzmQDP2yZN/NVv
         /tog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VLuAMovx3wtMwAZuA9wPgXsMxzyrcuLZS+V5UGunqYI=;
        b=zB3aY0jJdGbx6i34hPSYOjrBb3Hge0KaJ++9odN8Zy1IJWfGyKFFDJkM0KMgNmSNnA
         l5B04ILHJFZ5zX0pmvIOfGInrLkIjEpfm77tasTbTlHeRf059SyjOGwhTHu1FiluN4yj
         pVzQAmeTDkNIeRKYfMJ+EWr5Tc99/SRHXAZLkhY6KlToZXILBXDah61hJpz752GCIoCV
         5QJaX4oXc4XT6mevGjrD9N328/PeRxzZBBQaGlvf6wi5ETBukdvF4OtYyhK9+CtVTTuy
         HExGGBCIGmnTAEtHPTouz0+0hw0S7GB6UeZCn8/0/8qAlxWaO05Q5f/3sVzm2ftwiJRN
         kfFg==
X-Gm-Message-State: ANoB5pm8O3kqooOrSWVWFqtHVyuFs2ifQo1QtZasgG1Cbslft9EeAtwY
	p7dFN4rrjiu3EQsC9gF1D9LrQA==
X-Google-Smtp-Source: AA0mqf5u7uT9Ts0c/ckCortFeduDzB0eX4KG+Bhq+eyVZ8DnJz3m2v99vVWmipTyB9SkJpCfyidiVQ==
X-Received: by 2002:a05:6512:4cb:b0:4b5:6417:43bb with SMTP id w11-20020a05651204cb00b004b5641743bbmr8179726lfq.51.1671188195296;
        Fri, 16 Dec 2022 02:56:35 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id g8-20020a19ee08000000b004b5634f9b9dsm188718lfb.115.2022.12.16.02.56.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 02:56:34 -0800 (PST)
Message-ID: <324cce2c-ad75-014e-0647-87c9b8e845c5@linaro.org>
Date: Fri, 16 Dec 2022 11:56:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 1/4] dt-bindings: power: Add MT8192 ADSP power domain
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, Stephen Boyd <sboyd@kernel.org>,
 Ikjoon Jang <ikjn@chromium.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 angelogioacchino.delregno@collabora.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>
References: <20221215120016.26611-1-allen-kh.cheng@mediatek.com>
 <20221215120016.26611-2-allen-kh.cheng@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221215120016.26611-2-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_025637_924830_44F12FC5 
X-CRM114-Status: UNSURE (   8.18  )
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

On 15/12/2022 13:00, Allen-KH Cheng wrote:
> Add power domain ID for the ADSP power partition found on MT8192 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>  include/dt-bindings/power/mt8192-power.h | 1 +

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


