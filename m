Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 875E3C61D97
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Jan 2023 16:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ipNjMFDOfKGLfHyf1k1golbZwgkTbBlkE21IcQ2tRhA=; b=0O76XbSqQURJCr/nkqA4XUuZT8
	fBafH19aKLXYSP8qmsxSCkS2sMpFt9aELIVmHvaD9JpjT0YYu9HsUs3Wr0/zCApVLZAdJ3CdlJ1yZ
	uGMWldPQhvatUpt79u6yzNdaji2vtvbcreJXhpthQJbyYYi+LoRrxALfRuwxIuulpK0WoQkx3o+q8
	Zr4wiEqjZl0AjCnlrTIL2/FcvRLppXg7qTDou58xT+IT9vXMkb3KEeDGgcPZuGp4kOL24/gYjJdam
	+PEZCO/mB33e1qcgrozv/D4DjTAVc8fJMU4yrHJRkysjqN50qtlU/7IvpbLAfPbPWasE1+jg4A6Fo
	4buBTZFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMApK-001izU-JW; Sun, 29 Jan 2023 16:46:46 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMAp6-001iwX-BA; Sun, 29 Jan 2023 16:46:33 +0000
Received: by mail-ej1-x629.google.com with SMTP id ud5so25770131ejc.4;
        Sun, 29 Jan 2023 08:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ipNjMFDOfKGLfHyf1k1golbZwgkTbBlkE21IcQ2tRhA=;
        b=VcHpTdvwYeHSTBsKcMyw2IEfeHunmpFTD2YNYqRYPLipJVOB7zx3eTgVIhUksxZRMo
         2FRszn+Y5hqHpyu8wseSQwwoAjiAvNoVAOMl/kYhtes3kukIb4wuYziLLj/xyzPOqodr
         2i+ERpDojAzPmsLUqLtkDnE8WbMcNKT4mHkntLmGn24SdksMbWyjykLYx9x/k9VI3F0P
         ZWd1QSkP51uARWtsU/QzuaC+EdGFihX/EKbJLC9lj6lhdM67BcxGyjVd43qzFuGvzVv/
         0wADUw516+XebBZ0PalVS/kSG49S0fLEYV2JRs8e4DT1354pZTxxSJmlajCM5taVc3/g
         uvjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ipNjMFDOfKGLfHyf1k1golbZwgkTbBlkE21IcQ2tRhA=;
        b=J3Scr3K+uSr1dn54I0AIe6+gpWz/oINP7yM3jYfdGf85wS7vu0LYn7Sk3MT6hBSHOG
         SeyH5k7vw5+LOGg0TtpUBakc5OFuAdh8oOKOr5mOrmyGYGuzzQZ0xsSXp+N2vKUiFkCE
         jg5V5KZbatJsB478B4VIgOxryTJcfjsBF+u1q14C2Avqiix5WCVUcjVywmCQOfuKFj0U
         eOP+bbQyqhMnitErWp6n+vSit2QmXMeJjSgl+7NRIij6xUpjn1pmvAiFJA35mOgJcnTr
         O7n70JQ7Y18tIVpNC36MvSMrjYN3InSo97IYgN2RgvlimJFPeNq07nr2TJXOydzw6zzv
         RDxw==
X-Gm-Message-State: AO0yUKXUyRvH+ivnc0Ihsze7Fd4RaWicj81U5Ow12nE79+nc+h6Nusl7
	U8nFGTOIe0Z33NvIyequdsY=
X-Google-Smtp-Source: AK7set+cwaONDsO3l+ywOz/puIRUQg/y26+a+XYSIK4D93xEzD6pcdqrQ/2iZVHU282pyKUw53oiGg==
X-Received: by 2002:a17:907:2a94:b0:882:123d:eed with SMTP id fl20-20020a1709072a9400b00882123d0eedmr4605902ejc.51.1675010790032;
        Sun, 29 Jan 2023 08:46:30 -0800 (PST)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id kk4-20020a170907766400b0087943d525e1sm4695080ejc.215.2023.01.29.08.46.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Jan 2023 08:46:29 -0800 (PST)
Message-ID: <0a3ed159-1714-8982-6ca6-5e70bf1b7418@gmail.com>
Date: Sun, 29 Jan 2023 17:46:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v16 2/2] leds: flash: mt6370: Add MediaTek MT6370
 flashlight support
Content-Language: en-US
To: ChiaEn Wu <chiaen@richtek.com>, pavel@ucw.cz, lee@kernel.org,
 matthias.bgg@gmail.com, andriy.shevchenko@linux.intel.com
Cc: peterwu.pub@gmail.com, cy_huang@richtek.com, linux-leds@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, szunichen@gmail.com,
 Alice Chen <alice_chen@richtek.com>, ChiaEn Wu <chiaen_wu@richtek.com>
References: <cover.1673886245.git.chiaen_wu@richtek.com>
 <7a6ac0051789831a7a53c2f3b66010fc0f1e5395.1673886245.git.chiaen_wu@richtek.com>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <7a6ac0051789831a7a53c2f3b66010fc0f1e5395.1673886245.git.chiaen_wu@richtek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230129_084632_494127_1515A048 
X-CRM114-Status: GOOD (  10.33  )
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

Hi ChiaEn,

On 1/17/23 09:53, ChiaEn Wu wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> The MediaTek MT6370 is a highly-integrated smart power management IC,
> which includes a single cell Li-Ion/Li-Polymer switching battery
> charger, a USB Type-C & Power Delivery (PD) controller, dual Flash
> LED current sources, a RGB LED driver, a backlight WLED driver,
> a display bias driver and a general LDO for portable devices.
> 
> Add support for the MT6370 Flash LED driver. Flash LED in MT6370
> has 2 channels and support torch/strobe mode.
> 
> Co-developed-by: Alice Chen <alice_chen@richtek.com>
> Signed-off-by: Alice Chen <alice_chen@richtek.com>
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
> ---

Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

-- 
Best regards,
Jacek Anaszewski

