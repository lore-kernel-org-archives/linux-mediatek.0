Return-Path: <SRS0=9jr7=I3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5A4BC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 19:28:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 774FD61981
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 19:28:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 774FD61981
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RKML3K85Bj2oHw5Tl7xiVUlfVTZEDX1jdgiI6bSx78M=; b=endYgPzLWa8ixeZTtAgyzdaeR
	H8aMr15cBzdKnd6uuy7omvp3/WY6RaY9SfWW28pvWbPEhz9Rm5gs2Q/HFbI9keUeSFRy1AM2XVNH4
	R4ZfGtTsDf8M7iJF0sPKOd6mO06Hbq3Ro1ySlCsnGUq5S7gcK8TA3krngv72rpBRWjgWEfTj88fae
	aCTxNmd3pAx7OljECnjyHSw26jkJ0ZUFwpGxK3hKaPDtFnI4E9/KMsiImBWk8Sfc9oyWCLQF0xVze
	W6F2IEMuz28UzK9jOoQVN24ylLfjEutxtvFznaY2ZOfWOwsmTMYNYjigAVUDGgUfRUUfZ9RlUfwn/
	ZbDEIlXBw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQxYG-001FBs-KJ; Mon, 29 Mar 2021 19:27:52 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQqS1-000d2I-Rv; Mon, 29 Mar 2021 11:52:59 +0000
Received: by mail-wr1-x429.google.com with SMTP id v11so12528429wro.7;
 Mon, 29 Mar 2021 04:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rLsjhcNIwCmODv/MBaqanwexjHXK2SK1mKLiMmip+x4=;
 b=obVQCkr8uCkYLUv2yZfq8PuHxS3ElI8SIHyQRK2mmjbLl/TugiURrhBXWJw+5UFo4X
 qI0nOMkSDuhXVZ7doMZd5LSiKTnqoA5gIcywuw9Ke6UjEuevL2XtT5DhpiGaMfO+9OxZ
 HZSJXLF7qf2iv72kc0kxMyTMfam4e6n7dxSqNbzVJwaF4WzVuFHUFKz1k7uSQ9TuIdj7
 dl63qYplwjTtkATlI4Nu0LquEeOrQALCMslTOalYH2hwG0yJyblAk27PDzr3R9m48px8
 pQCfhmN3IJ56MM4ffdEfudrTzuZgmv7+jM9Vd1eJOxvnRk/asB1vc/w5IZunkmcftpRw
 4yrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rLsjhcNIwCmODv/MBaqanwexjHXK2SK1mKLiMmip+x4=;
 b=YZfbHarEW3WNndiPjhqB3MEVNZF+Yw219v4peAHhjlaVjYEsvoVuVFvWfj/usZ1ase
 YFxNuSm/RfHSlwBs5b4Uu/VpEm1SZ/b1ArVGibu2qqaLAs03u+SvMRbSxfF84JFVqdYg
 1ZlYgQjN4KjZKXYmC8O1ExJO0FviG6jc9Sk+ayYHL4KEuIV7QgephUy08HM3v8EG0iWq
 XOKZcNV1e17d4JP/6Y+Sc9rK9F4W68TjWOIoOFOZjwhc0e69iYnI3E0gwwsL8vi1jUs/
 93lpzSt9zKncBgA8xEI01kU0TSO+QMLhrTXlPEfmZCIV1SgSDhCIT7aaxuNOnIplPsBG
 dPAA==
X-Gm-Message-State: AOAM5333zzRuzmtZAs82doyJG2YyBISReURIIWgw0BCn11w4PpzpCcIi
 CjDmg4ZxBR6Eo0OyTtq8uCU=
X-Google-Smtp-Source: ABdhPJzbEfFbXJ9fbqn8X3nAKteEObCciLIv/SGMQ5u1ubGJRiRxl62orHY58t646W11wQ7rTr7+rw==
X-Received: by 2002:adf:d1cd:: with SMTP id b13mr27974972wrd.47.1617018777293; 
 Mon, 29 Mar 2021 04:52:57 -0700 (PDT)
Received: from ziggy.stardust (80.174.240.175.dyn.user.ono.com.
 [80.174.240.175])
 by smtp.gmail.com with ESMTPSA id u17sm29691663wrw.51.2021.03.29.04.52.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Mar 2021 04:52:56 -0700 (PDT)
Subject: Re: [PATCH v2 1/8] dt-bindings: timer: Add compatible for Mediatek
 MT8195
To: Seiya Wang <seiya.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen
 <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fabien Parent <fparent@baylibre.com>,
 Sean Wang <sean.wang@mediatek.com>, Zhiyong Tao <zhiyong.tao@mediatek.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Wenbin Mei <wenbin.mei@mediatek.com>, Stanley Chu
 <stanley.chu@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-serial@vger.kernel.org,
 linux-watchdog@vger.kernel.org, srv_heupstream@mediatek.com
References: <20210319023427.16711-1-seiya.wang@mediatek.com>
 <20210319023427.16711-3-seiya.wang@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <bf7ad31e-974a-3e0a-12bd-32973c7c3cbd@gmail.com>
Date: Mon, 29 Mar 2021 13:52:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210319023427.16711-3-seiya.wang@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_125258_177043_F0719029 
X-CRM114-Status: GOOD (  16.50  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 19/03/2021 03:34, Seiya Wang wrote:
> This commit adds dt-binding documentation of timer for Mediatek MT8195 SoC
> Platform.
> 
> Signed-off-by: Seiya Wang <seiya.wang@mediatek.com>

Applied to v5.12-next/dts64

Thanks!

> ---
>  Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
> index 690a9c0966ac..e5c57d6e0186 100644
> --- a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
> +++ b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
> @@ -23,6 +23,7 @@ Required properties:
>  	For those SoCs that use SYST
>  	* "mediatek,mt8183-timer" for MT8183 compatible timers (SYST)
>  	* "mediatek,mt8192-timer" for MT8192 compatible timers (SYST)
> +	* "mediatek,mt8195-timer" for MT8195 compatible timers (SYST)
>  	* "mediatek,mt7629-timer" for MT7629 compatible timers (SYST)
>  	* "mediatek,mt6765-timer" for MT6765 and all above compatible timers (SYST)
>  
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
