Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C314C433FE
	for <linux-mediatek@archiver.kernel.org>; Sat, 21 May 2022 14:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZVOm2VSRbxasanAis125mj96gT333+qjF91Dl79Awgw=; b=gUBLVhyu83FZc4
	OKf91OkbAKtFrmONJHq14AbLajyC1AjNfHCFJHhiJjhwioS+b8XkS/uwtZMjDYRP10TdQulwaP5JK
	wwq4yuSfagOd8UH+46TG6UIE0SwL00ACcj9SALQMbogLRQH5xCjW6Wik9CbVPKQFBgr1DQugfQJ2R
	duW2c+wRSu516oyMHP+WM2f2MLdfLVbR+1zSdyQ0uPqXmQDxCgbxEWVS/uO8ma9e2UrtLbOL9z7iK
	9Ao2d98XqYyLplnDZnzP/c4Z0SaD+OxXAmgm3nifrStmFKRIZHRUlQyqOSXK/gop0p8d8V9uQhVPw
	lmuq/2VEGKBUxN1Bm89A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nsQHu-00Gn4i-Fx; Sat, 21 May 2022 14:41:02 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nsQHq-00Gn2X-2S
 for linux-mediatek@lists.infradead.org; Sat, 21 May 2022 14:41:01 +0000
Received: by mail-lj1-x234.google.com with SMTP id g16so12461424lja.3
 for <linux-mediatek@lists.infradead.org>; Sat, 21 May 2022 07:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=LxFUgiNVciv/W8ZtHs9d3GAs5Rmd048FQ4zmny+B+pw=;
 b=AkjMk7cfzFpy/3MkLjibCyOtBl4UKyhVM5iB638FNB0COGIpbyXJ9lmtH1KP0rGLcN
 cJ4iFUb554Pfq77EW3zguqhNuVJTKOf2OcLg18rMEPuY59WdxNe1Oo9W6YjKGKmGPDve
 0nh3nx4vunHE5KmquxmiC4tqCARZL24FD/Dz+0SY9wKeujOVvBDX4nDR7IjFNQgDXKBN
 JS24Yvupjj9oo8AUsbQ0f6x/1UNXDLs+jkymMV25UQOWVP+PGGfNynh6BiyjEnTeSbmY
 Wqa+PQh8DMbRKgToN+d2NRhNbdH7VTtKPR0lnfVBC2HPMmqjz/A0eamxMKK203kNYJrm
 6P0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LxFUgiNVciv/W8ZtHs9d3GAs5Rmd048FQ4zmny+B+pw=;
 b=bqSOS82l11RyZObYQFLP1R80KESVwwvA5fplZ7kZLs8ZSwBvrZllVFu5aOjs8ZTZut
 IahBfn7vqLSAXxBZ8Uqb+Yo9op5IsRwWqFDWz8nfMYdERWJawos73BzIxyhIJLw15z+W
 DeC6WFMUoyPjZFOC66sq396MHkC7vjihK2fOaRfHreeCCSrXU+zPfKYvXp3K8RhT/Lxq
 i4RvbnCoxs3UI8nmtaUUDnGPRjK3Bgi+HdbqBLdS892V+GqHZq8R1Q1GUR6109dML6Zc
 physNZI0GG1bEUOD98lbeV3ZjkzZ78lyIsTjKXYgMCba5HjJMObtmLJcvePs3odB2mAw
 fZXQ==
X-Gm-Message-State: AOAM533YCP2v30YQDOKi5ccaiHh8Kzbc/yDa5caexbQS2xWjWmlafn9G
 QZG34bNNvM6PjLPYuGUZB/aqaw==
X-Google-Smtp-Source: ABdhPJxps9GV+yRWGawxgG+Pz6I2lgGdZiPB+Mj7qyuiM5JY7RRCBXJ6BbqfIh9EzhnSj6om1UUuYg==
X-Received: by 2002:a2e:97da:0:b0:253:c987:cb43 with SMTP id
 m26-20020a2e97da000000b00253c987cb43mr8381829ljj.473.1653144056354; 
 Sat, 21 May 2022 07:40:56 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 m4-20020a056512358400b0047255d21137sm1081811lfr.102.2022.05.21.07.40.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 May 2022 07:40:55 -0700 (PDT)
Message-ID: <f5982143-bca5-79c8-7e0a-f37dd098d481@linaro.org>
Date: Sat, 21 May 2022 16:40:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 3/4] dt-bindings: regulator: Add bindings for MT6332
 regulator
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 lgirdwood@gmail.com
Cc: broonie@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220520133305.265310-1-angelogioacchino.delregno@collabora.com>
 <20220520133305.265310-4-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220520133305.265310-4-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220521_074058_158963_0EB3C21E 
X-CRM114-Status: GOOD (  13.12  )
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

On 20/05/2022 15:33, AngeloGioacchino Del Regno wrote:
> Add devicetree bindings for the regulators found in the MT6332 PMIC.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/regulator/mt6332-regulator.yaml  | 111 ++++++++++++++++++
>  1 file changed, 111 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/mt6332-regulator.yaml
> 
> diff --git a/Documentation/devicetree/bindings/regulator/mt6332-regulator.yaml b/Documentation/devicetree/bindings/regulator/mt6332-regulator.yaml
> new file mode 100644
> index 000000000000..51077a865dbe
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/mt6332-regulator.yaml

Same comments as your other patch,

> @@ -0,0 +1,111 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/mt6332-regulator.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MT6332 Regulator from MediaTek Integrated
> +
> +maintainers:
> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> +
> +description: |
> +  List of regulators provided by this controller. It is named


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
