Return-Path: <SRS0=VCtr=AT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA2EFC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jul 2020 17:01:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A84A2078D
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jul 2020 17:01:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g4+TJio2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R0L8z7z3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A84A2078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VyhrfBjsge4ZEa4sHzvT3i+BNHdw9O+nGxHxrrA50k0=; b=g4+TJio2Ns4ZDs48uvSCWFEOh
	8HtPU4yVBoiyybtR6BDuVozcJwFBTjzWJFDi36H218Ku3s5vwvnehrI5xmwav5Xyp1RShpSlgDz6W
	QzYoXZ3J8qupq/NWm4HY2XXO0Z1LF4MqTfuywc5JRAdCQ8w8A6lHu9JBQnN2BTsURb7yNo7Q+e8OW
	CFkC6Jmv65wyWhBToN8KKd0Gbuh2r19AxQ42qR2dNWCX7YJ28CxjiRQjRiQ6rfuhEbI4ColoO0Ubg
	lWGsWvIqiw90CA8WoZi8AZ8WNANa23sX+cVcHOC11YFGM+/E02cMqsWy2qWy8VH0O8RsVaiMSC4S0
	bX9mdX/5w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtDRU-0008Fm-Dc; Wed, 08 Jul 2020 17:01:08 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtDRS-0008F0-Re
 for linux-mediatek@lists.infradead.org; Wed, 08 Jul 2020 17:01:07 +0000
Received: by mail-wm1-x342.google.com with SMTP id j18so4007339wmi.3
 for <linux-mediatek@lists.infradead.org>; Wed, 08 Jul 2020 10:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kmG9b4C0CGWiQmngusza359yBl9owEptyLOdBdxcZPw=;
 b=R0L8z7z3gg2e8s10ZSWNSgyEjZAAMPCzk7F8P9EWXVkYhXtCupySosRDeHdcZcKvT8
 liPiJPb6ctjJQespNd09zAdoFfagtBn4l5yyJtHvyyoxYNwpFsSWiSrVIwL8FVsHdtsw
 jEBc61J6o2bmaHQ+cJlAmw9OkfSyOMa4E141uykah44gvGS3YOGUIPv+1aeQXIfDxzhG
 56M0Epi3WqI4Ycb4uByVbzLmvN6uj0xC5wn0gec4/JW8plTve+IE2v1w+cqnr5jwXhpK
 LO+F1v1fcr3k/NpKZyFCmNfjg6to2tfYJpoGyJm41Xj2s3Q5vmkRtLKeaNK4QQLGxC53
 Y/Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kmG9b4C0CGWiQmngusza359yBl9owEptyLOdBdxcZPw=;
 b=sNF9zcJE9apX1kbC0/QeKDNbHd02Sr/fyyG6e18YZI6ZvGt1XzMc55HhxVS/IS2A7/
 uzYSCcFwb+vpL53TWQOyAc7fTlWtC426Dbb39X0PwqLA0R0KxkHRTI+5KAY99TEYlG+p
 Q3PXZFblQ5LQ2YHAfdrx+Vp7Dq+GXOmlAwndsit6ABHgt3+Q9IfJYcyaiOxiVJTY5mYN
 CYqcUjx9y9QHGRHZVStV1Gm7gz/X3T9k9oPjnRkeGt9MNlGAcNKUWOrdC9bq347UoyOZ
 QPBYHjrKiYHyMObRCg2BVeoc8tl3ISPAs01rDf4UYs4qRJsMYyxcswCKaJ8I0DgFkrrN
 jjOw==
X-Gm-Message-State: AOAM530GJDDK6VXcYBfJ9Hl6dPklarW4kF5JbV+YC8I+vlGvEKbAVCMR
 GIV8o2TEPRwVyN+CQCudVbY=
X-Google-Smtp-Source: ABdhPJwRCorVzWEJ98mxCh/6oheaQq5W6O1pJfnoyvQ+20/LU2fCMzKSwSK3HCxoGP90YIcw/bwzfg==
X-Received: by 2002:a1c:49d7:: with SMTP id
 w206mr10756670wma.181.1594227664190; 
 Wed, 08 Jul 2020 10:01:04 -0700 (PDT)
Received: from ziggy.stardust (static-99-78-7-89.ipcom.comunitel.net.
 [89.7.78.99])
 by smtp.gmail.com with ESMTPSA id j6sm895312wro.25.2020.07.08.10.01.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jul 2020 10:01:03 -0700 (PDT)
Subject: Re: [PATCH] arm64: dts: mt8173: Re-measure capacity-dmips-mhz
To: Hsin-Yi Wang <hsinyi@chromium.org>, linux-mediatek@lists.infradead.org
References: <20200706083705.2343150-1-hsinyi@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <71bc5fa2-0869-5d91-6bb8-e8d59176e19c@gmail.com>
Date: Wed, 8 Jul 2020 19:01:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200706083705.2343150-1-hsinyi@chromium.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200708_130106_938300_E61F8D0A 
X-CRM114-Status: GOOD (  16.98  )
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
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, ikjn@chromium.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 06/07/2020 10:37, Hsin-Yi Wang wrote:
> Re measure capacity-dmips-mhz on elm and hana:
> 
> cpu 1:  9502 DMIPS @ 1703 Mhz
> cpu 3: 16250 DMIPS @ 2106 Mhz
> 
> ==> 740 : 1024

I have some trouble to match the commit message to the actual patch. Commit 
message talks about cpu 1 but patch changes cpu0. Where are the values of the 
other CPUs?

Regards,
Matthias

> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>   arch/arm64/boot/dts/mediatek/mt8173.dtsi | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> index 70b1ffcab7f0..5e046f9d48ce 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> @@ -167,7 +167,7 @@ cpu0: cpu@0 {
>   				 <&apmixedsys CLK_APMIXED_MAINPLL>;
>   			clock-names = "cpu", "intermediate";
>   			operating-points-v2 = <&cluster0_opp>;
> -			capacity-dmips-mhz = <526>;
> +			capacity-dmips-mhz = <740>;
>   		};
>   
>   		cpu1: cpu@1 {
> @@ -182,7 +182,7 @@ cpu1: cpu@1 {
>   				 <&apmixedsys CLK_APMIXED_MAINPLL>;
>   			clock-names = "cpu", "intermediate";
>   			operating-points-v2 = <&cluster0_opp>;
> -			capacity-dmips-mhz = <526>;
> +			capacity-dmips-mhz = <740>;
>   		};
>   
>   		cpu2: cpu@100 {
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
