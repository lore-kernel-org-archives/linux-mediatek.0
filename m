Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F697C61DB3
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Jan 2023 21:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9G8E/pbF0yCVEwppEfeZ3APRR94ekY7sl663Hc09EMo=; b=H3PszbucY5DaPMYJZfbJI/Mgnk
	M/U/ZO4JzsLyhZyv3a2/CixwLx/R5No2eiLxh6BP160Z6ooYy1bsezrJXrGUxBmVUWUtxh3sgeILR
	eD5ZypAWAzOLCobj/aZ8XkP9aSbw5L2P7mqtJnAksMSr/FmAsj8kFNsP9mXNhMHX4rWNfwcxvE5YG
	Gkhpo86bSYfVk4VVX978VhcmlEHJT3YztttHllQx17oORt6ZhcDXTXYDY5BlT3TRGC1tcildVBpwp
	Uymt85nmLucXpor6jzvhUInUE7P/WeTC74y6KJyozO2QQgraPRqOeT2WrJOFpoSFiNCacUGWhpC28
	tMeYCDcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pG4u8-00H6CR-NT; Thu, 12 Jan 2023 21:14:32 +0000
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pG4ts-00H69t-TR; Thu, 12 Jan 2023 21:14:18 +0000
Received: by mail-vs1-xe2d.google.com with SMTP id 186so15087012vsz.13;
        Thu, 12 Jan 2023 13:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9G8E/pbF0yCVEwppEfeZ3APRR94ekY7sl663Hc09EMo=;
        b=CLGQjrQB/cXT4ivLFkBZ2uFfRzV2B4EuZw/fwRZDs/OamGqTfErZRyoEF5zSftNssA
         aXo/J943u3z52xiiyn9ozbhsyoQruIu2fecHP/z+SDB5JICNMpxq0KcptZnYMIhrShBM
         YfC96q6zTGqcqq9hX2DPYulrMchhsuMtmAzxE/31s8E9O7Mmo6W9CLXhI76inUfSWyDe
         +cHCugoc13oZ7d5vWOFEfSgOP8LUmFvg/dNuqBbCgACKDXztYEDpxaveJOoNssA3MPUw
         vfhD6ahNx593rmXHQEFQIlfxRB/Tly17byXrAoAyTruXS4oWhtjl0KJfWf3LFxNyESR/
         QMaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9G8E/pbF0yCVEwppEfeZ3APRR94ekY7sl663Hc09EMo=;
        b=BZrFaekeuv2Y/N+JzhV6tTBXtWUzlaRb6vq//1qnH3Xps1aPSfRbyvcK9E3s473rD1
         THBi/qnsUXCrAQk4ywEYU65j2F3mO0WQGH49sBpEI+Lv0C2+C9wWaWa5yGnUQnXiUyvH
         LUBjEOicfB9lHFwiCpfYClRYS65lgjTlZ5cmtJLGajQImxfB+aZsASMXiuo8OqTPaUCw
         /PtWmUNwiNSMOtnnZeOqUhmt5k8jjMT+jcKcXPbMDXT966YzYL5LUAlqGqYguXdhblKx
         6I0nV44atSwZzmR/ULwYFbUIktvHT7wsc05XUaDcHY5Jrt8TjIqKdAo/lGSlZ+UVRQYL
         AFFw==
X-Gm-Message-State: AFqh2kptNuXM/02pe1bT+Q8ey5NPK6yGe+ErxSZH4/XTF2tlW8qO/GzA
	4NDRsehK0Ubv6V9bQPz6KRg=
X-Google-Smtp-Source: AMrXdXvqOpDKUMfAeRKnyAEn0jSg0Xdln+Y3NUo/FVdyWNh9GqqApDbAMshix//ZhSV0K8IXOyErgA==
X-Received: by 2002:a05:6102:32d3:b0:3d1:657e:39ff with SMTP id o19-20020a05610232d300b003d1657e39ffmr335281vss.30.1673558054609;
        Thu, 12 Jan 2023 13:14:14 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id u15-20020a37ab0f000000b006f9c2be0b4bsm11202593qke.135.2023.01.12.13.13.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 13:14:14 -0800 (PST)
Message-ID: <2fd5c783-94f1-1896-c6b9-431a754aec14@gmail.com>
Date: Thu, 12 Jan 2023 13:13:51 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH net-next 03/10] net: mdio: mux-bcm-iproc: Separate C22 and
 C45 transactions
Content-Language: en-US
To: Michael Walle <michael@walle.cc>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Felix Fietkau <nbd@nbd.name>,
 John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bryan Whitehead <bryan.whitehead@microchip.com>,
 UNGLinuxDriver@microchip.com, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Li Yang <leoyang.li@nxp.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linuxppc-dev@lists.ozlabs.org,
 Andrew Lunn <andrew@lunn.ch>
References: <20230112-net-next-c45-seperation-part-2-v1-0-5eeaae931526@walle.cc>
 <20230112-net-next-c45-seperation-part-2-v1-3-5eeaae931526@walle.cc>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20230112-net-next-c45-seperation-part-2-v1-3-5eeaae931526@walle.cc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_131417_002993_9AA47BB7 
X-CRM114-Status: GOOD (  12.83  )
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

On 1/12/23 07:15, Michael Walle wrote:
> From: Andrew Lunn <andrew@lunn.ch>
> 
> The MDIO mux broadcom iproc can perform both C22 and C45 transfers.
> Create separate functions for each and register the C45 versions using
> the new API calls.
> 
> Signed-off-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
> Apparently, in the c45 case, the reg value including the MII_ADDR_C45
> bit is written to the hardware. Looks weird, that a "random" software
> bit is written to a register. Florian is that correct? Also, with this
> patch this flag isn't set anymore.

We should be masking the MII_ADDR_C45 bit because the MDIO_ADDR_OFFSET 
only defines bits 0 through 20 as being read/write and bits above being 
read-only. In practice, this is probably not making any difference or harm.
-- 
Florian


