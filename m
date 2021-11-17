Return-Path: <SRS0=BaWb=QE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A3D8C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 17:32:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E733561C4F
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 17:32:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E733561C4F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oOE04a63OMy6izjJeUalV6Wz4RtOKz0SniaB1cisPiQ=; b=GVpo2R3c9jLzFr
	LQWCBMDA4QzEUX35Xfnb++4RK8o4gJh9OIqI2j8Suwo+ZJkUj5L3BhohWYs3I926PUpyHicJ81GXl
	fLPXPFmsfYEcmp+xW/+j9oKOPXKvPFzp9kLu2r3/ImV0PAsFBOdLur/uPTxPNxekBbYR7WMQLbCM0
	JmbdKgA6BBYj3dEtP4jKPNgOq/r5AwlAXQJCWSXSMOUYD5e4coaq7GNbyKYT34CDo6pj68ksvodkB
	/7AIpDs0Jc+kZrnCOuNb0EyaGJU3w5j9tyM0UKEOzpByW39iBtJfFH0iMoGBGIGPulJcwjtKinm/d
	FY5qOpbSJEkIgBQjodOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnOmp-005r1Y-6Y; Wed, 17 Nov 2021 17:31:55 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnOmb-005qyQ-RA; Wed, 17 Nov 2021 17:31:43 +0000
Received: by mail-wm1-x334.google.com with SMTP id 133so2982787wme.0;
 Wed, 17 Nov 2021 09:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=/8znBzxWnYUTFtm0bh/WbwD/k2I/6DqFEZbIjaU/ygs=;
 b=WiEoGbxhcag/Yj2EyGJiVwKT2nTwgzHlm69xKBxuzGEip5ZYycyA9VIfH2kGrcCOnp
 ZWVuxQ/8ZkzV0rhjvEeyLZVy/LqQLMJHnCQK3JAG2FzmLpcDwETxAN79z7IrLqpZZexx
 IwiAqKuC7gl9FwaqG3VWZhyAuOJG8gUN/j8xDsxYl+nLJcViczrL2HZe/KXakM6LdsYP
 p/YBFd2U135adbNU8mMcejENpwyVkS+TVgkm4j/HmaFTejhLWHDBQGZqaMh2hczHJ4Mf
 bxyUjLTcLAIP3Ki/43YCQfR2+kjXaxga6tFnYT4xugE3ZwBZ6KI+4rpc5n9Ww3+Ae+Cl
 X+EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/8znBzxWnYUTFtm0bh/WbwD/k2I/6DqFEZbIjaU/ygs=;
 b=plem4VacZpWsZySPvffMQDnpLjHkAQXSq+FOxNTteCNxDgJfFrX++r/YR3R6im614u
 mEHyStSR1dVcv6PaY1LOc0NoJawvzNaWULpn9rTPuR/clbT8eqDujlm8cS/vMhXjcz80
 zItNy6uPsNRS2zgZTJVBoORsqDmwz6niVeFVusW3NRz59w3Th8WNpW48JcqlPPf7+Aax
 2+HjMzrzoY1cyoxUXUGLx731/gpLWngwhdxIaes63INERdqhsgwQab0ZF9n5F1vxuRca
 /9B3HTw+QEsuqmNc0jVJ0QuPcon5IznjZLXuHZ5QSebP7Ojc1FW0t7zI+W5Lm/fkj1Mg
 lLNw==
X-Gm-Message-State: AOAM531Mjq4zi6KrmRMGAZ4vuY/9stuB+tZaYvd6H6XH6w67luAv0f21
 V8/e4jUucB/eyAuukaY9dcY=
X-Google-Smtp-Source: ABdhPJw26WVzu3C/ccQ1PDjQq/w4b2/WnMQ9AUtYFX2IWmI+T/7SZnVIS5jVm8onWml++0683aXSQQ==
X-Received: by 2002:a1c:9842:: with SMTP id a63mr1656413wme.102.1637170299994; 
 Wed, 17 Nov 2021 09:31:39 -0800 (PST)
Received: from [192.168.0.18] (static-160-219-86-188.ipcom.comunitel.net.
 [188.86.219.160])
 by smtp.gmail.com with ESMTPSA id g18sm511817wrv.42.2021.11.17.09.31.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 09:31:39 -0800 (PST)
Message-ID: <24067294-2e86-fcd6-8a47-95d56ff5e569@gmail.com>
Date: Wed, 17 Nov 2021 18:31:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] arm64: dts: mediatek: mt8183-evb: Add node for thermistor
Content-Language: en-US
To: Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20211110192631.4182485-1-fparent@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20211110192631.4182485-1-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_093141_918173_6816DCCA 
X-CRM114-Status: GOOD (  15.60  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 10/11/2021 20:26, Fabien Parent wrote:
> Add node to be able to read the temperature for the thermistor
> connected to AUXIN0.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>

Applied to v5.16-next/dts64

Thanks

> ---
>   arch/arm64/boot/dts/mediatek/mt8183-evb.dts | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> index 7bc0a6a7fadf..f3fd3cca23e9 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> @@ -36,6 +36,14 @@ scp_mem_reserved: scp_mem_region {
>   			no-map;
>   		};
>   	};
> +
> +	ntc@0 {
> +		compatible = "murata,ncp03wf104";
> +		pullup-uv = <1800000>;
> +		pullup-ohm = <390000>;
> +		pulldown-ohm = <0>;
> +		io-channels = <&auxadc 0>;
> +	};
>   };
>   
>   &auxadc {
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
