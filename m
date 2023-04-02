Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB68CC7619A
	for <linux-mediatek@archiver.kernel.org>; Sun,  2 Apr 2023 17:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/vbuti5krowtrunNTliRTFxJEP25/MzDnPfiiGQsdeo=; b=nEeWS8zb3NV6l2p+DWi5vLTdJK
	E+ZzAoEOqAeco8fMcUUzV6ecXXBjyL1JPIctxQVsc9T5zHEPIVGWb7mQy4hX7F4BcTHUG+LAm8kmE
	B+45a9MGSXRUXihZigVa28Hia8/Ke8lI0sRIQwoi6G5VJQ1UVO+GPqP3csvIiBJlxyF+Z1x8L3Po2
	u0UpKbbfANDGZDJ8hiD2rm1FJcnlbTKiKE2WzJ9QnDrUeDC3VH31+IfeowMzKhRX+u/pIfqFdA4Pu
	LasH66ZeT0VJX7vf7XHjYdvMvOUcsPSsx/8Jx3QP4PZcwe1kOQ/9bpZI0t1jqV4cq4zYNJP64x194
	vJZ+ZqjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pj1TG-00CvK6-0x;
	Sun, 02 Apr 2023 17:26:26 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pj1TC-00CvJ4-2r;
	Sun, 02 Apr 2023 17:26:24 +0000
Received: by mail-wm1-x333.google.com with SMTP id l15-20020a05600c4f0f00b003ef6d684102so13078030wmq.3;
        Sun, 02 Apr 2023 10:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680456381;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/vbuti5krowtrunNTliRTFxJEP25/MzDnPfiiGQsdeo=;
        b=J8pksCugxMr7bNtJ0/qlJ10Lptx3EC19lN5z0s2GXmprRrIdmcWo1XMFCfUn7NJ14z
         q++BYaehv+imhuaKg5o+SmZ5oX5gOtxhjWoX0ed0jSwWohiQIBtn2v6+eo1CQclstfNK
         I1KthpbxHxvg222LwDWep11UAaY8FQ3g9ytU/50M5oO51DrrVlYc3K5yQ+jQ9goyYIGc
         y6yC8D68mPCkirbDK87ugI7LDhxCk9bD4CW38wdiP17sEedkMdp8rfqhdgV2k4dpLzTt
         Jp9EheRPAm3LT80wLYfZ47azt2yNF2VvGNJVZVeRQz/wO4twCX7ro3bbEOQ3gR/vcsw+
         E7qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680456381;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/vbuti5krowtrunNTliRTFxJEP25/MzDnPfiiGQsdeo=;
        b=jQDAmciwxV4NkkmeBYG1phWSi/FQ4eO3w0+GgcUeuGtUcF8L2eC3hI5WU3ikxeqxQw
         jG5NBLZBAb9c+ZTaFrt3U11NLyCBBDCTtbEZzN/N2syb/3fnXWkkxkb3Iab+P0by+Y9Y
         KGVr1t1vHnqjDTmCvGh4bLHZHnRMyIRNzVRV0qQGTzqDC90hp4Yzy7hAGNmsvWBuhWNX
         ZKAEelMRARUB5ZYX22pejHjmWenV2pvQh9/gCJkwoI6VjTih3zXjoEJJ5gfi2z4wE/45
         PgFg6hFsDCHdlVjlR3hYuHYR01h4CKmojRdYKJpjPUK48k4NiDKwccW6j3i3Cl61LQ0I
         L3Ng==
X-Gm-Message-State: AAQBX9dsnj8PY12hbQIhQu0KhhjJQbB1+ur66MGmqiAh2QlRiVlRMEia
	VdNRm0WbtQ9gzsyjaKqFZ+Y=
X-Google-Smtp-Source: AKy350YkZU0wUME6kjYWBKsiN+B6Bd5JavScpbV6FA4h3HrYDvcxwr2Qsm/WheupkAVb02tDYveAgg==
X-Received: by 2002:a05:600c:2144:b0:3ef:6396:d9b3 with SMTP id v4-20020a05600c214400b003ef6396d9b3mr21145158wml.18.1680456381192;
        Sun, 02 Apr 2023 10:26:21 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id h14-20020adffd4e000000b002c71a32394dsm7659691wrs.64.2023.04.02.10.26.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Apr 2023 10:26:20 -0700 (PDT)
Message-ID: <77528d8d-29f3-9bae-33f3-3296c9c8b0b1@gmail.com>
Date: Sun, 2 Apr 2023 19:26:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 00/17] MT6795 Helio X10 and Sony Xperia M5: DT step 2!
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: qii.wang@mediatek.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, jassisinghbrar@gmail.com,
 houlong.wei@mediatek.com, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20230327083647.22017-1-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230327083647.22017-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230402_102622_969329_7C7C0489 
X-CRM114-Status: GOOD (  20.02  )
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



On 27/03/2023 10:36, AngeloGioacchino Del Regno wrote:
> Changes in v2:
>   - Squashed the addition of mediatek,mt6795-gce.h header with the
>     commit adding the MT6795 GCE compatible.
> 
> This series further enhances the support for the MT6795 Helio X10 SoC
> and the Sony Xperia M5 smartphone.
> 
> In particular, for the SoC support, this adds:
>   - Frequency Hopping support
>   - I2C controllers
>   - Power domains
>   - IOMMU support and LARBs
>   - GCE/CMDQ Mailbox
>   - VDECSYS and VENCSYS clocks
>   - MMSYS support
> 
> ...and, on the Xperia M5 smartphone, this adds:
>   - Frequency Hopping with Spread Spectrum for MAINPLL, MPLL, MSDCPLL
>   - Touchscreen support (Synaptics S2726, fw id: 1898977, RMI4 protocol)
>   - Accelerometer
>   - Magnetometer
>   - Proximity sensor
>   - NFC support
> 
> ...all of which was successfully tested on the Xperia M5 smartphone.
> 
> This series depends on [1] for the MMSYS support.
> 
> Plan for step 3 is to push upstream full display support, which does
> already work on my custom tree ;-)
> 
> [1]: https://lore.kernel.org/all/20230309102618.114157-1-angelogioacchino.delregno@collabora.com/
> 
> Cheers!
> 

Applied all but:
4/17 dt-binding already applied
7/17 dt-binding not applied
8/17 we are missing the dt binding

Thanks a lot for the great work
Matthias

> AngeloGioacchino Del Regno (17):
>    arm64: dts: mediatek: mt6795: Add Frequency Hopping Controller node
>    arm64: dts: mediatek: mt6795: Add apmixedsys syscon node
>    arm64: dts: mediatek: mt6795: xperia-m5: Enable Frequency Hopping
>    dt-bindings: i2c: i2c-mt65xx: Add compatible for MT6795 Helio X10
>    arm64: dts: mediatek: mt6795: Add nodes for I2C controllers
>    arm64: dts: mediatek: mt6795: Add SoC power domains
>    dt-bindings: mailbox: mediatek,gce-mailbox: Add support for MT6795
>    arm64: dts: mediatek: mt6795: Add support for the CMDQ/GCE mailbox
>    arm64: dts: mediatek: mt6795: Add MMSYS node for multimedia clocks
>    arm64: dts: mediatek: mt6795: Add VDECSYS and VENCSYS clocks
>    arm64: dts: mediatek: mt6795: Add support for IOMMU and LARBs
>    arm64: dts: mediatek: mt6795-xperia-m5: Enable I2C 0-3 busses
>    arm64: dts: mediatek: mt6795-xperia-m5: Add Synaptics RMI4 Touchscreen
>    arm64: dts: mediatek: mt6795-xperia-m5: Add Bosch BMA255 Accelerometer
>    arm64: dts: mediatek: mt6795-xperia-m5: Add Bosch BMM050 Magnetometer
>    arm64: dts: mediatek: mt6795-xperia-m5: Add Sensortek STK3310
>      Proximity
>    arm64: dts: mediatek: mt6795-xperia-m5: Add NXP PN547 NFC on I2C3
> 
>   .../devicetree/bindings/i2c/i2c-mt65xx.yaml   |   4 +
>   .../mailbox/mediatek,gce-mailbox.yaml         |  20 +-
>   .../dts/mediatek/mt6795-sony-xperia-m5.dts    | 166 ++++++++++++
>   arch/arm64/boot/dts/mediatek/mt6795.dtsi      | 245 ++++++++++++++++++
>   include/dt-bindings/gce/mediatek,mt6795-gce.h | 123 +++++++++
>   5 files changed, 550 insertions(+), 8 deletions(-)
>   create mode 100644 include/dt-bindings/gce/mediatek,mt6795-gce.h
> 

