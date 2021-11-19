Return-Path: <SRS0=YoiY=QG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39948C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Nov 2021 17:19:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07E9C61A62
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Nov 2021 17:19:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 07E9C61A62
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tF22PSZZkbsIcXsW5B4HWSUIZPP6lN491yqlxB6EmLE=; b=wrqChONjQCHbTu2prxsx8GV5a1
	kmAJkpybRuR3BPm2/5WBN8O6MvunMGLMLMGp7BalR1Z/Ni3y/UrEvVR9drx/Q1I0CLXKdH0UT+8Kj
	lu3kwou++rx28e+cjyvhqb8XDEwpBODpuX0rPfAwwOREmI12gvnEqGuxqu4tHVEOTWXAYGUeFnTDn
	RuXmG+fzVNpLxsCX7xgBPqQv2JEQwYxP72UfwxwXCkD1ROtdB4EXNeFVZUpn8I9M8R/VMr4kUn0I4
	TP8/CIBo8hndUavifo31TGqW9C34Jfl7q3zI5BQWrcNicATWXnbXbUEenTJ09NvtLz6LShberPgCc
	LkoF4Tpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mo7Xj-00BBkG-Sq; Fri, 19 Nov 2021 17:19:19 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mo7XS-00BBbw-Vb
 for linux-mediatek@lists.infradead.org; Fri, 19 Nov 2021 17:19:04 +0000
Received: by mail-wr1-x42c.google.com with SMTP id u18so19343746wrg.5
 for <linux-mediatek@lists.infradead.org>; Fri, 19 Nov 2021 09:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HpL2qzn8s1pMxSKPVy6BFQOEtm3mwh6KOgnbIGnoQRw=;
 b=BS2Q7zU4V9BqYkMwfKbF71WrJNfRD8dSX+M2CI/qIDQLw0WG6qygNhan4A78uDhxKb
 O9rs1MSC5I5ObTyZP8bg5NCKRxLkqUrP9S2Lvq+X6Tigs57Jp/bpqxyKBc+TGO6+YvYa
 6OwtGO3N8Z7btb7qzw7Adufr88pK+TgR4+xHzhMTkQ6Q+1uVQFDUTftWDUGV14SUi4nN
 dPiHqYk/qU4PFnBgHs6LV80OsEq41pzqAqtX1jq2IYksvNZaGpSHKMrzsIZwuORx9pV3
 WXe3Crem2qEoj3au8XRFyi29FKBmruaAHbPuFhUiFM60PW+0xVXmAzoi4x4vzEbzw+h2
 G1WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HpL2qzn8s1pMxSKPVy6BFQOEtm3mwh6KOgnbIGnoQRw=;
 b=Y1UtpLd6WMSmEbtfwO42r3vL3vxfcLNjsBzVR+UtyIx9iG4O3fhz+aGMDHr1v+nQQ3
 IZKd1Xp8r4Mts1wABym8c7E2/Ej1CChenGMTFt4fhU5hxnr/W2IaiVJblA6eYeDvM5QH
 ggeQLkqBoiVlLPrRYh+a6s4qNZDJ9OnLlwgyi4XWYTIDpR8rMajl2aNQE6hH/hvdv2k3
 CnpbHfaKwHSfxOVxrRI+I+KsCugNJi18EauL4nPFGkvhJSeJnOkYvIybpGr/QvBiloiA
 eqRy0CYEKuX2Wv1a6+mVFMMSFX5yStc7u66lXnZU76WV5A7uVk4nsVUiwLOvp0nnq2+N
 RLYg==
X-Gm-Message-State: AOAM530CJFdiaH9JHguDo6TO1nnUgZi9ABz+OdYXeq9fUJ8aljZld37+
 Y3cF1qx1xYH6ZcWmZnm4/jUBJg==
X-Google-Smtp-Source: ABdhPJy2URfxT8KlUV/UQ4ChP+6mnancHBoU5VMuPGKRmQUQKwehJR4L0S9VQPWrBN+3Ks+JmJMObA==
X-Received: by 2002:adf:b34f:: with SMTP id k15mr9377107wrd.125.1637342341594; 
 Fri, 19 Nov 2021 09:19:01 -0800 (PST)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id n1sm332340wmq.6.2021.11.19.09.19.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Nov 2021 09:19:01 -0800 (PST)
Subject: Re: [PATCH 2/6] dt-bindings: nvmem: mediatek: add support for mt8195
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 Eddie Hung <eddie.hung@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Yz Wu <yz.wu@mediatek.com>
References: <20211107075646.4366-1-chunfeng.yun@mediatek.com>
 <20211107075646.4366-2-chunfeng.yun@mediatek.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <6aacd28e-346a-68e6-7a76-d7337e0480a2@linaro.org>
Date: Fri, 19 Nov 2021 17:18:59 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211107075646.4366-2-chunfeng.yun@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_091903_089441_49B244B1 
X-CRM114-Status: GOOD (  15.22  )
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
> Add compatible for mt8195
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Applied thanks,

--srini

> ---
>   Documentation/devicetree/bindings/nvmem/mtk-efuse.txt | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt b/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
> index ec70c5b7a340..39d529599444 100644
> --- a/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
> +++ b/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
> @@ -8,6 +8,7 @@ Required properties:
>   	      "mediatek,mt7623-efuse", "mediatek,efuse": for MT7623
>   	      "mediatek,mt8173-efuse" or "mediatek,efuse": for MT8173
>   	      "mediatek,mt8192-efuse", "mediatek,efuse": for MT8192
> +	      "mediatek,mt8195-efuse", "mediatek,efuse": for MT8195
>   	      "mediatek,mt8516-efuse", "mediatek,efuse": for MT8516
>   - reg: Should contain registers location and length
>   - bits: contain the bits range by offset and size
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
