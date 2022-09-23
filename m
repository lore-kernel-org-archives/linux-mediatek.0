Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70574ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Sep 2022 13:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eSh9lQlxR1gFInxcwx9nPyD8UC9VTqVGCwfXX2VWpoE=; b=XVqQkAHLThNvIZIfXguyAYbo+j
	oAErgtFa5EtI2YxMInRxuBnK/wrZfOxRjvnTjir+HEXDcRDezjyWGHugbj8/ZgIrCNnNvNo25TU01
	1xRBTAb1KT4LSDTeSsLidoUvrAwM7wqyD9gX6OJrUieSIdYF6CGP5shrNYt+0b1yT3h0dBBkirQpD
	w8zKE4coHsF30Ny0tufRNXxJWgLvPeuDEGRLQ3+r/WJQH2H+U3T6lg68IGERWhLZLV2NbijIkzmzM
	TOCVMhpyT1V0MbLdtXkyKD5vzzML2Q6kxwEinpLe3CzQBhPFdcwMEYjNP5+BJjDO7CDvIQ1M/oyhN
	72zLAIpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obiK6-004NRY-G2; Fri, 23 Sep 2022 13:02:30 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obiK3-004NQf-8r
	for linux-mediatek@lists.infradead.org; Fri, 23 Sep 2022 13:02:28 +0000
Received: by mail-lj1-x231.google.com with SMTP id a10so35822ljq.0
        for <linux-mediatek@lists.infradead.org>; Fri, 23 Sep 2022 06:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=eSh9lQlxR1gFInxcwx9nPyD8UC9VTqVGCwfXX2VWpoE=;
        b=UovPoYoZTR7j58R4ZiTzpBg6X75Fbh4OHuNXCuAKYGWsStit1G6qDwPyinFxKZA2CM
         Ok/j44lXFa9jNi9/3htbd5kAY1WeBWtOWXXXxCX9f6/k78Mor5U+zq/ez/XpWWIxTiTW
         gBgy1WgeFwegshL4yZhiQ+SwB/kveGJxscwhywriEQHzAhqDa3fb6BBK1w4ZOEZklf0S
         zfb3crXHhigd9JIp+SSAHAZ66Kg1Y+hC6kpFZsq1mDjgNOneL5r/1GSrSPa+5LE3LsNg
         Cq/FSHNiedH6MwKNQEqy0TXjSFWZgTchQOiWXva5l9+gj7IRJoT9edwGmmCzhTTkqagm
         l5uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=eSh9lQlxR1gFInxcwx9nPyD8UC9VTqVGCwfXX2VWpoE=;
        b=07F8QUnnaWa8/EDn7xqsidjUpmKBit3mRrhoBm7WjTQ2vkX9C+PgDagrw0Nu188MJ0
         AKbhahCZsLkHUO212Oh1kvaQ77dpO6jXZ23QUJ77WdUQphOqJAx/DWChr13TVnR1rceU
         FfBjxO6EKIBeOMIz1qMFnj6KCzlWoqaLx6TlKBSOvTPOdHmQviAFa0gMJfn3rC3H3pLq
         ekPp4mGTVyCat5wNv1Y6RfDwoJ4HTERvjuNLR9M46vtCHmgfqyjQhmYYu1MXXoYaiCtx
         6RQ4qeyONZKxq3e9/9FX4HukOzY4aUqlHwO7H9LDUTAIXQuP4dtWPDZnePmBe8kocuum
         ZH6Q==
X-Gm-Message-State: ACrzQf2DvxcDbh4rZeGJT6Qj9jMiM253q9wCnTGxiTt85GFx3chKppg/
	bfIViXszL27efn+f1aRmUCK8vQ==
X-Google-Smtp-Source: AMsMyM7qVPPrkR+mwYzG7QUbaiI4bu86AdzgPZgHy75KHEJknXL0Rg1SXgR20+plVTkV408sVjI3LQ==
X-Received: by 2002:a2e:984a:0:b0:26a:d00a:790f with SMTP id e10-20020a2e984a000000b0026ad00a790fmr2932714ljj.358.1663938142995;
        Fri, 23 Sep 2022 06:02:22 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id h6-20020a19ca46000000b0048b26d4bb64sm1450938lfj.40.2022.09.23.06.02.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Sep 2022 06:02:22 -0700 (PDT)
Message-ID: <3022c139-d25c-4fcf-33d5-1baf8aa9e61e@linaro.org>
Date: Fri, 23 Sep 2022 15:02:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v4 net-next 00/10] dt-bindings and mt7621 devicetree
 changes
Content-Language: en-US
To: patchwork-bot+netdevbpf@kernel.org, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?=
 <arinc.unal@arinc9.com>
Cc: robh+dt@kernel.org, matthias.bgg@gmail.com, andrew@lunn.ch,
 vivien.didelot@gmail.com, f.fainelli@gmail.com, olteanv@gmail.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, tsbogend@alpha.franken.de, gregkh@linuxfoundation.org,
 sean.wang@mediatek.com, Landen.Chao@mediatek.com, dqfext@gmail.com,
 sergio.paracuellos@gmail.com, erkin.bozoglu@xeront.com,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
References: <20220920172556.16557-1-arinc.unal@arinc9.com>
 <166392781809.11802.14314301597128820257.git-patchwork-notify@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <166392781809.11802.14314301597128820257.git-patchwork-notify@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_060227_343746_C1FE38AF 
X-CRM114-Status: GOOD (  12.74  )
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

On 23/09/2022 12:10, patchwork-bot+netdevbpf@kernel.org wrote:
> Hello:
> 
> This series was applied to netdev/net-next.git (master)
> by David S. Miller <davem@davemloft.net>:
> 
> On Tue, 20 Sep 2022 20:25:46 +0300 you wrote:
>> Hello there!
>>
>> This patch series removes old MediaTek bindings, improves mediatek,mt7530
>> and mt7621 memory controller bindings and improves mt7621 DTs.
>>
>> v4:
>> - Keep memory-controller node name.
>> - Change syscon to memory-controller on mt7621.dtsi.
>>
>> [...]
> 
> Here is the summary with links:
>   - [v4,net-next,01/10] dt-bindings: net: drop old mediatek bindings
>     https://git.kernel.org/netdev/net-next/c/e8619b05870d
>   - [v4,net-next,02/10] dt-bindings: net: dsa: mediatek,mt7530: change mt7530 switch address
>     https://git.kernel.org/netdev/net-next/c/3737c6aaf22d
>   - [v4,net-next,03/10] dt-bindings: net: dsa: mediatek,mt7530: expand gpio-controller description
>     https://git.kernel.org/netdev/net-next/c/0fbca84eea37
>   - [v4,net-next,04/10] dt-bindings: memory: mt7621: add syscon as compatible string
>     https://git.kernel.org/netdev/net-next/c/862b19b7d4a1
>   - [v4,net-next,05/10] mips: dts: ralink: mt7621: fix some dtc warnings
>     https://git.kernel.org/netdev/net-next/c/5ae75a1ae5c9
>   - [v4,net-next,06/10] mips: dts: ralink: mt7621: remove interrupt-parent from switch node
>     https://git.kernel.org/netdev/net-next/c/08b9eaf454ee
>   - [v4,net-next,07/10] mips: dts: ralink: mt7621: change phy-mode of gmac1 to rgmii
>     https://git.kernel.org/netdev/net-next/c/97721e84f546
>   - [v4,net-next,08/10] mips: dts: ralink: mt7621: change mt7530 switch address
>     https://git.kernel.org/netdev/net-next/c/2b653a373b41
>   - [v4,net-next,09/10] mips: dts: ralink: mt7621: fix external phy on GB-PC2
>     https://git.kernel.org/netdev/net-next/c/247825f991b3
>   - [v4,net-next,10/10] mips: dts: ralink: mt7621: add GB-PC2 LEDs
>     https://git.kernel.org/netdev/net-next/c/394c3032fe0e


DTS patches should not go via network tree... We keep them separate on
purpose - to split hardware description from OS-specific implementation.

Best regards,
Krzysztof


