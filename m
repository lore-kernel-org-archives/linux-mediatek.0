Return-Path: <SRS0=WTSR=MS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_03_06,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9314DC4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jul 2021 05:16:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 559D560F0F
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jul 2021 05:16:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 559D560F0F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ywrOjAc7MGTzCBT54F7ihLmktTE2G3Ny1mABcLd+4sc=; b=NrjL9sZdQyfZlO
	vFzpHwN1g8fMrxH8p/6/aIgfs2K/AtpijCAovRVnGPs71SLudzue0N7qIMHd4gYeakmJaz2/6lVri
	LDMiNhqBNTivAQ3xSXGHfo/mlOIqMKNpJoALmLnIfxgPsdpoYC3o3Mo97assMqBWWrkcW2aHzSywU
	/02U2cLCAEvttGSUL0EVE5AEh0oXGc0AQURVNvmbKMcyC1cMuW4Ek5n8xTXiBaZHv9LF/lx1a5Ggf
	m6mT/GaYzGiKyMX60RjeF0ynkoWP2o7Hh0dTGdsVtRW6vkZRSMnuA5qkhw8ydvvFHVhCV1EiVnb8g
	PDXetrdrs2yXaLXGmINQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7syX-009cwZ-F2; Mon, 26 Jul 2021 05:16:25 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7syT-009cvI-Ov; Mon, 26 Jul 2021 05:16:23 +0000
Received: by mail-qk1-x731.google.com with SMTP id z24so7732609qkz.7;
 Sun, 25 Jul 2021 22:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XygC5wCkMDbFQQ9ce88kjiV4VAshB5QTsAEs+cXfzBo=;
 b=V8MXuFFKyGipObIamnLlOLefvbGxx8fkYXPtJXfQaR6zPfL/sGcnUox+MUW6t3kNhX
 BJw+rGDeH1JGkQSSG5zJynhThfUINGX2dPi+NCPN48fkRyFn+aFXi/AcO/7cJJDAM5DF
 AL6dsSpy2Ahm28uUQTYOAWlKSxNTTN0m+9KeJCuV4LpaNH9lEDGYei1zpZngRnyIGv16
 jXfdiwJK+om/0/+qnATixilPqLd6igKtGOdGYMjTe62l4xcIMK/4sYegrpvGoyHBq7pP
 l5uhhjp/yZ3Xus6oGwGx6pPMBDxHUpsiKqatKgzcknjU0EAzy2OyVNe2zzIyeK0md5Bl
 6+Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XygC5wCkMDbFQQ9ce88kjiV4VAshB5QTsAEs+cXfzBo=;
 b=DZuvU0X/3m6WY8eaRZh/koAAX3YiqMK3+fnXB+pL3s49kfJispC2PdQ0Z01Y9wv7ej
 rGVOY2KMBHV588auSKHgIz2UDpdmzJ+vMkEZbblDVaVazL8wrM2DPHXgKFkWjIa5ILof
 h9JCd4IEtCj9uAYVw6tvYbqPFC3ER27B7NqEyYxxRwcuvyAthVgDTMWhOjmwl/4aJmMX
 QB+S6G9Vfbxvirzo5izzkL5nxXnNWFBGtKpNN1uNi0XZDju23/8Q1r31vvhRiwa9tgZ3
 WCSVWY08dn3KlfFhOtQuqp+A3E+iffC4YVAt1Jpp8/r037c7vFtyVNNzbDQGLF8p9z3e
 g2ow==
X-Gm-Message-State: AOAM531FlN3c6C1DU6Oj8su+mkJJyijf0GLGf8MRcR4YmK2ajf/oFtWK
 d9cwYdROYjTOifdwziKQ8tkNIGfKqi1TwBoO8bM=
X-Google-Smtp-Source: ABdhPJxvuO0i1cOxHKEIeKjGh7PuOqW1BCoICcn1IG0kXrcAMZC5H6irn+d1FLDu5WKxOfVJpitbnWiFrFfoLek0xww=
X-Received: by 2002:a05:620a:1278:: with SMTP id
 b24mr15914369qkl.250.1627276579628; 
 Sun, 25 Jul 2021 22:16:19 -0700 (PDT)
MIME-Version: 1.0
References: <1627100621-19225-1-git-send-email-chihhao.chen@mediatek.com>
 <s5h7dhgi1e2.wl-tiwai@suse.de>
 <CAEsQvcs3P+TqQFzQetPfRycpo66eJFwnzwhk2JyCXFaCLFHmFg@mail.gmail.com>
 <s5hwnpehm7y.wl-tiwai@suse.de>
In-Reply-To: <s5hwnpehm7y.wl-tiwai@suse.de>
From: Geraldo Nascimento <geraldogabriel@gmail.com>
Date: Mon, 26 Jul 2021 02:16:11 +0000
Message-ID: <CAEsQvcumEDOKgUB6h2-im5QabhPfaSaU63RF8pegPt5ZCPx+Pw@mail.gmail.com>
Subject: Re: [PATCH] ALSA: usb-audio: fix incorrect clock source setting
To: Takashi Iwai <tiwai@suse.de>
Cc: chihhao.chen@mediatek.com, alsa-devel@alsa-project.org, 
 wsd_upstream@mediatek.com, damien@zamaudio.com, tiwai@suse.com, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210725_221621_865233_C2A60502 
X-CRM114-Status: GOOD (  27.95  )
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

On Sun, Jul 25, 2021 at 7:44 AM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Sat, 24 Jul 2021 17:04:13 +0200,
> Geraldo Nascimento wrote:
> >
> > On Sat, Jul 24, 2021 at 8:05 AM Takashi Iwai <tiwai@suse.de> wrote:
> > >
> > > This looks like a regression introduced by the recent commit
> > > d2e8f641257d ("ALSA: usb-audio: Explicitly set up the clock
> > > selector"), which is a fix for certain devices.  Too bad that the
> > > behavior really depends on the device...
> >
> > Dr. Iwai, perhaps we could restrict the generalized fix for the
> > Behringer UFX1604 / UFX1204 with some simple logic to devices that
> > only have *one* clock source.
> >
> > In that case the clock selector must be set to the only clock source.
> >
> > This way we keep the generalization without breaking devices with more
> > than one clock source.
> >
> > Just an idea.
>
> I don't think it's easy to generalize.  All those bugs are more or
> less BIOS bugs, and a logic doesn't apply always, just because it's a
> bug :)  For example, setting the clock selector itself should be a
> valid operation from the specification POV, while this leads to
> breakage on some devices.  So, even if we add a more generic
> workaround, we need to see which side effect is more commonly seen at
> first.
>
>
> Takashi

Hello,

Like I said in one of the other emails in this thread, it's hard to
pinpoint a cause for the breakage of Samsung USBC Headset (AKG) with
VID/PID (0x04e8/0xa051) without the lsusb -v of the device in
question.

But from the description Chihhao Chen gave in the original message,
I'm *guessing* the Clock Source for the Samsung USB Headset (AKG) runs
at 48000hz and that we'd see a 2x Clock Multiplier in the lsusb -v

This is all a wild guess, without the lsusb -v it's impossible to be
sure, but if I'm right then the valid setting for the Microphone's
Clock Selector is the Clock Multiplier, not the Clock Source, which,
remember, runs at half the clock, hence why Chihhao Chen sees half the
data rate for USB IN.

Unfortunately our kernel code presently *does* always set the Clock
Selector to the Clock Source, which is a bad assumption to make in my
humble opinion.

The only valid case for setting the Clock Selector to the Clock Source
is when there's precisely one Clock Selector, precisely one Clock
Source and no Clock Multipliers.

In that special case we may be able to touch the setting of the only
Clock Selector to match the only Clock Source.

And, frankly, the only reason we're forced to do that explicitly is
because some Behringer gear (Archwave AG DACs) gets confused and seems
to somehow keep the old rate on the Clock Selector upon sample rate
change.

Thank you,
Geraldo Nascimento

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
