Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D8CEB8FB7
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Sep 2023 12:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=65JkJjZQ3Sdd4Dn10RNUjdTHsNN1uCkPkOfypavHCHU=; b=w+WT3fK3z3/AnYLGnid+/9JgA8
	QochV8YEunLZRO46ryi2ol84Vys7fp8FNgcp3B5Dz2qc7v3jV/WPRKKmeR84hD0uDdEK+uvbJ00Yp
	QF+ilLOpOXTQUimrojdfYHwdbHgh4hOMAk5vkyMA4ixt5paAl6niT93DoGxpgVEbePQg2YFnfenH1
	D1qG3zen/Z+jzLgLQ8n7Btz0qUR/mCl72C+55NlE0GxJ44o3ellwOPLfkVYoeg1TX/ErnDylT+KHn
	dJf6ym8h4Q7xBgAPNUNOmjA4wr1X7/fNb4iWxeJPwK7Y2er9RSckpPJydQ9VOXP5BEk7WziG3UDNA
	rLgDbSSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdrJL-009B7A-03;
	Wed, 06 Sep 2023 12:07:07 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdrJI-009B4L-04
	for linux-mediatek@lists.infradead.org;
	Wed, 06 Sep 2023 12:07:05 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-52bcd4db4e6so5148879a12.0
        for <linux-mediatek@lists.infradead.org>; Wed, 06 Sep 2023 05:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694002022; x=1694606822; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=65JkJjZQ3Sdd4Dn10RNUjdTHsNN1uCkPkOfypavHCHU=;
        b=TUAtfBWZ0KLtEuzteSNojvgCTgUfxa8A1dooxWbYXVxRvxJ3YM5tWLklWnjLrjOOLM
         KC+zpmWaH4EcYmkH12gcfiPFLUajca64YVcS9gTOMqDouv2PW1gZJdqTyaYQjS16I1vO
         f5vXSzfwC9wC/IZh61JutpQkjPbcMAduBrlufz5/YCA0cxgDOCbjTP18m4LthW0sLY0z
         NUqVWsO7Q5y+yOQDA7ra+5HLcoQmSYEkAp/SffpchIU+zSZcXBAFdSCPEspyFwubUWKN
         p1dx/g5POie8DUbKRq388aa4j+HG9w/3UXvzZjTuHmOWL5B9DJ/gUW2CGFTAB2KXS8TN
         VTFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694002022; x=1694606822;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=65JkJjZQ3Sdd4Dn10RNUjdTHsNN1uCkPkOfypavHCHU=;
        b=Hj9HSH06RZoMvJZLl/GnLVozWz/skGVpehj8tdTaFM2KsadbFV4yf5wqUL313aTryp
         q2YtGDfbSfZlcy9h8nv5jrFk0rhdsr6BFJrvQpEfYl2wZRpZtvkORbkAQTsSf0Svd0yA
         7+CA4dTXcJWzbn02O/asT3jiV1GyaVm8v28aXOrWwod/BckMUd7jzBSgx+t/zBGhK7Ni
         GqHHteh2RqbUaK3qBI5/Qy5hhR9dBmOJ5M+P4OD5jsmGAFWx6tFwU6gNyO0VTAMwfW9q
         9mkupL/xDUEUcoFOKlGtpiK3HehKreLib1M18nO/IcU91f9mVALjBMx/+WYVYT2TUJbP
         PHtQ==
X-Gm-Message-State: AOJu0YwVrDazVWAjR6vLB220KpikdcrGr2KDxwxanqt7aFj0TOpeiKjR
	REMxLgkfoClMheYqVrk/5hcknQ==
X-Google-Smtp-Source: AGHT+IGLvupBZ/tpbcpKSSLSxJCZntEJMSaablzhtWID6vj7KwQwbmjvX2UcrZd8TV8R5r4LuBZbdw==
X-Received: by 2002:a05:6402:1348:b0:52a:3ee9:a786 with SMTP id y8-20020a056402134800b0052a3ee9a786mr1936699edw.26.1694002022328;
        Wed, 06 Sep 2023 05:07:02 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id f5-20020a50ee85000000b0052595b17fd4sm8249928edr.26.2023.09.06.05.07.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 05:07:01 -0700 (PDT)
Message-ID: <3b9ff6a3-02ed-f8b6-cfe4-e3e7c2147f46@linaro.org>
Date: Wed, 6 Sep 2023 14:07:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v3 1/2] dt-bindings: arm64: dts: mediatek: add mt8395-evk
 board
Content-Language: en-US
To: Macpaul Lin <macpaul.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>
References: <20230906114425.31187-1-macpaul.lin@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230906114425.31187-1-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_050704_066904_10CFABEB 
X-CRM114-Status: UNSURE (   9.84  )
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

On 06/09/2023 13:44, Macpaul Lin wrote:
> 1. Add compatible for MT8395.
> 2. Add bindings for the MediaTek mt8395-evk board, also known
> as the "Genio 1200-EVK".
> 
> The MT8195 and MT8395 belong to the same SoC family,
> with only minor differences in their physical characteristics.
> They utilize unique efuse values for differentiation.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


