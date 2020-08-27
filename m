Return-Path: <SRS0=xkEi=CF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA5A1C433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 10:14:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89965207F7
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 10:14:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T0Z3WTEa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T8XIF+kh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89965207F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6EsDD5ww1cDomR+xrmxYOCXdG7diRBF34MTduGSIm0M=; b=T0Z3WTEa0pDrD51AppNyXNJ5b
	hmZ7F/QaKow8VbhsMFwqNTaVzhy0qVOsIirRRHQB7ZBzyez/qkBmghWnfiR6DcLEgkOJ19TJY9/6K
	v95ryuVJRTfIMKfKVA2r9DSU4JTGj5KtM67ctaNqQTSP7l0p6d2k2Vdh8RQLvfyRQ7wNyRzlkN8JF
	aTcqn6V9EOr9C+GHb/306qmUKIT5hoi1qm0q49IHfzog2zREgZUIqd5UsaXj156/STo43FA6N+ZC6
	CHMLtTjvoncHDpc4+cwg+C/3imDZaooAy3V83NX9mm98Hp9BUq52RL36MdSvL1jQCdA7yKtqHVhmE
	NJDl342bQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBEvA-00051Q-Jv; Thu, 27 Aug 2020 10:14:16 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBEv8-00050t-W0; Thu, 27 Aug 2020 10:14:15 +0000
Received: by mail-wr1-x441.google.com with SMTP id y3so4808048wrl.4;
 Thu, 27 Aug 2020 03:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tJ2qBYy1J9smz6qD4q0DxxYWxBNZOLm22YIjuTjWy58=;
 b=T8XIF+khS4jpM77nipAtN+a/XOqeLm8xxGRePhStxNqWXy8Gu4z4Zb1CfJOCXvI7en
 qWVVlK5OZtOsctcmy5ojT08hByjmpmKQ3PbiuCXftsjw4oUEQmJ5oM+Dity207FYBjbl
 1ZmoVCpQ7/mK6ocozChiIBfAluWAUwssRcKDO/eGvb6dmK0FRssyLyeMs3Y0SXiKhz0+
 SzG+d5dYoBNxNuomF0+q9ZnuINlQXZFEWOMrGh1TjF0kfJFgu0XGTcb4mtiXQusMIKJu
 UcRNJxNXbnGHfl+Ei631aBDn0Oj1oKLj64V6DAkELJ5TbWutoqWIjVjcQgoVF2Y2Rj35
 cPrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tJ2qBYy1J9smz6qD4q0DxxYWxBNZOLm22YIjuTjWy58=;
 b=AvsTG4MC4nmX7gYpg/oi+zCtxBMuRNp9GfUhjhtO0t86peDwsQZg9dDzpRHVYmBQfI
 bd4woW0lxMHJOm/uu3Nu3cckpHpygyaGHSTRtsiHLkSZHIJpP5q8xNJzKHOZZ0BL3B49
 IOTC8JMH/1icRy3ovgYeW8R24uTgWVqoe0lmOasENOHQBbyMiJ1TLbVp6G0hd9/jkRxp
 MAceZEwKfRu3gmSBDPuUBJiNl5L75qQTjKlfoQjprO7lFA1ym4KkTKr9c9v2OGjitWU/
 cIsLLY+7stPmZ/YvagG78fEhKTWk6XVROAlm7PjpPCrWgKZWeuIyvuJ3xYZJIT9i28tK
 NZ6A==
X-Gm-Message-State: AOAM530/ptuCrAg5I5I/O6FhmpE7BbNir/KnGOtY3JLBsGIrLGRHgz33
 PSeV0fVfJH9A1oQBgukYKus=
X-Google-Smtp-Source: ABdhPJzoaFIsQ+ZYOs5pL6W9QlfgL20KwUOQGWj00SwcVaCQQLHNo9AfR5mkWRaX9EBKsqRQguNZmg==
X-Received: by 2002:adf:8401:: with SMTP id 1mr19272710wrf.274.1598523253871; 
 Thu, 27 Aug 2020 03:14:13 -0700 (PDT)
Received: from ziggy.stardust ([213.195.119.187])
 by smtp.gmail.com with ESMTPSA id b204sm4736840wmd.34.2020.08.27.03.14.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Aug 2020 03:14:13 -0700 (PDT)
Subject: Re: [PATCH v21 4/4] arm64: dts: mt8183: add scp node
To: Pi-Hsun Shih <pihsun@chromium.org>
References: <20191112110330.179649-1-pihsun@chromium.org>
 <20191112110330.179649-5-pihsun@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <2abf8fdd-7b7c-73b0-beea-9c9ac56869dc@gmail.com>
Date: Thu, 27 Aug 2020 12:14:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20191112110330.179649-5-pihsun@chromium.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_061415_096931_7CC27285 
X-CRM114-Status: GOOD (  21.95  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Alexandre Courbot <acourbot@chromium.org>,
 Erin Lo <erin.lo@mediatek.com>, open list <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Eddie Huang <eddie.huang@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 12/11/2019 12:03, Pi-Hsun Shih wrote:
> From: Eddie Huang <eddie.huang@mediatek.com>
> 
> Add scp node to mt8183 and mt8183-evb
> 
> Signed-off-by: Erin Lo <erin.lo@mediatek.com>
> Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
> Signed-off-by: Eddie Huang <eddie.huang@mediatek.com>

Sorry I somehow oversaw this. Next time please don't doubt to ping me.

Bjorn, do I understand correctly that you don't send emails to the list 
informing of the inclusion of a patch/series in your tree?

Anyway applied now to v5.9-next/dts64 :)

Thanks!

> ---
> Changes from v20 ... v14:
>   - No change.
> 
> Changes from v13:
>   - Change the size of the cfg register region.
> 
> Changes from v12 ... v10:
>   - No change.
> 
> Changes from v9:
>   - Remove extra reserve-memory-vpu_share node.
> 
> Changes from v8:
>   - New patch.
> ---
>   arch/arm64/boot/dts/mediatek/mt8183-evb.dts | 11 +++++++++++
>   arch/arm64/boot/dts/mediatek/mt8183.dtsi    | 12 ++++++++++++
>   2 files changed, 23 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> index 1fb195c683c3..ddb7a7ac9655 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> @@ -24,6 +24,17 @@ memory@40000000 {
>   	chosen {
>   		stdout-path = "serial0:921600n8";
>   	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +		scp_mem_reserved: scp_mem_region {
> +			compatible = "shared-dma-pool";
> +			reg = <0 0x50000000 0 0x2900000>;
> +			no-map;
> +		};
> +	};
>   };
>   
>   &auxadc {
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 10b32471bc7b..e582f5e6691d 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -269,6 +269,18 @@ pwrap: pwrap@1000d000 {
>   			clock-names = "spi", "wrap";
>   		};
>   
> +		scp: scp@10500000 {
> +			compatible = "mediatek,mt8183-scp";
> +			reg = <0 0x10500000 0 0x80000>,
> +			      <0 0x105c0000 0 0x19080>;
> +			reg-names = "sram", "cfg";
> +			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&infracfg CLK_INFRA_SCPSYS>;
> +			clock-names = "main";
> +			memory-region = <&scp_mem_reserved>;
> +			status = "disabled";
> +		};
> +
>   		systimer: timer@10017000 {
>   			compatible = "mediatek,mt8183-timer",
>   				     "mediatek,mt6765-timer";
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
