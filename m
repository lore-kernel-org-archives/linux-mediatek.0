Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B983C6FD18
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Mar 2023 00:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/f6kuz/aoEQ4OdZFUZeQhJ2qbcXsJoCNBezisNQzSyA=; b=lbSFMjYuEpRHTytpiUWc1QiGvA
	FOamKuO7aensUUlSLHnYvEByF9/NX7nbPfFOsa9QQkpet9pLs7FkmRlo2ygXIlamKSEtghnIXAe8B
	HLc3VUmxM44tomZDSGncY1naZY8VgcbqYmfLXjZVsM8xhguxA3t+nmayVh2fdGmkmDihxdUTCQiF2
	cqAv+k8+Dgr/L8Hle303X+5WOGW+m81fo4lua3JR5rCnvgWcpkNI0Tm8Hwt4j8ArjKYlTHo+oHn4D
	DdTxEyvEcVb9R/ukenFahJHYcNenE/IjiM+YxZLrTKyDtE1mBEq0GZdRHBpQ0nKIcB2tap0JaALQL
	NgUsqBxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phfrH-0027eQ-1F;
	Thu, 30 Mar 2023 00:09:39 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phfrD-0027cM-2T
	for linux-mediatek@lists.infradead.org;
	Thu, 30 Mar 2023 00:09:37 +0000
Received: by mail-pg1-x536.google.com with SMTP id d8so10346606pgm.3
        for <linux-mediatek@lists.infradead.org>; Wed, 29 Mar 2023 17:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680134971;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/f6kuz/aoEQ4OdZFUZeQhJ2qbcXsJoCNBezisNQzSyA=;
        b=5Kg0RdKhyt1ID55+N/2TYj6ASuDLlE9kRuP0jfiHD4WW7DHikuXWKM2Wa7enwDIIr2
         gHlkiUBISnQXA9MZiTvb2L7nCORsEoGs6XoF+wsbiSQtLp/7J6DseD+18SbWFxpI4biV
         hQqxeFg7tKw1YsyWeuU8P/xbxdpa4pmuQPIoHXo3alTyYmN6tUAtJ7Xt8GHhts7ujCmH
         nmucmTfbtQPVS1TZsAvug12n2oGmAGh4M7rY4dAn9wuJiBRL/PWq59a3lMLkVvET/tI6
         1/jqnqK85F1+ixeZDTcYh4MwV0DmzPcq1a9gFhhYTKq6jpWEoILS9qgt94YioVUj+1wr
         w+fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680134971;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/f6kuz/aoEQ4OdZFUZeQhJ2qbcXsJoCNBezisNQzSyA=;
        b=A1kptmWCJNkKkf6/L/3Zh6HPZVzc06bhlnlCOTmBCKO5TcIBIoeTKRhOCwpU7WRgIf
         p7lQm/No7ilOJt3twLRQG5EZUybcuNIye50nzGktPYCZq5kFo/Y6uL3ZM1c3NISbg6AU
         MnYrZHe+HRORTuEbT4RpO6dQXeK81ENsbduC2mESRfHib+HvLFge8EI+rXFTkRbmIfEi
         eX+ZT/ycegiAzh6BxCAJKltvRHgtD3KI6EtHQRg3GWbHatbWCu1p5WZA9nnt3cRXtUmp
         a22++n5c+nPX3+GKZNAWTEOZ1A9R7iu50LNXfYh7BCozf2c93TFE1/KiwCiZxrgbqeRo
         az3Q==
X-Gm-Message-State: AAQBX9fBBrpRyVhp7HzWiVplAH0QmbFm8s11t79UYlfXwfmHDfc60SA4
	Tx+1I6aZ+7FI9h4LzxdPCoL3fg==
X-Google-Smtp-Source: AKy350ZqpWfQPvqSLpocQ8IdxE8V92Qac7/wDI/66IsLf2Y5AbMcbw++dG5+dtf9jgtCifCda5nNOg==
X-Received: by 2002:a62:1885:0:b0:623:d058:8661 with SMTP id 127-20020a621885000000b00623d0588661mr17961473pfy.28.1680134971465;
        Wed, 29 Mar 2023 17:09:31 -0700 (PDT)
Received: from localhost (63-228-113-140.tukw.qwest.net. [63.228.113.140])
        by smtp.gmail.com with ESMTPSA id p14-20020a62ab0e000000b0062505afff9fsm23574889pff.126.2023.03.29.17.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 17:09:30 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Alexandre Mergnat <amergnat@baylibre.com>, Wim Van Sebroeck
 <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Chaotian Jing
 <chaotian.jing@mediatek.com>, Ulf Hansson <ulf.hansson@linaro.org>, Wenbin
 Mei <wenbin.mei@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>, Bernhard =?utf-8?Q?Rosenkr=C3=A4n?=
 =?utf-8?Q?zer?=
 <bero@baylibre.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
 linux-gpio@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>,
 Fabien Parent <fparent@baylibre.com>, Amjad Ouled-Ameur
 <aouledameur@baylibre.com>, Alexandre Mergnat <amergnat@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 00/17] Improve the MT8365 SoC and EVK board support
In-Reply-To: <20230203-evk-board-support-v3-0-0003e80e0095@baylibre.com>
References: <20230203-evk-board-support-v3-0-0003e80e0095@baylibre.com>
Date: Wed, 29 Mar 2023 17:09:30 -0700
Message-ID: <7h8rffyu9x.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_170936_027166_921EBBEE 
X-CRM114-Status: GOOD (  13.67  )
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

Alexandre Mergnat <amergnat@baylibre.com> writes:

> This commits are based on the Fabien Parent <fparent@baylibre.com> work.
>
> The purpose of this series is to add the following HWs / IPs support for
> the mt8365-evk board:
> - Watchdog
> - Power Management Integrated Circuit "PMIC" wrapper
>   - MT6357 PMIC
> - MultiMediaCard "MMC" & Secure Digital "SD" controller
> - USB controller
> - Ethernet MAC controller
>
> Add CPU Freq & IDLE support for this board.
>
> This series depends to another one which add support for MT8365 SoC and
> EVK board [1].

It seems to depend on more than that series.  In order to test this, I
tried applying this series on top of Bero's minimal support (now in
linux-next), and it does not apply cleanly.

Could you please list all the dependencies that are not yet upstream.

Thanks,

Kevin

