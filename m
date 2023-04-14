Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CE0CC77B6E
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Apr 2023 08:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YETSwyP9KyJmIykjMyk1TM49CieBNMVHrTzyPxKcTSk=; b=PRwboDQ0Zadk7nTQ1hWEXHn6xn
	kURwiJFzbfErgM/hhfrOv6MHOiasiw4W9sDmHL5VkfeQHqwiB7qInGXi+J0I+9i4KECd4yb2uYPQI
	zCI95qSIRrysoTeX5AcR07MoLSXf5tBSJm+9zgyVsEHxLnqwW1sdIf01hPGkKPi0VCZ0gdAB4KRBx
	0t5XKyxuFlDfxODvz5XJuiBNWG/Gsor9ww43boeLVAOY7mLyEDls87ma78D4pYyviu5he8lsZehJz
	vINiuGhRH5095nI/R9Wi19s0Yl5El7cEvyNyZ718zVQX6VhL5SAZnr3kaWfaYKHzvk2UGZGsuDVLW
	NMSv0pvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnEsl-008j1B-0g;
	Fri, 14 Apr 2023 08:34:11 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnEsi-008iyc-0W
	for linux-mediatek@lists.infradead.org;
	Fri, 14 Apr 2023 08:34:09 +0000
Received: by mail-ej1-x62b.google.com with SMTP id qb20so43356143ejc.6
        for <linux-mediatek@lists.infradead.org>; Fri, 14 Apr 2023 01:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681461246; x=1684053246;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YETSwyP9KyJmIykjMyk1TM49CieBNMVHrTzyPxKcTSk=;
        b=FkQzqgIFOAMsY5C49r1vVB/ZlzTMvC6eoeJBVcpcCRatuAaj6EIDAzi3hygq5+Ij1g
         JBGhZBFMX7pINFHlQiMdv7hC22MjElW2vDWKKVX/MSzTmcHGS5Gow/BGmXAiYyXVt3Rc
         TwHLdDfG5VUJBs7kKpL0yZtdBIOgMc27tvQabifkeXgBXMFPRAaCDM7iXEOBED/IWt/y
         NmIFWcjRsMtBhqMZwvLbe3ORStBZA417ZS8RGIc3ZE0/2GEdnH753mli+ov6NbQ1UAV0
         2miw7dNFMmbmugoxca3FDGb1jnUPzAQcjAd4BRyShkqiZf8yTad3RCKAOBWa8ejhn2ha
         LbVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681461246; x=1684053246;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YETSwyP9KyJmIykjMyk1TM49CieBNMVHrTzyPxKcTSk=;
        b=ck1fBZRuOuolLTDYz9vtvN2JJwCaWQc4A0kZjqJXFornA1KIKW9RK1RNRJzWWd17YB
         lZYpDd/haBIz1s244cRfG2fAx6sdVoj6uywS1dczATtkI4zi5r0vKlFkBt+UI5VuFCTc
         VFCxcEmjdDpebrhUZyqtkCHX0VcyM5KSuC+5pmNXsiQveYfS+ngN4c3bhhGk5t380SF3
         xp9llKkHFp9/x/GImZ3ii7uH4zhBdwg5Zaw60tlyHpylR90iIz5LdJJGqZGvPfrw5p+i
         I/4zDpWtqs0dzuGKr0W5ow1qtbzG9Ga/TWQKnCOVZWLS48SdkrKX29T5EQsBDSBAWzIs
         VTwA==
X-Gm-Message-State: AAQBX9dmZpGOshuWCYoTGqTfVzBC+uK0azbmOsr81JexBk7psEXYPlro
	1SNscH4heUTabt+3Hcm8+6Twwg==
X-Google-Smtp-Source: AKy350Z7uaDB4GQxOP+F7tcD8R2KCxU2CUl3f5Uqi9jTZYCUHl43i3I1xzx6+MrjdoI2Do1jwFgUmg==
X-Received: by 2002:a17:907:1b1b:b0:94a:68a9:b399 with SMTP id mp27-20020a1709071b1b00b0094a68a9b399mr6056042ejc.53.1681461246577;
        Fri, 14 Apr 2023 01:34:06 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:8a60:6b0f:105a:eefb? ([2a02:810d:15c0:828:8a60:6b0f:105a:eefb])
        by smtp.gmail.com with ESMTPSA id jt6-20020a170906dfc600b0094e6c45b117sm2106215ejc.168.2023.04.14.01.34.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Apr 2023 01:34:06 -0700 (PDT)
Message-ID: <8349f5c1-36fe-802b-2a36-acb9c6eb6d8e@linaro.org>
Date: Fri, 14 Apr 2023 10:34:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 12/27] dt-bindings: display: mediatek: split: Add
 compatible for MediaTek MT6795
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
 <20230412112739.160376-13-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230412112739.160376-13-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_013408_199213_D3AF91A9 
X-CRM114-Status: UNSURE (   8.94  )
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

On 12/04/2023 13:27, AngeloGioacchino Del Regno wrote:
> Add a compatible string for MediaTek Helio X10 MT6795's SPLIT block: this
> is the same as MT8173.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,split.yaml   | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


