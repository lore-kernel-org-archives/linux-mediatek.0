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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FBC7C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 07:43:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C888207F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 07:43:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LZONidyk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VIeeARmO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C888207F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XCW5bDnirKxGqBZYmLuL56PJe5xTGwOFcNMiJ/yaYwo=; b=LZONidykZjKqFG0aoqGsMil4U
	uLfCHrP9LsurtviiyWZyx4RAKFuKjA36eEA/Gu41m43ApFiOgUfZN3yN5/WaXAxxnIPCtl30z1gz3
	+rQl3U9vZoh4u1oPlH47Cy97fSX5+/mbYOZim4yYrbEfheQfQ+J8cSw3epclKdBxGqUQi31oQXT4T
	N1jCkGDBD2iZUl9oznTPGNfpfvdM7Vy+BExJDdbfVcGRlvogO3pjoByMAq56OAKPNWmIlg+NliSJE
	mTAlonxM0dcMKf3jWqD4Cwy4k153dle6le1gZ4fcy7tsBNoHmFODAjiYDi4pnEQ4o6zBW66Ij5Wxy
	Q+Kx2hMgw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0gjy-00025b-Nc; Wed, 29 Jul 2020 07:43:06 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0gju-00023n-Mv; Wed, 29 Jul 2020 07:43:03 +0000
Received: by mail-wm1-x343.google.com with SMTP id x5so1790510wmi.2;
 Wed, 29 Jul 2020 00:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=szBubxity4186U3bdeuflQScz96ZCzKJmi9LmSH2cAg=;
 b=VIeeARmOqTNBT95O1KFhQALpovswxaeK0oTFi/+t2mEyBQ6LYcC3gpgYrI3G0EmeAz
 047ZKs6aW4pIswVaM9s9AYTv7FG6Do+Nk729Fqh5WQk0/TffbcxH6miCnceHSCRI+fVT
 3iYwMoZ7g6OsoDGKRKAs9C3XQhdTzYx0Afx5rFgfJRy3tbJ7YXRN1sJYrVZLX5iawH7t
 5sbipe9WuBnIqHitgUeVMdg2GFmkNqKRsMHY6+HJlggOmDnBW7yuAE2wR9PLer+ff84O
 m5XHKnngkTx/TN2o28AojJ1tHTQLB0E07aVbfklnFxikWDpLwDQnwv3ndzS8k9fNVpBf
 EazA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=szBubxity4186U3bdeuflQScz96ZCzKJmi9LmSH2cAg=;
 b=tcx+vY81HHuzIXMpx4xSmjch12f/hk9dRW10KffgQVYxggg1l1jKvEZ36JZ89iAww4
 Nc7PjIzzTTldT5AKcptm+pJdvR0o5AssctwFMadks/6fq/3AxSJJuiAZ6hgDb7boPu0s
 mQK/cf2yknCvme/evtcbrQ6YkkYBHAfToXGyjHPJOl1OzFaHc6TCPdJxbNyuKTpL+szF
 +N3FDSDBNPKjdslolOaAw+38ibwFeAXfIif1TA/mMbGxevk3nXnUWBAX8CfUon2blspd
 eSC6EfH1KP+nWB8VCVm5eQFqj8ukqe5Q5y49/AKKnP1Tho54kAzxzi5gsSSFVEP0c2qL
 OWxA==
X-Gm-Message-State: AOAM5313DL/0XkVbQ9Pd1lMh8yYtBfONXyPfRIh4DW9mx8Y/JY4ub9Eb
 UsSzX7NqI91YID1cPwQym25y4RhDRAM=
X-Google-Smtp-Source: ABdhPJweUAeyZOUZCWitl1m8gdeOtMPiKJACXt8jbVFYXdixwyDiY+1vsMVdDmkTNtLHRwX/NsnAvQ==
X-Received: by 2002:a1c:28a:: with SMTP id 132mr7315864wmc.109.1596008581632; 
 Wed, 29 Jul 2020 00:43:01 -0700 (PDT)
Received: from ziggy.stardust ([213.195.122.158])
 by smtp.gmail.com with ESMTPSA id c7sm3526265wrq.58.2020.07.29.00.43.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jul 2020 00:43:00 -0700 (PDT)
Subject: Re: [v2,2/3] dt-bindings: watchdog: add a new head file for toprgu
 reset-controllers
To: Crystal Guo <crystal.guo@mediatek.com>, linux@roeck-us.net,
 robh+dt@kernel.org
References: <1596004249-28655-1-git-send-email-crystal.guo@mediatek.com>
 <1596004249-28655-3-git-send-email-crystal.guo@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <fb7ef8a7-5bbc-8e4b-7a23-c84f151587ba@gmail.com>
Date: Wed, 29 Jul 2020 09:42:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1596004249-28655-3-git-send-email-crystal.guo@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200729_034302_835303_B40A6D91 
X-CRM114-Status: GOOD (  18.55  )
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
Cc: linux-watchdog@vger.kernel.org, srv_heupstream@mediatek.com,
 seiya.wang@mediatek.com, erin.lo@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Crystal,

On 29/07/2020 08:30, Crystal Guo wrote:
> merge all the reset numbers in one head file.
> 
> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
> ---
>   include/dt-bindings/reset-controller/mtk-resets.h | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
>   create mode 100644 include/dt-bindings/reset-controller/mtk-resets.h
> 
> diff --git a/include/dt-bindings/reset-controller/mtk-resets.h b/include/dt-bindings/reset-controller/mtk-resets.h
> new file mode 100644
> index 0000000..d73a4ba
> --- /dev/null
> +++ b/include/dt-bindings/reset-controller/mtk-resets.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2020 Mediatek Inc.
> + *
> + */
> +
> +#ifndef _DT_BINDINGS_RESET_CONTROLLER_MTK
> +#define _DT_BINDINGS_RESET_CONTROLLER_MTK
> +
> +#define MT2712_TOPRGU_SW_RST_NUM	11
> +#define MT8183_TOPRGU_SW_RST_NUM        19

Maybe I didn't explain myself properly. We want to have all resets in one file 
and do not want to have the resets for the watchdog in a different file. That 
means I don't thin your patch is correct and the effort should be abandoned.

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
