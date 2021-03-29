Return-Path: <SRS0=9jr7=I3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F089C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 22:38:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2959C617C9
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 22:38:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2959C617C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3aOlNTg1MKbBN3Z0UDUm+Sr56mDTfLjtmqziJoeyVqs=; b=FP/x1V7EsKKs9TLzfwrPh0QIj
	EJCvC/wq2FU5hqfuC7Jm70Om09cMCiBlcNXdXLXGrnctianHGuVRv6YfivjSQdTxIyPSMCJos2VKb
	kY0d2B+XF0k6aCZZmtlPFEX1UHQmsMfPtJZE1wL1yc/ueJOheJSpAKRcI/aw90ZjRNCVJ+fzAw7Kp
	/wYXsYcG5UWc9hZL4Qf6QWFxN/XVGJBudyhz/3WDIxUVxM11Q2IBblK9AfjEkAscf/8ITfKNbW2Vz
	ecysobswCSRdhrZwDHuz++ENh9Egi6W6FxkIuMrY9FUirkiYUgBXSHRcxTunbY/PwWHlJFxlWD7eG
	vAhB/dRaA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR0Wo-001idd-Ug; Mon, 29 Mar 2021 22:38:35 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQsEq-000grP-6X; Mon, 29 Mar 2021 13:47:29 +0000
Received: by mail-wr1-x429.google.com with SMTP id j7so12966515wrd.1;
 Mon, 29 Mar 2021 06:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FK45Q4UevMt4C1ovIeZMlV1i3u3GKa0Tu00QKkrxNG0=;
 b=DamKu1sw/d6YP4J90Cj2Cn8C7Af1GXV9idjHNa+dQ5eLBfy7twFECt3SIxHWPdC1OD
 zKLvJjaiAhp0Q1TBfTHnYPWWLl3WM/wO6s2D7hffQbTLyjuMJXfMyS6okI2t7mkYOlZ+
 Gog2AIzdp33f/L19H1zus/SzRUQOkt18vCRtxtMwXVxLgRo0avaNuMjkTO0xTAVLQ44T
 Tah4xSiq7QkD97+SJmDuO+GUW+W432TsUvfiA4Y6AskUURuxFw+rqPwrZ7tXMUNqPrve
 RN/AAgfVwYXZVCBY4I7OalgdmZ3O1D9w80IBJMHfuvxEnfkEYhQh8m2uMN/HqCl+TJbU
 wM2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FK45Q4UevMt4C1ovIeZMlV1i3u3GKa0Tu00QKkrxNG0=;
 b=dkcoeuQtigzHBbY9rvPqxS+1y50wpf42BOHflbUfMAorsPsoLjosJ2yKWxTHY0xHNt
 ZqP69Hy9Q9vxMTwG3LctxcplxG8A+zAx2FYFq8+R3MvvHeZYGoRNnUfCSu/f1V51uMlP
 t7pSXAypWhSJwjIZORcDpUNtEweLkMnCkoxMTWh92DWdg10n/sedO6+lr7XAoeI2S4s1
 wUZS8nuQeaVgpnDJM9avpUlItt8MyhuKa5lhSNAvtXgkG/CJ3BG+VhV9JW447G4mRFjz
 NtMhVV2fnIdlAm3Mz63n0af9KgvIvg3l5bfmF6OLjfiYF5SBVEt06YHULYvv5v+j4bFw
 p1jg==
X-Gm-Message-State: AOAM533dTT3VITkueHFYljSDRg+FqWYye3UtbFZc35aazqasYAclKgt0
 mEPuzuiGrd2J2ryWGPv0edE=
X-Google-Smtp-Source: ABdhPJwMsREL7zHuATNR2GnBeA2/RuGUZ0DDadqnklrQuaoy06/CcvgFgav5KVcwSP2TiD1bV+A+fg==
X-Received: by 2002:a5d:6a4c:: with SMTP id t12mr28076521wrw.289.1617025647683; 
 Mon, 29 Mar 2021 06:47:27 -0700 (PDT)
Received: from ziggy.stardust (80.174.240.175.dyn.user.ono.com.
 [80.174.240.175])
 by smtp.gmail.com with ESMTPSA id m17sm30886347wrx.92.2021.03.29.06.47.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Mar 2021 06:47:27 -0700 (PDT)
Subject: Re: [PATCH v5 11/13] arm: dts: mt7629: harmonize node names and
 compatibles
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Jie Qiu <jie.qiu@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, Cawa Cheng <cawa.cheng@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20210316092232.9806-1-chunfeng.yun@mediatek.com>
 <20210316092232.9806-11-chunfeng.yun@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <c40af3a0-e28c-00e4-e2e0-e29d5166215a@gmail.com>
Date: Mon, 29 Mar 2021 15:47:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210316092232.9806-11-chunfeng.yun@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_144728_363112_C7DE2CF6 
X-CRM114-Status: GOOD (  16.36  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 16/03/2021 10:22, Chunfeng Yun wrote:
> This is used to fix dtbs_check warning
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Applied now to v5.12-next/dts32

> ---
> v2~v5: no changes
> ---
>  arch/arm/boot/dts/mt7629.dtsi | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/mt7629.dtsi b/arch/arm/boot/dts/mt7629.dtsi
> index 5cbb3d244c75..874043f0490d 100644
> --- a/arch/arm/boot/dts/mt7629.dtsi
> +++ b/arch/arm/boot/dts/mt7629.dtsi
> @@ -329,8 +329,9 @@
>  			status = "disabled";
>  		};
>  
> -		u3phy0: usb-phy@1a0c4000 {
> -			compatible = "mediatek,generic-tphy-v2";
> +		u3phy0: t-phy@1a0c4000 {
> +			compatible = "mediatek,mt7629-tphy",
> +				     "mediatek,generic-tphy-v2";
>  			#address-cells = <1>;
>  			#size-cells = <1>;
>  			ranges = <0 0x1a0c4000 0xe00>;
> @@ -413,14 +414,15 @@
>  			};
>  		};
>  
> -		pciephy1: pcie-phy@1a14a000 {
> -			compatible = "mediatek,generic-tphy-v2";
> +		pciephy1: t-phy@1a14a000 {
> +			compatible = "mediatek,mt7629-tphy",
> +				     "mediatek,generic-tphy-v2";
>  			#address-cells = <1>;
>  			#size-cells = <1>;
>  			ranges = <0 0x1a14a000 0x1000>;
>  			status = "disabled";
>  
> -			pcieport1: port1phy@0 {
> +			pcieport1: pcie-phy@0 {
>  				reg = <0 0x1000>;
>  				clocks = <&clk20m>;
>  				clock-names = "ref";
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
