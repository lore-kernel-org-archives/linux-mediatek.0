Return-Path: <SRS0=uG8S=M4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_03_06,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B436DC4338F
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Aug 2021 18:51:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CFF160F01
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Aug 2021 18:51:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7CFF160F01
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9poeIAJYRxSv6YH9RGB/y+MlA1+AV4TyZ9T2GnlX0eE=; b=4ntKOxq+GTXaLf
	j2lfrfuI3u5ggnATjZ9sUpsFAU+ZhIsEvr3QChfd6D5q5nRRAgRIk4LqV4+pYt9g5+H99xeqfSjCG
	n4+rsaZNCNZfMQKKjth/Tjckm/Qz56tg9dHOfWTbrWf4S2iAHGsG68rWUBDn/qM87rkp8P8HoFFpI
	RyiQOt6Arsu5K7IuOU0/8ZS6Uh/Ll6wYIMWIY9XcaPhBESqS0GphRKknksx4qRdQUkdLMhllRjVFc
	9v/Oytl71jkHNAHXTKysFSK2NZbnNlsoXWvbwKYYYbUbGZdGHeRi2iGJcOVsdUX1a/ff/S1V1NIKr
	snKtCvf5ZGoH3slTEu0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBiSe-00AYjM-Tu; Thu, 05 Aug 2021 18:51:20 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBiSS-00AYiD-US; Thu, 05 Aug 2021 18:51:10 +0000
Received: by mail-qt1-x835.google.com with SMTP id d2so4622474qto.6;
 Thu, 05 Aug 2021 11:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EZEunsTnaA1XzE54VnUD0YcTvntYvxdVoZOW+fPpXuY=;
 b=jwbsiwneBJFd2Ig6fWCLzTscXOQBAlvphpkOrnXo5ln4b/cl4H84JzNrDvAcVuVS04
 +Uix/Q7yD7sCFQhfpMWtshsEx2thnVuroO11Ye12H7cLNnOIvo/FiPnsWG+SFQk1lwcV
 3sEv24pAJMkGwqt9wGxdiFoeyMzMpupOtbBb0Qwy6pBrMiRdEymB2b2knQOYqGjPFgNr
 E8DdbgAlkZrQqmqjZM0uoeQipY4C5YPDXm6UBtDqPrSHvBMJ83dSMElz7Fa3vWk6st0c
 JwAJt9hDzH1Nn7gPakCOcQ/bsvw0Ub6O85EkbtxZ6rBTYCkWjaX1/1KiXp56WxWZO1bM
 bq/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EZEunsTnaA1XzE54VnUD0YcTvntYvxdVoZOW+fPpXuY=;
 b=piPRD2s2QfA5J5YZH9f95BLUzhVwceDnMe5jz8r5Y5Zd69uINlm5WuZIuoaYme38e0
 pcXc2MEvADK6s4Jv/Z8dm7J1VsE2RLyrMFBQQKgUc/DaCj7V8CdFt2Vh8MRKsqwJko2O
 EwWBv8mEHrw/7ASwcgWQtML9jOblyZY8MHWyPlTp8y+FA/fkcLJJmQcXui/8JUvhDoLJ
 OWeeEmK9VaD0wkEg5M5jWH2yOVBSOdP9S+UdCcVyHDWM+wMfkFPJ4SEC4wcNBhqSCpwK
 DUGdt04W0CyVpnulef2oZq76JCRd4Y4G8aI3qs3HsZYUOOmN8Z9JWTe+3Qjnc41XKPed
 UG7g==
X-Gm-Message-State: AOAM530A0V7L+8e5+0C152Yp0MT0RLu23i97Tcn95/Ld8E0PC/6gGN+H
 T1QmKnDYeZcZhXHj3FrdLIp3VA1p+/5LW0QibxU=
X-Google-Smtp-Source: ABdhPJw01R3FsLE2EQNT7CIn9yocm0qu86fk/7OLpG7DKbhG2q6MJn/s0acJtp4DeG5ZfTa6LLUEBQbe0kohY2aFTRY=
X-Received: by 2002:ac8:5b83:: with SMTP id a3mr5789733qta.210.1628189467046; 
 Thu, 05 Aug 2021 11:51:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAEsQvctJDnsaRTXAGAJ6==juKazoo2=AJrWabLzqE=jCfg5EEA@mail.gmail.com>
 <20210805075401.21170-1-chihhao.chen@mediatek.com>
In-Reply-To: <20210805075401.21170-1-chihhao.chen@mediatek.com>
From: Geraldo Nascimento <geraldogabriel@gmail.com>
Date: Thu, 5 Aug 2021 15:50:58 +0000
Message-ID: <CAEsQvcsvbJdgvAOxkv_kbLohGi676Zrgz4XSFW2o3CWU3Q68Dg@mail.gmail.com>
Subject: Re: [PATCH] ALSA: usb-audio: fix incorrect clock source setting
To: chihhao chen <chihhao.chen@mediatek.com>
Cc: alsa-devel@alsa-project.org, damien@zamaudio.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, tiwai@suse.com, 
 Takashi Iwai <tiwai@suse.de>, wsd_upstream@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210805_115109_036151_290947D8 
X-CRM114-Status: GOOD (  15.79  )
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

On Thu, Aug 5, 2021 at 7:54 AM <chihhao.chen@mediatek.com> wrote:
>
> From: chihhao chen <chihhao.chen@mediatek.com>
>
> Hi Geraldo Nascimento,

Hi Chihhao Chen!

>
> For echo test, it means we use this earphone to receive and play sounds at the same time.
> We found in this case serious noise problem happens.
>

That's what I understood initially, and only a little later I became
afraid echo test was the name of the debugging technique you used :)

Thanks for the clarification.

> Log as follows with your patch
> <6>[  175.960387][T401365] __uac_clock_find_source: Clock Selector 0xc has pin 2 selected
> <6>[  175.966980][T401365] __uac_clock_find_source: Clock Selector 0xb has pin 2 selected
> <6>[  176.026251][T400354] __uac_clock_find_source: Clock Selector 0xc has pin 1 selected
> <6>[  176.032406][T400354] __uac_clock_find_source: Clock Selector 0xb has pin 1 selected
>
> There is no noise and I think this should be a firmware bug.

From the log I'm afraid my worst assumptions were right.

Regardless of which Clock Selector we want to set, the firmware will
always set them both.

We should contact Samsung now that we have at least a sketch of a bug report...

Thanks,
Geraldo Nascimento

>
> Thanks
> Chihhao
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
