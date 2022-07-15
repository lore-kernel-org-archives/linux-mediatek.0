Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E94C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jul 2022 06:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s6eG0cWFmaFgptED2TWTYg714sGFdvYDMGa+KA8yB6Q=; b=z0tY7BkymKAdaQ+MBU+nhR8OMb
	5gWGrXcxV5rhviA19az39Q9cfm/JQ9Px9GWHjinpwzqmbgk5cZNWWkTB6Gm0zePlLaBNWKv9frWo3
	gLGEMmKPTzzOt6ir+vl9QF4w2mcQkI4fFtrhPv00ZMAxhXnuEvnU+ZKiG8VwKE8e3mAnI+Ffp2KiK
	yJnlIJVXNsV9CSROrZOeAEFR9T2mZ57fXoW5dnza6XxHqOwuDkZ81koUD8UglP0MYRBIKlTFx1hMm
	UMQhkODKWQvy/HqAufx27imVuqC4+jfzRaokJltYi3JL3WwWBTfdiyBy06Dn1Xp4RsWA+Ac9Mpv7C
	lPA6nusA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCF9z-004jCJ-HZ; Fri, 15 Jul 2022 06:50:47 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCF4e-004h35-Kl
	for linux-mediatek@lists.infradead.org; Fri, 15 Jul 2022 06:45:18 +0000
Received: by mail-lf1-x12e.google.com with SMTP id t25so6347376lfg.7
        for <linux-mediatek@lists.infradead.org>; Thu, 14 Jul 2022 23:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=s6eG0cWFmaFgptED2TWTYg714sGFdvYDMGa+KA8yB6Q=;
        b=WrYlFULL2rrZ5fZG9trqBVtXKTCzn4hkvVsKSWIrqQvkiMQs21w76DZ+gQpAzCeJDa
         bYJJ5Ajj5d/qW653vm8ay9eIsbm2A9xdaEGqZW9aR3FYujeiXMtXFnMUs9KgMPa8gZBT
         IftuyN4ZHnl7BiNc3QrzyMsdbGDOyVkRA/mk/74wEFhVXeNl1hM5taeZuejPNVKvjIkj
         spnFys8kt1VahKFwRMm/jTiufQv1m3R6mIVK5xT/9C7lncXoEERby8LfxEzC8M4R+64J
         05spCOlX/dyuZ4eA6TcPzT89bj7ZkwGILC3DAO2A636emauUn3lwjK+6B5pUR8qLbwX5
         Z7qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=s6eG0cWFmaFgptED2TWTYg714sGFdvYDMGa+KA8yB6Q=;
        b=qAJRbBKHIflxVfUXTSCrSFUrpeiqs9ctY+4xp6zdM3nxRTrHmaAemob+lmoQTI0cN7
         fN6zbWRg/3neFpgvjR320X4mURCJ5oGuvNVKW0MSRoXKfrwSympN+tfpe0WKq6d+FJsS
         WJF8gMGmtk3d5xE8tGHP0V1Am0Y4XlYBy0oJnpNPVRhbBAvLZaOjms/dwhd6Kuiu1KC/
         b9IJeLIap/TSnV8pyOmDdrSUL0/zZwTqNs/nIGpnt2R6flIXlyBwcoIbzHvAC6o5aKcp
         QisHlOQrvTZlhXsRqfGDO6nkKC9qWKi0EBIAZihKeoxINgNl/3YCov3gy0lHJ5xGMmMQ
         A11A==
X-Gm-Message-State: AJIora/sLsNjsN73LaPUQRZyxLdWsd+ZllTlgTATkUy0eeZ5h77xKrQ8
	eEWOOqtVUkjEO8o4wamHph3SRg==
X-Google-Smtp-Source: AGRyM1sxahtTvbaYmEdQrM2G7TMm3QM7tC9YNrozirTHaWcx6GFol3E84Jd5X4sFqg702kKUKzjeOw==
X-Received: by 2002:a05:6512:3e0e:b0:489:c79f:4019 with SMTP id i14-20020a0565123e0e00b00489c79f4019mr6936351lfv.68.1657867512823;
        Thu, 14 Jul 2022 23:45:12 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id d29-20020a0565123d1d00b0047255d21124sm752701lfv.83.2022.07.14.23.45.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jul 2022 23:45:12 -0700 (PDT)
Message-ID: <9543f3ec-0c41-fc7a-e0f5-2646eee17f0b@linaro.org>
Date: Fri, 15 Jul 2022 08:45:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 1/2] dt-bindings: remoteproc: mediatek: Add binding for
 mt8188 scp
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220715051821.30707-1-tinghan.shen@mediatek.com>
 <20220715051821.30707-2-tinghan.shen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220715051821.30707-2-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_234516_751806_3007C04E 
X-CRM114-Status: UNSURE (   7.63  )
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

On 15/07/2022 07:18, Tinghan Shen wrote:
> Add the compatible for mt8188 SCP to the binding.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>  Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml | 2 ++


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

