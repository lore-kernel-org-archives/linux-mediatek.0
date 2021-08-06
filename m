Return-Path: <SRS0=iyt4=M5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BF27C432BE
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 03:03:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 386D861154
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 03:03:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 386D861154
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nrkr5r9GTeaLGnuEcGt8Bz43qQvQZP6mDq0jzyokfRM=; b=FWelRq06sBsH+PjLcqBL25WBMJ
	v5TmqS+I7XK0BTNn6XEizE3D9B5CR/7haIycCj6RsR5BnJ1jYaPB9howUmOP7NQBCCcKEDbUsOd6t
	+hp3Qoq8uYH0+QWPtnV0f/Zo57E8CRvVruJ9YjP0d1P+WIDqecAnn8dHUyeMTz+b7QcCTuqGq4npE
	hq7ZWb5MBXg1/BvJ0gaRWletxW+LQfNR5dj8cEzEJBhc3b4olESpMrmhu16FnCSEOu17IutyrNQG+
	t3FONPiCmBk3I/YOVvuaEhKPwaiJVxrEE7aWlXK2qiS8jzdhV0m/62zF6yOQHNfMHo+lyYTvAkbEh
	wwWnmrzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBq8G-00BOiI-V1; Fri, 06 Aug 2021 03:02:48 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBq83-00BOfd-EQ; Fri, 06 Aug 2021 03:02:36 +0000
Received: by mail-ot1-x32c.google.com with SMTP id
 z6-20020a0568302906b02904f268d34f86so7120864otu.2; 
 Thu, 05 Aug 2021 20:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EA05tSQWqSs4HKkvaMBpD7HoBLTyMYIgWdky50GfsB8=;
 b=kNMZYDjdidsmhRJ6GOD0Zi5nQ4FaLJMbn2MkdS+1DNbUOc55MxRWQ9qIrM5W1uALWP
 xYXviusk0sFAGolTJWPQJ3+W39fG6zC/UfjqbEoEdGK92et4yLNULkjl80IWx2VYa/Hf
 nvxmHxpszIbY9rwXIR9PRv+WmsnEDZbuUFihGYdeO84W4mo4BPxYQEwwfq7bOLdjL1QW
 YqTC01gcxvzSEaZ/vMO9/+XKMdwD+LJjNuIkZGAaIke0CBBh3M8FiPhZq8jrGaX+klUm
 UXRacezk+Yfk62zKpgeyYpjUZ4bMfTBLtvsgqmIdm2tAONCFATtLMxyzmoFiqXjx+UEy
 /Cjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EA05tSQWqSs4HKkvaMBpD7HoBLTyMYIgWdky50GfsB8=;
 b=IADN2Dspx5TOxap4v99d/jb7fx4mIiKNyusfc7V35NbCA+C9zGJhVnLYT8IgB5TF12
 Xpsd6EQgjcZxrMLdUbrnP7kf+bSrdHnt8MxkVQzxxCJFUhO6+jYPbLypXTDGqp4zcB40
 Nkf9zT9Ymb9LlyXB8v0g5/FLgffd3GNlbpjJm9gXo8Z/7aarey/S1Ylq7gHKoXDnWj7j
 FEofUXrchaUfKh54vMBzXnPvi7I6vMOifaHwLetOfBS9nxFt0QvPJGXX4e6Whe3M938e
 Ege780F5IeoJMQm/rjfOpg3ZYEd2y3dbo2K6JWd7b87VKfgdFmeOkvBhe6J7SBIfk+2s
 kmXw==
X-Gm-Message-State: AOAM532cEfH5C0qYXztr1mHJPvO4Wl479ifYzvV5WwRogt/FBrSj+Q1+
 0/u+4CHCnI7x/joSgFy/znI=
X-Google-Smtp-Source: ABdhPJwfYB6fS6GG/E20fTPdKfxYyTtuw5Bp2moupTwoHqmOheH4cOjZnRCFfpzfeqFM0ebpRwr7Dw==
X-Received: by 2002:a05:6830:144f:: with SMTP id
 w15mr2065560otp.161.1628218953849; 
 Thu, 05 Aug 2021 20:02:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 bc42sm1101795oob.39.2021.08.05.20.02.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 20:02:33 -0700 (PDT)
Subject: Re: [v8, 1/2] dt-bindings: reset: mt8195: add toprgu reset-controller
 header file
To: Christine Zhu <Christine.Zhu@mediatek.com>, wim@linux-watchdog.org,
 robh+dt@kernel.org, matthias.bgg@gmail.com
Cc: srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 seiya.wang@mediatek.com
References: <20210806023606.16867-1-Christine.Zhu@mediatek.com>
 <20210806023606.16867-2-Christine.Zhu@mediatek.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <daa97d7e-2184-0b1e-3afd-c357b022c966@roeck-us.net>
Date: Thu, 5 Aug 2021 20:02:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210806023606.16867-2-Christine.Zhu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210805_200235_554778_85ABF0EA 
X-CRM114-Status: GOOD (  15.84  )
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

On 8/5/21 7:36 PM, Christine Zhu wrote:
> Add toprgu reset-controller header file for MT8195 platform.
> 
> Signed-off-by: Christine Zhu <Christine.Zhu@mediatek.com>
> Acked-by: Rob Herring <robh@kernel.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   include/dt-bindings/reset/mt8195-resets.h | 29 +++++++++++++++++++++++
>   1 file changed, 29 insertions(+)
>   create mode 100644 include/dt-bindings/reset/mt8195-resets.h
> 
> diff --git a/include/dt-bindings/reset/mt8195-resets.h b/include/dt-bindings/reset/mt8195-resets.h
> new file mode 100644
> index 000000000000..a26bccc8b957
> --- /dev/null
> +++ b/include/dt-bindings/reset/mt8195-resets.h
> @@ -0,0 +1,29 @@
> +/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)*/
> +/*
> + * Copyright (c) 2021 MediaTek Inc.
> + * Author: Christine Zhu <christine.zhu@mediatek.com>
> + */
> +
> +#ifndef _DT_BINDINGS_RESET_CONTROLLER_MT8195
> +#define _DT_BINDINGS_RESET_CONTROLLER_MT8195
> +
> +#define MT8195_TOPRGU_CONN_MCU_SW_RST          0
> +#define MT8195_TOPRGU_INFRA_GRST_SW_RST        1
> +#define MT8195_TOPRGU_APU_SW_RST               2
> +#define MT8195_TOPRGU_INFRA_AO_GRST_SW_RST     6
> +#define MT8195_TOPRGU_MMSYS_SW_RST             7
> +#define MT8195_TOPRGU_MFG_SW_RST               8
> +#define MT8195_TOPRGU_VENC_SW_RST              9
> +#define MT8195_TOPRGU_VDEC_SW_RST              10
> +#define MT8195_TOPRGU_IMG_SW_RST               11
> +#define MT8195_TOPRGU_APMIXEDSYS_SW_RST        13
> +#define MT8195_TOPRGU_AUDIO_SW_RST             14
> +#define MT8195_TOPRGU_CAMSYS_SW_RST            15
> +#define MT8195_TOPRGU_EDPTX_SW_RST             16
> +#define MT8195_TOPRGU_ADSPSYS_SW_RST           21
> +#define MT8195_TOPRGU_DPTX_SW_RST              22
> +#define MT8195_TOPRGU_SPMI_MST_SW_RST          23
> +
> +#define MT8195_TOPRGU_SW_RST_NUM               16
> +
> +#endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8195 */
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
