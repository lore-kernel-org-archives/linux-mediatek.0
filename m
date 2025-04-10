Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A10ABC3601E
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Apr 2025 13:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wMQZClxt/r11IMD+9AiWAlz3lBENpTb7OT4Ug6+9SZk=; b=ZXn+H8ig19ghUTYpy/YUs18z3I
	YCeaYroOOCu+Q6wotVhdA5YJuXtCdzno0AsBy+oC1wEFprtOjsQXp+wj2M0neGVTFzzoYEQEq/te5
	xhBfDMf9Scfu1HxevEpkPTBjwMTW+HqGApA+v4cWTGeJFfTMBx9NhG6TorvHBC7HRRn0oThn7yvCu
	751LGeYizR7HCIDyXLyW6qM3Vw2PMZX7gXcrwocc5vL34MzLrT6WsAiZk2sEnlTxXU7rW/yMfOMQR
	Q46PfvCrmmT8QRSkkphGb4dt4NSJY4052m0kgn+y0nkPDAVBb8H+OLGe1FVWRZjhg+12i6fKdWWtn
	6P/q8gag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2rrN-0000000AeFT-1upL;
	Thu, 10 Apr 2025 13:22:25 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2rqp-0000000Ae7N-1Z0k
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Apr 2025 13:21:52 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-730517040a9so871251b3a.0
        for <linux-mediatek@lists.infradead.org>; Thu, 10 Apr 2025 06:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744291310; x=1744896110; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wMQZClxt/r11IMD+9AiWAlz3lBENpTb7OT4Ug6+9SZk=;
        b=WEEygWfLnfyQ/GHqAyZpvLFjVCJdmu3x1FlSZ/pSLd5fmxYQkaGywxCDskyxitaG42
         wHMptZzJC6/PHrpRwWvwDqpj9UYn/LAhOWGywfU1EBS/ZYu7pTA+pEq+BniK1W3aQvEd
         HTkzaOlNUdR6MKwPkOW9wt67sD47Ae3llQA2C1XWDVxzx5CTSEs/VUvBL9T4Qu0OERpt
         iQkdQDExpU8T255NW8GELRD5iUZQpOPCdw+AiSsimtYJFQWOvlKl2OX0n2Jeo9qNEqES
         ICX10Wi98/Nk6rqwG0iN5Dp9JPx0DxcuH9H3spucRjGtTivIh0J6mKGVrjm26qnW/cgQ
         B9kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744291310; x=1744896110;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wMQZClxt/r11IMD+9AiWAlz3lBENpTb7OT4Ug6+9SZk=;
        b=r1HY+3l0njXcYsYb0FDSUQbTlVRm4pN+oBuMWh8lLviqJecAellJ5xdpzWZoBZHMT0
         w3pnS9k2WRfV6AiW2cSofdqv6W5A5EH7YJvI/Y0BDXrIN9cG8eOgBo76T0zBvYumeuVV
         3Q5joaNLcyO1rW2opPHT9FPR2hBJhzfiys0oSmlcBSD6V97YuZ9F5oaO2S8fHbxr9asv
         WX4GtDQtmaYjBgp9QoV9LI8wQLA+UGq262mbQgFnAXrY9swbxOF8gbckPWZqbYd0RwVl
         1kpWoC0kKmXJX7ael0FaycxOH5f1CZJ1aDzutYEgzwnNnSHnyBaW7InB9Mjf2SKFUUnW
         N3pg==
X-Forwarded-Encrypted: i=1; AJvYcCV4XWJa/YY3PMY47bae1BTV1LIaojb39VoBRg2DYNVj6VzRARyw6whrmJphZJl+efL265R0DlQ7OdxPQll2yA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwJ5zfZ+BOzdU1KTp5Msm6ytT3SSn5upnmAaKIyU/JY7Yvikjpu
	R59oMHZnfnMxexqn2a89U15ZOuuHIMCrkSjP9JL1xVfx6dHb16FP5AzFQurtWWtuALWx+e2it70
	CaUsjIBub/cLqMEw41UREAjtAdPuZmMNDuPCGew==
X-Gm-Gg: ASbGncuinapqDeuD9u9sWyzkz3cvkqI/8xO/wsup0AXNB1lD8yOokxU7rjtZx+mtU5P
	+msoStaWxT29vcGCPRXH6GShTiT4ScBIl0dyETg3z6h+CKo5S/WaUGm3y7xhXXcXi1kQOJQ8ywo
	4iTPbqh1RrgqVvh3Q+mkPfGT0=
X-Google-Smtp-Source: AGHT+IEL3aq17l9YVyu03lvnUk5C6k7qYVWUuIutjM7+77MtfedWhhLez/73fsO+lOMiT2oK1ZOolvmazkYHCs2MYjA=
X-Received: by 2002:a05:6a20:d48d:b0:1fe:90c5:7ceb with SMTP id
 adf61e73a8af0-201695d9c45mr5523489637.40.1744291310083; Thu, 10 Apr 2025
 06:21:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250409032917.7580-1-yiru.zhang@mediatek.com> <20250410095158.8966-1-yiru.zhang@mediatek.com>
In-Reply-To: <20250410095158.8966-1-yiru.zhang@mediatek.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 10 Apr 2025 14:21:39 +0100
X-Gm-Features: ATxdqUF3Uhi02-Atot1ZYsCo3BPZFPm0ByTzdzbrh7QkbsgdDvRRnbSTXsdXDf4
Message-ID: <CAJ9a7Vjr+O7wueNc1kmFt-Up2qzFXcSabgoBeb5e+rW8Z3_3Qw@mail.gmail.com>
Subject: Re: [PATCH] [Patch v3]Add ETE devarch condition in etm4_init_iomem_access
To: yiru zhang <yiru.zhang@mediatek.com>
Cc: alexander.shishkin@linux.intel.com, 
	angelogioacchino.delregno@collabora.com, coresight@lists.linaro.org, 
	james.clark@linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	matthias.bgg@gmail.com, suzuki.poulose@arm.com, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_062151_416866_8558E53A 
X-CRM114-Status: GOOD (  19.15  )
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

Hi,

Please stop using the unusual title format of [PATCH}[Patch v3] - use
the git command line options to ensure the format is e.g. [PATCH v3]

What is the reason that your device cannot use the system instructions
to access the ETE? Using a memory interface, if implemented, is only
recommended for external debuggers, or on systems where the
implementation of system register access is not working.

On Thu, 10 Apr 2025 at 10:52, yiru zhang <yiru.zhang@mediatek.com> wrote:
>
> Due to ETE supported, so add ETE devarch condition in etm4_init_iomem_access.
>
> Signed-off-by: yiru zhang <yiru.zhang@mediatek.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202504101759.7Ls0Uy4o-lkp@intel.com/
>
> v1->v2: use switch case way
> v2->v3: clean build warning
> ---
>  drivers/hwtracing/coresight/coresight-etm4x-core.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 2b8f10463840..4002a2823fd0 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -1135,11 +1135,15 @@ static bool etm4_init_iomem_access(struct etmv4_drvdata *drvdata,
>          * with MMIO. But we cannot touch the OSLK until we are
>          * sure this is an ETM. So rely only on the TRCDEVARCH.
>          */
> -       if ((devarch & ETM_DEVARCH_ID_MASK) != ETM_DEVARCH_ETMv4x_ARCH) {
> -               pr_warn_once("TRCDEVARCH doesn't match ETMv4 architecture\n");
> +       switch (devarch & ETM_DEVARCH_ID_MASK) {
> +       case ETM_DEVARCH_ETMv4x_ARCH:
> +       case ETM_DEVARCH_ETE_ARCH:
> +               break;
> +       default:
> +               pr_warn_once("Unknown ETM architecture: 0x%lx\n",
> +                            devarch & ETM_DEVARCH_ID_MASK);
>                 return false;
>         }
> -
>         drvdata->arch = etm_devarch_to_arch(devarch);
>         *csa = CSDEV_ACCESS_IOMEM(drvdata->base);
>         return true;
> --
> 2.46.0
>

Otherwise -

Reviewed-by: Mike Leach <mike.leach@linaro.org>
-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

