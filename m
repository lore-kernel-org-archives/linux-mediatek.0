Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E661FC6FD19
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Mar 2023 08:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cdseOTNh621EKmpqbEpL631jgufcpzaPsbaGb0u5w10=; b=UjZQIdJnt9+uNVCy3g29bPIvXU
	FzAhPPBe6tS2SnGYhLqGt596c03ojpb/tePTvAJU68EEIDAqq4QPrrjypSyZJxI7CG0BVSZnnssd5
	Tayhpjr8lKV+TAa9ilse+xmZmHqoKCzMmBb67/I1VW7JOTtvbuOXD0UaLZUF3QymzkgPDz2b1wot0
	t1YLHUhycUaHpMfORqUxCyJAYB5VWp7KcIoK8e2MKf+RAaDLLtes8UfDRw8U2Fk5qvYpIomy915DY
	+5vrefsJaTiiFVNsgjdh6CldBdFV8GR28Rblom52GmG+1/wciJMCW4DpdslcDK8FwwELRGSwbwBxi
	wB7bgqBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paYIP-00DiTb-GA; Fri, 10 Mar 2023 08:40:13 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paYI6-00DiI1-6o
	for linux-mediatek@lists.infradead.org; Fri, 10 Mar 2023 08:39:55 +0000
Received: by mail-ed1-x52e.google.com with SMTP id a25so17592876edb.0
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Mar 2023 00:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678437593;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cdseOTNh621EKmpqbEpL631jgufcpzaPsbaGb0u5w10=;
        b=gv1m73ZIi7XGNzWH+OmD64J0OzTplBXcQSocEEdL2QUmF0AXQ1/9bWH80ddM5j0x7Z
         KZ65c7plre85naGIZQLNQanh4M7XodTboeoJ9a8cIO6kGMVFzmj7eMFCM5pHb3Eqjo9t
         nu0fhxWpaj5gHZA+86rt1HmcZXmcfwcRlCN1whV+sTYxxeKikocOrbz0wY8kGawHHnP8
         BwyPuAzbyULYajWk9kjidsl282EpSPx1hdmdFpVx+vnWbKiZ31JY+JuwWKVACeM0eH/o
         PPz+6c0YpmBkSVsyvl/TEEoLjyBki/z9UkLQ7W6xptbhM2R00/OM0GFXuMuqf9QNSPLm
         Mrdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678437593;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cdseOTNh621EKmpqbEpL631jgufcpzaPsbaGb0u5w10=;
        b=mwWmmkVwZtv//bro7BrxacmU7eF8zu8v06kIaZKEpK2qt635StSwX4qMzQgkh7kOpl
         4B+2T5QTjbFKGGkrZqD+a1gl5/aRiIF+Wial8pi7g6akaMKavqYKKUBTsKmooVnMC+BL
         JrMh7VKIae1DSyA2efZaUZvxbIQYRUTio4mF9LW4lLWOLey+h8YdN5Ql1Rizh8EWvZSq
         y3txYg99ln6T/eoo9PJxa5+iZO8P29d/7QU/KLnss+PIuqk9JXrQKkMQauUiux+6K/ii
         3uUFk4Pbs8/3N+xbMvvz7tCZe51NiEsO/uYOYdAFxtc215CBHc+qEJhg/DsU+cpJ27eg
         TC7w==
X-Gm-Message-State: AO0yUKX+PUUmNizej7SzWUMzzUcpt1OcZbpX3ik/XZlxwZ3rui4i5yVd
	awXLcAdCy/E++YaoADI7PMOCWw==
X-Google-Smtp-Source: AK7set+lxQhevUPXYKqS7jtxNCvms4/+advMJ1dI2u0ZlQIAtqX95l06i6g/8T6Oo0vZH3lkYkCzfA==
X-Received: by 2002:a17:907:3f90:b0:878:711d:9310 with SMTP id hr16-20020a1709073f9000b00878711d9310mr27459148ejc.1.1678437592913;
        Fri, 10 Mar 2023 00:39:52 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:2a59:841a:ebc:7974? ([2a02:810d:15c0:828:2a59:841a:ebc:7974])
        by smtp.gmail.com with ESMTPSA id dt22-20020a170906b79600b008d47cd2edfbsm684140ejb.60.2023.03.10.00.39.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Mar 2023 00:39:52 -0800 (PST)
Message-ID: <ea8aaec1-948d-832b-ff24-b35abd3a59a2@linaro.org>
Date: Fri, 10 Mar 2023 09:39:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 15/21] dt-bindings: soc: mediatek: add display mutex for
 MT8365 SoC
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>, Daniel Vetter
 <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>,
 Jitao Shi <jitao.shi@mediatek.com>, Thierry Reding
 <thierry.reding@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Xinlei Lee <xinlei.lee@mediatek.com>
Cc: Guillaume La Roque <glaroque@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Fabien Parent <fparent@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
 <20230220-display-v1-15-45cbc68e188b@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230220-display-v1-15-45cbc68e188b@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_003954_292767_34FAA5F5 
X-CRM114-Status: GOOD (  13.00  )
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

On 09/03/2023 15:23, Alexandre Mergnat wrote:
> Add compatible for the MT8365 SoC.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
> index ca0ca549257d..931d66893dff 100644
> --- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
> +++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
> @@ -34,6 +34,7 @@ properties:
>        - mediatek,mt8186-mdp3-mutex
>        - mediatek,mt8192-disp-mutex
>        - mediatek,mt8195-disp-mutex
> +      - mediatek,mt8365-disp-mutex

All these look compatible. Either make mt8635 compatible with something
or even rework entire list and make everything compatible.

Best regards,
Krzysztof


