Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F57C46467
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Jan 2023 10:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wDhRoFdk/wz4YhwEvYGPmWAa3bEESv7lEX1Sf3y+vY8=; b=cNKuLNGe/vnLOYsQdPhqbafqOU
	c5uPHo7JQxTE+tRtP6socpD+v1W5tBidkImqcV+lmbBkf72m/b8wtLHN4d0aH/YXV2lgkD4QLXfsN
	Xy4RqGjh558Br+LjiNMmXfXOUFn5FKzqYJOKkca1hS1tECLvS1JsoUCeuHMcv6cYlaKQ1gnPF5QXf
	GwWxAB74n5nraVtVcC84RW7S1Yi8qTnsVr3mZEbAYuLdJVJOcGsHWrHyge58UgReyVx/vhxjIA3sM
	Iv4ASWpgvyKOy9pvCugZyK1ortxyAQqN6p/KPnvqSiJvN4pREwSWfcrPkF3eC/hxUdpXT6W7i/2oG
	SKN2H02w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFCDT-006RO7-8T; Tue, 10 Jan 2023 10:50:51 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFCDC-006RGn-Ry
	for linux-mediatek@lists.infradead.org; Tue, 10 Jan 2023 10:50:36 +0000
Received: by mail-wr1-x429.google.com with SMTP id d17so11280224wrs.2
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Jan 2023 02:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wDhRoFdk/wz4YhwEvYGPmWAa3bEESv7lEX1Sf3y+vY8=;
        b=kpYMzbwl2nK/SPNdPdAb1kZsm+a7mjYsJ1MZpv6SWly5g8fmzZYjcdcWLvigOPfmQu
         3Zb4Op3qMqqukyIzZ+6vLG122XnmeNv4XvO/uLCyR+cKqmQR///bjqOpKmxCiUznEbNU
         yEmdgRYtC7FArbUBoTSCo8LfIp9NvOZ+nvlkJE31ZT2Ca3ImGeqsgIOcjl8y8HqL74/Y
         vv/Psp3u6lLBjghTsu4Y3X0jRzNjyzH1VFKQRpyLoKgzm2mWE4HsaYTuMqoONsEEov6t
         RzsweWVzdZ89nJZfTkaPBt1yz77XMAhIUdDTYsWebrZbvCS2KfBVdcUCUPVDMGEE0wfg
         1HZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wDhRoFdk/wz4YhwEvYGPmWAa3bEESv7lEX1Sf3y+vY8=;
        b=o2GklXKEElcfgrcrHNAzUM1i6HjeA09hJDSbCKBkJbQP7XbwAG6n6mu1D5NE8zTEbr
         lBPPd3mNUZt7+z8IvuMt1DQ6xrJpWY5kPmq5yZz3IbHuusVuD1f1SK9n6B7IKruot6vg
         yi88XKnSioKkDnHEdwPUN1Btuh/cC3v8mLjQI1Rz5/sjqBOE7aLEdpTfFqB1onFhojin
         Mub9MJKd3WM0kydTtOgKKFgQBJy6QMx8WZzQKi6CHYA0CFk5aLTez4KmIEOj1pSiwbxQ
         iRL/g+jfsBzHX+sIaD6wmetK71i2wBf5WQSsjNoFOG9pCt2qafRpW9BeZJzyXlmNx/hA
         txFg==
X-Gm-Message-State: AFqh2kpKeFjLhUhbd9WJ1Xt+UqQyvcBErNvcfvv/xGinCk10t0UUPzhI
	0c9tUbWNcQtfVKDPjg8I/zJuzQ==
X-Google-Smtp-Source: AMrXdXvHkDs0uBSrWlkrTbnY061a7BH/0P0k+wTuGOhU7UgZir+7gDxhqgcb9+QKEahb+t3EUaVHnA==
X-Received: by 2002:a5d:4f05:0:b0:28c:6430:c1bc with SMTP id c5-20020a5d4f05000000b0028c6430c1bcmr25775139wru.3.1673347832948;
        Tue, 10 Jan 2023 02:50:32 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id v12-20020a5d6b0c000000b002366553eca7sm10853383wrw.83.2023.01.10.02.50.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 02:50:32 -0800 (PST)
Message-ID: <cbd6ff49-a31b-00ad-c5bb-9a185391132d@linaro.org>
Date: Tue, 10 Jan 2023 11:50:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v29 01/11] dt-bindings: arm: mediatek: mmsys: add vdosys1
 compatible for MT8195
Content-Language: en-US
To: "Nancy.Lin" <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>,
 wim@linux-watchdog.org, krzysztof.kozlowski+dt@linaro.org
Cc: Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Jason-JH Lin <jason-jh.lin@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, clang-built-linux@googlegroups.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com, singo.chang@mediatek.com
References: <20221227080443.6273-1-nancy.lin@mediatek.com>
 <20221227080443.6273-2-nancy.lin@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221227080443.6273-2-nancy.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_025034_938196_58E81266 
X-CRM114-Status: GOOD (  13.63  )
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

On 27/12/2022 09:04, Nancy.Lin wrote:
> Add vdosys1 mmsys compatible for MT8195 platform.
> 
> For MT8195, VDOSYS0 and VDOSYS1 are 2 display HW pipelines binding to
> 2 different power domains, different clock drivers and different
> mediatek-drm drivers.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>  .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml      | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> index 0711f1834fbd..242ce5a69432 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> @@ -52,6 +52,10 @@ properties:
>            - const: mediatek,mt8195-mmsys
>            - const: syscon
>  
> +      - items:
> +          - const: mediatek,mt8195-vdosys1

This should be part of first enum. Don't create redundant entries.

Best regards,
Krzysztof


