Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E07C54E94
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Jan 2023 15:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yfWdzu6Jy0H8uDig3qe6ACmj2V9/h17QhbhZo7BKH7E=; b=gtW5z07vnhSGju
	RwRAIkhraZu20VPebtvvbmwf71w5VE/KPFE8rTpg1nS7NwHqCFy7lU4Rcb7Uug+yELATtYUODDPVv
	sh6vdsxDYyPOx/RIywde8ZEnPBeMsuZOR2ZY8QaBf3Jntzg0UV5EG1N3NO8VJU6mtBgcBa6wGOpfk
	3A99DMr/s4LPLPkw7FzY8mmwk67iVxgKj6L3r++nChubHF1rDXFASDOZFCstAWq8Jj6YVUM4rVPgY
	aVcZIfXA7LMyd8G9U25HVJ7GlnucCo/FIjlWHEYx5UGSWOqvnwEaM0vcI19L11iCl+LQl3+y/6Ibp
	APllyQVDpeEjOwXtFLsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKhJI-007hJE-59; Wed, 25 Jan 2023 15:03:36 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKhIs-007h5W-Oc; Wed, 25 Jan 2023 15:03:12 +0000
Received: by mail-wm1-x334.google.com with SMTP id q10-20020a1cf30a000000b003db0edfdb74so2646659wmq.1;
        Wed, 25 Jan 2023 07:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yfWdzu6Jy0H8uDig3qe6ACmj2V9/h17QhbhZo7BKH7E=;
        b=cI1mXGkJLYER/ZJi9t/+AHck3Yah8mGRVwZp0/76273lf7Ynm5xxqsS7JLt+BVVe3c
         HkxuSSvwpzr9LFsGhaVV/7NH2m2QjVyAA6V9fsfcQwDJ6yEEZhZ66HI3XtDDMX68RyGi
         YPuoU8hGgZBB6F02I2ZPRQzs9ngItsOztAa5TjqA+SQKfV0zLToxLL9hJwCbFSIRvkL4
         zM4t2VIrx3GANES2h2FcA06x/vezbKO6Wuj3CsIV1OFcClUarXruDzPgRnTv4oja67Vu
         ye3wGs1rGBFJtfsXUEAmis6nsuM06D48goC9uig9ecQR21/3ZUcYErW3OZgruBoCTTRa
         Dovw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yfWdzu6Jy0H8uDig3qe6ACmj2V9/h17QhbhZo7BKH7E=;
        b=ZshzN/jlQ7YwBgr059Ubrs43XOHBxKapg8J3FGT6cdJH3JzOzufP/WspYH2hjOhmZl
         KxFKx0AemAqHPa7e3CBxud142gzAbhNaK1EJ+LQQHdjr3FdIMA2nOHmeAxgzHIXZl04K
         2J+oNH7Bv5R2zr6d14MJMuDjYK4oaB5ERMRonCXR5VvpMeq05rlDbl8XJdodtxx+NvXI
         4agSBY+s9DjXFWLbMebdubF0Itk73bx4N9RZBwMnbzkRNjyr7oSr45sHatr0MQUyr+N0
         nmQwASgt0j0iMsi1mfb7mR6EeFvaJWi2a5NEk37yEAEO3xbfigvNjlH0Nb47yJqUK/Wg
         lN3w==
X-Gm-Message-State: AFqh2krj0Yemdo1vI3JOW4T+8imAg+GSjFcx6i+T9LkoJbzMevu0X5lm
	RsBOjnu1CAPtGc48PVrIYUk=
X-Google-Smtp-Source: AMrXdXvUC9/EK8F+PQGipzAvBuGEdz3EBeT7BdfudzdynpMsuxG8jwmJtal7UnZ8Wu187kmSSlYrXg==
X-Received: by 2002:a05:600c:54eb:b0:3da:2090:d404 with SMTP id jb11-20020a05600c54eb00b003da2090d404mr32457602wmb.18.1674658986986;
        Wed, 25 Jan 2023 07:03:06 -0800 (PST)
Received: from [192.168.1.135] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id f1-20020a7bc8c1000000b003c6bbe910fdsm2530943wml.9.2023.01.25.07.03.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 07:03:06 -0800 (PST)
Message-ID: <e6e91635-b8ce-787a-96e6-dd8b066f8c0a@gmail.com>
Date: Wed, 25 Jan 2023 16:03:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 0/5] arm: dts: mt7623: relocate gmacs, mt7530 switch, and
 mux phy
Content-Language: en-US
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230120205318.519493-1-arinc.unal@arinc9.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230120205318.519493-1-arinc.unal@arinc9.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_070310_832643_E8AE01D7 
X-CRM114-Status: GOOD (  19.85  )
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
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 20/01/2023 21:53, Arınç ÜNAL wrote:
> Yeia sou!
> 

γεια σας!

Whole series applied, thanks!

> I initially just wanted to submit the phy muxing patch for BPI-R2 but after
> looking around the bindings, I decided to do a bit of a cleanup.
> 
> The main takeaway of the cleanup is that the MT7530 switch is actually a
> part of the multi-chip module on the MT7623AI SoC. I'm moving the bindings
> for this switch to mt7623a.dtsi so they don't need to be defined on every
> device with this SoC. This should ease it up for supporting more devices
> with MT7623AI SoC on mainline.
> 
> I don't know if there's a pin wired for interrupt. The switch is going to
> work with polling for the time being. Folks from MediaTek, feel free to
> fill me in on this.
> 
> I've tested phy muxing on my BPI-R2. DTs compile fine.
> 
> Arınç ÜNAL (5):
>    arm: dts: mt7623: add gmacs to mt7623.dtsi
>    arm: dts: mt7623: add mt7530 switch to mt7623a.dtsi
>    arm: dts: mt7623: change mt7530 switch address
>    arm: dts: mt7623: mux phy0 on Bananapi BPI-R2
>    arm: dts: mt7623: enable flow control on port@6
> 
>   arch/arm/boot/dts/mt7623.dtsi                 | 14 ++++
>   arch/arm/boot/dts/mt7623a-rfb-emmc.dts        | 86 ++++++----------------
>   arch/arm/boot/dts/mt7623a-rfb-nand.dts        | 86 ++++++----------------
>   arch/arm/boot/dts/mt7623a.dtsi                | 74 +++++++++++++++++++
>   arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts | 22 +++---
>   arch/arm/boot/dts/mt7623n-rfb-emmc.dts        | 13 ++--
>   6 files changed, 147 insertions(+), 148 deletions(-)
> 
> 

