Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F6AC77B7E
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 May 2023 16:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3EWH1RGi3evo5KxNcmukt363dFuq46wqFUtOjsuXhA8=; b=YKo/jEJHlsCTovLvFKsz+5rWcT
	3aVf6R5HdMOyJfllCvTgC9DHX+Txiiruc/UhTWDKSPLAgZJIJ/BMOEWpXLQifwDmwnpDOQ77xTbZS
	97+tl6t+TSjj4X6pLJwsKx9J9Wi6R2Cn8sGqLhW3ZOSHe+HjS+zHgqKFXqToEswlzfqNN9KHCmn4p
	of3MlIgYjN61+IkMeI5EMr47yd1UvnM3gBqk5oFwXqqH5c1Yp3Uv9HMGVLDZSII55d2Lt4qvUasgA
	b6iIdNor7zYd8M+9CQKhefA5mIWiTHDgOxTP9ogRGJGlr5MA+55H9bWtDPz/a+1Uz5HvDpfMN11BT
	r677sgtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3fQc-00B3Vt-2e;
	Mon, 29 May 2023 16:09:02 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3fQa-00B3VA-0N;
	Mon, 29 May 2023 16:09:01 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3f6e68cc738so22914465e9.1;
        Mon, 29 May 2023 09:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685376538; x=1687968538;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3EWH1RGi3evo5KxNcmukt363dFuq46wqFUtOjsuXhA8=;
        b=jQWMhVOJqrhhSLKnkMuB/L/2hC8SDBzu1rHeomtE8ZHb1H8SRPhi8BFlt6zA2V1nzu
         80MNtbfVt2Jcq1qnzY8v/DYSIeNtkB9B61vaJfc0bAucpcI+StpT/pFFsXXT8vcYAr1t
         FHwgL0WH4KEyUeJPRYhipiuxOvvRSLpnnNqJ7xWjIG7Q2KfFvBg8v4cVYXR8upiZ9BTB
         gTtaSfYDiXWLD6BUPqAMRJbhcfW6uO04W3RoW7Bu3SpsYQ74lFVc1ZQG03Sk/OBkTCNs
         vB8RjvCqHGAc4ncYQY9efNDbVRMm3ssoeDolQJaRuwZdAomcHoSBzBn24YJF3REha6pf
         NERg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685376538; x=1687968538;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3EWH1RGi3evo5KxNcmukt363dFuq46wqFUtOjsuXhA8=;
        b=eaJPmVORWH8wm62LmvXU/tRyxxaRajriNK5AMoDfRtvYnN5tp6q2eoxNA67k7VSXU+
         pthS0NxGiVIcykg5gZ2de8Z432hNwYT1aqUPVCduuWNmoND38ntf1S7w4B/ikDLL/UPf
         k2LHPaV0P9zYQ8Y9DPuNrx1nVHvSco+EtW5rTt3yO9FKQEcBQFBT4vhFDBG5DyXrXYHU
         MwsHlKmAhJ+Y7iLY8X0I2k7M/7wIuQbjPDpz9CBNLfOCndqGvnGg0MBHdTAcPczJd0q4
         wxWa3B6VPFzKo7WQc9VekZIBacQq8vOvoXPzDTac2kMWY22yJhfyqh3u75f4mSDftNLW
         EFmA==
X-Gm-Message-State: AC+VfDxXDb5Uga5JAdxR9km2pPlSeEPXpOotvYE/xzES6deaAlZ5KVt6
	CGb70I3vqud5d5/Ppzp0sQc=
X-Google-Smtp-Source: ACHHUZ6D5hrPwjDQc5UEg00LPOMeU4uSzujA/kxxLTkMASJjd1jfli8yHkc3tVvDbHl3qIB3XT0Jjg==
X-Received: by 2002:a05:600c:22d0:b0:3f6:f56:9ad with SMTP id 16-20020a05600c22d000b003f60f5609admr9718894wmg.13.1685376538448;
        Mon, 29 May 2023 09:08:58 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id u5-20020a05600c00c500b003f0ad8d1c69sm18229641wmm.25.2023.05.29.09.08.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 May 2023 09:08:57 -0700 (PDT)
Message-ID: <cabc40f3-d1cb-bdd0-bd96-1a51cb861579@gmail.com>
Date: Mon, 29 May 2023 18:08:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 0/2] MT8192/95: Set correct MSDCPLL rate
Content-Language: en-US, ca-ES, es-ES
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, weiyi.lu@mediatek.com, ikjn@chromium.org,
 chun-jie.chen@mediatek.com, tinghan.shen@mediatek.com,
 seiya.wang@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com
References: <20230522093002.75137-1-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230522093002.75137-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_090900_151585_19A95146 
X-CRM114-Status: GOOD (  11.82  )
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



On 22/05/2023 11:30, AngeloGioacchino Del Regno wrote:
> This series improves both stability/reliability and performance for
> eMMC and SD cards on MT8192 and MT8195, where the PLL may be set at
> a sub-optimal rate from the bootloader.
> 
> This was tested on MT8192 Asurada Spherion and MT8195 Cherry Tomato
> Chromebooks.
> 
> AngeloGioacchino Del Regno (2):
>    arm64: dts: mediatek: mt8192: Make sure MSDCPLL's rate is 400MHz
>    arm64: dts: mediatek: mt8195: Make sure MSDCPLL's rate is 400MHz
> 
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 2 ++
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 2 ++
>   2 files changed, 4 insertions(+)
> 

Whole series applied, thanks a lot!
Matthias

