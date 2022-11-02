Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF80CC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Nov 2022 20:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ltt9NnEIjGYG5lwZ6IHnSObeQ3raAW3TtWZ21QCUHmE=; b=qAv9+BoMhj9roXkeUn4nU+5Tyt
	nDODetRpiNv8KNwa+QQpb6sk3NDXxeHz1s1wJeiHR5NyBunOKIcVduobJxUtSVmIQZvI6VxfAwzE0
	Vw4p08kfkFNaICpsBrf73WwNKNLO13JmrbM5zKXFW2LwLB3tpgPyg/gXkChLWxjX8juVSFL7BOqL2
	AF1VDjAW5rUXX4CXo+/O3BXwYh5XuPaloy08lAR42yqqg1K4eC9ARRR9d2oJqB/iTcCjcxdHAJldx
	Lk8V4QEp01gx1G8jSr7NF6WKsiNkwE1QMt5+ySTnEV1dCceQ/iTo8iM8Z4u1+zUvz+m1rbbxLhYeX
	kRMQhVYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqKaL-00EKkX-Ij; Wed, 02 Nov 2022 20:43:41 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqKaI-00EKin-TA
	for linux-mediatek@lists.infradead.org; Wed, 02 Nov 2022 20:43:40 +0000
Received: by mail-qk1-x734.google.com with SMTP id l9so12585727qkk.11
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Nov 2022 13:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ltt9NnEIjGYG5lwZ6IHnSObeQ3raAW3TtWZ21QCUHmE=;
        b=f7vI5crW47B36jradRBCcmIhyekL1RaywghaonA1HttPuiWTI4cKCEt+qm5zkoB7P2
         Lh/mNN9AyR2t9poLz7zE1UXsvqlgxiX+w/gT/VEdADVZAs4qkkCcCwv0ZRiWyK3zf5ox
         uI7rcJ8nG6pJbDp979SHFIclSffX/jjRzy01tv87kgL0nvtl+3sjWq0lSDfw4Ah+XWkE
         DInQqk+6kr7eJfM+Sqmkh95rxOTrNuCP8SGXVTe2ZhePYnGudj40j7PSQu+rf3S6V+kr
         4FHYjughcsRnQgzAixrQ90I2g/ByQQmjOLRjFoU8Ex3FX9iVqc3c2wkcPVNsuFUlyEAh
         BHEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ltt9NnEIjGYG5lwZ6IHnSObeQ3raAW3TtWZ21QCUHmE=;
        b=J2g6dHQ+56UxpXFtNnPnvCq2vl3fZWwL0/P4DH92UTdAv2HS5D3x8knjOSlgMmVMRn
         U5ccy761c+JdgK7AWDtL3D2nXTW3pDaGYq+RI47uKRy82b+H/uDKm9PLvzQEmTvBZ0DG
         leT8qH9hjXT3HSK1dfKm5cwhZH3zCd1/Tz1GFHWkUB6LT0kp8X3qKXOBMck+pJKyFGYp
         4IBe720o1PFI++bFzFStDWjhpbM6DJkp2gS0ZC8g+yZx/U3VK2AZbq0LeQBzdDS4xq3c
         /GT1QQRL0LMZdn7p07uWzO/z6mj99XM/BrUQxy0U/qPKlBWfAMUF49PWqkHoD1BJDJgm
         KL4A==
X-Gm-Message-State: ACrzQf02xW8WcB1pLJU+cjufBsLX32aEvMAiIBcXeTde9DitUZdMhv49
	fN3+iD2s3lZR7Fp2JtjsHk8bbA==
X-Google-Smtp-Source: AMsMyM4oCbZg4lNyLR2GtlIfKfLa2p6djOGtmfr7BuAfYZIUxocU92p7n5dbJahyx9Shf5PRqLrfGg==
X-Received: by 2002:a05:620a:152e:b0:6fa:3cb8:dd9c with SMTP id n14-20020a05620a152e00b006fa3cb8dd9cmr10779651qkk.82.1667421817473;
        Wed, 02 Nov 2022 13:43:37 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:28d9:4790:bc16:cc93? ([2601:586:5000:570:28d9:4790:bc16:cc93])
        by smtp.gmail.com with ESMTPSA id x30-20020a05620a0b5e00b006eeae49537bsm1815398qkg.98.2022.11.02.13.43.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 13:43:37 -0700 (PDT)
Message-ID: <cdc79d9b-7afe-1aaf-3692-171370abaa3c@linaro.org>
Date: Wed, 2 Nov 2022 16:43:35 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 2/2] dt-bindings: thermal: mediatek: add compatible string
 for MT7986 SoC
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.or, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria
 <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <136157bd1f94c64504f87ee2db6b3ed0a8dcc3de.1667254476.git.daniel@makrotopia.org>
 <1216e96b279d08230cb2aa61d536f44c1e9b800a.1667254476.git.daniel@makrotopia.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1216e96b279d08230cb2aa61d536f44c1e9b800a.1667254476.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_134338_981895_E115037B 
X-CRM114-Status: GOOD (  13.79  )
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

On 31/10/2022 18:16, Daniel Golle wrote:
> Add compatible string 'mediatek,mt7986-thermal' for V3 thermal unit
> found in MT7981 and MT7986 SoCs.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  Documentation/devicetree/bindings/thermal/mediatek-thermal.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/mediatek-thermal.txt b/Documentation/devicetree/bindings/thermal/mediatek-thermal.txt
> index 5c7e7bdd029abf..efc16ab5b22b5d 100644
> --- a/Documentation/devicetree/bindings/thermal/mediatek-thermal.txt
> +++ b/Documentation/devicetree/bindings/thermal/mediatek-thermal.txt
> @@ -13,6 +13,7 @@ Required properties:
>    - "mediatek,mt2701-thermal" : For MT2701 family of SoCs
>    - "mediatek,mt2712-thermal" : For MT2712 family of SoCs
>    - "mediatek,mt7622-thermal" : For MT7622 SoC
> +  - "mediatek,mt7986-thermal" : For MT7981 and MT7986 SoC

Then recommended is to have specific compatible followed by fallback (so
7986 followed by 7981)

Best regards,
Krzysztof


