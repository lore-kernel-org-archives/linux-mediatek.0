Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC6A1C32771
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Sep 2022 12:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KPl0iZ8UJ/1m2XFqRX6CcPv1FA94Z/SXP+4+rwUaEt4=; b=pKMp3RLvhwm8RvQiHo7/Pm6zCs
	3s8uHTKHZtNN4CVIxdJwyLrRy7aHcSn+K24/lSbXZiUAw76YjnmQvRLnfBpw/RQkvH3fD64UD3yb4
	O8MuGy3cUAM36vqEA9PsxhQ9dAqUlH5wBrbNvw4XPBMF+Wxh27Wyc8O3Flgiz1yCQmXsZ3ugT7pSq
	fpf47EZRnEXohCqdBghNaSuO6mZYZX4eTGOFa4FdloJrLSrspntsqvgtAtBmTWGn30eL7T/cHdaNt
	hqhCda00H5Gp3MYUJ7NphzhHeEr2/tc7uU2fJRkIv6R6gIuhGKh82ZA6/iETG40t2PT7O6RGts3nL
	gGNAypyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocncd-004zKt-SE; Mon, 26 Sep 2022 12:54:07 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocncS-004zI0-Ba
	for linux-mediatek@lists.infradead.org; Mon, 26 Sep 2022 12:53:57 +0000
Received: by mail-lf1-x130.google.com with SMTP id bu25so8782947lfb.3
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Sep 2022 05:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=KPl0iZ8UJ/1m2XFqRX6CcPv1FA94Z/SXP+4+rwUaEt4=;
        b=okYgA7/fhQd/sJcE5Csrik9zW3/Hnaye5ECrYiYq9YA9uUAV9FsLvBNkgEGADsMOUj
         4pm1cfNUE1O03WSbQdhIcfGGK3J2rih116RjHzdQrPSmL7ToUF62/nixY1m+0moZYyV1
         M4zb8jH4miF+eYX/QOWMIAPvAZp02C2QFrMbrAIaioOJqzUymMMwX6j6ZAiweFRRS4cD
         dy5XNtiD10cW+Vg2o6+IDPzBkBTzX4daGuUVN6vXv/EiGc0j+rnfXwkkE9E4x3PVDfGs
         ELn+h+6Ia4UOBT2vJ8kQm2haPJIZEf1fIYTCwIXYPaZYxakhLxXWYPvpXvF61YGbkdeY
         WjUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=KPl0iZ8UJ/1m2XFqRX6CcPv1FA94Z/SXP+4+rwUaEt4=;
        b=4xNfkIRzXZQHlPrAheQqQs4TCE4k/YS7n0YUR1QT2Mnwk9i98GdGSIuJ4OT+0GehPF
         TwqJf83+KbsN65/z9E+Uw4FGKKZPF2OxQ4DrcZn5Cn/dM01VwEeoS4etEFWDfzR00c/c
         ZxaIrdc8JxUeL2Tj6pVTUHWAb1itYnEggegF0lt8Zeb0mc05oBBPr2m7ekU1ntiJ7tCw
         LMLexIZ74cNmZ949I0L9sxV9ald7AekLGVebAFgJa8oEMqSh4RMDX71V3d5hLG7Wm6nk
         q3mSlW+Sgpu6jT2qcQy5JwvpVtGd3rRISNyjYj4Y6IfZh1l7RQ7THl2/7y32c9YWRVtK
         5QPw==
X-Gm-Message-State: ACrzQf1RVcov60dKWe7Bw0NLqnYxqIsHcK1zh4ixn5U5ToGU7iNEI3BQ
	+VH4j49T0Ap3/fQ2oNxw7JEYjg==
X-Google-Smtp-Source: AMsMyM6NPR1Z1lf+hIqSHf67SlXWTj8N+5LXIQx2GNuLCwamoBGT6tKw9asfm7mmpcNlVuaCelsAoA==
X-Received: by 2002:ac2:51b8:0:b0:497:ac71:736a with SMTP id f24-20020ac251b8000000b00497ac71736amr9488729lfk.510.1664196831611;
        Mon, 26 Sep 2022 05:53:51 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id s29-20020a05651c201d00b0026c12b9b329sm2362563ljo.70.2022.09.26.05.53.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 05:53:49 -0700 (PDT)
Message-ID: <fea0d8b3-f9e2-d081-e0c0-d81c9ca405d2@linaro.org>
Date: Mon, 26 Sep 2022 14:53:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] dt-bindings: display: mediatek: dpi: Add compatible for
 MediaTek MT8188
Content-Language: en-US
To: "liangxu.xu" <liangxu.xu@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, jitao.shi@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220923014227.6566-1-liangxu.xu@mediatek.com>
 <33e9babb-0492-2f41-d055-45ed32d55906@linaro.org>
 <ff6020d05962e202e917644b06eaa2cff7b2bb99.camel@mediatek.com>
 <8cc90559-6e83-1b6d-2718-d26ceace6362@linaro.org>
 <023b0a09a65042e6fee6b668d3df506f7d8178fd.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <023b0a09a65042e6fee6b668d3df506f7d8178fd.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_055356_429989_7F012B11 
X-CRM114-Status: GOOD (  10.77  )
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

On 26/09/2022 14:12, liangxu.xu wrote:
> 
> Can I modify it to the following form:
> properties:
>   compatible:
>     oneOf:
>       - enum:
>         - mediatek,mt2701-dpi
>         - mediatek,mt7623-dpi
>         - mediatek,mt8173-dpi
>         - mediatek,mt8183-dpi
>         - mediatek,mt8186-dpi
>         - mediatek,mt8192-dpi
>         - mediatek,mt8195-dp-intf
>       - items:
>           - enum:
>               - mediatek,mt8188-dp-intf
>           - const: mediatek,mt8195-dp-intf
> 
> This means that mt8188 reuses mt8195, so there is no need to add
> compatible to the driver.

I am now confused. You send some bindings which do not match DTS and driver?

This has to stop... please post the bindings with the user - DTS and
optionally driver.

Best regards,
Krzysztof


