Return-Path: <SRS0=Y6KA=6G=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54A7AC55185
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Apr 2020 22:47:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2499A2071C
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Apr 2020 22:47:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="scrZfbTk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BSbkpzms"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2499A2071C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jg966Yti+2ncTJ0c/jjYMeI8ZKBOoa0ojcSj2Iuntqc=; b=scrZfbTk696zNM
	Z/OvZVCNbjFQYIfrvxHDT6JNuENm70zr+aYLDZdV6oExxFoXYmTB3j9SG4aaFcMidRzyoH0ItgRRg
	hVlFAFZTGbZ90BYM8BzMqpWbR4LabZEtJq2pp0H2JYNV6SCRg0u/VohrumV0IO0YVqz5Qm8mXIfQ3
	rwxS5kGfOxivy1mXPRWnYJCaJ5i52ztVWHXE/xZJHFHuZFhZTYDm2FwaGdEo2oW3FvVtCw0ViO44U
	4t6FOZ4do51tO+iX8aRqOtVM9eEXu26nHE2gTY3oj86gbGAkaeBY7xVwqq2KHCqTLxatEcgMV3hVL
	fvLVoH91BdKYHHl2Px8Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jRO8u-0000fM-Bj; Wed, 22 Apr 2020 22:46:56 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRO8l-0000V8-IT
 for linux-mediatek@lists.infradead.org; Wed, 22 Apr 2020 22:46:48 +0000
Received: by mail-pj1-x1042.google.com with SMTP id ms17so1632020pjb.0
 for <linux-mediatek@lists.infradead.org>; Wed, 22 Apr 2020 15:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=pLTuQArcwiFXcG9uc7P3/tOH2806IqFHASRaBcIcsEY=;
 b=BSbkpzmsMrB61iVPWzBuW/+ZEnOUMyG61Cjfz/vz3GFTkoJosnfewYwwNytlJSg/r5
 7urIvRN84RRm0goUbfxHHzHPdDP8mVksMX8xC3NIi85jZ0dxMD54ig+wXJWmGJ+PTddQ
 Y/1YKuKZgP6vEwWbBfuWIfhMmf8ZfOiwR0UJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=pLTuQArcwiFXcG9uc7P3/tOH2806IqFHASRaBcIcsEY=;
 b=RJcFcrY06M7fDW+kQ6B8fcKb1I1/xOTXEli8t+tCgHcGRXa5mU6ZZ5QkUg9Qw4ULRn
 4hNm0eP+1SXtLcZrU/NG7UYSSJdM8SNETXAIkyux1YdbuqjEENMjrGgLBvva3vh5LH+y
 n2dtxBtOvf6juaCJNKagwBRHumNMkYimVWvoBvJuLF69hyIY9J+7GvDKXZydUk3E1M2Q
 lZyMoonZcbciy1iQmPU7ehq5Lv80faPmxMV8iOce2ABXBz470qUZM3JAyTh1sYiFZflE
 Vk48e0Pjoz3KT0MoR+D9Y9V6UxtLiYkERmPB0EcqWZjJ2epeWNx/sPveWQ+67M3ra0hi
 p39A==
X-Gm-Message-State: AGi0PuZZsYGNQSIUk/Xqi/12pOPcIUbW+KEe+iODJowIZZSBgxldpi6E
 LUGCaqvIJWI49mFJ9393zVhPMA==
X-Google-Smtp-Source: APiQypKhDC0baxY/PgdACBGve8Req9KLYTUEXXH0x/85yLzgvD2k0uCeWYCvvSYzzEadi+NZNpZcBw==
X-Received: by 2002:a17:90a:5aa7:: with SMTP id
 n36mr1056873pji.45.1587595606121; 
 Wed, 22 Apr 2020 15:46:46 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
 by smtp.gmail.com with ESMTPSA id h11sm539650pfo.120.2020.04.22.15.46.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Apr 2020 15:46:45 -0700 (PDT)
Date: Wed, 22 Apr 2020 15:46:43 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Yong Mao <yong.mao@mediatek.com>
Subject: Re: [PATCH 3/3] mmc: core: fix mmc_sdio_reinit_card fail issue
Message-ID: <20200422224643.GI199755@google.com>
References: <1586835611-13857-1-git-send-email-yong.mao@mediatek.com>
 <1586835611-13857-4-git-send-email-yong.mao@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1586835611-13857-4-git-send-email-yong.mao@mediatek.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200422_154647_607437_2E711470 
X-CRM114-Status: GOOD (  17.04  )
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, srv_heupstream@mediatek.com,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Chaotian Jing <chaotian.jing@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Yong,

On Tue, Apr 14, 2020 at 11:40:11AM +0800, Yong Mao wrote:
> From: yong mao <yong.mao@mediatek.com>
> 
> If SDIO device is initialized by UHS mode, it will run with 1.8v power.
> In this mode, mmc_go_idle may not make SDIO device go idle successfully
> in some special SDIO device. And then it can't be re-initialized
> successfully.
> According to the logic in sdio_reset_comm and mmc_sdio_sw_reset,
> invoking mmc_set_clock(host, host->f_min) before mmc_send_io_op_cond
> can make this SDIO device back to right state.
>

The commit message isn't very concise. Suggestion for a better
structure:

mmc: core: reset clock to minimum speed during card reinit

Some buggy (?) SDIO devices don't (consistently?) enter idle mode
through mmc_go_idle() when running in UHS mode. [add rationale why
setting the clock to minimum speed fixes this]


Also the function sdio_reset_comm() mentioned in the commit message
doesn't exist in recent kernels. And mmc_sdio_sw_reset() does not invoke
mmc_send_io_op_cond(), as the commit message appears to claim.

> Signed-off-by: Yong Mao <yong.mao@mediatek.com>
> ---
>  drivers/mmc/core/sdio.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mmc/core/sdio.c b/drivers/mmc/core/sdio.c
> index f173cad..dc4dc63 100644
> --- a/drivers/mmc/core/sdio.c
> +++ b/drivers/mmc/core/sdio.c
> @@ -850,6 +850,7 @@ static int mmc_sdio_reinit_card(struct mmc_host *host)
>  
>  	sdio_reset(host);
>  	mmc_go_idle(host);
> +	mmc_set_clock(host, host->f_min);

mmc_sdio_sw_reset() - which is mentioned as reference in the commit
message - sets the clock speed before sdio_reset(). Should this order
be followed here too?


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
