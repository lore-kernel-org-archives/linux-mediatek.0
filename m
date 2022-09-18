Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EEE5C32771
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Sep 2022 09:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ehZ01ierpa8aV+DwFDA/QfU8AbJ3Sxz0urqCktyHto=; b=3QLJnJhXlwgzeBghCTFfHXf2tO
	O8pcPpD810MHgw4KEzj+7LsW40UoiGWwFa4cN7TgZ17OGhGF7RnnoDFKyHw5N8Gspb8Y0SbcGUpXH
	nRefMZrsfP96jfu+A7IWQWCN27ccETh6zcfhOYobl1ZHOv4LSfFNnSttj4V/j1lThF/yMGVG0Vz1h
	TRCnfM1+nJLQcEvmCdSHf7qUPjsVtpjbJMl+Kux0Tmb2HC52I/KhXGUAt+Zgn/ylevAeiO385bPMe
	jtzoru1JY0dobSHa1RnByxYD62VRPFUA6/ZotUwKOYnHBurykMJdbkbZJ3estFZ+aXuL7Mr9aEVxa
	DCoDHvGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZr5C-00Eaa0-5H; Sun, 18 Sep 2022 09:59:26 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZr59-00EaWP-4T
	for linux-mediatek@lists.infradead.org; Sun, 18 Sep 2022 09:59:24 +0000
Received: by mail-lf1-x12f.google.com with SMTP id u18so42304379lfo.8
        for <linux-mediatek@lists.infradead.org>; Sun, 18 Sep 2022 02:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=4ehZ01ierpa8aV+DwFDA/QfU8AbJ3Sxz0urqCktyHto=;
        b=zfbTfZTBGGrOtwcCfbQ2TIWBCBfcERkyEFmwGP882yp4QL4Z/LjPDolpNmRdxMRnel
         h4GH1vknLx8OIN8GhLFfqFHXImzyArBiAv4Mli6zjuGUIUlIqAyo0M5K0NOxw473WvfL
         LiQ9QfKnxkSCT6xBgttVDJUVs/0Zi3HPkqIelat3l7o6wPh1dspA5pn09CRFUgOQACa/
         8nl67ooK8btEibjOfIQvC7F9poEzItq0uT5PXnsA1JobO3CQHMYCGIexjrgElBsxOSJA
         zSrFbdS0VEAuHfHMLZwlmy4hlgM4fz0Tfw7GGro98L27HrwIl2VAJI5JtbEwDjWKoQR+
         Tn+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=4ehZ01ierpa8aV+DwFDA/QfU8AbJ3Sxz0urqCktyHto=;
        b=iwgM6uxe/GUVG6HP8N0qnh0C7QHjHibl70Ikktl7ixty+jDZ9gTVfFop2YqRph6p1i
         idlgnVEH68Aaa1mO7ZJyiOQQsscviE2FtYR2k0du9/4dwBEufp0x2dXzlKGcFnWQSfvi
         8nccO6hn73YKyaGP0hISK9CuXPZueliyzF7Q3mdol7GR4VYa0Vcdk3XTBba6f/P4DOH0
         /I1vtYRZGy9MBj2ChUls+6RkpY+Yf/27wf7pmyNj0FmTjFe4LRH1N5EiVdz4B2ka95Cv
         Q4/sLMOHnT/Z9Zm3vkfexUiiwxMWXI7GqAo83+M6yt8Ehn/aQHR/dbBr95ITWnOKygGk
         3RMA==
X-Gm-Message-State: ACrzQf0FGsID1LDKQnh4uox5ODuKHXt62XIsAo+pa/oR8DPO4vtwuypB
	ckCbkIcQRiCfn1FgXEr1poPPOA==
X-Google-Smtp-Source: AMsMyM48ImG4+1wZ8Ib7kLBNZkQzNRMtywTwNKeQsq6baW5JUi3+2dCgzBh1fbWoli1bPXgJu/9mXg==
X-Received: by 2002:ac2:52b1:0:b0:499:f7ac:14da with SMTP id r17-20020ac252b1000000b00499f7ac14damr4742858lfm.597.1663495161116;
        Sun, 18 Sep 2022 02:59:21 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id f24-20020ac25cd8000000b0049468f9e697sm4574959lfq.236.2022.09.18.02.59.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Sep 2022 02:59:20 -0700 (PDT)
Message-ID: <286f4aee-0774-2206-3a96-5ae27dcfbc9b@linaro.org>
Date: Sun, 18 Sep 2022 10:59:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH RESEND v3 1/9] dt-bindings: mediatek: modify item
 formatting for gamma
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: CK Hu <ck.hu@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 "zheng-yan.chen" <zheng-yan.chen@mediatek.com>
References: <20220912013006.27541-1-jason-jh.lin@mediatek.com>
 <20220912013006.27541-2-jason-jh.lin@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220912013006.27541-2-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220918_025923_204794_899D3FE6 
X-CRM114-Status: UNSURE (   8.11  )
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

On 12/09/2022 02:29, Jason-JH.Lin wrote:
> From: "zheng-yan.chen" <zheng-yan.chen@mediatek.com>
> 
> Since the items with only one const should be dedicated as enum,
> merge all such items into one enum item.
> 
> Fixes: 4ed545e7d100 ("dt-bindings: display: mediatek: disp: split each block to individual yaml")
> Signed-off-by: zheng-yan.chen <zheng-yan.chen@mediatek.com>
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

