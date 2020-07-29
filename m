Return-Path: <SRS0=1w4W=BI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 556E1C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 07:45:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22B6120809
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 07:45:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WRPVa8oz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ldxAiEUF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22B6120809
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RgXbtuIgb2lAluSfaHWw3iG7ImziFAuzzG5LS3OBCsA=; b=WRPVa8ozIS5FtLaX3G4DiWnvG
	6NoB+Lc05bJvZ7QnPVZrGHaZd55lA6nXq5fbnrnD95aYecfXtdHCuhFUgFCrJxwWL9BIbBAGhXdoB
	mj8AUcyWGvc+DdEAi5c4VelFf+FAMc+aXrqP6Kaei+VhG3Lo0N9xkxUXEf+7tDGp4JxOFwt326T3s
	T5e4JWJoKLz5TawZ4WE5RvEOatZ2mXMjnkMwphjufNLsM3eFXY49qZFKHxeJwYkohPHZ1PiuJ5W93
	DhtD3w/5IEW3Sm7HAX2MLxOXyLuD91S37YiKWIDujvMHQPClzF88r0Ym3vcjENGnQDqU/8LIyiXG5
	VU3H4rKrQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0gmN-0002vW-Ma; Wed, 29 Jul 2020 07:45:35 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0gmI-0002tL-Km; Wed, 29 Jul 2020 07:45:31 +0000
Received: by mail-wr1-x442.google.com with SMTP id a14so20652475wra.5;
 Wed, 29 Jul 2020 00:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=O+ETSXA6RyFZRpnWcbmn7fgTJlT89iJkYuFlDE0wwHw=;
 b=ldxAiEUF7m47Z96S6vgEZzfr3N9UpXPqj1PG8UnrxVKo8qRfizI9cjQLMlMP5AS7tj
 e2txp0GTVY7DIj4OlM9lIISC4YoeY/+0N6/eAWBzEewvqIiCRlBuaVBDZvg4ZthMoO7e
 CP+tkipdL6V50KMfZmRTbSA1mKr4y79WlC+3aYH/4yd896dfBw3VL3AnWytEm1wa9BdW
 KXBIdqFLicgjYThAF0GYX2nFIpPI0ST8Gw/IWvVSVpeK/tB7ys4T5K55YNszjvzbOkxC
 MOKuiM83Do4EwqlM3RbaCXYt1UtTaMKLG3vqPjhfrspupQns4dMeNPVA4wI8HuOyo4ze
 C2pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=O+ETSXA6RyFZRpnWcbmn7fgTJlT89iJkYuFlDE0wwHw=;
 b=qvXRKli/y/rtwGoTtqOxuxTCnj+quopxWSF1Pb6sPWsNDSqgDLsTYKMZORo1WrEtR1
 5r5cl9mZgAUZeJf4TeMrskLih4+LJ8YVFs7hkHQMgzGJLkZ3M0qwuy46NRWjI0xR6Vr+
 7Qw1RT1nCdjcgZqKpcc6GszDJLcu1k2oJij2itvcbChQldLpwGJIC69fTI6HC/a4fjGr
 9Tbk9klBJwUXPWbXIwHPzoztb6CAjO3xNYwdQdKPbRC/s/IacEYJffjRanxMgOdrBd2C
 /BJYyO3mtKSv8lrKlU1U77jRMWayiTb9QYwQoFi6KAs1m32DfVQ+BjYBUHrA0/lf7Ypj
 KdEw==
X-Gm-Message-State: AOAM533ObTywEk8HxbOS6wclG/EtKnlsMKHYlUOJ88I6uLL8KjXOC9Gf
 Vlm+1a0TJffiyVKu0vw2xQQ=
X-Google-Smtp-Source: ABdhPJwfFlS5I2dKSqCQPxUR7kjkBgQTVm6GIWd3Aw/T37/KvKHZ0aX3Vj7Y/eIYZFtX/E6njpeFGA==
X-Received: by 2002:adf:ed88:: with SMTP id c8mr26645654wro.233.1596008729618; 
 Wed, 29 Jul 2020 00:45:29 -0700 (PDT)
Received: from ziggy.stardust ([213.195.122.158])
 by smtp.gmail.com with ESMTPSA id c7sm3540328wrq.58.2020.07.29.00.45.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jul 2020 00:45:28 -0700 (PDT)
Subject: Re: [PATCH 2/2] arm64: dts: mt8192: add infracfg_rst node
To: Crystal Guo <crystal.guo@mediatek.com>, p.zabel@pengutronix.de,
 robh+dt@kernel.org
References: <1596008357-11213-1-git-send-email-crystal.guo@mediatek.com>
 <1596008357-11213-3-git-send-email-crystal.guo@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <b81f1936-caf0-e843-9556-14e3024d6d6f@gmail.com>
Date: Wed, 29 Jul 2020 09:45:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1596008357-11213-3-git-send-email-crystal.guo@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200729_034530_758954_4B9B829A 
X-CRM114-Status: GOOD (  18.15  )
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 seiya.wang@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 29/07/2020 09:39, Crystal Guo wrote:
> add infracfg_rst node which is for MT8192 platform
> 
> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index b16dbbd..adc6239 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -217,9 +217,17 @@
>   		};
>   
>   		infracfg: infracfg@10001000 {
> -			compatible = "mediatek,mt8192-infracfg", "syscon";
> +			compatible = "mediatek,mt8192-infracfg", "syscon", "simple-mfd";
>   			reg = <0 0x10001000 0 0x1000>;
>   			#clock-cells = <1>;
> +
> +			infracfg_rst: reset-controller {
> +				compatible = "ti,syscon-reset";
> +				#reset-cells = <1>;
> +				ti,reset-bits = <
> +					0x140 15 0x144 15 0 0 (ASSERT_SET | DEASSERT_SET | STATUS_NONE) /* 0: pcie */

You have Texas Instruments hardware inside infracfg? Are you sure?

> +				>;
> +			};
>   		};
>   
>   		pericfg: pericfg@10003000 {
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
