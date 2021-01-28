Return-Path: <SRS0=CkUm=G7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83D83C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 16:33:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2718364DF9
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 16:33:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2718364DF9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=shHxUq8kvFjmeUBb1d/3vTRPFYS9PChQiAVIDgAcQl8=; b=iNYP+mBXj3PHzGqM55BWpTxnt
	PmtahnOkrRw6C5ilcW43EyAcZc2DY7XLOvD5uYW/hnc1iObAQubv3U+GOvZw1ruilJ9vUXMvyVmin
	w5vZdk6aC7OP4jB/N+6lbkspAOWrUdDfsg6285Q7H//dil/ykAhU2dBf4sRmglYunhpII5f53GM71
	br6PrhmwhxTPlz6dLCdahrTAWoPcnygviFt8QnwZzwdeYygHyGT/HUaPoxSzpwi7Ttme39NVSMJym
	MXLSLpATO8MVfWdw3LDtU/NxyEIIaomKP9BcGQIFSguTmgfAmkY8F2ZAdY3zKRP5WoS3UA4atmeWG
	YmtKLIckQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5AEK-0005pm-Ts; Thu, 28 Jan 2021 16:33:12 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5AEH-0005nw-3j; Thu, 28 Jan 2021 16:33:10 +0000
Received: by mail-wr1-x434.google.com with SMTP id d16so5999992wro.11;
 Thu, 28 Jan 2021 08:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mS4VbiBmP+TiGI4tqZd3H3wmmFTbUqmfEe4EGj5uZTQ=;
 b=jALa73k4QK4Uy0+5UktdwYg0c7XpKg8EpVst2mobL07iI/od5OxnP30mSDNFqjQTVY
 /1l1XT0nI9+XoMnyTyM/fCLDV5QzyqbDq8o0D68xNu4wQRM1O2ELY5U94tZDQf3Zblj/
 aHYjZjRqjFI6A9KZTBLIhO+viSYci6LYSlOXJbofHlIIO0xfFWu2Bds6P+yR9MPx4CaH
 VblRiCZYw7f7hpxWVFx+7WsP8N13Aew8R2XYRT2mfTKIAKjJlchp58AJuFEctm841hVR
 yMMgZiqpdJmagniZ6mhrDbjVbbMDlNqvMgJ4lqkzL2DbMTMrs9etUdAnHI+SyU+zWJqv
 atgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mS4VbiBmP+TiGI4tqZd3H3wmmFTbUqmfEe4EGj5uZTQ=;
 b=Dad7lV6NaI1g7B1tw/obgbnU3dzRzSc9Udf5+NOqjrkTom1L/yJnEe0C60fyZWdIyZ
 7xL5K6evLwsl2g3hYMjleYROjGdsMTC2Qvr0VEn2h9asLA36TDqmTN1kZNaRPA6Ux6sf
 4RB9gwQQXRtsLW/2d/1mT1jbfizbJkSFw3l8hoCIkjBJRcB3YMtObtal0GgETp3Xt7Xp
 1YCovH/pjCSWgJ+VKD8YEltLG06CKiiBe8tPvdHeOMUezlLdY9d+QAe5YI6DqKWd+3G2
 NBGm5urepTTFWfh8ASsF13Ut7OdM4zScHI/32p+IHK8ICQhNW4QFBAW8nxkyLOmZvghC
 u5QA==
X-Gm-Message-State: AOAM530O+bwndezTHGzgKjjMyJvDkroyNnviJjobUDcG4C3ShsQ6EFRh
 9Qg1RoXWt3QDNCC7JS/8vco=
X-Google-Smtp-Source: ABdhPJzXc7RAcUzkhqmVzI5/o/6zMGEWLiJthw7dPGDuM3HIKgO1NIh8wZNNDVCWgLTJkb2rzY4xcg==
X-Received: by 2002:a5d:4443:: with SMTP id x3mr17870569wrr.409.1611851587974; 
 Thu, 28 Jan 2021 08:33:07 -0800 (PST)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id 62sm6630860wmd.34.2021.01.28.08.33.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jan 2021 08:33:07 -0800 (PST)
Subject: Re: [PATCH v12 2/8] arm64: dts: mt8183: refine gamma compatible name
To: Hsin-Yi Wang <hsinyi@chromium.org>, CK Hu <ck.hu@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20210128112314.1304160-1-hsinyi@chromium.org>
 <20210128112314.1304160-3-hsinyi@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <a8d5d947-532c-a9f9-d249-e1a0b246c41a@gmail.com>
Date: Thu, 28 Jan 2021 17:33:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210128112314.1304160-3-hsinyi@chromium.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_113309_769045_5A5221A7 
X-CRM114-Status: GOOD (  18.98  )
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
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 28/01/2021 12:23, Hsin-Yi Wang wrote:
> From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> 
> mt8183 gamma is different with mt8173
> remove mt8173 compatible name for mt8183 gamma
> 
> Fixes: 91f9c963ce79 ("arm64: dts: mt8183: Add display nodes for MT8183")
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

Applied to v5.11-next/dts64

Thanks

> ---
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 6c84ccb709af6..9c0073cfad452 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -1055,8 +1055,7 @@ aal0: aal@14010000 {
>  		};
>  
>  		gamma0: gamma@14011000 {
> -			compatible = "mediatek,mt8183-disp-gamma",
> -				     "mediatek,mt8173-disp-gamma";
> +			compatible = "mediatek,mt8183-disp-gamma";
>  			reg = <0 0x14011000 0 0x1000>;
>  			interrupts = <GIC_SPI 234 IRQ_TYPE_LEVEL_LOW>;
>  			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
