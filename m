Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C9C3C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Feb 2022 10:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wJu1W1lUTB68P+sGcVRm9LZrF0/8lIq77jxHuy0bihs=; b=EBcrU5Fv6EnN1r
	8beR76nnZFxxeR7AlzCGD8n/Re94D5vupLsoQ1IjojCs8xdxHyHYQ0ynd6uOppfmDAsf0aENxrgkS
	yBzxh/KjikOppRXQWvJtlsdqwx53N1RBMA6izD/r2bbyNKKlpNAjvRoFNx9gNgCoBcgtQrXo9QRhB
	6Vvwk9+eOWyo7jwFJKCAjchSXq01D35+t5mHB8P+JsRfBMV/rFUukfUphHVVVucO88kPQ/5VTrkvm
	BJ+y+blTqp3OzMF4VCZPphomWlx9zi+YbGW2NrJ+QHJWt1PKQzmc+FHZXHnuf0LUZJa17jP//kQho
	qjcTIpoKdfFaQrnmHksg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKHVi-006Wi6-Rx; Wed, 16 Feb 2022 10:26:10 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKHUr-006WFn-TZ
 for linux-mediatek@lists.infradead.org; Wed, 16 Feb 2022 10:25:19 +0000
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A87E640806
 for <linux-mediatek@lists.infradead.org>; Wed, 16 Feb 2022 10:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645007116;
 bh=Ey6VaxN3+TtjS0CeJz8Z++b9aDBgnfhzVZhYIOYqsgA=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=HKaxITjw/61ZbCcTUrvoVZgNXISZTurIPV8pONtgveQDFoUGkDPPOXDWskkMGYHfE
 QlWBlgxDp3UHrRG+RMPuHF1EvCAcevafrfMW/yVYgbDs6ECL0GaGERgKT4eZbjFWqy
 wT6gTeodY/hpFqDxi9cGjMB8cM+ntFSSEE8C22z+1YF0ozEgcYLVE/zNdvzbJGkDam
 HZ+vhdIXquSeTU9jcUlEZfe2KiQWAUjlFi1e89Viwk/aNAAgqaJpMXNSp4ecwPGa2q
 G8VQXw5LmP782TKbabxGUP2dNAnsLNm5gqyv4z+8Gdzv5C9HGf3+M2KVxp83d2jFqI
 ig3lp2lagL/zA==
Received: by mail-ed1-f69.google.com with SMTP id
 bq19-20020a056402215300b0040f276105a4so1295851edb.2
 for <linux-mediatek@lists.infradead.org>; Wed, 16 Feb 2022 02:25:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ey6VaxN3+TtjS0CeJz8Z++b9aDBgnfhzVZhYIOYqsgA=;
 b=z9DyDhOzIlX33JU7xtk4TjtZ4Pz+maxHcG98fJ4u9uWXGBuF6lqmduSFzrobdWqi0g
 RVNKPQParhlGbrQO7n1axGJjGVMPsEy/HXMPvNqDp6pUzZ4zIF8YlXbQD2uOk6F3U+zv
 l4YuizyVrxH3+CcJC5q4R7WLJAIC5xrJZSE0ezuz61st1Axzj7vmXFlcZ9Ix7/w0Lb8o
 KqotE3v4gJsn+HfotuTC7fYgwU+iytQe45UYbbK4ZWpYBEsJe4m5uFwKEVeLBfoN0fWo
 9fchs5yLJiFLmNjfdnVIMfSy/45uTewfJwr9xHxr/H4Ir+Q+qn5E4g+ZmJCNgAB8H+cv
 NdAw==
X-Gm-Message-State: AOAM531xGw8NCDSYxG+7Pey9JxHBKbFFs5sDOC/CyaQl+w/qG1HQoZve
 1ZGy8fQcwQCzhSaAXr6ddEzsBGzJAO4j230e3KjRaaDDnMkoFWpnBPZX96NnNUBj6PqwPsIvkyx
 pC3qz9qxC0Q+KXNE8+3K9iaGg/tuMETT3ezIzTM3NlIid7XR3Ow==
X-Received: by 2002:a05:6402:42c9:b0:407:f86c:44e7 with SMTP id
 i9-20020a05640242c900b00407f86c44e7mr2210520edc.230.1645007116230; 
 Wed, 16 Feb 2022 02:25:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwXhI1GOJN+xMaYOEWFkB2LIcPlHVPuUI2OPv5j58HHAMwCjf2s+lIVP1mT/MDotPjYhLQjTQ==
X-Received: by 2002:a05:6402:42c9:b0:407:f86c:44e7 with SMTP id
 i9-20020a05640242c900b00407f86c44e7mr2210501edc.230.1645007116026; 
 Wed, 16 Feb 2022 02:25:16 -0800 (PST)
Received: from [192.168.0.110] (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id d25sm12653033ejz.4.2022.02.16.02.25.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 02:25:15 -0800 (PST)
Message-ID: <db4de0b0-1f27-d3f8-c75a-8dfa6f8eaca1@canonical.com>
Date: Wed, 16 Feb 2022 11:25:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [v2,4/4] dt-bindings: pwm: Add compatible for MediaTek MT8186
Content-Language: en-US
To: xinlei.lee@mediatek.com, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, lee.jones@linaro.org, robh+dt@kernel.org,
 matthias.bgg@gmail.com, jitao.shi@mediatek.com
Cc: allen-kh.cheng@mediatek.com, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Xinlei Lee <xinlei.lee@mediatek.corp-partner.google.com>
References: <1645003971-16908-1-git-send-email-xinlei.lee@mediatek.com>
 <1645003971-16908-5-git-send-email-xinlei.lee@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <1645003971-16908-5-git-send-email-xinlei.lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_022518_099707_364886C4 
X-CRM114-Status: UNSURE (   9.97  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 16/02/2022 10:32, xinlei.lee@mediatek.com wrote:
> From: Xinlei Lee <xinlei.lee@mediatek.corp-partner.google.com>
> 
> Add dt-binding documentation of pwm for MediaTek MT8186 SoC.
> 
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.corp-partner.google.com>
> ---
>  Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
