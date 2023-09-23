Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36225CE7A89
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Sep 2023 18:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e2+w/hIMeCdP5XObJabV3a0a034s6znbmDpY5rWOZME=; b=M60rwtZR6S+xTSdsalpJYqQk7T
	FC30uwdVnIp644XgdJHlUVzAHnAtkZlZ7B9taFqeYw1GfpjjiwKJOc+dXW8V5FB+IBRtk4Hlk9JpX
	XuK7eu2LEit2UsBGM+HHLzgF0gzqMU4rcp1kjua47tZI/D4CfSkesfcQdrph3hRUltoj2TqF/hrea
	l5THyqxwGTBefyEfQvMYNoPMJXaJ6zv/vt187zuV/M2dAXgRJbITfXAecB/XH/XDgshYEVUg1pVsg
	Q9oiuh9vs0D7YdMoeEAZiXMOz4UsVkFiVZn0F6cbkv6BIZ0NWzkDh26oYjFT6awvHqmo4MrZa/4+P
	uFdoZSNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qk6xR-00BIDL-36;
	Sat, 23 Sep 2023 18:02:21 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qk6xP-00BIBS-1n
	for linux-mediatek@lists.infradead.org;
	Sat, 23 Sep 2023 18:02:20 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2c02e232c48so65851521fa.1
        for <linux-mediatek@lists.infradead.org>; Sat, 23 Sep 2023 11:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695492135; x=1696096935; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e2+w/hIMeCdP5XObJabV3a0a034s6znbmDpY5rWOZME=;
        b=sQq7eRDOdM3W/FTweD4bbHoK1zM/hVF/YT2mYylns8i7erztvlstPqXua57dIC6yV2
         bMoquLQjsmBhzHBeyqaSo/xLhb4RGM3yADn1q/cxy0OTdS23TWtJnErJSfXjA2itYq9o
         Mfq1ArGyv2WyFh0ufQUblvTA7HRSpYllEeM7pGMp5KEgXKJxfGltB9UCHO2iE4418n4U
         mqpdofE9TQWZdP+GMbyhDG3roRTBYpNJ6WmIw6tEQF1SFW9Ce8rwe3T1eM5JkdfSQT1T
         7fWIST/uKV/ngv+CFkmAIpiooJYTdCt8Z/HvxiqjsWPCXT4nnFLxTET3CSlugl2c79/T
         g4Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695492135; x=1696096935;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e2+w/hIMeCdP5XObJabV3a0a034s6znbmDpY5rWOZME=;
        b=FzSaF/RrRlaIZTW8K9HlURrip2Xb7E/A2HMO0vSY+AKx9TlNhSSCPjIRnAAYya3Tqx
         Jkzi0B/c6XFQxxeE2aLcHhqkRq7qFXpWfcnv5YqsFCNk0Gjy2MNPYbRPOADGswwav31i
         8l5br8wWQCSKJL8GotKxJjND/wUCblDTDOt7vXJLksK0UXSma94j5xgEJ0gz4H0YPVng
         DYQMIpTSlBZMTNlR6WCRpNgRZaUR8QPMYHzHaHJ663fqUQ4k7HuXhYwBnHgNHdaxbj7W
         LQIIp/6cOe50TKVCIYYpAbjXKwSkY//RmO9tn7akK4cgMki93iunIaEDkoogpeQLy03m
         DZaQ==
X-Gm-Message-State: AOJu0YyZ+F/uy0MShRoxcAFWTyvP7JqwGSWZIj74cfY+BBIyMhKjOp1y
	uVo0dIIFOxNOvb0KaHstlTMDEA==
X-Google-Smtp-Source: AGHT+IE9QFZHI8Y6so7/mo4x5KEZ3eDde8p0i5eSPhIKMUzOwbXushpkR+BjNRjB7kVP3w1OZaAbjA==
X-Received: by 2002:a05:6512:3415:b0:503:3756:9ff1 with SMTP id i21-20020a056512341500b0050337569ff1mr2078800lfr.49.1695492134868;
        Sat, 23 Sep 2023 11:02:14 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.100])
        by smtp.gmail.com with ESMTPSA id cb9-20020a0564020b6900b00533ec6c617asm132069edb.54.2023.09.23.11.02.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Sep 2023 11:02:14 -0700 (PDT)
Message-ID: <797fc698-54d2-4848-3a4d-43ca631eb96d@linaro.org>
Date: Sat, 23 Sep 2023 20:02:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 03/15] soc: mailbox: Add SPR definition for GCE
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
 Jason-ch Chen <jason-ch.chen@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 Elvis Wang <Elvis.Wang@mediatek.com>, Singo Chang
 <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Shawn Sung <shawn.sung@mediatek.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230918192204.32263-1-jason-jh.lin@mediatek.com>
 <20230918192204.32263-4-jason-jh.lin@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230918192204.32263-4-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230923_110219_598663_C7471591 
X-CRM114-Status: GOOD (  10.22  )
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

On 18/09/2023 21:21, Jason-JH.Lin wrote:
> GCE has specific purpose registers, abbreviated as SPR.
> Client can us SPR to store data or programs.
> 
> In CMDQ driver, it allows client to STORE or LOAD data into SPR.
> The value stored in SPR will be cleared after reset GCE HW thread.
> 
> There are 4 SPR (register index 0 - 3) in every GCE HW thread.
> SPR is thread-independent and HW secure protected.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>  include/linux/soc/mediatek/mtk-cmdq.h | 5 +++++

There is no user of this... Why do you add unused defines?

Best regards,
Krzysztof


