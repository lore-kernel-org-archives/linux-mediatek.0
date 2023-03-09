Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ECB4C64EC4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 10:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AXe5GLVgfCGpsOd/5Hq05tqMS28XNylXrDvLRZzzBYk=; b=r4MwK46usoGECk2n6P4h2GpWM1
	DVFbpMgeguA2+7+OKc82fiaLCIyGnwBzu4hyh5aJgKFLKcwZcxpQr0w/O3BMdaqP8YnSmkStYpR7D
	CP2ztA4MwSXaQzt6aTGVDWlpP7Ygww2pa9zmH6JJWRHMR6gol9edG54VWBc9sq3UMOPvLlcya8sg5
	NSXXf9jd43F7saSuxp05WxLetJRT0sKTJolhZeM7p7t/3W+YcLeq5Cs+k0BPCIgVaNy6hJ2yzx8eg
	oAkm2aN8pw2pTt7HBlzrldqFd/TjXOrbewup695vyI1hwidd6VEo1W3k0TSbRXdVWBb31CRb8e124
	t94Ay6nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paDl0-009ApH-RL; Thu, 09 Mar 2023 10:44:22 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paDjN-0099ae-Gm
	for linux-mediatek@lists.infradead.org; Thu, 09 Mar 2023 10:42:43 +0000
Received: by mail-wr1-x42d.google.com with SMTP id q16so1392010wrw.2
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Mar 2023 02:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678358559;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AXe5GLVgfCGpsOd/5Hq05tqMS28XNylXrDvLRZzzBYk=;
        b=nBr8nAd36m9PAaXhfYM/4OLaddFdsGqVE33IkJXe836CVY1mwrMaJ0z6xZBf96qoOI
         wHtu0PFtoKoyIzX+VPr+/fuzdwvpjf7WHn48t+f9zcU6YwYZWztwBuqGj7l0dwdbArgj
         9BdJxnMMnENBMqvEWmtN9PjHCRl7l2YExcQXYKyBbziRvao/CePqrt7EvP4HpVtto5VH
         QXi3YjTFTii/7goIfJr/GTdt68ovUVdmBOWoUiiz0gXw5VAu3RMa5w0b1gBU8OSuUqb4
         AEtkZbqFYD4W0WJ0d3IiA/1XF2s9Fl82n7X/PtjFCiLZRgjUzj9Q13c24vjHb1a/yAmF
         vQrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678358559;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AXe5GLVgfCGpsOd/5Hq05tqMS28XNylXrDvLRZzzBYk=;
        b=c/mTv9zwT5YvUtMcmk2SK89Z6DqdauSMLnWX81kIp5o4SG/NtG446baZ0qk1Z0/f9Z
         q4FX3OdStYHnHlIRE4kstgN/vg+X6/bLTbE+Pn+xcLbwBkKesGVgGLTSUmSGitAwh251
         Sj6LhQkRnlFM1F9QTxcLD92vlDWC4z3MyuU3D9U8NQpD0l4ttdLnQv7EHl+YhOOOfUnO
         HOb/lBWfGj3TfGNAH2C/IdUixTmRdUYAbDwyNVt28IT8++Uz1XI5g3zQzwmP1ly+AnGS
         kEzrSkcx3lKtohQane2bBpiwHHHTgHYuKRcUuoROwiQBOVwhoLyNdcsLj3dO3mAJPSjx
         Mq0A==
X-Gm-Message-State: AO0yUKUumyKo0bY4+As/ZZVx+vaP5c+BUCMN7hP/DB7zCYIe7AlRHaMf
	faYuCKjFnxEq7KEXRdZnW3ITyg==
X-Google-Smtp-Source: AK7set9TX+g8GQa3ZvYm7K5IyQckLiVBKmzBF9eqRJS1rvlystpDX78yR8o1b1wUu4lOee+V+S+WMQ==
X-Received: by 2002:a05:6000:507:b0:2c5:4f2d:d9b4 with SMTP id a7-20020a056000050700b002c54f2dd9b4mr12687108wrf.58.1678358559301;
        Thu, 09 Mar 2023 02:42:39 -0800 (PST)
Received: from [192.168.0.173] ([79.115.63.78])
        by smtp.gmail.com with ESMTPSA id f12-20020a5d58ec000000b002c71b4d476asm17579951wrd.106.2023.03.09.02.42.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Mar 2023 02:42:38 -0800 (PST)
Message-ID: <1849e2c8-54f5-9e56-4ed8-8b0e4a826d04@linaro.org>
Date: Thu, 9 Mar 2023 12:42:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] spi: Replace `dummy.nbytes` with `dummy.ncycles`
To: Michael Walle <michael@walle.cc>
Cc: Serge Semin <fancer.lancer@gmail.com>, Sergiu.Moga@microchip.com,
 Mark Brown <broonie@kernel.org>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Pratyush Yadav <pratyush@kernel.org>,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com,
 Claudiu.Beznea@microchip.com, chin-ting_kuo@aspeedtech.com, clg@kaod.org,
 joel@jms.id.au, andrew@aj.id.au, kdasu.kdev@gmail.com, han.xu@nxp.com,
 john.garry@huawei.com, matthias.bgg@gmail.com, avifishman70@gmail.com,
 tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
 yuenn@google.com, benjaminfair@google.com, haibo.chen@nxp.com,
 yogeshgaur.83@gmail.com, heiko@sntech.de, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, michal.simek@xilinx.com,
 bcm-kernel-feedback-list@broadcom.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
References: <20220911174551.653599-1-sergiu.moga@microchip.com>
 <20220925220304.buk3yuqoh6vszfci@mobilestation>
 <18e6e8a8-6412-7e31-21e0-6becd4400ac1@microchip.com>
 <20220926172454.kbpzck7med5bopre@mobilestation>
 <1766f6ef-d9d8-04f7-a6bf-0ea6bc0b3d23@linaro.org>
 <f647e713a65f5d3f0f2e3af95c4d0a89@walle.cc>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Content-Language: en-US
In-Reply-To: <f647e713a65f5d3f0f2e3af95c4d0a89@walle.cc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_024241_612568_E6724A02 
X-CRM114-Status: GOOD (  16.70  )
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



On 09.03.2023 10:38, Michael Walle wrote:
>> In an ideal world, where both the controller and the device talk about
>> dummy number of cycles, I would agree with you, buswidth and dtr should
>> not be relevant for the number of dummy cycles. But it seems that there
>> are old controllers (e.g. spi-hisi-sfc-v3xx.c, spi-mt65xx.c, spi-mxic.c)
>> that support buswidths > 1 and work only with dummy nbytes, they are not
>> capable of specifying a smaller granularity (ncycles). Thus the older
>> controllers would have to convert the dummy ncycles to dummy nbytes.
>> Since mixed transfer modes are a thing (see jesd251, it talks about
>> 4S-4D-4D), where single transfer mode (S) can be mixed with double
>> transfer mode (D) for a command, the controller would have to guess the
>> buswidth and dtr of the dummy. Shall they replicate the buswidth and dtr
>> of the address or of the data? There's no rule for that.
> 
> But in the end that doesn't matter because they are just dummy clock
> cycles and the mode will only affect the data/address/command. Therefore,
> the controller is free to choose the mode that suits it best.
>  > But that begs the question, is ncycles in regard to DTR or SDR? That is,
> are you counting just one type of edges or both the falling and rising
> edges. The smallest granularity would be ncycles in regard of DTR. To me,
> it's not obvious what the SEMPER Nano Flash [1] uses. I'd say we choose
> the smallest granularty in spi-mem to be future proof and maybe provide
> some spi-mem helper to help setting the cycles for SDR/DTR. As an example,
> if you want to wait 4 cycles in SDR you'd have ncycles=8 in spi-mem.
> 

No, we can't invent our own measuring units. We have cycles and half 
cycles (regardless of the transfer mode used (STR, DTR)).

> So you won't need the mode nor the dtr property.
> 
> -michael
> 
> [1] 
> https://www.infineon.com/dgdl/Infineon-S25FS256T_256Mb_SEMPER_Nano_Flash_Quad_SPI_1.8V-DataSheet-v01_00-EN.pdf?fileId=8ac78c8c80027ecd0180740c5a46707a

