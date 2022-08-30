Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59549ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Aug 2022 07:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zq/iNvuZhFEDaN8OcO2RvNrASLMMDALVcl47N1W89K8=; b=KH47WDt2dsZV/QlaN8fG3i3DKL
	xacRhudCvx1uUxs+vey0sFRvqvjedGKrmRmfoNhLxMU6XJTWX5YK2cImvZAJb8rBoM20nz/J/TO/h
	IKSF4mYhuaIl6fGEpsrBb87YY1rOiklTSJFiV6LODWpYlW3lfXPxb++mA9cJ/04ijv+UfI6hU+e/l
	hH09nWMNZne3vYivog1UbTfk04lO+tPaLMSHKxYNqtX+JesZDS43w4kgI2hmBQwrxRVrOpkd5eI18
	2MDUjN4i39Hu4nocLeL2cslObTs3jeKxGA75IkIfDKOHXvhyIOEVp17hfjcpAj51xwfFNXnDuslqS
	9sgmEGRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSvpJ-00EoyE-Rc; Tue, 30 Aug 2022 07:38:25 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSvoJ-00EoVS-7V; Tue, 30 Aug 2022 07:37:25 +0000
Received: by mail-wr1-x42e.google.com with SMTP id u18so320041wrq.10;
        Tue, 30 Aug 2022 00:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=Zq/iNvuZhFEDaN8OcO2RvNrASLMMDALVcl47N1W89K8=;
        b=mM5BtaTFWnCSIbgfMpWPjN6/DwGilpiMK4Qx1PL06CO0hoIUzF7ZY5tzk05mSm7x0z
         DC/F5QA0AVUFg4q4dut6BcqqbZk1pmnI9wggVHnMhBBeKKakOtkAtGdoeowDaeQACyDv
         tHP0lwKyqurExWG+0XKGPlrjiBfAiTL5XqSRV2LZp2Y1diY/NFSEon6nNFGXxBwKjawQ
         2ypNSehU85aQBZ7EU0B0XCc+2PfAHkVrQs934MCU05CkWdvaHym6sXbiHkp5NQvq3Rkq
         Z+77B9hScl9uaYAnxID6PAPETGK6LWXQlyHpMkY1u/ji63iOKuugZ47wSrtGy7aRoptH
         nfgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Zq/iNvuZhFEDaN8OcO2RvNrASLMMDALVcl47N1W89K8=;
        b=oJoN7IhRXSdRFTOnPCbs7Lu1Hm1MsMwHVpWYc9LGvGlcp/LtiWleMazydPRz3eyyP/
         kF50nZ5RGZolSznMMA+Nd4jT0gQg3mR4MD/fCHGDj0WhqKK19rNCjpvQteJczUltatq2
         IReu6a3ytGOiwVIciipiH9fRv63DmDsm0D8IVAa0pGnRyXM0VrS63nz8fBRl+1/ibAbE
         J7CynWtyajR6vL39MYMivJyBLFVHS0c8Fc4/xhEfJ07xwYXZUIcZ8fd6QQjebraN4Z5W
         iA00BhYnCTuMBXxUkSzoNKpelv/V2eOoGpPN+TIRT8E8cQVjSPtyuPocJkZeevgtSOGr
         MQIg==
X-Gm-Message-State: ACgBeo1qONkr+usdMYw9kCACuJ1760fhbrJG/uwZoPR3Sar0FElVB7hD
	3JVN0LHjaGagpeD8AJfFve4=
X-Google-Smtp-Source: AA6agR7838HEKDFv8SDR/C0DqIiWeOv2e48jy1bxo8YFxdmdRF2Vl1V9xjSqWzmOdDEXu2QYvR6ybg==
X-Received: by 2002:a05:6000:1f8c:b0:225:3bea:1ac9 with SMTP id bw12-20020a0560001f8c00b002253bea1ac9mr8275179wrb.65.1661845040671;
        Tue, 30 Aug 2022 00:37:20 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id g13-20020adfe40d000000b002252751629dsm8871598wrm.24.2022.08.30.00.37.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 00:37:19 -0700 (PDT)
Message-ID: <5a8a2b0d-fa7c-e8c6-bb04-152f8c17aa76@gmail.com>
Date: Tue, 30 Aug 2022 09:37:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH] soc: mediatek: mtk-svs: Explicitly include bitfield
 header
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20220829204439.3748648-1-nfraprado@collabora.com>
Content-Language: en-US
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220829204439.3748648-1-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_003723_329736_5D27951B 
X-CRM114-Status: GOOD (  14.79  )
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



On 29/08/2022 22:44, Nícolas F. R. A. Prado wrote:
> Commit a92438c5a30a ("soc: mediatek: mtk-svs: Use bitfield access macros
> where possible") introduced the use of FIELD_GET and FIELD_PREP macros,
> which are defined in the bitfield header. Add an explicit include for it
> so we're sure to have the symbols defined independently of the config.
> 
> Fixes: a92438c5a30a ("soc: mediatek: mtk-svs: Use bitfield access macros where possible")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 
> ---
> 
>   drivers/soc/mediatek/mtk-svs.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
> index 64dba9f830f3..f67f3e971653 100644
> --- a/drivers/soc/mediatek/mtk-svs.c
> +++ b/drivers/soc/mediatek/mtk-svs.c
> @@ -3,6 +3,7 @@
>    * Copyright (C) 2022 MediaTek Inc.
>    */
>   
> +#include <linux/bitfield.h>
>   #include <linux/bits.h>

What do we need the bits.h for?

Regards,
Matthias

>   #include <linux/clk.h>
>   #include <linux/completion.h>

