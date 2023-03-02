Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DC88C6FA8E
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Mar 2023 11:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ubt9kS070SRzays7Lyyyhk92YHHgZCfGzQC7bvZRYWs=; b=CC1paZPrquh/eqPD6wBKGXdBeH
	v2xyV1CKv/PUe5/S2ExmJDCRHpGokW/j56NrsGrLl1NV7uFq5IzvzLW8ryZgPUlrvGsIzJjIpKKSG
	IiO3ttalKsrYYG4jJncd0OB5fUBm9/pI7+ptuY7CcxZy4pvvGd2OM8uh1EYrkDf0LEPpAw00bXjjE
	5Hs6ppIWDdRJzHxrmeuFJG2Oju1+WsRpkc8gA4/ofPgRZ6HeHpSiqnQ5Ug6jftcfT8HOBJO1hFq7j
	pCimeyq03OKE22ttyyK4q9NL3mK+rGUjAxqLwtXk5i6C3rVi9MZva5qvzKOwW8pMCAEuLf+bEG3wx
	TFoppjXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXh4x-001vXQ-46; Thu, 02 Mar 2023 11:26:31 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXh4u-001vWj-Lc; Thu, 02 Mar 2023 11:26:29 +0000
Received: by mail-wr1-x42d.google.com with SMTP id v16so13364212wrn.0;
        Thu, 02 Mar 2023 03:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677756387;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ubt9kS070SRzays7Lyyyhk92YHHgZCfGzQC7bvZRYWs=;
        b=M7HyxsaUb8pCJPb17juc/uvkXUftUuBGUQwLlDrMMbY26zD8crXuN3+8IkHbq+CzGT
         QpLTvaotYucqTLcapHtEbVpBhPaHFMDTfpQUCYcjKnj9XlJEfDih4bJh/UVm70yLio/Z
         Ew5m0KmWNymD7y3JCAeb+k1njUx8M3RskXi+w26ZfzPkQI3p999shSIXs+QBCa1OrINk
         py38sbXW5I8WB5SrTOHk1DJkTtdmIJFiZcZKiZ8KvjDLRiqBkMjcTH+4IYr+Me36k1D0
         ZIYNHH8s/2wVAKgBNsJ031M/0s4ZEMQncHnbWUWc713joUjQ89zW9ZcTYCrE5cLc/Gb7
         Kghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677756387;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ubt9kS070SRzays7Lyyyhk92YHHgZCfGzQC7bvZRYWs=;
        b=Ce9pgOrcxNPdP2bhboXYcYhwPPAeeeEDQazZCxSuZZfvzmyQ9EHeL2paw+5qAnK4gd
         W1KkgTFXtVtWWURoH4hCiiW5a2Tbije5mLAGbLw/3YKDV7FZi+7y7dBiCsVtVpiPiG2A
         irgXeNUV9y53kbwZcziuJfSJhiUItqsau8/irC+XGUQvtZfLxSl+zm1bwcLBFYh39zkE
         GwDD/y/vW0UaoO2KndUHZ+IuWeIFPIkgvHccnmMa17vqcPRqM/b78hznBmlsT3R19bVe
         I+4N3aL27LG/1y2b8bizNDviqJuJ2qdNUPFi7yLBX1+s/kxBFwDCFpiORn/rFOMoiIky
         34hQ==
X-Gm-Message-State: AO0yUKXgwmhDWNqqHwm2VWd9YBtJjTgn1l5HLCFvVzCiw4XyTHKkfRCH
	nnvsL0D9bMdgxB2HTP2bED8=
X-Google-Smtp-Source: AK7set98pNPLGEg7TnBb4ZHI/1aEVLqnr3HiKc4PTIVLKBrwMGrQRt4geF25PL/4FYK5yQ9Q03E3Hg==
X-Received: by 2002:adf:dd85:0:b0:2c5:5d21:7d4c with SMTP id x5-20020adfdd85000000b002c55d217d4cmr7184234wrl.43.1677756386980;
        Thu, 02 Mar 2023 03:26:26 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id g9-20020a056000118900b002c794495f6fsm14634729wrx.117.2023.03.02.03.26.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Mar 2023 03:26:26 -0800 (PST)
Message-ID: <1f65671b-7c68-b007-60c8-6c4841febce0@gmail.com>
Date: Thu, 2 Mar 2023 12:26:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v1 1/4] arm64: dts: mt8195: Update vdosys compatible
Content-Language: en-US
To: matthias.bgg@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
References: <20230209160357.19307-1-matthias.bgg@kernel.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230209160357.19307-1-matthias.bgg@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_032628_755745_AFC4031A 
X-CRM114-Status: GOOD (  15.92  )
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

Patch 1 and 2 applied.

Matthias

On 09/02/2023 17:03, matthias.bgg@kernel.org wrote:
> From: Matthias Brugger <matthias.bgg@gmail.com>
> 
> In an effort to fix the vdosys implementation, the compatible has
> changes. Fix the device tree to adhere the binding definition.
> 
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
> ---
> 
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index 00891bfa564e9..8f1264d5290bf 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -2369,7 +2369,7 @@ vencsys_core1: clock-controller@1b000000 {
>   		};
>   
>   		vdosys0: syscon@1c01a000 {
> -			compatible = "mediatek,mt8195-mmsys", "syscon";
> +			compatible = "mediatek,mt8195-vdosys0", "mediatek,mt8195-mmsys", "syscon";
>   			reg = <0 0x1c01a000 0 0x1000>;
>   			mboxes = <&gce0 0 CMDQ_THR_PRIO_4>;
>   			#clock-cells = <1>;
> @@ -2555,7 +2555,7 @@ larb1: larb@1c019000 {
>   		};
>   
>   		vdosys1: syscon@1c100000 {
> -			compatible = "mediatek,mt8195-mmsys", "syscon";
> +			compatible = "mediatek,mt8195-vdosys1", "syscon";
>   			reg = <0 0x1c100000 0 0x1000>;
>   			#clock-cells = <1>;
>   		};

