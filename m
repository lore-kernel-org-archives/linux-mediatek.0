Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB47C77B7C
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 May 2023 07:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d2ao5xRhAW1VmJRMoMN5yofC1btln79yFSHVXnmazOY=; b=kPtEiFVDJO8H2aA0JKpSVk0Tmw
	QRVl5tIDRb/z9Hmu39XegW9TyD1UIg44Fyc1WutPIh8njMhz4hPiLGntOZ15AeyxNb2qLSqjMJAbr
	zdBzOu7caKhTPRgEVTUU5B8GHk1nZtP5oFLGDhwcA83SaXbn6o6C2/XcrfgRon283+ztLOtHjYynw
	Wx7MQebdbPo7Nt/bvnI166HZylm9XVxZAOXubLR1cNrwUuyHoele72xe5EqAXxKicCttROqwCN7yU
	5GiuYfDQUYBOyJU5iCSCM1lWqfciZoZGd+rhGRZ8nXYbUk3DgYzmFUMni0cdMgduESfVcK39xCVo4
	ZV5VEhjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwedd-005RMa-2A;
	Wed, 10 May 2023 07:53:29 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwedb-005RL2-0b
	for linux-mediatek@lists.infradead.org;
	Wed, 10 May 2023 07:53:28 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-50bd2d7ba74so66291800a12.1
        for <linux-mediatek@lists.infradead.org>; Wed, 10 May 2023 00:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683705203; x=1686297203;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d2ao5xRhAW1VmJRMoMN5yofC1btln79yFSHVXnmazOY=;
        b=vQGYGz+JKKoj0pR444Cmz8AfoMVXi+aedZH2f5tXSguiA5jLuZHv5InQd7y7msUxqw
         pkkJJE6gXJYKt3xeKyoiUBmQvOVIt/HUyqJK4cnTR7Id3n+8LS4ug1j2erzjuP9g8Kh7
         Eoq0Tft3rA++bEWy+Rtz7bxVQVt1xTHayNjawaewlwTNzI1icW0GLHqDTennWLI/5hGQ
         oSLhjz56TdQwhAAFq3M5lmlIt2UfjO5/yaBsdZKxjDIgB5geJ5gMagket7Sh7Z13d1wl
         JBTh44UnmDwdwNH+K8GYQiHxYZxRIcEiZG3AAbRMeTFcfULLRrbHkinEPAVuOoirq+md
         aNMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683705203; x=1686297203;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d2ao5xRhAW1VmJRMoMN5yofC1btln79yFSHVXnmazOY=;
        b=g7GBprrPmfy/SwULxFefOUHzngihrGE7wgR2mjRZ+t5i0+WOk3iryGJpATa/fqSXBi
         sJU3Ih1WBcO6oGKGbX0EtRmapNXi7chvwXl0GFz4IH6trJWkVhdX/YoHuevK7HiMPNeB
         uy1pq95CLjD0qser2iz/EoyRMY4pHkf92JBWmB/T16x1w+7E1030rYpY0eXkWNVc0RzX
         V2MBtlIc2khz1jEeGk4erNRvfJE48EB6JElAqQPLPSg5Vx/Y8opCXbrfN/1dfRlH94Wg
         0k20nHC/MAiJIKLwYL8a5ViuMCq9WtQ/TD6SoMXEmP+o2wvwes8Y/hgam7tnFqCZZaGv
         WtCQ==
X-Gm-Message-State: AC+VfDycitXi4GB00aMCNUEIrYVhegulvuhxZ2vt1PERhX9P7NiMyC/4
	fEhetdeBJa98252zFgItIObwHQ==
X-Google-Smtp-Source: ACHHUZ7GAZREa4gfDODnMUUUqHW0zX13ApjtIjVoMWTiodkH906xmeobt1vPe7yZEyTTrjV8b+utxg==
X-Received: by 2002:aa7:cb11:0:b0:504:a3ec:eacc with SMTP id s17-20020aa7cb11000000b00504a3eceaccmr14214029edt.4.1683705203156;
        Wed, 10 May 2023 00:53:23 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:c175:a0f9:6928:8c9d? ([2a02:810d:15c0:828:c175:a0f9:6928:8c9d])
        by smtp.gmail.com with ESMTPSA id w15-20020a50fa8f000000b0050d89daaa70sm1591780edr.2.2023.05.10.00.53.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 00:53:22 -0700 (PDT)
Message-ID: <4d1b7563-046c-e62d-6849-5c539575717d@linaro.org>
Date: Wed, 10 May 2023 09:53:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 9/9] ASoC: dt-bindings: mediatek,mt8188-afe: add audio
 properties
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20230510035526.18137-1-trevor.wu@mediatek.com>
 <20230510035526.18137-10-trevor.wu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230510035526.18137-10-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_005327_230762_E100F5C6 
X-CRM114-Status: UNSURE (   9.02  )
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

On 10/05/2023 05:55, Trevor Wu wrote:
> Add apll1_d4 to clocks for switching the parent of top_a1sys_hp
> dynamically and add property "mediatek,infracfg" for bus protection.
> 
> Because no mt8188 upstream dts exists, the change won't break anything.
> In addition, apll2_d4, apll12_div4, top_a2sys and top_aud_iec are also
> included in clocks, because these clocks are possibly used in the future.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


