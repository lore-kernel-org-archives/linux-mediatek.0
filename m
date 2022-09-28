Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05B86C04A95
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Sep 2022 17:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=im9XgETRxegMUR78LTkoFFDmVSoYc1KHVKiHFv5Z2KY=; b=cmX8VqCO+a7QuC9+kEfFE2NGqH
	GIuKE5fQyYXtjPlubgg1BcG6o6M6dntBcJLuBiX1G1vV7ML+IVvkMkRIsB9uW4Msuj+NHmzSmtQ8C
	xhlMqrrOOW7MX4e5UNUbRsNw/UXPzfjDaH1heBpeufNt5lKtoRWaJ3ZsqnBqtKxw1ITi9Uo1RY6l+
	PnSYBXaPyFb3lWFwAyjGK+0l7eSRePl73LBzSZEkp54OAZeokkqdmioJDZ6wXv2FvHqJptiWR2ULb
	d3CteSrLNVnrDwNjf9DfoD1TL+kHkayneLXarlivZCvFnNDmf6Feh+1ixl44DFbHDTrEitXZq59PF
	DTwUgckg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odb9j-00HRJT-Tk; Wed, 28 Sep 2022 17:47:35 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odb9Y-00HRFy-Bl
	for linux-mediatek@lists.infradead.org; Wed, 28 Sep 2022 17:47:25 +0000
Received: by mail-lj1-x236.google.com with SMTP id b6so15138075ljr.10
        for <linux-mediatek@lists.infradead.org>; Wed, 28 Sep 2022 10:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=im9XgETRxegMUR78LTkoFFDmVSoYc1KHVKiHFv5Z2KY=;
        b=a0JNO+DzxwYmo8m4zvCjgit8yewjJ/rCYwUMgSkwxCPXyb8MliNAyp3skj1+3k01/F
         M56hDpGrQJCbaoHs9BdSfS6hcHio2xAckACPJRjtAQvTDIBD1DOrA7cC1mOzPy8GkefX
         N1RkhaulmRkZPF7HGBB9wpJ/o23HY9wDawXIo2WTG6B3iQIOSXt32J5K+b6mrynF7Hid
         BbFiBR0wFjTa3FLwSuODAYnbGWUv1u+FNJH3gLszI1MX7sVtsDf9zmu5i42QMCPbceEb
         oulGVSsqEBN73DUOcJ130okuum1nwAtStdUR8qXWWsCWTscNXqXo1dKqN/7+Poj0WZPO
         DfXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=im9XgETRxegMUR78LTkoFFDmVSoYc1KHVKiHFv5Z2KY=;
        b=h8dcClLn8Ue0J7ArIUA1U9KhW6qN0w8muZPVxbyI4miXIvJlagp0KcAbPBKgJXN6u2
         ArCK3zI6R+TPL8N1sF2e4kFsMtOEogydKp7+Ls9fG/21ytl79IwMocBn1+jRW/7tznAi
         kHd9lPJ8ZHKelEmIQW7Ig4M0BprTPCP/0rE9mgnNOT+24FA2PjrCG79rFY49lK9Sejel
         R7jkoMYJ9h2E+Vpcy+udBdyfRizq2TbyFjV0ohlfENxEJSPjK3faOSTHo28KzYxv+47n
         I8vam7J3R9e3RbylhZ0jLRYeQKjeYMpw4qAL/cLri/RxGDA6kPOjxqEvJ9c7ni5uH++K
         c5Dw==
X-Gm-Message-State: ACrzQf0Z0RAGXk1AND23+m8ml+TpWapeaijZ6jmVUWnLMKdBBx2Xn5kB
	B8Le7jXP/JfniKF8fJ5BGi0Gzg==
X-Google-Smtp-Source: AMsMyM5lItS8m+a3tjAri2PadLRMGws9Z/yEkLDSyn/WAlOVnniMT1nbYT5FjnGrixQi+wl7GkLLRw==
X-Received: by 2002:a2e:b016:0:b0:26b:f00b:a8cf with SMTP id y22-20020a2eb016000000b0026bf00ba8cfmr11755167ljk.24.1664387241691;
        Wed, 28 Sep 2022 10:47:21 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id i8-20020a056512006800b00494935ddb88sm531221lfo.240.2022.09.28.10.47.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 10:47:21 -0700 (PDT)
Message-ID: <b748aebe-09b5-d4b2-a6e4-0f13e440bc05@linaro.org>
Date: Wed, 28 Sep 2022 19:47:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v3 01/11] dt-bindings: remoteproc: mediatek: Give the
 subnode a persistent name
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20220927025606.26673-1-tinghan.shen@mediatek.com>
 <20220927025606.26673-2-tinghan.shen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220927025606.26673-2-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_104724_436131_54A0DAEF 
X-CRM114-Status: GOOD (  18.78  )
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

On 27/09/2022 04:55, Tinghan Shen wrote:
> The node name doesn't matter to add the subnode as a cros-ec rpmsg device.
> Give it a clear persistent node name to simplify scp yaml.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>  .../bindings/remoteproc/mtk,scp.yaml          | 35 ++++++++++---------
>  .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |  2 +-
>  2 files changed, 20 insertions(+), 17 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> index 7e091eaffc18..786bed897916 100644
> --- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> @@ -58,6 +58,23 @@ properties:
>    memory-region:
>      maxItems: 1
>  
> +  cros-ec-rpmsg:
> +    type: object

additionalProperties: false on this level

> +    description:
> +      This subnode represents the rpmsg device. The names of the devices

What are the devices? You wrote that it is one device, not devices.

> +      are not important. The properties of this node are defined by the
> +      individual bindings for the rpmsg devices.

??? No, you need to define the properties of the node, e.g. by a ref.

> +
> +    properties:
> +      mediatek,rpmsg-name:
> +        $ref: /schemas/types.yaml#/definitions/string-array
> +        description:
> +          Contains the name for the rpmsg device. Used to match
> +          the subnode to rpmsg device announced by SCP.

maxItems... but is it really a string-array?

> +
> +    required:
> +      - mediatek,rpmsg-name
> +
>  required:
>    - compatible
>    - reg
> @@ -89,21 +106,7 @@ allOf:
>          reg-names:
>            maxItems: 2
>  

Best regards,
Krzysztof


