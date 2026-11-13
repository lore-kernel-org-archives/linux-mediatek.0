Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2B8606BD36
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2026 17:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UpFxDtcJ;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C4wgQwV0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CpkPMrzn1QXCpAfabsJQRA1H7XnFSRlrjjFJbYsbFCo=; b=UpFxDtcJIBzxHG
	MU90kLb4ys4pPXn0EeIsdBegfasIsQFLnmnmqaioZW1lD9dePplEL6QlWoulx+YLIl2PsU2SLKvIc
	zW10qmN8DZ/gxSIWLGN6P3zddHuUZYabfDYSgwU5yMR7bXJqJJLHWrJxmclojui9irw8L6bDBFgrf
	Rr+Lg591q1qRsCSxpKhT7Re134AUHsyoI5DJQxmITLtp+22GsjGILkz6zKoyZT2XerkXr3zocOXnp
	ApJsUkCHkA+LrDVxa/pC9/raZRQL3SnKLu+BnpY1KNOitXo/v+mQuRWdYEOOrkLat/HjECiAt++R4
	gdddF5SEOKv5vHWqA3IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvKr-0000000DmEy-27Q8;
	Fri, 13 Nov 2026 17:45:13 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvKo-0000000DmEF-0Pyw
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Nov 2026 17:45:11 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-cc4c02ddd62so620779a12.0
        for <linux-mediatek@lists.infradead.org>; Fri, 13 Nov 2026 09:45:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794591909; cv=none;
        d=google.com; s=arc-20260327;
        b=cgY7Hd5ACrXhswCx+alr2SGBiEuZc/7XpzRdISnHp2ml6fR8oknhQkJwLm1C45wQVK
         uIgILHuquYi+9LyKJalnOM+1MvfwxoAUdoBh8MsLNlYuWStUf4YocPYzu+9jy1uLYDTS
         shk7gvoe3iHFQp4qVxSQil4FBxGLSMzgZFjw9t1EUjymErt/NSZDOrLg7Ba7uf6H11uZ
         d/oM9bbeO32Fb8R62Lh0O2sWxT9iRNded9SVGkvFijdtq0GnvTFvA69hJ+HA2zXzQ1gl
         zpZKyNiVleTxnp0O4dkzgocLJkdY3lVg/WPJe7KNhhSEcYtuGmrby0Tw8Qp6RA/WGdB+
         xgAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CpkPMrzn1QXCpAfabsJQRA1H7XnFSRlrjjFJbYsbFCo=;
        fh=bOLXz2U5cr1K2VD6hKSWyBbu9iNqe/AoNqPbfPSUvQE=;
        b=XFnUEvC4BdgKaIHjGTZHKYSH/auj6J057vveVkNxH6PEmlrb4dAanr2FxAcamESa+i
         E8Oyv6CBaNgfb1M6a9/Gyyx5ieeh08eIY+hFBmqjhLtnN9yFLkDs3yMO55RtQUEqjWWI
         KvGm2brMOq8Ta6QQlUsrwtiHZFI6/eqC7/XkEMPef5+DvEITaFB7MmvRsipinz1IDbOd
         bR6yIxJ1UC5HRsa2Rm/n/DOQ+Zty955jcExBvxQ8wrxZwCskf6/M04vXx5dJUH87wGz0
         CG7i7r6rgWVmEN7ocEGw1Vzwz1w+cQdW01fWnLZ2DeMk03/0yhViCnscbKGVPNG9QsNx
         mJ5w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794591909; x=1795196709; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CpkPMrzn1QXCpAfabsJQRA1H7XnFSRlrjjFJbYsbFCo=;
        b=C4wgQwV0RQdsoQW3XoUFqK9UMxAMSv/7eL/1HWWGf2X1Ak4TmvoUm6FkI0nFsEt5yr
         p4i3kZ/I6NdtXCpRNwDxCsaP8DVlU0OEqNs+r/jgsxZknxnHDcY1JjIAoSmYNbYrh3sl
         ehmxa5yRtBQDdSpRX7DZMZ3E2ReFxvusTRweFgXI+qY20B8Rie570Hkaa+kEm+kHYa5/
         HtAU2NRUlsRHu8FLO3/FDaErfS8wWso3/waY7TGwbvdgNsidA2nGMS7NfEZTN8qTSdAD
         ZL9EwrzVXQyoEf+ezyvk7Nc2eE0UXTxv+U9V/s8HSy1DhFJ0qHuWyZxIalHTNqkAngpG
         TkaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794591909; x=1795196709;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CpkPMrzn1QXCpAfabsJQRA1H7XnFSRlrjjFJbYsbFCo=;
        b=wKAibpq2I4Wl6vjskXzSIJ7kg4cQq1T2DT0yooypq30DeKlMrEi7JkmFaXJHHYUJQU
         r9xV6V8mCSmGOg5cXOwM5KbrSkJA5VsN4lpsE9xruIDWiCOTaoe9eYNaWe2cYtjG7Jqr
         DblEhLngAEJIPDe6w9Z9BHODpqcjhPDG5tZtmRAHFkRsL0MzM8+fbfeZBm/qlDUCPh/R
         heOI6tFCP9ahv9jkUSnjfH5FfkJ8/LMYVDRq+ssLbrvNQYR/sXW5xHAyzArhudDt6R0I
         nVLXiCnKA3+gDwcQRkuD2fzHJ6zajOuK4Pd23ogfTuajb1Of0jUCBWuXrq9dZcES1nYI
         cMfw==
X-Forwarded-Encrypted: i=1; AL+hErEoR9imq2dwTWnsjph3oE8nqCtrj2mslxVX30cf6aFVxCwVHfN+b+24KG+SYwDYkb9yg+9pT8ILIGV5Xei36w==@lists.infradead.org
X-Gm-Message-State: APuU4Z+vnke2Yz8zo19IZQ34NBTqzRLkm2e20LDydgkC8KT7N6Xm0Sr/
	rlqWe0/5BRlUwQNomJtlkQwNgWEg77IgoTyr0FCqjghtIHX5P3o3RonxTey9+5mtIlFJEpH1Ki3
	GgYOAqlQZjwuTfaDrNclY9IudXV2HqM8=
X-Gm-Gg: AYBFou24RSkKL+edb6n0tjWG1404CZXkVf5qlPj9zmz8uGIG1At3vLlzJNUZSpYXFnk
	JJmdXOPuz5H8nwpkaayyQOOLeV2m2uH7w9StV4aT0/1w1s90clucVl3wLuNCqh0Yr1kSa3Rnaer
	dOWctvqmYXyLcIQoIkcx1LS7TPtfYg+gXm8IDE4bo7uZsj8xS9mjVaP0GfD6dGpglYf2XTyCi9f
	5vfPUJbnB76YVDEXl2HmhUWIPlfwBXCXl4NIGaGk51o2zKuS3OTzD8PhF47RkNV0XwBxccaBiq7
	QTWxy8VT+MMNcwVOUiik/oB8qKc1+V9LVSAYxW4rUa7bmi8WoF0ktxrr/7lDqLrfiEBmTwaQYLm
	2gGp/7BoJcfaEJS/wOUjL9zFiLtLupxVOgsyaOg==
X-Received: by 2002:a17:90b:2e83:b0:3ab:b764:826c with SMTP id
 98e67ed59e1d1-3b1b0a1f097mr3248202a91.12.1794591908865; Fri, 13 Nov 2026
 09:45:08 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <CAHaeJsQLvC-KBEpy5qu8iYxSB51mbHohrPvN4PJushF_Tk3foA@mail.gmail.com>
 <20261023180554.7266-1-lucid_duck@justthetip.ca> <CAHaeJsSfoTxJhWVCrELCiLZr1zD42LGJUvrmf7oSzRQpwh6-jw@mail.gmail.com>
 <20261024173414.10559-1-lucid_duck@justthetip.ca> <CAHaeJsTHykkk8Cm+FUZW2RmzzmT47aJNxRR1kpymhDvknnhKuQ@mail.gmail.com>
 <CAHaeJsRROtH4CLVR8mhWznWq6c5mLqLsn9j=6EXPgFUOW8t26w@mail.gmail.com>
 <CAHaeJsSSYkJTiXAh3PJtfxmXYdPf_-u3OPbunB=GsYXbVAUVrg@mail.gmail.com> <20261113163823.8252-1-lucid_duck@justthetip.ca>
In-Reply-To: <20261113163823.8252-1-lucid_duck@justthetip.ca>
From: Chris <hoopyfrood42@gmail.com>
Date: Fri, 13 Nov 2026 12:44:54 -0500
X-Gm-Features: AclHuK-kboXCmkkZ8ATzKP0-8pyPMq66IuBjqFLfP5gRrQyyh3-Tpydyt0hROfU
Message-ID: <CAHaeJsQ1EHxMLzKjtTZZekJWS-8hXb4XaUW9C4bO0anJoVLh9A@mail.gmail.com>
Subject: Re: [RFC PATCH wireless] wifi: mt76: mt7925: get the survey airtime
 from the firmware
To: Devin Wittmayer <lucid_duck@justthetip.ca>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Deren Wu <deren.wu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Javier Tia <floss@jetm.me>, linux-wireless@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_094510_154853_730FFEF6 
X-CRM114-Status: GOOD (  25.81  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 13, 2026 at 11:38=E2=80=AFAM Devin Wittmayer
<lucid_duck@justthetip.ca> wrote:
>
> On Thu, Nov 12, 2026 at 11:30:19PM -0500, Chris wrote:
> > Just checking in on this one. Is a v2 still planned? I=E2=80=99ve been =
running
> > the RFC on a Netgear A9000 (MT7925U) since late October. Busy time now
> > follows the channel, and the readings look right.
>
> Yes, but it is on hold. With the A9000 at USB 2.0 the firmware is slow
> to answer the query during a download, the query times out and the
> chip gets reset. MediaTek's series for the same counters does it too.
> I wrote that up here:
>
>   https://lore.kernel.org/linux-wireless/20261113150048.5271-1-lucid_duck=
@justthetip.ca/
>
> v2 has to get past that first.
>
> > As I mentioned in my last reply, I take the busy, rx and tx deltas in
> > 32 bits, since offset 19 wraps about every 72 minutes. Since then,
> > about one reading a day still comes out near 2^64, so roughly 2^32 =C2=
=B5s
> > below the previous one, as if the counter stepped back. All but one
> > were on 2412 MHz. I haven=E2=80=99t dug into it, but it may be worth a =
look
> > before v2.
>
> v2 takes all three differences in 32 bits, the way you suggested. With
> a wrap forced early the RFC steps back by 2^32 us and v2 does not.
> After that change the totals can only go up, so is your once-a-day
> reading from the RFC as posted, or with the change in your driver?
>
> Thanks for keeping it running.
>
> Devin


On Fri, Nov 13, 2026, Devin Wittmayer wrote:
> After that change the totals can only go up, so is your once-a-day
> reading from the RFC as posted, or with the change in your driver?

With the change, as far as I can tell. The build with the 32-bit
differences was installed on Nov 5 and loaded at a reboot a few minutes
later, and that module is still the one running. From Nov 6 to Nov 8 it
still gave 14 of these readings, 10 on 2412 MHz and 4 on 5745 MHz. Each
was a busy total of about 2^64 - 2^32 us plus a few hundred ms, some of
them on a channel with under a second of active time. My tool logs only
the first one per channel per run, so 14 is a floor.

There have been none since midday on Nov 8, about five days of scanning
on the same module.

I agree a 32-bit difference shouldn't be able to do that, so something
else may be going on in my build. I'll keep watching and report back if
it shows up again.

On the USB 2.0 timeouts: the A9000 here is on USB 2.0 as well and has
run your RFC since Oct 23 with no 00030022 timeout. Nearly all of that
is monitor mode, though, with only short station sessions, never a long
download.

Chris

