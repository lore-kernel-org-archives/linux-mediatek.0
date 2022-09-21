Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D8D1ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Sep 2022 09:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZDOlhHr3CpyZ2qYeSUIo/gRV2aRZgWeXlIQcoobfNQM=; b=ZidR4fyGeJno9wD0cJqolLJW68
	IaMZ9A6GP7mW7bKUeMSJTXJIb0Y5yD//V71JaKF5UPO+8mQCMNRoMPju6oUalzx/8VVrAGGzAogR6
	nrw08v8H5afmNmPFnHjHigzVjh0o1HOYeds1jpmw2xSwwSFbsGEdDy0hpwguZV+IXv9ER9sEVsUtv
	DPWac53vaNTDLxCO3bvpba3qgS8qFXJUcL4R1OPumyyiqNxElpmkmFb+9HnZ2YFVYfUXcfCc3xkrR
	3XPuk/A9aRtdSBJgL8AJ33CJieV2ALJUH3QtJLk1yci8JGlIjSWjsLdA5ao9n37nYw0qHmnq9cOMl
	P+lwmw8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oavqE-00AJF8-6R; Wed, 21 Sep 2022 09:16:26 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oavoz-00AIj2-Ro
	for linux-mediatek@lists.infradead.org; Wed, 21 Sep 2022 09:15:13 +0000
Received: by mail-lf1-x135.google.com with SMTP id i26so8091415lfp.11
        for <linux-mediatek@lists.infradead.org>; Wed, 21 Sep 2022 02:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=ZDOlhHr3CpyZ2qYeSUIo/gRV2aRZgWeXlIQcoobfNQM=;
        b=i0aItSSsVMnElEYzPKXQkQsl2Qr7naJv22ttYfKNsluMkCFQS9UEmT3ZMQJhZTwf02
         +iXgHvlhbgLIovhP3RKnfsiiNiLVRcYt03YKXEX2VYOIuOsLdP6TWBAhI5dBubRqIzwl
         qOHww4BmNWxvZxL8omojKu3HVEmhFG0WogK3rWygVZzgJGFbm8k2mkhX0R+iONGV94iP
         NtspqlxWdpBnXZwm4xuc93eWEtZFuTK1tzsnsELv+tFKN0qXFefn6gZwAJGksAsZ1QDU
         x2LrZcL/trV3MV6ytAATiDkEJhf/Dlwf3NQ3qJY7z4Tat7pBMpu11VIKlY8ZuPA0LhBE
         T2Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=ZDOlhHr3CpyZ2qYeSUIo/gRV2aRZgWeXlIQcoobfNQM=;
        b=oR3ufIYGzVIWqX0ZsXxoTSQPx1YXATbYSkyUDWiRRr2fcnLIUz29CblEVA4J8PLWW5
         qA0nJuxTE/j734cjSLu/Y6iOOz8M+4uLr4bWv2H2DQXb1NXsDpr2qilxCW7Ql6S8JZRK
         eTIV677N1ke5XUawquoXwjnXqdXccV+jQbmceXbRxKBJIMueYcaa4tJ8laZBtwDc+AgC
         trw80jURyGygzEQM97bABgSXUAAPFQJiVm+btOued9Ripw3fAkwFyWNfLYrlV79iGaqk
         KASl8mkWL4VHACZhkWslvHrUI/RrzlHP3Uh9y+j8MQCY86ZtGb7zilJvofEOU6Xjh3OA
         ZZng==
X-Gm-Message-State: ACrzQf3wgw3rfgvpP1VlLF05mrMfcNYDNnvIHcDOq/C6JXkYh8ajs0Tt
	D9bZrxbZd9i3Vea7UtwWHpFdJw==
X-Google-Smtp-Source: AMsMyM7vaVYVA7DykTmq9bMP55OIaRAgXmLS2YrX2IfoVP6I0GSSt+T+tZKjft49SwaeZGwMBetjng==
X-Received: by 2002:a05:6512:159e:b0:498:f1eb:f7a with SMTP id bp30-20020a056512159e00b00498f1eb0f7amr9203437lfb.425.1663751707178;
        Wed, 21 Sep 2022 02:15:07 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id 8-20020a2eb948000000b0026bf27c7056sm343705ljs.67.2022.09.21.02.15.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 02:15:06 -0700 (PDT)
Message-ID: <76814ecd-faac-0d5a-fe72-99d02a2e37f8@linaro.org>
Date: Wed, 21 Sep 2022 11:15:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v4] dt-bindings: mailbox: Convert mtk-gce to DT schema
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 robh+dt@kernel.org
Cc: jassisinghbrar@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, houlong.wei@mediatek.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220921090006.37642-1-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220921090006.37642-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_021509_941745_F55A9688 
X-CRM114-Status: UNSURE (   8.53  )
X-CRM114-Notice: Please train this message.
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

On 21/09/2022 11:00, AngeloGioacchino Del Regno wrote:
> Convert the mtk-gce mailbox binding to DT schema format.
> 
> During the conversion, the examples for client device/mutex nodes
> were removed, as these are found in their respective bindings:
> arm/mediatek/mediatek,mmsys.yaml for "mediatek,mt8173-mmsys"
> soc/mediatek/mediatek,mutex.yaml for "mediatek,mt8173-disp-mutex"

The change against conversion is making clock-names optional for some
variants.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof


