Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0821AC54EBE
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Jan 2023 13:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w6Sfv3GzCAn5QrrBImbkAkIsyNCdyXbe2wptVAXtxE8=; b=WX8V+P0uQ1rdY6
	28riVY2WJHqd77e2fW/Sylg4lBETrv2RhQmScNXja+uTVeZ1V5O4g0cz/yZ8vyAJryVi1K8WY3tMV
	s4JZ0FDKzrDyEB/PhfjhkAZzmkIZ69WOBtpNBNXjwHkIyDRfcFupffJXSWQjoJMHYZ3yqfUSKF6iR
	wGEct84Bv4560amugZq3wDqab6Bl1d3t5gEPDNsckJhH9sn83Umjxa+gsBnwO6uF86uAtqvoMdWyK
	ngYEo9ixjMGGdEzd6WpybjRjWR3/saPyX+0HWw0fi9PYELzFuhExS9S1ahv+uSVMtU5E+hryP8+CL
	fukS600oIJdshG7pmy5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGJsN-002gct-0d; Fri, 13 Jan 2023 13:13:43 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGJsK-002gZr-8Y; Fri, 13 Jan 2023 13:13:42 +0000
Received: by mail-wm1-x332.google.com with SMTP id j34-20020a05600c1c2200b003da1b054057so3033986wms.5;
        Fri, 13 Jan 2023 05:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w6Sfv3GzCAn5QrrBImbkAkIsyNCdyXbe2wptVAXtxE8=;
        b=mEjxQu5xNEJXSIjn7Gw/9XTq7+F4SJA697N5ndHL5HEfIF6EvBweh2FGJk4jcSqDBW
         tQOClYxi6kB9gLtETqfTr+oOURZiVexae//HuMiH1dUYZlQXkifJRHdzZlvKbYqf6FRL
         JNoCXbTQVF5kolOjAg8r+eZXD+1Y/UB/PRPt5sZxJXJmOSXRiWxIGC2GCdTr76+0hoLq
         2A0Xv6YSH19JvvfhVlrsXOz/cAzUfwOlpatMI3VNCUc0Vzh7+hFTgzuttV2VCgKQStme
         RnEYovaCkdclkTT+znCwsBNPuLxrMsmI2QRSGmvpqvPcH5bv3l6cOSFrgRXXJF1ahvUR
         /mDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w6Sfv3GzCAn5QrrBImbkAkIsyNCdyXbe2wptVAXtxE8=;
        b=joY8+MWlKb87XH/cQoZVAUM3k9ynCG6b4X/L6Wd6bXnbz/euyjwZoDECqfcuVRzvZ3
         dnJGaa5ao/yncsK3ZKraR1PHTNJuV5TsdCqYAXT0+0XBPcf1focdCfrFpYHY/K4DVd3R
         RFTwr4M8d5qKqWN2vX+K82l+Ud1ktgc4LmCHpg1MFPF7bqi7td+fuyq6kWH+YdwKcS5m
         qbZm10NbNST6K89RaHxTmoBwvmdYFmdEDcByOWb6BvdXlxeq7dhdsLnANJ6vC//tejdS
         AlZdWyAALYrxFWSXSTGYJP01UMW9yfBHPso8hJmgoRDtfZlxYmH+widz0rq2C7tGBK/s
         8DbQ==
X-Gm-Message-State: AFqh2kqDCQz2P3r4lZEBU4wY631Jx0/CgrjlkbgV+tFcqXI94IzUAYBZ
	54wOeHXzy1eimprm+wynLBs=
X-Google-Smtp-Source: AMrXdXvLVIxqSzD18MgX3l3OlYJF5CvyJ3znHiB469r4ldiU7TKcm5zbYT3oyuirc1nRYXo/fO/1Iw==
X-Received: by 2002:a05:600c:3b82:b0:3cf:900c:de6b with SMTP id n2-20020a05600c3b8200b003cf900cde6bmr58678762wms.15.1673615616233;
        Fri, 13 Jan 2023 05:13:36 -0800 (PST)
Received: from [192.168.0.30] ([37.222.254.155])
        by smtp.gmail.com with ESMTPSA id 2-20020a05600c228200b003d9e00dfccfsm21796387wmf.8.2023.01.13.05.13.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 05:13:35 -0800 (PST)
Message-ID: <0054c6aa-da0d-ecb3-47a9-ef99caec0da3@gmail.com>
Date: Fri, 13 Jan 2023 14:13:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v9 0/5] Add BananaPi R3
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
References: <20230106152845.88717-1-linux@fw-web.de>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230106152845.88717-1-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_051340_381633_BDC3FABA 
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Patches 2-5 applied!

Thanks!

On 06/01/2023 16:28, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> This Series adds some Nodes to mt7986 devicetree and the BananaPi R3
> 
> This version is rebased on linux 6.2-rc1 and i dropped already applied
> Patches from v7.
> 
> i had run full dtbs-check but i end up with some strange warnings in
> ethernet-node that should not come up as phy-handle and sfp/managed
> properties are already defined. These errors also came up for mt7986a-rfb.
> 
> phy-handle made optional
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/net/mediatek,net.yaml#n265
> 
> property sfp/managed (which is included for mac subnode in yaml above):
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/net/ethernet-controller.yaml#n137
> 
> changes:
> v9:
> - drop model string override in sd-dtso
> 
> v8:
> - drop model string override in emmc-dtso
> - drop cs-gpios from spi-nodes
> - add interrupt-settings for mt7531 switch
> 
> v7:
> - rebase on next so dropped already applied patches
> - squashed overlay-patch into the bpi-r3 base support
> - moved regulators from mmc-dts to common dtsi
> - changed dtsi to dts (as board base dtb) and mmc-dts to overlays
> - renamed overlays to dtso
> - removed angelos RB because of changes in bpi-r3 patch
> 
> v6:
> - dropped regulators from usb-patch as suggested by chunfeng yun
> - moved 3v3 regulator to mmc-patch as it is needed for emmc to work
>    rfbs were tested by sam shih, r3 by me
> - dropped RB from AngeloGioacchino from mmc-patch due to this change
> - fixed links in coverletter which were broken in v5
> - i hope this series is sent without errors now (my mailprovider limited
>    mails last 2 times while sending part 10)
> 
> v5:
> - changed usb ranges/reg/unit-adress
> - added reviewd-by's except usb-part due to changes
> 
> v4:
> - dropped RFC prefix
> - rebase on matthias' mtk dts-next (for 6.2) branch
> - added author information to overlays
> - fixed sfp binding error
> - added fix for moving wed_pcie node
> - readded missing compatible patches
> 
> v3:
> - changed mmc pull-ups
> - added patch for board binding (sent separately before)
> - added pcie node in mt7986 (not yet again in r3)
> - added dt overlays
> 
> Frank Wunderlich (2):
>    dt-bindings: phy: mediatek,tphy: add support for mt7986
>    arm64: dts: mt7986: add Bananapi R3
> 
> Sam Shih (3):
>    arm64: dts: mt7986: add usb related device nodes
>    arm64: dts: mt7986: add mmc related device nodes
>    arm64: dts: mt7986: add pcie related device nodes
> 
>   .../bindings/phy/mediatek,tphy.yaml           |   1 +
>   arch/arm64/boot/dts/mediatek/Makefile         |   5 +
>   .../mt7986a-bananapi-bpi-r3-emmc.dtso         |  29 ++
>   .../mt7986a-bananapi-bpi-r3-nand.dtso         |  55 +++
>   .../mediatek/mt7986a-bananapi-bpi-r3-nor.dtso |  68 +++
>   .../mediatek/mt7986a-bananapi-bpi-r3-sd.dtso  |  23 +
>   .../dts/mediatek/mt7986a-bananapi-bpi-r3.dts  | 450 ++++++++++++++++++
>   arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts  | 120 +++++
>   arch/arm64/boot/dts/mediatek/mt7986a.dtsi     | 122 +++++
>   arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts  |   8 +
>   10 files changed, 881 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-emmc.dtso
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nand.dtso
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nor.dtso
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd.dtso
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
> 

