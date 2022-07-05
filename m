Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C97E6C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jul 2022 09:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GzW+31XOr7tekRHyeYaRdcSCFDvKv8RZIUXRCCGfGc0=; b=KTKjs68s0CD4n2Jj6lEHSEDu2X
	vzsrPlkzE2CQ6wUcGUtXN3tf9OrEp5mzgBC5+US75JNcauHq5MAdNR78NK4GaEUxdjZG8NiV4dmLZ
	derYTMo8lFrHZDQ2VrVHBqG6pLQk9M3OeXE24GFIC6UAVzG5uRFtEbc019SwL/DjCz5FjTwpaOi5G
	kZCHWDzM5YNVtk9l8b9ufs2pkRMlOJStg4xVS3mVxe0BwNb+WGz902U53pT3BumwkxK85Y9GWfql7
	wg2aYtqO7PiTQiHHR+upaciv+51ZJmGY+A8k332A3pO0rRkpSmKQfHbazGp9LuEXfhAFJZVMgjMA8
	Es4Lrv7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8f3N-00Gous-Jn; Tue, 05 Jul 2022 09:41:09 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8eyk-00Gm9z-Uo
	for linux-mediatek@lists.infradead.org; Tue, 05 Jul 2022 09:36:24 +0000
Received: by mail-wr1-x436.google.com with SMTP id bk26so1609821wrb.11
        for <linux-mediatek@lists.infradead.org>; Tue, 05 Jul 2022 02:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=GzW+31XOr7tekRHyeYaRdcSCFDvKv8RZIUXRCCGfGc0=;
        b=bfcw4OPtvHHa3yk5hbz1LpQBs64ebuLyPzEwfAOFAZZDY5peorEtlbRotarhEnev35
         fo5Zjjs4OB62zinngJHT6Af8xQWwXB14lEMUv9z5LyzIDNWQjf65nQUTSOjeMtRCfNf3
         oBb8wF+MIChD25EaXnDHkUCyk5KmpVuRxyUM6SE6JF2zdCufoeoTSVb9SCeNDlctU39j
         ZWijWzuxsX5esuxJUMpDbu5jlV9d8zFL3iG/9vz/XXobZILDMhd/hwW5R5Cp4xOfHnaD
         vf3qzHZpQAVMsR2CuTZmUsNf1HHDAl9v1VSx12y0qTpfFYS6SRENQd2ciW5hhZRfZ0Mb
         b9qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=GzW+31XOr7tekRHyeYaRdcSCFDvKv8RZIUXRCCGfGc0=;
        b=fedzB4u5FhocguNpxrggzaW3uI+7++4KKA1NrZCuy/IQQn/y44vXmhqnHUAuYTlWx5
         Rnybmq2kYUHjT413tlXkKWuOqNV/DXwls9wdcuOZrZEg3LVpcZlRRHJvbWyvqHMka+tG
         j4I8pyCUHntKYGkpf/M1iaQllGNcJuvQb/bUge7RabdM4Xvd0K6cv46sqQEB25UcDi0x
         45AOiaoI/VOnDsNtTAUMJye6zY6gGU+Bl8wMVUaMAzEIxwSRAXM+w+FlVN7Kis7iQtLY
         u3PWCEM32Tkxlli//thLRZLAFc8D0EELoYkSHSr6TlIXLklcloeDiRPz9trMDn95mAyX
         Y3kg==
X-Gm-Message-State: AJIora/zQgZAGqVGSkaQqhUuyvl5DhdOHIghoAdi9LgD/s/3XXHH9FQM
	HI9dtkY6+9Bl+cWI/P7jp+kPLQ==
X-Google-Smtp-Source: AGRyM1t82j3S0MTOueXuQgkLVCCapClPqBbI2A1LlAX9vcXNB0vdAWm6Uxt2ethDn5Mt7eNT4D3zrw==
X-Received: by 2002:adf:dfc7:0:b0:21d:6be0:f7e9 with SMTP id q7-20020adfdfc7000000b0021d6be0f7e9mr8829244wrn.359.1657013780717;
        Tue, 05 Jul 2022 02:36:20 -0700 (PDT)
Received: from [192.168.86.238] (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.googlemail.com with ESMTPSA id q7-20020a05600000c700b0021d76985929sm516412wrx.80.2022.07.05.02.36.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jul 2022 02:36:20 -0700 (PDT)
Message-ID: <108746cd-8186-6f9b-ab56-a45b153def1c@linaro.org>
Date: Tue, 5 Jul 2022 10:36:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] dt-bindings: nvmem: mediatek: efuse: add support for
 mt8186
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Lala Lin <lala.lin@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>
References: <20220701103428.22099-1-allen-kh.cheng@mediatek.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220701103428.22099-1-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_023623_016435_2FBF5CBC 
X-CRM114-Status: GOOD (  12.56  )
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



On 01/07/2022 11:34, Allen-KH Cheng wrote:
> Add compatible for mt8186 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---

Applied thanks,

--srini
>   Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> index 7c7233e29ecf..b5a1109f2ee1 100644
> --- a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> @@ -29,6 +29,7 @@ properties:
>                 - mediatek,mt7623-efuse
>                 - mediatek,mt8173-efuse
>                 - mediatek,mt8183-efuse
> +              - mediatek,mt8186-efuse
>                 - mediatek,mt8192-efuse
>                 - mediatek,mt8195-efuse
>                 - mediatek,mt8516-efuse

