Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 018E6C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 12:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dau72eMFobVjeX858MKpIQt+w+Vj109653tn0bOEToE=; b=REkbTVoKOSeHHvBZvCxazj9Hms
	SSNUd0pqysq0Ivz49PyQ2iJeBeZiK+P7kcQ7XYEFBsbXsnoc8QjlxRmHoGRnx5GeQyMV4IIwzdanv
	CvIXxK4JPGTL7LygwMNub7X/Ls1GXEsCN6OniVlGKPPiNlKPrUCtr7G6UKQwJjKkUDfhmcduxpa+Q
	EuxvioQk7FSHNQoYU8Bi0fZUZVNfZ88dgvceZuNKu5LSjnooyObaYbf6cNTqydoCdQHNGdeKzTwf4
	f4zv7qzPWZQTOCPtX7giwHwmVbGdOEs/wNIx2mktt82O1nsbiPOcCjDHlezh7/u+3pFBdKAP3ILRh
	+ei4YK7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox5ky-00DQq2-MK; Mon, 21 Nov 2022 12:18:36 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox5kL-00DPw5-9q; Mon, 21 Nov 2022 12:17:58 +0000
Received: by mail-wr1-x434.google.com with SMTP id cl5so19581055wrb.9;
        Mon, 21 Nov 2022 04:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dau72eMFobVjeX858MKpIQt+w+Vj109653tn0bOEToE=;
        b=LZ9ntN+4DTSrbOgtfOrnpUBwBrbpV7qmRH/ljp2H/dZdMQuirrWvAdZk2R/bGkpO9p
         qC11WmNqXSMvmjgG7ofh8dwut6KCDI2MVrANuQg1egUOPzNFHakWsZ6fR88Nryg/7gzi
         DXSZUc61z46nnPxXGxqoL3rIsG2jkL997JUWk6wyWodMIBjdZ1K/nd6gaYEYNtVygHz3
         dIEaeNdSjezKh5Kzt2l0j+tTscWRhu+dKN/rVmpRtleKI5mx/w5GqWUIi+y2SkAGSw03
         zluYjzYDXohiwomidyNMjAOiXEFbr1LAFEzJxDoYzW1wT7fYyBDWQlzBCHnq5eRekgvR
         Of4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dau72eMFobVjeX858MKpIQt+w+Vj109653tn0bOEToE=;
        b=0qwW2chMQZ6XOxzqiedCnxvoQtxu9uK59m7Lh3ajhbD0IKlIqbsHn5yNv0RCxO3Y9X
         GkOAFltQIuSgo7nSwtmORWIHtv4EozN/PRHxIOX1xOqtlXklAeESy9NVtkX5lHELz0hL
         mNrIvMtOYVM6zFzkcF1OR0oOprqG/su8MyeBvRVK0MBBbmOPM2ijkn69R+pFlfipMJGY
         o0x60sTJUFnxhmsDYLaANvuXVoGmisoJ1meOSpmveBATK33NYqa8GShRVPuIHCvB3FwV
         YvSpbz1Rjcpp5eDYA9RUnPrjk7sCkliNrBoycVEh38esSHsG57LaZzP5C1W9mzmFpbuj
         eNQg==
X-Gm-Message-State: ANoB5pk0oWZkP5D6/MXaxEN1rn6zF0xEvK+yEdKsedej9/EXJlvbWl3i
	LjLFd1Cmh7zBgSjhtQ4jZes=
X-Google-Smtp-Source: AA0mqf5fGkC5GjLrWjBo6zV31RUokHzCtGY/Ltn3f1prZofGpBm/8pSWUcDd/u4xQilm5VMtM63W1A==
X-Received: by 2002:adf:ff89:0:b0:22e:38b:95ff with SMTP id j9-20020adfff89000000b0022e038b95ffmr1287478wrr.202.1669033057477;
        Mon, 21 Nov 2022 04:17:37 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id e21-20020a05600c219500b003cf894dbc4fsm13444667wme.25.2022.11.21.04.17.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 04:17:24 -0800 (PST)
Message-ID: <065b5ff5-fbae-2ec5-a06a-8aad015612f9@gmail.com>
Date: Mon, 21 Nov 2022 13:16:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 0/4] Add dp-intf and dp nodes
Content-Language: en-US
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Cc: angelogioacchino.delregno@collabora.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20221110063716.25677-1-rex-bc.chen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221110063716.25677-1-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_041757_380180_ACC3001D 
X-CRM114-Status: GOOD (  11.17  )
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



On 10/11/2022 07:37, Bo-Chen Chen wrote:
> This series add MediaTek dp-intf nodes and dp nodes.
> This series is based on linux-next-20220915.
> 
> Changes for v4:
> 1. Rebase to linux-next 20221109.
> 
> Changes for v3:
> 1. Update commit message for "arm64: dts: mediatek: cherry: Add edptx and dptx support".
> 
> Changes for v2:
> 1. Update commit messages.
> 2. reorder the place of "status = "disabled";"
> 3. reorder the place of dp-intf.
> 
> Bo-Chen Chen (4):
>    arm64: dts: mt8195: Add dp-intf nodes
>    arm64: dts: mt8195: Add edptx and dptx nodes
>    arm64: dts: mediatek: cherry: Add dp-intf ports
>    arm64: dts: mediatek: cherry: Add edptx and dptx support
> 

Whole series applied, thanks!

>   .../boot/dts/mediatek/mt8195-cherry.dtsi      | 86 +++++++++++++++++++
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 48 +++++++++++
>   2 files changed, 134 insertions(+)
> 

