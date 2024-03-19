Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FCA0C54E71
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Mar 2024 21:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zrrC27c+leVw8q3sOhDGD63wH3I4xP5q0fuuEBKNnzQ=; b=W3A166ibyGUD5KOqd+dlbwPDBk
	vOJztAFKzWnHL45vwDuPjbOewXWOUeIDIahtMZ8T19j/RwVDagPvc6wCK89w6/LZJTtimOcGugm4X
	sdWjpKKpMuQP+riE5NHvr23tzUZpXeV4CogqFR8gHk/S0++jl3AtrO5y6Bq4dfoeozinDAV99OY/I
	UJmFURYjNU3Pphuqn8WYWma/BRUe26s1bQifugw8dgLUoPZwnJctMSLVjo4Sp41c9xRvN8gdpzU6J
	fSDFYV2pkTYNyDZzxj2eSvWBYyJ/Uq+ZtFI/poKvR9g8ASP7E0yDunpSSuuc9tK7emLysUdnA5x6x
	uSJOHX5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmh3a-0000000EIjp-2HoP;
	Tue, 19 Mar 2024 21:31:38 +0000
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmh3X-0000000EIix-1bWb;
	Tue, 19 Mar 2024 21:31:37 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-221a4f9557dso3544325fac.2;
        Tue, 19 Mar 2024 14:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710883893; x=1711488693; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zrrC27c+leVw8q3sOhDGD63wH3I4xP5q0fuuEBKNnzQ=;
        b=Uy5NtSqq4wDfmReMtiHSwmF9Lwox+F9x+7XYyrSPFIj8wh2UK+x9DGP5ItFlRAac+m
         vhk45awp+AD15fNtfVaB5JbILs+yP+ysa5UuS1K0jN+Bl4Hvm/nx9eeooTnW0u0Krre0
         f6a70+enxw5++jAVKjmY3YxuJhr4Qxlzh+HqYizSvPcTcIkv2QrYUSR2XmGOmWObTtC7
         tYBviPzTRnbEzV6n+KBaPN3XXKRwU3E1CXyAG5H+VmkbKZCb0Z2xF39KaeRBaeac2P78
         qZgDWT4jqv8LMA7MQwPsRr+D8W6+PkpMgSh+jdX/RBiblyUXxRxCyWkb9j3jkaK6C9fg
         oyNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710883893; x=1711488693;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zrrC27c+leVw8q3sOhDGD63wH3I4xP5q0fuuEBKNnzQ=;
        b=nir0Tl+XSBkL1jeqUf+ARWLjPDSO1zeYTfIh5vXCZyW+XheNXpnr2Buw0Ytb9nxxiW
         /QCrSliJVPHhIqfz8XLLV2g05pJS5wWG2BDZQo6jP1ME+dUAJignAT/RhDs0TARjtngL
         2Pj3AaDurf3yQahC70fNlDNF9VhXvf+ZYjaPtAzF+6zF1FsSk+hnRa6/xRujym2nnWZR
         0qqoFV+kkzPQRiR5nv7TO0HPkgF2vd624XCqPSb2QLwA2rwS6KCj3zRiVP9XBoY/Cocw
         CSyUuir6dPV7ze2uHVdWcP+ReuCYMvKxtJL70p/4nGYm2O55Uy3xYVSQE8JorPPEfe92
         g0Qw==
X-Forwarded-Encrypted: i=1; AJvYcCXqJJ4FcnrwAY93tieQ6Hx/lnWxA2MwThlygWytXv9VfBSk2S/1R/ImqAlK3sQjwhD4K718p+TVrmyMLCbp+eD1Bzmyui4sok8KcAm6wjprNiBn2rn07SI13Oh4xxc2R2sgjAWH7dpw5aqEcLu9ngPaWdWK9kl8N2s=
X-Gm-Message-State: AOJu0YzEXd3bopXV5sj0XOvszy27yQ5p51pQamjAyXex9Z0wrlY7el/6
	9hYj67WnBBuwiQCHvosSskOXeOIDxg0blhv2DBfw/KQpVStzg7ET
X-Google-Smtp-Source: AGHT+IGTbHkm/yZu+SFyFjorv7aR5q2Vk7pijIwUW83u6t5zXogAOTFA3W/xGBNXcrmlWiRg+MWmyQ==
X-Received: by 2002:a05:6870:9a16:b0:221:94bb:c050 with SMTP id fo22-20020a0568709a1600b0022194bbc050mr17101034oab.32.1710883892747;
        Tue, 19 Mar 2024 14:31:32 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id h62-20020a638341000000b005dc832ed816sm9520138pge.59.2024.03.19.14.31.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Mar 2024 14:31:31 -0700 (PDT)
Message-ID: <38798882-c033-4949-9446-4c6f15c25ebe@gmail.com>
Date: Tue, 19 Mar 2024 14:31:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Fix EEE support for MT7531 and MT7988 SoC switch
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, Andrew Lunn <andrew@lunn.ch>
Cc: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>,
 Russell King <linux@armlinux.org.uk>,
 SkyLake Huang <SkyLake.Huang@mediatek.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Bartel Eerdekens <bartel.eerdekens@constell8.be>, mithat.guner@xeront.com,
 erkin.bozoglu@xeront.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240318-for-net-mt7530-fix-eee-for-mt7531-mt7988-v>
 <ZfnYkuzuvwLepIfC@makrotopia.org>
 <00ec9779-19ce-4005-83f0-f4abf37350fc@arinc9.com>
 <6cb585f6-6da8-45a2-a28b-2fb556f95672@lunn.ch>
 <Zfn1DxkEa3u-f7l2@makrotopia.org>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <Zfn1DxkEa3u-f7l2@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_143135_461533_75DB2E20 
X-CRM114-Status: GOOD (  21.92  )
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

On 3/19/24 13:26, Daniel Golle wrote:
> On Tue, Mar 19, 2024 at 08:38:03PM +0100, Andrew Lunn wrote:
>>> I would argue that EEE advertisement on the PHY should be enabled by
>>> default.
>>
>> That is an open question at the moment. For some use cases, it can add
>> extra delay and jitter which can cause problems. I've heard people
>> doing PTP don't like EEE for example.
> 
> MediaTek consumer-grade hardware doesn't support PTP and hence that
> quite certainly won't ever be an issue with all switch ICs supported
> by the mt7530 driver.
> 
> I'd rather first change the (configuration) default in OpenWrt (which
> is arguable the way most people are using this hardware), also because
> that will be more visible/obvious for users. Or even just make EEE
> configurable in the LuCI web-UI as a first step so users start playing
> with it.
> 
> After all, I also have a hard time imagining that MediaTek disabled
> EEE in their downstream driver for no reason:
> 
> https://git01.mediatek.com/plugins/gitiles/openwrt/feeds/mtk-openwrt-feeds/+/24091177a18ba7f2dd8d928a8f5b27b14df46b16

EEE tends to be an interoperability trap and typically results in 
unexplained link drops with different link partners which are difficult 
to debug and root cause. It would be great to have more context as to 
why it was disabled in the downstream tree to know what we are up 
against, though I would not be surprised if there had been a number of 
issues reported.

That said as an user, if someone has a well controlled environment, they 
should absolutely be able to turn on EEE and see how stable it holds in 
their environment.
-- 
Florian


