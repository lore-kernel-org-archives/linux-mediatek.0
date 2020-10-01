Return-Path: <SRS0=Oval=DI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BB02C4727C
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Oct 2020 14:17:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21D402087D
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Oct 2020 14:17:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xKE1Wn5+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ditlDCKK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21D402087D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=M3s2/Fvj/hsa9vO2rkFBI9gTvX1LcHbaNNlSL3dEUG0=; b=xKE1Wn5+rI2sUWfpgHkTsOeMR
	JYKt1UtKNVAwzxTdoWok1dq25UPvLHPrGzwpYkqHIDP7hwqJZ4R2D+r8wjXs6jzc4gbKmV5tAKKYy
	9xeN3l5qbYVgv0LzEvtWsd4Y2UyWQVGHozZXKH1z8oIkPtoe6bHLgyrwnJD+dsfHVUyeT2/LyEbIG
	I/k0TEaRUZiN91hzHXopIq2OOiYahUYID3kcV9mmi8e51NFgOqne52KSoDiWUC2YUKarHZJnakscR
	fwwtn8FQes/p3G62/Qp6+nMAYVVA9XRYZofoudp/OLa/Fy1lt64mG7ogGG8gk4bNiGQV5v+GVJC4A
	A+F4o76Cg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNzOl-0003uo-Oo; Thu, 01 Oct 2020 14:17:31 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNzOe-0003qw-Hy; Thu, 01 Oct 2020 14:17:28 +0000
Received: by mail-wr1-x441.google.com with SMTP id x14so5964739wrl.12;
 Thu, 01 Oct 2020 07:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wrgbpSMujaBkBPxDtAAR67AoZk1S06YHAzySi1MsGYU=;
 b=ditlDCKKU9HqUqfVFjYSDHW942T4w9nZZt0RWGaRFgLJpwzM/pfBUyuBv6Hr7U1IqS
 XwvJR3w41IgTU938MCI3AljNPScbvZwirGpmDJ/G1Cedh1aBe/G0pKvI5/8SGRZ4flmw
 kmZvBd9+rPUXAIUdjD9DwXvigTmnENGDrAZqOdMylnHxeeyczkUP8Gsrnf0BzVV839gr
 KkhhIFhS1U+qriLRT7hCK6/tbMR/mAyq4+pKDlTt4tVViPzN7N/Y0uSZbdh2S9LKtDiM
 KyKSJD7gjLnIMjaOFnIHJVCDbLC03ioXlGgkC7LzMHTEXLNwxPQ204Nt4s+Ue4UcYMrn
 dejw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wrgbpSMujaBkBPxDtAAR67AoZk1S06YHAzySi1MsGYU=;
 b=XkuNfF096XjkV1J/oq6X+LpHTFaclaqJ9zY58Fnf2qwImZjwH14cR4Duu2yx2URfAN
 W0jC83v16jahCOFDz8G9oFQ2jybQi25snJSqZtV6lQUe0vQqvpEP/OAPedlqzMWlMfRB
 4BsljgUVUBLHVuy7I2iwRvGcpjPnO1G1YYTh1XTAW06goWyxF7vEmPUsbd5V9iQC21KY
 ZG0fJK/K89EM73dVopHCUCV4GvmjbX71FqQSe0n8rByBoi8IW6Itjpf2sRz6SBIAm0bk
 nS05kc7KeN7mvg1eVAqiIkmUAELiUPvDsHfy6eR3LPQ4OW6aFrY8CA1hLYBHL+ziT8/e
 Pf/g==
X-Gm-Message-State: AOAM533Aw84bvweqd6XCnZXXrnM5w2hW2mEtP8tU8TOCVDxzmeVkBDso
 QLM2QAnpYoDEtVXmkTInkIQ=
X-Google-Smtp-Source: ABdhPJzDdMobU6yFcAy6Zrkvz4ePQZ4w54ThvdXfXBqTNiIkY00AycivITxuDsvIy9DNgXukDplFXw==
X-Received: by 2002:a5d:43cb:: with SMTP id v11mr9707751wrr.188.1601561843371; 
 Thu, 01 Oct 2020 07:17:23 -0700 (PDT)
Received: from ziggy.stardust ([213.195.119.110])
 by smtp.gmail.com with ESMTPSA id h3sm10070951wrq.0.2020.10.01.07.17.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2020 07:17:22 -0700 (PDT)
Subject: Re: [PATCH v3 0/9] Mediatek MT8192 clock support
To: Weiyi Lu <weiyi.lu@mediatek.com>, Rob Herring <robh@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>
References: <1599103380-4155-1-git-send-email-weiyi.lu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <206e01ba-24a6-57b1-6768-b6629d713eb7@gmail.com>
Date: Thu, 1 Oct 2020 16:17:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1599103380-4155-1-git-send-email-weiyi.lu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_101724_698176_74E2C42D 
X-CRM114-Status: GOOD (  20.95  )
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
Cc: James Liao <jamesjj.liao@mediatek.com>, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Wendell Lin <wendell.lin@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Weiyi,

On 03/09/2020 05:22, Weiyi Lu wrote:
> This series is based on v5.9-rc1 and MT8192 dts[1].
> 
> [1] https://patchwork.kernel.org/cover/11713555/
> 
> changes since v2:
> - update and split dt-binding documents by functionalities
> - add error checking in probe() function
> - fix incorrect clock relation and add critical clocks
> - update license identifier and minor fix of coding style
> 
> changes since v1:
> - fix asymmetrical control of PLL
> - have en_mask used as divider enable mask on all MediaTek SoC
> 
> Weiyi Lu (9):
>    dt-bindings: ARM: Mediatek: Document bindings for MT8192 BSP
>    dt-bindings: ARM: Mediatek: Document bindings for MT8192 Audio
>    dt-bindings: ARM: Mediatek: Document bindings for MT8192 Multimedia
>    dt-bindings: ARM: Mediatek: Document bindings for MT8192 Camera
>    dt-bindings: ARM: Mediatek: Document bindings for MT8192 APU and GPU
>    clk: mediatek: Add dt-bindings for MT8192 clocks
>    clk: mediatek: Fix asymmetrical PLL enable and disable control
>    clk: mediatek: Add configurable enable control to mtk_pll_data
>    clk: mediatek: Add MT8192 clock support

This looks like a big mix of different changes and I don't see the relation 
between them.
To help facilitate the review process, I'd propose:
Any new binding with a new yaml file should be a single patch. Don't mix just 
adding one string with adding a new binding file in the same patch.

Split patch 9/9 into different patches, one for each driver. Otherwise it is 
nearly impossible to review such a big chunk of code.

Regards,
Matthias

> 
>   .../arm/mediatek/mediatek,apmixedsys.txt      |    1 +
>   .../bindings/arm/mediatek/mediatek,audsys.txt |    1 +
>   .../arm/mediatek/mediatek,camsys-raw.yaml     |   54 +
>   .../bindings/arm/mediatek/mediatek,camsys.txt |    1 +
>   .../bindings/arm/mediatek/mediatek,imgsys.txt |    2 +
>   .../arm/mediatek/mediatek,imp_iic_wrap.yaml   |   78 +
>   .../arm/mediatek/mediatek,infracfg.txt        |    1 +
>   .../bindings/arm/mediatek/mediatek,ipesys.txt |    1 +
>   .../arm/mediatek/mediatek,mdpsys.yaml         |   38 +
>   .../bindings/arm/mediatek/mediatek,mfgcfg.txt |    1 +
>   .../bindings/arm/mediatek/mediatek,mmsys.txt  |    1 +
>   .../bindings/arm/mediatek/mediatek,msdc.yaml  |   46 +
>   .../arm/mediatek/mediatek,pericfg.yaml        |    1 +
>   .../arm/mediatek/mediatek,scp-adsp.yaml       |   38 +
>   .../arm/mediatek/mediatek,topckgen.txt        |    1 +
>   .../arm/mediatek/mediatek,vdecsys-soc.yaml    |   38 +
>   .../arm/mediatek/mediatek,vdecsys.txt         |    1 +
>   .../arm/mediatek/mediatek,vencsys.txt         |    1 +
>   drivers/clk/mediatek/Kconfig                  |  146 ++
>   drivers/clk/mediatek/Makefile                 |   24 +
>   drivers/clk/mediatek/clk-mt2701.c             |   26 +-
>   drivers/clk/mediatek/clk-mt2712.c             |   30 +-
>   drivers/clk/mediatek/clk-mt6765.c             |   20 +-
>   drivers/clk/mediatek/clk-mt6779.c             |   24 +-
>   drivers/clk/mediatek/clk-mt6797.c             |   20 +-
>   drivers/clk/mediatek/clk-mt7622.c             |   18 +-
>   drivers/clk/mediatek/clk-mt7629.c             |   12 +-
>   drivers/clk/mediatek/clk-mt8173.c             |   28 +-
>   drivers/clk/mediatek/clk-mt8183.c             |   22 +-
>   drivers/clk/mediatek/clk-mt8192-aud.c         |  118 ++
>   drivers/clk/mediatek/clk-mt8192-cam.c         |   72 +
>   drivers/clk/mediatek/clk-mt8192-cam_rawa.c    |   59 +
>   drivers/clk/mediatek/clk-mt8192-cam_rawb.c    |   59 +
>   drivers/clk/mediatek/clk-mt8192-cam_rawc.c    |   59 +
>   drivers/clk/mediatek/clk-mt8192-img.c         |   60 +
>   drivers/clk/mediatek/clk-mt8192-img2.c        |   62 +
>   .../clk/mediatek/clk-mt8192-imp_iic_wrap_c.c  |   61 +
>   .../clk/mediatek/clk-mt8192-imp_iic_wrap_e.c  |   58 +
>   .../clk/mediatek/clk-mt8192-imp_iic_wrap_n.c  |   59 +
>   .../clk/mediatek/clk-mt8192-imp_iic_wrap_s.c  |   60 +
>   .../clk/mediatek/clk-mt8192-imp_iic_wrap_w.c  |   58 +
>   .../clk/mediatek/clk-mt8192-imp_iic_wrap_ws.c |   60 +
>   drivers/clk/mediatek/clk-mt8192-ipe.c         |   64 +
>   drivers/clk/mediatek/clk-mt8192-mdp.c         |   89 ++
>   drivers/clk/mediatek/clk-mt8192-mfg.c         |   57 +
>   drivers/clk/mediatek/clk-mt8192-mm.c          |  108 ++
>   drivers/clk/mediatek/clk-mt8192-msdc.c        |   57 +
>   drivers/clk/mediatek/clk-mt8192-msdc_top.c    |   71 +
>   drivers/clk/mediatek/clk-mt8192-scp_adsp.c    |   57 +
>   drivers/clk/mediatek/clk-mt8192-vdec.c        |   82 +
>   drivers/clk/mediatek/clk-mt8192-vdec_soc.c    |   82 +
>   drivers/clk/mediatek/clk-mt8192-venc.c        |   60 +
>   drivers/clk/mediatek/clk-mt8192.c             | 1340 +++++++++++++++++
>   drivers/clk/mediatek/clk-mtk.h                |    2 +
>   drivers/clk/mediatek/clk-mux.h                |   15 +
>   drivers/clk/mediatek/clk-pll.c                |   28 +-
>   include/dt-bindings/clock/mt8192-clk.h        |  592 ++++++++
>   57 files changed, 4116 insertions(+), 108 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,camsys-raw.yaml
>   create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,imp_iic_wrap.yaml
>   create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mdpsys.yaml
>   create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,msdc.yaml
>   create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,scp-adsp.yaml
>   create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,vdecsys-soc.yaml
>   create mode 100644 drivers/clk/mediatek/clk-mt8192-aud.c
>   create mode 100644 drivers/clk/mediatek/clk-mt8192-cam.c
>   create mode 100644 drivers/clk/mediatek/clk-mt8192-cam_rawa.c
>   create mode 100644 drivers/clk/mediatek/clk-mt8192-cam_rawb.c
>   create mode 100644 drivers/clk/mediatek/clk-mt8192-cam_rawc.c
>   create mode 100644 drivers/clk/mediatek/clk-mt8192-img.c
>   create mode 100644 drivers/clk/mediatek/clk-mt8192-img2.c
>   create mode 100644 drivers/clk/mediatek/clk-mt8192-imp_iic_wrap_c.c
>   create mode 100644 drivers/clk/mediatek/clk-mt8192-imp_iic_wrap_e.c
>   create mode 100644 drivers/clk/mediatek/clk-mt8192-imp_iic_wrap_n.c
>   create mode 100644 drivers/clk/mediatek/clk-mt8192-imp_iic_wrap_s.c
>   create mode 100644 drivers/clk/mediatek/clk-mt8192-imp_iic_wrap_w.c
>   create mode 100644 drivers/clk/mediatek/clk-mt8192-imp_iic_wrap_ws.c
>   create mode 100644 drivers/clk/mediatek/clk-mt8192-ipe.c
>   create mode 100644 drivers/clk/mediatek/clk-mt8192-mdp.c
>   create mode 100644 drivers/clk/mediatek/clk-mt8192-mfg.c
>   create mode 100644 drivers/clk/mediatek/clk-mt8192-mm.c
>   create mode 100644 drivers/clk/mediatek/clk-mt8192-msdc.c
>   create mode 100644 drivers/clk/mediatek/clk-mt8192-msdc_top.c
>   create mode 100644 drivers/clk/mediatek/clk-mt8192-scp_adsp.c
>   create mode 100644 drivers/clk/mediatek/clk-mt8192-vdec.c
>   create mode 100644 drivers/clk/mediatek/clk-mt8192-vdec_soc.c
>   create mode 100644 drivers/clk/mediatek/clk-mt8192-venc.c
>   create mode 100644 drivers/clk/mediatek/clk-mt8192.c
>   create mode 100644 include/dt-bindings/clock/mt8192-clk.h
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
