Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 047C2C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 17:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eJzkrQgSJLoh68CvGvp1JznAA6lKkLejE1Wur3zdskg=; b=V6bXMkWWkmZDgB0CY43YYBvmjV
	5zIdVIidVVVj53Hn8a1/nlM1ClOdnVKK8JZHAlEY+iPA8lnPO0wOsTmbfPr97yK5orjOSPXXA3vip
	GtoVmpHCCLyROPth6bQ/iV+nDww17zBHzuS4Z/kK2sU4vp1FDLDOhk4SgiNOfAposnLvOaBm40zFV
	0biZtghQur7hVkLXB7BIQ3Wgh8eC2nUObEdqXQKmrh7S1QNEeVmoXj5JlWAmtUv8hz+cyj5BMGhZP
	oCWBq91bKhpgyZZXmm/jolNtYqhV2UgNLNZmiArZqAvZWltJrsCNXOj/1qEuRvNOSmIgmzxQm6rVI
	fybQSM2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkqEb-00AqVZ-02;
	Fri, 07 Apr 2023 17:50:49 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkqEX-00AqUV-0n
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Apr 2023 17:50:47 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-24059dcdd90so126258a91.2
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Apr 2023 10:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680889843;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=eJzkrQgSJLoh68CvGvp1JznAA6lKkLejE1Wur3zdskg=;
        b=XH0UjXnkmfvcZqjTewbnJtcDWSFSJA41wC6V9r5Jriy4njsRmD3H27O3QYYV4AMbUm
         tXDMOylFQmjGVHAvVJDVThyrSJpCbK15BdyXAw/RTy3qqsHIR6h5GbuWp0D0RbsJJMyQ
         tYigUWAUK0wuJZ9Ln/RC6nNHR0Xc5/0j6baPRmmPBKLWI8mS58J1JBnQoFDh2fV6gAVB
         aCWwMbSzJaVd3dqKFSysqW62WCaXVoVFyPNeXhO/N8IkyefOB7epKgE0KjIbL9lO4E2A
         nOD8OiTN+7/mE4Ln7W/1Og55k8VV9viFgsgqrLPhDjnLlEirWNgizYb/4I63kiVYkSRp
         /wmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680889843;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eJzkrQgSJLoh68CvGvp1JznAA6lKkLejE1Wur3zdskg=;
        b=tlRq1bFnE/0hCq8DsmIDynv8RJc6nEfvL5bzgEjnF2YG3SpIRVMt8Ru1xjrODrG9Y2
         NEZ0mnbu3A/jbYIgX8esa17U3oboITV5oZKBzXZi9OpXvmwRPrclQkxbcAU9xBxg8v8j
         IZNfu2ks8Ou/TxceU+NC8WeCLqskZG0ZBio09M8v1dDkFPpUdiNo+epI5nQRL2kde95Q
         iYgFuuvPeCE6W1S9MGv0+wtFEi2MsbzymF3EjSpg5vd2PztvgHa4xbrgPU0zjbYpL0Md
         Bto0OBc2YJdWdn3UNCGpeS0MYj/ykzkvOfsAlxacH7B3xpvocFCJXv9wtCyaiDzKxs/o
         iWgQ==
X-Gm-Message-State: AAQBX9dX7BXz5yP17hBdY4ycAULwfcaHBRm96GOy1Tz8IrqD5fVO7Egr
	X0BtFdj/LdmATtiZ1r7PDCX2KA==
X-Google-Smtp-Source: AKy350aspk9YnMVy5hked+xx58M1c9hroC6snupKIoerfp0YWnXGXrL18Plz3ceLDw7pQ7fY4UQTgQ==
X-Received: by 2002:aa7:9ec4:0:b0:626:7c43:7cb8 with SMTP id r4-20020aa79ec4000000b006267c437cb8mr3003966pfq.20.1680889842767;
        Fri, 07 Apr 2023 10:50:42 -0700 (PDT)
Received: from localhost (63-228-113-140.tukw.qwest.net. [63.228.113.140])
        by smtp.gmail.com with ESMTPSA id e18-20020aa78c52000000b0062a474cd46asm3298198pfd.137.2023.04.07.10.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 10:50:42 -0700 (PDT)
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
Subject: Re: [PATCH v5 00/12] Improve the MT8365 SoC and EVK board support
In-Reply-To: <20230203-evk-board-support-v5-0-1883c1b405ad@baylibre.com>
References: <20230203-evk-board-support-v5-0-1883c1b405ad@baylibre.com>
Date: Fri, 07 Apr 2023 10:50:41 -0700
Message-ID: <7h355b1szy.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_105045_499186_11B49BCB 
X-CRM114-Status: UNSURE (   9.46  )
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

Alexandre Mergnat <amergnat@baylibre.com> writes:

> This commits are based on the Fabien Parent <fparent@baylibre.com> work.
>
> The purpose of this series is to add the following HWs / IPs support for
> the mt8365-evk board:
> - Watchdog
> - Power Management Integrated Circuit "PMIC" wrapper
> - MT6357 PMIC
> - MultiMediaCard "MMC" & Secure Digital "SD" controller
> - USB controller
> - Ethernet MAC controller
>
> Add CPU Freq & IDLE support for this board.

Tested-by: Kevin Hilman <khilman@baylibre.com>

Thanks for providing the branch with the dependencies.  With that, I
tested basic build & boot on mt8365-evk, and things are working as
expected.

I also enabled `CONFIG_USB_ETH=y` to test with USB ethernet gadget, and
was able use NFSroot, so that's working well also.

Kevin

