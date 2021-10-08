Return-Path: <SRS0=sTTz=O4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E690C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Oct 2021 14:33:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BDBB61042
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Oct 2021 14:33:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3BDBB61042
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i19uqjtLItqnJaqNhoUGLqCmNCZhBzwUm8gm0hrzdgg=; b=ykoX5rcjSygPWC
	DpfwEAumI0PmqL3i1XrUPTtWb/Sxq/pryL1JtKR59WC7O33MJvwwH93YrDFojMHODhJfW8Bz6Lzr0
	CFP6huif9CzVKy7kOXpfdj/Wcclct0MyWvv/lcah4nvdIA93uaKVV6bQi/xuVUOZsHJkaYmzdwZOP
	8X4BLbt5hJ4WUbSnjeGw3f6BBHscBF1I5fWEktdrZ5/vuv7EHT1F2c7JJrKuLx2IGkD8jjv09CjrU
	BKxdoK0DQyjY0Fl3m9NdsSnPtnCNnQq9ABIhC5LPYFP9+vpSCvbXsNfx47/LSW5dNePl28gm06ZJq
	tgoyZbKSCjDUoFqjO4kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYqwV-0036Do-WC; Fri, 08 Oct 2021 14:33:48 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYqwT-0036D7-I3; Fri, 08 Oct 2021 14:33:46 +0000
Received: by mail-wr1-x42b.google.com with SMTP id i12so17871233wrb.7;
 Fri, 08 Oct 2021 07:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=TShzTngLZi6o8lnvb+j8av9MVCWHAWUlT4LrbexAp60=;
 b=pmchaDdegR3myZdKHZV3r9+KFJhoet23YZP2QFSc+6jYCKT3uv7L6TBBAi6uWLmT5m
 XXKwRYEKBe8lA4O9pgTrItK1ChPJOsJzJE9Fo17lX6XSsYgo2qTYslmOcw1vKSz7ALoj
 p6ETP6Z+kTmh5ILTnqOVUPuAm0yvHqjSZxaFZHllo1L87bHlZGQNpi5lHX2Zr+I5DqgS
 /RsSS8/ghniGNVvYwacrxnIsEQG8Glh9YOd0JDZ+hSp+trU0gm26dfXUEITblhX5Fb7O
 lHkgiCCP+YuzzL9iXkF+TAjdvB1/fy59kkFBHvNAZrmRKJcK2Cp6r5kbUMj+JRYQ601Z
 m+Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TShzTngLZi6o8lnvb+j8av9MVCWHAWUlT4LrbexAp60=;
 b=frE9zLjL3EYkpcSSMecFEepo8Hr4GYMprcuzlJm33dIWAZXgk3ym1HsMrVkoJMvQaU
 pjNzsQg2khMMTGgILnmnCRem0BaNOETumlcK61CXr18CWiKsIWaxdVoaBK+oJERnTBDv
 i5AwEHK+7GXnqVR/wk6AaDF51QpMSaJLhINh5qdlHxBauTfWIIvWMetByRJxuWTInxl1
 62MNEe6RXOzK4CdYN04Gt+0edu4LoZjw5uC+BJr0ew+3m1INEuvWsg+SDshuRZwX5oIM
 dKT7nLB4TElcitt90B0hoXqvI8nho8CREXoVpvponmxs/6rzbmR5zNtzQ36vNpPJsm3h
 +hbw==
X-Gm-Message-State: AOAM532VP6cRPxS3kndNEvdpVt/31o4qKO6jThsVCpmzRP9e7gKQDfMC
 /DwHM9BEawUwiutIfUR0uFk=
X-Google-Smtp-Source: ABdhPJwAtIQy4fNzxj7d0iRIf29L54prs1Xgk5dkVhacrkjXhk4lwBP2+waVCVUbE0adQC7vmnygoA==
X-Received: by 2002:adf:bb88:: with SMTP id q8mr4512891wrg.390.1633703623613; 
 Fri, 08 Oct 2021 07:33:43 -0700 (PDT)
Received: from [192.168.2.177] ([206.204.146.29])
 by smtp.gmail.com with ESMTPSA id y191sm13532166wmc.36.2021.10.08.07.33.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Oct 2021 07:33:43 -0700 (PDT)
Message-ID: <0623e9d8-8b79-d163-0204-745809b0d0ba@gmail.com>
Date: Fri, 8 Oct 2021 16:33:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH 1/2] dt-bindings: arm: Add MT6589 Fairphone 1
Content-Language: en-US
To: Luca Weiss <luca@z3ntu.xyz>, linux-mediatek@lists.infradead.org
List-Id: <soc.lore.kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, Arnd Bergmann <arnd@arndb.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Fabien Parent <fparent@baylibre.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>,
 Sean Wang <sean.wang@mediatek.com>, Seiya Wang <seiya.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, soc@kernel.org
References: <20211005202833.96526-1-luca@z3ntu.xyz>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20211005202833.96526-1-luca@z3ntu.xyz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_073345_651532_2D8F6B2D 
X-CRM114-Status: GOOD (  13.56  )
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



On 05/10/2021 22:28, Luca Weiss wrote:
> Add the compatible for Fairphone 1 smartphone with MT6589 SoC.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---

This patch is now applied to v5.15-next/dts32

Thanks!

>   Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
> index 80a05f6fee85..0fa55497b96f 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -32,6 +32,7 @@ properties:
>             - const: mediatek,mt6580
>         - items:
>             - enum:
> +              - fairphone,fp1
>                 - mundoreader,bq-aquaris5
>             - const: mediatek,mt6589
>         - items:
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
