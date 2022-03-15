Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E744C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Mar 2022 10:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/ey6F80Ck8iaZIXVHY0i2kRQxGwFS2ZfIAFXFXOb508=; b=IECz5Uf1apOjs6
	JvpiQMmtEjGs7e7L8YiArHISeQGmkvpKWZxy8lHGGBnRhcIbyJYWRDgahnd6NWwxTJ0E4/DwR8fg0
	6Z9YwxwI6d0NAAhoDd0zeT3Gwzcn52O/mh8qHXJ0y6urgcTjOqDKv3uZCbJADnFn4ZUh5Wm1kZheH
	W/U/xMlfLsP+fM/w0ORr2cfxHbiL83iYLAGaM1PBcys6q3UcF7FZEiSxbLZDzdMiakJ05G2p6EdrU
	twpNHG+m8vRZVTUB1SOgjAo+rRMxJT0S2+o50XUX0PFWO88RfD1lcgUXkJMWX1C8scazv9BXborLy
	+F+66W0oC2LydGK68pZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nU4rI-008oWN-Hh; Tue, 15 Mar 2022 10:56:56 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nU4rF-008oV1-4T
 for linux-mediatek@lists.infradead.org; Tue, 15 Mar 2022 10:56:54 +0000
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 8C1093F602
 for <linux-mediatek@lists.infradead.org>; Tue, 15 Mar 2022 10:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647341811;
 bh=ht8KpCSDXfMeLKk1Iy9OjwDkeWKdnRpzH0Z8PU+F89M=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=LSDzC0deInfWjrGAItDnx4m/E5k6DCq6tWecLyJ4YhEooqeREvuPhb+4GYTT5NeYG
 t0tVG2+hX9U9/ytDV/AhjC/oYZFQkbKAyUTzea48+YXxlcCMJYSIoeZBoavgQNDBbP
 7dc9HdzAWeKM0RVFROooP5t3YgWV00Eh57aRbfXkzXcfyocZRDty2UxtD5muiTdxOa
 hnsQYy0NHqJAVomjhMv8RieBND6DFGRdFEpxxYKenGzKGMJn6rksDmEZN0Xw/ule0q
 r6Q1ZYtHCRngqmVDgl6Wvp1Kj8ClUcSVNfcc748Ko8aTE4A3+ZJ55sUh7OAydDiB1b
 oXlHYbvuYeO2A==
Received: by mail-ed1-f72.google.com with SMTP id
 11-20020a50874b000000b004186b7c1252so4563262edv.3
 for <linux-mediatek@lists.infradead.org>; Tue, 15 Mar 2022 03:56:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ht8KpCSDXfMeLKk1Iy9OjwDkeWKdnRpzH0Z8PU+F89M=;
 b=RijL9pvnfO9O2roSIHGShTCxD5HSHk9ARjWMSqRBVHgbnKyr7V+VbBNkSaBltLkvHM
 81qLy/J3TX/DhATeSkPtWsW+ggymgFL7uWKFb4qo6f0ixIfg4kSaqM2XAa5FiZoXlMjx
 +0uuatU+hmatRXsK0+cy8tN7gNRWdb4tlm5iJwySS407Y0LGprrWAM/qg4gGGa9ad1Rv
 jzfx/KQGqPr7NHWu0GWXB7EVFDornUV1nJZuGNaW7B9Hk//L2zq2Xrb+Vn2Mbst2quce
 nl3ZCoZNmh4qG968axsw3D0AV/XElb80HQeNd8NXeNsH4MtE4P565irRF2+jqOgEyHPu
 gOSw==
X-Gm-Message-State: AOAM532gKEURZJE7OXKp+rDd5JXBbl10ARluT/W4Mpa51tcU9UFNGs13
 KOaGdLLV2rODeUyTM/wBLynD3V2h1sNfuczxOU+cS6ZDduEr4Cqq6TTKnryj9Fh63/0mUVYhhSz
 D1MVEVmM6mbQlHNUxmcdXheIvoF8APoTu+gt5ACpOihmRA6vn+w==
X-Received: by 2002:a17:906:1f11:b0:685:d50e:3bf9 with SMTP id
 w17-20020a1709061f1100b00685d50e3bf9mr22467089ejj.275.1647341811110; 
 Tue, 15 Mar 2022 03:56:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1Vc0VBi8iyHSnXP0SjQn1EF5R+EUhGiixvRk7hd4/4ka6soIYQAQL/knRyeFkxKGN4H/zyg==
X-Received: by 2002:a17:906:1f11:b0:685:d50e:3bf9 with SMTP id
 w17-20020a1709061f1100b00685d50e3bf9mr22467063ejj.275.1647341810849; 
 Tue, 15 Mar 2022 03:56:50 -0700 (PDT)
Received: from [192.168.0.155] (xdsl-188-155-174-239.adslplus.ch.
 [188.155.174.239]) by smtp.googlemail.com with ESMTPSA id
 e9-20020a170906c00900b006d4a45869basm8011143ejz.199.2022.03.15.03.56.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 03:56:50 -0700 (PDT)
Message-ID: <095b4dad-ade6-c742-1993-e5dc89f5cb93@canonical.com>
Date: Tue, 15 Mar 2022 11:56:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH V7 1/5] dt-bindings: display: mediatek: add aal binding
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
References: <20220314090033.25773-1-rex-bc.chen@mediatek.com>
 <20220314090033.25773-2-rex-bc.chen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220314090033.25773-2-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_035653_347089_92D6B390 
X-CRM114-Status: GOOD (  13.99  )
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

On 14/03/2022 10:00, Rex-BC Chen wrote:
> Add aal binding for MT8183.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,aal.yaml      | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> index 61f0ed1e388f..6c8c83988a24 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> @@ -23,6 +23,8 @@ properties:
>      oneOf:
>        - items:
>            - const: mediatek,mt8173-disp-aal
> +      - items:
> +          - const: mediatek,mt8183-disp-aal

Use enum in previous entry. This is weird setup to have items with one
element and then duplicate it for another oneOf entry.

>        - items:
>            - enum:
>                - mediatek,mt2712-disp-aal


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
