Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 536C6C636CC
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Feb 2023 11:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K/GymRTC8E30kXdASfjuHKtUeZnJnGl8Jnbq0ua5e4w=; b=Lx2+vB7WrFMX8uja5TFjBtfcUt
	xlzSdCcbSNaafL0VJrBR+a7oe+8zwi2u2mZHscbTsOeWsDKlTZwnQUk3ynCnCNp+sqdw+2bSO8nt/
	ydYJPqRhmqKAH9gmyV8ZTtU2iaPuEy9tjIWSG2Kck5kcVN2ak6eWV2Wdl6PixsyDdFRI4rbKDEPOh
	q6xbCaEBoKGpmsuIUwOz5NbqGxPFH2YQ4ctGaUrLPpYvp2LW20L+eLz7OSioG78urDLLaLOo8MQAJ
	qOSPEAVuSx8WeuTAATEKCdP9BxwY/1er3f8EhgDYIBkoLnUBdxfL/fyCb2drblFRJO3VHdgRsSBS7
	IZgO6hig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pScjb-00A0qo-T8; Thu, 16 Feb 2023 11:47:31 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pScjQ-00A0mx-2O; Thu, 16 Feb 2023 11:47:21 +0000
Received: by mail-wr1-x42c.google.com with SMTP id o15so1554437wrc.9;
        Thu, 16 Feb 2023 03:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K/GymRTC8E30kXdASfjuHKtUeZnJnGl8Jnbq0ua5e4w=;
        b=pElrnzmI7gL4teX90A06t9foesLfwzg2W3jO4Ac+TptnGnaYWUeJT7aqzUVL9elwlz
         TBY2fVERHnMX2SDLV9WYl/W8cYbIRVq/WQyeBEuU7tbOcS1ZeTPVa11r1CNi2U3d63ih
         gGILu/yvs9q0kMx9c52+ZMs8kOs3eXknbum5pMWhJKDKTwt65Dj9d6yoK/COuFgJ0b7K
         qVyUM2dcTBOUJNBsQOCALgYXd2BLkaK+vgyQMOcZnh9IHTsRBKOe5q0wGVcU2vFU7rOi
         TodwibpS3sLPqy1n/ARtQ8Dbmk9T2vDUWE6tIeIGEwPXrpNM1Ed/oD/gvMTwzus2cxEO
         Fh0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K/GymRTC8E30kXdASfjuHKtUeZnJnGl8Jnbq0ua5e4w=;
        b=qEt9QOOwX4JTQ4KxBKTERwGYSEJ6uhu6C0eoGeCxi40oCfpdMHqPq0AU+WF68P1Rug
         cin8jqFSEO6pj+xDvz4caUZMuzfj71ijGIV2C76ERzP9NX7xe5NxOdXc3BudBtpeoy9z
         pZJNwXBecuej5eXFqkyitt2mh4bpnhmAIhxV2cswKS1Iuo+GYkYIZTvalm+T7DR1O/6Q
         WXLoXHw8drNcvtLpYLVRpIP3jiYtV7CsMcCa/59OgMkqeXkVIxdSKmAyt4hv9t9TF3gL
         e8HxHh6SiP1iT956iIcbJoKqm2n+BG5yXuppITXmcISuhgveNTMtWZCA2AypDiaztzMg
         B1fA==
X-Gm-Message-State: AO0yUKVqXXN/J/xb8V3T+AOAkrBdSbHcuWETP0p6RopJUnM3bcQw84L/
	uOYXCNQnf3RflH4JgOU5ngc=
X-Google-Smtp-Source: AK7set+4r8zWos74GXrVBfODT1MIee24TRa67kh+h9GiMPo+o4DQjgxdbo2YrQ/bsYkfXlTIWQFLkw==
X-Received: by 2002:a5d:6882:0:b0:2c3:fb3e:ae85 with SMTP id h2-20020a5d6882000000b002c3fb3eae85mr5416717wru.44.1676548038630;
        Thu, 16 Feb 2023 03:47:18 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id o15-20020a5d62cf000000b002c406b357cfsm1320858wrv.86.2023.02.16.03.47.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 03:47:18 -0800 (PST)
Message-ID: <533e5cd4-713a-f683-1545-913b84d280c2@gmail.com>
Date: Thu, 16 Feb 2023 12:47:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v7 02/12] arm64: dts: mediatek: mt8183-kukui: Update the
 node name of SCP rpmsg subnode
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230215041257.14548-1-tinghan.shen@mediatek.com>
 <20230215041257.14548-3-tinghan.shen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230215041257.14548-3-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_034720_152020_9B63D11D 
X-CRM114-Status: GOOD (  14.61  )
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



On 15/02/2023 05:12, Tinghan Shen wrote:
> Align the node name with the definition in SCP bindings.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> index fbe14b13051a..a259eb043de5 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> @@ -810,7 +810,7 @@
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&scp_pins>;
>   
> -	cros_ec {
> +	cros-ec-rpmsg {
>   		compatible = "google,cros-ec-rpmsg";

There are more users of "google,cros-ec-rpmsg" which would nedd to be updated.

Regards,
Matthias

>   		mediatek,rpmsg-name = "cros-ec-rpmsg";
>   	};

