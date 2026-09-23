Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4BBAC98304
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Sep 2026 15:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W4AqH3BG39Ccw9rat1s2LDjmKzSlLDWMcVufSeoX/Lk=; b=x5T1mudryxMaJ/PiKBAbOGazX+
	1Fk4JiYUAk5kJIud5jvjJ5X+L2quCWu9RGzlMnpmUeF4ddl1KcPBr11JUnsR9ISH0gEM9bmnIk9ec
	vtCk0Ks73UKhRAKOtCSuWb8NJuMpDLQlyrp4c8uTFm3mSfVuEzsIGEDVLopqnqlj83w2dxfngtCL2
	Dn++yNUTCaEDeo2tycmpP/4SawmzJrxoXG8pDAbYHVSWDkE4lsHzXZmeLu0nKRXopD+EchOgAkVKk
	N3sB93YgniEVijcRXCbQxh4ZaNzGb9f2/QyzY6FR7FS7J+b7Yp53k6m4qpQuvJMGAAr4qTnN0QSQs
	UcFWOvBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Ovh-00000008k5H-2D68;
	Wed, 23 Sep 2026 15:30:41 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Ove-00000008k4C-13hq
	for linux-mediatek@lists.infradead.org;
	Wed, 23 Sep 2026 15:30:40 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-396ccb65437so668413a91.3
        for <linux-mediatek@lists.infradead.org>; Wed, 23 Sep 2026 08:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790177437; x=1790782237; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W4AqH3BG39Ccw9rat1s2LDjmKzSlLDWMcVufSeoX/Lk=;
        b=bgYcIVFVNN0tzbZHaVjFFmAWaf+30myK170vRBpO1WIHh8QyYJy2SpB+JhHeqmnxjP
         71ws9Y3kGghSOTia4G+e28GnMK41BP3QQZgfiRcC4Qo0HoZsTGxiDVtu2I8FqSeFXZ9T
         yrbUHMDzhAx4vSiOgOC7o4+f/RJpnVTMZYVB7qWRebmgNUVkCOgovZTe/z2madVX4tpv
         a/X1pIIgqjqYYZUUz+Rj45ATuuQL5BGJ3lpPWJJ3cNuHygJ97oubkBrLCQLjaKKQSUeK
         gjGeqq0gXdBuwf7sCTjB/6DdOncVd4EjXnhf2FeiGoLvpYu28euoOpY8k8Afyft26OmQ
         yeZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790177437; x=1790782237;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W4AqH3BG39Ccw9rat1s2LDjmKzSlLDWMcVufSeoX/Lk=;
        b=JyijHI5RCs8MuoOyE6hNM3lLLnvVdoWOaWiK9kWjjYDfRWq4hhmpWoA3Jjc4JpZrPt
         KPOs/r/7wenay7WC0xzgvZgeeVOSLF8IT17+LiBAu/th7/LnwbfXE1BmE7WWqwI/Odqy
         jlThSGvf3KFQaMO61BjzCXiWphv3bkeD+Lbj7Oy0c4fd2esHADZArrp0qBdNu6Mf/IBU
         jrihawn+fd0IJDKoUdZRsAGqNbJ5QPKV82xT2StgKxL6h5/2sMoUd1l7Blz6dprIsCZ3
         shB4dMfkWxyFjXZtQcCTFLKTYhUedE2IEMHiNMkHg1Hj8stLurpd9Xg+FNDi3g2yGMNA
         HhMw==
X-Forwarded-Encrypted: i=1; AKwUvBzmolkdy/x4Pig6SLUUK0vjxdDLgnAsb0p99xshGA50KYGmuwzNsxLWYmYeATSxp+MEzQWnnpxvE9kkdpKIew==@lists.infradead.org
X-Gm-Message-State: AFuF++lctZSqMno+q4g9xq7z2mfcspTUAwWL8TJjwa+RSjf9SZBNbKZ9
	7TP2GfidrSkbcxIazFD02+tgUgykgaT+TqvXBGXtQ8jz4cojQbghjweQFNOH7j3SndA=
X-Gm-Gg: AYBFou3ze9gPHg05EDZHg1xOX8ZlwvbH5AP+cDaVBYwvuP76nzqADkpZ2fvbVsOZ5M4
	TKrsiTMSzuE2xHv0e+hl89X7OtihBJjrjxSJVRJ4L+6zeZl6+sd/86DZr8GywX8oc4Lv05Tl7Ic
	qeKUaufgJIV+fd8RQHJl0tPZjK5qCdnT5cledRn1sULQk7RoIlf/35CwxIND/Lxkmw1utR34wU3
	2gK38lqmJZ3rxQEMy72kj7rLLc3gdYGY4w84UGlXuLns+HQFhmMiSmj/6XDQ4QafYX7WbM7iKkO
	WnRT+5FY33SALI/CLCqZ6yoQVJbgsFBElP4D6OOFgrykbF5enEmZ4gyKfhZ1AcI5XjIUqgxF1FG
	HcZdJRc8ZzHwcY0cm2yIpYDdT0qPqvmDRMS84Wa9To5Lo0uS03mKka2eenQF9MOAQtQ87wsjA9T
	d0zoN9KU8s5ybHU+wqHAubcBkpldrhhYoZ9vDVLqChNkHDIe04NoGPaLOxfkFuMz3Zc8WoOsA=
X-Received: by 2002:a17:90b:4d0e:b0:39e:6a7e:ee19 with SMTP id 98e67ed59e1d1-3a07e6540e2mr2620920a91.37.1790177436748;
        Wed, 23 Sep 2026 08:30:36 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:b4a:dc6a:68e:2592])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07ddf1cf3sm5652074a91.9.2026.09.23.08.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 08:30:35 -0700 (PDT)
Date: Wed, 23 Sep 2026 09:30:33 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: remoteproc: Fix MT8188 SCP regs
Message-ID: <arPwmV6I6e2hCqo6@p14s>
References: <20260921232520.3127457-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921232520.3127457-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_083038_331317_489D00BB 
X-CRM114-Status: GOOD (  14.78  )
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

On Mon, Sep 21, 2026 at 06:25:19PM -0500, Rob Herring (Arm) wrote:
> Allow single-register MT8188 SCP dual nodes with only the cfg
> region. Keep two-register and three-register requirements for the
> other MediaTek SCP variants that need SRAM and L1TCM regions.
> 
> Assisted-by: LLM
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/remoteproc/mtk,scp.yaml          | 22 ++++++++++++++++---
>  1 file changed, 19 insertions(+), 3 deletions(-)
>

Applied.

Thanks,
Mathieu
 
> diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> index bdbb12118da4..2f0a28c7a24c 100644
> --- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> @@ -28,11 +28,11 @@ properties:
>      description:
>        Should contain the address ranges for memory regions SRAM, CFG, and,
>        on some platforms, L1TCM.
> -    minItems: 2
> +    minItems: 1
>      maxItems: 3
>  
>    reg-names:
> -    minItems: 2
> +    minItems: 1
>      maxItems: 3
>  
>    clocks:
> @@ -171,6 +171,7 @@ allOf:
>      then:
>        properties:
>          reg:
> +          minItems: 2
>            maxItems: 2
>          reg-names:
>            items:
> @@ -185,6 +186,7 @@ allOf:
>      then:
>        properties:
>          reg:
> +          minItems: 3
>            maxItems: 3
>          reg-names:
>            items:
> @@ -195,17 +197,31 @@ allOf:
>        properties:
>          compatible:
>            enum:
> -            - mediatek,mt8188-scp-dual
>              - mediatek,mt8195-scp-dual
>      then:
>        properties:
>          reg:
> +          minItems: 2
>            maxItems: 2
>          reg-names:
>            items:
>              - const: cfg
>              - const: l1tcm
>  
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - mediatek,mt8188-scp-dual
> +    then:
> +      properties:
> +        reg:
> +          minItems: 1
> +          maxItems: 1
> +        reg-names:
> +          items:
> +            - const: cfg
> +
>  additionalProperties: false
>  
>  examples:
> -- 
> 2.53.0
> 

