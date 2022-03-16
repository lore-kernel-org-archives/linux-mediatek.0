Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE76C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Mar 2022 15:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CwEL+rYFxG/Ee+MLegeB6IsI/mCw20VbwZ4hzHNhfAw=; b=smvo49xwL0O/No
	poBIWggCjIGLkwb4Jd4UkcbxI6bjwxg0Lp9fUhcw6ZDk27buNwfu9FcfpXXd3ydTK/ByBPLp8olua
	FmzHOax5Km4EjKfeE9IRLKwjuvqld7PjJYJHqhrv97/ErBbBMSprjkcR7NAKtEXC57M8JHiDHfXBP
	MWpqCBMRL37J/7nD4pw/qSbj9vUn+Fng0C8qWkUK0CGepJeS2Rdlhsy5TIkZiO5J4XAcDiQe8k8zH
	6y9/gjiAu/cVAcAhi+tnaxgp5zh48a8yFdyKjiYGlnw5aacSQV7K+/kegFSW1WNPT1frS3Fp75E3/
	pQbApQaTmSmxirJaojQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUVc1-00DZJv-7j; Wed, 16 Mar 2022 15:30:57 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUVQd-00DUQl-F9
 for linux-mediatek@lists.infradead.org; Wed, 16 Mar 2022 15:19:13 +0000
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id CC3B73F602
 for <linux-mediatek@lists.infradead.org>; Wed, 16 Mar 2022 15:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647443949;
 bh=n1R86AH40JMDGlhsJXdbdtccHR5xtuigPuTWuYsB7aU=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=UJuuWIeYpKlkSRWZdfyhkgTgFFjXz3peZ0FKAA7w4xF0tqNVoiEyMVZHYhMxp9p9u
 3XSNNtSRpnmda9d8Oy1SFzSZO0t975j2d/eoBKsSDCk/E+aDMJP95XSxed3SRw7HdA
 tz6VHZWOwK9/Lnq8jjUIzQYZq3lwWF/HYmP23+fvIPHs6+C7yFWk12VqtgA5DpED+a
 Cz7F7XLfdYOfFGE52p50wQV99adWZ+ztQnuFhZBdB6iZDunnCS9gPL336rXXdFGKhb
 vYT70Ylhp20XZWFwTGUZ+e2DkodqT70am2un482Kxo8zrs3moj+38RRZygFhxGmJWj
 VIJh6aPB0PaCA==
Received: by mail-wm1-f69.google.com with SMTP id
 k26-20020a05600c0b5a00b0038c6c41159bso1179788wmr.0
 for <linux-mediatek@lists.infradead.org>; Wed, 16 Mar 2022 08:19:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=n1R86AH40JMDGlhsJXdbdtccHR5xtuigPuTWuYsB7aU=;
 b=yIUTfKo0K5XXAAQztSs5FurjCWag+R2vEP9HmZKJnZwZvIs8F1ZC6IMQlGwzYQW7cG
 UXlQa+qReBLIiWUAK1LOo5UM6nU1YZYIQDfRTtVeVewdJbQautIMwNa26mh9G8uvxzid
 RIaCfeoMdQG/jDwSKIEuMiXmrgj3G3vq702VWQZX4PTAjhS2Fouz+mYpUwxCglUvIper
 0NA6Q2eORjv/BRpMxJjtfKdNQ1sJrkzfUKd9kSVQbCQS26m18kO9c4mH6ji9+sA9T+7o
 R/OsLpdsofMjai4puclSZZfghBx+hcsc+lQi1g9UtrkL/xliaZlib0UjxSrFQwmnMS2+
 02QA==
X-Gm-Message-State: AOAM533TD+eDG6HAqdzvI2GB8NQCyaT5TjFdQynpqxuBCPTtQQqt+6DZ
 etVAT7+BQJ87Riescop27kOf2ZuF2Wr/lhVpL11yt6w2mEoX6aIsIB2H4it/wcCZu+SEJCeokYT
 vXSB11YlmP97skrM+a3OrKoWjd2T9Y2TwWBaL7eq+RW0pRQUHFw==
X-Received: by 2002:adf:fe81:0:b0:1f0:246e:ae5 with SMTP id
 l1-20020adffe81000000b001f0246e0ae5mr353638wrr.652.1647443949237; 
 Wed, 16 Mar 2022 08:19:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7KtAfQn8O30h7vKxDeRV7uri401Yg0lHLAU4i8wtnkZBBAptCPe0PeY+wSBS+LC5ypMwvEw==
X-Received: by 2002:adf:fe81:0:b0:1f0:246e:ae5 with SMTP id
 l1-20020adffe81000000b001f0246e0ae5mr353605wrr.652.1647443948978; 
 Wed, 16 Mar 2022 08:19:08 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.googlemail.com with ESMTPSA id
 v10-20020a056000144a00b00203df06cf9bsm1821028wrx.106.2022.03.16.08.18.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Mar 2022 08:18:41 -0700 (PDT)
Message-ID: <cf765199-30c3-f963-4d9b-8f225efd5b32@canonical.com>
Date: Wed, 16 Mar 2022 16:18:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH V8 1/5] dt-bindings: display: mediatek: add aal binding
 for MT8183
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 matthias.bgg@gmail.com, robh+dt@kernel.org
Cc: p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch,
 jassisinghbrar@gmail.com, fparent@baylibre.com, yongqiang.niu@mediatek.com,
 hsinyi@chromium.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220316115155.17834-1-rex-bc.chen@mediatek.com>
 <20220316115155.17834-2-rex-bc.chen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220316115155.17834-2-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_081911_797991_07DB5F7D 
X-CRM114-Status: GOOD (  14.63  )
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

On 16/03/2022 12:51, Rex-BC Chen wrote:
> Add aal binding for MT8183.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,aal.yaml    | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> index 61f0ed1e388f..eb0299b80522 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> @@ -22,7 +22,9 @@ properties:
>    compatible:
>      oneOf:
>        - items:
> -          - const: mediatek,mt8173-disp-aal
> +          - enum:
> +              - mediatek,mt8173-disp-aal
> +              - mediatek,mt8183-disp-aal

This should not be under items. You have just one element here, so
directly "enum" under oneOf.


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
