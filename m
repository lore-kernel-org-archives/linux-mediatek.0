Return-Path: <SRS0=4nm1=B6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F27B0C433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 00:14:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C10E02075E
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 00:14:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zLQyMPH8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="GZgsINVj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C10E02075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wifisLGK1/3VM5gq4akpSvefwwMtw+u/y958HBqpcMc=; b=zLQyMPH8GlVer0CAl6RLHOp6O
	YWcbJ/GBK5D19ChKbmDej+7ARvxMhEHm/xNcceTAfR2rJ6zgvfayPcTwpAE5UIjMqQVmNSSA/RS8a
	63sTIMhPH6ucyD42dMKe8epoysuc5vfYtYMIkgWz3NMRe94FdK3lwkmuItY94FVem4g8jaWRDNPsw
	rePEJEINPXh6a2gKty4XGy1wrkPMbVC0+TbJaGl04OVGI8pT37TcN5Bhp7QVKerB/3YsGjbxyQbP6
	N8kXHB3cywAvuwVQpo05ekx823E6hTkIK9T7APXc/wMAXsfB9AH+4T6y+pK7FYkkRpEOLu3sB86O0
	r1MWEFfRw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8YDV-0005xV-3v; Thu, 20 Aug 2020 00:14:05 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8YDR-0005wS-LO
 for linux-mediatek@lists.infradead.org; Thu, 20 Aug 2020 00:14:02 +0000
Received: by mail-pj1-x1043.google.com with SMTP id mw10so191819pjb.2
 for <linux-mediatek@lists.infradead.org>; Wed, 19 Aug 2020 17:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fSEYrX5ACCj62ngKp36MmVum7AWiPuR/R+X34o+7xuE=;
 b=GZgsINVjA/iPVwpqT/wdawM2LvRnSYS0j70GlPgoxgV9M4sanwWBFOsmDMGbuAVIRa
 fInE81nFqMhoKq8aeK2wXF23ckv+8mvNAsIAMNsaEXyznMXVLd+MFeyWTryUYHfbHhoL
 kS9sYMtCAKiqoxBbxYxGEpzZdonBKqbwUdIwbuasbQS/1Reg518ZvopiGNEAOnVxezPZ
 0fc1L1znuoVPGemAh7QXesW7icu7VBfCaj9yWLu28K5Ix0mIvzQPh6O3AT9pCabC9Qlt
 bd32bNMb1gX+jDIWkWEa7SXABnbuMe2PsEgAvpvtqbTRKy6kOBIF4TCyzYtrGbZrqAki
 rq8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fSEYrX5ACCj62ngKp36MmVum7AWiPuR/R+X34o+7xuE=;
 b=n93cGvCPs2F9msYsmRGaByBKbeon6+2Qh7gYbdhPoA8rz3E2eeXBnuZa/Baq0+egc3
 tw6gWNetUcGfb6bSuEhIuVJuMzLC6vDHmQBtNAScCE59jsUmcL4JMY8iDSI4mc6Cjj0u
 6VKr9rxt3eSYukPSJviHHz3O7j/HhlOOCQQfOoLwLBa/d8jnAXS7K8N25/yqPiw1NQUv
 bD95meenpZG0wmbDszLzMl32IQ0hFG0dcYGfPMGbzxzsKvNUngyt5ACTrUKQRjkX+DNk
 h1njy111WPunsIZCDBfxMJ9XM553AZBTwrvdbikvBnb2Xm7Dt4CU6WoX43eNgHd3lxeN
 aDZQ==
X-Gm-Message-State: AOAM530fsmXnRrDMOQ72VgzBYVjD9OXF/INPFlRumx4sdAAE1GrTlHQz
 78nN1ha1lrIZ+fHjP/PryvY0AYdgZgXeN83aUOO+6A==
X-Google-Smtp-Source: ABdhPJzl6F5E2iWMKn+8J0GL89vR8SvenD67R1x0TWLjRLW3Uw/3w3cewKL6RgzutABpZ4MtNfBH5ztYpmF9l9LEG8A=
X-Received: by 2002:a17:90a:a10c:: with SMTP id
 s12mr340778pjp.32.1597882439098; 
 Wed, 19 Aug 2020 17:13:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200730205112.2099429-1-ndesaulniers@google.com>
 <20200730205112.2099429-3-ndesaulniers@google.com>
 <CAN=-Rxty=Ux5rj-VQSZH-ryj1RiNJvy7mRE7uyx_YAndGtcq7Q@mail.gmail.com>
 <CAKwvOdkNLK2cRfY+DA0u3KuY5PuEss5Qox6X3zzpL053pARfrA@mail.gmail.com>
In-Reply-To: <CAKwvOdkNLK2cRfY+DA0u3KuY5PuEss5Qox6X3zzpL053pARfrA@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 19 Aug 2020 17:13:47 -0700
Message-ID: <CAKwvOdnDyUw7TZ-ZsWQ=d7ZNPM_ziFnimmbYoVAexWmg2DL36A@mail.gmail.com>
Subject: Re: [PATCH 2/4] ARM: backtrace-clang: add fixup for lr dereference
To: Nathan Huckleberry <nhuck15@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200819_201401_719048_A5CC0C97 
X-CRM114-Status: GOOD (  16.33  )
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
Cc: Chunyan Zhang <zhang.lyra@gmail.com>, Dmitry Safonov <0x7f454c46@gmail.com>,
 Russell King <linux@armlinux.org.uk>, "# 3.4.x" <stable@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Nathan Huckleberry <nhuck@google.com>,
 Lvqiang Huang <lvqiang.huang@unisoc.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Aug 10, 2020 at 3:33 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Thu, Aug 6, 2020 at 3:39 PM Nathan Huckleberry <nhuck15@gmail.com> wrote:
> >
> > Mostly looks good to me. Just a minor nit.
> >
> > On Thu, Jul 30, 2020 at 3:51 PM Nick Desaulniers
> > <ndesaulniers@google.com> wrote:
> > > +/*
> > > + * Accessing the address pointed to by the link register triggered an
> > > + * exception, don't try to unwind through it.
> > > + */
> > > +bad_lr:                mov     sv_fp, #0
> >
> > It might be nice to emit a warning here since we'll
> > only hit this case if something fishy is going on
> > with the saved lr.
>
> Yeah, something fishy is going on if that ever happens.  Let me create
> a V2 with an additional print.

FWIW, I ran into another bug on -next when trying to update this.

Report:
https://lore.kernel.org/lkml/20200811204729.1116341-1-ndesaulniers@google.com/
Fix:
https://lore.kernel.org/lkml/20200814212525.6118-1-john.ogness@linutronix.de/T/#t

Then I got bogged down in planning for plumbers and other fires. I
hope to revisit the series after plumbers.
-- 
Thanks,
~Nick Desaulniers

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
