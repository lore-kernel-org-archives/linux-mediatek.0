Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40198C6FA89
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 16:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aqzQjvp4t41Jz7jUGp3ZAp2nDn4twAnuhFEkrXjTvyg=; b=SL7o/IY7yF67PLNKLsCXcO1G8E
	AY4UPiCGdB0QgU7o+tpkLR+KP7GCL7FyzOT/say34JI8jW6fN3kJUSFi5z22yzbaeebbDBprD5Hcf
	m9Y7qAcg7/3b9ekx335rf16o5IKSKZjc/Ulrj0vMALP5uAJdepa7Wn8MS2ProhJ0fU7JPDYJBWbNn
	KUxtUK7uS+B3DaPsJrmm9v2uhix/9yq5iMdKBQ/xh8X3hHE9acrtrciYZZtEQ39jFQb9Ai6OrwBwf
	fxuTflYDdT8kK66V79WaWr6ntrX8mrKgDsRtokqunPQB3ApPPZq5bVSsuEwrsYIH66H8oUs3nnKoz
	zF0arsXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYUsn-004dZo-2k; Wed, 14 Sep 2022 16:05:01 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYUr2-004byU-7f
	for linux-mediatek@lists.infradead.org; Wed, 14 Sep 2022 16:03:13 +0000
Received: by mail-wr1-x42f.google.com with SMTP id b5so26410361wrr.5
        for <linux-mediatek@lists.infradead.org>; Wed, 14 Sep 2022 09:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date;
        bh=aqzQjvp4t41Jz7jUGp3ZAp2nDn4twAnuhFEkrXjTvyg=;
        b=bv4jcSOrYQdmAw5tIXiM4fFo8rXknewxV2tDaI3ZCqDkGeXZhaQ/HJVrJnoNRahM/S
         BhS5tlXvmz5H/+q8hnohv03K4JeHvPGtooXP2ebNjn83UkN2Rzn6bqDYFbSmzO40hUjj
         Bwu4AHdUIdPh8CMnpsGPBS0ejYA7KPdGonfD7O+S7+cV2lR1Ezal47i8MjdhVqiBqwzN
         fsHNnnbtqX08piKeLsl0LrodwLEmVvJTyK2EfUmON0jVJQeFL0ky1kHOTkJUH4ZXr8dB
         eedJ95XKJSZWAk8MTUCo6MEXswJb8IKj0lPbUzgy+3gzc3uaF4PZpcZTzUV6Ml+HFY02
         6mXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=aqzQjvp4t41Jz7jUGp3ZAp2nDn4twAnuhFEkrXjTvyg=;
        b=2dWiuVq4/Uv86Sp2x7U3D39tfnfPqSCUuKIa9F8RoiR8CMWL1SPXWEMaX3hKU4cTYk
         XtCJ6aOaq3PhuPb/E9/heEMuGibuccJjy+peqwdniRJ5+mP71Wf8+5njbf869xFFGfO2
         xCPdzFGSoT08+yngr9B4Je4R+qqZ8iCeyTmhaltvLsvQlJ1G6UROT+X2gnG6DdSdqfiY
         /b7z83TDme/YnfT43r1GKnVCXvRbizcBG+Gn4Hr1B2ICe6r/yYhHRfUUTHcHPJktL97v
         DQWM12DBT6UB9Uq03e3oGHcpudJhwDONKzwhJtjr8UPF3qqtMb1E6//eZNJjXhO59Xql
         QDoQ==
X-Gm-Message-State: ACgBeo14EVfFg3uAtePzRv6kyfeKi79AwaLCKRWQl/gfn93cgLvRAZco
	gocynBzh/ZOFPYKX5DCezq+KUQ==
X-Google-Smtp-Source: AA6agR4lKuES9242SuLhAy9XPb7I73BC3tyhkmK9vHGMmgkz0UiKbcrDvRouOntt44xvARa+AAMRKw==
X-Received: by 2002:a05:6000:16ce:b0:228:62e0:37a6 with SMTP id h14-20020a05600016ce00b0022862e037a6mr21764430wrf.563.1663171388351;
        Wed, 14 Sep 2022 09:03:08 -0700 (PDT)
Received: from localhost ([185.122.133.20])
        by smtp.gmail.com with ESMTPSA id v8-20020a05600c12c800b003a844885f88sm16585749wmd.22.2022.09.14.09.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 09:03:07 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 krzysztof.kozlowski+dt@linaro.org
Cc: dmitry.torokhov@gmail.com, robh+dt@kernel.org, matthias.bgg@gmail.com,
 chen.zhong@mediatek.com, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: input: mediatek,pmic-keys: Add
 compatible for MT6331 keys
In-Reply-To: <20220914103021.43593-3-angelogioacchino.delregno@collabora.com>
References: <20220914103021.43593-1-angelogioacchino.delregno@collabora.com>
 <20220914103021.43593-3-angelogioacchino.delregno@collabora.com>
Date: Wed, 14 Sep 2022 17:03:07 +0100
Message-ID: <87illqt03o.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_090312_338927_EBBB0D6D 
X-CRM114-Status: GOOD (  12.65  )
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

On Wed, Sep 14, 2022 at 12:30, AngeloGioacchino Del Regno         <angelogioacchino.delregno@collabora.com> wrote:

> Add a compatible for the keys found on MT6331 PMIC.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

> ---
>  Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
> index 9d8a0c3aebca..2f72ec418415 100644
> --- a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
> +++ b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
> @@ -25,6 +25,7 @@ properties:
>    compatible:
>      enum:
>        - mediatek,mt6323-keys
> +      - mediatek,mt6331-keys
>        - mediatek,mt6358-keys
>        - mediatek,mt6397-keys
>  
> -- 
> 2.37.2

