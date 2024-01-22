Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 885F0C47DAF
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Jan 2024 08:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IYFHMOudeDDYTQx2fg7GOLg/McNU+uQyntWBStvxXwI=; b=OxDVfdobwZNyYvm+6jfcnPDOji
	x8iKFbVSVl0NJbucuQwwUjhoetdcjFsSbvNZyUz2Si0zVjy6sZQfBjRBLXapgNrukKWDrVa38ElrL
	aSvYUkXE7KWJBYgQL9KrVZ9SsbLkfniFa9ri2p25BxoADMUWH1OhQmgohLk/k+4CW+ljoi2BV4qB+
	1cTxtNyhdOvJhSV1Ma4SnJVGOjndJX94RsPzJRBRQhRb7hwCpiSsu2DmtneAXEwPxJZTwk6PfmjWD
	8L8RnxtVBsYox9TlzKpIkZ6HqPv7i/KRLOfC3Wb0jy6BJ0+aDY0qnCkUSr0A2UJQqsigMhoCuIZLS
	USYwd0Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRpgE-00B3eK-1J;
	Mon, 22 Jan 2024 08:29:18 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRpgB-00B3cU-1X;
	Mon, 22 Jan 2024 08:29:16 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-5cde7afa1d7so1136362a12.1;
        Mon, 22 Jan 2024 00:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705912154; x=1706516954; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IYFHMOudeDDYTQx2fg7GOLg/McNU+uQyntWBStvxXwI=;
        b=Ex1HrCl4EL91qK4Vv974U3m26fJLHXLuri6a5xKWLCDEzeeW42tHqZFG3hSXIgkaiu
         I/+LG5+XjkILbXxRZjF44OSvDBhG8+pytP6EH/NgDMwPy6/DaySUtTl70DgqX3dcY/h1
         wQcgOJhAizq8lfe9+S+iOp/cFAORNXGKjjQQe9NmN2hC0U2K/NcH0v/kRXXHyunWHpY7
         eVBitZZ3uireKROym2glTA9V8RfxNekRVKf369UbTluL4ArWDT7TJpAtOAjJtFEf1MOW
         8c6Oq3AyAjVIilwELptzq+vguQzSoicIpXHn5K9MtqyCRNIgPwLFfa7gS/JZVzwPoPFt
         Cbvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705912154; x=1706516954;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IYFHMOudeDDYTQx2fg7GOLg/McNU+uQyntWBStvxXwI=;
        b=XF45j3UoRJGTlF8s82nca32hYBWM2/K02igzRXx6QdJOWagltWm6V3WtsTEOHepwLS
         NR8+yO3sXNF20lDCntX5zuZGbbFWTQ5NHjHXo6AAHju/uldqVEtfBLmaNHXXlVeBbTHx
         LC2FMx25muO5Tk4ea1gpReH58Ub5na2XRk0TPBZN2xso0RYiripOo6vfUhD/tAkzEv1p
         Mg5uaD9W+52v1yCEFDVqmrL9ZmnSHJs7EE7AgUGB0F2ZEX/+UqT5T99v0WEzofSg1aUf
         Qrtf4c7FSkgUU71VVPXNReF8s5Ok6/SY+s1uvvHnDlkDxJbYAY1rXdiVHf4dR8L0p2Le
         tEPg==
X-Gm-Message-State: AOJu0YzBYiC4+xWN6/lrc4yzV8NiFwrS8Rqi3YmETF1uSrpZbvwtEIto
	A6Ii4kk9U1D2+JBnfT98g2RLS0fSerGDTIcKfpoWvOk7ZBAtGvao
X-Google-Smtp-Source: AGHT+IFP2WPWybTnNXSMUEwRQ73f2904Y6nxzHI7Ni9zcZgpN1qSSkWnRQkPJYcoqqgfQUCD2l5tdw==
X-Received: by 2002:a05:6a20:9f87:b0:19a:e0de:866f with SMTP id mm7-20020a056a209f8700b0019ae0de866fmr1390552pzb.101.1705912154303;
        Mon, 22 Jan 2024 00:29:14 -0800 (PST)
Received: from [192.168.2.177] ([207.188.161.188])
        by smtp.gmail.com with ESMTPSA id sy14-20020a17090b2d0e00b0028c89122f8asm9005725pjb.6.2024.01.22.00.29.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jan 2024 00:29:13 -0800 (PST)
Message-ID: <bfeb73e6-303e-46b4-be64-e008213fae72@gmail.com>
Date: Mon, 22 Jan 2024 09:29:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 0/2] mt7981b: initial DT code
Content-Language: en-US, ca-ES, es-ES
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Daniel Golle <daniel@makrotopia.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 jason-ch chen <Jason-ch.Chen@mediatek.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, soc@kernel.org,
 linux-kernel@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
References: <20240111103928.721-1-zajec5@gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20240111103928.721-1-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_002915_517387_C8E292E4 
X-CRM114-Status: GOOD (  11.12  )
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



On 11/01/2024 11:39, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This work is based on linux-next content and was successfully verified
> using "dtbs_check".
> 
> I'm not sure who should apply this work. Given I received reviews from
> AngeloGioacchino should I expect Arnd to pick it to his tree directly?
> 
> Rafał Miłecki (2):
>    dt-bindings: arm64: mediatek: Add MT7981B and Xiaomi AX3000T
>    arm64: dts: mediatek: Add initial MT7981B and Xiaomi AX3000T
> 

Both patches applied, thanks!

>   .../devicetree/bindings/arm/mediatek.yaml     |   4 +
>   arch/arm64/boot/dts/mediatek/Makefile         |   1 +
>   .../dts/mediatek/mt7981b-xiaomi-ax3000t.dts   |  15 +++
>   arch/arm64/boot/dts/mediatek/mt7981b.dtsi     | 105 ++++++++++++++++++
>   4 files changed, 125 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt7981b-xiaomi-ax3000t.dts
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt7981b.dtsi
> 

