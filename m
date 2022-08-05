Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27F0BC00140
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Aug 2022 09:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GTjcoqI8Zy27Jjru/d59SIQfAPUV+r8g0eBDkIE396k=; b=aXYRQnjkqdDstM/5iByBMIcMWC
	OTbaj7A+YqZdZZwv6cvihO0j/b/QiGHtWlIhiH2D+ndGKx2uksJFAx+8bAwRhMBruVxMrSgPsPiiR
	UbLYsOkVlWRQmxGBQyKoyzRTNUPgXAbvq88B6TT2DMxbzSpY68qmaHk3j1Pp2Bj24a3QzfWRa2yzK
	g2rv+6DDb9l8NRU+bDhrln8vlF0QDvE+83cHuctrHSezweV+eEuakLBgnXpD8hjPIqI4HKgPk+1ha
	fOnB6jn2ttbI7/jZVWT4cfPcWTJpFFrOKTgNxBJv7V0LoQuzgLLkVT+pPGb7Fk7TyCpFY0PAJjgXV
	f0zxGDDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJtTs-00DX1D-Fv; Fri, 05 Aug 2022 09:18:56 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJtTp-00DWxg-Kp
	for linux-mediatek@lists.infradead.org; Fri, 05 Aug 2022 09:18:55 +0000
Received: by mail-lj1-x232.google.com with SMTP id bx38so2394025ljb.10
        for <linux-mediatek@lists.infradead.org>; Fri, 05 Aug 2022 02:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=GTjcoqI8Zy27Jjru/d59SIQfAPUV+r8g0eBDkIE396k=;
        b=lKhJRkSEw51vKDVAn2VeUUsFqN2x/2Od3nB1tmiYf6aGDUh/wZ0B+lDEho5FuKYvyr
         Fantq8i5HJb/ZXuQzQ770l6rOlhAJNk+Zx+EhJpn5mT75AToQhQfOQzIyPF053hvOOOf
         n4Mg0txMOKJBUZRIgNk9sj1/Ci3RUqtMf+QnYEBF85ngVA5KzK13/Dc+Cr7mO/XKnIvW
         aBVXwo4/3ztNXMMq98gtV/6zvdrWXk3FOMc7di6PWYLTDo3RzMd5w5sRkCKE69lhyty3
         d0hOO52zMLIR4QiEYLpLMag0aQPUfTVCr0oclshUUKbWkkgMEKpOR/gk0wspWTsFyVO6
         co4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=GTjcoqI8Zy27Jjru/d59SIQfAPUV+r8g0eBDkIE396k=;
        b=QBIALsEO9k1f5y2TsLyY7R6Amv9hfrH3E61rokEVp2duXnlqdpwkcU9RYM+l2oQJgR
         pbWOHU4QRii8EKY/zTRJ1wWKv2POiMN2YcKrA/3KWGE/nJYJxdZ0FF98EPm5dr50ziLE
         IIwZLWSFX+eVqWMS/aTth37mT0pPnpLMCg+N82vpvef2wHxpca0t18Vowrt8rFabr1sE
         /ItzEOzSmw4TgsikocD0AfmrYCeqhBYaf0vwot9ugkS9jo/G3IS4MyPuzMIjNrJFp0iy
         V7AN5Rz7XE/hnBQCyQQyRxqqfh5d3z5qCLu/xGyMTvPIOS9W3YtWmfWkmVOuuuQmFGN4
         Sg5w==
X-Gm-Message-State: ACgBeo1vuBZWXafytpMmddxFH8M1cKzzMUit451Huwlsv/FyoRQfnvpi
	U6I5Ueki7hXRbAPn8SFMPkXhAQ==
X-Google-Smtp-Source: AA6agR7wHuNA7a+JazzGC2jn/GP7TBwgHVZRkO2xAVt7CAJVVMAvSYiwie/Daa3N1pCyJKOHQtY0/w==
X-Received: by 2002:a2e:82c5:0:b0:25d:83d8:41b with SMTP id n5-20020a2e82c5000000b0025d83d8041bmr1705001ljh.140.1659691129869;
        Fri, 05 Aug 2022 02:18:49 -0700 (PDT)
Received: from [192.168.1.6] ([77.222.167.48])
        by smtp.gmail.com with ESMTPSA id u13-20020ac25bcd000000b0048b0062a14fsm405209lfn.144.2022.08.05.02.18.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Aug 2022 02:18:49 -0700 (PDT)
Message-ID: <106e443a-e765-51fe-b556-e4e7e2aa771c@linaro.org>
Date: Fri, 5 Aug 2022 11:18:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/2] dt-bindings: cpufreq: add mt8188 cpufreq hw
 dt-bindings
Content-Language: en-US
To: "jia-wei.chang" <jia-wei.chang@mediatek.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hector Yuan <hector.yuan@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, hsinyi@google.com
References: <20220805091211.2791-1-jia-wei.chang@mediatek.com>
 <20220805091211.2791-2-jia-wei.chang@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220805091211.2791-2-jia-wei.chang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_021853_744097_36D5689A 
X-CRM114-Status: GOOD (  15.08  )
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

On 05/08/2022 11:12, jia-wei.chang wrote:
> From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> 
> Add mt8188 cpufreq hw compatible in dt-bindings.
> 
> Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> ---
>  .../devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml      | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
> index 9cd42a64b13e..b56d36224612 100644
> --- a/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
> +++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek-hw.yaml
> @@ -16,7 +16,9 @@ description:
>  
>  properties:
>    compatible:
> -    const: mediatek,cpufreq-hw
> +    enum:
> +      - mediatek,cpufreq-hw

Can you add a comment mentioning for which SoCs this is? Someone added a
generic compatible covering all MediaTek cpufreq-hw (all!) and now you
say it does not cover all?

Best regards,
Krzysztof

