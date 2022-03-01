Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA11C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Mar 2022 08:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n1REeK/7A7pyJ/6m+ixMuheEcUU9Yu+7sQkytgIWLhY=; b=4MeG0VKIU2oD4t
	jvE4xWQeONSm6v20aRU8RZFx0kXiOc31ekUS8vfhh4YbRIvVabr6XHWwC8Dm5OFbv49YDaRBgO2t8
	6IqH0dVh+jxgPPAafltETbTMTc624pLsisszN4JYRQRi8oHxLpJiBivk+sHeKBEYCwtPbANvf1eAO
	hvdn6pH1KzOypp7xAcvy39BxYWH9saVNcdG1gXRr0shpNvGK43rABnmKYkbS7khnMA2QHHLUWzT+k
	yUJNM2x3+XnfRJYerpHiKrWVHX4hjK2I+hrPT9Pff7F6OCZZI0ytk2+9pRRVX8Xcgc3t1k9eV2lGR
	XdQaKf3YleG5dvoXSpzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOxYI-00FVRr-0F; Tue, 01 Mar 2022 08:08:10 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOxYE-00FVQH-Mm; Tue, 01 Mar 2022 08:08:08 +0000
Received: by mail-wm1-x32c.google.com with SMTP id
 bg16-20020a05600c3c9000b00380f6f473b0so766837wmb.1; 
 Tue, 01 Mar 2022 00:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=53dOAB2vBN3+b4Fbz+8eHbf2N76aKf8ZDQVBCIga/q8=;
 b=cgJ73JoWW5R1zOaE3eQq/WB3EEbveu0prkJNYZDoReh5an/6ry8x1dpyLn9Qvc/R2A
 b5tnmvrCIQof0hhvjoTRtHtqF5nkzem96v72LhUPE3Kb93mXQ2YSAkH5JKRCkFZUISgC
 A1sza/UotJgRM3/DQTH523/h364l/EAA0t+BDeuhWV+CrTekoVgm/zyXdBONxlsz3FDB
 t2pni8nENIwm2ZYgqedL3wq3IR6XGs9Dm+zrsZi13NdajCtqcr+a2Imo+vo+V4O0J84U
 gvKqpxfmAifYU/DxKKjJGk1LCAQqeNuOdUMv2s/D65LqmrOuCRNT5e00UiDLPEbhBlIo
 Ussg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=53dOAB2vBN3+b4Fbz+8eHbf2N76aKf8ZDQVBCIga/q8=;
 b=RheJFdPpvqpGgRz/RkurUSfT+KWSf9egDBo04sBLwdFwbTArErsOItRdSS87WcC00B
 Ic15Br0uo/poPGgkp/jfuGyA7RgDyNRHKtYR70uVL0skrg0Hm0mnzFDIMEipCpY9NWbR
 jce+4t1bAm2rRyDtwPqT/9FiJyLeJf4bh/UZTPBkTJK2tYAc+EE3C1dfZpc0kQD/vIqK
 KBiehgMLdVAcNWaLwSLJXcRIqnPTjPUPFFKJhWtUydbT4oWFlgRDUGi6kNI4mpKiFel5
 yk4eMyNZvZGdOMBraGCMfThit0VXixqbwIwpVPTxRRTzkcU5EYv6n0dQDzPgcv6p+voi
 Z2Zg==
X-Gm-Message-State: AOAM531bRMagDhZyBrfnk9E5W9TdLYZgDvMn9/iwWeBrfhui4xuYpIP3
 SQ63nQpZGIVArztlZPWxRP8=
X-Google-Smtp-Source: ABdhPJwjGoPSylNWjBtSFXHIe6pLfehteffxF8Bjft8RLt4F+qM/K2M/+iCsfvHvSVeKej5MmXkXmQ==
X-Received: by 2002:a7b:c959:0:b0:381:4b39:e9c3 with SMTP id
 i25-20020a7bc959000000b003814b39e9c3mr11055189wml.4.1646122084836; 
 Tue, 01 Mar 2022 00:08:04 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 a9-20020a05600c2d4900b0038100a95903sm1641634wmg.41.2022.03.01.00.08.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Mar 2022 00:08:04 -0800 (PST)
Message-ID: <860747c9-109f-20d7-84d1-94e2eebee9d2@gmail.com>
Date: Tue, 1 Mar 2022 09:08:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v9 00/13] Add support for Airoha EN7523 SoC
Content-Language: en-US
To: Felix Fietkau <nbd@nbd.name>
Cc: soc@kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, john@phrozen.org
References: <20220130145116.88406-1-nbd@nbd.name>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220130145116.88406-1-nbd@nbd.name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_000806_772287_BDE36329 
X-CRM114-Status: GOOD (  14.91  )
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



On 30/01/2022 15:51, Felix Fietkau wrote:
> This patchset adds support for the Airoha EN7523 SoC, intended primarily
> for xPON/xDSL routers.
> 

I applied patch 1, 2, 3, 4 and 13 to me tree. The rest unfortunately will need 
to go through clk and pci tree or at least need a Acked-by from the maintainers.

Thanks!
Matthias

> Felix Fietkau (4):
>    clk: en7523: Add clock driver for Airoha EN7523 SoC
>    ARM: dts: add clock support for Airoha EN7523
>    PCI: mediatek: Allow building for ARCH_AIROHA
>    ARM: dts: Add PCIe support for Airoha EN7523
> 
> John Crispin (9):
>    dt-bindings: Add vendor prefix for Airoha
>    dt-bindings: arm: airoha: Add binding for EN7523 SoC and EVB
>    ARM: Add basic support for Airoha EN7523 SoC
>    ARM: multi_v7_defconfig: Add support for Airoha EN7523 SoC
>    dt-bindings: Add en7523-scu device tree binding documentation
>    dt-bindings: PCI: Add support for Airoha EN7532
>    dt-bindings: arm: airoha: Add binding for Airoha GPIO controller
>    gpio: Add support for Airoha EN7523 GPIO controller
>    ARM: dts: add GPIO support for Airoha EN7523
> 
>   .../devicetree/bindings/arm/airoha.yaml       |  28 ++
>   .../bindings/clock/airoha,en7523-scu.yaml     |  58 +++
>   .../bindings/gpio/airoha,en7523-gpio.yaml     |  67 ++++
>   .../devicetree/bindings/pci/mediatek-pcie.txt |   1 +
>   .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>   arch/arm/Kconfig                              |  12 +
>   arch/arm/Makefile                             |   1 +
>   arch/arm/boot/dts/Makefile                    |   2 +
>   arch/arm/boot/dts/en7523-evb.dts              |  43 +++
>   arch/arm/boot/dts/en7523.dtsi                 | 205 ++++++++++
>   arch/arm/configs/multi_v7_defconfig           |   1 +
>   arch/arm/mach-airoha/Makefile                 |   2 +
>   arch/arm/mach-airoha/airoha.c                 |  16 +
>   drivers/clk/Kconfig                           |   9 +
>   drivers/clk/Makefile                          |   1 +
>   drivers/clk/clk-en7523.c                      | 350 ++++++++++++++++++
>   drivers/gpio/Kconfig                          |  10 +
>   drivers/gpio/Makefile                         |   1 +
>   drivers/gpio/gpio-en7523.c                    | 137 +++++++
>   drivers/pci/controller/Kconfig                |   2 +-
>   include/dt-bindings/clock/en7523-clk.h        |  17 +
>   21 files changed, 964 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/devicetree/bindings/arm/airoha.yaml
>   create mode 100644 Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
>   create mode 100644 Documentation/devicetree/bindings/gpio/airoha,en7523-gpio.yaml
>   create mode 100644 arch/arm/boot/dts/en7523-evb.dts
>   create mode 100644 arch/arm/boot/dts/en7523.dtsi
>   create mode 100644 arch/arm/mach-airoha/Makefile
>   create mode 100644 arch/arm/mach-airoha/airoha.c
>   create mode 100644 drivers/clk/clk-en7523.c
>   create mode 100644 drivers/gpio/gpio-en7523.c
>   create mode 100644 include/dt-bindings/clock/en7523-clk.h
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
