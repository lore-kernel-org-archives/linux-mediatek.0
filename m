Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 510BEC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Dec 2021 19:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7NCPGrYaqvTPweRnqM1t0TaNRnRjtsCNh2NdD042PQQ=; b=Qo+kuWc47rCmvJ
	g2CAoct73VQ6q6G+pZ0ufH5j4Oxi+/X0EJ0fScf0IEg821Mu2WPxJUdzk9E1a4Mef9FJBmf4VxQtn
	wfqvd9iii54xqYS9x4WjsJhEIBfXHwZ0zCfz6yfAf+biwdE+obOy/PFUGEx4jiq9vXKKyyOHbfoPo
	Le9o+A+LJFOddKFp0gxFJvFmJO0NdDrCC+aP58RvSf9XTyVKAwNvoZnAWUOErjOKe+RGIEXQm78tS
	YcdEcDEly+DV0tJgLdI6HmA7GOt20Y0dv/HoseVbADF4S/PQY7Zp5nC5LO8tzWmMF/3IwKZ2ej4jp
	QMRZ7TdS38rjYsze5mqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxa0R-002Q8u-4a; Wed, 15 Dec 2021 19:32:03 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxa0E-002Q4D-7B; Wed, 15 Dec 2021 19:31:51 +0000
Received: by mail-wm1-x32a.google.com with SMTP id
 az34-20020a05600c602200b0033bf8662572so16712828wmb.0; 
 Wed, 15 Dec 2021 11:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=x4k1zI3iK8DOJhhJ2DmMVfZXMtCAnERs0JGKLaP5zks=;
 b=NJgMzS5JVDp+TUVCMkznQf01HxZ3GyB9IF4TXBY0oWuHJcbxZHXfchrvt9vi4glgEh
 bg1kyJk7KSht6UVTTLmMWJf2Nb333+aUlD9CsAE3NNehWMqA8FdI/dgM89olrlK5HbTf
 bjdvKjcLfCZPhTF0MvqqckYJfqnbj1M/7eNeyZ31W5c2Wt4TlNV+44jCc66BCbK2/b/s
 gqmtHJjMJHSp8AFlMQyTjhmjKFn84n2GsW0u4dnDrwllWYrbAGVID6Ld4m6MNtfEVjQQ
 A28QyFVm6rZGo/7uSlsa3+ctDkrWpvNgDM43NWY8kblLGRfn49siHORt+xhASsma5vmt
 Jq8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=x4k1zI3iK8DOJhhJ2DmMVfZXMtCAnERs0JGKLaP5zks=;
 b=wwoQ9k9Jq8/ubH1swPKmblZD0ULaqUDL/WRHIIU8BpuWXU6d0yAiVYP5xz978xIhYp
 1+MzCDyxFoK5AJwJSqx4m0/K3B7EnhG7npCZSa/4sZJXcfFO46rk1YQOwPtbKYTobMWk
 UOL8ukk7wuRp2yi5PAWvO8hbcuoslFHGmm1H6B83H9qXlgiQLWoGYCd0nEOdV93EhFhn
 pcySi+ZxBj+867twkCSlPl80EbwosoEhJblCGn3GQolAdCixKLz/x+n1hSVA3TzrTQ0V
 o3PPqWWxmgS+FYV0xzfXkyS1srHGUKnWy1A6AxA9SLkucz1BuoBNJWtRFU8/V1jp7ACD
 1mhw==
X-Gm-Message-State: AOAM532/kHlyY/JMwTavn4rL5jRBwZRg3vw0jzoOjPzEO3bYS9UU1Zzc
 TETXUeaYnNBjNroPNJdodLc=
X-Google-Smtp-Source: ABdhPJztwiKwqGSqUj73cTpvfQYIax4z+WK20VP03cDOKPhcbs9acfRIZLYOMNnC3TC6Sn+0jJvD1g==
X-Received: by 2002:a7b:ce83:: with SMTP id q3mr1649282wmj.37.1639596708645;
 Wed, 15 Dec 2021 11:31:48 -0800 (PST)
Received: from [192.168.0.18] (81.172.62.207.dyn.user.ono.com. [81.172.62.207])
 by smtp.gmail.com with ESMTPSA id f18sm2729458wre.7.2021.12.15.11.31.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 11:31:48 -0800 (PST)
Message-ID: <f8abf09f-36ec-b8b6-f3f3-de06f05c4021@gmail.com>
Date: Wed, 15 Dec 2021 20:31:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v8 1/2] dt-bindings: arm64: dts: mediatek: Add mt7986
 series
Content-Language: en-US
To: Sam Shih <sam.shih@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Fabien Parent <fparent@baylibre.com>, Seiya Wang <seiya.wang@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: John Crispin <john@phrozen.org>, Ryder Lee <Ryder.Lee@mediatek.com>
References: <20211122123222.8016-1-sam.shih@mediatek.com>
 <20211122123222.8016-2-sam.shih@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20211122123222.8016-2-sam.shih@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211215_113150_304488_30DFB915 
X-CRM114-Status: GOOD (  16.38  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 22/11/2021 13:32, Sam Shih wrote:
> MT7986 series is Mediatek's new 4-core SoC, which is mainly
> for wifi-router application. The difference between mt7986a and mt7986b
> is that some pins do not exist on mt7986b.
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> Acked-by: Rob Herring <robh@kernel.org>
> 

Applied to v5.16-next/dts64

> ---
> v6: separate basic part into a single patch series
> 
> Original thread:
> https://lore.kernel.org/all/315d7823aa108c909a3d36464fe54763b76ab2f4.camel@mediatek.com/
> 
> v3: changed 'MT7986' to 'MT7986 series' in the commit message
> v2: added an Acked-by tag
> ---
>   Documentation/devicetree/bindings/arm/mediatek.yaml | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
> index 80a05f6fee85..a9a778269684 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -76,6 +76,14 @@ properties:
>             - enum:
>                 - mediatek,mt7629-rfb
>             - const: mediatek,mt7629
> +      - items:
> +          - enum:
> +              - mediatek,mt7986a-rfb
> +          - const: mediatek,mt7986a
> +      - items:
> +          - enum:
> +              - mediatek,mt7986b-rfb
> +          - const: mediatek,mt7986b
>         - items:
>             - enum:
>                 - mediatek,mt8127-moose
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
