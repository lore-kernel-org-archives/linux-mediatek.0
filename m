Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8327EC433FE
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Nov 2022 09:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BNDEakoGHFj6Pg7LARxrzAtLVJKPLYsbrd9x8xsjbAA=; b=R3sfzfz2579I2J5ehs9PaA8FQT
	xfH/LS0bYMVYgH8zZrtSnEpMp9MiKFcGngx0Jg+1zXIQ4FvykmF55tXpz1CZPTIaQR1w+rfZaeDS7
	8TAMulfjRWvjj0u45wNpB8LuEo7Xk32dcNqGY9B9/TfEFRDywBFV3St7pLv3oW6ztXgTbDbYR2Ioz
	hoLuTG8faK0z38KOrBEHK0pVJDncYTNHeJBNL2RfYcGMsI7wLiYJW5zw/lzzS7rnhrBljMlhdCB5M
	H4yIpSmLpme0iaamR7DArMHFuw7N15rJBbfEYwf/kq2V3ebh9ooHBkoWsNUHWR4yf6kMVIqFr4+Mf
	HhNC6rpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orc2Z-007qZs-5f; Sun, 06 Nov 2022 09:34:07 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orc2W-007qYs-2y
	for linux-mediatek@lists.infradead.org; Sun, 06 Nov 2022 09:34:05 +0000
Received: by mail-lj1-x22e.google.com with SMTP id b9so12110643ljr.5
        for <linux-mediatek@lists.infradead.org>; Sun, 06 Nov 2022 01:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BNDEakoGHFj6Pg7LARxrzAtLVJKPLYsbrd9x8xsjbAA=;
        b=hp7+b3HnHzE2PsflMfrdCU3CHLZL8+5zJzKVYaxCMHKQjnKCPQxM0nogJWRCPIWCPP
         WXzNNNwqDYMwF2Xgw6jxUHenPlMd2LYMJb+qeBpUIe5VFnQO5sGR4J+NQgweoYWkizko
         hbBjVv6uE8e3HJB/mgqAtosAPdKdWpJv/k4txiC7unve1D+vjl5jNLWasORmZNdXNIIP
         xqJgGyDXkwmxsI97f1Fg06vz5H5nCyqUouVjzfK6Gvkb/bJ4/I/ohA8dCzZnLAcMN6Nl
         zFAJ26EISpZSyAD0+Rng1yyIIj7/GREIpjGtNfhd1KLb1M8wgpI7GJz2iUmRCB0zkz6v
         fu5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BNDEakoGHFj6Pg7LARxrzAtLVJKPLYsbrd9x8xsjbAA=;
        b=LxrUTJ2VD5RN8asamDt5gwQHHanRDyQK+S30CEyAFYRybdwTW8ChyXj6Uvtxv5/hEw
         JfTycMwggSXfDyfKDAXBmxBzJPB00tmZII4bzp7XstucbKdTkz5+bPRDSjIPlRJGk3MW
         zVfwnGh5xB/cKNqc18X0kyaWv+Mt2T4aMV5TapJkdElc0vy68bR9j5xbvTacHXI/xVmd
         WOyTjexhnUfJPweMJrBqzviDcAl602kPu8DlcEVIJMCRZBYdSaaPQp45EA9Hc7CsnDPr
         /GHiTgi4UZJkbCfimbjEeXTiDThNfKaf7htB7IKGNfJERUbqrFV8e/N62BL0eY3zSguT
         EgLQ==
X-Gm-Message-State: ACrzQf07Ql1FdgTURhxn+rq9ct62qIxHINWbmrBB6kODC7vtwMor+BSO
	hZJVfkx3s8S25Q3mB3aKO/Q2kQ==
X-Google-Smtp-Source: AMsMyM7r9PfjSZb9vj2+uxOuEMDTNC74AdkTZbJ0CS5LtWjSrl+GlcGC+NcfdlbAo2yD1/Yb7pLBDA==
X-Received: by 2002:a2e:bf16:0:b0:26d:8eb4:609b with SMTP id c22-20020a2ebf16000000b0026d8eb4609bmr15933515ljr.124.1667727240217;
        Sun, 06 Nov 2022 01:34:00 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id d14-20020a056512368e00b004b0a1e77cb2sm623256lfs.137.2022.11.06.01.33.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Nov 2022 01:33:59 -0800 (PST)
Message-ID: <2e42faf9-a2c5-8a20-38cc-6aea00c4b993@linaro.org>
Date: Sun, 6 Nov 2022 10:33:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RESEND v2 2/2] dt-bindings: mmc: mtk-sd: add Inline Crypto
 Engine clock
To: Mengqi Zhang <mengqi.zhang@mediatek.com>, chaotian.jing@mediatek.com,
 ulf.hansson@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 wenbin.mei@mediatek.com, angelogioacchino.delregno@collabora.com
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20221106033924.9854-1-mengqi.zhang@mediatek.com>
 <20221106033924.9854-3-mengqi.zhang@mediatek.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221106033924.9854-3-mengqi.zhang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221106_013404_356649_52E54BE3 
X-CRM114-Status: UNSURE (   5.59  )
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

On 06/11/2022 04:39, Mengqi Zhang wrote:
> Add optional crypto clock of the Inline Crypto Engine of Mediatek SoCs.
> 
> Signed-off-by: Mengqi Zhang <mengqi.zhang@mediatek.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


