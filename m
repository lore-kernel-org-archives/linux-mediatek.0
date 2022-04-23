Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 231F6C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Apr 2022 10:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ne/cv6/aoKoSF5gaVkxKFAmrn5NYkDSFeCi5faYE4og=; b=n8sGAit44w+VKY
	usGWgrijFO02uIbbQOqQzMhK89NBv/bJ1bPAynEKRYLhnt9AZMV0pOvBu5tOiQJCIBHeULYVuWhr8
	h3w6QIQ6FjKfpgpw8kPsXq1anWUhTowxkQrlvnb0BNqi4wGL8C22pyvMRy0ECEKBUzb5zb4MggC1+
	snXh5RVplHa7cG/Mv6JEYeJ83kz+hoOsIlq+dzQcCSCxMd7i4dHr1JVK7CmbjTtg2TTZk5XBBviea
	y5OUOKWY2pPhIPG2g+XQV+QItiZYj6XMOhhAUJCYgi9gITefV6zSHutfWsTa6VLO3sfS0s45Dm3i4
	9mmUwZuevh1zW2SMHd0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niD1G-0046gL-LZ; Sat, 23 Apr 2022 10:29:38 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niD0u-0046Ue-FO
 for linux-mediatek@lists.infradead.org; Sat, 23 Apr 2022 10:29:18 +0000
Received: by mail-ed1-x52b.google.com with SMTP id a21so1011655edb.1
 for <linux-mediatek@lists.infradead.org>; Sat, 23 Apr 2022 03:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=T1doDOEgacffxYLHRh8rB/qzYEgOkZW9WRd7tL8Bnmg=;
 b=Uq2QkeMj4YDx/HQMSBiMYbQ6hB5oDmdQNO5vrv6RZsV0W4hbLOlfcQfE9Fx+SorbgG
 MeBfPLDNjGQBN9jXgG5BBgWMk4ku+EZIK5tA7n91BL7LiJUig2PZR20nB4vhxhCfJcMG
 t6d2xzbi1EuNuz47K+u9ehbXvvjZ8kcpDisSvAJK4yj0jNqNnr/FlmotFTQIdwngVGZi
 87mIRQutpRMvI7Y76Ke2obhz8pH7azA2gURjmJ0JSv954JHBmzuGdv1BKUsPx5/slIgm
 vwbdwjM6Bl9W5ADyXkYlNsUd38w3K77+S6uxSZ6nNh9W2/Sj+Q0SNxkXfiIZlZvSWi/e
 IXsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=T1doDOEgacffxYLHRh8rB/qzYEgOkZW9WRd7tL8Bnmg=;
 b=vDTbP+wO466xfRuMPtjcG59+OgYBrOuNkBP+AoELvGAYqoDc4/e4UaCHRbzb3VwXBm
 lBLoxxUqMHVT0B6fWN82Kp7V7ovbd+M6FDOJcrI8RwIKYg65jiwgMBdUIvD1n4fmMsch
 MufWoxRJQqTaqE7gHqemMGwdfDNhaUVCLUjrr1GFAVzhLjIzP10PA4IOL7veHemIRJIn
 VzZ4P5T7EmvRngbROLzSvkz/W1zTW6VU/G05y972TLZpcjK1i3IkQN2qgLuGUXt44EC5
 wXhpD9oGzP7jD+/F9TKm58BGBMBgH4l3kHRKzONCJCxso3UqVmMm0WYsn13N1IhaYzen
 ui2Q==
X-Gm-Message-State: AOAM533ruYe0S+86710J0ILBJo12cu1k1Psr/yJqKfFAuHvSmiOuTCcz
 v5qjCPgaSMuiWk/oSuzo/0Y4Rw==
X-Google-Smtp-Source: ABdhPJzzZENHEHVJTTVj4i/LY2EyfuP6i5J51hweFIRBo2TrNePYugK61Ib5JXoKcujbhrjpbonMsg==
X-Received: by 2002:a05:6402:1941:b0:413:2555:53e3 with SMTP id
 f1-20020a056402194100b00413255553e3mr9457841edz.164.1650709754411; 
 Sat, 23 Apr 2022 03:29:14 -0700 (PDT)
Received: from [192.168.0.234] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 oz20-20020a170906cd1400b006e872188edbsm1557661ejb.104.2022.04.23.03.29.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Apr 2022 03:29:14 -0700 (PDT)
Message-ID: <16311e64-6a7f-e20e-de12-5a9eab10af83@linaro.org>
Date: Sat, 23 Apr 2022 12:29:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V3 14/17] dt-binding: mt8195: Add infra_ao reset bit
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, mturquette@baylibre.com,
 sboyd@kernel.org, matthias.bgg@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Cc: p.zabel@pengutronix.de, angelogioacchino.delregno@collabora.com,
 chun-jie.chen@mediatek.com, wenst@chromium.org, runyang.chen@mediatek.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220422060152.13534-1-rex-bc.chen@mediatek.com>
 <20220422060152.13534-15-rex-bc.chen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220422060152.13534-15-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220423_032916_629716_8199DBDF 
X-CRM114-Status: GOOD (  11.22  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 22/04/2022 08:01, Rex-BC Chen wrote:
> To support reset of infra_ao, add the bit definition for thermal/SVS.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>  include/dt-bindings/reset/mt8195-resets.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/include/dt-bindings/reset/mt8195-resets.h b/include/dt-bindings/reset/mt8195-resets.h
> index a26bccc8b957..2479680616fb 100644
> --- a/include/dt-bindings/reset/mt8195-resets.h
> +++ b/include/dt-bindings/reset/mt8195-resets.h
> @@ -26,4 +26,11 @@
>  
>  #define MT8195_TOPRGU_SW_RST_NUM               16
>  
> +/* INFRA RST0 */
> +#define MT8195_INFRA_RST0_THERMAL_AP_RST       0
> +/* INFRA RST3 */
> +#define MT8195_INFRA_RST3_PTP_RST              5
> +/* INFRA RST4 */
> +#define MT8195_INFRA_RST4_THERMAL_MCU_RST      10

Same comments as for other reset.


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
