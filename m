Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B260CC77B70
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Apr 2023 08:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cc3XhoVrKsfuWOuFNSb6VleyMIegrRaVdqtu2PiBP6Y=; b=OiMXHgvJbhWusF9P62Ur71k5C/
	7CAA/20FYc9osA4ZzF87WM13VN3UL6lxA5VDGotheOYE0iaPEe6U3Y733euGIswFK8I/gRoYahAMg
	Bc9saAH0B8YV+EoUldrhW45R4SBOKV1mNGiQ55TqogViCiNe8VHz3NQ/WsvStnPPMUoHKgybQSgLa
	4Ze+fbD1lfnHaMT1opu+gsbgPRpWQg/Jd7F77BT9eI8DWa78EEKwHWi6cNSys14m1v78PJuUQKNxj
	sLJG3Js+lZTA4LOEMvSgrPA5eo69wyUgreBgCUOfmNH27gPO8S9MuP7hlR1gLP4H+gzma4dVguxM6
	JNlhn8rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnElZ-008h9I-1S;
	Fri, 14 Apr 2023 08:26:45 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnElX-008h4v-04
	for linux-mediatek@lists.infradead.org;
	Fri, 14 Apr 2023 08:26:44 +0000
Received: by mail-ej1-x62c.google.com with SMTP id xd13so9808243ejb.4
        for <linux-mediatek@lists.infradead.org>; Fri, 14 Apr 2023 01:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681460799; x=1684052799;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cc3XhoVrKsfuWOuFNSb6VleyMIegrRaVdqtu2PiBP6Y=;
        b=bt73naGw+ZXi4dc8Cmhv0FLtGUbeOgrPuV1QMF4QPK4DWhqcDIiQyq2SXqDshVY58+
         9i5EZRohDL67399mm6hHhCeQV/EJor+rJ8VeOerrE+yvaisOQ2EXVIzVKEzSqBMW6Bsj
         /QStpG4ys+runlabZaXcTBjIl7IH/NVwijX7kgLZam1r0Xs+zSdWpyc9iow1Bl3P9Zr6
         qTEXFqfz9+7uepReMSv77u28y+M74JLZY3/yfgzdzoLj7xro2lSoL8qMvur81rANjaL9
         4QuNXgOvOjBgmIoG5TjRbKELD2WjLfk+HiPP6p9vqHmpim7DFpm87T/BjxLYHqgQTBqD
         uyUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681460799; x=1684052799;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cc3XhoVrKsfuWOuFNSb6VleyMIegrRaVdqtu2PiBP6Y=;
        b=fN0D8ItFAmY0A/RBITBjUuorLHbY5/t4N6csZQER0LCOWEXIRaqkDtOynu9VeaknvZ
         Q4jApMdlXP0Dgaybou9CtwXvX2HvHDUQ/fuI2+w8tNuSRsn1UyW71GLFrYoq4bz4wQFP
         s837qwnPSTPk15CbFpG2fQ4EFEa5NH2O0XYFk4xHXaPZsZMm96JVHvzhiJf+/KOuOnQc
         q+w0yY/Cc2t6ghdnJ12HAHS8ESc0/Mah8FgvXNayI2GEOYKa5FWX4Q2xey2hznnJG8TQ
         Az1u1GUzrtFcIAUEfPYnMOuQSQEpmRwbx7p3X5E+vfK5VVrWfkmHWiYlImTcJTzyzWLR
         4n8w==
X-Gm-Message-State: AAQBX9cYQoN0yx4PedcN8V6UmMbCWlKL8VSfBGEGN2PoArHj19lNrX6m
	UKc1yq55y3Ho8sp1vBh5nASnaA==
X-Google-Smtp-Source: AKy350ZHB0iX4SpIl6nSdBkIW18ThkfNLzwYurPIDtNAv4p6SmGfIue6rSdxEw2SmolXbx+cb6/kbQ==
X-Received: by 2002:a17:906:b2d4:b0:94e:d17f:eacf with SMTP id cf20-20020a170906b2d400b0094ed17feacfmr2364045ejb.23.1681460799195;
        Fri, 14 Apr 2023 01:26:39 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:8a60:6b0f:105a:eefb? ([2a02:810d:15c0:828:8a60:6b0f:105a:eefb])
        by smtp.gmail.com with ESMTPSA id a10-20020a1709064a4a00b0094a4e970508sm2117803ejv.57.2023.04.14.01.26.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Apr 2023 01:26:38 -0700 (PDT)
Message-ID: <d5580870-a440-a3b7-1c67-26db193a7f8f@linaro.org>
Date: Fri, 14 Apr 2023 10:26:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 09/27] dt-bindings: display: mediatek: color: Add
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
 <20230412112739.160376-10-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230412112739.160376-10-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_012643_099218_619431D0 
X-CRM114-Status: UNSURE (   7.78  )
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
> Add a compatible string for MediaTek Helio X10 MT6795's COLOR block: this
> is the same as MT8173.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,color.yaml     | 1 +

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


