Return-Path: <SRS0=k4UB=JD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 160E1C433B4
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 11:28:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC64C61241
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 11:28:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC64C61241
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AnfZoxDC2Z9NftDnMGFgoJCqJMymmAQamES8cUmZvWI=; b=RhGHkV4XNqLVx0lNLBfJfRRl0
	zIeF8NICbQ8yLonpnKVBwZRcHca/zEzbFGhabPLJMR+FP0S+8NSKsh9vYFiErj9mgjQSLQwnpAcEV
	lSO+thI8vcTnfs7TDLRPME6CJJCkE+AUHJiDYYetG9Rmza2CiFgChuqg6gcRMtfJCKQclRKTJHo9W
	lWc9WUfKQ3Jwyn0imeGj5jspAEtqDr09T+3MR0lVx8xTIUqAHycxIUb3mm06khYR/FdSihdRhrdV/
	UdB1r1dz1OiTiV0T5uOnNtqE9L/qKHbzvW+WKM5KVWeatkX4C1txRXPA7Fdpp+hitsg4XDgWs5ZuD
	pebi7g4Yw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTjsE-002Jii-GT; Tue, 06 Apr 2021 11:27:58 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTjs8-002JgV-3Y; Tue, 06 Apr 2021 11:27:53 +0000
Received: by mail-pj1-x102e.google.com with SMTP id
 mj7-20020a17090b3687b029014d162a65b6so3561996pjb.2; 
 Tue, 06 Apr 2021 04:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+rth/nHmUnQf52riud1YrL6q82iGG5PK/8trv5J4+co=;
 b=QTIqZ2H783z+wmwRtAW+O3ePO+S1h2eZwzAdqRclTNeG1gobwoxvN5u1KB+0XkSJ3L
 OI0CIQM+8psTIc9F6J4Lo6rl4YrXY6ahpKJjdRIYJaf3WJEvJmKtJojOGo9RCLJddNtu
 YyTafE463KKoheLn1OuDAtJsgxqrseHlEAhOxxYO0kNbf3EVzpJgN3hcQfKur0YG1Ccu
 RnOdyBeoj7TYnLyk9EVwxK+k/r80jIZqGs2Tt5TILpjrjlxzhgrn473mkPZZ3SKqeoa0
 mInDD4/+7cVG1wr4GFd7h+/7Y1zhtG9GFF7bDMt//OQRlRxXJnJTY5GgtjfkH5cmc9uU
 nzUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+rth/nHmUnQf52riud1YrL6q82iGG5PK/8trv5J4+co=;
 b=nWSt6fukYKJJvkKOLPoOX1cbsTKa8Q6J0XF86cRgUlbo6bDauaXpxXx20qAG60lGgW
 3ovf2xKos2Y0YhxZA+KyfXoQYkjcJ9G5GNwCdwVw1eVRu8LygENU6PThrWx5vXp0BWJF
 lpCfworM0jh3ORsDi/Ebcwu5km87CpwsaAhukFzDGofbKLoD0DxxsJri5IcYfjJgME29
 Xm7XqfC4FfpaPelLgB2JUDNDBMhfbvGu1OoIpIDp9gLdj2VuZeM71VfWu+oi30Fctqtx
 pog9bdofeeMmHpsI9SgHqSqHAxpRFHkjPotiGJvH1jfYoO9ZR7NcfRLIZ2dSP8zpGbt7
 HI4w==
X-Gm-Message-State: AOAM5321P8n4eW+RiMqTlHJEFlaRkWbYP8fMJ4p3msav4mMEwdZbbpsO
 Wjfyg6m/W4eI42VwX7o7YW8=
X-Google-Smtp-Source: ABdhPJyvoEXh04NDqgmeAqYNOK2QcjgSNeGxNjKk7DJIxgYVXlDz44TWqvfoyfnBKXsrBi2y17O1Dg==
X-Received: by 2002:a17:90b:1198:: with SMTP id
 gk24mr3906181pjb.73.1617708470692; 
 Tue, 06 Apr 2021 04:27:50 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id l191sm2330684pfd.36.2021.04.06.04.27.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Apr 2021 04:27:50 -0700 (PDT)
Subject: Re: [PATCH 2/5] arm64: dts: mediatek: mt8167: add smi_common node
To: Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>
Cc: mkorpershoek@baylibre.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20210405200821.2203458-1-fparent@baylibre.com>
 <20210405200821.2203458-2-fparent@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <d3251cd0-784e-da8e-6065-edd2cccf3e9c@gmail.com>
Date: Tue, 6 Apr 2021 13:27:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210405200821.2203458-2-fparent@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_122752_192688_E98C46E4 
X-CRM114-Status: GOOD (  15.10  )
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



On 05/04/2021 22:08, Fabien Parent wrote:
> Add the smi_common node.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>

Applied to v5.12-next/dts64-2

I'll leave the others for a v2 of the series, as there a small comments.

Regards,
Matthias

> ---
>  arch/arm64/boot/dts/mediatek/mt8167.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8167.dtsi b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
> index 9d765034dfb0..4b951f81db9e 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8167.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
> @@ -131,5 +131,14 @@ mmsys: mmsys@14000000 {
>  			reg = <0 0x14000000 0 0x1000>;
>  			#clock-cells = <1>;
>  		};
> +
> +		smi_common: smi@14017000 {
> +			compatible = "mediatek,mt8167-smi-common";
> +			reg = <0 0x14017000 0 0x1000>;
> +			clocks = <&mmsys CLK_MM_SMI_COMMON>,
> +				 <&mmsys CLK_MM_SMI_COMMON>;
> +			clock-names = "apb", "smi";
> +			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
> +		};
>  	};
>  };
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
