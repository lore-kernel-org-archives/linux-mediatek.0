Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CE8CC6FA82
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Sep 2022 11:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=imfixrLTcFv0DjzU/dBzDYnTw5P7/+vfO0bvwY3AaxI=; b=0SVo95llDS1XBo18/GRX55xHS7
	iH3Ge9S/BrwsBlJcD8lBbB+BIFPJsy6Frvggj+rYunVlSBwumnFQwF7dNTezNHuXThXqfZTdOw1oY
	zHE9kP1ghqbsHrVAwTTy71vSfI+LY+UsKZcIZFedtP8lYW5JAOry9oJZl+KoHfJhNXtPl/yDKnc81
	IMLAZEdtsnItJb5qJ1l2LA3YJ9fnsH1tsTmD6YN2TOjAY24FTjRxZhldE6hp2P8CbnsBrVs6SebJJ
	A95RTmnlctxs0/5eEjxurVoaPBsu82msp4oMwX0tXlaI3ZEPUxNcNXm5Ca7lXYudWgfwMhWO9j2XB
	LR2Kwsjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obgfj-003t1q-St; Fri, 23 Sep 2022 11:16:43 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obgfY-003swu-VK
	for linux-mediatek@lists.infradead.org; Fri, 23 Sep 2022 11:16:34 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 10so1347680lfy.5
        for <linux-mediatek@lists.infradead.org>; Fri, 23 Sep 2022 04:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=imfixrLTcFv0DjzU/dBzDYnTw5P7/+vfO0bvwY3AaxI=;
        b=MoPAeC2L93mgPRD5pDgFVI6zu+tIfs/JI3Z5NQ5sk6nDadC/eSzT/hsTzjUOTbWEOq
         tOdtkpPuIqXaYzi6qUcbd5WMDaDx6qAsyOrSWU8pTT0GUbXRXG/Fgbq4NmyI9XESozAK
         0SMMy/CMOljs9VJUyp1n70p2iKCPrZXmAZxGKLOLbI4usnuKaVlDwZIW8iaM194o6Ahc
         UIr4yZiSx+eG2Y+L16RfslOBJHlOlvHOgxdqhXCF9U1O0ZgIvBeX9LXW9JwULrdJYDw7
         Hlv7soEyuVBmuKo8akucgCVfR5PrtrimIfOpAT8xh3qNdOSKBOLOqQjxRMpbeF2YN5wv
         L1Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=imfixrLTcFv0DjzU/dBzDYnTw5P7/+vfO0bvwY3AaxI=;
        b=gU/VfQ5FzCJB21uDZ6PZkWdVIoZb71k0W9GF0DevXZd/+J3LjXifXFxxZJjFDW9nXi
         Na0lXLti7Ew6Kb8jqytUZj3aHoyWf1Lms2hPTQiNYGEAgwhNGLIG2naSIZ/MnvI3yowO
         8iek8l004sr0LStt37GcxbIdzUabHbFG5WhTgSIzuXD1XmJtCj0g5i1Tpf/90LQFxMgk
         MozOtPwX8RygmkB4eyHC4Uk8XC0Fe0V7PU0o66Ap7ax/0KqblENUb4u++rfXolAgjncM
         pQVpiPGO3iACz6mg22fGqMlpCg0wNSXrv7hUgGYK/d2zCWfhMrmvSrwyLev4xRAKjRlN
         vGQg==
X-Gm-Message-State: ACrzQf3/QJhbRt2iowZRKKH3wlywLp+VHiRYFcXKme6DaknsEpM6pN36
	JigMMDiou9/ie6rvfVI++9ycdg==
X-Google-Smtp-Source: AMsMyM4gSgqslj/MXw3qZkhMqASVAraPUn/Jbo4yjv87pRK0j9zeCR2ZBNA3WHH91SMkygEjXeAtgA==
X-Received: by 2002:a05:6512:3d87:b0:499:f2b6:7021 with SMTP id k7-20020a0565123d8700b00499f2b67021mr2854963lfv.103.1663931790576;
        Fri, 23 Sep 2022 04:16:30 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id g8-20020a2ea4a8000000b0026c3ecf9a39sm1348838ljm.38.2022.09.23.04.16.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Sep 2022 04:16:30 -0700 (PDT)
Message-ID: <33e9babb-0492-2f41-d055-45ed32d55906@linaro.org>
Date: Fri, 23 Sep 2022 13:16:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] dt-bindings: display: mediatek: dpi: Add compatible for
 MediaTek MT8188
Content-Language: en-US
To: liangxu.xu@mediatek.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 jitao.shi@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220923014227.6566-1-liangxu.xu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220923014227.6566-1-liangxu.xu@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_041633_052423_E09BE21C 
X-CRM114-Status: UNSURE (   6.49  )
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

On 23/09/2022 03:42, liangxu.xu@mediatek.com wrote:
> From: liangxu xu <liangxu.xu@mediatek.com>
> 
> Add dt-binding documentation of dpi for MediaTek MT8188 SoC.
> 
> Signed-off-by: liangxu xu <liangxu.xu@mediatek.com>

Where is the DTS? Where are driver changes?

Best regards,
Krzysztof


