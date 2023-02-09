Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D02C05027
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Feb 2023 23:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xldWbIGpXMTnrefHQWDXpkkoKsv33xh/2i/KG0k0JDg=; b=NW4gbvUO89C6CN1M1UU9ZHZUD0
	aaNzG3jf/y4RS9ZIYUW/JXb+Y0NGpd/bAqZgiLz8zFodnLPrcp4R72HciLvPiK0XUZOhPdflCaRuN
	PUt3XfNICceB3p+Rmku6e7prv2EfU+caMl/DATbdtr8mzxM7XR5RIp1h8kGkkUviMZ6FjCCUHBUsp
	lOh7nUsn+YHyzuJBPMNLu3EO7KcxYtKNjB8ATwLfyalFMYO3MVkK/RLf7b8fUm/AyDJ39nKrhenVo
	ctXH8b25BhhEM9xVRtztHeVMIWPZSLRXj278I2rsGf9Z1TETZCwSmsWlOatnRYuRMxe63FMGiKLRD
	TR0XtbHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQGQZ-003Yam-8b; Thu, 09 Feb 2023 23:34:07 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQGQV-003YYK-No; Thu, 09 Feb 2023 23:34:05 +0000
Received: by mail-pl1-x630.google.com with SMTP id f6so4655825pln.12;
        Thu, 09 Feb 2023 15:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xldWbIGpXMTnrefHQWDXpkkoKsv33xh/2i/KG0k0JDg=;
        b=NjXRAeQL5FLMO+RiG2BtZhPCoVZjoDMMIXxZBmjrRt0iacUfFOUdlY5MdGHNh1oTZD
         bzjLh3SRyGP2PC5qI2quzUSNrwkiQQOBldgtaLAtmYgzU+O8iLlvD06US0LcH1oIbDTF
         7RHDsGM/TrKcqrUIWFv8VtO7lecOgpvuVzY0u4/KVu0iDc1ypPZoa6eZps2Ul3oM/JyC
         zeHq2sgKsvVbExV8Wt9Fh+9yurjZZHFPFIYE8djGYaezBpAf2KdxbsloBH93/h/wyeuD
         qbq0s2knlxN9x1U16/3dJqpoObynXzX3G9WtTwmgSFXRjBBDBqziplt7XZZuAU8oD0lC
         nSXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xldWbIGpXMTnrefHQWDXpkkoKsv33xh/2i/KG0k0JDg=;
        b=Co2d36jLrPUu5f4je5w38fxnuhWwMc5+BjTTXfyTi0X+6tt/Vd6VTL0T7P0S/fJwHg
         bsREFuNy1CDTd9QKB0CBORVSftfTtaYijmBqXo5nKfgkXaXk9APPrbR3cU8+r8wX8a2z
         okdAymuk2bgRwljr1RXTiIe9iFeJSoU22Q/FbElBlwmMbfXNaEFtReC4BXfynkKYyFET
         yFY7RRV42oSVjBHJy0xMaHCJIZpIXMOBG8oHMv9W7S3nV7Hrg+8Eqn2beCNiVp9rWlPW
         kmHqt7YNDdWC4R0NvenzTxP9q0eMc0LgbGOpk7vZo1MpXn3oOZgu15fBVTXwUD8plMQq
         d1iQ==
X-Gm-Message-State: AO0yUKUFuBy+CehQU1yhNsCbQ3czuTNFoB6jZYGHpy8h4VcUs3c3rWHd
	uSzCXCoe1Eo8NC/f+6RzDXc=
X-Google-Smtp-Source: AK7set+ZbmQJCHkZwQdqkQ09wIlENUWsTGxnw1cGQ5bcfUHWp8xH4cTZdhcFaulc5u659K1TRqSfpw==
X-Received: by 2002:a17:902:d48e:b0:199:39ff:3b2d with SMTP id c14-20020a170902d48e00b0019939ff3b2dmr11166821plg.53.1675985642616;
        Thu, 09 Feb 2023 15:34:02 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id q9-20020a170902bd8900b0018099c9618esm2037601pls.231.2023.02.09.15.33.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Feb 2023 15:34:00 -0800 (PST)
Message-ID: <4c153c46-65bb-ecca-9d48-3dfb8f206264@gmail.com>
Date: Thu, 9 Feb 2023 15:33:56 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 05/12] net: ethernet: mtk_eth_soc: set MDIO bus clock
 frequency
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, netdev@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 Heiner Kallweit <hkallweit1@gmail.com>, Lorenzo Bianconi
 <lorenzo@kernel.org>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, DENG Qingfang <dqfext@gmail.com>,
 Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>,
 Vladimir Oltean <olteanv@gmail.com>, Andrew Lunn <andrew@lunn.ch>
Cc: Jianhui Zhao <zhaojh329@gmail.com>, =?UTF-8?Q?Bj=c3=b8rn_Mork?=
 <bjorn@mork.no>
References: <cover.1675984550.git.daniel@makrotopia.org>
 <af9646f282ccef7f1c6cc9884ec8264d605e3f66.1675984550.git.daniel@makrotopia.org>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <af9646f282ccef7f1c6cc9884ec8264d605e3f66.1675984550.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_153403_835746_3A245D0D 
X-CRM114-Status: UNSURE (   8.36  )
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

On 2/9/23 15:30, Daniel Golle wrote:
> Set MDIO bus clock frequency and allow setting a custom maximum
> frequency from device tree.
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Tested-by: Bjørn Mork <bjorn@mork.no>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian


