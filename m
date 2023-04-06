Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6FA1C76196
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Apr 2023 12:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+pf/5RTGQzng0+vJUHWj6WASxpHEz08X0S5cziiT2Jw=; b=LcUpj1Ic0thyGITHbDsxAv/ISf
	iKuW1nBisdAqV7ffTld11cD0x6D+tSoYb6BA3AoM+mePAFtsnnT7j8bKIfRRgROWFP9vT51vzs84E
	2LJUctt1A48iooxu6go9PTj5+Z8NigYBssQdYOOPMSY7gDD8zLcvGtPc+VASe4cjW+3g/yRjH0V2Q
	gSv0Cx3mjB9n1+C3ESSBNjWCArjq0sDX+3zeQEQM/TOm0F5e4js+dMirwWcq2ow292ETTt3L61J8S
	Ruh3N3Vz7GLHUTfDAvp4Re/h60/keP9fUcWDn6awF3U0133+q+XZ3tMY9PYrfoeMIIPIB1SYKQxGK
	fdaxnKRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkOTJ-007FYv-0R;
	Thu, 06 Apr 2023 12:12:09 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkOTG-007FWh-0n
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Apr 2023 12:12:07 +0000
Received: by mail-wm1-x32e.google.com with SMTP id n9-20020a05600c4f8900b003f05f617f3cso4477285wmq.2
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Apr 2023 05:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680783115;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+pf/5RTGQzng0+vJUHWj6WASxpHEz08X0S5cziiT2Jw=;
        b=ZlUsZGWYFDg4UhGyZPv8RhSfcEx4Yuh29/j2njqG+zXlBFNV3VKgPK7ASlefOt2GsT
         IsxrrbCuphO8maU7vKG+Spd8DlsLkNidD3grHLR4ZtnMdCUeW7XQl3e5PlGvOAwuQX2r
         bdE/ru14jVMewkELxyBeohX1VRQWA98AQZ/CmGq6qleGx7pjOXf+p0GlamSjW3rsOx0/
         z5Vs5DUv+jBL19DRgxe43vQtusq2nzMeWrIGYK8DMNbvvNqRx5zfdMALjrn5O9xIppvO
         HPweJUOyYZguX7v1ySLtS/kIx6hn2rQmB51IwYIu3RA6cP3wrwE1s8aTW74b3mqHv9Yl
         N41w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680783115;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+pf/5RTGQzng0+vJUHWj6WASxpHEz08X0S5cziiT2Jw=;
        b=IK0EnHyVeT1M9uxpWXsiXY+mKNiJVD6pVafdFcKQCI1Vx3utX6WHEkXESVqbAXlx+e
         WKIUjDkmyCHh6nQRrzLpn6GUqvxPFC3DfkW7yeUtTycbrM/NsSIZkBICTnRfHPYjSOGa
         uItonFRCS+NI6QWlbk4q+ewu+Bhbf4rB2vS3zdQxkSQBoqC2gZGsdq8o2n6IQ3sXemVm
         iSd2URJlSY/nOVGtbhsSenVW8kKAWqXxtB2X9JduhTv6GppdxdcfVfhZ/k0T3Q0ugD/i
         jVJiICHknuiRIRQd36rrQrjghJzVaps5GM2D1aOcZQpXRTs4rZr7SZrLuVxbyOr/+XL/
         i+SA==
X-Gm-Message-State: AAQBX9c95Q6QYGKzBIt7k5LnxTKtZhQesjhEvETGfHfw/Y7b8PXP5yPU
	LVj59se2OD4MMjoQBxAgJMKQJQ==
X-Google-Smtp-Source: AKy350bEuX8V/PWsyidAnBUufnyHVFnfsOg/uBPMZpwOMTR26CCH6LxdtsLiR7fDEczKi8Bp5EcK8A==
X-Received: by 2002:a7b:ce85:0:b0:3ee:2b04:e028 with SMTP id q5-20020a7bce85000000b003ee2b04e028mr7738048wmj.14.1680783114995;
        Thu, 06 Apr 2023 05:11:54 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id h4-20020a1ccc04000000b003ed2433aa4asm1413474wmb.41.2023.04.06.05.11.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 05:11:54 -0700 (PDT)
Message-ID: <296671a0-9434-23a2-848a-2f2ad2c280c3@linaro.org>
Date: Thu, 6 Apr 2023 14:11:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH] MIPS: Remove deprecated CONFIG_MIPS_CMP
Content-Language: en-US
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Serge Semin <fancer.lancer@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230405185128.15237-1-tsbogend@alpha.franken.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230405185128.15237-1-tsbogend@alpha.franken.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_051206_285681_5929E989 
X-CRM114-Status: GOOD (  10.92  )
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

On 5/4/23 20:51, Thomas Bogendoerfer wrote:
> Commit 5cac93b35c14 ("MIPS: Deprecate CONFIG_MIPS_CMP") deprecated
> CONFIG_MIPS_CMP and after 9 years it's time to remove it.
> 
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
> Marc, if you prefer an extra patch for the irqchip change, I'll
> split this. Otherwise I would take it through the MIPS tree.
> 
>   arch/mips/Kconfig                    |  34 +----
>   arch/mips/include/asm/rtlx.h         |   1 -
>   arch/mips/include/asm/smp-ops.h      |  16 ---
>   arch/mips/include/asm/vpe.h          |   4 -
>   arch/mips/kernel/Makefile            |   3 -
>   arch/mips/kernel/rtlx-cmp.c          | 122 ------------------
>   arch/mips/kernel/smp-cmp.c           | 148 ----------------------
>   arch/mips/kernel/vpe-cmp.c           | 180 ---------------------------
>   arch/mips/kernel/vpe.c               |   2 +-
>   arch/mips/mti-malta/Makefile         |   2 -
>   arch/mips/mti-malta/malta-amon.c     |  88 -------------
>   arch/mips/mti-malta/malta-init.c     |   2 -
>   arch/mips/mti-malta/malta-platform.c |   2 -
>   arch/mips/ralink/mt7621.c            |   2 -
>   drivers/irqchip/irq-mips-gic.c       |  26 ----
>   15 files changed, 3 insertions(+), 629 deletions(-)
>   delete mode 100644 arch/mips/kernel/rtlx-cmp.c
>   delete mode 100644 arch/mips/kernel/smp-cmp.c
>   delete mode 100644 arch/mips/kernel/vpe-cmp.c
>   delete mode 100644 arch/mips/mti-malta/malta-amon.c

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


