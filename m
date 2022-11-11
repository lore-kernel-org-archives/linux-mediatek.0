Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DA9EC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Nov 2022 08:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v4c1vWTv1GfIFv4FejqWxX3mxKdVbbgHYO6F6Nc9yOY=; b=deethpY/2LhYcLCXXW/8HqAA3W
	HKk4NmeSkkAckEH6QtqjD7C+ajLzAWqNg3WttOTfpIbbd3X6darwfKZN9VskTa2GYPDix1EnllZuq
	IBwjRZHBg98mVfqAw9lgkFI3tfhILbs3QbmPCipVLiWWlrtHQ12IGwIfueGGkeMlxZ+r3Jdw8kdwV
	oYkxbDrO/tqmlUPyCZ3lwnRqik4eB1WdwoINTK03rAQJ+VL7uWTOnI1RurmxsNy8QajlFsrWF4BGf
	Ml3c+Z3d9zpUpzIKlOGVo8p6uReowGUwZVdlKgOU99sYCHrzoqT560HlusHI6+HfTUrRuVDXXOfs0
	Og5n61aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otPeY-00EIQg-5V; Fri, 11 Nov 2022 08:44:46 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otPeU-00EIPk-Ox
	for linux-mediatek@lists.infradead.org; Fri, 11 Nov 2022 08:44:44 +0000
Received: by mail-wr1-x42e.google.com with SMTP id k8so5575752wrh.1
        for <linux-mediatek@lists.infradead.org>; Fri, 11 Nov 2022 00:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v4c1vWTv1GfIFv4FejqWxX3mxKdVbbgHYO6F6Nc9yOY=;
        b=EafFpKN2+LMnRJJXIorUl5YAPj/pbU3D42b4GqlqWPqxYqkvYzTMNs937HOW6b5wm1
         FXKusGms/isQXr9V0h/XUesFhud1SlSsTCqiaXFa23eMG2gDVoC34Y2vmHcLVmpNB99+
         tuOMhSg9ELl3wVJigGWzscLAjCJCHFl8E/4qVnP57yPkULYF2EGaRLym02/uTi0t3oJJ
         dnfh8r+AzgaOT9JEYKn/UWTr7ILs/I2URyb3bauINGYDlbpUCa0KwkfeemqByic1Srl6
         GyfYOwStnEC4mpbzMfcxw5JOEkg5qz9kBf3ZX0Pw8vTxRYn2SZeY12tePzuYtXvnB3Iz
         g9nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v4c1vWTv1GfIFv4FejqWxX3mxKdVbbgHYO6F6Nc9yOY=;
        b=xOhGanqrNtIhBfq87eKhqvBfKctgfcSeJZsR8ayWxlA/O7fBfAw7XU9uc2R1GLgv96
         /2Irqc6o16y9COLNLFp60534fu8hOciuvtHIei9TfXGuE0LzJRrmG5KIetVndZgxdX3M
         OjVQlYSlGg2tjwlZe4JueeYcDtd//GrNz3ri5qkA26fTEWHykQRXwf7+uqbFkVbcxXK4
         w12m+EYcfJMT7TsTIDmjSaz786+YXrkHd4NSQAkv0yuBFwsg47aO6/LAI2U3qdbfRCtB
         1zFtRKiPIhZTw9l538RGdjUZtjd3Gq7blwrJFuU0N46u4gj4ZsxpiINgGLyLG9QLTTmI
         0NZQ==
X-Gm-Message-State: ANoB5pmB+ws8lquEsRq9ztTkbYi1Ddg9aVP74W6p784NaoOO28cpLKLF
	YhFEZq2TuZGb+dKDxwTlEh4=
X-Google-Smtp-Source: AA0mqf5a0ZFm7qyv5Y27nujbB0ybS2Cgt6RYgcSeHFFMzInDq7yW17Vrlc/b7wm+2kvtSDbTLGvOYg==
X-Received: by 2002:adf:eb45:0:b0:22c:deef:de9e with SMTP id u5-20020adfeb45000000b0022cdeefde9emr596861wrn.333.1668156280853;
        Fri, 11 Nov 2022 00:44:40 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id az9-20020adfe189000000b002367ad808a9sm1337674wrb.30.2022.11.11.00.44.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Nov 2022 00:44:39 -0800 (PST)
Message-ID: <eb1ac3e7-8652-6690-0f86-b46b6a1e0cb8@gmail.com>
Date: Fri, 11 Nov 2022 09:44:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v4 net-next 0/8] introduce WED RX support to MT7986 SoC
Content-Language: en-US
To: patchwork-bot+netdevbpf@kernel.org, Lorenzo Bianconi
 <lorenzo@kernel.org>, David Miller <davem@davemloft.net>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
 sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com,
 Bo.Jiao@mediatek.com, sujuan.chen@mediatek.com, ryder.Lee@mediatek.com,
 evelyn.tsai@mediatek.com, devicetree@vger.kernel.org, robh+dt@kernel.org,
 daniel@makrotopia.org, krzysztof.kozlowski+dt@linaro.org,
 angelogioacchino.delregno@collabora.com
References: <cover.1667687249.git.lorenzo@kernel.org>
 <166815481641.32563.14048666303133746703.git-patchwork-notify@kernel.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <166815481641.32563.14048666303133746703.git-patchwork-notify@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221111_004442_840428_06E591F9 
X-CRM114-Status: GOOD (  15.24  )
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

Hi David,

On 11/11/2022 09:20, patchwork-bot+netdevbpf@kernel.org wrote:
> Hello:
> 
> This series was applied to netdev/net-next.git (master)
> by David S. Miller <davem@davemloft.net>:
> 
> On Sat,  5 Nov 2022 23:36:15 +0100 you wrote:
>> Similar to TX counterpart available on MT7622 and MT7986, introduce
>> RX Wireless Ethernet Dispatch available on MT7986 SoC in order to
>> offload traffic received by wlan nic to the wired interfaces (lan/wan).
>>
>> Changes since v3:
>> - remove reset property in ethsys dts node
>> - rely on readx_poll_timeout in wo mcu code
>> - fix typos
>> - move wo-ccif binding in soc folder
>> - use reserved-memory for wo-dlm
>> - improve wo-ccif binding
>>
>> [...]
> 
> Here is the summary with links:
>    - [v4,net-next,1/8] arm64: dts: mediatek: mt7986: add support for RX Wireless Ethernet Dispatch
>      https://git.kernel.org/netdev/net-next/c/eed4f1ddad8c

As I mentioned in the series, DTS changes should go through my tree to avoid 
merge conflicts. Please let me know if you drop the patch and I'll take it then.

Regards,
Matthias

>    - [v4,net-next,2/8] dt-bindings: net: mediatek: add WED RX binding for MT7986 eth driver
>      https://git.kernel.org/netdev/net-next/c/ceb82ac2e745
>    - [v4,net-next,3/8] net: ethernet: mtk_wed: introduce wed mcu support
>      https://git.kernel.org/netdev/net-next/c/cc514101a97e
>    - [v4,net-next,4/8] net: ethernet: mtk_wed: introduce wed wo support
>      https://git.kernel.org/netdev/net-next/c/799684448e3e
>    - [v4,net-next,5/8] net: ethernet: mtk_wed: rename tx_wdma array in rx_wdma
>      https://git.kernel.org/netdev/net-next/c/084d60ce0c6c
>    - [v4,net-next,6/8] net: ethernet: mtk_wed: add configure wed wo support
>      https://git.kernel.org/netdev/net-next/c/4c5de09eb0d0
>    - [v4,net-next,7/8] net: ethernet: mtk_wed: add rx mib counters
>      https://git.kernel.org/netdev/net-next/c/51ef685584e2
>    - [v4,net-next,8/8] MAINTAINERS: update MEDIATEK ETHERNET entry
>      https://git.kernel.org/netdev/net-next/c/90050f80509c
> 
> You are awesome, thank you!

