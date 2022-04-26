Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B036C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 07:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ua0NFovKJToCf4kHb2MF3RdUAAJAYVpupV2Xrvb+jxo=; b=VI6nDCM+quOkOs
	4FaGYfd+oVnuiAZgRQUYAWT2C/5UZN++4iFFixdbjT6OmgL/juel1MOpJ6aif35sqctO1aODXItW5
	qIdIjb3sBYV12HccYLsagmTB0bnUh1S+5EC3RZnE1JpoY33Yx2OgrinixuU+6pFwP9Ct5pfXA5Q2L
	dyj2ATlODGhioQA+oLpdNX/RqZpoomrpWKh70o0dB2p0jCFEW8eWKCQv6oOjDlXoDQIIf+Y35juOE
	YmAr8pSAk3wE5DaujQ+6aDJ8NL7ZAsnc2I2+Mu61uz+Ws+RhXbPSToFXeRALdx/Y8KfcG5Pm7T/KX
	7ZSFocMAf6DxnVDE2tcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njFuZ-00D4YS-2P; Tue, 26 Apr 2022 07:47:03 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njFuA-00D4Pf-5L
 for linux-mediatek@lists.infradead.org; Tue, 26 Apr 2022 07:46:39 +0000
Received: by mail-ej1-x62a.google.com with SMTP id r13so34324989ejd.5
 for <linux-mediatek@lists.infradead.org>; Tue, 26 Apr 2022 00:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=ezxJuL1TpZoaBmP6iCyLpD7vPvVZKAVuVG915ZT25Ws=;
 b=lS6TkHfh9FtrzI9J2kmQCv8AkGGhN56OT3UPhhiiIxqrD+5vKMTakURwAbi3fk9EbM
 H758YL8lFt/hHuXtJWMVGqy/D6haABwshBsTctrMBT9hHhueGyfv/tFiZ6SGhPNpSgPK
 IcUtunAtEwGrI1slOb18kSk1H0qmXqXOhd/ntrye7E21wJZkuJ75MrwupUpvNLuW5lsL
 fCkbdG5cjgcxdrSZBHDykpK5q5rXlPFeHUxbF/UXDwI1S3knJ0jbmipGs2TUJAGHgf/f
 y69IKsvRL55ka9NzsED9XneTV1rczSFpqVMT+ayH66veplxiClL9OsdXz6Opr+DJmQje
 9ecg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ezxJuL1TpZoaBmP6iCyLpD7vPvVZKAVuVG915ZT25Ws=;
 b=o7nNhZaPF8X4QEa5vkw1qiqv3fSHuj4a4h2svfnHpSPVyhIGTRlnKk318eLbUkTeR4
 wb9qZbegbGEygs2UfgrC9s46Aw0kCRyQELPyCLE13GFhMvK9ZcVTVg6tLXLYSi8b7nfh
 2i7RtRiCszCf7is/A0N2geD3N8oppFYFLwp7p0agpjdqTYpZ5h2egxg0uvBPJhxC+fcx
 j/ZNV2XL/uxbmLGm0O7uW9ynb4o1JTg6l/jn7ViQOOVgrnFsKiukeG5EpYdeJOGmHnjH
 9QiIaMoqvfgsc8BKHxjlXP9Ow88nF8l5w3MdEDsCnmNvtY2YAw10aa5MhStePUYv/191
 9E+w==
X-Gm-Message-State: AOAM532VC0L2pxV8kNSUFJCTVjAS2/qSkzWUD0zruvuLJwGnt/trFw1I
 3BRXDCY+zflj1fg9aQbIxzioKw==
X-Google-Smtp-Source: ABdhPJwyp+ZjbOklEGjVs751JofkT6sqkmEF/aEvP0lIBBfvcjqzl170va0NRjxD4Sf6JSmSEHbxrA==
X-Received: by 2002:a17:907:7ea4:b0:6f0:1205:fea9 with SMTP id
 qb36-20020a1709077ea400b006f01205fea9mr20196265ejc.534.1650959195200; 
 Tue, 26 Apr 2022 00:46:35 -0700 (PDT)
Received: from [192.168.0.244] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 z21-20020a170906435500b006e8669fae36sm4476781ejm.189.2022.04.26.00.46.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 00:46:34 -0700 (PDT)
Message-ID: <249f6136-6dd6-0c03-df86-7da02a1b17f0@linaro.org>
Date: Tue, 26 Apr 2022 09:46:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] MIPS: dts: align SPI NOR node name with dtschema
Content-Language: en-US
To: Florian Fainelli <f.fainelli@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?=
 <arinc.unal@arinc9.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220407143328.295762-1-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220407143328.295762-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_004638_259855_DDE169DD 
X-CRM114-Status: GOOD (  10.69  )
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

On 07/04/2022 16:33, Krzysztof Kozlowski wrote:
> The node names should be generic and SPI NOR dtschema expects "flash".
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/mips/boot/dts/brcm/bcm97358svmb.dts                   | 2 +-
>  arch/mips/boot/dts/brcm/bcm97360svmb.dts                   | 2 +-
>  arch/mips/boot/dts/brcm/bcm97425svmb.dts                   | 2 +-
>  arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts | 2 +-
>  arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc1.dts         | 2 +-
>  arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dts         | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)

Hi all,

Anyone from MIPS folks willing to take it? I got three acks, so maybe
that means I should handle it?


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
