Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA580C7619A
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Apr 2023 11:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=alKlSBXqGXNKy9+ktgXszUv3LAFDLqUuHwOdgbOOvJY=; b=1uAhoZXnZNikg9pFXlgkWDkxSY
	reryJ/8alJdCG1sT6k78KjEQ9lhfkiCMYfAAaGslJv5ABO/BQbEyqnfOLLPEFnU2UENIlobSmmYOM
	wlK5CJlNHgLswSO0rSO8nFvCTUdGfXLJIAH/fznrq/67iNK2KzY/Pn+Z8YYfABgWFdIApgfB0d4Rl
	z0RqCnR7QQqr/3/vYXgQeqsI5XoDpsuWnoPOVZOz6dkWu7Iv+qrNAXnFIDZ51zwZYy/ZlztgIYHXF
	IUJHSM8JD/ManPf/LP3NyWyEH2bQAbdYECOGLrY80GYEuPeJ3dxMnmhqvyPRTbUYC+Sh9hBJ/9IS8
	Dd2NTCmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pk1YB-004Iqp-0N;
	Wed, 05 Apr 2023 11:43:39 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pk1Y8-004Iph-1P
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Apr 2023 11:43:37 +0000
Received: by mail-ed1-x532.google.com with SMTP id y4so140366543edo.2
        for <linux-mediatek@lists.infradead.org>; Wed, 05 Apr 2023 04:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680695015;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=alKlSBXqGXNKy9+ktgXszUv3LAFDLqUuHwOdgbOOvJY=;
        b=Tx080u4yBJLSyK1vjxZl1D9Lu4dCzxvsc4Yahuy/vDG4tHre9El56fUcb6HaDNjk6A
         DcTqadOdI9bUxmFu94zMSKHeSRWHSJR8B40xlRh050l+Gov1iJmV2z1+YuWagovqghak
         R4gORTRKxPbV5CPm5Lh54wSerSAIu6okWpK1PpWMSOhC8IUOzifhG9JKawMsLBhM0dl2
         whuHVm1nZW3/x1dyzHevBeWgerWpq6BvuMrYIe/HIK6JTL9fAFFVZ+qZY/mh+jj9H6Oz
         0SsWgHSqg/d2XwW7T1QyxKzP3WRFvhM2IOt1em9tYs/LQdHFGmhbAx9mkUBBKs9nV5jz
         NrHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680695015;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=alKlSBXqGXNKy9+ktgXszUv3LAFDLqUuHwOdgbOOvJY=;
        b=caiky3G3AuLbGvW2w66btlO84eMlAeMzN1DbdDbQcblsqz5fGyTeMYB9GgSchRO4tT
         op2qm0VtGdEaevNflclLFNMNdL60n8kEFqZpm9f8QqbXfpfgNCBp3NThHRjf9f3/j4qt
         NDjxxYZn3sHQUPS14vJvCS+exUJhG0BCMsa5gs7Bwd1bKuiQxTGva6LEs5yuA1sACNbQ
         EjNKHL0UaeQhCUpIVwT45/Rg70nVzqYVKdgtQ1BUwshfVwHhlef19YRsp1wqBnlPs4mO
         ZAQXkMdiL0BkdLieyqS16BEo6YEK7FwIz1Xk14U2e2SF2CjTzWAqA4xTVTMDJG9GLsxD
         cmJg==
X-Gm-Message-State: AAQBX9d56c/ueES5oh1rvM2u7QRD95iqMYhwDBiQvbNbf7mhevF7hGNF
	okGYDho0Z8+yAF5dJPRx3zNSEw==
X-Google-Smtp-Source: AKy350a4gmLcRBlQvEcL4JoGiz8mFy6lFAXXKhbYBZwvDb8YdrQja2ScjBrJPhZgmrFMqYzt4SshjA==
X-Received: by 2002:a17:906:d8d2:b0:878:66bc:2280 with SMTP id re18-20020a170906d8d200b0087866bc2280mr2693313ejb.12.1680695014915;
        Wed, 05 Apr 2023 04:43:34 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:3f:6b2:54cd:498e? ([2a02:810d:15c0:828:3f:6b2:54cd:498e])
        by smtp.gmail.com with ESMTPSA id qq8-20020a17090720c800b008def483cf79sm7234274ejb.168.2023.04.05.04.43.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Apr 2023 04:43:34 -0700 (PDT)
Message-ID: <00a0d832-9a0b-6160-31eb-30d2e9c32c79@linaro.org>
Date: Wed, 5 Apr 2023 13:43:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 00/10] Add IOMMU support to MT8365 SoC
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>, Yong Wu
 <yong.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230207-iommu-support-v2-0-60d5fa00e4e5@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230207-iommu-support-v2-0-60d5fa00e4e5@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_044336_479187_60139225 
X-CRM114-Status: GOOD (  12.23  )
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

On 05/04/2023 10:06, Alexandre Mergnat wrote:
> This commits are based on the Fabien Parent <fparent@baylibre.com> work.
> 
> The purpose of this series is to add the following HWs / IPs support for
> the MT8365 SoC:
> - System Power Manager
> - MultiMedia Memory Management Unit "M4U" (IOMMU)
>   - Smart Multimedia Interface "SMI"
>     - Local arbiter "LARB"
> 
> This series depends to two others which add power support for MT8365 SoC
> [1] [2].

So does it mean they cannot be merged? On first glance I do not see the
dependency, so I wonder if we understand the dependencies the same. And
subsystems.


Best regards,
Krzysztof


