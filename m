Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 824C1C001DC
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 06:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bgwkT6/ww+wGY+KnhW+AnmHhERDPUw3m+qyEsiw+eiM=; b=ZkZCPudV+uoC72/UCsz8sHQHHn
	Ra9xw9D1b0VRjBk5aqksmtNoXfBGAufFDQ5LoGQdVvmVbI2tiolM2aCy3h6JB45b/KM0R2DPpmo1A
	cYWbfwoTd7BV7MPXZtL8AlnyhYaytwLMXNYCiaLwIqhl1MKLIT5+gO4xUzjUQyat2Azr0jqoeucRM
	3pg6T8RZYgOdhku73Mi0/1jf9j8Qt+9pL2eNVjf9SMB3yREU5nTgym5soXt+HE0jE3B3zg2MKQmzF
	WoMCpqzJ9+MrVUzYaoVYqDT1JL9Q9jhRO8pT0T86u0P7PCRpEzvbsiZpjX3XRoCFx8QxlC7TLFcr9
	Aa/wFwMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0Nu-005ZiB-0W;
	Wed, 19 Jul 2023 06:10:02 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0Nt-005ZhA-0X
	for linux-mediatek@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:10:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=bgwkT6/ww+wGY+KnhW+AnmHhERDPUw3m+qyEsiw+eiM=; b=IS+rjdt6M4qEbDj8GMqNTYN/lw
	P20DAERfH9p/xrT23+JqO6aMwQoGIcQwboBxF+g0u40B6v6eF+5uqZnlzN8Fb47wP8NlvWfXk+mw1
	gq2P9BYrD3cQpLeVfDOitGKaSciEQBTsIsZw3XVALdCkrLmfJAnxaLJK4NNmTKhSVFswBRwDVeXRW
	ZpP2HRZGdXNY65U16iIND6RDEti+D0myuBb1vM9iuEHD+1x/xOCOaZIu3DDdYVsDCs9jgLH5OJNoA
	oLEKp+h7XJ9M8HUbEftFn65o1R93061k0pJZRWnE3HKk3CkiiSp3CPhtqPh2vfdB8jArCTdK7BKpI
	CNiVolgQ==;
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLjC7-00BTZg-1i
	for linux-mediatek@lists.infradead.org;
	Tue, 18 Jul 2023 11:48:45 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-52166c7f77cso6464461a12.2
        for <linux-mediatek@lists.infradead.org>; Tue, 18 Jul 2023 04:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689680828; x=1692272828;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bgwkT6/ww+wGY+KnhW+AnmHhERDPUw3m+qyEsiw+eiM=;
        b=gm8AZISMYgDWrcpqlNV7XSWGhwCuU99E8AmVjG8gJL/c/QLOS3v+Z5XgqrxYMkYtXK
         KGZbvTNg3o379y4SY8349W/RXwRdO3sn/NWR/YQ9cI0zp7cqmIxphvbzgCuhdDUm/BHT
         cBgWwKha6D48+pCsUHf+RD0fgUb4HKnCzU1KfZUcDKUX+kNmMtmrkGdT1WI23IFJSNeK
         CZxQV/fNNhBRWOyB6F6bQmAoNks8QJofiZiO3E9+npH5qsUk+w8QZkEQPNBVsgZYPMnJ
         J+CMYmTBgTzwhi717Zo7QClWWJ2u9dvXkfG7EgHWDHlWsFC7VpoFze65MZQ+I7TTuvGn
         KPRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689680828; x=1692272828;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bgwkT6/ww+wGY+KnhW+AnmHhERDPUw3m+qyEsiw+eiM=;
        b=b9B+nn+omrARO9OohGDzQ8qqclSC54N5ybTkgIKBiuHoY3dich1689SbjDGYUoo9De
         c8Wrb77oBR/uQ+tgQh1ZgJ5XkbAM2iLEMqI8O9C8JuJ0h9HEwC8pWaSIZxY1zJml7GPl
         nHMMIP+qsFXRGdBnHa3ldKCc1K31fwOVQ4c1+RFrr42Sh5hje3hhNPoQOywwHDUCL/Ob
         n6Ffa0LdV0AdgOpg1wubN0ZJCS+gn0GBidKVRp0jxzC4orIOp8CEfjn+Ff2o7n8npshm
         CZp6/iPk/nWeDtSfr8vQDceo8aj5xu2YMMnsDbrOWLl0Kjg+aYc9EmJwg7U51UL1pOlK
         CN6w==
X-Gm-Message-State: ABy/qLblwWZLqi2ZMHTwP+pQRcnPYsWtZ3od2zf/bKFpvjJ7avkfoiZ1
	rVibve6y9IrnIkEqMsOWhYPJlg==
X-Google-Smtp-Source: APBJJlFT/DybxzSCIUirucC7X3IgslcqDkoxyI/x5YpoNguRTUf6H2jOVZIRryHeAvuImMBdxHBMdg==
X-Received: by 2002:aa7:c643:0:b0:51e:3bb0:aa4e with SMTP id z3-20020aa7c643000000b0051e3bb0aa4emr2018660edr.15.1689680828445;
        Tue, 18 Jul 2023 04:47:08 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id l25-20020aa7d959000000b0051a4c1dc813sm1088621eds.82.2023.07.18.04.47.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jul 2023 04:47:08 -0700 (PDT)
Message-ID: <b3813aeb-8650-e406-eee6-05658ba568ff@linaro.org>
Date: Tue, 18 Jul 2023 13:47:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 3/3] arm64: dts: Add node for chip info driver
Content-Language: en-US
To: William-tw Lin <william-tw.lin@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Kevin Hilman <khilman@kernel.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20230718112143.14036-1-william-tw.lin@mediatek.com>
 <20230718112143.14036-4-william-tw.lin@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230718112143.14036-4-william-tw.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_124843_700552_227B0220 
X-CRM114-Status: GOOD (  15.58  )
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

On 18/07/2023 13:21, William-tw Lin wrote:
> Add dts node for socinfo retrieval. This includes the following projects:
> MT8173
> MT8183
> MT8186
> MT8192
> MT8195
> 
> Signed-off-by: William-tw Lin <william-tw.lin@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8173.dtsi | 15 +++++++++++++++
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 15 +++++++++++++++
>  arch/arm64/boot/dts/mediatek/mt8186.dtsi | 10 ++++++++++
>  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 14 ++++++++++++++
>  arch/arm64/boot/dts/mediatek/mt8195.dtsi |  9 +++++++++
>  5 files changed, 63 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> index c47d7d900f28..115f907751c1 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> @@ -590,11 +590,26 @@
>  			reg = <0 0x10206000 0 0x1000>;
>  			#address-cells = <1>;
>  			#size-cells = <1>;
> +
> +			socinfo_data1: socinfo-data1 {
> +				reg = <0x040 0x4>;
> +			};
> +
> +			socinfo_data2: socinfo-data2 {
> +				reg = <0x044 0x4>;
> +			};
> +
>  			thermal_calibration: calib@528 {
>  				reg = <0x528 0xc>;
>  			};
>  		};
>  
> +		mtk_socinfo: mtk-socinfo {

Why do you put non-MMIO nodes in MMIO bus?

It does not look like you tested the DTS against bindings. Please run
`make dtbs_check` (see
Documentation/devicetree/bindings/writing-schema.rst or
https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
for instructions).

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

Best regards,
Krzysztof


