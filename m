Return-Path: <SRS0=WTSR=MS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DATE_IN_PAST_03_06,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92CD9C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jul 2021 23:57:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24F5F60F91
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jul 2021 23:57:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 24F5F60F91
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=19DGIS/eNB8jmLKGSy0p7iR0fPJXje61HuDau39TTO8=; b=IDKluYw/OZOAbF
	zl/68RDQx1TzhiWKXSfhtfk8NHjHKwvWW0f30CzH3EEGgWIx/69a1J19s0MrxuHOiuc4hQmpNEqj2
	/X+fPuPbowJSakCTbOnTzM52hB+unQZf5SIBxEw90UBNkYZfs5u+D+vrdfhkVeIOLH1WDyONUekvX
	xy4y8LUrZ+siZXvw5dBPPmUAXatX5AX3M3m27FlHaQtyZKWIeoh/oJuG3TlrAxAkhnDek9iXGWSLA
	D3cfKsH+08oP+h6dsWNtmvcaG4zOYtmLCsY3m2DJrvQ9kuYBggU7PRoLIlkkYw/yT248ryv0CRIi2
	yXAB2SjXy/2PkQRif1Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8ATb-00Cf2a-EY; Mon, 26 Jul 2021 23:57:39 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8ATY-00Cexd-N2; Mon, 26 Jul 2021 23:57:38 +0000
Received: by mail-qk1-x72a.google.com with SMTP id z24so10675833qkz.7;
 Mon, 26 Jul 2021 16:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+c223BNKCjVr89i78fnlRgBQMhpUOGJDxxcmZA/6yCE=;
 b=OwnYV9rlnUfJo2RkKot5+W+rdsLUN7+zWrFy/pz8wdfqaTIej2jOIu+LgE2i3AE2nf
 wJ1xojtvCrbUirSLD83/obiHk9C0NaQJeHN84Jvf8rNF9IdC2bfeMHCV4XWuHaSVYrzn
 Mf0g4AHDMwR19nzAkIKwpw/xksa2aupVpgwHzQVzd5/2A18a0DQzcSpL0ShCOPBLYxVB
 sGy/zrevQ2P/oSF7X0G3mwfdXv5hq+PmtMBMMe12omsVY03LP7HoWRAj/hD9/rRbfCXh
 foGUXykUrM0OvoCBuftU56SdJXlPp3be6Gs2ybNAIsDSFfIlanwbCXWzPUtECc8aQpMk
 7tJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+c223BNKCjVr89i78fnlRgBQMhpUOGJDxxcmZA/6yCE=;
 b=AMynHkec0Oze7M719jCeoOKcOy2UtJJ5HkMezihxsve0EbMIGW9TGfWmckpY5jLXy8
 gDjTY3izr897qbXUxVvWVOTRnDiOFj6OGZiJ9Iqnd6U4C2lT+M3Q6kBDD8PaUPB5jQZH
 S78woi6B0194p21OJSDDkDPdgPWg1NkcJ33WagLwI9nMGqkWCsEynJ2d2yONBMJ5LXLf
 JLGJnNt8Wgxu4LORHImEhXp2OOlwLj0vLU0qmVCVH1ACtA0DAjOBVOYLe4Qo/KwBYeH1
 YTJmEc+7X0aAkM+4T0tWeYcC7OvvO/uEK8YlNMo2XCFs8Alqopl5tKXkiymXysMtvfhK
 xqxw==
X-Gm-Message-State: AOAM533Z3CTmCM+qe6nD4Sxc3nxJWRB5MR4vvsNYaMo8alQReVGjE/GB
 dXufa4zTzK+coC/5GHbVLAfVcaXx1aBzd+RS6R8=
X-Google-Smtp-Source: ABdhPJy2JU1ynaciVOwS/iwo88bT89yMDXeJN4d1VYgvkEp69wZdpxn6I/9NlfOvGTmgOWQap/tbBlqfqfI1ksBQUCg=
X-Received: by 2002:a05:620a:893:: with SMTP id
 b19mr19600194qka.487.1627343855508; 
 Mon, 26 Jul 2021 16:57:35 -0700 (PDT)
MIME-Version: 1.0
References: <1627100621-19225-1-git-send-email-chihhao.chen@mediatek.com>
 <s5h7dhgi1e2.wl-tiwai@suse.de>
 <CAEsQvcs3P+TqQFzQetPfRycpo66eJFwnzwhk2JyCXFaCLFHmFg@mail.gmail.com>
 <s5hwnpehm7y.wl-tiwai@suse.de>
 <CAEsQvcumEDOKgUB6h2-im5QabhPfaSaU63RF8pegPt5ZCPx+Pw@mail.gmail.com>
 <2db5d44b88ace1c25af4a45b3469a425fe1d81a5.camel@mediatek.com>
In-Reply-To: <2db5d44b88ace1c25af4a45b3469a425fe1d81a5.camel@mediatek.com>
From: Geraldo Nascimento <geraldogabriel@gmail.com>
Date: Mon, 26 Jul 2021 20:57:27 +0000
Message-ID: <CAEsQvctJDnsaRTXAGAJ6==juKazoo2=AJrWabLzqE=jCfg5EEA@mail.gmail.com>
Subject: Re: [PATCH] ALSA: usb-audio: fix incorrect clock source setting
To: chihhao chen <chihhao.chen@mediatek.com>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 wsd_upstream@mediatek.com, 
 damien@zamaudio.com, tiwai@suse.com, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, 
 linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_165736_819637_4BBD3124 
X-CRM114-Status: GOOD (  16.19  )
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

On Mon, Jul 26, 2021 at 8:42 AM chihhao chen <chihhao.chen@mediatek.com> wrote:
>
> Hello,
>
> Attach USB descriptor of clock source and selectior for this earphone.
>
> AC Clock Source Descriptor:
> ------------------------------
>
> Value   Valuename
> 0x08    bLength
> 0x24    bDescriptorType
> 0x0A    bDescriptorSubtype
> 0x09    bClockID
> 0x03    bmAttributes
> 0x07    bmControls
> 0x00    bAssocTerminal
> 0x00    iClockSource
> Hex dump:
> 0x08 0x24 0x0A 0x09 0x03 0x07 0x00 0x00
>
> AC Clock Selector Descriptor:
> ------------------------------
>
> Value   Valuename
> 0x09    bLength
> 0x24    bDescriptorType
> 0x0B    bDescriptorSubtype
> 0x0B    bClockID
> 0x02    bNrInPins
> 0x09    baCSourceID(1)
> 0x0A    baCSourceID(2)
> 0x03    bmControls
> 0x00    iClockSelector
> Hex dump:
> 0x09 0x24 0x0B 0x0B 0x02 0x09 0x0A 0x03 0x00
>
> AC Clock Source Descriptor:
> ------------------------------
>
> Value   Valuename
> 0x08    bLength
> 0x24    bDescriptorType
> 0x0A    bDescriptorSubtype
> 0x0A    bClockID
> 0x03    bmAttributes
> 0x07    bmControls
> 0x00    bAssocTerminal
> 0x00    iClockSource
> Hex dump:
> 0x08 0x24 0x0A 0x0A 0x03 0x07 0x00 0x00
>
> AC Clock Selector Descriptor:
> ------------------------------
>
> Value   Valuename
> 0x09    bLength
> 0x24    bDescriptorType
> 0x0B    bDescriptorSubtype
> 0x0C    bClockID
> 0x02    bNrInPins
> 0x09    baCSourceID(1)
> 0x0A    baCSourceID(2)
> 0x03    bmControls
> 0x00    iClockSelector
> Hex dump:
> 0x09 0x24 0x0B 0x0C 0x02 0x09 0x0A 0x03 0x00
>
> Thanks
> Chihhao

Thank you, Chihhao.

So I was wrong about Samsung USBC Headset (AKG) with VID/PID
(0x04e8/0xa051) having a Clock Multiplier.

There are two Clock Sources, both linked to the USB SOF with fixed sample rate.

Plus two Clock Selectors which are host-programmable and can be set to
either of the two Clock Sources.


I'm still at a loss to explain what is going wrong here.

Would a printk() reveal the first explicit
uac_clock_selector_set_val() on the Clock Selector associated with
USB_IN sets Clock Source ID to pin 1 with Clock Source ID 0x9?

Or is it the other way around, i.e. it sets the Clock Source ID to pin
2 with Clock ID 0xA for the capture stream Clock Selector?


Chihhao Chen, could you please try the following patch for debugging
purposes and share what is printed in dmesg?

Please try one time with your fix applied and one time without, i.e.
with an otherwise unmodified vanilla kernel.

Thank you,
Geraldo Nascimento

--- clock.c.orig    2021-07-17 12:15:06.416028360 -0000
+++ clock.c    2021-07-26 20:45:58.713881962 -0000
@@ -300,6 +300,7 @@ static int __uac_clock_find_source(struc
         /* the entity ID we are looking for is a selector.
          * find out what it currently selects */
         ret = uac_clock_selector_get_val(chip, clock_id);
+        printk(KERN_ERR "FOR EP %x: Clock Selector %x has pin %d for
Clock Source ID %x selected\n", (unsigned int)fmt->endpoint, clock_id,
ret, sources[ret - 1]);
         if (ret < 0) {
             if (!chip->autoclock)
                 return ret;
@@ -324,6 +325,7 @@ static int __uac_clock_find_source(struc
                           sources[ret - 1],
                           visited, validate);
         if (ret > 0) {
+            printk(KERN_ERR "FOR EP %x: Found Source! Clock Selector
%x has pin %d for Clock Source ID %x about to be reselected\n",
(unsigned int)fmt->endpoint, entity_id, cur, sources[cur - 1]);
             err = uac_clock_selector_set_val(chip, entity_id, cur);
             if (err < 0)
                 return err;
@@ -344,6 +346,7 @@ static int __uac_clock_find_source(struc
             if (ret < 0)
                 continue;

+            printk(KERN_ERR "FOR EP %x: Found source by trial and
error! Clock Selector %x has pin %d for Clock Source ID %x about to be
selected\n", (unsigned int)fmt->endpoint, entity_id, i, sources[i -
1]);
             err = uac_clock_selector_set_val(chip, entity_id, i);
             if (err < 0)
                 continue;

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
