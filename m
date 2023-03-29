Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80421C6FD18
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 08:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kMWToYb9mpT2BK+2K13xPq825h2wTXZVEgaKIXev3s4=; b=c4SFoqUt8GK9J2GfcrScC0aqcP
	Csu6cMNeCusrSj4Nq6UA62p3axljQ7HPNejXmodTl/kpQ/YotmsgkPSWsPxIfT+1/tCPBhu7tNQYC
	PjHXDVv5cbwCMYp4BoNsnep94eRFCFNVAPdm9bgIXxxmIAJC0WDS3/zhxfqlzH1GAsZY1xociOn4y
	Yo+u/0vYSMfsPXdS+yaYDTAxC8wkKb+J9jzDdyJnZds2rFzQ7IrfoCnn9qzq+1QTeVXx7eIta28Pm
	P7qzgnJvIvwS81P0++cKvLcMR2274Jn4SwG5JEBnfonHzGGOm9tuDVmdZcnv3X39UqRzl1lLV4jsr
	DhD7xvgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phQjp-00H0Hl-1E;
	Wed, 29 Mar 2023 08:00:57 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phQjm-00H0Fu-0O
	for linux-mediatek@lists.infradead.org;
	Wed, 29 Mar 2023 08:00:55 +0000
Received: by mail-lf1-x12e.google.com with SMTP id x17so19048559lfu.5
        for <linux-mediatek@lists.infradead.org>; Wed, 29 Mar 2023 01:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680076851;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kMWToYb9mpT2BK+2K13xPq825h2wTXZVEgaKIXev3s4=;
        b=b+TwCJIqa4Xa8oPVIcWx6FoopjSHRvE+Rnm7o3tC8irloGkBoWTPq6zX1inTIe6U/A
         fv6A2octt0s0pp6ij0BPSFMpxm5iHnLl+RAjJgbu92leis5zMbI9Z3wwsEwndZY1pTWo
         NZtophUrQ8ygfjAsarapTpPQ2E54k/DiEYtiKUTVsu6nw+Y5rht8hPR95Ss1kbkrmxTu
         w5ahuhLFMjct+nO/M4XIxYQIqseRaEvVx+6UV2vyvAx1nqVY7RdEJ4y/uY6Cf2BQVFsU
         xvd3uMdUo8U57kFv0c7PlgDbukFtgdVDZY/LWaued40+t0AVpkxTZnWwlRz5YD1+y3ux
         UC2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680076851;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kMWToYb9mpT2BK+2K13xPq825h2wTXZVEgaKIXev3s4=;
        b=oZCzfw7k37KVqNV85fc2CmvnNUfkEwCwnu3w+oC7XRlDoK2VBmPs2g/lQ/lZ0rUp9q
         0tANxxtZuISxb7O9sdzDcNXf7FUPooFFPToE43HMpQHHqWOMMcDQmQ7dqKIdWIuDeoqw
         mLOEyZQ/yZfQHtlxAMpeTc1GPdD148+A9Lm7oonfLmgLWMB4g3vqmfRJbXCQ9TzKaAQv
         XXkxCZQ2lkcMEcXZRqtni2m1I8k6g822fO2XU8xSY5UpEQpvZyLcYH0fzD/aOabY7mEa
         Fmz0brnorZqcrfl0pddUZGXKKiA2MIh/vkTFDtJBBiVfCXSlwnSiiCb2vrRtVR+wNZLI
         G1Ow==
X-Gm-Message-State: AAQBX9cCfhvS6NlZwqZ0clckO9Dk5Qa0w/JyVG/GHR9Bw1eNtQn/jjI+
	HpWqLcvrRSB5vAVwcpPGrcuCqQ==
X-Google-Smtp-Source: AKy350b9qQ5TjN3cmmhhimJPkPykPhG4zgjwk0KeSuC0XWaC4P4xc1zgcP1c5+3K1DVqqWZ1vLvS3g==
X-Received: by 2002:ac2:5de3:0:b0:4b6:fddc:1fcd with SMTP id z3-20020ac25de3000000b004b6fddc1fcdmr455426lfq.23.1680076851549;
        Wed, 29 Mar 2023 01:00:51 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id h18-20020ac25972000000b004cc8207741fsm5398146lfp.93.2023.03.29.01.00.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Mar 2023 01:00:51 -0700 (PDT)
Message-ID: <6147a27e-2bb8-6072-fefc-f4c21f1802ad@linaro.org>
Date: Wed, 29 Mar 2023 10:00:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/2] dt-bindings: pinctrl: mediatek: deprecate custom bias
 pull properties for mt8365
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230327-cleanup-pinctrl-binding-v1-0-b695e32e4f2e@baylibre.com>
 <20230327-cleanup-pinctrl-binding-v1-2-b695e32e4f2e@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230327-cleanup-pinctrl-binding-v1-2-b695e32e4f2e@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_010054_157872_493689F4 
X-CRM114-Status: GOOD (  11.03  )
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

On 28/03/2023 15:06, Alexandre Mergnat wrote:
> In order to be more generic, "mediatek,pull-up-adv" and
> "mediatek,pull-down-adv" should be deprecated. Use "bias-pull-up" and
> "bias-pull-down" instead.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  .../bindings/pinctrl/mediatek,mt8365-pinctrl.yaml  | 32 +++++++++++++++++++---
>  1 file changed, 28 insertions(+), 4 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


