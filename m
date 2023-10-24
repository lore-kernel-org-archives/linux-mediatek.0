Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01358C25B6C
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Oct 2023 15:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CrLguzqmsBX1wh2886rw/oRPFldPzwSDNCeDBDlDpbk=; b=e3V/Wq2EJUQb6v
	sMs+7qJoMo5ij0BQp80b1BElgYtxft5FtCw1x94+rdK3y6DvLKDuqJsdcL115WArmwYhGF7UH5MiU
	7kB9PxHbu8GCSVnsAZmzNWMQGEZR2KnLirk/YzHlbHcpp/NiJqMQFD0a9sr9N7RmTKH+6woAeoD7Z
	AuYteTHBzzWTChXl71yNQvayNuTdxe6E+kYT295k41Zs7mQQRWhlQG9QTXYvdXhkAhDhb3LdVlryK
	VoAg2mf/Ki0SeBKlb2e7obGJnYMjsOMoH/d++f/y9hotAB0430a31TkZUHLcT1ixzl1KoIIGd//BF
	cozzFD7GECWu40tCl/Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvJF6-00AK3U-1F;
	Tue, 24 Oct 2023 15:22:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvJEW-00AJXS-1j
	for linux-mediatek@bombadil.infradead.org;
	Tue, 24 Oct 2023 15:22:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=CrLguzqmsBX1wh2886rw/oRPFldPzwSDNCeDBDlDpbk=; b=ZL7Wd0H+gDgrtBCdpNI20xUjiT
	HnQseI+3vifGIrBNnoOC7I9Isn3RENpUcUgVKD/L6i6J7JARYx4Hc3upHdigA/TUYZmEjXoEx30Sk
	8XPIzf7fppgfHCnTEsrU5nwfLqFk9hN2Y0Y8LN+R/YSVLYzEz7Ai8btZ5Yjql4UkB1LNWO7ZdkJm3
	RmErKXWlBgCEJG3bqfpbMWtulRvFGv7NFouWf6s5m0SZOI2ZgrLoJHZKyekPpehimvlmBxLuK0eug
	4SSJeaC0wIfhtr/knGbGlouAsRwK1FoykbOuFFO66fGtQEdWuILi8ECF4YwTkbjgSZcXBTc6rWB/m
	xc5Je69w==;
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvJEQ-00FbXM-2m
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Oct 2023 15:22:14 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-53e04b17132so7175558a12.0
        for <linux-mediatek@lists.infradead.org>; Tue, 24 Oct 2023 08:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698160924; x=1698765724; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CrLguzqmsBX1wh2886rw/oRPFldPzwSDNCeDBDlDpbk=;
        b=CLsiSYlzNyA9P6FqjFVWIO+UCEsySBsVfWqmvGdbmufAUUR5kB2H9r9s/xPp1yp4XT
         jA89YQOKFLQHeLa4mx1ZswypX3vOQRAMl3db8XPbuMRQ7yy/HOJsrA/7k6pTBNQBINs/
         iMM4CkQInkcWMasUP0PA53PYMlqKULOU9gFf9hEWa/uIkW2F1BIfhW7jSyCXAm/xaMsB
         WGxrPnr8QG2wZx+x5lXZlWs8Obm0xcHLRCG38RqfdyJMFbf02zuPN6eXC1JR/YJGUfub
         in395z12K+9Zo6omZX3qpKCD+i0XAAwsOeIox+znAbnosKemFpSbS6eDIBxsmlfwq3gK
         AJMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698160924; x=1698765724;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CrLguzqmsBX1wh2886rw/oRPFldPzwSDNCeDBDlDpbk=;
        b=rHA2dsJrZOg5SxOT8k59HyI1KdTkID35kbkVuidzGbX5FJoazbNKJDhgHPZdSNTS5R
         AkLYc2VQz1FKzz6cHNL47WmZzIPh1S0NtQF7adOD7rXpEXf4c6k1FLaH9eu150m0rPGU
         ck52dOCuy6QWGfRiiw8TeqUq9evQYlutcbQEAONdUthFzhcpa1+CTMgIy/57fr/Pu59Q
         wjylsiBbVtTOPtNVjSj7UnFME5hpqDhxP6GTevPryuzodMFI5naDamVJiHscqRpEy7hh
         bdwpnLBEtL0o9yHjAdGbxixswWgi4VPfwzXpMRluONR2L9U6xUbSrLD3K0XeSb6dWCPL
         BegQ==
X-Gm-Message-State: AOJu0YwBHPn8iiAlh2CofNKfFNA8xMcpXlmKoMogeHs2w2ctjlUEuohN
	fbki1J494t2dImbaD8BITl0WGQ==
X-Google-Smtp-Source: AGHT+IF+njeaPb0/PHYDKAchULPofnaS00XxZyQKvP8VftgcuCv2zu93TrgOHMJ5K3IjvdfOu4p3sA==
X-Received: by 2002:a17:907:72d0:b0:99d:e617:abeb with SMTP id du16-20020a17090772d000b0099de617abebmr9565488ejc.23.1698160923908;
        Tue, 24 Oct 2023 08:22:03 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id ze15-20020a170906ef8f00b009bf7a4d591bsm8335546ejb.45.2023.10.24.08.22.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Oct 2023 08:22:03 -0700 (PDT)
Message-ID: <97679363-2544-4d96-b382-e81917853ff5@linaro.org>
Date: Tue, 24 Oct 2023 17:22:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] arm64: dts: mt8183: Add jacuzzi makomo board
Content-Language: en-US
To: Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20231024000724.57714-1-hsinyi@chromium.org>
 <20231024000724.57714-5-hsinyi@chromium.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231024000724.57714-5-hsinyi@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_162211_148075_71E2877F 
X-CRM114-Status: UNSURE (   8.74  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>, =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Macpaul Lin <macpaul.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 24/10/2023 02:02, Hsin-Yi Wang wrote:
> makomo is also known as Lenovo 100e Chromebook 2nd Gen MTK 2.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  .../mt8183-kukui-jacuzzi-makomo-sku0.dts      | 25 +++++++++++++++++++
>  .../mt8183-kukui-jacuzzi-makomo-sku1.dts      | 25 +++++++++++++++++++
>  2 files changed, 50 insertions(+)


> +
> +&qca_wifi {
> +	qcom,ath10k-calibration-variant = "GO_FENNEL14";
> +};
> +
> +&mmc1_pins_uhs {
> +	pins_clk {

No underscores in node names.

Best regards,
Krzysztof


