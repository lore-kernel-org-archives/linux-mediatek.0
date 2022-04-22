Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59BBBC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 15:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vKp0o7buyrHWz8Bfmlx/E0NvsBLDuY/0CQXw04yg3Bs=; b=pLQe6W5YJbXnt3
	tTm8s0YoVcL6J99ewcwtLZLC45Y11B+Q/KQzaJjlrbY4ZCTDrp0XwyHGjpdroqB+zvNGDcXgq7h8z
	l6vJdQVd+Sd5XCXGsLTm8lSh6l9AYVtfLx1NIO7kg8eFz6VmVA/bQ9lpzDcdaUzTKPpvlUatuSwqp
	oBONJD048aWtMb+If6Nv9BTRb4LEP2QKDIgkkLvqDhmbK4GoZ71uq12ceZIA8HOpqfKpcqfQgGDLh
	R2ieizoz8t9nQw4mCHgYlFSegvvdBQadarkTUJlP6qnWiuExi9tm9KbaO2sDZChpl6CkzAmRZ9e25
	GZKMbQ47WLupzDY3+VUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhuq5-000z6F-BW; Fri, 22 Apr 2022 15:04:53 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhuhm-000vqi-IT; Fri, 22 Apr 2022 14:56:20 +0000
Received: by mail-oi1-x22e.google.com with SMTP id a10so9289620oif.9;
 Fri, 22 Apr 2022 07:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=VhdYWhZ8HdsB2w4qD6v1EaAJmqQAg8pwfTEeXT82kjU=;
 b=Dxse6QsHTlBp0xyYiyUSvBzXMEmNQ3ESZvO7d3r6Nusvo1zsTvhkK0Qr35kaDATkHk
 xF7i4OIaDWCmEHyCrefP1H3vdiUTOX16w5D9+waLInX1qKp64OSHurqMcxe17+ddTFlP
 XBuDqS1XLvzYR+h8aRxTlipCNH5WvsydusUcCql/f5+lde33Uvk1Tv+OwcAMz75d4ibU
 K0hQqQQAqnkEelku+01nKsE1b3sKxWmcNYSz1PhtloEa8BtyARHLWDyX4ZW3QPrZAvMD
 tSpNNn42322cEhdpPm3Mt6N4KakFFZsHsNevd/F1jXmh1K4U9kB43yLv/y/LpGEQvN6Y
 /0EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VhdYWhZ8HdsB2w4qD6v1EaAJmqQAg8pwfTEeXT82kjU=;
 b=RYDlHGU8aO5WgjxlKxu4bGWHR/3HBRMMDgbRj8Fyb0M04ZRh+L5PRnBh5NzXTsEhAu
 DFTXkXSkubGa8fQ4Em+vhX7jjoF17RRLBl18WgYPbjb878lmzTNNksZ6e1ELorBd+IKM
 USfDDF6SV5O4P0zQoYvIfYp5dVH0uuYihMwPCQNrSuFO0kjTeCclTecWoUBcTweYX8C7
 gioYbcfz6U5RUh9csofxJP0UZU0AO3m0twthINzxykquF4m7znrvZXYxhJhbqi7Y+wBs
 FqGVD+0icdX3MEouSBXRlShmFCsJBJX18JFAucjnP5gecNwV8MMIriX7iIGDt33cn8P1
 RZVg==
X-Gm-Message-State: AOAM530kuwkQBinojRGIjHEu5mL48xArBdmu75lTiaRAkEwpyhYijCUE
 Umjo9hRIqvhxRUL1ZlfIXrPwgEEoiqyvMA==
X-Google-Smtp-Source: ABdhPJyaDHGcSpxsr0d+NaMwHEs7D0vX1T7sz6kj1KavTnNDPwMlBcHo7Moa/LU8sE2ysKoagGsO5w==
X-Received: by 2002:a05:6808:f91:b0:323:22f2:e8db with SMTP id
 o17-20020a0568080f9100b0032322f2e8dbmr2886014oiw.176.1650639375465; 
 Fri, 22 Apr 2022 07:56:15 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 123-20020a4a0181000000b00324a1217e96sm853866oor.35.2022.04.22.07.56.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 07:56:14 -0700 (PDT)
Message-ID: <4b3da3bb-ec6d-4e47-fb64-f93b774153d0@gmail.com>
Date: Fri, 22 Apr 2022 16:56:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 0/4] Add support for MediaTek MT8195 demo board
Content-Language: en-US
To: Fabien Parent <fparent@baylibre.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220415150003.1793063-1-fparent@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220415150003.1793063-1-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_075618_723136_CEB0D613 
X-CRM114-Status: GOOD (  14.19  )
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



On 15/04/2022 16:59, Fabien Parent wrote:
> This patch serie adds basic support for the MediaTek MT8195
> demo board. For now the support is pretty basic and allow
> just to boot, use USB, and the SD card.
> 
> When more IO support will be added for MT8195, new changes
> will be pushed to the device-tree of the MT8195 demo board
> to support these IOs as well.

Whole series applied.

Thanks!

> 
> This serie depends on the following patches:
> [0] https://patchwork.kernel.org/project/linux-mediatek/patch/1622011927-359-9-git-send-email-hsin-hsiung.wang@mediatek.com/
> [1] https://patchwork.kernel.org/project/linux-mediatek/patch/20220411022724.11005-3-tinghan.shen@mediatek.com/
> 
> Fabien Parent (4):
>    dt-bindings: arm64: dts: mediatek: Add mt8195-demo board
>    arm64: dts: mediatek: Add device-tree for MT8195 Demo board
>    arm64: defconfig: enable MT6359 regulator driver
>    arm64: defconfig: enable some mt6360 PMIC drivers
> 
>   .../devicetree/bindings/arm/mediatek.yaml     |   1 +
>   arch/arm64/boot/dts/mediatek/Makefile         |   1 +
>   arch/arm64/boot/dts/mediatek/mt8195-demo.dts  | 445 ++++++++++++++++++
>   arch/arm64/configs/defconfig                  |   4 +
>   4 files changed, 451 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-demo.dts
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
