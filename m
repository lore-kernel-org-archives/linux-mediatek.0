Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F49EB64DC
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jul 2023 12:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zwkAITNstbKHyFH4YH4HGkeGusEuKBwo8M8zNrSZdhU=; b=obQPgrcZfKkAiOPSj8Yi6nIF4y
	5jEut+XP/AqWHJEWuaFc4P/10V68s6EQrsTRg+2tfKyodjEpNS1OiVysVRJUDINsD8hP5e1PhQLwY
	udOLvvb9CM1Akb7/lNCzY0GnKzs3yMSOFWxsUWLJZ55C/7u7wkuEZM52fJ94FkRPE7Ss8e662Xh4f
	Lq7Np1v8BvEVfC2x9sOW88vRc963UUUr/yfzmm5GFJuFLND4yUZ4k/JqezPil2oFmJO7YC/wgJbX2
	0Hil/7HPWoo+mQ/eyxMvr/ufKvTCCmTiTt6oOjt/NPHecdj2jdwJPvf15It0Dsn9+pUTZbSPgydTu
	qJDhHYlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMosn-00E0vd-0g;
	Fri, 21 Jul 2023 12:05:17 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMosk-00E0tK-0x
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Jul 2023 12:05:15 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3fbc244d307so16315215e9.1
        for <linux-mediatek@lists.infradead.org>; Fri, 21 Jul 2023 05:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689941111; x=1690545911;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zwkAITNstbKHyFH4YH4HGkeGusEuKBwo8M8zNrSZdhU=;
        b=aF2eIZeXrg/zFUDfDqX2VRdg/iwpCjbdedLrdlDzh5onBXHGhO77YzC1SAkx0Z56WB
         hNsn2wPWE2wl5ADCXQy7It6KqmaBdH4urXNG33ImeMzRsV+Y5fr4wwaVYGmHBLhsnDTG
         xHyBattkMTeVIJfCTI4hDoRRnJDQNgedkwQrrztCT6ld9ey9NbmDs2/gZgi3yO/ZPCBx
         DUiNZs1Jym5CieKIikuk60Do2qtAQaWAks+iGejZXbnCbxzzWZPHmK29LAj74NO9/ac6
         iVJTrMmZZZK0soe66ePTj2Z9NMIokxJGWSLrYgeq1GHgoWGRH/EzO1fLYISQ27yfGkv3
         cTAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689941111; x=1690545911;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zwkAITNstbKHyFH4YH4HGkeGusEuKBwo8M8zNrSZdhU=;
        b=BT01/y0uBmI4HFnjAHqAf13Fb0X2Br5MPhf9GRdt/LklRzSBBNNfqYTgTgaJdC33GS
         3B38nrJQI4wt42KQAghQqokgNDz1zUBNECHoe5G5JjULtRGOPIQAnz+iz/OJiS5CEASm
         k+ZfccaVN26ZFW/zKAlYkuaMKYXA9ydTFyt8qhVgYKZo7l0b06s8beq70oIJmrhabXiv
         nSapDcGdkTV8uM7rNMfCrzSFqSUKbuNL72O6EywDyOGrmgr+BdJhpOw7Xv+sBPnMJIU2
         sBU+hAxTa5B8SeUQwoIkJRbND/dfUhkS2yToc6rWsQEIaOWbZbaJmHDoKxY1QfKQp16t
         Uzxg==
X-Gm-Message-State: ABy/qLZRHsFvt8HJJo47U664j7yaJzaRfVdhvwat53pGHvPpA/bEvJ/v
	NaDAcNyX0iwgYCYtolbjiYI9Hw==
X-Google-Smtp-Source: APBJJlHRz8i4/yqZn1Tc3ne+fyyGgKuZDYiIqzx37lC9JZfJ4gGCcmSmEPniqHtoeiGz22OlooGr0w==
X-Received: by 2002:a05:600c:450:b0:3f8:c70e:7ed1 with SMTP id s16-20020a05600c045000b003f8c70e7ed1mr1345123wmb.20.1689941110870;
        Fri, 21 Jul 2023 05:05:10 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id 19-20020a05600c229300b003fb40f5f553sm6032566wmf.31.2023.07.21.05.05.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jul 2023 05:05:10 -0700 (PDT)
Message-ID: <a840ac78-dbb2-23b0-493f-a7e618502a01@baylibre.com>
Date: Fri, 21 Jul 2023 14:05:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/3] arm64: dts: mediatek: mt6795: Add support for
 display blocks and DPI/DSI
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 matthias.bgg@gmail.com
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, kernel@collabora.com
References: <20230721082822.680010-1-angelogioacchino.delregno@collabora.com>
 <20230721082822.680010-2-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230721082822.680010-2-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_050514_342091_ABE837A1 
X-CRM114-Status: GOOD (  13.55  )
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



On 21/07/2023 10:28, AngeloGioacchino Del Regno wrote:
> Introduce all nodes for all of the display blocks in the MediaTek Helio
> X10 MT6795 SoC, including the DSI PHY and DSI/DPI interfaces: those are
> left disabled as usage is board specific.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt6795.dtsi | 251 +++++++++++++++++++++++
>   1 file changed, 251 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> index 597bce2fed72..3485a2a9a19e 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> @@ -1,7 +1,9 @@
>   // SPDX-License-Identifier: GPL-2.0-only
>   /*
>    * Copyright (c) 2015 MediaTek Inc.
> + * Copyright (C) 2023 Collabora Ltd.
>    * Author: Mars.C <mars.cheng@mediatek.com>

typo: Author => Authors


-- 
Regards,
Alexandre

