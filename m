Return-Path: <SRS0=BaWb=QE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3980C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 17:39:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 772AF61B93
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 17:39:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 772AF61B93
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tQZqu6KVctjy/ILALpnyvaGp30CkCyEmP8Iv6acPX+A=; b=eS3FmjQ5hYXlfg
	28PuYJWOuowRL//i5hp7+dCh3Qtw1cl7SO2g2UMcWOP5IWhe0kdlUr/BV+hgaN9nsTelBdEmiKxyU
	oEm1uARcqPsrrlyiELeHLEP5/S5kZV9vveVS1XGQ1YbBUNImEGiQFrwkkIZ7riPdO2oLDIBMClLQR
	hKfAbY50gDrXtUapjbYkL2ouzNPbOjf2qw89EeV/ZV4/66aB5VRz/sFfnJIG97oUppYsF9Awms8w2
	A47CLfbD4HuPu7M4PoV0RFpGPLudL8iVVVNG2I2S5Iie0XCE/0GmSwY4LMe6LDziS66ypSD4vMBMn
	7JyPCdTsYwuV25B8PPPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnOuM-005tFN-VC; Wed, 17 Nov 2021 17:39:43 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnOtV-005t16-KV; Wed, 17 Nov 2021 17:38:51 +0000
Received: by mail-wr1-x436.google.com with SMTP id c4so6191483wrd.9;
 Wed, 17 Nov 2021 09:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=hlapG0bGMUbnY0IcRNw2GRZiC2RrS20AwBZINoQ1tJI=;
 b=FlYJwh30onWWJi7PWGlWug9KmlF1oYb5LxQW9kZLQ6GndUsLfnUFNqF20a8yqe2qj2
 Kqsx4SNZ8T6QpgMyRQXEm/YkWoEaTX74pz0iDFhMhDaEYqwwTMvQpH3qZGbQnSfkeVto
 CU6XeM6O/zSG0Guh0ygESppvQ1WELJYjyoQ3j+9z4zK+mI772iZcjxebsKMPnShXxcXG
 GrI3/7bMP/mpaC6hYFL0eSB3LjRrjMtlntjymcWVMVZczWIJDPlyeSC0kmxyOxF0t9P4
 578lq0yKFVg/L2kY087vjoYMXbeCqF/5szuBJf5ii+zgFLuhxID5nHQbpLmvzGbHpxXV
 BGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hlapG0bGMUbnY0IcRNw2GRZiC2RrS20AwBZINoQ1tJI=;
 b=eT2KKtVApUHl7Pf/6c89/7EaB8pQvYU3AkmIJbck7cCWhu7LhCoMb2gbP3ueUHnDfd
 RVPrx7E8jg40n4LU/ZvFjka+i/hyb+fyNE5lsl3ZwHjg9NlmV3ayBIuXHBH0koIyx5iE
 KD+HyVJsaHE2dWdbz5eVS8OisvD/1Nu3g5DLiabFDSZ031iZU5CCALfR0Y6sgid4FIdu
 M7HZDpRwHKZArpH/4YWQ24xjSzDA9FcZJ43Km3JOMIvKMzIeevVAsVSmHkAqHKsjwz0W
 MSuopAWOO1nbFCkLnxNijTnN3NFw2gfPOnL6GZrmBsCyM2iPgEEoo6fy4KUXVBMUxvsy
 sXFg==
X-Gm-Message-State: AOAM532EGYXqN59Z1GSvRZL2k04BEYZpnY3SQF/CXgU6tFlcThrh4uX9
 oofy64Lm0FlKiw+vAPkTULY=
X-Google-Smtp-Source: ABdhPJz9P7PAxxJxRNPwbmIJF2yzDhzodKzDZn0xydOi7d/tAEMhYPpoY24kgJ6m5JiWQvvvjsWUrA==
X-Received: by 2002:a5d:530e:: with SMTP id e14mr22175831wrv.12.1637170727724; 
 Wed, 17 Nov 2021 09:38:47 -0800 (PST)
Received: from [192.168.0.18] (static-160-219-86-188.ipcom.comunitel.net.
 [188.86.219.160])
 by smtp.gmail.com with ESMTPSA id c16sm455341wrx.96.2021.11.17.09.38.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 09:38:47 -0800 (PST)
Message-ID: <3171bb96-21c7-c629-4833-27618d4b2551@gmail.com>
Date: Wed, 17 Nov 2021 18:38:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 1/7] arm64: dts: mt8183: jacuzzi: remove unused
 ddc-i2c-bus
Content-Language: en-US
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20211110063118.3412564-1-hsinyi@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20211110063118.3412564-1-hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_093849_748635_E036F1FB 
X-CRM114-Status: GOOD (  14.49  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 10/11/2021 07:31, Hsin-Yi Wang wrote:
> EDID is read from bridge, so the ddc-i2c-bus is unused.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>

Whole series now applied to v5.16-next/dts64

Thanks!

> ---
>   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> index d8826c82bcda29..8f7bf33f607da2 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> @@ -9,7 +9,6 @@ / {
>   	panel: panel {
>   		compatible = "auo,b116xw03";
>   		power-supply = <&pp3300_panel>;
> -		ddc-i2c-bus = <&i2c4>;
>   		backlight = <&backlight_lcd0>;
>   
>   		port {
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
