Return-Path: <SRS0=uiJf=BH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97F71C433E3
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jul 2020 08:21:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6101F2075D
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jul 2020 08:21:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q3Hq9XYP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OHZTyDw3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6101F2075D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bdYFWZbJ1B2pxORLv6uKgYIiulV5bZlt7yX+yeQz0ao=; b=q3Hq9XYP7dMUSTLLv5Nnn9BU9
	/lcrLkppwjeDKZT0Rkyaxr6lPbZeD5gTeXPKOozkDMMw7bdKdL/RsbzuKCKcFMv9mnjqvASuwB8Eb
	9kgOdmdbRmikdCRuqMgv+I1iTh+tyrVWJC/9DqpmFpa138MOj1jotEARbzkOj7AqJv4/QRKbsW5VE
	evXTlG9Dhz88P4TpsoGjiDT5NA4pXb3gApSluvaZnbcbb/TuFHakqFWw392OhAjMX0YEvOK8wEkdc
	aD/cgIWRLVKA2NjRPvVcRuqWy+UdY2lZXUqgoZ51H4Q6+xlFd1aJv20s/44bFyNCSNIciED+DcMxC
	nWzmaGPwA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0Kr1-0004gi-6T; Tue, 28 Jul 2020 08:20:55 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0Kqz-0004ft-PP
 for linux-mediatek@lists.infradead.org; Tue, 28 Jul 2020 08:20:54 +0000
Received: by mail-lj1-x241.google.com with SMTP id g6so7558830ljn.11
 for <linux-mediatek@lists.infradead.org>; Tue, 28 Jul 2020 01:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HIQ5RtYMfFI+H7x8RDkaUeKWb3yF02QogFEmqjJTRQ4=;
 b=OHZTyDw3HJ8WOeuBhN+CzaxQQxiiuqbtfgB+RG/0OuulIDrXsUgGPg3j4VkJiPRSea
 oN+y+EK88R3MUlLbaSe6fG5O/eEgE87eos5PwAhIQ5TsNkhmcRR5IeXDgIk3wXu5hzBn
 TDW2F0HI9FmWPGNGG11dUorKGj/px+vz5J21mNrwjN4XWKAJ2ce7zbKGT7zoj+/H/qzV
 6ueaRD/xn6UuplQRgC7a6ZMMrLZZ096a7qzBPfwhkx4jLqJbvMi5+zDhWDWvoDOD6zBQ
 II/biUYt8LlrcmTMeNANqVZM1G+OzbRMOEAnAgmkaFB43x9llVuS5/zJHZ2I6oazmKhK
 uoTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HIQ5RtYMfFI+H7x8RDkaUeKWb3yF02QogFEmqjJTRQ4=;
 b=LTjxpypgX3Zq6BlcV5tILoabU+8vNzr0IyWS5RpbupHlglDArKP/gf8N8Q+Xhh54fp
 b0NUJaPPh2WxM0GwtA7K/VLws/QeunqlIA0j5HYkom2W3jQT4tU37wPc6dSjSG5EYV8M
 GZxl+yQ8+1ren1EWrbqjPBgnk07kHiKTSdRnyRV9rJNOBM1Dr0JV6P2s8NfFvRarV91q
 bKaA3ZdDS3T0bZ+os0zacQFg0K/ymRZRFyNH01LLbPbgkZnAf0u2HQ66SYHsPhAw6mQD
 Ee1RVaZ/NpUwOhGVB7yM33fM/1WvCMf+BWmgtpWQ0ueeDw90E+hT5tZvImAyyO+du7So
 OEGw==
X-Gm-Message-State: AOAM530R/nTiOhSnJRPBIGmS90pM5Vd6s3gdBX3FD/gSCVdJYe8ydQ6/
 qvLrNdd2/85IYC1E1Tj/JzHRqRir6BC5d9FdYMwoAw==
X-Google-Smtp-Source: ABdhPJxO+CGw7ygWgvu6yceY2CDngQOoDTtutC1EvO9o8y+oLDTzQAs+Bay1PvMuRM431rG23KjX0Xl15Cw6otKstvU=
X-Received: by 2002:a2e:810a:: with SMTP id d10mr11537402ljg.144.1595924451850; 
 Tue, 28 Jul 2020 01:20:51 -0700 (PDT)
MIME-Version: 1.0
References: <d15827a3-d0c8-e231-9f61-8507b3d7be3a@infradead.org>
In-Reply-To: <d15827a3-d0c8-e231-9f61-8507b3d7be3a@infradead.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 28 Jul 2020 10:20:41 +0200
Message-ID: <CACRpkdbpEWap7bo1TOpDzX_t_mpisxhhiUuiQqNT+0rdFFAt+Q@mail.gmail.com>
Subject: Re: [PATCH -mmotm] pinctrl: mediatek: fix build for tristate changes
To: Randy Dunlap <rdunlap@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200728_042053_883883_6246D0FC 
X-CRM114-Status: GOOD (  10.47  )
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
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Sean Wang <sean.wang@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jul 28, 2020 at 7:55 AM Randy Dunlap <rdunlap@infradead.org> wrote:

> From: Randy Dunlap <rdunlap@infradead.org>
>
> Export mtk_is_virt_gpio() for the case when
> CONFIG_PINCTRL_MTK=y
> CONFIG_PINCTRL_MTK_V2=y
> CONFIG_PINCTRL_MTK_MOORE=y
> CONFIG_PINCTRL_MTK_PARIS=m
>
> to fix this build error:
>
> ERROR: modpost: "mtk_is_virt_gpio" [drivers/pinctrl/mediatek/pinctrl-paris.ko] undefined!
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Sean Wang <sean.wang@kernel.org>
> Cc: linux-mediatek@lists.infradead.org

Good catch!

Thanks Randy, patch applied.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
