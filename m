Return-Path: <SRS0=YoiY=QG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 189A1C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Nov 2021 17:19:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7CEC61A62
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Nov 2021 17:19:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D7CEC61A62
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tDXJ/2XIvky43JGXEJAfOr4330X+b/YxChsGgEkHSQw=; b=j8/Bwuo4h81vjcQ3KhOIEknHRF
	lA7WUAoIMJAytxgYbhlBBDTc3iOXNj2qG3RogVNfM6Nl/L4Sn4ew8qZAHgZ5bOjBJuRO1mm/J/VV2
	xv1YpO0XUWwmW9dDtlt1bVhzwgFz56983Jb0hdNX1No0khrfhmBkdE7EH7ZNqh8HmMn59xQ3TlCzw
	4TGB5luae7S9Qum/CCrYyQFjf1vczISSyCb6nD/yWhKsA+NsFMgOF9N0whrLfaUTxDAlfIs8RwY+x
	7+s9JzvX9VxlcYUW9Xu7lrzniFmicT4TzZxIUaCY9LzhnQlYceTuy79sID7q9TbOyDUqq3NpMPYXb
	JsqP4K8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mo7Xg-00BBiY-VG; Fri, 19 Nov 2021 17:19:16 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mo7X4-00BBSa-Nv
 for linux-mediatek@lists.infradead.org; Fri, 19 Nov 2021 17:18:41 +0000
Received: by mail-wr1-x431.google.com with SMTP id b12so19322825wrh.4
 for <linux-mediatek@lists.infradead.org>; Fri, 19 Nov 2021 09:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HMba7SAsUGH242uSK3/7WP5AS9Iw2TY41OiyipBfcUg=;
 b=rrZM4BffqfpVGWzJbsm3CnzC/M4DKrHytojXrXGboR2q1AMTdCzqbRpiaf2ey5xE41
 Km9W7Lkh48V7hAUhmpkdS1rD9wOFTSIPdTKzJwgb38RKSHBcqqqZlW3/82bGhz65gZ64
 xxdKmlLHoBUxKul8mSJ1vOkoDr0/oXMunSgKuJWuxvrwc7fpnsExrWc3gvb+2Lpv56kr
 bVw44NVK6JrFoZBOyq/Bv0fSBy1PnWsAnDKmFn7P8b4lwrxhXXHHv/aMzY+6Akh2hBka
 JaTXFPsYd4u7+8D+it/39z8VvQt/29oNb8oss9AQujqXUvEFaj/4kqD95Rv7nAD7hIjR
 vBeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HMba7SAsUGH242uSK3/7WP5AS9Iw2TY41OiyipBfcUg=;
 b=PCSfhYC+xy1iJtWo9ojlltx8MURdyxggZcqjo877hMWI/2HTgVzV46/6HmcylMSjTB
 cArz1I2PBdlDAJ9ZjqOiqo2SdZDXRvogUqk3D2toYuWeJlB1mxILs+xTAw3jEWvkehKZ
 +o1SH1Q8ESfZla+WtP3nktNG+90I29oLHl5TC+YDe/ZgOlWooaL/NQUZZ1tCZFuOs7G+
 rD+id03leJ15ZDaQtIO/etm3bWGZpoUXzoncU7/R2OZORFWwq/a5fZt2P/iPciCU6l/p
 tY5TR4PFybXxx8E2+spLdCi+yYfidWGVA/ph2s1EMkMYQPTd1aCjVtHs5dGi803K+J9T
 LjDQ==
X-Gm-Message-State: AOAM530FfKRpjVIM4nfZqxfVZjWC7D3a9geGfTacZVPfmzyylVzLRc2d
 VJXnEjB089Fh7LgS8S314NDmvJn8IlhwmQ==
X-Google-Smtp-Source: ABdhPJyqYg0ItuAFmaZy7wd0/6w1bO0CFWmFrGNkYO6UjS5N5ahOt4R4EqnmqUkG9sOYmRybrUjNyQ==
X-Received: by 2002:a05:6000:188c:: with SMTP id
 a12mr9445364wri.92.1637342316277; 
 Fri, 19 Nov 2021 09:18:36 -0800 (PST)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id g198sm258695wme.23.2021.11.19.09.18.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Nov 2021 09:18:35 -0800 (PST)
Subject: Re: [PATCH 4/6] dt-bindings: phy: mediatek: tphy: support software
 efuse load
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 Eddie Hung <eddie.hung@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Yz Wu <yz.wu@mediatek.com>
References: <20211107075646.4366-1-chunfeng.yun@mediatek.com>
 <20211107075646.4366-4-chunfeng.yun@mediatek.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <71f83770-b12f-2452-d24b-ae1be9b5b075@linaro.org>
Date: Fri, 19 Nov 2021 17:18:34 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211107075646.4366-4-chunfeng.yun@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_091838_843372_3DEE08A0 
X-CRM114-Status: GOOD (  18.84  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 07/11/2021 07:56, Chunfeng Yun wrote:
> Add optional property nvmem-cells and nvmem-cell-names to support
> software efuse load, this helps to fix the efuse bit shift issue
> on mt8195 etc.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Applied thanks,

--srini

> ---
>   .../devicetree/bindings/phy/mediatek,tphy.yaml | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
> index 9e6c0f43f1c6..05ee274b4b71 100644
> --- a/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
> +++ b/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
> @@ -160,6 +160,24 @@ patternProperties:
>                   - PHY_TYPE_PCIE
>                   - PHY_TYPE_SATA
>   
> +      nvmem-cells:
> +        items:
> +          - description: internal R efuse for U2 PHY or U3/PCIe PHY
> +          - description: rx_imp_sel efuse for U3/PCIe PHY
> +          - description: tx_imp_sel efuse for U3/PCIe PHY
> +        description: |
> +          Phandles to nvmem cell that contains the efuse data;
> +          Available only for U2 PHY or U3/PCIe PHY of version 2/3, these
> +          three items should be provided at the same time for U3/PCIe PHY,
> +          when use software to load efuse;
> +          If unspecified, will use hardware auto-load efuse.
> +
> +      nvmem-cell-names:
> +        items:
> +          - const: intr
> +          - const: rx_imp
> +          - const: tx_imp
> +
>         # The following optional vendor properties are only for debug or HQA test
>         mediatek,eye-src:
>           description:
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
