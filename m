Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A739C761A6
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Mar 2023 17:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pLS5bdQOQb5HnWHfDHbDpW+ENKv/YseqZteHlVYBypQ=; b=jjkC54n0nuopYtMZccr1ypeXs/
	y1w8mXd/voy4OrkIBWMp9gNfXiUB5qeozdL2FuQ5g2Tbg8YsJsUS9TXoDlYAtfkzG7D/bOHeIdpAQ
	YQb7L2s1R9FH6nyVTMGvuVYGtvq2kt8Qa6EIAQ7DQCQXaEGOt7v5t+U7zZMc3sBRVtU8ritx0j8OJ
	sunc7Cfw0/vqf2i4WuUT4g82qQz8DY7/7ZsphLmZwU4YB88QTbLIbfSGkxhP/Gi5XzzpDVNMm37K7
	NovpKsR514zGWT+3QkujgrMafWRDciH2oCO3mfraHetQ5SjpUno5aGIkVuAbAOK6IT5CVZBuUXnsw
	MpAeH87A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phvx8-004c6x-0r;
	Thu, 30 Mar 2023 17:20:46 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phvx3-004c54-35;
	Thu, 30 Mar 2023 17:20:43 +0000
Received: by mail-wm1-x334.google.com with SMTP id m6-20020a05600c3b0600b003ee6e324b19so12294362wms.1;
        Thu, 30 Mar 2023 10:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680196840;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pLS5bdQOQb5HnWHfDHbDpW+ENKv/YseqZteHlVYBypQ=;
        b=AZBi+ryfecgYJD+FtgtywoyUuQVbsUoV3IEc1c55WE7gvbK1Xz3M1p+nm8Jwlc2f53
         IkKQDLt7oPDlHQw04DhKMvSzBYq0Z1qY7kvh0TVeIGLblF7D47AU33ttiPcb606pvB+A
         L7YnI0ajjTlfR1hg8vj7oB+aaBrfWmqPfnzoJWCcvGU1gzPG85aLOPptNk5fWj4wNdtT
         zUaMf01FHLR7lE7rvJc2NEX0U02eEpEvYn8M/cIBvI9g3RzTQR7WbE8oU7dkXGDv3EIq
         N0g5T3chPIyPeoczkoK7hVlCPTNoBMmLAYTWGD+pvFs+8EHn0YFKlati60AOu06wjXra
         w9/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680196840;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pLS5bdQOQb5HnWHfDHbDpW+ENKv/YseqZteHlVYBypQ=;
        b=Brwg48L+Id2Gqhtk0RVDQp8bhHmYQBkhuLZ1knPRXOUSxsQ7p2lVyyW+4HVTOXFOJd
         u5yi6BzZIskw+XplEu1uiYwPQ5b/kVjTMgS0wq/PVpU2tNBy5S8aA2bbQ4h0Hzrepi2o
         np5eFkwJKrybVCzShV50LEQvDNDI9da2UXRHg+SWXEsV2X0PUpqwceseTf42Bc1tyd0e
         ZBzPCcqyGs8nWki0zuln+HQlr2/khmNmsvCDE7McFusdCUlw0Rme1LLwnNhVTXsjjaja
         Cq9fYLbx3LuIqx1wcQN1EvjMsy3LUTxjKVW6hzaqq+/TNxXIUU2lylCQBH5DKliTvv3e
         YRaA==
X-Gm-Message-State: AO0yUKXPs+GvsIMjmWT97OVsJmw+cZVCCRciK5a14sWZIxEiqQy1ejkR
	oREtC4AWvpKphIfBJiC8qYo=
X-Google-Smtp-Source: AK7set+YwD5gWoY1BrGbOORNpDOIrzSXxF3uUn/NGsz2zN8/nEXjjGcxWc+D6uKyOcosJZ/zcAsPaw==
X-Received: by 2002:a1c:ed0e:0:b0:3dc:55d9:ec8 with SMTP id l14-20020a1ced0e000000b003dc55d90ec8mr17291285wmh.41.1680196840183;
        Thu, 30 Mar 2023 10:20:40 -0700 (PDT)
Received: from [192.168.1.135] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id o6-20020a05600c378600b003ed246c1d28sm6363722wmr.44.2023.03.30.10.20.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 10:20:39 -0700 (PDT)
Message-ID: <dcacbef3-43e2-090f-1493-be40b1e9cd22@gmail.com>
Date: Thu, 30 Mar 2023 19:20:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 03/17] arm64: dts: mediatek: Increase the size BL31
 reserved memory
Content-Language: en-US
To: amergnat@baylibre.com, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Wenbin Mei <wenbin.mei@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
 linux-gpio@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>,
 Fabien Parent <fparent@baylibre.com>,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>
References: <20230203-evk-board-support-v3-0-0003e80e0095@baylibre.com>
 <20230203-evk-board-support-v3-3-0003e80e0095@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230203-evk-board-support-v3-3-0003e80e0095@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_102042_020878_5599C93A 
X-CRM114-Status: GOOD (  18.44  )
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



On 29/03/2023 10:54, amergnat@baylibre.com wrote:
> From: Alexandre Bailon <abailon@baylibre.com>
> 
> The reserved size for BL31 is too small.
> This has been highlighted by the MPU that now restrict access to BL31
> memory to secure world only.
> This increase the size of the reserved memory.
> 
> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Applied, thanks!

> ---
>   arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> index b68aee8f229f..fc7f6d8ae173 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> @@ -65,10 +65,10 @@ reserved-memory {
>   		#size-cells = <2>;
>   		ranges;
>   
> -		/* 128 KiB reserved for ARM Trusted Firmware (BL31) */
> +		/* 192 KiB reserved for ARM Trusted Firmware (BL31) */
>   		bl31_secmon_reserved: secmon@43000000 {
>   			no-map;
> -			reg = <0 0x43000000 0 0x20000>;
> +			reg = <0 0x43000000 0 0x30000>;
>   		};
>   
>   		/* 12 MiB reserved for OP-TEE (BL32)
> 

