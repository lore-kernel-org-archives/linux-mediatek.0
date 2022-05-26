Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74DD8C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 May 2022 12:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u+fawh0bJ7L8zjLUE4IzR21kHyEcfs+l7mHnfLscy4A=; b=jYtslDSPS6WVwb
	lGB0RTXbn2dwEGfUbgI8sm1jtHk5bC7wB6NWzsRrX1FZLeLzOQZaWk1ZLcawjaqx7MCO3+20mU5Yt
	8f0KWKyogXS3MYks9JFYYNmTSb9lua5inkjy7eYiHLbtnK+/tGuQT9rGVH4Tu6vz/hUK5FRNtk+HO
	klveW1ZtHXOo+Z6kyBxqDgDgDIn/zvszkme/hzMYDp9gTCorDEnFMe/XIvSRA+hHyD7dTO6HXe8FZ
	OveiXFuAmWXyFTP67OxPh/GeetDHj0kaFB5lxX+g43GaHwobflUn9TlfgFdUZPspQ7aKn+QKfIXqV
	7uAp1UGa77zds9bP0vMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuD0Q-00Evht-Tc; Thu, 26 May 2022 12:54:22 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuD0D-00Evcj-15
	for linux-mediatek@lists.infradead.org; Thu, 26 May 2022 12:54:10 +0000
Received: by mail-ej1-x631.google.com with SMTP id gh17so2858328ejc.6
        for <linux-mediatek@lists.infradead.org>; Thu, 26 May 2022 05:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=jEnJvB+XBclLjbaDlwzX4FK9+HMU9DqoCc5eaysM7ns=;
        b=xgAZK4q4/M/LFSxErbc+IB4AwVljcgSb+Dnm5HujosWBdM0afMeiebe/uzAh5EzIKB
         WMIoPx2mMZe15h7gVTQhYflFgfplC8sid+bgzttXwSOk3kPRbuv813wSkgt76qA6ZkRR
         NNKxXlVcE8E+lbyxKbpxwIpb2/wcFQkrIuBpyX7brrXPTGehz5GYDDGNtVuHvjHgZESx
         UwdrmfRG8fZJbCbqMM1RuH6VUe6/6ZfSVA0pFxwOubYUeJ9JLvIOMG97ZEtkV9o4aSJp
         0L+nqK8AyvbmuBtD837aAOvK0F1LTSOXZZa1uhlQSYWyZGPN7z9T/ruRBqSNSfPmESLt
         dnLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=jEnJvB+XBclLjbaDlwzX4FK9+HMU9DqoCc5eaysM7ns=;
        b=7dlg3p9sJjcFg8YRcqvFTD0CFJI72y06NwVzHesONPt5HY3q0jkgyK9jpeHfcEECN9
         SOI7B+fgnoGB+SWR6EwIW77rBx9MHFpMfuNkTcHPKaeF+tYYIiWsB8xE6G749FhIwSgc
         EByggFJCGJtpEgrZuN1VhdxkQ8OQ4wYeRv6qkGSfaeeqWoSufVNks1OsQrHI2JqOLfcD
         Rm+d7ErAF39tWSUKOQWCPe7JmTct4ccP4XPxEGcZthNdYrk+RJi6iAePJLlOhSy7Qla5
         Nwk1omtdo5eS2rs9FyKqGiouulYnEv7o/N0/nPWBI6QoW8L2kYdeEHKS+iDKE8DXM4S/
         ct3g==
X-Gm-Message-State: AOAM533JrsuuWiQfCEYvTckbfnv2i/d9zkU0RWs/AUnvd1aVcweY4xuI
	NZ+zc5oOLA2vuj8fBwHOuJqTlA==
X-Google-Smtp-Source: ABdhPJy+7kaeGlQ2oSWlPHTQXrJGC/gmps6S8B6/CnegdLxtDvX2TuIvU0+rBlV1aa32+NPxZvtuOw==
X-Received: by 2002:a17:907:7f14:b0:6ff:2013:3e98 with SMTP id qf20-20020a1709077f1400b006ff20133e98mr3546761ejc.73.1653569643971;
        Thu, 26 May 2022 05:54:03 -0700 (PDT)
Received: from [192.168.0.177] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id s4-20020a170906354400b006fe98c7c7a9sm497527eja.85.2022.05.26.05.54.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 May 2022 05:54:03 -0700 (PDT)
Message-ID: <66591c84-ee8d-7152-f0c5-5e4a07f632fb@linaro.org>
Date: Thu, 26 May 2022 14:54:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 1/2] dt-bindings: mailbox: mtk-gce: Convert txt to
 json-schema
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 jassisinghbrar@gmail.com
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, houlong.wei@mediatek.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220524151512.247435-1-angelogioacchino.delregno@collabora.com>
 <20220524151512.247435-2-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220524151512.247435-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220526_055409_178844_FCDB17B5 
X-CRM114-Status: GOOD (  10.48  )
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

On 24/05/2022 17:15, AngeloGioacchino Del Regno wrote:
> Convert the mtk-gce documentation from freeform text format to a
> json-schema.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/mailbox/mediatek,gce-mbox.yaml   | 124 ++++++++++++++++++
>  .../devicetree/bindings/mailbox/mtk-gce.txt   |  82 ------------
>  2 files changed, 124 insertions(+), 82 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/mediatek,gce-mbox.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mailbox/mtk-gce.txt
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
