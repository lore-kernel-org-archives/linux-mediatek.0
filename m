Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78725C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Mar 2023 11:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i+Da6p8t1bRmX9X4IXLRnY2DE8przk6Zp2l2Yy3LUzg=; b=MjoP25ehxpbMoSQ5Z2szrjU2Y/
	Qa1+370xwDx+pwxFKPG2pb9/Esuy+Ce8Z8SkKmL8LqmwHk1np6EZ/8c4q9M69lY4KvFzhTtJASSrZ
	TmZdqndZTDQZZHiCnjGQ6k9aEh1lIJl89ltT6mdLkp6Ain1pJFaY5+IRb0qHuBt7sOg+LxTQ4yO/C
	alVm2gvgKpufvKfj/8CjqfjixmaB/fsqSeRq69H1dO/bgaW7fBRhb3un9G4Y6WMFNB4/T2e0czrx5
	WTxJWeUI5RNuYlYgop8mumBx4iVRX9HuyZ/HUQVdrHB6LiU7V9OQw/jtky9TywGZN0GGdcVUEfR04
	LAYXLx9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pg1pO-006aIR-0g;
	Sat, 25 Mar 2023 11:12:54 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pg1pL-006aGZ-2Z
	for linux-mediatek@lists.infradead.org;
	Sat, 25 Mar 2023 11:12:53 +0000
Received: by mail-ed1-x52a.google.com with SMTP id w9so17444769edc.3
        for <linux-mediatek@lists.infradead.org>; Sat, 25 Mar 2023 04:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679742766;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i+Da6p8t1bRmX9X4IXLRnY2DE8przk6Zp2l2Yy3LUzg=;
        b=geb6dszSdPEclC0i9jC/0SdaI754rIyFU2xO6DvpzfKgCLSi+crJ/ha7gvhh4mkKJ/
         RpgSNLq7KKSn/GzBp8VLUBAR+2ZIhvhymqwW8mJDYGVIrWgkNps7uRpPPjtE4ewNxu0Y
         7eqDdNgaBIFoabYq9srYc4gpT12DeaRGWU45faXGSVfjkHKsc3pxgRnhYvs6MqoShDeO
         35kDR18K7Zsn3GNsRPQXmh3wXADALhYL37fUF4LBkC70l+l3bpBLVFsgE+5aZ5aHU1XQ
         Q3+Lu91azxFIeVN+MsAPRA6V+IMmKDyRLJwaan9TVO8Pe0FO37SarJm5xDtDR8HWUqso
         QO8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679742766;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i+Da6p8t1bRmX9X4IXLRnY2DE8przk6Zp2l2Yy3LUzg=;
        b=cYdYLhQ1Rl/Z5DS1o4ToFuzrKcBMMeegY+7P2wMSHwT7LZl3FFJDI9NFvCge+V+sGQ
         F1uwBpwFPFTDFrKSkRFQ7UjnO1AE16XByueobz09jBK8DwyRM2jONLdz7BcMFMvS9/kA
         43wW+j5KAL0r+Ec+HLpresMo1y/cGfkkVcks8iQTs3O4rwo8o5BVxJET6CB+tbrzzkuQ
         XUmf6aNg7qGmiLfLNFqCDUu/7l4FkDG10E+S23wRFL302I8erFw57+JG1cRuZy28TxYs
         GTO5kvNMIngQuMX6z++ihKuq7xm8lqmaRQxl+1uj/znQb6KfVIRiYVrC0znSYOT00jG8
         31PQ==
X-Gm-Message-State: AAQBX9fX7Hn7VAibbSSMHN1XJCF/PBJnZ5WPCcBcJpSkpviYQGj7Jtjb
	o8bAC9uwA4U0pvTCA4sYzVR5Hw==
X-Google-Smtp-Source: AKy350ba6T8ZzFpM6baZosd4rhtYX0c3g3ppufyrcSy2Ttex0o5fyknxa3roehxOistyoBz3X8p/AQ==
X-Received: by 2002:a17:906:b349:b0:931:91a:fa4f with SMTP id cd9-20020a170906b34900b00931091afa4fmr6752833ejb.41.1679742766251;
        Sat, 25 Mar 2023 04:12:46 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d230:b2c7:d55:c9c8? ([2a02:810d:15c0:828:d230:b2c7:d55:c9c8])
        by smtp.gmail.com with ESMTPSA id k24-20020a50ce58000000b004fc9e462743sm11988618edj.91.2023.03.25.04.12.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Mar 2023 04:12:45 -0700 (PDT)
Message-ID: <488a6684-50aa-e78d-d704-7f59ed3f2c13@linaro.org>
Date: Sat, 25 Mar 2023 12:12:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v1 08/18] dt-bindings: gce: Add header for MT6795's GCE
 mailbox
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 matthias.bgg@gmail.com
Cc: qii.wang@mediatek.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, jassisinghbrar@gmail.com,
 houlong.wei@mediatek.com, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20230324175456.219954-1-angelogioacchino.delregno@collabora.com>
 <20230324175456.219954-9-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230324175456.219954-9-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230325_041251_830882_D3607781 
X-CRM114-Status: GOOD (  14.24  )
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

On 24/03/2023 18:54, AngeloGioacchino Del Regno wrote:
> Add the GCE header file to define the GCE subsystem IDs, hardware
> event IDs and thread priority IDs for the MT6795 Helio X10 SoC.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  include/dt-bindings/gce/mediatek,mt6795-gce.h | 123 ++++++++++++++++++
>  1 file changed, 123 insertions(+)
>  create mode 100644 include/dt-bindings/gce/mediatek,mt6795-gce.h
> 
> diff --git a/include/dt-bindings/gce/mediatek,mt6795-gce.h b/include/dt-bindings/gce/mediatek,mt6795-gce.h
> new file mode 100644
> index 000000000000..97d5ba2d2b44
> --- /dev/null
> +++ b/include/dt-bindings/gce/mediatek,mt6795-gce.h
> @@ -0,0 +1,123 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */

This should be squashed with previous commit adding this compatible. It
is one logical change - bindings for mt6795 mailbox. There is no point
in splitting one change into two.

Best regards,
Krzysztof


