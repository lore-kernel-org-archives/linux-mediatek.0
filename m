Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6707EC77B70
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Apr 2023 08:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wl3Btv+PwNxWwtewM+dP8afRzoBywyqwx59JWQAoqUA=; b=RWjC80JXFWEujdOG+J4Jf1s6ut
	GXQkb7VNs7naq+1esvW6zi7wn3QVyDj9JzMOEd77Ijpqhx3SNZATQ4WVYsvvn/H+LWcm5vRY0w3RG
	z2FuDtX14iqZvXLLw3G09V8u4SUnId/U1gjRT9yssuWyx0sXya2Pujr/73yjPKz39FZ0nAhr0xLaA
	WZgvcgaG/ECOwvY8HMp8gRO3pCuXeQDmOFCchoY+SeuFOt6XW57HUw7PDR2/vCloFtYQJJiWZCflO
	G3P9R1kqdKEqtgvh5O9dhac1+wbACzjThvkjziInIRU4Zg+Ams81oWo1gMRm/TuNBTZi9mVhhwMBA
	defHHKNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnF4e-008m7t-1U;
	Fri, 14 Apr 2023 08:46:28 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnF4b-008m64-1n
	for linux-mediatek@lists.infradead.org;
	Fri, 14 Apr 2023 08:46:26 +0000
Received: by mail-ej1-x62d.google.com with SMTP id jg21so43485289ejc.2
        for <linux-mediatek@lists.infradead.org>; Fri, 14 Apr 2023 01:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681461984; x=1684053984;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wl3Btv+PwNxWwtewM+dP8afRzoBywyqwx59JWQAoqUA=;
        b=xp9uWY+38EX8iXKhDxwuf/8P6/uzkYqJiZSNi9vbejNbCSdunJ1Q9htZtm13dmHSwZ
         eB2ixQjldDhVwyuix6HrldPkLC68my3bBZD1+VnwEJYIEqao34hsl9FKzJhaqbncEL3k
         /KmdhyM5haVIHZSXu9JatbD4YRave9CEPpq90sLNHZvf9sW6wBpDPzjaSX+WnuQwT6Us
         silZOQPudvwxoBZsEswx2cagU4lJtHv+hGWoQ6PsUugjiC08giCkVUTO/lm19lCPilgW
         E1f808oQegKlCwXB4Qm2/bYW5g5Cs/6JKEFvAraCZ2Qt5rX7g9UAPhvFrP8zZfj27pql
         c0MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681461984; x=1684053984;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wl3Btv+PwNxWwtewM+dP8afRzoBywyqwx59JWQAoqUA=;
        b=epRW9vg6b80pYW1196pAUv977j30uY6+ABXodpy8+HhiwwsfxcIBcwc05Xq5LgrK9z
         1gd6Ng3KTxegj4V9iBN7u4UUFMPTTJUNeBcxZFMuSB0OCMnjDTHnh0EShsOAqvW/e6fm
         43XB/8LjTFUYN8iCO1IX5jY14rqXbHJ3QQK2haRFxFkh4mq5CNkkPnLL8DNO7UrKdu87
         5ST0y+dABbGlSWQinuoKRyHWOw3Hxd25qYBjp8LJb1OPcu37MAjXwy+yDXOasfstQY5q
         ryDO+1ouS1m8Rt01CY0JcZtkDDbBPrzmdgDDhnuXhdd/Xf+6KzRrvlXmlpR86tei83Gv
         WQIQ==
X-Gm-Message-State: AAQBX9cSm0Zmas5mtwWeUiNIi9ZLWzYVZUAZJ85plgGN8yZut0Ptd0Dw
	F8t4snozNFIxUGbol9aybmHkZQ==
X-Google-Smtp-Source: AKy350Zv7NbHUiKpmnlHoLbQyKG9G9zKPHkXSd3wH7bVQzjdvDDsKYYR9UPKlRsG7vTDe9V2aEOkog==
X-Received: by 2002:a17:907:25c9:b0:94e:ef09:544c with SMTP id ae9-20020a17090725c900b0094eef09544cmr659459ejc.10.1681461984189;
        Fri, 14 Apr 2023 01:46:24 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:8a60:6b0f:105a:eefb? ([2a02:810d:15c0:828:8a60:6b0f:105a:eefb])
        by smtp.gmail.com with ESMTPSA id h7-20020a170906584700b0094e597f0e4dsm2087436ejs.121.2023.04.14.01.46.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Apr 2023 01:46:23 -0700 (PDT)
Message-ID: <6fc26e38-ac45-b4a3-32f0-2bae686371db@linaro.org>
Date: Fri, 14 Apr 2023 10:46:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 22/27] arm64: dts: mediatek: mt6795: Copyright header
 additions
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 matthias.bgg@gmail.com
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 jassisinghbrar@gmail.com, chunfeng.yun@mediatek.com, vkoul@kernel.org,
 kishon@kernel.org, thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
 chunkuang.hu@kernel.org, ck.hu@mediatek.com, jitao.shi@mediatek.com,
 xinlei.lee@mediatek.com, houlong.wei@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-pwm@vger.kernel.org, kernel@collabora.com,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-23-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230412112739.160376-23-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_014625_594496_517121DE 
X-CRM114-Status: GOOD (  13.88  )
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

On 12/04/2023 13:27, AngeloGioacchino Del Regno wrote:
> I have added more than 800 lines to this devicetree: adding myself to
> the copyright header.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt6795.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> index 29ca9a7bf0b3..a4c950b65006 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> @@ -2,6 +2,9 @@
>  /*
>   * Copyright (c) 2015 MediaTek Inc.
>   * Author: Mars.C <mars.cheng@mediatek.com>
> + *
> + * Copyright (C) 2023 Collabora Ltd.
> + *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Copyright is a result of significant changes, thus it is a part of
commit(s) making these changes. Adding copyrights in separate commits
looks like you are spreading them unjustified. Squash it.

Best regards,
Krzysztof


