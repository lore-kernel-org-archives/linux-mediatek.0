Return-Path: <SRS0=3jAl=FB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 005E2C2D0E4
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 11:19:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7473520B80
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 11:19:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s9pjrEvf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Aqmp1axe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7473520B80
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DE5vW17gc+X0cTU3doDawHkjyS6FSwHdLnUL4XURJfA=; b=s9pjrEvfB5Ioss4Wxbm9PJHJs
	wypIujOBWXvkCqQhhW7bDdwbdCT9BzM6CAnIXWj6OU73w1c1F8qUDGx0ARPL8sumJ2TpjUsTqNU+9
	PTD2OuzYP3UUWLHa5VtSYYAsACrUH6iazrn466EnTKuQThl0Up8by9eKQEvBFVIxvtBkTvqB1YzCR
	X4ynyWTPNxZW2RhrfpbQ+Rk25VlFIPLL38+NkPyvuzL3nfJByg/zVKUNeF4k+P5BEZ0oNT7pc2rkW
	jS1owR+WnVAzDEToPA18gpzvgl7a5ULbg5pia3mvMggbAEUG0iiGrSACF4QS4Kezg8enhi+90dego
	rE2wgUVfQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kibmk-0006rE-8x; Fri, 27 Nov 2020 11:19:30 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kibmh-0006qn-Ud; Fri, 27 Nov 2020 11:19:28 +0000
Received: by mail-wm1-x342.google.com with SMTP id 3so2454295wmg.4;
 Fri, 27 Nov 2020 03:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hF3SHuCCDkYVTDSR8oZnGZ27xoM5f8wfP/n6iXDukMs=;
 b=Aqmp1axeCyL3KGHsKFnJB8UvWoStwHsnQkyozg0HJ+wMCo3j0hRI83VOBUExZ5Liin
 A27HSOASw5jJH58GpxMvdRAcKM6OgstnO15YiL/BYJzqDc7dLrSWLtKH1Ywtb/UHH1ak
 LxrcM6/caJXvcKhuS+lvUT2HDzjuHFfvp/wi8FP1AhJ85t7Y2sjBHB3uNdm9t8KNtdIt
 EX6dMyfc90H0YNoKG6CrokhYcTboWGTB/gDvINUPCkZJHCh3ieYTyGYFzCsB/PLWZMXc
 9H6uQkjUyMHr2bGR1PZ5LsH9KBLxCrxUO4rgDKdvw8y0SrNNFKPAJB0S+JlK3X+aB1rG
 geOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hF3SHuCCDkYVTDSR8oZnGZ27xoM5f8wfP/n6iXDukMs=;
 b=Z5thynMkYFFIGLq20EziSh3dF75zHtwIjoKhJdXS6tM85TEM8gDdaJbgQ8XtNw6qKh
 i8Crwi6uAo7o82wIQ21PIaWe+tRRUydx6TBhL5qaKUH0NUvTfR3IYXiI9Twn5M/u8RbA
 QKQKaTyIlhZ6zRf5MIaxj7dqbIU9NSEBJ9nqBA096qRHuJLnQ9sH+5cWhsiHvoebWCKK
 0LQ0VfW076TDDzWmgfJnsIyEKQv1Naqr+n+c2doI4RiuXihE/qbguX2I3Xk83XxxPv8v
 fcNMlxCP6LgjSS3Cd9moW+DmNR3QQcYBIE4wDDzZuhBpJCoS1zVXpmfMxFV4O1bMKykN
 6QtA==
X-Gm-Message-State: AOAM530wV2w79w6xXgqCTghIhwetrHmVLHZ2T/t6KNi0YX0raZgbF0QX
 YbU3vR2+qZkJncbXSl6Uuqv/FKrYmsVtUg==
X-Google-Smtp-Source: ABdhPJyOFM+XnfVxoasbZYT+/l65iZgIkXMlMnrGmRh9fJDIKbB0rxKSnpCMB4zLml/jlTVWsBCmPQ==
X-Received: by 2002:a1c:790c:: with SMTP id l12mr8258870wme.47.1606475966436; 
 Fri, 27 Nov 2020 03:19:26 -0800 (PST)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id a18sm7718933wrr.20.2020.11.27.03.19.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Nov 2020 03:19:25 -0800 (PST)
Subject: Re: [PATCH v4 00/16] soc: mediatek: pm-domains: Add new driver for
 SCPSYS power domains controller
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-kernel@vger.kernel.org
References: <20201030113622.201188-1-enric.balletbo@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <855248fc-8c57-22c8-c5a6-bcff3a0edeab@gmail.com>
Date: Fri, 27 Nov 2020 12:19:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201030113622.201188-1-enric.balletbo@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_061928_044969_7500CE99 
X-CRM114-Status: GOOD (  28.46  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Joerg Roedel <jroedel@suse.de>,
 weiyi.lu@mediatek.com, Rob Herring <robh+dt@kernel.org>, fparent@baylibre.com,
 Miles Chen <miles.chen@mediatek.com>, drinkcat@chromium.org,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 30/10/2020 12:36, Enric Balletbo i Serra wrote:
> Dear all,
> 
> This is a new driver with the aim to deprecate the mtk-scpsys driver.
> The problem with that driver is that, in order to support more Mediatek
> SoCs you need to add some logic to handle properly the power-up
> sequence of newer Mediatek SoCs, doesn't handle parent-child power
> domains and need to hardcode all the clocks in the driver itself. The
> result is that the driver is getting bigger and bigger every time a
> new SoC needs to be supported.
> 
> All this information can be getted from a properly defined binding, so
> can be cleaner and smaller, hence, we implemented a new driver. For
> now, only MT8173 and MT8183 is supported but should be fairly easy to
> add support for new SoCs.
> 

All patches are pushed:
DT-bindings went to v5.10-next/pm-domains-stable as they are needed by both soc 
and dts64 branch.

Regards,
Matthias

> Three important notes:
> 
> 1. This patch depends now on [1] to build correctly.
> 
> 2. Support for MT8183 is not ready to land yet because has some
>     dependencies, i.e mmsys support is still missing.
> 
> 3. Support for MT8192. I picked the patches [2] from Weiyi Lu and
>     adapted to this new series. I posted only for reference due that this
>     new version has some changes that affects that patchset.
> 
> Only patches from 1 to 9 are ready, the others are provided for reference and test.
> 
> [1] https://lore.kernel.org/patchwork/patch/1328096/
> [2] https://patchwork.kernel.org/project/linux-mediatek/list/?series=368821
> 
> Best regards,
>    Enric
> 
> Enric Balletbo i Serra (5):
>    dt-bindings: power: Add bindings for the Mediatek SCPSYS power domains
>      controller
>    soc: mediatek: Add MediaTek SCPSYS power domains
>    arm64: dts: mediatek: Add mt8173 power domain controller
>    dt-bindings: power: Add MT8183 power domains
>    arm64: dts: mediatek: Add smi_common node for MT8183
> 
> Matthias Brugger (8):
>    soc: mediatek: pm-domains: Add bus protection protocol
>    soc: mediatek: pm_domains: Make bus protection generic
>    soc: mediatek: pm-domains: Add SMI block as bus protection block
>    soc: mediatek: pm-domains: Add extra sram control
>    soc: mediatek: pm-domains: Add subsystem clocks
>    soc: mediatek: pm-domains: Allow bus protection to ignore clear ack
>    soc: mediatek: pm-domains: Add support for mt8183
>    arm64: dts: mediatek: Add mt8183 power domains controller
> 
> Weiyi Lu (3):
>    dt-bindings: power: Add MT8192 power domains
>    soc: mediatek: pm-domains: Add default power off flag
>    soc: mediatek: pm-domains: Add support for mt8192
> 
>   .../power/mediatek,power-controller.yaml      | 293 +++++++++
>   arch/arm64/boot/dts/mediatek/mt8173.dtsi      | 164 +++--
>   arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 172 +++++
>   drivers/soc/mediatek/Kconfig                  |  12 +
>   drivers/soc/mediatek/Makefile                 |   1 +
>   drivers/soc/mediatek/mt8173-pm-domains.h      |  94 +++
>   drivers/soc/mediatek/mt8183-pm-domains.h      | 221 +++++++
>   drivers/soc/mediatek/mt8192-pm-domains.h      | 292 +++++++++
>   drivers/soc/mediatek/mtk-infracfg.c           |   5 -
>   drivers/soc/mediatek/mtk-pm-domains.c         | 614 ++++++++++++++++++
>   drivers/soc/mediatek/mtk-pm-domains.h         | 102 +++
>   include/dt-bindings/power/mt8183-power.h      |  26 +
>   include/dt-bindings/power/mt8192-power.h      |  32 +
>   include/linux/soc/mediatek/infracfg.h         | 107 +++
>   14 files changed, 2081 insertions(+), 54 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
>   create mode 100644 drivers/soc/mediatek/mt8173-pm-domains.h
>   create mode 100644 drivers/soc/mediatek/mt8183-pm-domains.h
>   create mode 100644 drivers/soc/mediatek/mt8192-pm-domains.h
>   create mode 100644 drivers/soc/mediatek/mtk-pm-domains.c
>   create mode 100644 drivers/soc/mediatek/mtk-pm-domains.h
>   create mode 100644 include/dt-bindings/power/mt8183-power.h
>   create mode 100644 include/dt-bindings/power/mt8192-power.h
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
