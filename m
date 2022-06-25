Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D68C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Jun 2022 20:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VLrefeAKt/Dq3outV5iV9u0MgIc7/N/yAidOvpVDbJc=; b=p0nhZjnhCgsCUvcsC2evPB+LBv
	/OP714u7ZLgIvEgna/IUux0ZSTFE8GhDeH6K2ummcTbtwJmPbjuguLmNaXgkJqldKeaahX+UP02oj
	S0B43TZ3tQlFfKEvAAwu777t3pR8PeBoTAFLpedOYosCbEU+plDO0GaQ6Yc3vQbW2PXEc8an1saAe
	kdiPnTOlptlBGMFc5Py6pAD/SK6PDHiZVucICBoyOSGAfoepSH86LgsgieWjFgFMZNpMNDiw0EJkF
	19l3/7NEJ8vMPZVcT4YH1/fe6yGErVZcNaamt6u+k890wz+96AChgC0q/KhOTpwC+ttFdI5j8B6c5
	MPAhgjEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5CQi-007hwt-5c; Sat, 25 Jun 2022 20:30:56 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5CQf-007hvZ-U2
	for linux-mediatek@lists.infradead.org; Sat, 25 Jun 2022 20:30:55 +0000
Received: by mail-ed1-x52f.google.com with SMTP id e40so7902782eda.2
        for <linux-mediatek@lists.infradead.org>; Sat, 25 Jun 2022 13:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=VLrefeAKt/Dq3outV5iV9u0MgIc7/N/yAidOvpVDbJc=;
        b=KZc5XUfSTB6d18qR5A6cE7D0tWCGwMhGBMo1UKJN3/LXHkcy4U4HMmrIYkoGCUKSvn
         ezA6v3kzloZnpdhm942xQb9LfpJKG+Oa2CMf9t7VNHTPZdzCAMPaAvs4N6+u0r0aZyjZ
         10VdRnOie5ay0w9fyvYizWAVz7CCeGEFVhlLNHFXhY/NdduAL8M6Rqw7pEztmPaxn//m
         RIB86JHvKpjEVPXOCmL9gxXJYptwhU0KNouN6/1aNTAZf2Y83lkLUTIFAiRgQjkI83Jf
         J3kOGpraHqgfI16zYOgB50cc1t0HBLZ2iFU0FzlDDtPIftaYfsBzzoT7a0jeey7wm07E
         kiMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=VLrefeAKt/Dq3outV5iV9u0MgIc7/N/yAidOvpVDbJc=;
        b=Man/8WzQhBO72calhCZBZO3S2q6cC10L+nRl+h1px5g+Cj+5oSz8wGZ3xp1sg8cV4E
         /g8yLMbBWEFQxfoS7eJuG9sqGYOyWzi7pfDkMz/i4wNVWjVcFYNlwJrRwXvb7twChcxi
         GUJ5Q8lmu0K4g+u5uTlV5e8RyexN71OuNLPlULxIQspJPqtF+tSOp/Se/Ihy/vfq419l
         Ml9wZqkNb3hEPLh94xYbpLW3h5NA91wek3Sv0+JN2FvUx6OMeIttneUkH8yNp9zBrwW4
         E14DpxI8MpaurUsL5iRy1wksiRhIaEM7qrmXaqukqYxIGfhRpEQs7mqVYeh/ksW8XNHz
         pjXw==
X-Gm-Message-State: AJIora8d4hHjh13YyPb0ND+iPX1gx12Umpf0n6aEw/y+4UY/0nrroCSI
	LlKRfVyCbI5hin6gX4ic4DagWg==
X-Google-Smtp-Source: AGRyM1uVxpf9B5TTl1Z7wyKfg1MYoKCGhLn+4rU1ejsUCnvE/XzJ6gdXqNQmFz45WmrjdZukZZqU9Q==
X-Received: by 2002:aa7:d353:0:b0:435:6a15:139f with SMTP id m19-20020aa7d353000000b004356a15139fmr7110700edr.19.1656189052795;
        Sat, 25 Jun 2022 13:30:52 -0700 (PDT)
Received: from [192.168.0.239] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id f9-20020a17090660c900b007262a5e2204sm2971200ejk.153.2022.06.25.13.30.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Jun 2022 13:30:52 -0700 (PDT)
Message-ID: <de5a0e6f-411f-0c7b-ae1e-1117a4126d2d@linaro.org>
Date: Sat, 25 Jun 2022 22:30:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 2/7] dt-bindings: clock: Add MediaTek Helio X10 MT6795
 clock bindings
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
 y.oudjana@protonmail.com, jason-jh.lin@mediatek.com, ck.hu@mediatek.com,
 fparent@baylibre.com, rex-bc.chen@mediatek.com, tinghan.shen@mediatek.com,
 chun-jie.chen@mediatek.com, weiyi.lu@mediatek.com, ikjn@chromium.org,
 miles.chen@mediatek.com, sam.shih@mediatek.com, wenst@chromium.org,
 bgolaszewski@baylibre.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
 martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, paul.bouchara@somainline.org,
 kernel@collabora.com, Rob Herring <robh@kernel.org>
References: <20220624093525.243077-1-angelogioacchino.delregno@collabora.com>
 <20220624093525.243077-3-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220624093525.243077-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220625_133054_035777_FDE19138 
X-CRM114-Status: GOOD (  10.93  )
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

On 24/06/2022 11:35, AngeloGioacchino Del Regno wrote:
> Add the bindings for MT6795's clock controller.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  include/dt-bindings/clock/mt6795-clk.h | 275 +++++++++++++++++++++++++
>  1 file changed, 275 insertions(+)
>  create mode 100644 include/dt-bindings/clock/mt6795-clk.h
> 
> diff --git a/include/dt-bindings/clock/mt6795-clk.h b/include/dt-bindings/clock/mt6795-clk.h
> new file mode 100644
> index 000000000000..9902906ac902
> --- /dev/null
> +++ b/include/dt-bindings/clock/mt6795-clk.h

Vendor prefix.

Best regards,
Krzysztof

