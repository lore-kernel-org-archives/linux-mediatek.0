Return-Path: <SRS0=w0xa=BA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E7A0C433E2
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2020 22:10:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC25A20717
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2020 22:10:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dkgayD4E";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eeU835oH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC25A20717
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wOXWbvTBflAMzu9j8XGW+qhX3vhpr78fydxgTMwbifk=; b=dkgayD4ElgHUS0qh32tUt0R+Q
	1okbU+mA0UPEy+zxA4eNiSHVkhteUz1YE0OHnHEk5r9MyaazEaqnjnJJrdlbjtaUQqbSgq8zz2C+5
	mNbmDzJKbEI8yfQ6XyHtHoVZI984vhFIQFOvUU23YLByga/8d4JyDKkppc9GWkaxOQkFiHEdMspmW
	2kLUPBL9kZqOBhROhCXO9lOhH9gq4XeyqCw69aKZ7bFBfLB1Op+5UQ9u6nQQUnZH7wWKXOMX2pKh0
	FBNUEcfEkO/v9xD07vIdYJBWOwPBzvZoX4h0Qz+cTtQCPfa1euVWuVyVA/cCjbFUIRJmnomSBbM34
	uJUFg4bxA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jy0TA-0000RD-R8; Tue, 21 Jul 2020 22:10:40 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jy0T8-0000QW-6H; Tue, 21 Jul 2020 22:10:38 +0000
Received: by mail-wm1-x343.google.com with SMTP id 17so106448wmo.1;
 Tue, 21 Jul 2020 15:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CUFVApO2b9cQq89aRlwUWU4CPz3+v1mbEwt5LEC0HTw=;
 b=eeU835oH6sxO1TQ86KycNK1CSs80K0J1tpt6xR4n4nqtXH28Ao+UgiVViU5wqEZ2/7
 yPhOwbZ3L4XX82Zt89/SIjF/eVyIxiKGNMJkJYTFUt+5TvHLu2H7+v834tOYB0cl6X5g
 qNsa8gWSsGqGKfcVWvsbPW1lkKLjy2c4iJ6DaLDzQsIBmQxHtQoGqiOjIB06QGh2aT5F
 Di7GFRR7oG8/wbowkjdhFZWkm2Ngx2nHHVYqQr6lp0eaDAadZd1rZ3PLDqSpGyxYoJIX
 tp6SbK+eVoCY25WK8XMgoJW8K0ybpZ6jGv03gtoSDwIF7kB2GYIXIHxHIRxuAP0BFnGY
 W9WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CUFVApO2b9cQq89aRlwUWU4CPz3+v1mbEwt5LEC0HTw=;
 b=epSC850TMtJF4Vsd01gXsjUIxXWkJEOfki4DfAew4Sy5GssgpwvzXbKZG0ViuwNutu
 bdIUx9QrCUQDzOVnF2qLcebMsMD/ICMjhoxOe5vvBDsgUvwpibjBuINZdCQhoYgJ9B89
 yLY/zVmQI1qTLCR0PElAhndYoNJ72TK1DyYv1lkeSXyVxh0CCCIrqizGcx2QareEBRdb
 aUkg7XleOK8zY+olGyBlhUdAmTPWa20Eyg3TCE2z+3Vfk3POPRBFOdSTpqdRqqI3vJhg
 M47fcncNIqJ56ul/whM42BKQeIoC6AgsoLiq+bUkoreJ9hjbLCVyaExWM/pXRwCut8uD
 +uIQ==
X-Gm-Message-State: AOAM533UlLPZzgIH41TG6VL5Yuf3+u0TAeOdqQzWK1OrhdBZV3QPZu5z
 LHVZXf3GoQeURx1xdocq/vY=
X-Google-Smtp-Source: ABdhPJzTVp965UfG1Qd/JLIYsVZscDi4yz0cLVSD+x45RcP4gzFAdIND3KE6aTyn+wCxsC5KSPuZLw==
X-Received: by 2002:a1c:8094:: with SMTP id b142mr5711792wmd.122.1595369436166; 
 Tue, 21 Jul 2020 15:10:36 -0700 (PDT)
Received: from ziggy.stardust ([213.195.122.158])
 by smtp.gmail.com with ESMTPSA id u2sm4771038wml.16.2020.07.21.15.10.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jul 2020 15:10:35 -0700 (PDT)
Subject: Re: [PATCH 1/2] dt-bindings: clock: remove UART3 clock support
To: Hanks Chen <hanks.chen@mediatek.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>
References: <20200721054033.18520-1-hanks.chen@mediatek.com>
 <20200721054033.18520-2-hanks.chen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <22a7a43b-1345-f316-f212-4d956ada50c4@gmail.com>
Date: Wed, 22 Jul 2020 00:10:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200721054033.18520-2-hanks.chen@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_181038_266551_B5898AF5 
X-CRM114-Status: GOOD (  15.05  )
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
Cc: CC Hwang <cc.hwang@mediatek.com>, wsd_upstream@mediatek.com,
 YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 mtk01761 <wendell.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 21/07/2020 07:40, Hanks Chen wrote:
> remove the redundant clk interface of uart.
> 
> Fixes: 710774e04861 ("clk: mediatek: Add MT6779 clock support")

These are cosmetic changes. They don't fix any bug, so we won't need a Fixes tag 
here. Neither on 2/2.

Regards,
Matthias

> Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
> ---
>   include/dt-bindings/clock/mt6779-clk.h | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/include/dt-bindings/clock/mt6779-clk.h b/include/dt-bindings/clock/mt6779-clk.h
> index b083139afbd2..2b5f2354d7eb 100644
> --- a/include/dt-bindings/clock/mt6779-clk.h
> +++ b/include/dt-bindings/clock/mt6779-clk.h
> @@ -229,7 +229,6 @@
>   #define CLK_INFRA_UART0			21
>   #define CLK_INFRA_UART1			22
>   #define CLK_INFRA_UART2			23
> -#define CLK_INFRA_UART3			24
>   #define CLK_INFRA_GCE_26M		25
>   #define CLK_INFRA_CQ_DMA_FPC		26
>   #define CLK_INFRA_BTIF			27
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
