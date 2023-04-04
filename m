Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08EFBC761A6
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Apr 2023 14:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H9uYwVcXo7cBUUBOTLZ2J2lrgVJ/xfkFZclj3HBehK8=; b=YVmwB22yQjHufsflTjl6j2QxkR
	ke0iDKyXEIEKIS/Lvz00h9pNcWObXnOtMwEHO78OBy45otjubsWuXrilxtqBcaGXs5HIBkIMFA/8d
	4JImo2qgYFpkdTsJKiidineylm0cd4GUROcKKUFeI4hyIrwIonValXT9MyBljMig3bw+/yVeM4JYS
	LMPEv3ntTfy6UFHgE2YNU7OrZpuKgqpWDUdfvaH5k9wJIu6mucxgiFk4NDS5FXGbAAOWD1doP7CPN
	zceGXCAFbeatLHnm4HpurXdmeErL4ZM/VsV46l3pam1afI3PU3NVK60E09enA0I8BjazjKkd67fa3
	0U+XIjpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pji6t-001uQh-37;
	Tue, 04 Apr 2023 14:58:11 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pji6o-001uMI-11
	for linux-mediatek@lists.infradead.org;
	Tue, 04 Apr 2023 14:58:08 +0000
Received: by mail-pl1-x631.google.com with SMTP id f22so27410952plr.0
        for <linux-mediatek@lists.infradead.org>; Tue, 04 Apr 2023 07:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680620283;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=H9uYwVcXo7cBUUBOTLZ2J2lrgVJ/xfkFZclj3HBehK8=;
        b=UAETlx+9wQOEYw9NkD5esQ22zJR9CYzlPJFuuru/zG8A7bcoHUo5CXJ9VMeQYHfVj4
         a6KAda1lEkoabUz13lUVXFC0HOTYZxNrY28ZtkJwknBw2NpS4RPwtznfSXXUrdnZI0T7
         QmwkjqpQrUKWOZC3HtGUeObmFnSzFFtkmfJSqhp40MV8d2URnW6nb/8H83pnqsLUpNCo
         9E4Ebl0P7KOXfKbvh46S7fB2ewb8ceCDSz600lMgQ4Jr1IKVVBcoP4jovOaIi2xfINbo
         ZiZlIOrHGJNGygni7UnfXlF+ipe0cAdJEAT54EvufshEYUUh8gD6sHYaV/jSusLemeot
         wXHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680620283;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H9uYwVcXo7cBUUBOTLZ2J2lrgVJ/xfkFZclj3HBehK8=;
        b=LHdw7pfQIyYtYRQB6ht6PS5xeJSmmBMyhQDttx3bBFFXn4Hjg8mPm0U+NhRgiPFbhu
         0xx6XkIfgNoRkWOm5VkeX7+lEX/WYP7HhXfj6+gr5lexmV5HWfFieMn4JeEbDf9WfQI/
         ZNMFUvTx2RhSfldgNO4swybDj2c4Ihv7VWqKhst0t2HThew/HmABIAE8VulalDCdFyiA
         2gWJ2AhoQ9kuLjEeii7eSdmC2GMEP0Ii5Qy1i6QKUElQgxLEs9D4Ey0vng2uUhp+1oC3
         nwiOnsoJ/x9uzVob+gEiNx6DTOKrC9pDl3SGNs2rwMDYlxjyymmDwqC2yQXdyDJBbOzp
         NF7w==
X-Gm-Message-State: AAQBX9cMTbe7/yun4JKTKn8K7jP4Fg87s/VGeSUHTl9A6kCTtT+VXy6q
	xTczrzq2yWfWns99+3qJuDO46w==
X-Google-Smtp-Source: AKy350YdY2blg+WDMTITRqonrmBC853Tqawrwror3LCdLvv5uZ3X8E8eImt5a/UgDnCMC9oeW3hnfg==
X-Received: by 2002:a17:902:ec92:b0:1a2:87a2:c91a with SMTP id x18-20020a170902ec9200b001a287a2c91amr3262702plg.34.1680620283196;
        Tue, 04 Apr 2023 07:58:03 -0700 (PDT)
Received: from localhost (63-228-113-140.tukw.qwest.net. [63.228.113.140])
        by smtp.gmail.com with ESMTPSA id k17-20020a170902761100b0019ef86c2574sm8381272pll.270.2023.04.04.07.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 07:58:02 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Chaotian Jing
 <chaotian.jing@mediatek.com>, Ulf Hansson <ulf.hansson@linaro.org>, Wenbin
 Mei <wenbin.mei@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>, Bernhard =?utf-8?Q?Rosenkr=C3=A4n?=
 =?utf-8?Q?zer?=
 <bero@baylibre.com>, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org, Alexandre Bailon
 <abailon@baylibre.com>, Fabien Parent <fparent@baylibre.com>, Amjad
 Ouled-Ameur <aouledameur@baylibre.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 00/11] Improve the MT8365 SoC and EVK board support
In-Reply-To: <7h1ql0y0j7.fsf@baylibre.com>
References: <20230203-evk-board-support-v4-0-5cffe66a38c0@baylibre.com>
 <7hy1ncydtc.fsf@baylibre.com>
 <CAFGrd9rKy9a4bUf1dkUtTogtWPFr5eu3jcsdaixi3hs_dWMwrg@mail.gmail.com>
 <CAFGrd9qLzcDJO_Fk_-B6XYuuxQzQoYLXmdp0Qj1Tszr0-sqNgw@mail.gmail.com>
 <7h1ql0y0j7.fsf@baylibre.com>
Date: Tue, 04 Apr 2023 07:58:01 -0700
Message-ID: <7hy1n7wv7q.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_075806_579582_03A6DB71 
X-CRM114-Status: UNSURE (   8.23  )
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

Kevin Hilman <khilman@baylibre.com> writes:

> Alexandre Mergnat <amergnat@baylibre.com> writes:
>
>> Here a build-able & working branch with dependencies:
>> https://gitlab.baylibre.com/baylibre/mediatek/bsp/linux/-/commits/amergnat/i350-evk-board-support
>
> This branch doesn't compile.

I'm wrong, it compiles fine.  I was on the wrong branch.

Sorry for the noise,

Kevin

