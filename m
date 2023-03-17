Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98872C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Mar 2023 11:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hNO4YTYPu+vesxBB7tlPYGkKhGJaH/b9VuXd4UUCCuk=; b=KockAQ+wVuoQIOw5FNpItg8nmO
	f5qAauc73DRFkY+nA3UA4JHHqeAMLflAm8F3HnFxiGQsri4giuk9yhTb5m3/jFlFv0TAqykp64rGR
	34RNOuMj5hm7Dpm2Bz586wjQwcl6/SWJzKNnECIUmno5TF07LUURV6dwyh0Sdi4HyB/6SsRmSDj0d
	gS2v4tjsjsnJ2nZMuoW+bw1MFx9V8smRco0jJYlHA6e7XFrFsl7luJTZAeIxeDfhgo6imjD1Sf/A4
	DXB0JRFkSAjMXOXOy2DpCPOVsENxpKxhfNVho0T1hRVOCEL5Vegcfq1i/vm0glyXGfAdjJczgH7bD
	SUkD+uMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8Dc-00230u-11;
	Fri, 17 Mar 2023 11:25:56 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8DY-0022yr-26;
	Fri, 17 Mar 2023 11:25:54 +0000
Received: by mail-wm1-x332.google.com with SMTP id c8-20020a05600c0ac800b003ed2f97a63eso4899972wmr.3;
        Fri, 17 Mar 2023 04:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679052349;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hNO4YTYPu+vesxBB7tlPYGkKhGJaH/b9VuXd4UUCCuk=;
        b=i9Wj5Wz2CcBxCaIXIP8h3Bj0dRq3ztoYJf2yINByDJ38A2uO4OqKGsTcbXGQKpKZIq
         c4qDeBStYgUnByThXiiETA5g8D5tZpmTeFEWS9hxkkkpxN0mt9l8UYLBWabTR331kzCe
         lFWjaAmeEkwSY+8F6L3LwP5vjZcA3i7icV2F7U/feh1Xv6TAjf/Kwt6SB5gd+ojaVWDD
         EO+mKlFhyl5Op8DXtQS6/PqFrJBzrCBF1CM7mmv2YXDhI7SVoWzCYVsFA+Zs43BvFXrY
         RIyjpCgEtOZa8zp1GO0hUMW9pBwpnwnT0fiRHOkQqQvlBYiY9AwCBtXx0BP0m98pjEQl
         jUYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679052349;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hNO4YTYPu+vesxBB7tlPYGkKhGJaH/b9VuXd4UUCCuk=;
        b=lx5rA84zXWF4iCDILrkL3EIvYmcX77FwaMVwTJmy3uDCoZZsxMlFGUGNwx2XzIkK+p
         7PFgGq7cdpM2NKQYN9nc3jQF85IY932q75h5XqM1AzYJB/gcjB0DNNTTJW+0DJL35i0D
         gcTdfyOnZykNsDLzZfI6RJYFYCuT7UntPM0UX1Zumr+RmIcakOXeAIP2dkyyf/Bs60VJ
         g2ts89+wS3b5MjGue4t5ZGp7UzqXWvxqPuFBHSwVmK90Z7snf4S4sblmcQ8t9OyON+Gl
         cUgn2A/U5whw0+9ShNIpwRKBntaTnkmrZo1DubakhyEHfJSy5lb+rMLcIjmAtDW4C+H4
         HPXg==
X-Gm-Message-State: AO0yUKXE9Hqvo6arU5MIjPUghR+bkP1EZaVupZ3bNq4FYjou4dRXVijK
	BqTmgypaQ7eCkQtbu18fORM=
X-Google-Smtp-Source: AK7set9AZgBwQRetpG5pAKvdSStKHWZZDn5pX8FDFHrAZcHx7URK0Whqyt8RNBG4wx0hW18wu9zHkw==
X-Received: by 2002:a05:600c:540a:b0:3ea:e582:48dd with SMTP id he10-20020a05600c540a00b003eae58248ddmr24674303wmb.34.1679052348654;
        Fri, 17 Mar 2023 04:25:48 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id m25-20020a7bca59000000b003ed341d2d68sm1717773wml.16.2023.03.17.04.25.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 04:25:48 -0700 (PDT)
Message-ID: <008996c3-074c-b443-73f2-c14f0fdf8e4e@gmail.com>
Date: Fri, 17 Mar 2023 12:25:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2] dt-bindings: display: mediatek: Fix the duplicated
 fallback
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20230306-ccorr-binding-fix-v2-0-4822939a837d@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230306-ccorr-binding-fix-v2-0-4822939a837d@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_042552_707698_2388058A 
X-CRM114-Status: GOOD (  18.00  )
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



On 06/03/2023 17:15, Alexandre Mergnat wrote:
> The item which have the mediatek,mt8192-disp-ccorr const compatible already
> exist above. Remove duplicated fallback.
> 
> Fixes: 137272ef1b0f ("dt-bindings: display: mediatek: Fix the fallback for mediatek,mt8186-disp-ccorr")

We can argue if dt-binding patches should have a fixes tag at all. Given the 
fact that there are so many warnings still around, I don't see any value add to 
backport these to stable kernel.

That said, this is defenitely no fix, as it's only a code clean-up. No warning, 
no bug, no functional error fixed here :)

> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
> Fix MTK color correction binding
> 
> The fallback compatible has been duplicated in the 137272ef1b0f commit.
> 
> To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> To: Philipp Zabel <p.zabel@pengutronix.de>
> To: David Airlie <airlied@gmail.com>
> To: Daniel Vetter <daniel@ffwll.ch>
> To: Rob Herring <robh+dt@kernel.org>
> To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> To: Matthias Brugger <matthias.bgg@gmail.com>
> To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-mediatek@lists.infradead.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> ---
> Changes in v2:
> - Fix commit title.
> - Link to v1: https://lore.kernel.org/r/20230306-ccorr-binding-fix-v1-0-177d81d60c69@baylibre.com
> ---
>   Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
> index b04820c95b22..3aaf44719786 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
> @@ -29,9 +29,6 @@ properties:
>             - enum:
>                 - mediatek,mt8188-disp-ccorr
>                 - mediatek,mt8195-disp-ccorr
> -          - const: mediatek,mt8192-disp-ccorr
> -      - items:
> -          - enum:
>                 - mediatek,mt8186-disp-ccorr

Please sort compatibles, that will allow for easier reading once we add more to 
the file.

Regards,
Matthias

>             - const: mediatek,mt8192-disp-ccorr
>   
> 
> ---
> base-commit: add072536971d7ce891fde3cdbf68c55e7cfa95a
> change-id: 20230306-ccorr-binding-fix-718c6d725088
> 
> Best regards,

