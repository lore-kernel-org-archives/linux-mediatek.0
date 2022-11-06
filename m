Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 930DBC433FE
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Nov 2022 10:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DI2wXka1VPadT80guBcm7zD76/m9DkDi2ofoECszAB4=; b=dmCPRaPKToa3vO9p+Z2WeiN1mg
	stCDPJPrvpafkdhN7KAxbz8LLOqmVxz4zktn2Yo6YmmD124Oh00f9aLgMPSLCZHC9Jnk5JPs/b8MT
	FPblJeeH055GiYYPsj/4nkf3V4aIP2JGSnw5fBS8CQRVDSm+CECZmOZJFUUBmm0XytxAr8YgaLPaY
	6XL5N9w3ioBnnjkSDS1Xuax9eQr+WjZHKzIJwYiMP8uegiHKS8vB8i7JMS3jCBe6Og2CLgh/7tPMx
	EwtwieDvqGAy89ShJiRYubEJW6jh8C4TH4h8nZNCTSSN2F81WuLMTmlYGDWchXMPTm3cGLgm/IlMX
	laUNEjCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orcsv-007xMp-1T; Sun, 06 Nov 2022 10:28:13 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orcsm-007xLO-J2
	for linux-mediatek@lists.infradead.org; Sun, 06 Nov 2022 10:28:05 +0000
Received: by mail-lf1-x136.google.com with SMTP id bp15so13067465lfb.13
        for <linux-mediatek@lists.infradead.org>; Sun, 06 Nov 2022 02:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DI2wXka1VPadT80guBcm7zD76/m9DkDi2ofoECszAB4=;
        b=jhgcp1ofKi8CJNeepvC5AR0U4tw6fExjpPcT83RAe07y/NTity7qnNXs0wcWITUjfp
         WP4uRJCrqecyhOzyjKyxCmhiElB98snuqxq0ApmCHpkR7/XYF85ZZbUge05N1z/yvsQ/
         WwRgcfs1G5U4oQ/zPZqImVS8AmcEQI1GH/nF7MmZXaiS1hPEiZvgQ9Md/Omg/mJwhQ0q
         Jw8Q8E9g9uJeCvr41nMbQwCIGNarqEAM2aPs5dLnq8lP+dpFK1cOnhUQ3Iuj+jjVzA+G
         w4t/phl0rKWlFtjA2RksIPxr9MpharsOvhY71fJkkwpVyLEpSZbIwTPpljGgEqHydXsE
         1JUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DI2wXka1VPadT80guBcm7zD76/m9DkDi2ofoECszAB4=;
        b=3Ri8bHEXPtsMRl5rduI8pjNOWP0Xs8T4kAQEBVhT+xMF9/LKLxBf6etESyf0k7atrt
         tm+01cKr398RmgXNLYFBpWtV4azF1RC9CBxk4+dh7q4KhQ6kn7YJ0tj+WteZ+eiT10q9
         8DpMZ43Kia5SSoV5eBVEnIts7cxhKKlpwCDL7V6R7o7fsiJMkOmccQ0rVqLiXyz2SbtF
         9jcCuffGrRTlGp/eKk2PUPz+m3X+z9t7VPJ7YnhmXj+P70tW5wX4pWlSHQ1VH2hhZbAR
         AclV6FWyLyIabxRsOAuCJyp1VRLeySyoBkUA4iAGRMKWU8Bi+I7fQTDMiV2OS1ur0hvW
         6S8g==
X-Gm-Message-State: ACrzQf3bfDGj6RjqaGQLT+atWy6aDLH2TPDrrzMYkhQfSYCXgmVW/Ijt
	Xdi7zXDhZflkPrQrgzXdz+Ofew==
X-Google-Smtp-Source: AMsMyM6iECEVS+TMPYiJoxK6Wgqo3Wojp65hLGJ1ilpUTfDe6RaCnWsjg7cygqvuDwjeN9z/l3JOiw==
X-Received: by 2002:a05:6512:1156:b0:4a2:7e73:1f28 with SMTP id m22-20020a056512115600b004a27e731f28mr17946406lfg.38.1667730480138;
        Sun, 06 Nov 2022 02:28:00 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id x18-20020a0565123f9200b004972b0bb426sm632697lfa.257.2022.11.06.02.27.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Nov 2022 02:27:59 -0800 (PST)
Message-ID: <bdb46b7c-6e08-26cf-491d-ca68d36f29af@linaro.org>
Date: Sun, 6 Nov 2022 11:27:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 1/2] dt-bindings: gce: add gce header file for mt8188
Content-Language: en-US
To: "Elvis.Wang" <Elvis.Wang@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20221104074443.26172-1-Elvis.Wang@mediatek.com>
 <20221104074443.26172-2-Elvis.Wang@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221104074443.26172-2-Elvis.Wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221106_022804_634884_87F1C697 
X-CRM114-Status: GOOD (  13.77  )
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

On 04/11/2022 08:44, Elvis.Wang wrote:
> From: Elvis Wang <Elvis.Wang@mediatek.com>
> 
> add gce header file to define the gce thread priority, gce subsys id,
> event and constant for mt8188.
> 
> Signed-off-by: Elvis Wang <Elvis.Wang@mediatek.com>
> ---
> Thanks for the reviews, I have removed the incorrect reviewed message.
> ---
>  include/dt-bindings/gce/mediatek,mt8188-gce.h | 966 ++++++++++++++++++
>  1 file changed, 966 insertions(+)
>  create mode 100644 include/dt-bindings/gce/mediatek,mt8188-gce.h
> 
> diff --git a/include/dt-bindings/gce/mediatek,mt8188-gce.h b/include/dt-bindings/gce/mediatek,mt8188-gce.h
> new file mode 100644
> index 000000000000..e2e2c56016a1
> --- /dev/null
> +++ b/include/dt-bindings/gce/mediatek,mt8188-gce.h


What is a "gce" subsystem or type of hardware? Why do you put headers in
"gce"?

Don't continue this pattern. Mediatek devices do not get specific folders...

Best regards,
Krzysztof


