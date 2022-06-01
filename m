Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D689C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 10:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o7s34H+oDAlWc9h7fcBlRc4DB9pW2pvA1g6qe+6lVso=; b=oujE7J/EQbfKQw
	CXcqJ0VqOP97aHpeZnRBPF23lzfNCP0NQFNiMzC2x8cIXzyQkgj8g5on0fnKy2BHlZ7sl3wLtYsR3
	MdqhczZUuUiUJppzqxZXBvjjXEC5yr6KyrJhAq3oiCVrjjvXpKX5T6NQNu5n19PG2HTcWLF+LU19R
	8Hon3B2J65dJMvMN0BVeP5a0k6cCBCQbFcTWFEHOWL6qfwzkvhrDFNzqoMDXPAWS5tcTWBa56ixgk
	rxx/DLxfnMCn3zETUJUi2u1CcR+MHPmbKED0i813Pw22XFXrJVZmwxTpSk6IeAZxVdj6tEc3fFWhB
	eM/m6G89poneehOWdYxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwLer-00FKUN-Pd; Wed, 01 Jun 2022 10:32:57 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwLOS-00FDKj-2S
	for linux-mediatek@lists.infradead.org; Wed, 01 Jun 2022 10:16:01 +0000
Received: by mail-ed1-x52b.google.com with SMTP id h19so1534812edj.0
        for <linux-mediatek@lists.infradead.org>; Wed, 01 Jun 2022 03:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=l19XAZ4RQlB6J7TkjVOMmvipD7uiUl1NY4xv6/LugyI=;
        b=BtCIyFjN7SFARpIH1mnWAScPZAo/XJHoBZSi2HQQ7H83f88XfXLI/MeYvWG5YjOGez
         q8hrM8fnZplltFJ8MOqPvahGQWiFqMo+jgX0/eKYCSAlzbXiEOBkZ/Xs+9UJj3+dCAlR
         4+PnY1MSlS9esAdaRcE9nCR9J9JUnQ3jSYf97NA2Dw3NJ3I0WyGHJGJIEMdyqnOJ0H9E
         bXa4sJB7S/LusFzZBuAnmy8Z1k72D609NjRBnvVsityJqE+4PtcST5BiKZkMwEju4QCJ
         bLCtp5CXpJOQUQuceR7/5ipgBauLhhIZeuYEY6a/zfX/LzafUYE8w1vk3etCxbkkZhZn
         Rypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=l19XAZ4RQlB6J7TkjVOMmvipD7uiUl1NY4xv6/LugyI=;
        b=WWDQFQIx8Q0e4vWVwt+LCLC9V3cwd9uM/AzD0+o2WzGm7Btrn64PDoKgCxX/I6hYlL
         CAD9pz6wym1r/c9B5WhLIw2Jrf9vUNBaTGT3Wl3iE8a/9vp8SBnz8356JfKoKlCCJiFH
         x+ct6e9K2A5WBrrMErCz9/uFynvPRppaitf6k8FiNBGrOKFLPfA3mgHYj/rUGUcIsOi4
         /dXQhZYsIRU0vTi2zzOPbfvhuDJXW1vcxXZ8rvJzNvntFt87N+tyudqzs15/gixqBI5X
         Iua3Ld3HTKBFOUaTTwAFFi+vlshTPypfX6FrLyIfmipV14nrSA2zVzaFoxk5HK5Mlia7
         DJLA==
X-Gm-Message-State: AOAM531bCMbCNEg/4ruha01oJB7/SflhNMTC/sGHelFFbxys19BSRJ2i
	i9bAfcGZ/Vyv2QJabZTf4fpp9w==
X-Google-Smtp-Source: ABdhPJwqLQ4Ui6MtgBlrktb1cmqeGlIiI3nvKGpc3MDfpcX9j7W/cB4tKjt/uwhPk3xrWT+HZr/CNw==
X-Received: by 2002:a05:6402:4410:b0:427:ab6f:a39a with SMTP id y16-20020a056402441000b00427ab6fa39amr69619893eda.120.1654078558779;
        Wed, 01 Jun 2022 03:15:58 -0700 (PDT)
Received: from [192.168.0.179] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id l15-20020a17090615cf00b006f3ef214dd9sm534351ejd.63.2022.06.01.03.15.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jun 2022 03:15:58 -0700 (PDT)
Message-ID: <7f4c0956-7663-60fc-a603-fd40f0317a1b@linaro.org>
Date: Wed, 1 Jun 2022 12:15:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 15/17] arm64: dts: mediatek: add mt6357 device-tree
Content-Language: en-US
To: Fabien Parent <fparent@baylibre.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org, qii.wang@mediatek.com,
 matthias.bgg@gmail.com, jic23@kernel.org, chaotian.jing@mediatek.com,
 ulf.hansson@linaro.org, srinivas.kandagatla@linaro.org,
 chunfeng.yun@mediatek.com, broonie@kernel.org, wim@linux-watchdog.org,
 linux@roeck-us.net
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-iio@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-serial@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-watchdog@vger.kernel.org
References: <20220531135026.238475-1-fparent@baylibre.com>
 <20220531135026.238475-16-fparent@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220531135026.238475-16-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_031600_214255_23B47DF4 
X-CRM114-Status: GOOD (  10.47  )
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

On 31/05/2022 15:50, Fabien Parent wrote:
> Add device-tree for the MT6357 PMIC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt6357.dtsi | 272 +++++++++++++++++++++++
>  1 file changed, 272 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt6357.dtsi
> 
(...)

> +
> +		mt6357rtc: mt6357rtc {

Generic node names, so "rtc".

> +			compatible = "mediatek,mt6357-rtc",
> +				     "mediatek,mt6358-rtc";
> +		};
> +
> +		mt6357keys: mt6357keys {

Generic node names.

> +			compatible = "mediatek,mt6357-keys";
> +		};
> +	};
> +};


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
