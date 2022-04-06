Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A058C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Apr 2022 08:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JIjvOS6B+xObUQmrcSXkuxINjMhrxVGWg1zZVNgHFsU=; b=hn0j+H7Fn1KatC
	Wa9uZzYlfvEOervfcuP3srcyRE/h6yZVtCNopgUNKjoineSiZPFEEm4pb3nLHGejfBRdycsUeSj70
	qgFVGModIF0VLUSNhfwr6vXyKBdqnThk/8Vb15j06QPx2/e9qOGfx1H6OaQtrwsd/nMCN/v/HmltB
	6CaXWWoLjjqak2K4iCn/oG5MwwGbg0ToA8teHUSkdiBqHjGP/SZXNibRtrtrDmAZXJTuLlZDfDf9g
	ay31nkyMsD9JSgGyVn92wbApu6/ZULcujESObWi2dbTMLawhf9DauhDtH8so5x2YB6UU4yafmCoUh
	S8bhQ0kpHxcVy2uYeRxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc0uY-004f5x-4a; Wed, 06 Apr 2022 08:21:06 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc0uK-004eyI-IY
 for linux-mediatek@lists.infradead.org; Wed, 06 Apr 2022 08:20:53 +0000
Received: by mail-ej1-x630.google.com with SMTP id bh17so2627976ejb.8
 for <linux-mediatek@lists.infradead.org>; Wed, 06 Apr 2022 01:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=nwwNMDaP5Yh8K0WaZWOfIjXkdwXbq5VOVV+PO+4zCEI=;
 b=t7z1bs+kTqbj1INwRe1vMtQ6NKc9uAcZwKH60yfxmMmMEUv5b2KMB9WrLTjgP48JEr
 yJSUf9ilQz0NsSCbqfCtGk3S5Y6RMpHcFgypLxDLY4xXto8of3uXP8OhAa2JlUVZd+z+
 STDLjB7eUkYmPVJ/dKPcvWdoR2MzbknsovOOYDkfvdgAXybQnXF7QXhp3uK8KBx6bBwN
 yW0SOxMHKO46Pqx08IvSKm5rFKwocFHce2EocdmglFWZsyYKaiCGogjwQ7jlTLu39I0y
 0RSfqUSdfO6qX/snMr/HH0+KQ9C2V+oUnfDIFX94aNbg6t6wQ+loyiy7hOx/mqPT+n1d
 WwyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nwwNMDaP5Yh8K0WaZWOfIjXkdwXbq5VOVV+PO+4zCEI=;
 b=CXTFmYWnzVsQ3LsR/n4sTYhwtNmR8Wty/NZCR8C/thtx0qeHCCT3x7qrKYzOExNYkH
 IthbVfI1sAH3WvyAJYHlmwHzWql13mkKMD9fU1rpiRpOKSfpJFwlJ4M4u+9jCgmh94IO
 g1qNsj944uCl1CyDVUJ3l4s/a0HekuNS1Qw3DxLklyQnT754g3SOe5zVcfhKOgMSm2ZS
 50b3sotjeJFW7/BcBIvMYM2435DklllNkkrgDcIre9NT5s8fwG5Yav5d2IzwHh4NBlHm
 jq98jUUEzbe5ewx1dIhi+O/hfUFOVCtZXYOVnsgc+WEKGkkdhZ0Qcqsd+9q0wXI0xl+6
 TJ8w==
X-Gm-Message-State: AOAM5323Ln/IO+Yy6PBRs372tumedZ0sAHpqboL0dW7ETEpbWbYOGa3/
 +LFjVLL01/u0MfPOSgjhWHNz1Q==
X-Google-Smtp-Source: ABdhPJwXpHbNbl+9gjYwq/xSxgHmjmznGjTieI5zwK9DQvHmBWZLhxJmk6snQcc/KpO8olUy4KkMhg==
X-Received: by 2002:a17:906:7304:b0:6da:9243:865 with SMTP id
 di4-20020a170906730400b006da92430865mr7135579ejc.665.1649233248063; 
 Wed, 06 Apr 2022 01:20:48 -0700 (PDT)
Received: from [192.168.0.182] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 dm11-20020a170907948b00b006cf488e72e3sm6347202ejc.25.2022.04.06.01.20.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Apr 2022 01:20:47 -0700 (PDT)
Message-ID: <4bafe244-6a3d-d0ec-59d3-3f3f00e71caf@linaro.org>
Date: Wed, 6 Apr 2022 10:20:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 05/14] dt-bindings: arm: mediatek: document the pcie
 mirror node on MT7622
Content-Language: en-US
To: Felix Fietkau <nbd@nbd.name>, netdev@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220405195755.10817-1-nbd@nbd.name>
 <20220405195755.10817-6-nbd@nbd.name>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220405195755.10817-6-nbd@nbd.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_012052_640987_E886EF6A 
X-CRM114-Status: GOOD (  12.36  )
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

On 05/04/2022 21:57, Felix Fietkau wrote:
> From: Lorenzo Bianconi <lorenzo@kernel.org>
> 
> This patch adds the pcie mirror document bindings for MT7622 SoC.
> The feature is used for intercepting PCIe MMIO access for the WED core
> Add related info in mediatek-net bindings.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> Signed-off-by: Felix Fietkau <nbd@nbd.name>
> ---
>  .../mediatek/mediatek,mt7622-pcie-mirror.yaml | 42 +++++++++++++++++++

Eh, I wanted to ask to not put it inside arm/, but judging by your usage
- you did not create drivers for both of these (WED and PCIe mirror).

You only need them to expose address spaces via syscon.

This actually looks hacky. Either WED and PCIe mirror are part of
network driver, then add the address spaces via "reg". If they are not,
but instead they are separate blocks, why you don't have drivers for them?


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
