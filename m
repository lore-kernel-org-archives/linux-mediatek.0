Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5216DC77B75
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 May 2023 12:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9rulx3XpcK9ZcqvOFoebZzjIkj2vjyGTAItP7Et3Jpo=; b=riRy2I74Tav2kIjOUb26EJfNkn
	mPmGZnqqY4yrGILejiA5PF6/1+40xNAHRNzUdMBAng6yvH0a9NGWbFokId9useNJZhUNbptWFhV3z
	zrD1X5/3cGbD3itaFx5kG+RsUP5RijzZEfJHAqvoSK+9yA/1rvHEJUrC4xw3r2SnzHTZ/WVQmPpfP
	YCxdrMkMPeKCclUIVm2iQ225uKCGLCKmvq7deNUbzZ37/vLbjaxbZPVZgpkp/VqwEueGMZjia1OY7
	bAP1Ba4rmpIXcuVFnGhDp/iayO5SOfa/eNAuMaEV1ZRwIV1ULR4CNu593CywknFhj+jecfJaJ1fQX
	TLeCInlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puubY-00At1u-0U;
	Fri, 05 May 2023 12:32:08 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puubW-00At1S-0a
	for linux-mediatek@lists.infradead.org;
	Fri, 05 May 2023 12:32:07 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-50b37f3e664so2961336a12.1
        for <linux-mediatek@lists.infradead.org>; Fri, 05 May 2023 05:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683289924; x=1685881924;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9rulx3XpcK9ZcqvOFoebZzjIkj2vjyGTAItP7Et3Jpo=;
        b=f9/YRf0G4/yHQA9ZrPCOWjJqvRiajxaWoiwNciSx6p83h9gDVJZmc0Mg9paKCxoEat
         2GBzkeC62lEeOcBlDfYIlVdZp03mH5G/V/VOBO06tc7tYJRiD+lpVPZ743PcMmfnwe7L
         l8T9JB0O98fG0DIAvChWSRky5kU1FRWfVGHADRltw9EXCx3aKMAEB+a72uOIzgwHBpED
         uynhb9/EUUIo7Hamw33RUz3ewDkYzE2ViGkIaNAt44ab10ZwzlH/1zY4LTrDfFYw9w97
         FIYsgQyTVl+R4eryXvPsJi/iHOTZQyQ3euLmOAUsJ6G3Jilk6kz4sL+kR8AY5JLURmh5
         uhiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683289924; x=1685881924;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9rulx3XpcK9ZcqvOFoebZzjIkj2vjyGTAItP7Et3Jpo=;
        b=kWG17KhKP9846VuLaePZJZd1toStS+7ztpE+91fQLraq7a78n35AAWuSmEbvDrxdf/
         H80BYaZFjK92bRBYjMR7kdTYooqV0Gr5tiuBeblSjl+STmhw1Xa7pNtRXVRPxN2DRpgB
         ZGVy64T2x4V705LZfK5tNmkmxyl7IQUjwX8PbueMi7m3LMV/ijg3Ze54tqj0Tmpan++u
         jqnq+y7pGF9cfiQlLyDqBG2TKLVaCAEzU9JxZaAoBCv0e1N8eIKaJSQaBXjr8Z/TtpEi
         bZ+bH44mmkwu8QXNuK47QND6e2b58nALVjdjPCA2gzUvnLGTKUrtWoYK547IXAnIFar1
         rU1A==
X-Gm-Message-State: AC+VfDxdSlRvoRY0wIlEAjFjRxScvfUPogX5fkdY6dhsgxom1xxdri3H
	krvww3U1k48O9SHmYSh8IzvYVg==
X-Google-Smtp-Source: ACHHUZ6+yw8cSVm0sZNFJUhlsJz5DdajKxKExEbzpGhkKfl9sghrff69dynFdSFmqx6pBWAoOyA7WQ==
X-Received: by 2002:a05:6402:1255:b0:50c:646:cafd with SMTP id l21-20020a056402125500b0050c0646cafdmr1206373edw.7.1683289924710;
        Fri, 05 May 2023 05:32:04 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:52e:24ce:bbc1:127d? ([2a02:810d:15c0:828:52e:24ce:bbc1:127d])
        by smtp.gmail.com with ESMTPSA id w6-20020aa7d286000000b0050be0b14672sm2898604edq.3.2023.05.05.05.32.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 May 2023 05:32:04 -0700 (PDT)
Message-ID: <b8a0a43f-a118-b3ac-01e9-703162e617f1@linaro.org>
Date: Fri, 5 May 2023 14:32:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 1/2] dt-bindings: reset: mt8188: add thermal reset control
 bit
Content-Language: en-US
To: Runyang Chen <runyang.chen@mediatek.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org,
 Runyang Chen <runyang.chen@mediatek.corp-partner.google.com>
References: <20230505120108.26603-1-runyang.chen@mediatek.com>
 <20230505120108.26603-2-runyang.chen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230505120108.26603-2-runyang.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230505_053206_216678_0DC4F2BD 
X-CRM114-Status: UNSURE (   7.40  )
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

On 05/05/2023 14:01, Runyang Chen wrote:
> To support reset of infra_ao, add the index of infra_ao reset of thermal
> for MT8188.
> 
> Signed-off-by: Runyang Chen <runyang.chen@mediatek.corp-partner.google.com>

Your SoB does not march author.


Best regards,
Krzysztof


