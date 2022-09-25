Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61863C54EE9
	for <linux-mediatek@archiver.kernel.org>; Sun, 25 Sep 2022 07:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nv/5RSkqJKkOQl85OwCTSN2eXEdey0R3YQsmEsMaY/o=; b=lSQJQLWhcNVVrRD3B3y0q20KlX
	X9zGUsGpvF+W2HK0gkrVrmIkDjkSb11cL+tDdcalJg8j7uRe7rG/U7+y9UJONpoQ6hmpbJ3BtHof0
	xm+rZ9YtFkG6GNSQnQ6kpPHxsw7sqlMRztsSSO3xk+fFtlBp56oR+dAZh4xFP7kMadZKdgKwNUaHA
	3JHDit9tAq17CvqB3ZKDAMGdAon9U0lO/wfsK7aqco3+0VWzqkd4P3YyFKp6PSAC2/NKPrlKvim5A
	at14I6ekC+rrhrRLL0JO8sTwJ1QsJqZ/JTqKNhZ1t6NG974RWrcEb3SjvXiFtTRvzohxtlnu/+73V
	TDEug8yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocMRf-00BxVr-Mb; Sun, 25 Sep 2022 07:52:59 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocMRa-00BxRT-Qo
	for linux-mediatek@lists.infradead.org; Sun, 25 Sep 2022 07:52:56 +0000
Received: by mail-lf1-x12a.google.com with SMTP id j16so6463351lfg.1
        for <linux-mediatek@lists.infradead.org>; Sun, 25 Sep 2022 00:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=Nv/5RSkqJKkOQl85OwCTSN2eXEdey0R3YQsmEsMaY/o=;
        b=hU2MCTfvOqVLs63hQU18x6s6H8CTXmttD5HjqiKRCmqMfvHHHmqZUxliZ8w2KMvlxW
         HY6ZbU32LdWScTNc9OXWD838+l++dGSb2Fd9ZzYTTaZVi7cBcbSyoTfMoiF7vr6gFiqP
         cGxfMD2f+QvL9CfHSeDVJRwLcgL+sN01C9jJeLvXRcoixlSc/FLPiJlRhz+gNGITIlcy
         h29T7GtPtgwgrGMn8PjOk9SctvjwVP/Io7FyM9W7m4EWImDl5eEDbdHjzGaYS1YgS8uu
         9Ft9k4LleycrQ6/vSdz5qoqOrRXAQJxpJ6ifWgJvGzjwNBzhKiJ3YZlvQpZMy7SvRX0/
         XnaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Nv/5RSkqJKkOQl85OwCTSN2eXEdey0R3YQsmEsMaY/o=;
        b=rg9cUUYePXP3VJei39OK7Yv484+mti+gxZzs6Q2toXmInlWb2tdGcUdbau5Io5Wzvr
         RyrCTsLPRbBH5vHh7D1oseOLKb7qVzdJnblMD8Kve/JXz5ysyco0KzVQ6ZV1DAZWlkpU
         9TgFjtVkJVc5/Rcz5dA3zIxoLXdaH+UIXGmSs/XbUkrIjbWcuamVYzT3SpzHRAXgtURh
         kL/+gaJjj7Y3v51hZi332DnhqcVxewtbQPlDoS1HROtYhYy4v8+i9woL4kpJxwvxQeQs
         HWPWCg7tfaB7v24EI/iTAbBDlm3A1sopInShxzXavuwGNeVTQHwXZxn+diZP/RUX2oPf
         8ZyQ==
X-Gm-Message-State: ACrzQf3Banfy2x1vYoMKEkNbD2u4xN0L/9TS1sVjrhLYXORwhbM0Difh
	1C8RdlAe22bZQmjc9sjXXo8Ijg==
X-Google-Smtp-Source: AMsMyM5KqwOtk9nprf+87CHVg/qjuDRlMePxSxZCLocwuB38qh1j0wmVsjSub+fYSEf33xrdHHVGjw==
X-Received: by 2002:a05:6512:78e:b0:49a:d9ae:3051 with SMTP id x14-20020a056512078e00b0049ad9ae3051mr6285650lfr.203.1664092368716;
        Sun, 25 Sep 2022 00:52:48 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id o9-20020a05651205c900b004979ec19387sm2128219lfo.305.2022.09.25.00.52.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Sep 2022 00:52:48 -0700 (PDT)
Message-ID: <6bbe9527-ae48-30e0-fb45-519223a744d7@linaro.org>
Date: Sun, 25 Sep 2022 09:52:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v4 1/6] dt-bindings: arm: mediatek: mmsys: change
 compatible for MT8195
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: CK Hu <ck.hu@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220924080058.20566-1-jason-jh.lin@mediatek.com>
 <20220924080058.20566-2-jason-jh.lin@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220924080058.20566-2-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220925_005254_905462_6090E4C5 
X-CRM114-Status: GOOD (  21.22  )
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

On 24/09/2022 10:00, Jason-JH.Lin wrote:
> For previous MediaTek SoCs, such as MT8173, there are 2 display HW
> pipelines binding to 1 mmsys with the same power domain, the same
> clock driver and the same mediatek-drm driver.
> 
> For MT8195, VDOSYS0 and VDOSYS1 are 2 display HW pipelines binding to
> 2 different power domains, different clock drivers and different
> mediatek-drm drivers.
> 
> Moreover, Hardware pipeline of VDOSYS0 has these components: COLOR,
> CCORR, AAL, GAMMA, DITHER. They are related to the PQ (Picture Quality)
> and they makes VDOSYS0 supports PQ function while they are not
> including in VDOSYS1.
> 
> Hardware pipeline of VDOSYS1 has the component ETHDR (HDR related
> component). It makes VDOSYS1 supports the HDR function while it's not
> including in VDOSYS0.
> 
> To summarize0:
> Only VDOSYS0 can support PQ adjustment.
> Only VDOSYS1 can support HDR adjustment.
> 
> Therefore, we need to separate these two different mmsys hardwares to
> 2 different compatibles for MT8195.
> 
> Fixes: 81c5a41d10b9 ("dt-bindings: arm: mediatek: mmsys: add mt8195 SoC binding")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>  .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml     | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> index 6ad023eec193..4f90ea03c596 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> @@ -31,13 +31,16 @@ properties:
>                - mediatek,mt8183-mmsys
>                - mediatek,mt8186-mmsys
>                - mediatek,mt8192-mmsys
> -              - mediatek,mt8195-mmsys

We keep making circles...

I asked "and why mediatek,mt8195-mmsys is kept as non-deprecated?"

and your response is to remove it... Eh, okay, that's fine but now your
change causes now warnings in existing DTS. Either you keep old entry as
deprecated (just git grep for deprecated, you will find examples how to
do it) or fix the DTS.

Best regards,
Krzysztof


