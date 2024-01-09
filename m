Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10F65C46CD2
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jan 2024 06:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=svUThaQL4O0jeqe+j6zcJnwnFNsK7pUnz6sFOsPzHXs=; b=ucVRZWgy8JlQL4fzXLymCYQ6Xu
	zZzhocRVOjQRLcvjVf2DohKVMwh6YTgDqiC8NHqJiv5/BmwBRsGouDkvHgRgGJhLs7FaEsGIRiI29
	kDt8Mafjuhba22z0yvdOUFcIpJuXYf/CLUic97trKSJ8lb1tkUbs+pAMJszs3HljxPrpz4+WRCmjC
	q1Ww1UJWxv6AZvdD66mHPbGajwH6IcPLh+davNJiaS1yx0hn0NIzbEwogR7VxvoOSvxwYzLipYJk6
	AGeulafxRAaF5z7ZhFb1XZ+d/Q4Ds8NmjAKb/3d64p4CZ7lwFs1qL2KwsMlSFSEuXaI/vEepL7kLn
	XSVF9GTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rN5Ly-0073Xm-23;
	Tue, 09 Jan 2024 06:12:46 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rN5Lt-0073XJ-2n;
	Tue, 09 Jan 2024 06:12:43 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5537dd673e5so2163637a12.0;
        Mon, 08 Jan 2024 22:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704780758; x=1705385558; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=svUThaQL4O0jeqe+j6zcJnwnFNsK7pUnz6sFOsPzHXs=;
        b=CI3TGXrD43iC7HFef2TuPJxd4XaFmLaoQckSTIH5ReRxwqg8JLeUThKZ7tANl8oimc
         7IspWrmGKEOiiFkwrWEWJwnaNdeOlR2P/kCFTjrQqPrM6Abp0Bpo+nR8DzK8jhcWdVrM
         tJfJregqbPLM13JWQCi16upuJ8+cKb+czzzn4fPPjH1m1BSLW2wsJy4NbcFvYW+55tZp
         CaOw+yhm2x4Uha8UXDsTGda8Vqt4vK4Lqfh7/mltMZ7ivYYrQVZ1vZu64L0Tuf5onl2p
         V7kfyMOJi/LykY2Ieg8pHU7T4x6rspkQCLBnewt/3ovW9A5+GtJ16lwSLqVcJb4+cydW
         FiUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704780758; x=1705385558;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=svUThaQL4O0jeqe+j6zcJnwnFNsK7pUnz6sFOsPzHXs=;
        b=uQ2meZ0C23yXpor8RumP55ihMa+8/CmkNuyWiP97CREQCcu1sfofb9tp/v9eT/K39N
         EEcpCssY3pGzn9OHQ+1soyWx59hGx/786ILJ3oiQ51A8lUZ8foqk8yF6OS6TtL+A5o1V
         fn9t0ES6mkcij7N2iBbaOETSvwIfPmOavfjdyQOg86xBUdcFgKQFIl5RE3LmWeKs1u9V
         mY6b+P+nIXA1f13J+k0y9Mtwd1ojOIbO2vRy3/9Gk3ijx8UrZ9FNu2/dBlCSn36Kbdni
         lv6JtlWzu8rUemBPOF1FvacUDEWr6g+NLTyn3EEdgAiklwOUQTCpeT/C4Jr4HeSEAjOV
         Xryw==
X-Gm-Message-State: AOJu0YyWZ1AYIbii2BrMkxNiAqYBzZtC81mLZhA4pvXormzLVgFHy/Y7
	TdVvAnHDo8gDIxmkdAPmiuY=
X-Google-Smtp-Source: AGHT+IH9t82biNC1XX+mwqw0X/XMIj5bvFu3P/kSaeV39cU5H2Ey1ialTC3tFvNcWbBMYps99l3iSA==
X-Received: by 2002:a50:9f2b:0:b0:555:11da:d813 with SMTP id b40-20020a509f2b000000b0055511dad813mr3250528edf.83.1704780757994;
        Mon, 08 Jan 2024 22:12:37 -0800 (PST)
Received: from [192.168.26.149] (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.googlemail.com with ESMTPSA id t4-20020a056402020400b0055773fb50fbsm572037edv.15.2024.01.08.22.12.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jan 2024 22:12:37 -0800 (PST)
Message-ID: <1a9d7f5b-4a00-4026-81b8-7af3031c6656@gmail.com>
Date: Tue, 9 Jan 2024 07:12:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: arm64: mediatek: Add MT7988A and BPI-R4
To: Conor Dooley <conor@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Daniel Golle <daniel@makrotopia.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 jason-ch chen <Jason-ch.Chen@mediatek.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
 Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
References: <20240102205941.29654-1-zajec5@gmail.com>
 <20240108-helium-retriever-043ed3e1dbe0@spud>
Content-Language: en-US
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <20240108-helium-retriever-043ed3e1dbe0@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240108_221241_925703_2B5196A3 
X-CRM114-Status: UNSURE (   8.73  )
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

Hi Conor,

On 8.01.2024 18:38, Conor Dooley wrote:
> On Tue, Jan 02, 2024 at 09:59:40PM +0100, Rafał Miłecki wrote:
>> From: Rafał Miłecki <rafal@milecki.pl>
>>
>> MT7988A is another MediaTek's SoC with just 1 device available right
>> now: Banana Pi BPI-R4.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

I sent V2 meanwhile, could you reply to below PATCH instead, please?

[PATCH V2 1/3] dt-bindings: arm64: mediatek: Add MT7988A and BPI-R4

