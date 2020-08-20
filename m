Return-Path: <SRS0=4nm1=B6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABFADC433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 09:13:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C511207DE
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 09:13:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="23yjiOMc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HAqCRnYo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C511207DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lY/uRN3GQPZXwl5013lVaSmOit5aflEBiQW69dlZ7+8=; b=23yjiOMc5zkyg/3hYksf26Ip6
	LqicYBqcOoEAJM5azxM8QMa4/UJ2bNdSEqDy35pj6cDlFgtDXE1FgMIGy++nqnBUTauGd9t4NIQVt
	biU8SF6EWvDJ43EBrrBOCRyoPPebH2ubIYPcLoZisjBlljGlR9wVp6izJIutw8qd2ncnXS7ad2tIH
	DbY+avL8GW2wQERFaJ42OrIAluk6Crr+ADFDV9/WoPIEGmMRKkWz5OGe/z/84pEXZ8ofYpwI3QEQY
	AmtmUjsJYhIoMZ1BoKU5mGNovHY70nyaIYyL2cWPF0BBqP42BQeXEeF98IayVSvDUPhPx6Rdy+wdP
	GcDw6W7Tg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8gdW-0006vf-Ou; Thu, 20 Aug 2020 09:13:30 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8gdU-0006vH-PW; Thu, 20 Aug 2020 09:13:29 +0000
Received: by mail-wr1-x442.google.com with SMTP id z18so1265784wrm.12;
 Thu, 20 Aug 2020 02:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0JbEGUpzUPbEtjAsVmRvH6bX5043+AS9qSE1XvD9D/U=;
 b=HAqCRnYoKh4shWP1Bh6iF2OQL1zyAwfk3BldT7lyFCXSdpMbI5McqVXvAg1y2E5Fl/
 PJRjYvURrqHmVTi6+1hqi+MzoxqmfJjkbsv2yAi3BiinfthNgiMYJFXnlbqQFxa6Z2+Q
 9USt7O5dHznyME7cQG9Pc9EGe6vfd/GJApL4neO9QkscPj91V6pZwbPzo5LMTMmWFm4i
 09CDuv2FV4cv8RPcIHCuHvYNgUP7CdFzpNOfobwbe7AYSX2EcHEDaEsgAxgG925H7BnC
 rPm2/6G8Ne1qVDOcsLcg11RLDMNcmshDznM87XgprKE9l3MFiwpM9U3ZkEhOmcSSBTI4
 n0UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0JbEGUpzUPbEtjAsVmRvH6bX5043+AS9qSE1XvD9D/U=;
 b=YPiw9J+gFULlN/vcz7mUcfyVf15nsbAVSbwtmVLF7gfjFuY2B0Z6Zt1Yj1uIz1ixmZ
 CKY7M3bz5UhhWUiaLv/sPjtGgiRJGIV+xfdFz5/OXQnsbSYFwi9SLrUhr20qoy80bDW1
 ZI1XpLXCF1ZCpJf9K3+hAzbHodvY/jKj+wa4/sd069990iNLZNq2Lw+phc4SlxaAdjbB
 Hla0pPTLukaEeJVGNMvEyh+unq3aTpUnUNycKIN95HeVr+1kAnbgHRvPb2vPx0a+/Saj
 7kApYsjLdG6SCyJimN28c26ilb4pF9pOPoUEdeHwnhQlvy7uqGtEB9igaW0SX0nqb060
 T2aQ==
X-Gm-Message-State: AOAM5337sUXxKdBMPa3JEpBh79mZvrKyKEkzEXgwCxjuN8bLpOF5k2wR
 z1a0rrklErOl0JZmi4AAcTjbbzuU1c6WtQ==
X-Google-Smtp-Source: ABdhPJxoY9JmdC2hvKhv7zPTHozm34JZIknaHlVUcr+Fi116POuZOZYfQqOQ5WVjgvJwAFPP1yh0VA==
X-Received: by 2002:a5d:464a:: with SMTP id j10mr2318764wrs.187.1597914807249; 
 Thu, 20 Aug 2020 02:13:27 -0700 (PDT)
Received: from ziggy.stardust (81.172.57.81.dyn.user.ono.com. [81.172.57.81])
 by smtp.gmail.com with ESMTPSA id
 a3sm3045157wme.34.2020.08.20.02.13.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Aug 2020 02:13:26 -0700 (PDT)
Subject: Re: [PATCH v1 00/21] add drm support for MT8192
To: Yongqiang Niu <yongqiang.niu@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>
References: <1597903458-8055-1-git-send-email-yongqiang.niu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <d723ec4f-b251-5a94-4939-01f2df61f7d8@gmail.com>
Date: Thu, 20 Aug 2020 11:13:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <1597903458-8055-1-git-send-email-yongqiang.niu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_051328_919611_FA1082BC 
X-CRM114-Status: GOOD (  18.47  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 20/08/2020 08:03, Yongqiang Niu wrote:
> Changes in v1:
> - add some more ddp component
> - add mt8192 mmsys support
> - add ovl mount on support
> - add 2 more clock into mutex device
> - fix ovl smi_id_en and fb null software bug
> - fix ddp compoent size config bug
> - add mt8192 drm support
> - add ddp bypass shadow register function
> - add 8192 dts description
> 
> Yongqiang Niu (21):
>    drm/mediatek: add component OVL_2L2
>    drm/mediatek: add component POSTMASK
>    drm/mediatek: add component RDMA4
>    mtk-mmsys: add mt8192 mmsys support
>    mtk-mmsys: add ovl mout on  support
>    drm/mediatek: add disp config and mm 26mhz clock into mutex device
>    drm/mediatek: enable OVL_LAYER_SMI_ID_EN for multi-layer usecase
>    drm/mediatek: check if fb is null
>    drm/mediatek: fix aal size config
>    drm/mediatek: fix dither size config
>    drm/mediatek: fix gamma size config
>    drm/mediatek: fix ccorr size config
>    drm/mediatek: add support for mediatek SOC MT8192
>    drm/mediatek: add bypass shadow register function call for ddp
>      component
>    drm/mediatek: add color bypass shadow register function
>    drm/mediatek: add ovl bypass shadow register function
>    drm/mediatek: add rdma bypass shadow register function
>    drm/mediatek: add dither bypass shadow register function
>    drm/mediatek: add aal bypass shadow register function
>    drm/mediatek: add ccorr bypass shadow register function
>    arm64: dts: mt8192: add display node
> 

At least regarding mmsys and dtsi patches, these are not based on upstream. 
Please rebase.

Regards,
Matthias

>   arch/arm64/boot/dts/mediatek/mt8192.dtsi    | 126 +++++++++++++++++++
>   drivers/gpu/drm/mediatek/mtk_disp_color.c   |  22 ++++
>   drivers/gpu/drm/mediatek/mtk_disp_ovl.c     |  41 ++++++-
>   drivers/gpu/drm/mediatek/mtk_disp_rdma.c    |  27 +++++
>   drivers/gpu/drm/mediatek/mtk_drm_crtc.c     |   3 +
>   drivers/gpu/drm/mediatek/mtk_drm_ddp.c      |  84 +++++++++++--
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  80 +++++++++++-
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   8 ++
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c      |  48 ++++++++
>   drivers/soc/mediatek/mmsys/Makefile         |   1 +
>   drivers/soc/mediatek/mmsys/mt8192-mmsys.c   | 182 ++++++++++++++++++++++++++++
>   drivers/soc/mediatek/mtk-mmsys.c            |   8 ++
>   include/linux/soc/mediatek/mtk-mmsys.h      |   6 +
>   13 files changed, 623 insertions(+), 13 deletions(-)
>   create mode 100644 drivers/soc/mediatek/mmsys/mt8192-mmsys.c
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
